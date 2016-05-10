const router = require(`koa-router`)();
const Promise = require(`bluebird`);
const StateMachine = Promise.promisifyAll(require(`javascript-state-machine`));

const request = require(`request-promise`);
const ip = require(`ip`);

const conductorRoutes = require(`./routes`);
const Bot = require(`../bots/bot`);

/**
 * This is a Conductor class representing a system for managing multiple pieces of hardware
 *
 * The Conductor's state machine abstracts any job states (i.e. pause/resume/cancel)
 * to be handled by the Job API. In other words, in order to pause/resume/cancel the Conductor,
 * you must send that command to the job. This will pass down events accordingly to the Conductor
 *
 */
class Conductor {
  /**
   * A Conductor server class
   * @param {Object} app - The parent Koa app.
   * @param {string} routeEndpoint - The relative endpoint.
   */
  constructor(app, routeEndpoint) {
    app.context.conductor = this; // External app reference variable

    this.app = app;
    this.logger = app.context.logger;
    this.routeEndpoint = routeEndpoint;
    this.router = router;

    this.players = {};

    // File reading assets
    this.currentJob = undefined;

    this.fsm = StateMachine.create({
      initial: 'ready',
      error: (one, two) => {
        const errorMessage = `Invalid Conductor state change action "${one}". State at "${two}".`;
        this.logger.error(errorMessage);
        throw errorMessage;
      },
      events: [
        /* eslint-disable no-multi-spaces */
        { name: 'connect',             from: 'ready',            to: 'connecting'       },
        { name: 'connectFail',         from: 'connecting',       to: 'ready'            },
        { name: 'connectDone',         from: 'connecting',       to: 'connected'        },
        { name: 'start',               from: 'connected',        to: 'startingJob'      },
        { name: 'startFail',           from: 'startingJob',      to: 'connected'        },
        { name: 'startDone',           from: 'startingJob',      to: 'processingJob'    },
        { name: 'stop',                from: 'processingJob',    to: 'stopping'         },
        { name: 'stopDone',            from: 'stopping',         to: 'connected'        },
        { name: 'stopFail',            from: 'stopping',         to: 'connected'        },
        { name: 'jobToScript',         from: 'processingJob',    to: 'processingScript' },
        { name: 'jobScriptFail',       from: 'processingScript', to: 'processingJob'    },
        { name: 'jobScriptDone',       from: 'processingScript', to: 'processingJob'    },
        { name: 'connectedToScript',   from: 'connected',        to: 'processingScript' },
        { name: 'connectedScriptFail', from: 'processingScript', to: 'connected'        },
        { name: 'connectedScriptDone', from: 'processingScript', to: 'connected'        },
        { name: 'disconnect',          from: 'connected',        to: 'disconnecting'    },
        { name: 'disconnectFail',      from: 'disconnecting',    to: 'connected'        },
        { name: 'disconnectDone',      from: 'disconnecting',    to: 'ready'            },
        { name: 'unplug',              from: '*',                to: 'unavailable'      },
        /* eslint-enable no-multi-spaces */
      ],
      callbacks: {
        onenterstate: (event, from, to) => {
          this.app.io.emit(`stateChange`, to);
          this.logger.info(`Conductor event ${event}: Transitioning from ${from} to ${to}.`);
        },
      },
    });
  }

  /**
   * initialize the jobs endpoint
   */
  async initialize() {
    try {
      await this.setupRouter();
      await this.setupConductorArms();
      this.logger.info(`Conductor instance initialized`);
    } catch (ex) {
      this.logger.error(`Conductor initialization error`, ex);
    }
  }

  /*
   * get a json friendly description of the Conductor
   */
  getConductor() {
    return {
      state: this.fsm.current,
    };
  }

  /*
   * This is the logic for parsing any commands sent to the Conductor API
   * In all cases, the API does not wait for the command to be completed before
   * returning a reply to the requestor, instead the conductor enters the appropriate
   * transitional state, followed by either "done" or "fail" events and
   * corresponding state transitions
   */
  async processCommand(command) {
    switch (command) {
      // Connect each bot
      case `connect`:
        this.connect();
        return this.getConductor();

      // Disconnect each bot via it's queue's executor
      case `disconnect`:
        this.disconnect();
        return this.getConductor();

      // Throw out any bogus command requests
      default:
        const errorMessage = `Command "${command}" is not supported.`;
        throw errorMessage;
    }
  }

