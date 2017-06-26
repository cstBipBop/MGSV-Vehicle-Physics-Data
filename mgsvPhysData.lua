local this={}

local math=math

--[[function this.trannyGearRatio(distance, tireCircum, trannyGearRatio, differentialGearRatio, engineSpeed, vehicleSpeed)
	local n=tireCircum/(trannyGearRatio * differentialGearRatio)
	print(n)
end

this.trannyGearRatio(0, 620, )]]

this.unit={
	float=			{min=-3.4e38,				max=3.4e38,						significantDigits=7},
	double=			{min=-1.7e308,				max=1.7e308,					significantDigits=15},

	int8=			{min=-128, 					max=127},
	int16=			{min=-32768, 				max=32767},
	int32=			{min=-2147483648, 			max=2147483647},
	int64=			{min=-9223372036854775808,	max=9223372036854775807},

	uint8=			{min=0,						max=255},
	uint16=			{min=0,						max=65535},
	uint32=			{min=0,						max=4294967295},
	uint64=			{min=0,						max=18446744073709551615}
}

--[[
		fox2={
			tppVehicle2BodyData={
				name='', -- string
				typeIndex=, -- uint8; VehicleTypeIndex
				proxyTypeIndex=, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=, -- uint8
				partsFile='', -- filePtr
				bodyInstanceCount=, -- uint8
				fovaFiles= -- filePtr
			}
		},
]]

