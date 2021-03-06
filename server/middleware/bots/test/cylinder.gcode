; G-Code generated by Simplify3D(R) Version 3.0.2
; Feb 14, 2016 at 11:11:02 PM
; Settings Summary
;   processName,Process1
;   applyToModels,cylinder
;   profileName,Printrbot Simple Metal (modified)
;   profileVersion,2015-05-01 08:00:00
;   baseProfile,
;   printMaterial,PLA
;   printQuality,Medium
;   printExtruders,
;   extruderName,Primary Extruder
;   extruderToolheadNumber,0
;   extruderDiameter,0.4
;   extruderAutoWidth,0
;   extruderWidth,0.4
;   extrusionMultiplier,1
;   extruderUseRetract,1
;   extruderRetractionDistance,1
;   extruderExtraRestartDistance,0
;   extruderRetractionZLift,0
;   extruderRetractionSpeed,1800
;   extruderUseCoasting,0
;   extruderCoastingDistance,0.2
;   extruderUseWipe,0
;   extruderWipeDistance,5
;   primaryExtruder,0
;   layerHeight,0.2
;   topSolidLayers,0
;   bottomSolidLayers,0
;   perimeterOutlines,1
;   printPerimetersInsideOut,1
;   startPointOption,2
;   startPointOriginX,0
;   startPointOriginY,0
;   startPointOriginZ,300
;   sequentialIslands,0
;   spiralVaseMode,0
;   firstLayerHeightPercentage,90
;   firstLayerWidthPercentage,100
;   firstLayerUnderspeed,0.5
;   useRaft,0
;   raftExtruder,0
;   raftLayers,3
;   raftOffset,3
;   raftSeparationDistance,0.14
;   raftInfill,85
;   disableRaftBaseLayers,0
;   useSkirt,0
;   skirtExtruder,0
;   skirtLayers,1
;   skirtOutlines,2
;   skirtOffset,4
;   usePrimePillar,0
;   primePillarExtruder,999
;   primePillarWidth,12
;   primePillarLocation,7
;   primePillarSpeedMultiplier,1
;   useOozeShield,0
;   oozeShieldExtruder,999
;   oozeShieldOffset,2
;   oozeShieldOutlines,1
;   oozeShieldSidewallShape,1
;   oozeShieldSidewallAngle,30
;   oozeShieldSpeedMultiplier,1
;   infillExtruder,0
;   internalInfillPattern,Rectilinear
;   externalInfillPattern,Rectilinear
;   infillPercentage,0
;   outlineOverlapPercentage,15
;   infillExtrusionWidthPercentage,100
;   minInfillLength,5
;   infillLayerInterval,1
;   infillAngles,45,-45
;   overlapInfillAngles,0
;   generateSupport,0
;   supportExtruder,0
;   supportInfillPercentage,30
;   supportExtraInflation,0
;   denseSupportLayers,0
;   denseSupportInfillPercentage,70
;   supportLayerInterval,1
;   supportHorizontalPartOffset,0.3
;   supportUpperSeparationLayers,1
;   supportLowerSeparationLayers,1
;   supportType,0
;   supportGridSpacing,4
;   maxOverhangAngle,45
;   supportAngles,0
;   temperatureName
;   temperatureNumber
;   temperatureSetpointCount
;   temperatureSetpointLayers
;   temperatureSetpointTemperatures
;   temperatureStabilizeAtStartup
;   temperatureHeatedBed
;   temperatureRelayBetweenLayers
;   temperatureRelayBetweenLoops
;   fanLayers,1,2
;   fanSpeeds,0,100
;   blipFanToFullPower,1
;   adjustSpeedForCooling,1
;   minSpeedLayerTime,15
;   minCoolingSpeedSlowdown,20
;   increaseFanForCooling,0
;   minFanLayerTime,45
;   maxCoolingFanSpeed,100
;   increaseFanForBridging,0
;   bridgingFanSpeed,100
;   use5D,1
;   relativeEdistances,0
;   allowEaxisZeroing,1
;   independentExtruderAxes,0
;   includeM10123,0
;   stickySupport,1
;   applyToolheadOffsets,0
;   gcodeXoffset,0
;   gcodeYoffset,0
;   gcodeZoffset,0
;   overrideMachineDefinition,1
;   machineTypeOverride,0
;   strokeXoverride,150
;   strokeYoverride,150
;   strokeZoverride,150
;   originOffsetXoverride,0
;   originOffsetYoverride,0
;   originOffsetZoverride,0
;   homeXdirOverride,-1
;   homeYdirOverride,-1
;   homeZdirOverride,-1
;   flipXoverride,1
;   flipYoverride,-1
;   flipZoverride,1
;   toolheadOffsets,0,0|0,0|0,0|0,0|0,0|0,0
;   overrideFirmwareConfiguration,1
;   firmwareTypeOverride,RepRap (Marlin/Repetier/Sprinter)
;   GPXconfigOverride,r2
;   baudRateOverride,250000
;   overridePrinterModels,1
;   printerModelsOverride
;   startingGcode,G28 X0 Y0 ; home X and Y axes, G29 ; probe Z
;   layerChangeGcode,
;   retractionGcode,
;   toolChangeGcode,
;   endingGcode,M104 S0 T0 ; turn off extruder,M140 S0 T1 ; turn off bed,G28 X0 ; home X axis,M84 ; disable motors
;   createX3G,0
;   celebration,0
;   celebrationSong,Random Song
;   createMB5G,0
;   postProcessing,
;   defaultSpeed,3000
;   outlineUnderspeed,0.5
;   solidInfillUnderspeed,0.8
;   supportUnderspeed,0.8
;   rapidXYspeed,3600
;   rapidZspeed,1000
;   minBridgingArea,50
;   bridgingExtraInflation,0
;   bridgingExtrusionMultiplier,1
;   bridgingSpeedMultiplier,1
;   filamentDiameter,1.75
;   filamentPricePerKg,46
;   filamentDensity,1.25
;   useMinPrintHeight,0
;   minPrintHeight,0
;   useMaxPrintHeight,0
;   maxPrintHeight,0
;   useDiaphragm,0
;   diaphragmLayerInterval,20
;   robustSlicing,1
;   mergeAllIntoSolid,0
;   onlyRetractWhenCrossingOutline,1
;   retractBetweenLayers,1
;   useRetractionMinTravel,0
;   retractionMinTravel,3
;   retractWhileWiping,0
;   onlyWipeOutlines,1
;   avoidCrossingOutline,0
;   maxMovementDetourFactor,3
;   toolChangeRetractionDistance,12
;   toolChangeExtraRestartDistance,-0.5
;   toolChangeRetractionSpeed,600
;   allowThinWallGapFill,1
;   thinWallAllowedOverlapPercentage,10
;   horizontalSizeCompensation,0
G90
M82
M106 S0
G28 X0 Y0 Z0; home X Y and Z axes
G29 ; probe Z
G92 E0
G1 E-1.0000 F1800
G1 Z0.180 F1000
; layer 1, Z = 0.18
T0
; tool H0.200 W0.400
; outer perimeter
G1 X60.910 Y61.089 F3600
G1 E0.0000 F540
G92 E0
G1 X61.721 Y60.314 E0.0373 F2000
G1 X62.572 Y59.587 E0.0745
G1 X63.464 Y58.908 E0.1118
G1 X64.077 Y58.486 E0.1366
G1 X65.029 Y57.894 E0.1739
G1 X65.679 Y57.531 E0.1986
G1 X66.683 Y57.031 E0.2359
G1 X67.365 Y56.731 E0.2607
G1 X68.410 Y56.329 E0.2979
G1 X69.476 Y55.986 E0.3352
G1 X70.559 Y55.704 E0.3724
G1 X71.658 Y55.484 E0.4097
G1 X72.394 Y55.372 E0.4344
G1 X73.510 Y55.256 E0.4717
G1 X74.253 Y55.214 E0.4965
G1 X75.373 Y55.204 E0.5338
G1 X76.492 Y55.256 E0.5710
G1 X77.233 Y55.326 E0.5958
G1 X78.344 Y55.484 E0.6331
G1 X79.076 Y55.624 E0.6579
G1 X79.802 Y55.791 E0.6827
G1 X80.881 Y56.094 E0.7199
G1 X81.941 Y56.457 E0.7572
G1 X82.634 Y56.731 E0.7820
G1 X83.655 Y57.192 E0.8192
G1 X84.648 Y57.709 E0.8565
G1 X85.610 Y58.283 E0.8937
G1 X86.231 Y58.693 E0.9185
G1 X87.136 Y59.356 E0.9558
G1 X87.716 Y59.823 E0.9806
G1 X88.554 Y60.566 E1.0178
G1 X89.348 Y61.356 E1.0551
G1 X89.851 Y61.905 E1.0798
G1 X90.568 Y62.766 E1.1171
G1 X91.235 Y63.665 E1.1543
G1 X91.850 Y64.602 E1.1916
G1 X92.229 Y65.243 E1.2164
G1 X92.754 Y66.234 E1.2537
G1 X93.071 Y66.907 E1.2784
G1 X93.500 Y67.943 E1.3157
G1 X93.752 Y68.644 E1.3405
G1 X94.082 Y69.715 E1.3778
G1 X94.350 Y70.803 E1.4150
G1 X94.494 Y71.533 E1.4398
G1 X94.659 Y72.642 E1.4771
G1 X94.734 Y73.384 E1.5019
G1 X94.781 Y74.128 E1.5267
G1 X94.798 Y75.248 E1.5639
G1 X94.753 Y76.367 E1.6012
G1 X94.644 Y77.481 E1.6384
G1 X94.472 Y78.588 E1.6757
G1 X94.323 Y79.318 E1.7004
G1 X94.048 Y80.405 E1.7377
G1 X93.831 Y81.118 E1.7625
G1 X93.587 Y81.823 E1.7873
G1 X93.171 Y82.864 E1.8246
G1 X92.863 Y83.541 E1.8494
G1 X92.351 Y84.538 E1.8867
G1 X91.784 Y85.504 E1.9239
G1 X91.376 Y86.129 E1.9487
G1 X90.946 Y86.737 E1.9735
G1 X90.257 Y87.620 E2.0108
G1 X89.519 Y88.463 E2.0480
G1 X88.734 Y89.262 E2.0853
G1 X87.906 Y90.016 E2.1225
G1 X87.332 Y90.491 E2.1473
G1 X86.435 Y91.164 E2.1846
G1 X85.819 Y91.583 E2.2094
G1 X84.864 Y92.168 E2.2466
G1 X83.878 Y92.698 E2.2839
G1 X82.863 Y93.172 E2.3211
G1 X82.173 Y93.455 E2.3459
G1 X81.473 Y93.712 E2.3707
G1 X80.404 Y94.048 E2.4080
G1 X79.684 Y94.238 E2.4328
G1 X78.588 Y94.472 E2.4700
G1 X77.481 Y94.644 E2.5073
G1 X76.740 Y94.723 E2.5321
G1 X75.622 Y94.790 E2.5693
G1 X74.502 Y94.794 E2.6066
G1 X73.384 Y94.734 E2.6438
G1 X72.642 Y94.659 E2.6686
G1 X71.903 Y94.556 E2.6934
G1 X70.801 Y94.350 E2.7307
G1 X70.077 Y94.178 E2.7555
G1 X69.000 Y93.869 E2.7927
G1 X67.942 Y93.499 E2.8300
G1 X67.252 Y93.221 E2.8548
G1 X66.233 Y92.753 E2.8921
G1 X65.571 Y92.411 E2.9168
G1 X64.601 Y91.849 E2.9541
G1 X63.975 Y91.446 E2.9789
G1 X63.061 Y90.796 E3.0162
G1 X62.476 Y90.336 E3.0410
G1 X61.628 Y89.602 E3.0783
G1 X61.088 Y89.089 E3.1030
G1 X60.314 Y88.280 E3.1403
G1 X59.587 Y87.429 E3.1775
G1 X58.908 Y86.537 E3.2148
G1 X58.486 Y85.924 E3.2395
G1 X57.895 Y84.972 E3.2768
G1 X57.358 Y83.989 E3.3141
G1 X57.032 Y83.319 E3.3388
G1 X56.590 Y82.289 E3.3761
G1 X56.329 Y81.591 E3.4009
G1 X55.986 Y80.525 E3.4382
G1 X55.705 Y79.441 E3.4754
G1 X55.484 Y78.343 E3.5127
G1 X55.372 Y77.606 E3.5374
G1 X55.256 Y76.491 E3.5747
G1 X55.214 Y75.748 E3.5995
G1 X55.204 Y74.627 E3.6367
G1 X55.256 Y73.508 E3.6740
G1 X55.326 Y72.767 E3.6988
G1 X55.484 Y71.657 E3.7361
G1 X55.624 Y70.924 E3.7609
G1 X55.791 Y70.198 E3.7857
G1 X56.094 Y69.119 E3.8229
G1 X56.457 Y68.059 E3.8602
G1 X56.730 Y67.367 E3.8849
G1 X57.192 Y66.345 E3.9223
G1 X57.531 Y65.679 E3.9471
G1 X57.588 Y65.573 E3.9511
G1 X58.151 Y64.601 E3.9884
G1 X58.553 Y63.975 E4.0132
G1 X59.204 Y63.062 E4.0505
G1 X59.664 Y62.476 E4.0753
G1 X60.397 Y61.628 E4.1126
G1 X60.910 Y61.089 E4.1373
G92 E0
G1 E-1.0000 F1800
; layer 2, Z = 0.38