  // In order to start processing a job, the job's file is opened and then
  // processed one line at a time
  async startJob(job) {
    const self = this;

    self.currentJob = job;
    await self.fsm.start();
    const filesApp = self.app.context.files;
    const theFile = filesApp.getFile(job.fileUuid);
    const filePath = filesApp.getFilePath(theFile);
    
    // read the json metajob .... etc...
    await self.fsm.startDone();
  }

  async pauseJob() {
    if (this.fsm.current !== `connected`) { // TODO revisit this logic....
      try {
        await this.fsm.stop();
        // do the pause stuff here
        await this.fsm.stopDone();
      } catch (ex) {
        const errorMessage = `Conductor pause error ${ex}`;
        this.logger.error(errorMessage);
        await this.fsm.stopFail();
      }
    }
  }

  async resumeJob() {
    if (this.fsm.current !== `processingJob`) {
      await this.fsm.start();
      // do the resume stuff here
      await this.fsm.startDone();
    }
  }

  async stopJob() {
    if (this.fsm.current !== `connected`) {
      await this.fsm.stop();
      // do the stop stuff here
      await this.fsm.stopDone();
    }
  }


  /**
   * Set up the conductor's instance's router
   */
  async setupRouter() {
    try {
      // Populate this.router with all routes
      // Then register all routes with the app
      await conductorRoutes(this);

      // Register all router routes with the app
      this.app.use(this.router.routes()).use(this.router.allowedMethods());
      this.logger.info(`Conductor router setup complete`);
    } catch (ex) {
      this.logger.error(`Conductor router setup error`, ex);
    }
  }

  async connect() {
    this.fsm.connect();
    this.connectAllPlayers();
  }

  async disconnect() {
    try {
      this.fsm.disconnect();
      // Do disconnect stuff here...
      this.fsm.disconnectDone();
    } catch (ex) {
      this.fsm.disconnectFail();
    }
  }

  async connectAllPlayers() {
    // Check if the players are all connected
    // If they are not, command them to connect
    // Keep checking on them until they are all connected
    const scanInterval = setInterval(async () => {
      let connected = true;
      // connect all local players
      for (const player in this.players) {
        if (this.players.hasOwnProperty(player)) {
          const uri = this.players[player].settings.port;
          const requestParams = {
            method: `GET`,
            uri,
            json: true,
          };
          let res;
          try {
            res = await request(requestParams);
          } catch (ex) {
            res = false;
          }
          if (res.data && res.data.state && res.data.state === `connected`) {
            // this bot is connected
          } else {
            if (res.data && res.data.state && res.data.state === `ready`) {
              const connectParams = {
                method: `POST`,
                uri,
                body: {
                  command: `connect`,
                },
                json: true,
              };
              request(connectParams);
            }
            connected = false;
          }
        }
      }
      if (connected) {
        clearInterval(scanInterval);
        await this.fsm.connectDone();
      }
    }, 1000);
  }

  // If the database doesn't yet have printers for the endpoints, create them
  async setupConductorArms() {
    // Sweet through every player
    for (const player of this.app.context.config.conductor.players) {
      // Check if a bot exists with that end point
      let endpoint;
      switch (this.app.context.config.conductor.comType) {
        case 'http':
          endpoint = `http://escher2${player}.local:9000/v1/bots/usb`;
          break;
        default:
          endpoint = `http://escher2${player}.local`;
      }
      const bots = this.app.context.bots.getBots();
      let uniqueEndpoint = true;
      for (const bot in bots) {
        if (bots.hasOwnProperty(bot)) {
          if (bots[bot].settings.port === endpoint) {
            this.players[player] = bots[bot];
            uniqueEndpoint = false;
            break;
          }
        }
      }

      // If a bot doesn't exist yet with that endpoint, create it
      if (uniqueEndpoint) {
        const botSettings = this.app.context.bots.createBot({
          connectionType: this.app.context.config.conductor.comType,
          port: endpoint,
        });
        const dbBot = await this.app.context.bots.Bot.create(botSettings);
        const botKey = dbBot.dataValues.id;
        this.app.context.bots.bots[botKey] = await new Bot(this.app, botSettings);
        this.players[player] = bots[botKey];
      }
    }
  }
}

module.exports = Conductor;