this.vehicleDefaultData={
	e_lv={ -- russian jeep
		fox2={
			tppVehicle2BodyData={
				name='veh_bd_east_lv|veh_bd_east_lv', -- string
				typeIndex=2, -- uint8; VehicleTypeIndex
				proxyTypeIndex=2, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=1, -- uint8
				partsFile='/Assets/tpp/parts/mecha/slv/slv0_main0_def.parts', -- filePtr
				bodyInstanceCount=1, -- uint8
				fovaFiles=nil -- filePtr
			}
		},

		sound={
			vehicleSoundPackage='/Assets/tpp/sound/package/vehicle_slv_media.sdf'
		},

		parts={
			body={
				foxModel='/Assets/tpp/mecha/slv/Scenes/slv0_main0_def.fmdl',
				foxConnectionPoint='/Assets/tpp/mecha/slv/Scenes/slv0_main0_def.fcnp',
				rigFile=nil,
				helpBoneFile=nil,
				lipAdjustFile=nil,
				facialSettingFile=nil,
				geometrySkeleton='/Assets/tpp/mecha/slv/Scenes/slv0_main0_def.gskl',
				physicsFile='/Assets/tpp/parts/mecha/slv/slv.ph',
				vehicleFile='/Assets/tpp/parts/mecha/slv/slv.veh',
				physicsSoundFile='/Assets/tpp/parts/mecha/slv/slv.phsd',
				targetFile='/Assets/tpp/parts/mecha/slv/slv_defense_target.tgt',

				-- EffectDescription; effectFileFromFilePtr; FilePtr
				vfx_TailLamp='fx_tpp_lgttil00_s0FG',
				vfx_ExhaustSmoke='fx_tpp_mchextsmk02_s0MG',
				vfx_LightProbe='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbslv00_s5MD.vfx',
				vfx_LightProbeInner=nil,
				vfx_DamageSmoke='fx_tpp_smkmchbrk01_m1LG',
				vfx_BrokenSmoke='fx_tpp_smkmchbrk02_m2LG',
				vfx_PreExplosion=nil,
				vfx_MuzzleFlash=nil,
				vfx_VehicleSandstorm='fx_tpp_mchsndstm01_s2LG',
				vfx_HeadlightLeft='fx_tpp_lgthedamb01_m1MG',
				vfx_HeadlightRight='fx_tpp_lgthedamb01_m1MG',
				vfx_BrokenHeadlightLeft='fx_tpp_brklgtgnt01_s1LG',
				vfx_BrokenHeadlightRight='fx_tpp_brklgtgnt01_s1LG',
				vfx_SparkActive='/Assets/tpp/effect/vfx_data/weapon/fx_tpp_wepltb04_s0.vfx',
				vfx_SplashDoorLeft=nil,
				vfx_SplashDoorRootLeft=nil,
				vfx_SplashDoorRight=nil,
				vfx_SplashDoorRightRoot=nil,

				LOD_farPixelSize=50,
				LOD_closePixelSize=400,
				LOD_polygonSize=-1,
				renderRejectionLevel=8,
				farShadowRejectionLevel=2
			},

			glass={
				front={
					connectionPointName=nil,
					foxModel='/Assets/tpp/mecha/slv/Scenes/slv0_glas0_def.fmdl',

					vfx_BrokenGlass=nil,
					effectConnect=nil,
					changeEffectConnectSetting=nil,
					visibleModelWithEffect=nil,
					createStartEffect=nil,
					effectRandomSeed=nil, -- uint32
					effectKind=nil, -- int32 

					geom_WindowGlass='/Assets/tpp/mecha/slv/Scenes/slv0_geom0_def.gskl',

					LOD_farPixelSize=-1,
					LOD_closePixelSize=-1,
					LOD_polygonSize=-1,
					renderRejectionLevel=8,
					farShadowRejectionLevel=2
				}
			}
		},

		engine={ -- 8 gears
			torqueDistributions=nil, -- axles; float

			gearRatios=nil, -- float

			cumulativeRPM={ -- specPointAngularVelocity
				0,
				1e3,
				2e3,
				3e3,
				4e3,
				5e3,
				6e3,
				12e3
			},
			torque={ -- specPointTorque
				190,
				208,
				230,
				250,
				260,
				220,
				160,
				20
			},
			brakeTorque={ -- specPointBreakTorque
				12.5,
				22.5,
				37.5,
				42.5,
				62.5,
				75,
				100,
				50
			}
		},

		chassis={
			front={ -- axle 0
				maxBrakeTorque=15e3,
				differential=true,
				wheels={
					radius=0.34,
					suspensionLength=0.324, -- front axle has longer suspension
					maxSuspensionForce=1.8,
					dampDecompressionFactor=0.02,
					dampCompressionFactor=0.003,
					friction=0.94, -- front axle wheels have lower friction
					restitution=0.1,
					inertia=1
				},
			},
			back={ -- axle 1
				maxBrakeTorque=15e3,
				differential=true,
				wheels={
					radius=0.34,
					suspensionLength=0.296,
					maxSuspensionForce=1.8,
					dampDecompressionFactor=0.02,
					dampCompressionFactor=0.003,
					friction=1.34,
					restitution=0.1,
					inertia=1
				},
			},
		},

		body={
			mass=1e3,
			friction=1,
			restitution=0.001,
			linearVelocityDamp=0.0001,
			linearVelocityMax=100,
			angularVelocityDamp=0.0002,
			angularVelocityMax=90,
			permittedDepth=0.01,
			sleepEnable=true,
			sleepLinearVelocityTh=0.1,
			sleepAngularVelocityTh=30,
			collisionGroup=0, -- uint16
			collisionType=0, -- uint16
			collisionId=93, -- uint32
			centerOfMassOffset={x=0, y=-0.48, z=0.5, w=0}, -- vector3
			motionType=2, -- int32
			material=nil, -- string
			noGravity=false
		}
	},

	w_lv={ -- american jeep
		fox2={
			tppVehicle2BodyData={
				name='veh_bd_west_lv|veh_bd_west_lv', -- string
				typeIndex=1, -- uint8; VehicleTypeIndex
				proxyTypeIndex=1, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=1, -- uint8
				partsFile='/Assets/tpp/parts/mecha/plv/plv0_main0_def.parts', -- filePtr
				bodyInstanceCount=1, -- uint8
				fovaFiles=nil -- filePtr
			}
		},

		sound={
			vehicleSoundPackage='/Assets/tpp/sound/package/vehicle_plv_media.sdf'
		},

		parts={ -- ModelDescription; *.parts
			main={
				foxModel='/Assets/tpp/mecha/plv/Scenes/plv0_main0_def.fmdl', -- modelFile; FilePtr
				foxConnectionPoint='/Assets/tpp/mecha/plv/Scenes/plv0_main0_def.fcnp', -- connectPointFile; FilePtr
				rigFile=nil, -- gameRigFile; FilePtr
				helpBoneFile=nil, -- FilePtr
				lipAdjustFile=nil, -- lipAdjustBinaryFile; FilePtr
				facialSettingFile=nil, -- FilePtr
				geometrySkeleton='/Assets/tpp/mecha/plv/Scenes/plv0_main0_def.gskl', -- GeomSkeletonDescription; gsklFile; FilePtr
				physicsFile='/Assets/tpp/parts/mecha/plv/plv.ph', -- PhysicsDescription; physicsFile; FilePtr
				vehicleFile='/Assets/tpp/parts/mecha/plv/plv.veh', -- VehicleDescription; vehicleFile; FilePtr
				physicsSoundFile='/Assets/tpp/parts/mecha/plv/plv.phsd', -- SoundDescription; soundFile; FilePtr
				targetFile='/Assets/tpp/parts/mecha/plv/plv_defense_target.tgt', -- FoxTargetDescription; targetFile; FilePtr; /Assets/tpp/parts/mecha/smt/smt_rootdefensetarget.tgt
				
				-- EffectDescription; effectFileFromFilePtr; FilePtr
				vfx_TailLamp='fx_tpp_lgttil00_s0FG',
				vfx_ExhaustSmoke='fx_tpp_mchextsmk02_s0MG',
				vfx_LightProbe='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbplv00_s5MD.vfx',
				vfx_LightProbeInner=nil,
				vfx_DamageSmoke='fx_tpp_smkmchbrk01_m1LG',
				vfx_BrokenSmoke='fx_tpp_smkmchbrk02_m2LG',
				vfx_PreExplosion=nil,
				vfx_MuzzleFlash=nil,
				vfx_VehicleSandstorm='fx_tpp_mchsndstm01_s2LG',
				vfx_HeadlightLeft='fx_tpp_lgthedamb01_m1MG',
				vfx_HeadlightRight='fx_tpp_lgthedamb01_m1MG',
				vfx_BrakeHeadlightLeft='fx_tpp_brklgtgnt01_s1LG',
				vfx_BrakeHeadlightRight='fx_tpp_brklgtgnt01_s1LG',
				vfx_SparkActive='/Assets/tpp/effect/vfx_data/weapon/fx_tpp_wepltb04_s0.vfx',
				vfx_SplashDoorLeft=nil,
				vfx_SplashDoorRootLeft=nil,
				vfx_SplashDoorRight=nil,
				vfx_SplashDoorRightRoot=nil,

				LOD_farPixelSize=50,
				LOD_closePixelSize=400,
				LOD_polygonSize=-1,
				renderRejectionLevel=8,
				farShadowRejectionLevel=2
			},

			window={
				front={
					connectionPointName=nil,
					foxModel='/Assets/tpp/mecha/plv/Scenes/plv0_glas0_def.fmdl',

					vfx_BrokenGlass=nil,
					effectConnect=nil,
					changeEffectConnectSetting=nil,
					visibleModelWithEffect=nil,
					createStartEffect=nil,
					effectRandomSeed=nil, -- uint32
					effectKind=nil, -- int32 

					geom_WindowGlass='/Assets/tpp/mecha/plv/Scenes/plv0_geom0_def.gskl',

					LOD_farPixelSize=-1,
					LOD_closePixelSize=-1,
					LOD_polygonSize=-1,
					renderRejectionLevel=8,
					farShadowRejectionLevel=2
				}
			}
		},

		engine={ -- 8 gears
			torqueDistributions=nil, -- axles; float

			gearRatios=nil, -- float

			cumulativeRPM={ -- specPointAngularVelocity; float
				0,
				1e3,
				2e3,
				3e3,
				4e3,
				5e3,
				6e3,
				12e3
			},
			torque={ -- specPointTorque; float
				190,
				208,
				230,
				250,
				260,
				220,
				160,
				20
			},
			brakeTorque={ -- specPointBreakTorque; float
				12.5,
				22.5,
				37.5,
				42.5,
				62.5,
				75,
				100,
				50
			}
		},

		chassis={
			front={ -- axle 0
				maxBrakeTorque=15e3, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.34, -- float
					suspensionLength=0.35, -- float
					maxSuspensionForce=1.8, -- float
					dampDecompressionFactor=0.02, -- dampingFactorElong; float
					dampCompressionFactor=3e-3, -- dampingFactorCompress; float
					friction=0.94, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				},
			},
			back={ -- axle 1
				maxBrakeTorque=15e3, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.34, -- float
					suspensionLength=0.32, -- float
					maxSuspensionForce=1.8, -- float
					dampDecompressionFactor=0.02, -- dampingFactorElong; float
					dampCompressionFactor=3e-3, -- dampingFactorCompress; float
					friction=1.34, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				}
			}
		},

		body={ -- PhRigidBodyParam; *.ph
			mass=1e3, -- float
			friction=1, -- float
			restitution=1e-3, -- float
			linearVelocityDamp=1e-4, -- float
			linearVelocityMax=100, -- maxLinearVelocity; float
			angularVelocityDamp=2e-4, -- float
			angularVelocityMax=90, -- maxAngularVelocity; float
			permittedDepth=0.01, -- float
			sleepEnable=true, -- bool
			sleepLinearVelocityTh=0.1, -- float
			sleepAngularVelocityTh=30, -- float
			sleepTimeTh=0.25, -- float
			collisionGroup=0, -- uint16
			collisionType=0, -- uint16
			collisionId=93, -- uint32
			centerOfMassOffset={x=0, y=-0.48, z=0.5, w=0}, -- vector3
			motionType=2, -- int32
			material=nil, -- string
			noGravity=false -- bool
		}
	},

	e_trc={ -- russian truck
		fox2={
			tppVehicle2BodyData={
				name='veh_bd_east_trc|veh_bd_east_trc', -- string
				typeIndex=4, -- uint8; VehicleTypeIndex
				proxyTypeIndex=4, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=2, -- uint8
				partsFile='/Assets/tpp/parts/mecha/smt/smt0_main0_def.parts', -- filePtr
				bodyInstanceCount=1, -- uint8
				fovaFiles=nil -- filePtr
			}
		},

		sound={
			vehicleSoundPackage='/Assets/tpp/sound/package/vehicle_smt_media.sdf'
		},

		parts={ -- ModelDescription; *.parts
			main={
				foxModel='/Assets/tpp/mecha/smt/Scenes/smt0_main0_def.fmdl', -- modelFile; FilePtr
				foxConnectionPoint='/Assets/tpp/mecha/smt/Scenes/smt0_main0_def.fcnp', -- connectPointFile; FilePtr
				rigFile=nil, -- gameRigFile; FilePtr
				helpBoneFile=nil, -- FilePtr
				lipAdjustFile=nil, -- lipAdjustBinaryFile; FilePtr
				facialSettingFile=nil, -- FilePtr
				geometrySkeleton='/Assets/tpp/mecha/smt/Scenes/smt0_main0_def.gskl', -- GeomSkeletonDescription; gsklFile; FilePtr
				physicsFile='/Assets/tpp/parts/mecha/smt/smt.ph', -- PhysicsDescription; physicsFile; FilePtr
				vehicleFile='/Assets/tpp/parts/mecha/smt/smt.veh', -- VehicleDescription; vehicleFile; FilePtr
				physicsSoundFile='/Assets/tpp/parts/mecha/smt/smt.phsd', -- SoundDescription; soundFile; FilePtr
				targetFile='/Assets/tpp/parts/mecha/smt/smt_rootdefensetarget.tgt', -- FoxTargetDescription; targetFile; FilePtr; /Assets/tpp/parts/mecha/smt/smt_rootdefensetarget.tgt
				
				-- EffectDescription; effectFileFromFilePtr; FilePtr
				vfx_TailLamp='/Assets/tpp/effect/vfx_data/light/fx_tpp_lgttil00_s0FG.vfx',
				vfx_ExhaustSmoke='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchextsmk02_s0MG.vfx',
				vfx_LightProbe='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbsmt00_s5MD.vfx',
				vfx_LightProbeInner=nil,
				vfx_DamageSmoke='fx_tpp_smkmchbrk01_m1LG',
				vfx_BrokenSmoke='fx_tpp_smkmchbrk02_m2LG',
				vfx_PreExplosion=nil,
				vfx_MuzzleFlash=nil,
				vfx_HeadlightLeft='fx_tpp_lgthedamb01_m1MG',
				vfx_HeadlightRight='fx_tpp_lgthedamb01_m1MG',
				vfx_BrakeHeadlightLeft='fx_tpp_brklgtgnt01_s1LG',
				vfx_BrakeHeadlightRight='fx_tpp_brklgtgnt01_s1LG',
				vfx_SparkActive='/Assets/tpp/effect/vfx_data/weapon/fx_tpp_wepltb04_s0.vfx',
				vfx_SplashDoorLeft='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchrinspldor01_s1.vfx',
				vfx_SplashDoorLeftRoot='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchrinspldor02_s1.vfx',
				vfx_SplashDoorRight='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchrinspldor01_s1.vfx',
				vfx_SplashDoorRightRoot=nil,

				LOD_farPixelSize=50,
				LOD_closePixelSize=400,
				LOD_polygonSize=-1,
				renderRejectionLevel=8,
				farShadowRejectionLevel=2
			},

			window={
				front={
					connectionPointName='CNP_FRONTGLASS',
					foxModel='/Assets/tpp/mecha/smt/Scenes/smt0_glas0_def.fmdl',

					vfx_BrokenGlass='/Assets/tpp/effect/vfx_data/dust/fx_tpp_dstglscar01_s3.vfx',
					effectConnect=true,
					changeEffectConnectSetting=false,
					visibleModelWithEffect=true,
					createStartEffect=false,
					effectRandomSeed=0, -- uint32
					effectKind=0, -- int32 

					geom_WindowGlass='/Assets/tpp/mecha/smt/Scenes/smt0_glas0_def.geom',

					LOD_farPixelSize=-1,
					LOD_closePixelSize=-1,
					LOD_polygonSize=-1,
					renderRejectionLevel=8,
					farShadowRejectionLevel=2
				},
				back={
					connectionPointName='CNP_REARGLASS',
					foxModel='/Assets/tpp/mecha/smt/Scenes/smt0_glas2_def.fmdl',

					vfx_BrokenGlass='/Assets/tpp/effect/vfx_data/dust/fx_tpp_dstglscar03_s2.vfx',
					effectConnect=true,
					changeEffectConnectSetting=false,
					visibleModelWithEffect=true,
					createStartEffect=false,
					effectRandomSeed=0, -- uint32
					effectKind=0, -- int32 

					geom_WindowGlass='/Assets/tpp/mecha/smt/Scenes/smt0_glas2_def.geom',

					LOD_farPixelSize=-1,
					LOD_closePixelSize=-1,
					LOD_polygonSize=-1,
					renderRejectionLevel=8,
					farShadowRejectionLevel=2
				},
				left={
					connectionPointName='CNP_LEFTGLASS',
					foxModel='/Assets/tpp/mecha/smt/Scenes/smt0_glas1_def.fmdl',

					vfx_BrokenGlass='/Assets/tpp/effect/vfx_data/dust/fx_tpp_dstglscar02_s1.vfx',
					effectConnect=true,
					changeEffectConnectSetting=false,
					visibleModelWithEffect=true,
					createStartEffect=false,
					effectRandomSeed=0, -- uint32
					effectKind=0, -- int32 

					geom_WindowGlass='/Assets/tpp/mecha/smt/Scenes/smt0_glas1_def.geom',

					LOD_farPixelSize=-1,
					LOD_closePixelSize=-1,
					LOD_polygonSize=-1,
					renderRejectionLevel=8,
					farShadowRejectionLevel=2
				},
				right={
					connectionPointName='CNP_RIGHTGLASS',
					foxModel='/Assets/tpp/mecha/smt/Scenes/smt0_glas3_def.fmdl',

					vfx_BrokenGlass='/Assets/tpp/effect/vfx_data/dust/fx_tpp_dstglscar04_s1.vfx',
					effectConnect=true,
					changeEffectConnectSetting=false,
					visibleModelWithEffect=true,
					createStartEffect=false,
					effectRandomSeed=0, -- uint32
					effectKind=0, -- int32 

					geom_WindowGlass='/Assets/tpp/mecha/smt/Scenes/smt0_glas3_def.geom',

					LOD_farPixelSize=-1,
					LOD_closePixelSize=-1,
					LOD_polygonSize=-1,
					renderRejectionLevel=8,
					farShadowRejectionLevel=2
				}
			}
		},

		engine={ -- 8 gears
			torqueDistributions=nil, -- axles; float

			gearRatios=nil, -- float

			cumulativeRPM={ -- specPointAngularVelocity; float
				0,
				1e3,
				2e3,
				3e3,
				4e3,
				5e3,
				6e3,
				12e3
			},
			torque={ -- specPointTorque; float
				1e3,
				1280,
				1360,
				1360,
				1280,
				840,
				400,
				120
			},
			brakeTorque={ -- specPointBreakTorque; float
				300,
				540,
				900,
				1020,
				1500,
				1800,
				2400,
				1200
			}
		},

		chassis={
			front={ -- axle 0
				maxBrakeTorque=5e4, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.6, -- float
					suspensionLength=0.4, -- float
					maxSuspensionForce=2.45, -- float
					dampDecompressionFactor=0.055, -- dampingFactorElong; float
					dampCompressionFactor=0.055, -- dampingFactorCompress; float
					friction=0.94, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				},
			},
			back={ -- axle 1,2
				maxBrakeTorque=5e4, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.6, -- float
					suspensionLength=0.5, -- float
					maxSuspensionForce=2.3, -- float
					dampDecompressionFactor=0.055, -- dampingFactorElong; float
					dampCompressionFactor=0.055, -- dampingFactorCompress; float
					friction=1.34, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				},
			},
		},

		body={ -- PhRigidBodyParam; *.ph
			mass=8e3, -- float
			friction=1, -- float
			restitution=1e-3, -- float
			linearVelocityDamp=1e-4, -- float
			linearVelocityMax=100, -- maxLinearVelocity; float
			angularVelocityDamp=2e-4, -- float
			angularVelocityMax=90, -- maxAngularVelocity; float
			permittedDepth=0.01, -- float
			sleepEnable=true, -- bool
			sleepLinearVelocityTh=0.1, -- float
			sleepAngularVelocityTh=30, -- float
			sleepTimeTh=0.25, -- float
			collisionGroup=0, -- uint16
			collisionType=0, -- uint16
			collisionId=93, -- uint32
			centerOfMassOffset={x=0, y=-1, z=1.2, w=0}, -- vector3
			motionType=2, -- int32
			material=nil, -- string
			noGravity=false -- bool
		}
	},

	w_trc={ -- american truck
		fox2={
			tppVehicle2BodyData={
				name='veh_bd_west_trc|veh_bd_west_trc', -- string
				typeIndex=3, -- uint8; VehicleTypeIndex
				proxyTypeIndex=3, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=2, -- uint8
				partsFile='/Assets/tpp/parts/mecha/nmt/nmt0_main0_def.parts', -- filePtr
				bodyInstanceCount=1, -- uint8
				fovaFiles=nil -- filePtr
			}
		},

		sound={
			vehicleSoundPackage='vehicle_nmt_media.sdf'
		},

		parts={ -- ModelDescription; *.parts
			main={
				foxModel='/Assets/tpp/mecha/nmt/Scenes/nmt0_main0_def.fmdl', -- modelFile; FilePtr
				foxConnectionPoint='/Assets/tpp/mecha/nmt/Scenes/nmt0_main0_def.fcnp', -- connectPointFile; FilePtr
				rigFile=nil, -- gameRigFile; FilePtr
				helpBoneFile=nil, -- FilePtr
				lipAdjustFile=nil, -- lipAdjustBinaryFile; FilePtr
				facialSettingFile=nil, -- FilePtr
				geometrySkeleton='/Assets/tpp/mecha/nmt/Scenes/nmt0_main0_def.gskl', -- GeomSkeletonDescription; gsklFile; FilePtr
				physicsFile='/Assets/tpp/parts/mecha/nmt/nmt.ph', -- PhysicsDescription; physicsFile; FilePtr
				vehicleFile='/Assets/tpp/parts/mecha/nmt/nmt.veh', -- VehicleDescription; vehicleFile; FilePtr
				physicsSoundFile='/Assets/tpp/parts/mecha/nmt/nmt.phsd', -- SoundDescription; soundFile; FilePtr
				targetFile='/Assets/tpp/parts/mecha/nmt/nmt_rootdefensetarget.tgt', -- FoxTargetDescription; targetFile; FilePtr; /Assets/tpp/parts/mecha/smt/smt_rootdefensetarget.tgt
				
				-- EffectDescription; effectFileFromFilePtr; FilePtr
				vfx_TailLamp='fx_tpp_lgttil00_s0FG',
				vfx_ExhaustSmoke='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchextsmk02_s0MG.vfx',
				vfx_LightProbe='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbnmt00_s5MD.vfx',
				vfx_LightProbeInner=nil,
				vfx_DamageSmoke='fx_tpp_smkmchbrk01_m1LG',
				vfx_BrokenSmoke='fx_tpp_smkmchbrk02_m2LG',
				vfx_PreExplosion=nil,
				vfx_MuzzleFlash=nil,
				vfx_HeadlightLeft='fx_tpp_lgthedamb01_m1MG',
				vfx_HeadlightRight='fx_tpp_lgthedamb01_m1MG',
				vfx_BrakeHeadlightLeft='fx_tpp_brklgtgnt01_s1LG',
				vfx_BrakeHeadlightRight='fx_tpp_brklgtgnt01_s1LG',
				vfx_SparkActive='/Assets/tpp/effect/vfx_data/weapon/fx_tpp_wepltb04_s0.vfx',
				vfx_SplashDoorLeft='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchrinspldor01_s1.vfx',
				vfx_SplashDoorLeftRoot='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchrinspldor02_s1.vfx',
				vfx_SplashDoorRight='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchrinspldor01_s1.vfx',
				vfx_SplashDoorRightRoot='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchrinspldor02_s1.vfx',

				LOD_farPixelSize=50,
				LOD_closePixelSize=400,
				LOD_polygonSize=-1,
				renderRejectionLevel=8,
				farShadowRejectionLevel=2
			},

			window={
				front={
					connectionPointName='CNP_FRONTGLASS',
					foxModel='/Assets/tpp/mecha/nmt/Scenes/nmt0_glas0_def.fmdl',

					vfx_BrokenGlass='/Assets/tpp/effect/vfx_data/dust/fx_tpp_dstglscar01_s3.vfx',
					effectConnect=true,
					changeEffectConnectSetting=false,
					visibleModelWithEffect=true,
					createStartEffect=false,
					effectRandomSeed=0, -- uint32
					effectKind=0, -- int32 

					geom_WindowGlass='/Assets/tpp/mecha/nmt/Scenes/nmt0_glas0_def.geom',

					LOD_farPixelSize=-1,
					LOD_closePixelSize=-1,
					LOD_polygonSize=-1,
					renderRejectionLevel=8,
					farShadowRejectionLevel=2
				},
				back={
					connectionPointName='CNP_REARGLASS',
					foxModel='/Assets/tpp/mecha/nmt/Scenes/nmt0_glas3_def.fmdl',

					vfx_BrokenGlass='/Assets/tpp/effect/vfx_data/dust/fx_tpp_dstglscar03_s2.vfx',
					effectConnect=true,
					changeEffectConnectSetting=false,
					visibleModelWithEffect=true,
					createStartEffect=false,
					effectRandomSeed=0, -- uint32
					effectKind=0, -- int32 

					geom_WindowGlass='/Assets/tpp/mecha/nmt/Scenes/nmt0_glas3_def.geom',

					LOD_farPixelSize=-1,
					LOD_closePixelSize=-1,
					LOD_polygonSize=-1,
					renderRejectionLevel=8,
					farShadowRejectionLevel=2
				},
				left={
					connectionPointName='CNP_LEFTGLASS',
					foxModel='/Assets/tpp/mecha/nmt/Scenes/nmt0_glas1_def.fmdl',

					vfx_BrokenGlass='/Assets/tpp/effect/vfx_data/dust/fx_tpp_dstglscar02_s1.vfx',
					effectConnect=true,
					changeEffectConnectSetting=false,
					visibleModelWithEffect=true,
					createStartEffect=false,
					effectRandomSeed=0, -- uint32
					effectKind=0, -- int32 

					geom_WindowGlass='/Assets/tpp/mecha/nmt/Scenes/nmt0_glas1_def.geom',

					LOD_farPixelSize=-1,
					LOD_closePixelSize=-1,
					LOD_polygonSize=-1,
					renderRejectionLevel=8,
					farShadowRejectionLevel=2
				},
				right={
					connectionPointName='CNP_RIGHTGLASS',
					foxModel='/Assets/tpp/mecha/nmt/Scenes/nmt0_glas2_def.fmdl',

					vfx_BrokenGlass='/Assets/tpp/effect/vfx_data/dust/fx_tpp_dstglscar04_s1.vfx',
					effectConnect=true,
					changeEffectConnectSetting=false,
					visibleModelWithEffect=true,
					createStartEffect=false,
					effectRandomSeed=0, -- uint32
					effectKind=0, -- int32 

					geom_WindowGlass='/Assets/tpp/mecha/nmt/Scenes/nmt0_glas2_def.geom',

					LOD_farPixelSize=-1,
					LOD_closePixelSize=-1,
					LOD_polygonSize=-1,
					renderRejectionLevel=8,
					farShadowRejectionLevel=2
				}
			}
		},

		engine={ -- 8 gears
			torqueDistributions=nil, -- axles; float

			gearRatios=nil, -- float

			cumulativeRPM={ -- specPointAngularVelocity; float
				0,
				1e3,
				2e3,
				3e3,
				4e3,
				5e3,
				6e3,
				12e3
			},
			torque={ -- specPointTorque; float
				1e3,
				1280,
				1360,
				1360,
				1280,
				840,
				400,
				120
			},
			brakeTorque={ -- specPointBreakTorque; float
				300,
				540,
				900,
				1020,
				1500,
				1800,
				2400,
				1200
			}
		},

		chassis={
			front={ -- axle 0
				maxBrakeTorque=5e4, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.6, -- float
					suspensionLength=0.4, -- float
					maxSuspensionForce=2.45, -- float
					dampDecompressionFactor=0.055, -- dampingFactorElong; float
					dampCompressionFactor=0.055, -- dampingFactorCompress; float
					friction=0.94, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				},
			},
			back={ -- axle 1,2
				maxBrakeTorque=5e4, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.6, -- float
					suspensionLength=0.5, -- float
					maxSuspensionForce=2.3, -- float
					dampDecompressionFactor=0.055, -- dampingFactorElong; float
					dampCompressionFactor=0.06, -- dampingFactorCompress; float
					friction=1.34, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				},
			},
		},

		body={ -- PhRigidBodyParam; *.ph
			mass=6e3, -- float
			friction=1, -- float
			restitution=1e-3, -- float
			linearVelocityDamp=1e-4, -- float
			linearVelocityMax=100, -- maxLinearVelocity; float
			angularVelocityDamp=2e-4, -- float
			angularVelocityMax=90, -- maxAngularVelocity; float
			permittedDepth=0.01, -- float
			sleepEnable=true, -- bool
			sleepLinearVelocityTh=0.1, -- float
			sleepAngularVelocityTh=30, -- float
			sleepTimeTh=0.25, -- float
			collisionGroup=0, -- uint16
			collisionType=0, -- uint16
			collisionId=93, -- uint32
			centerOfMassOffset={x=0, y=-1, z=1.2, w=0}, -- vector3
			motionType=2, -- int32
			material=nil, -- string
			noGravity=false -- bool
		}
	},

	e_wav={ -- russian apc (autocannon)
		fox2={
			tppVehicle2BodyData={
				name='veh_bd_east_wav|veh_bd_east_wav', -- string
				typeIndex=6, -- uint8; VehicleTypeIndex
				proxyTypeIndex=6, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=3, -- uint8
				partsFile='/Assets/tpp/parts/mecha/sav/sav0_main0_def.parts', -- filePtr
				bodyInstanceCount=1, -- uint8
				fovaFiles=nil -- filePtr
			},

			weaponParameters={
				primary={
					attackId='ATK_Tankgun_30mmAutoCannon', -- string
					equipId=nil, -- string
					bulletId='BL_Tankgun_30mmAutoCannon', -- string
					weaponImplTypeIndex=1, -- uint8
					fireInterval=0.333333, -- float
					weaponFile=nil, -- filePtr
					ammoFile=nil, -- filePtr
					ownerCnpName=nil, -- string
					weaponBoneName=nil, -- string
					turretBoneName='SKL_001_TURRET', -- string
					barrelBoneName='SKL_002_BARREL', -- string
					minPitch=-0.20944, -- float
					maxPitch=1.745329, -- float
					rotSpeed=0.785398, -- float

					uiGraphEntry={
						name='veh_bd_east_wav|sight_vhcl_east_wav|UiGraphEntry0000', -- string
						files=nil, -- filePtr; dynamicArray
						rawFiles={ -- filePtr; dynamicArray
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_wpscope_vehicle_sav0_b.uilb',
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_vhcl_def_FPS_bs.uilb',
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_wpscope_vehicle_common.uilb'
						}
					},

					uiInstanceData={
						name='veh_bd_east_wav|sight_vhcl_east_wav|UiInstanceData0000', -- string
						createWindowParams=nil, -- filePtr; stringMap
						windowFactoryName='SightVhclSav0_bFactory' -- string
					}
				}
			},
		},

		sound={
			vehicleSoundPackage='Assets/tpp/sound/package/vehicle_sav_media.sdf'
		},

		parts={ -- ModelDescription; *.parts
			main={
				foxModel='/Assets/tpp/mecha/sav/Scenes/sav0_main0_def.fmdl', -- modelFile; FilePtr
				foxConnectionPoint='/Assets/tpp/mecha/sav/Scenes/sav0_main0_def.fcnp', -- connectPointFile; FilePtr
				rigFile=nil, -- gameRigFile; FilePtr
				helpBoneFile=nil, -- FilePtr
				lipAdjustFile=nil, -- lipAdjustBinaryFile; FilePtr
				facialSettingFile=nil, -- FilePtr
				geometrySkeleton='/Assets/tpp/mecha/sav/Scenes/sav0_main0_def.gskl', -- GeomSkeletonDescription; gsklFile; FilePtr
				physicsFile='/Assets/tpp/parts/mecha/sav/sav.ph', -- PhysicsDescription; physicsFile; FilePtr
				vehicleFile='/Assets/tpp/parts/mecha/sav/sav.veh', -- VehicleDescription; vehicleFile; FilePtr
				physicsSoundFile='/Assets/tpp/parts/mecha/sav/sav.phsd', -- SoundDescription; soundFile; FilePtr
				targetFile='/Assets/tpp/parts/mecha/sav/sav.tgt', -- FoxTargetDescription; targetFile; FilePtr; /Assets/tpp/parts/mecha/smt/smt_rootdefensetarget.tgt
				
				-- EffectDescription; effectFileFromFilePtr; FilePtr
				vfx_TailLamp='/Assets/tpp/effect/vfx_data/light/fx_tpp_lgttil00_s0FG.vfx',
				vfx_ExhaustSmoke='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchexhsmk01_s4MG.vfx',
				vfx_LightProbe='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbsav00_s5MD.vfx',
				vfx_LightProbeInner='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbsav00_s5MD.vfx',
				vfx_DamageSmoke='fx_tpp_smkmchbrk01_m1LG',
				vfx_BrokenSmoke='fx_tpp_smkmchbrk02_m2LG',
				vfx_PreExplosion='/Assets/tpp/effect/vfx_data/explosion/fx_tpp_expptl01_s3.vfx',
				vfx_MuzzleFlash='/Assets/tpp/effect/vfx_data/muzzle/fx_tpp_mzfgg01_s0FG.vfx',
				vfx_VehicleSandstorm=nil,
				vfx_HeadlightLeft='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchwavlgthed01_m2FG.vfx',
				vfx_HeadlightRight='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchwavlgthed01_m2FG.vfx',
				vfx_BrakeHeadlightLeft='fx_tpp_brklgtgnt01_s1LG',
				vfx_BrakeHeadlightRight='fx_tpp_brklgtgnt01_s1LG',
				vfx_SparkActive='/Assets/tpp/effect/vfx_data/weapon/fx_tpp_wepltb04_s0.vfx',
				vfx_SplashDoorLeft=nil,
				vfx_SplashDoorRootLeft=nil,
				vfx_SplashDoorRight=nil,
				vfx_SplashDoorRightRoot=nil,

				LOD_farPixelSize=50,
				LOD_closePixelSize=400,
				LOD_polygonSize=-1,
				renderRejectionLevel=8,
				farShadowRejectionLevel=2
			}
		},

		engine={ -- 7 gears
			torqueDistributions={ -- axles; float
				[0]=0.25,
				0.25,
				0.25,
				0.25
			},

			gearRatios=nil, -- float

			cumulativeRPM={ -- specPointAngularVelocity; float
				0,
				500,
				1e3,
				1500,
				2e3,
				3e3,
				16e3
			},
			torque={ -- specPointTorque; float
				6e3,
				6040,
				6060,
				6080,
				6060,
				3e3,
				1e3
			},
			brakeTorque={ -- specPointBreakTorque; float
				750,
				750,
				750,
				1e3,
				1e3,
				1250,
				1500
			}
		},

		chassis={
			front={ -- axle 0,1
				maxBrakeTorque=70500, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.62, -- float
					suspensionLength=0.5, -- float
					maxSuspensionForce=1.3, -- float
					dampDecompressionFactor=0.01, -- dampingFactorElong; float
					dampCompressionFactor=5e-3, -- dampingFactorCompress; float
					friction=0.94, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				},
			},
			back={ -- axle 2,3
				maxBrakeTorque=70500, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.62, -- float
					suspensionLength=0.5, -- float
					maxSuspensionForce=1.5, -- float
					dampDecompressionFactor=0.015, -- dampingFactorElong; float
					dampCompressionFactor=7e-3, -- dampingFactorCompress; float
					friction=1.17, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				},
			},
		},

		body={ -- PhRigidBodyParam; *.ph
			mass=15140, -- float
			friction=1, -- float
			restitution=1e-3, -- float
			linearVelocityDamp=1e-4, -- float
			linearVelocityMax=100, -- maxLinearVelocity; float
			angularVelocityDamp=2e-4, -- float
			angularVelocityMax=90, -- maxAngularVelocity; float
			permittedDepth=0.01, -- float
			sleepEnable=true, -- bool
			sleepLinearVelocityTh=0.1, -- float
			sleepAngularVelocityTh=30, -- float
			sleepTimeTh=0.25, -- float
			collisionGroup=0, -- uint16
			collisionType=0, -- uint16
			collisionId=93, -- uint32
			centerOfMassOffset={x=0, y=-0.575, z=0.5, w=0}, -- vector3
			motionType=2, -- int32
			material=nil, -- string
			noGravity=false -- bool
		}
	},

	w_wav_machinegun={ -- american apc (autocannon)
		fox2={
			tppVehicle2BodyData={
				name='veh_bd_west_wav|veh_bd_west_wav', -- string
				typeIndex=5, -- uint8; VehicleTypeIndex
				proxyTypeIndex=5, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=4, -- uint8
				partsFile='/Assets/tpp/parts/mecha/wav/wav0_main0_def.parts', -- filePtr
				bodyInstanceCount=1, -- uint8
				fovaFiles=nil -- filePtr
			},

			weaponParameters={
				primary={
					attackId='ATK_Tankgun_20mmAutoCannon', -- string
					equipId=nil, -- string
					bulletId='BL_Tankgun_20mmAutoCannon', -- string
					weaponImplTypeIndex=1, -- uint8
					fireInterval=0.333333, -- float
					weaponFile=nil, -- filePtr
					ammoFile=nil, -- filePtr
					ownerCnpName=nil, -- string
					weaponBoneName=nil, -- string
					turretBoneName='SKL_001_TURRET', -- string
					barrelBoneName='SKL_002_BARREL', -- string
					minPitch=-0.15708, -- float
					maxPitch=1.745329, -- float
					rotSpeed=0.785398 -- float

					uiGraphEntry={
						name='veh_at_west_wav_trt_machinegun|sight_vhcl_west_wav_machinegun|UiGraphEntry0000', -- string
						files=nil, -- filePtr; dynamicArray
						rawFiles={ -- filePtr; dynamicArray
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_wpscope_vehicle_wav0_b.uilb',
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_vhcl_def_FPS_bs.uilb',
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_wpscope_vehicle_common.uilb'
						}
					},

					uiInstanceData={
						name='veh_at_west_wav_trt_machinegun|sight_vhcl_west_wav_machinegun|UiInstanceData0000', -- string
						createWindowParams=nil, -- filePtr; stringMap
						windowFactoryName='SightVhclWav0_bFactory' -- string
					},

					attachmentData={
						name='veh_at_west_wav_trt_machinegun|veh_at_west_wav_trt_machinegun', -- string
						vehicleTypeCode=81, -- uint8
						attachmentImplTypeIndex=2, -- uint8
						attachmentFile='/Assets/tpp/parts/mecha/wav/wav0_turt1_def.parts', -- filePtr
						attachmentInstanceCount=1, -- uint8
						bodyCnpName='CNP_TURRET', -- string
						attachmentBoneName=nil -- string
					}
				}
			},
		},

		sound={
			vehicleSoundPackage='/Assets/tpp/sound/package/vehicle_wav_media.sdf'
		},

		parts={ -- ModelDescription; *.parts
			main={
				foxModel='/Assets/tpp/mecha/wav/Scenes/wav0_main0_def.fmdl', -- modelFile; FilePtr
				foxConnectionPoint='/Assets/tpp/mecha/wav/Scenes/wav0_main0_def.fcnp', -- connectPointFile; FilePtr
				rigFile=nil, -- gameRigFile; FilePtr
				helpBoneFile=nil, -- FilePtr
				lipAdjustFile=nil, -- lipAdjustBinaryFile; FilePtr
				facialSettingFile=nil, -- FilePtr
				geometrySkeleton='/Assets/tpp/mecha/wav/Scenes/wav0_main0_def.gskl', -- GeomSkeletonDescription; gsklFile; FilePtr
				physicsFile='/Assets/tpp/parts/mecha/wav/wav.ph', -- PhysicsDescription; physicsFile; FilePtr
				vehicleFile='/Assets/tpp/parts/mecha/wav/wav.veh', -- VehicleDescription; vehicleFile; FilePtr
				physicsSoundFile='/Assets/tpp/parts/mecha/wav/wav.phsd', -- SoundDescription; soundFile; FilePtr
				targetFile='/Assets/tpp/parts/mecha/wav/wav.tgt', -- FoxTargetDescription; targetFile; FilePtr; /Assets/tpp/parts/mecha/smt/smt_rootdefensetarget.tgt
				
				-- EffectDescription; effectFileFromFilePtr; FilePtr
				vfx_TailLamp='/Assets/tpp/effect/vfx_data/light/fx_tpp_lgttil00_s0FG.vfx',
				vfx_ExhaustSmoke='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchexhsmk01_s4MG.vfx',
				vfx_LightProbe='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbwav00_s5MD.vfx',
				vfx_LightProbeInner='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbwav00_s5MD.vfx',
				vfx_DamageSmoke='fx_tpp_smkmchbrk01_m1LG',
				vfx_BrokenSmoke='fx_tpp_smkmchbrk02_m2LG',
				vfx_PreExplosion='/Assets/tpp/effect/vfx_data/explosion/fx_tpp_expptl01_s3.vfx',
				vfx_MuzzleFlash='/Assets/tpp/effect/vfx_data/muzzle/fx_tpp_mzfgg01_s0FG.vfx',
				vfx_CannonMuzzleFlash='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchstrmzlbls01_s8MG.vfx',
				vfx_SubjectiveCannonMuzzleFlash='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchstrmzlbls02_s8.vfx',
				vfx_ShockWave='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchstrmzlskw01_s8.vfx',
				vfx_CannonShockWave='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchstrmzlskw02_s2.vfx',
				vfx_VehicleSandstorm='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchsndstm02_s5LG.vfx',
				vfx_HeadlightLeft='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchwavlgthed01_m2FG.vfx',
				vfx_HeadlightRight='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchwavlgthed01_m2FG.vfx',
				vfx_BrakeHeadlightLeft='fx_tpp_brklgtgnt01_s1LG',
				vfx_BrakeHeadlightRight='fx_tpp_brklgtgnt01_s1LG',
				vfx_SparkActive='/Assets/tpp/effect/vfx_data/weapon/fx_tpp_wepltb04_s0.vfx',
				vfx_SplashDoorLeft=nil,
				vfx_SplashDoorRootLeft=nil,
				vfx_SplashDoorRight=nil,
				vfx_SplashDoorRightRoot=nil,

				LOD_farPixelSize=50,
				LOD_closePixelSize=400,
				LOD_polygonSize=-1,
				renderRejectionLevel=8,
				farShadowRejectionLevel=2
			}
		},

		engine={ -- 7 gears
			torqueDistributions={ -- axles; float
				[0]=0.25,
				0.25,
				0.25,
				0.25
			},

			gearRatios=nil, -- float

			cumulativeRPM={ -- specPointAngularVelocity; float
				0,
				500,
				1e3,
				1500,
				2e3,
				3e3,
				16e3
			},
			torque={ -- specPointTorque; float
				6e3,
				6040,
				6060,
				6080,
				6060,
				3e3,
				1e3
			},
			brakeTorque={ -- specPointBreakTorque; float
				750,
				750,
				750,
				1e3,
				1e3,
				1250,
				1500
			}
		},

		chassis={
			front={ -- axle 0,1
				maxBrakeTorque=70500, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.62, -- float
					suspensionLength=0.5, -- float
					maxSuspensionForce=1.3, -- float
					dampDecompressionFactor=0.01, -- dampingFactorElong; float
					dampCompressionFactor=5e-3, -- dampingFactorCompress; float
					friction=0.94, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				},
			},
			back={ -- axle 2,3
				maxBrakeTorque=70500, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.62, -- float
					suspensionLength=0.5, -- float
					maxSuspensionForce=1.5, -- float
					dampDecompressionFactor=0.015, -- dampingFactorElong; float
					dampCompressionFactor=7e-3, -- dampingFactorCompress; float
					friction=1.17, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				},
			},
		},

		body={ -- PhRigidBodyParam; *.ph
			mass=17340, -- float
			friction=1, -- float
			restitution=1e-3, -- float
			linearVelocityDamp=1e-4, -- float
			linearVelocityMax=100, -- maxLinearVelocity; float
			angularVelocityDamp=2e-4, -- float
			angularVelocityMax=90, -- maxAngularVelocity; float
			permittedDepth=0.01, -- float
			sleepEnable=true, -- bool
			sleepLinearVelocityTh=0.1, -- float
			sleepAngularVelocityTh=30, -- float
			sleepTimeTh=0.25, -- float
			collisionGroup=0, -- uint16
			collisionType=0, -- uint16
			collisionId=93, -- uint32
			centerOfMassOffset={x=0, y=-0.85, z=0.5, w=0}, -- vector3
			motionType=2, -- int32
			material=nil, -- string
			noGravity=false -- bool
		}
	},

	e_wav_rocket={ -- russian apc (rockets)
		fox2={
			tppVehicle2BodyData={
				name='veh_bd_east_wav|veh_bd_east_wav', -- string
				typeIndex=6, -- uint8; VehicleTypeIndex
				proxyTypeIndex=6, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=3, -- uint8
				partsFile='/Assets/tpp/parts/mecha/sav/sav0_main0_def.parts', -- filePtr
				bodyInstanceCount=1, -- uint8
				fovaFiles=nil -- filePtr
			},

			weaponParameters={
				primary={
					attackId='ATK_Tankgun_30mmAutoCannon', -- string
					equipId=nil, -- string
					bulletId='BL_Tankgun_30mmAutoCannon', -- string
					weaponImplTypeIndex=1, -- uint8
					fireInterval=0.333333, -- float
					weaponFile=nil, -- filePtr
					ammoFile=nil, -- filePtr
					ownerCnpName=nil, -- string
					weaponBoneName=nil, -- string
					turretBoneName='SKL_001_TURRET', -- string
					barrelBoneName='SKL_002_BARREL', -- string
					minPitch=-0.20944, -- float
					maxPitch=1.745329, -- float
					rotSpeed=0.785398 -- float

					uiGraphEntry={
						name='veh_bd_east_wav|sight_vhcl_east_wav|UiGraphEntry0000', -- string
						files=nil, -- filePtr; dynamicArray
						rawFiles={ -- filePtr; dynamicArray
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_wpscope_vehicle_sav0_b.uilb',
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_vhcl_def_FPS_bs.uilb',
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_wpscope_vehicle_common.uilb'
						}
					},

					uiInstanceData={
						name='veh_bd_east_wav|sight_vhcl_east_wav|UiInstanceData0000', -- string
						createWindowParams=nil, -- filePtr; stringMap
						windowFactoryName='SightVhclSav0_bFactory' -- string
					}
				},

				secondary={
					attackId='ATK_Tankgun_82mmRocketPoweredProjectile', -- string
					equipId='EQP_BL_Tankgun_82mmRocketPoweredProjectile', -- string
					bulletId='BL_Tankgun_82mmRocketPoweredProjectile', -- string
					weaponImplTypeIndex=3, -- uint8
					fireInterval=15, -- float
					weaponFile=nil, -- filePtr
					ammoFile='/Assets/tpp/parts/mecha/sav/sav0_ammo0_def.parts', -- filePtr
					ownerCnpName=nil, -- string
					weaponBoneName=nil, -- string
					turretBoneName=nil, -- string
					barrelBoneName='SKL_001_FRAME', -- string
					minPitch=0, -- float
					maxPitch=1.570796, -- float
					rotSpeed=0.392699 -- float

					uiGraphEntry={
						name='veh_at_east_wav_rocket|sight_vhcl_east_wav_rocket|UiGraphEntry0000', -- string
						files=nil, -- filePtr; dynamicArray
						rawFiles={ -- filePtr; dynamicArray
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_wpscope_vehicle_sav0_wepn0.uilb',
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_vhcl_def_FPS_bs.uilb',
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_wpscope_vehicle_common.uilb'
						}
					},

					uiInstanceData={
						name='veh_at_east_wav_rocket|sight_vhcl_east_wav_rocket|UiInstanceData0000', -- string
						createWindowParams=nil, -- filePtr; stringMap
						windowFactoryName='SightVhclSav0_wepn0Factory' -- string
					},

					attachmentData={
						name='veh_at_east_wav_rocket|veh_at_east_wav_rocket', -- string
						vehicleTypeCode=97, -- uint8
						attachmentImplTypeIndex=4, -- uint8
						attachmentFile='/Assets/tpp/parts/mecha/sav/sav0_wepn0_def.parts', -- filePtr
						attachmentInstanceCount=1, -- uint8
						bodyCnpName='CNP_weapon', -- string
						attachmentBoneName=nil -- string
					}
				}
			},
		},

		sound={
			vehicleSoundPackage='/Assets/tpp/sound/package/vehicle_sav_media.sdf'
		},

		parts={ -- ModelDescription; *.parts
			main={
				foxModel='/Assets/tpp/mecha/sav/Scenes/sav0_main0_def.fmdl', -- modelFile; FilePtr
				foxConnectionPoint='/Assets/tpp/mecha/sav/Scenes/sav0_main0_def.fcnp', -- connectPointFile; FilePtr
				rigFile=nil, -- gameRigFile; FilePtr
				helpBoneFile=nil, -- FilePtr
				lipAdjustFile=nil, -- lipAdjustBinaryFile; FilePtr
				facialSettingFile=nil, -- FilePtr
				geometrySkeleton='/Assets/tpp/mecha/sav/Scenes/sav0_main0_def.gskl', -- GeomSkeletonDescription; gsklFile; FilePtr
				physicsFile='/Assets/tpp/parts/mecha/sav/sav.ph', -- PhysicsDescription; physicsFile; FilePtr
				vehicleFile='/Assets/tpp/parts/mecha/sav/sav.veh', -- VehicleDescription; vehicleFile; FilePtr
				physicsSoundFile='/Assets/tpp/parts/mecha/sav/sav.phsd', -- SoundDescription; soundFile; FilePtr
				targetFile='/Assets/tpp/parts/mecha/sav/sav.tgt', -- FoxTargetDescription; targetFile; FilePtr; /Assets/tpp/parts/mecha/smt/smt_rootdefensetarget.tgt
				
				LOD_farPixelSize=50,
				LOD_closePixelSize=400,
				LOD_polygonSize=-1,
				renderRejectionLevel=8,
				farShadowRejectionLevel=2

				-- EffectDescription; effectFileFromFilePtr; FilePtr
				vfx_ExhaustSmoke='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchexhsmk01_s4MG.vfx',
				vfx_DamageSmoke='fx_tpp_smkmchbrk01_m1LG',
				vfx_BrokenSmoke='fx_tpp_smkmchbrk02_m2LG',
				vfx_PreExplosion='/Assets/tpp/effect/vfx_data/explosion/fx_tpp_expptl01_s3.vfx',
				
				vfx_MuzzleFlash='/Assets/tpp/effect/vfx_data/muzzle/fx_tpp_mzfgg01_s0FG.vfx',
				vfx_CannonMuzzleFlash=nil,
				vfx_SubjectiveCannonMuzzleFlash=nil,
				vfx_ShockWave=nil,
				vfx_CannonShockWave=nil,
				
				vfx_SparkActive='/Assets/tpp/effect/vfx_data/weapon/fx_tpp_wepltb04_s0.vfx',
				vfx_VehicleSandstorm=nil,
				
				vfx_LightProbe='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbsav00_s5MD.vfx',
				vfx_LightProbeInner='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbsav00_s5MD.vfx',
				vfx_TailLamp='/Assets/tpp/effect/vfx_data/light/fx_tpp_lgttil00_s0FG.vfx',
				vfx_HeadlightLeft='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchwavlgthed01_m2FG.vfx',
				vfx_HeadlightRight='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchwavlgthed01_m2FG.vfx',
				vfx_BrakeHeadlightLeft='fx_tpp_brklgtgnt01_s1LG',
				vfx_BrakeHeadlightRight='fx_tpp_brklgtgnt01_s1LG',
				
				vfx_SplashDoorLeft=nil,
				vfx_SplashDoorRootLeft=nil,
				vfx_SplashDoorRight=nil,
				vfx_SplashDoorRightRoot=nil
			}
		},

		engine={ -- 7 gears
			torqueDistributions={ -- axles; float
				[0]=0.25,
				0.25,
				0.25,
				0.25
			},

			gearRatios=nil, -- float

			cumulativeRPM={ -- specPointAngularVelocity; float
				0,
				500,
				1e3,
				1500,
				2e3,
				3e3,
				16e3
			},
			torque={ -- specPointTorque; float
				6e3,
				6040,
				6060,
				6080,
				6060,
				3e3,
				1e3
			},
			brakeTorque={ -- specPointBreakTorque; float
				750,
				750,
				750,
				1e3,
				1e3,
				1250,
				1500
			}
		},

		chassis={
			front={ -- axle 0,1
				maxBrakeTorque=70500, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.62, -- float
					suspensionLength=0.5, -- float
					maxSuspensionForce=1.3, -- float
					dampDecompressionFactor=0.01, -- dampingFactorElong; float
					dampCompressionFactor=5e-3, -- dampingFactorCompress; float
					friction=0.94, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				},
			},
			back={ -- axle 2,3
				maxBrakeTorque=70500, -- maxBreakTorque; float
				differential=true, -- useDifferential; bool
				wheels={
					radius=0.62, -- float
					suspensionLength=0.5, -- float
					maxSuspensionForce=1.5, -- float
					dampDecompressionFactor=0.015, -- dampingFactorElong; float
					dampCompressionFactor=7e-3, -- dampingFactorCompress; float
					friction=1.17, -- float
					restitution=0.1, -- float
					inertia=1 -- float
				},
			},
		},

		body={ -- PhRigidBodyParam; *.ph
			mass=15140, -- float
			friction=1, -- float
			restitution=1e-3, -- float
			linearVelocityDamp=1e-4, -- float
			linearVelocityMax=100, -- maxLinearVelocity; float
			angularVelocityDamp=2e-4, -- float
			angularVelocityMax=90, -- maxAngularVelocity; float
			permittedDepth=0.01, -- float
			sleepEnable=true, -- bool
			sleepLinearVelocityTh=0.1, -- float
			sleepAngularVelocityTh=30, -- float
			sleepTimeTh=0.25, -- float
			collisionGroup=0, -- uint16
			collisionType=0, -- uint16
			collisionId=93, -- uint32
			centerOfMassOffset={x=0, y=-0.575, z=0.5, w=0}, -- vector3
			motionType=2, -- int32
			material=nil, -- string
			noGravity=false -- bool
		}
	},

	w_wav_cannon={ -- american apc (cannon)
		fox2={
			tppVehicle2BodyData={
				name='veh_bd_west_wav|veh_bd_west_wav', -- string
				typeIndex=5, -- uint8; VehicleTypeIndex
				proxyTypeIndex=5, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=4, -- uint8
				partsFile='/Assets/tpp/parts/mecha/wav/wav0_main0_def.parts', -- filePtr
				bodyInstanceCount=1, -- uint8
				fovaFiles=nil -- filePtr
			},

			weaponParameters={
				primary={
					attackId='ATK_Tankgun_105mmRifledBoreGun', -- string
					equipId='EQP_BL_Tankgun_105mmRifledBoreGun', -- string
					bulletId='BL_Tankgun_105mmRifledBoreGun', -- string
					weaponImplTypeIndex=2, -- uint8
					fireInterval=5, -- float
					weaponFile=nil, -- filePtr
					ammoFile=nil, -- filePtr
					ownerCnpName=nil, -- string
					weaponBoneName=nil, -- string
					turretBoneName='SKL_001_TURRET', -- string
					barrelBoneName='SKL_002_BARREL', -- string
					minPitch=-0.087266, -- float
					maxPitch=0.785398, -- float
					rotSpeed=0.392699 -- float

					uiGraphEntry={
						name='veh_at_west_wav_trt_cannon|sight_vhcl_west_wav_cannon|UiGraphEntry0000', -- string
						files=nil, -- filePtr; dynamicArray
						rawFiles={ -- filePtr; dynamicArray
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_wpscope_vehicle_wav0_a.uilb',
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_vhcl_def_FPS_bs.uilb',
							'/Assets/tpp/ui/LayoutAsset/hud_wpscope/UI_wpscope_vehicle_common.uilb'
						}
					},

					uiInstanceData={
						name='veh_at_west_wav_trt_cannon|sight_vhcl_west_wav_cannon|UiInstanceData0000', -- string
						createWindowParams=nil, -- filePtr; stringMap
						windowFactoryName='SightVhclWav0_aFactory' -- string
					},

					attachmentData={
						name='veh_at_west_wav_trt_cannon|veh_at_west_wav_trt_cannon', -- string
						vehicleTypeCode=82, -- uint8
						attachmentImplTypeIndex=3, -- uint8
						attachmentFile='/Assets/tpp/parts/mecha/wav/wav0_turt0_def.parts', -- filePtr
						attachmentInstanceCount=1, -- uint8
						bodyCnpName='CNP_TURRET', -- string
						attachmentBoneName=nil -- string
					}
				},

				secondary={
					attackId='ATK_Tankgun_12_7mmHeavyMachineGun_West', -- string
					equipId=nil, -- string
					bulletId='BL_Turret', -- string
					weaponImplTypeIndex=4, -- uint8
					fireInterval=0.125, -- float
					weaponFile='/Assets/tpp/parts/weapon/hew/hw01_main0_def_wav0.parts', -- filePtr
					ammoFile=nil, -- filePtr
					ownerCnpName='CNP_awp_a', -- string
					weaponBoneName=nil, -- string
					turretBoneName='SKL_010_KYUPOL1', -- string
					barrelBoneName='SKL_010_GUN', -- string
					minPitch=-0.261799, -- float
					maxPitch=1.047198, -- float
					rotSpeed=2.094395 -- float
				}
			}
		},

		sound={
			vehicleSoundPackage='/Assets/tpp/sound/package/vehicle_wav_media.sdf'
		},

		parts={ -- ModelDescription; *.parts
			main={
				foxModel='/Assets/tpp/mecha/wav/Scenes/wav0_main0_def.fmdl', -- modelFile; FilePtr
				foxConnectionPoint='/Assets/tpp/mecha/wav/Scenes/wav0_main0_def.fcnp', -- connectPointFile; FilePtr
				rigFile=nil, -- gameRigFile; FilePtr
				helpBoneFile=nil, -- FilePtr
				lipAdjustFile=nil, -- lipAdjustBinaryFile; FilePtr
				facialSettingFile=nil, -- FilePtr
				geometrySkeleton='/Assets/tpp/mecha/wav/Scenes/wav0_main0_def.gskl', -- GeomSkeletonDescription; gsklFile; FilePtr
				physicsFile='/Assets/tpp/parts/mecha/wav/wav.ph', -- PhysicsDescription; physicsFile; FilePtr
				vehicleFile='/Assets/tpp/parts/mecha/wav/wav.veh', -- VehicleDescription; vehicleFile; FilePtr
				physicsSoundFile='/Assets/tpp/parts/mecha/wav/wav.phsd', -- SoundDescription; soundFile; FilePtr
				targetFile='/Assets/tpp/parts/mecha/wav/wav.tgt', -- FoxTargetDescription; targetFile; FilePtr; /Assets/tpp/parts/mecha/smt/smt_rootdefensetarget.tgt
				
				LOD_farPixelSize=50,
				LOD_closePixelSize=400,
				LOD_polygonSize=-1,
				renderRejectionLevel=8,
				farShadowRejectionLevel=2

				-- EffectDescription; effectFileFromFilePtr; FilePtr
				vfx_ExhaustSmoke='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchexhsmk01_s4MG.vfx',
				vfx_DamageSmoke='fx_tpp_smkmchbrk01_m1LG',
				vfx_BrokenSmoke='fx_tpp_smkmchbrk02_m2LG',
				vfx_PreExplosion='/Assets/tpp/effect/vfx_data/explosion/fx_tpp_expptl01_s3.vfx',
				
				vfx_MuzzleFlash='/Assets/tpp/effect/vfx_data/muzzle/fx_tpp_mzfgg01_s0FG.vfx',
				vfx_CannonMuzzleFlash='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchstrmzlbls01_s8MG.vfx',
				vfx_SubjectiveCannonMuzzleFlash='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchstrmzlbls02_s8.vfx',
				vfx_ShockWave='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchstrmzlskw01_s8.vfx',
				vfx_CannonShockWave='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchstrmzlskw02_s2.vfx',
				
				vfx_SparkActive='/Assets/tpp/effect/vfx_data/weapon/fx_tpp_wepltb04_s0.vfx',
				vfx_VehicleSandstorm='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchsndstm02_s5LG.vfx',
				
				vfx_LightProbe='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbwav00_s5MD.vfx',
				vfx_LightProbeInner='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchlpbwav00_s5MD.vfx',
				vfx_TailLamp='/Assets/tpp/effect/vfx_data/light/fx_tpp_lgttil00_s0FG.vfx',
				vfx_HeadlightLeft='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchwavlgthed01_m2FG.vfx',
				vfx_HeadlightRight='/Assets/tpp/effect/vfx_data/mecha/fx_tpp_mchwavlgthed01_m2FG.vfx',
				vfx_BrakeHeadlightLeft='fx_tpp_brklgtgnt01_s1LG',
				vfx_BrakeHeadlightRight='fx_tpp_brklgtgnt01_s1LG',
				
				vfx_SplashDoorLeft=nil,
				vfx_SplashDoorRootLeft=nil,
				vfx_SplashDoorRight=nil,
				vfx_SplashDoorRightRoot=nil
			}
		},

		engine={ -- 8 gears
			cumulativeRPM={ -- specPointAngularVelocity; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			},
			torque={ -- specPointTorque; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			},
			brakeTorque={ -- specPointBreakTorque; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			}
		},

		chassis={
			front={
				maxBrakeTorque=, -- maxBreakTorque; float
				differential=, -- useDifferential; bool
				wheels={
					radius=, -- float
					suspensionLength=, -- float
					maxSuspensionForce=, -- float
					dampDecompressionFactor=, -- dampingFactorElong; float
					dampCompressionFactor=, -- dampingFactorCompress; float
					friction=, -- float
					restitution=, -- float
					inertia= -- float
				},
			},
			back={
				maxBrakeTorque=, -- maxBreakTorque; float
				differential=, -- useDifferential; bool
				wheels={
					radius=, -- float
					suspensionLength=, -- float
					maxSuspensionForce=, -- float
					dampDecompressionFactor=, -- dampingFactorElong; float
					dampCompressionFactor=, -- dampingFactorCompress; float
					friction=, -- float
					restitution=, -- float
					inertia= -- float
				},
			},
		},

		body={ -- PhRigidBodyParam; *.ph
			mass=, -- float
			friction=, -- float
			restitution=, -- float
			linearVelocityDamp=, -- float
			linearVelocityMax=, -- maxLinearVelocity; float
			angularVelocityDamp=, -- float
			angularVelocityMax=, -- maxAngularVelocity; float
			permittedDepth=, -- float
			sleepEnable=, -- bool
			sleepLinearVelocityTh=, -- float
			sleepAngularVelocityTh=, -- float
			sleepTimeTh=, -- float
			collisionGroup=, -- uint16
			collisionType=, -- uint16
			collisionId=, -- uint32
			centerOfMassOffset={x=, y=, z=, w=}, -- vector3
			motionType=, -- int32
			material=, -- string
			noGravity= -- bool
		}
	},

	e_tnk={ -- russian MBT
		fox2={
			tppVehicle2BodyData={
				name=, -- string
				typeIndex=, -- uint8; VehicleTypeIndex
				proxyTypeIndex=, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=, -- uint8
				partsFile=, -- filePtr
				bodyInstanceCount=, -- uint8
				fovaFiles= -- filePtr
			},

			weaponParameters={
				primary={
					attackId=, -- string
					equipId=, -- string
					bulletId=, -- string
					weaponImplTypeIndex=, -- uint8
					fireInterval=, -- float
					weaponFile=, -- filePtr
					ammoFile=, -- filePtr
					ownerCnpName=, -- string
					weaponBoneName=, -- string
					turretBoneName=, -- string
					barrelBoneName=, -- string
					minPitch=, -- float
					maxPitch=, -- float
					rotSpeed= -- float

					uiGraphEntry={
						name='', -- string
						files={}, -- filePtr; dynamicArray
						rawFiles={} -- filePtr; dynamicArray
					},

					uiInstanceData={
						name='', -- string
						createWindowParams=, -- filePtr; stringMap
						windowFactoryName='' -- string
					},

					attachmentData={
						name='', -- string
						vehicleTypeCode=, -- uint8
						attachmentImplTypeIndex=, -- uint8
						attachmentFile='', -- filePtr
						attachmentInstanceCount=, -- uint8
						bodyCnpName=, -- string
						attachmentBoneName= -- string
					}
				},

				secondary={
					attackId=, -- string
					equipId=, -- string
					bulletId=, -- string
					weaponImplTypeIndex=, -- uint8
					fireInterval=, -- float
					weaponFile=, -- filePtr
					ammoFile=, -- filePtr
					ownerCnpName=, -- string
					weaponBoneName=, -- string
					turretBoneName=, -- string
					barrelBoneName=, -- string
					minPitch=, -- float
					maxPitch=, -- float
					rotSpeed= -- float

					uiGraphEntry={
						name='', -- string
						files={}, -- filePtr; dynamicArray
						rawFiles={} -- filePtr; dynamicArray
					},

					uiInstanceData={
						name='', -- string
						createWindowParams=, -- filePtr; stringMap
						windowFactoryName='' -- string
					},

					attachmentData={
						name='', -- string
						vehicleTypeCode=, -- uint8
						attachmentImplTypeIndex=, -- uint8
						attachmentFile='', -- filePtr
						attachmentInstanceCount=, -- uint8
						bodyCnpName=, -- string
						attachmentBoneName= -- string
					}
				}
			},
		},

		sound={
			vehicleSoundPackage=
		},

		parts={ -- ModelDescription; *.parts
			main={
				foxModel=, -- modelFile; FilePtr
				foxConnectionPoint=, -- connectPointFile; FilePtr
				rigFile=, -- gameRigFile; FilePtr
				helpBoneFile=, -- FilePtr
				lipAdjustFile=, -- lipAdjustBinaryFile; FilePtr
				facialSettingFile=, -- FilePtr
				geometrySkeleton=, -- GeomSkeletonDescription; gsklFile; FilePtr
				physicsFile=, -- PhysicsDescription; physicsFile; FilePtr
				vehicleFile=, -- VehicleDescription; vehicleFile; FilePtr
				physicsSoundFile=, -- SoundDescription; soundFile; FilePtr
				targetFile=, -- FoxTargetDescription; targetFile; FilePtr; /Assets/tpp/parts/mecha/smt/smt_rootdefensetarget.tgt
				
				LOD_farPixelSize=,
				LOD_closePixelSize=,
				LOD_polygonSize=,
				renderRejectionLevel=,
				farShadowRejectionLevel=

				-- EffectDescription; effectFileFromFilePtr; FilePtr
				vfx_ExhaustSmoke=,
				vfx_DamageSmoke=,
				vfx_BrokenSmoke=,
				vfx_PreExplosion=,
				
				vfx_MuzzleFlash=,
				vfx_CannonMuzzleFlash=,
				vfx_SubjectiveCannonMuzzleFlash=,
				vfx_ShockWave=,
				vfx_CannonShockWave=,
				
				vfx_SparkActive=,
				vfx_VehicleSandstorm=,
				
				vfx_LightProbe=,
				vfx_LightProbeInner=,
				vfx_TailLamp=,
				vfx_HeadlightLeft=,
				vfx_HeadlightRight=,
				vfx_BrakeHeadlightLeft=,
				vfx_BrakeHeadlightRight=,
				
				vfx_SplashDoorLeft=,
				vfx_SplashDoorRootLeft=,
				vfx_SplashDoorRight=,
				vfx_SplashDoorRightRoot=,
			},

			window={
				front={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				},
				back={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				},
				left={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				},
				right={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				}
			}
		},

		engine={ -- 8 gears
			cumulativeRPM={ -- specPointAngularVelocity; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			},
			torque={ -- specPointTorque; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			},
			brakeTorque={ -- specPointBreakTorque; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			}
		},

		chassis={
			front={
				maxBrakeTorque=, -- maxBreakTorque; float
				differential=, -- useDifferential; bool
				wheels={
					radius=, -- float
					suspensionLength=, -- float
					maxSuspensionForce=, -- float
					dampDecompressionFactor=, -- dampingFactorElong; float
					dampCompressionFactor=, -- dampingFactorCompress; float
					friction=, -- float
					restitution=, -- float
					inertia= -- float
				},
			},
			back={
				maxBrakeTorque=, -- maxBreakTorque; float
				differential=, -- useDifferential; bool
				wheels={
					radius=, -- float
					suspensionLength=, -- float
					maxSuspensionForce=, -- float
					dampDecompressionFactor=, -- dampingFactorElong; float
					dampCompressionFactor=, -- dampingFactorCompress; float
					friction=, -- float
					restitution=, -- float
					inertia= -- float
				},
			},
		},

		body={ -- PhRigidBodyParam; *.ph
			mass=, -- float
			friction=, -- float
			restitution=, -- float
			linearVelocityDamp=, -- float
			linearVelocityMax=, -- maxLinearVelocity; float
			angularVelocityDamp=, -- float
			angularVelocityMax=, -- maxAngularVelocity; float
			permittedDepth=, -- float
			sleepEnable=, -- bool
			sleepLinearVelocityTh=, -- float
			sleepAngularVelocityTh=, -- float
			sleepTimeTh=, -- float
			collisionGroup=, -- uint16
			collisionType=, -- uint16
			collisionId=, -- uint32
			centerOfMassOffset={x=, y=, z=, w=}, -- vector3
			motionType=, -- int32
			material=, -- string
			noGravity= -- bool
		}
	},

	w_tnk={ -- american MBT
		fox2={
			tppVehicle2BodyData={
				name=, -- string
				typeIndex=, -- uint8; VehicleTypeIndex
				proxyTypeIndex=, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=, -- uint8
				partsFile=, -- filePtr
				bodyInstanceCount=, -- uint8
				fovaFiles= -- filePtr
			},

			weaponParameters={
				primary={
					attackId=, -- string
					equipId=, -- string
					bulletId=, -- string
					weaponImplTypeIndex=, -- uint8
					fireInterval=, -- float
					weaponFile=, -- filePtr
					ammoFile=, -- filePtr
					ownerCnpName=, -- string
					weaponBoneName=, -- string
					turretBoneName=, -- string
					barrelBoneName=, -- string
					minPitch=, -- float
					maxPitch=, -- float
					rotSpeed= -- float

					uiGraphEntry={
						name='', -- string
						files={}, -- filePtr; dynamicArray
						rawFiles={} -- filePtr; dynamicArray
					},

					uiInstanceData={
						name='', -- string
						createWindowParams=, -- filePtr; stringMap
						windowFactoryName='' -- string
					},

					attachmentData={
						name='', -- string
						vehicleTypeCode=, -- uint8
						attachmentImplTypeIndex=, -- uint8
						attachmentFile='', -- filePtr
						attachmentInstanceCount=, -- uint8
						bodyCnpName=, -- string
						attachmentBoneName= -- string
					}
				},

				secondary={
					attackId=, -- string
					equipId=, -- string
					bulletId=, -- string
					weaponImplTypeIndex=, -- uint8
					fireInterval=, -- float
					weaponFile=, -- filePtr
					ammoFile=, -- filePtr
					ownerCnpName=, -- string
					weaponBoneName=, -- string
					turretBoneName=, -- string
					barrelBoneName=, -- string
					minPitch=, -- float
					maxPitch=, -- float
					rotSpeed= -- float

					uiGraphEntry={
						name='', -- string
						files={}, -- filePtr; dynamicArray
						rawFiles={} -- filePtr; dynamicArray
					},

					uiInstanceData={
						name='', -- string
						createWindowParams=, -- filePtr; stringMap
						windowFactoryName='' -- string
					},

					attachmentData={
						name='', -- string
						vehicleTypeCode=, -- uint8
						attachmentImplTypeIndex=, -- uint8
						attachmentFile='', -- filePtr
						attachmentInstanceCount=, -- uint8
						bodyCnpName=, -- string
						attachmentBoneName= -- string
					}
				}
			},
		},

		sound={
			vehicleSoundPackage=
		},

		parts={ -- ModelDescription; *.parts
			main={
				foxModel=, -- modelFile; FilePtr
				foxConnectionPoint=, -- connectPointFile; FilePtr
				rigFile=, -- gameRigFile; FilePtr
				helpBoneFile=, -- FilePtr
				lipAdjustFile=, -- lipAdjustBinaryFile; FilePtr
				facialSettingFile=, -- FilePtr
				geometrySkeleton=, -- GeomSkeletonDescription; gsklFile; FilePtr
				physicsFile=, -- PhysicsDescription; physicsFile; FilePtr
				vehicleFile=, -- VehicleDescription; vehicleFile; FilePtr
				physicsSoundFile=, -- SoundDescription; soundFile; FilePtr
				targetFile=, -- FoxTargetDescription; targetFile; FilePtr; /Assets/tpp/parts/mecha/smt/smt_rootdefensetarget.tgt
				
				LOD_farPixelSize=,
				LOD_closePixelSize=,
				LOD_polygonSize=,
				renderRejectionLevel=,
				farShadowRejectionLevel=

				-- EffectDescription; effectFileFromFilePtr; FilePtr
				vfx_ExhaustSmoke=,
				vfx_DamageSmoke=,
				vfx_BrokenSmoke=,
				vfx_PreExplosion=,
				
				vfx_MuzzleFlash=,
				vfx_CannonMuzzleFlash=,
				vfx_SubjectiveCannonMuzzleFlash=,
				vfx_ShockWave=,
				vfx_CannonShockWave=,
				
				vfx_SparkActive=,
				vfx_VehicleSandstorm=,
				
				vfx_LightProbe=,
				vfx_LightProbeInner=,
				vfx_TailLamp=,
				vfx_HeadlightLeft=,
				vfx_HeadlightRight=,
				vfx_BrakeHeadlightLeft=,
				vfx_BrakeHeadlightRight=,
				
				vfx_SplashDoorLeft=,
				vfx_SplashDoorRootLeft=,
				vfx_SplashDoorRight=,
				vfx_SplashDoorRightRoot=,
			},

			window={
				front={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				},
				back={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				},
				left={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				},
				right={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				}
			}
		},

		engine={ -- 8 gears
			cumulativeRPM={ -- specPointAngularVelocity; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			},
			torque={ -- specPointTorque; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			},
			brakeTorque={ -- specPointBreakTorque; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			}
		},

		chassis={
			front={
				maxBrakeTorque=, -- maxBreakTorque; float
				differential=, -- useDifferential; bool
				wheels={
					radius=, -- float
					suspensionLength=, -- float
					maxSuspensionForce=, -- float
					dampDecompressionFactor=, -- dampingFactorElong; float
					dampCompressionFactor=, -- dampingFactorCompress; float
					friction=, -- float
					restitution=, -- float
					inertia= -- float
				},
			},
			back={
				maxBrakeTorque=, -- maxBreakTorque; float
				differential=, -- useDifferential; bool
				wheels={
					radius=, -- float
					suspensionLength=, -- float
					maxSuspensionForce=, -- float
					dampDecompressionFactor=, -- dampingFactorElong; float
					dampCompressionFactor=, -- dampingFactorCompress; float
					friction=, -- float
					restitution=, -- float
					inertia= -- float
				},
			},
		},

		body={ -- PhRigidBodyParam; *.ph
			mass=, -- float
			friction=, -- float
			restitution=, -- float
			linearVelocityDamp=, -- float
			linearVelocityMax=, -- maxLinearVelocity; float
			angularVelocityDamp=, -- float
			angularVelocityMax=, -- maxAngularVelocity; float
			permittedDepth=, -- float
			sleepEnable=, -- bool
			sleepLinearVelocityTh=, -- float
			sleepAngularVelocityTh=, -- float
			sleepTimeTh=, -- float
			collisionGroup=, -- uint16
			collisionType=, -- uint16
			collisionId=, -- uint32
			centerOfMassOffset={x=, y=, z=, w=}, -- vector3
			motionType=, -- int32
			material=, -- string
			noGravity= -- bool
		}
	}

--[[

	={ -- 
		fox2={
			tppVehicle2BodyData={
				name=, -- string
				typeIndex=, -- uint8; VehicleTypeIndex
				proxyTypeIndex=, -- uint8; ProxyVehicleTypeIndex
				bodyImplTypeIndex=, -- uint8
				partsFile=, -- filePtr
				bodyInstanceCount=, -- uint8
				fovaFiles= -- filePtr
			},

			weaponParameters={
				primary={
					attackId=, -- string
					equipId=, -- string
					bulletId=, -- string
					weaponImplTypeIndex=, -- uint8
					fireInterval=, -- float
					weaponFile=, -- filePtr
					ammoFile=, -- filePtr
					ownerCnpName=, -- string
					weaponBoneName=, -- string
					turretBoneName=, -- string
					barrelBoneName=, -- string
					minPitch=, -- float
					maxPitch=, -- float
					rotSpeed= -- float

					uiGraphEntry={
						name='', -- string
						files={}, -- filePtr; dynamicArray
						rawFiles={} -- filePtr; dynamicArray
					},

					uiInstanceData={
						name='', -- string
						createWindowParams=, -- filePtr; stringMap
						windowFactoryName='' -- string
					},

					attachmentData={
						name='', -- string
						vehicleTypeCode=, -- uint8
						attachmentImplTypeIndex=, -- uint8
						attachmentFile='', -- filePtr
						attachmentInstanceCount=, -- uint8
						bodyCnpName=, -- string
						attachmentBoneName= -- string
					}
				},

				secondary={
					attackId=, -- string
					equipId=, -- string
					bulletId=, -- string
					weaponImplTypeIndex=, -- uint8
					fireInterval=, -- float
					weaponFile=, -- filePtr
					ammoFile=, -- filePtr
					ownerCnpName=, -- string
					weaponBoneName=, -- string
					turretBoneName=, -- string
					barrelBoneName=, -- string
					minPitch=, -- float
					maxPitch=, -- float
					rotSpeed= -- float

					uiGraphEntry={
						name='', -- string
						files={}, -- filePtr; dynamicArray
						rawFiles={} -- filePtr; dynamicArray
					},

					uiInstanceData={
						name='', -- string
						createWindowParams=, -- filePtr; stringMap
						windowFactoryName='' -- string
					},

					attachmentData={
						name='', -- string
						vehicleTypeCode=, -- uint8
						attachmentImplTypeIndex=, -- uint8
						attachmentFile='', -- filePtr
						attachmentInstanceCount=, -- uint8
						bodyCnpName=, -- string
						attachmentBoneName= -- string
					}
				}
			},
		},

		sound={
			vehicleSoundPackage=
		},

		parts={ -- ModelDescription; *.parts
			main={
				foxModel=, -- modelFile; FilePtr
				foxConnectionPoint=, -- connectPointFile; FilePtr
				rigFile=, -- gameRigFile; FilePtr
				helpBoneFile=, -- FilePtr
				lipAdjustFile=, -- lipAdjustBinaryFile; FilePtr
				facialSettingFile=, -- FilePtr
				geometrySkeleton=, -- GeomSkeletonDescription; gsklFile; FilePtr
				physicsFile=, -- PhysicsDescription; physicsFile; FilePtr
				vehicleFile=, -- VehicleDescription; vehicleFile; FilePtr
				physicsSoundFile=, -- SoundDescription; soundFile; FilePtr
				targetFile=, -- FoxTargetDescription; targetFile; FilePtr; /Assets/tpp/parts/mecha/smt/smt_rootdefensetarget.tgt
				
				LOD_farPixelSize=,
				LOD_closePixelSize=,
				LOD_polygonSize=,
				renderRejectionLevel=,
				farShadowRejectionLevel=

				-- EffectDescription; effectFileFromFilePtr; FilePtr
				vfx_ExhaustSmoke=,
				vfx_DamageSmoke=,
				vfx_BrokenSmoke=,
				vfx_PreExplosion=,
				
				vfx_MuzzleFlash=,
				vfx_CannonMuzzleFlash=,
				vfx_SubjectiveCannonMuzzleFlash=,
				vfx_ShockWave=,
				vfx_CannonShockWave=,
				
				vfx_SparkActive=,
				vfx_VehicleSandstorm=,
				
				vfx_LightProbe=,
				vfx_LightProbeInner=,
				vfx_TailLamp=,
				vfx_HeadlightLeft=,
				vfx_HeadlightRight=,
				vfx_BrakeHeadlightLeft=,
				vfx_BrakeHeadlightRight=,
				
				vfx_SplashDoorLeft=,
				vfx_SplashDoorRootLeft=,
				vfx_SplashDoorRight=,
				vfx_SplashDoorRightRoot=,
			},

			window={
				front={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				},
				back={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				},
				left={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				},
				right={
					connectionPointName=,
					foxModel=,

					vfx_BrokenGlass=,
					effectConnect=,
					changeEffectConnectSetting=,
					visibleModelWithEffect=,
					createStartEffect=,
					effectRandomSeed=, -- uint32
					effectKind=, -- int32 

					geom_WindowGlass=,

					LOD_farPixelSize=,
					LOD_closePixelSize=,
					LOD_polygonSize=,
					renderRejectionLevel=,
					farShadowRejectionLevel=
				}
			}
		},

		engine={ -- 8 gears
			cumulativeRPM={ -- specPointAngularVelocity; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			},
			torque={ -- specPointTorque; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			},
			brakeTorque={ -- specPointBreakTorque; float
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			}
		},

		chassis={
			front={
				maxBrakeTorque=, -- maxBreakTorque; float
				differential=, -- useDifferential; bool
				wheels={
					radius=, -- float
					suspensionLength=, -- float
					maxSuspensionForce=, -- float
					dampDecompressionFactor=, -- dampingFactorElong; float
					dampCompressionFactor=, -- dampingFactorCompress; float
					friction=, -- float
					restitution=, -- float
					inertia= -- float
				},
			},
			back={
				maxBrakeTorque=, -- maxBreakTorque; float
				differential=, -- useDifferential; bool
				wheels={
					radius=, -- float
					suspensionLength=, -- float
					maxSuspensionForce=, -- float
					dampDecompressionFactor=, -- dampingFactorElong; float
					dampCompressionFactor=, -- dampingFactorCompress; float
					friction=, -- float
					restitution=, -- float
					inertia= -- float
				},
			},
		},

		body={ -- PhRigidBodyParam; *.ph
			mass=, -- float
			friction=, -- float
			restitution=, -- float
			linearVelocityDamp=, -- float
			linearVelocityMax=, -- maxLinearVelocity; float
			angularVelocityDamp=, -- float
			angularVelocityMax=, -- maxAngularVelocity; float
			permittedDepth=, -- float
			sleepEnable=, -- bool
			sleepLinearVelocityTh=, -- float
			sleepAngularVelocityTh=, -- float
			sleepTimeTh=, -- float
			collisionGroup=, -- uint16
			collisionType=, -- uint16
			collisionId=, -- uint32
			centerOfMassOffset={x=, y=, z=, w=}, -- vector3
			motionType=, -- int32
			material=, -- string
			noGravity= -- bool
		}
	}
	]]
}

function this.relativeArmor(armorMM, entryAngle)
	--       alpha
	--	T =  -----
	--       cos h

	local T
	local a=armorMM

	--[[local alpha=armorMM
	local h=math.rad(entryAngle)
	h=math.cos(h)
	local T=alpha/h

	print(T)

	print(math.tan(armorMM, entryAngle))]]


end

this.relativeArmor(38, 60) 

function this.penetrationDepth(munitionDensity, munitionLength, targetDensity) -- munitionVelocity == dummy
	--         A
	-- D = L -----
	--		   B

	-- uranium = 19.1 g/cm^3
	-- lead = 11.3 g/cm^3
	-- tungsten = 19.25 g/cm^3

	-- RHA = 7.84g/cm^3
	-- aluminum oxide = 3.986g/cm^3 -- early abrams

	local D
	local L=munitionLength
	local A=munitionDensity
	--local V=nil
	local B=targetDensity

	D=A/B
	D=L*D

	print(D)
	return D
end

this.penetrationDepth(19.25, 25, 7.84)


--[[

Wheels
	Friction
		Low = faster accel but less grip on turns.
		High = Slower accel but more grip on turns.

		Front > Back = Better turning but more oversteer.

	Brake force
		Too low = Tires will fail to lock.
		Too high = Tires may lock too early and lose traction.

	Radius (diameter?)
		low = Less grip
		high = More grip

Suspension

	

]]


function this.validateNonFloatInt(datatype, value)
	local unit=this.unit[datatype]
	assert(unit, print('Invalid argument. "datatype" must be a string of table key within "this.unit".'))
	local n=value

	return ((n<unit.min and unit.min) or (unit.max<n and unit.max) or n)
end

function this.validateFloat(datatype, value)
	print(datatype)
	assert(datatype=='float' or datatype=='double', 'qInvalid argument. "datatype" must be a string with value of "float" or "double".')
	local unit=this.unit[datatype]
	--print(unit)
	--assert(unit.min, print('Invalid argument. "datatype" must be a string of table key within "this.unit".'))
	local n=value

	--[=[do
		local s=tostring(n)
		print(s)
		local len=#s
		len=((s:find('%.') and len-1) or len)

		if unit.significantDigits<len then
			local pattern=function(value)
				local n=((s:find('%.') and #s+1) or #s)
				local s='^'

				for i=1,n do
					s=s..'.'
				end

				return s
			end

			print(s)
			pattern=pattern(s)
			print(pattern)
			print([[n == ]]..n..[[ tonumber(s:match(]]..pattern..'))')
			--n=tonumber(s:match(pattern))
			n=s:match(pattern)
			print(n)
		end
	end
	]=]

	do
		local nString=n+''
		
	end

	n=((n<unit.min and unit.min) or (unit.max<n and unit.max) or n)

	return n
end

--print(this.validateFloat('float', 0123456789))

function this.momentOfInertia(I, angularAcceleration)
	local appliedTorque=I*angularAcceleration
	local T=appliedTorque
end

function this.torqueToOvercomeRollResistance(linearBodySpeedAtAxle, rotationalSpeed, rollResistance)
	local T=0
	local Vs=linearBodySpeedAtAxle
	local Omega=rotationalSpeed
	local Rr=rollResistance

	T=(Vs/Omega)*Rr
	print(T)
end

--this.torqueToOvercomeRollResistance(100,90,0.94)

function this.rollResistance(mass, tirePressure, velocity, gravity)
	local Cr=math.abs(0.02+0.0095*(velocity/100)^2)
	Cr=(0.005+1/tirePressure)*Cr
	print(Cr*mass*gravity)
end

--this.rollResistance(1000, 30, 62, 9.80665)

--[[function this.getMaxSpeed(airDensity, projectedObjectArea, velocity, dragCoefficient)
	local D=airDensity -- kg/m^3
	local A=projectedObjectArea -- m^2
	local v=velocity*100 -- m/s
	local c=dragCoefficient -- 

	local F=0.5*c*D*A*(v^2)
	local control1=F*v
	local control2=0.5*c*D*A*(v^3)
	local P=F*v
	--assert(P==control1 and P==control2)

	v=(2*P/(c*D*A))*0.33
	print(v)
end

this.getMaxSpeed(1.5, 1.21, 62, 1.115)]]

function this.getHorsePower(torque, RPM)
	return (torque*RPM)/5252 or 0
end

--[[this.engineSpecs={
	[0]=0,
	this.getHorsePower(1e3, 208),
	this.getHorsePower(2e3, 230),
	this.getHorsePower(3e3, 250),
	this.getHorsePower(4e3, 260),
	this.getHorsePower(5e3, 220),
	this.getHorsePower(6e3, 160),
	this.getHorsePower(12e3, 20)
}

for i=0,#this.engineSpecs do
	--print(this.engineSpecs[i])
end
]]

function this.convertProperty_fireInterval_toRPM(value)
	return 60/value
end

function this.convertRPMToPropertyValue_fireInterval(rpm)
	local value=60/rpm
	local unit='float'

	value=this.validateFloat(unit, value)
	value=value<0 and 0 or value

	return value
end

--print(this.convertRPMToPropertyValue_fireInterval(2009))


return this
