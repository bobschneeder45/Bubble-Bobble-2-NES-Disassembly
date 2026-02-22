AnimTable:
	;- - - - - - 0x018010 06:A000: 36
	;00-01: Image (or just FF to finish and loop)
	;02: Duration
	;03: CHR bank
	.word anDummy				;00
	.word anPlayerL				;01
	.word anPlayerR				;02
	.word anPlayerWalkL			;03
	.word anPlayerWalkR			;04
	.word anPlayerJumpL			;05
	.word anPlayerJumpR			;06
	.word anPlayerStartFallL	;07
	.word anPlayerStartFallR	;08
	.word anPlayerFallL			;09
	.word anPlayerFallR			;0A
	.word anUNK0B				;0B
	.word anUNK0C				;0C
	.word anPlayerWeakenL		;0D
	.word anPlayerWeakenR		;0E
	.word anPlayerInhale1L		;0F
	.word anPlayerInhale1R		;10
	.word anUNK11				;11
	.word anUNK12				;12
	.word anUNK13				;13
	.word anUNK14				;14
	.word anUNK15				;15
	.word anUNK16				;16
	.word anUNK17				;17
	.word anUNK18				;18
	.word anPlayerInhale2L		;19
	.word anPlayerInhale2R		;1A
	.word anUNK1B				;1B
	.word anUNK1C				;1C
	.word anUNK1D				;1D
	.word anUNK1E				;1E
	.word anUNK1F				;1F
	.word anUNK20				;20
	.word anUNK21				;21
	.word anUNK22				;22
	.word anPlayerInhale4L		;23
	.word anPlayerInhale4R		;24
	.word anPlayerRoundStart	;25
	.word anPlayerRotateL		;26
	.word anBubble				;27
	.word anPlayerInhale3L		;28
	.word anPlayerInhale3R		;29
	.word anPlayerDie			;2A
	.word anPlayerWin			;2B
	.word anPlayerLoseL			;2C
	.word anPlayerLoseR			;2D
	.word anBubblePop			;2E
	.word anBubbleEmerge		;2F
	.word anBubbleWeak			;30
	.word anDoubleBubble		;31
	.word anTripleBubble		;32
	.word anPlayerShootL		;33
	.word anPlayerShootR		;34
	.word anUNK35				;35
	.word anUNK36				;36
	.word anPlayerRotateR		;37
	.word anSpringitBodyR		;38
	.word anSpringitR			;39
	.word anSpringitBodyL		;3A
	.word anSpringitL			;3B
	.word anZenChanL			;3C
	.word anZenChanR			;3D
	.word anMonstaL				;3E
	.word anMonstaR				;3F
	.word anNeedler				;40
	.word anSnaggerL			;41
	.word anSnaggerR			;42
	.word anBanebouL			;43
	.word anBanebouR			;44
	.word anBlobbyL				;45
	.word anBlobbyR				;46
	.word anPulpul				;47
	.word anInvader				;48
	.word anHeitaiKunL			;49
	.word anHeitaiKunR			;4A
	.word anCarryHeliL			;4B
	.word anCarryHeliR			;4C
	.word anFlarion				;4D
	.word anManticharL			;4E
	.word anManticharR			;4F
	.word anRoboZenL			;50
	.word anRoboZenR			;51
	.word anRoboZenHandL		;52
	.word anRoboZenHandR		;53
	.word anKirikabun			;54
	.word anFlutterfly			;55
	.word anUNK56				;56
	.word anTwizzerSpin			;57
	.word anDrunkL				;58
	.word anDrunkR				;59
	.word anSpringitBlast		;5A
	.word anZenChanTrapped		;5B
	.word anBanebouTrapped		;5C
	.word anBlobbyTrapped		;5D
	.word anPulpulTrapped		;5E
	.word anNeedlerTrapped		;5F
	.word anInvaderTrapped		;60
	.word anMonstaTrapped		;61
	.word anHeitaiKunTrapped	;62
	.word anSpringitBodyDieR	;63
	.word anSpringitDieR		;64
	.word anSpringitBodyDieL	;65
	.word anSpringitDieL		;66
	.word anDOHProj				;67
	.word anDOHProjSpin			;68
.ifdef REGION_JP
	;Swapping places in US
	.word anDOHTrapped			;69
.else
	.word anZenChanTurnL		;69
.endif
	.word anDrunkTrapped		;6A
	.word anFlutterflyTrapped	;6B
.ifdef REGION_JP
	;Swapping places in US
	.word anZenChanTurnL		;6C
.else
	.word anDOHTrapped			;6C
.endif
	.word anZenChanTurnR		;6D
	.word anGhostMonstaL		;6E
	.word anGhostMonstaR		;6F
	.word anGhostMonstaReveal	;70
	.word anChuckerTrapped		;71
	.word anRounderTrapped		;72
	.word anSnaggerAttackL		;73
	.word anSnaggerAttackR		;74
	.word anInvaderBlast		;75
	.word anRuckusBlast			;76
	.word anBlobbyCeilL			;77
	.word anBlobbyCeilR			;78
	.word anBlobbyOverL			;79
	.word anBlobbyOverR			;7A
	.word anBlobbyUnderL		;7B
	.word anBlobbyUnderR		;7C
	.word anBlobbyUpL			;7D
	.word anBlobbyUpR			;7E
	.word anBlobbyFlyDownL		;7F
	.word anBlobbyFlyDownR		;80
	.word anBlobbyDownL			;81
	.word anBlobbyDownR			;82
	.word anBlobbyFlyUpL		;83
	.word anBlobbyFlyUpR		;84
	.word anCarryHeliExitL		;85
	.word anCarryHeliExitR		;86
	.word anHeitaiKunExposedL	;87
	.word anHeitaiKunExposedR	;88
	.word anHeitaiKunHelmetL	;89
	.word anHeitaiKunHelmetR	;8A
	.word anCarryHeliOpenL		;8B
	.word anCarryHeliOpenR		;8C
	.word anFlarionShrunk		;8D
	.word anFlarionSmall		;8E
	.word anFlarionSmaller		;8F
	.word anFlarionSmallest		;90
	.word anManticharAngryL		;91
	.word anManticharAngryR		;92
	.word anRoboZenShootL		;93
	.word anRoboZenShootR		;94
	.word anRoboZenWindingL		;95
	.word anRoboZenWindingR		;96
	.word anHandWindingL		;97
	.word anHandWindingR		;98
	.word anKirikabunBlink		;99
	.word anPulpulBlink			;9A
	.word anDOHDie				;9B
	.word anTwizzer				;9C
	.word anDrunkThrowL			;9D
	.word anDrunkThrowR			;9E
	.word anZenChanDie			;9F
	.word anMonstaDie			;A0
	.word anNeedlerDie			;A1
	.word anBanebouDie			;A2
	.word anBlobbyDie			;A3
	.word anPulpulDie			;A4
	.word anInvaderDie			;A5
	.word anHeitaiKunDie		;A6
	.word anCarryHeliDieL		;A7
	.word anCarryHeliDieR		;A8
	.word anManticharDie		;A9
	.word anRuckusDie			;AA
	.word anKirikabunDie		;AB
	.word anFlutterflyDie		;AC
	.word anTwizzerDie			;AD
	.word anDrunkDie			;AE
	.word anNeedlerSyringe		;AF
	.word anInvaderBeam					;B0
	.word anHeitaiKunPara				;B1
	.word anHeitaiKunParaLand			;B2
	.word anFlarionFlame				;B3
	.word anRoboZenMissileLeft			;B4
	.word anRoboZenMissileDownLeft		;B5
	.word anRoboZenMissileUp			;B6
	.word anRoboZenMissileRight			;B7
	.word anDrunkBottle					;B8
	.word anDrunkBlast					;B9
	.word anRoboZenMissileDownRight		;BA
	.word anRoboZenMissileDown			;BB
	.word anRoboZenMissileUpLeft		;BC
	.word anRoboZenMissileUpRight		;BD
	.word anEnemySpecificReward			;BE
	.word anChuckerL					;BF
	.word anChuckerR			;C0
	.word anChuckerSmallL		;C1
	.word anChuckerSmallR		;C2
	.word anChuckerShootL		;C3
	.word anChuckerShootR		;C4
	.word anChuckerRock			;C5
	.word anDOHTop				;C6
	.word anDOHFace				;C7
	.word anDOHMouth			;C8
	.word anDOHBody				;C9
	.word anDOHTopShoot			;CA
	.word anDOHFaceShoot		;CB
	.word anDOHMouthShoot		;CC
	.word anDOHBodyShoot		;CD
	.word anRuckusLAlt			;CE
	.word anRuckusRAlt			;CF
	.word anRuckusL				;D0
	.word anRuckusR				;D1
	.word anPlayerGameOver		;D2
	.word anPlayerContinue		;D3
	.word anRounderReward		;D4
	.word anNeedlerExposed		;D5
	.word anSpikeBall			;D6
	.word anChuckerDie			;D7
	.word anSkullFireR			;D8
	.word anSkullR				;D9
	.word anBurningSkullR		;DA
	.word anMadMonkey			;DB
	.word anMadMonkeyStartJump	;DC
	.word anMadMonkeyJump		;DD
	.word anMadMonkeyDie		;DE
	.word anRounder				;DF
	.word anRounderFall			;E0
	.word anRounderHang			;E1
	.word anRounderTrapped		;E2
	.word anRounderDie			;E3
	.word anRoc					;E4
	.word anRocShoot			;E5
	.word anRocMad				;E6
	.word anRocMadShoot			;E7
	.word anRocBigLightning		;E8
	.word anSkullL				;E9
	.word anBurningSkullL		;EA
	.word anSkullFireL			;EB
	.word anSkullReticle		;EC
	.word anSkullHeart			;ED
	.word anSuperDrunkL			;EE
	.word anSuperDrunkR			;EF
	.word anSuperDrunkOrb		;F0
	.word anSuperDrunkDebrisA	;F1
	.word anSuperDrunkDebrisB	;F2
	.word anSuperDrunkDebrisC	;F3
	.word anFinalSkullL			;F4
	.word anFinalSkullR			;F5
	.word anFinalSkullJumpL		;F6
	.word anFinalSkullJumpR		;F7
	.word anFinalSkullDie		;F8
	.word anRuckusBomb			;F9
	.word anPlayerNeedlerL		;FA
	.word anPlayerNeedlerR		;FB
	.word anZenChanLookAroundL	;FC
	.word anZenChanLookAroundR	;FD
	.word anTrash				;FE
	.word anTrashFall			;FF
	.word anTrashFall			;100
	.word anThunderBubble		;101
	.word anFireBubble			;102
	.word anFloodBubble			;103
	.word anSnowBubble			;104
	.word anWindBubble			;105
	.word anStarBubble			;106
	.word anThunder				;107
	.word anFlame				;108
	.word anFloodV				;109
	.word anSnowRelease			;10A
	.word anWind				;10B
	.word anStar				;10C
	.word anThunderAlt			;10D
	.word anStarAlt				;10E
	.word anSnowAlt				;10F
	.word anWindAlt				;110
	.word anHeart				;111
	.word anHolyCup				;112
	.word anSecretDoor			;113
	.word anPencil				;114
	.word anCrystal				;115
	.word anStarRod				;116
	.word anShoe				;117
	.word anCandy				;118
	.word anJrDoll				;119
	.word anClock				;11A
	.word anStaff				;11B
	.word anTree				;11C
	.word anParasol				;11D
	.word an1UP					;11E
	.word anSpinyChestnut		;11F
	.word anDrinkThunder		;120
	.word anTractorMissile		;121
	.word anUNK122				;122
	.word anDrinkStar			;123
	.word anDrinkSnow			;124
	.word anFlames4				;125
	.word anTrashFall			;126
	.word anTrashFall			;127
	.word anFlames2				;128
	.word anFlames2L			;129
	.word anFlames3				;12A
	.word anFlames3R			;12B
	.word anFloodH				;12C
	.word anBombBubble			;12D
	.word anDrinkWind			;12E
	.word anRocDie				;12F
	.word anPlayerSmallL		;130
	.word anPlayerSmallR		;131
	.word anChuckerBlast		;132
	.word anFlashingCircle		;133
	.word anPlayerSmallWalkL	;134
	.word anPlayerSmallWalkR	;135
	.word anChuckerBlast		;136
	.word anRocSmallLightning	;137
	.word anSkelMonstaL			;138
	.word anSkelMonstaR			;139
	.word anSkelMonstaSpawn		;13A
	.word anSkelMonstaLeave		;13B
	.word anDummy				;13C
	.word anSnowSpread			;13D
	.word anSnowFall			;13E
	.word anFloodHAlt			;13F
	.word anUNK140				;140
	.word anUNK141				;141
	.word anAnnounceRound		;142
	.word anAnnounceClear		;143
	.word anAnnounceBonus		;144
	.word anAnnounceGame		;145
	.word anAnnounceNo			;146
	.word anAnnouncePause		;147
	.word anAnnounceTheEnd		;148
	.word anAnnounce0			;149
	.word anAnnounce1			;14A
	.word anAnnounce2			;14B
	.word anAnnounce3			;14C
	.word anAnnounce4			;14D
	.word anAnnounce5			;14E
	.word anAnnounce6			;14F
	.word anAnnounce7			;150
	.word anAnnounce8			;151
	.word anAnnounce9			;152
	.word anAnnounce30000		;153
	.word anAnnounce10000		;154
	.word anAnnouncePlayer		;155
	.word anAnnounce100000		;156
	.word anAnnounce10000		;157
	.word anAnnounce10000		;158
	.word anAnnounce10000		;159
	.word anAnnounce10000		;15A
	.word anAnnounce10000		;15B
	.word anAnnounce10000		;15C
	.word anAnnounce10000		;15D
	.word anFairy015E			;15E
	.word anFairy015F			;15F
	.word anFairy0160			;160
	.word anFairy0161			;161
	.word anFairy0162			;162
	.word anFairy0163			;163
	.word anCubby0164			;164
	.word anJudy0165			;165
	.word anHeart0166			;166
	.word anFinalSkelMonstaL	;167
	.word anFinalSkelMonstaR	;168
	.word anFinalSkelMonstaSpawn;169
	.word anFinalSkelMonstaLeave;16A
	.word anSnaggerDie			;16B
	.word anBonusBall			;16C
	.word anBonusHead			;16D
	.word anBonusHand			;16E
	.word anIntroCubbySit		;16F
	.word anIntroJudySit		;170
	.word anIntroHeart			;171
	.word anFairyFlyL			;172
	.word anFairyFlyR			;173
	.word anBonusHand			;174
	.word anBonusHandUpLeft		;175
	.word anBonusHandDownRight	;176
	.word anBonusHandDownLeft	;177
	.word anBonusHandUpLeft		;178
	.word anBonusHandDownRight	;179
	.word anBonusHandDownLeft	;17A
	.word anIntroSkull			;17B
	.word anIntroDrunksHide		;17C
	.word anSpell				;17D
	.word anIntroCubbyFloat		;17E
	.word anIntroJudyTrapped	;17F
	.word anIntroJudyShout		;180
	.word anCubbyL				;181
	.word anBossJudyL			;182
	.word anIntroDrunksWalkL	;183
	.word anIntroDrunksWalkR	;184
	.word anIntroPlayerWalkL	;185
	.word anBarcelonL			;186
	.word anBarcelonLoseL		;187
	.word anBarcelonJumpL		;188
	.word anBarcelonFallL		;189
	.word anBarcelonR			;18A
	.word anBarcelonLoseR		;18B
	.word anBarcelonJumpR		;18C
	.word anBarcelonFallR		;18D
	.word anBarcelonWin			;18E
	.word anEndingPlayerWalkR	;18F
	.word anBigCoin				;190
	.word anBigBell				;191
	.word anBigTriangle			;192
	.word anBigDiamond			;193
	.word anBigPudding			;194
	.word anBigPineapple		;195
	.word anBigHamburger		;196
	.word anBigDessert			;197
	.word anBigFieldPeas		;198
	.word anJudyR				;199
	.word anJudyWalkR			;19A

anDummy:
	;00 0CA336 (0x018346)
	.word imgDummy_ofs
	.byte 255, 0

	.byte $FF

anPlayerL:
	;01 0CA33B (0x01834B)
	.word imgPlayerL_ofs
	.byte 255, chrPlayer_A_ID

	.byte $FF

anPlayerR:
	;02 0CA340 (0x018350)
	.word imgPlayerR_ofs
	.byte 255, chrPlayer_A_ID

	.byte $FF

anPlayerWalkL:
	;03 0CA345 (0x018355)
	.word imgPlayerL_ofs
	.byte 1, chrPlayer_A_ID

	.word imgPlayerL_ofs
	.byte 1, chrPlayer_B_ID

	.word imgPlayerL_ofs
	.byte 1, chrPlayer_C_ID

	.word imgPlayerL_ofs
	.byte 1, chrPlayer_D_ID

	.word imgPlayerL_ofs
	.byte 1, chrPlayer_E_ID

	.word imgPlayerL_ofs
	.byte 1, chrPlayer_F_ID

	.word imgPlayerL_ofs
	.byte 1, chrPlayer_G_ID

	.word imgPlayerL_ofs
	.byte 1, chrPlayer_H_ID

	.byte $FF

anPlayerWalkR:
	;04 0CA366 (0x018376)
	.word imgPlayerR_ofs
	.byte 1, chrPlayer_A_ID

	.word imgPlayerR_ofs
	.byte 1, chrPlayer_B_ID

	.word imgPlayerR_ofs
	.byte 1, chrPlayer_C_ID

	.word imgPlayerR_ofs
	.byte 1, chrPlayer_D_ID

	.word imgPlayerR_ofs
	.byte 1, chrPlayer_E_ID

	.word imgPlayerR_ofs
	.byte 1, chrPlayer_F_ID

	.word imgPlayerR_ofs
	.byte 1, chrPlayer_G_ID

	.word imgPlayerR_ofs
	.byte 1, chrPlayer_H_ID

	.byte $FF

anPlayerJumpL:
	;05 0CA387 (0x018397)
	.word imgPlayerJumpL_0_ofs
	.byte 2, chrPlayer_A_ID

	.word imgPlayerJumpL_0_ofs
	.byte 2, chrPlayer_B_ID

	.byte $FF

anPlayerJumpR:
	;06 0CA390 (0x0183A0)
	.word imgPlayerJumpR_0_ofs
	.byte 2, chrPlayer_A_ID

	.word imgPlayerJumpR_0_ofs
	.byte 2, chrPlayer_B_ID

	.byte $FF

anPlayerStartFallL:
	;07 0CA399 (0x0183A9)
	.word imgPlayerJumpL_0_ofs
	.byte 2, chrPlayer_J_ID

	.word imgPlayerJumpL_0_ofs
	.byte 2, chrPlayer_P_ID

	.byte $FF

anPlayerStartFallR:
	;08 0CA3A2 (0x0183B2)
	.word imgPlayerJumpR_0_ofs
	.byte 2, chrPlayer_J_ID

	.word imgPlayerJumpR_0_ofs
	.byte 2, chrPlayer_P_ID

	.byte $FF

anPlayerFallL:
	;09 0CA3AB (0x0183BB)
	.word imgPlayerJumpL_0_ofs
	.byte 2, chrPlayer_J_ID

	.word imgPlayerJumpL_0_ofs
	.byte 2, chrPlayer_P_ID

	.byte $FF

anPlayerFallR:
	;0A 0CA3B4 (0x0183C4)
	.word imgPlayerJumpR_0_ofs
	.byte 2, chrPlayer_J_ID

	.word imgPlayerJumpR_0_ofs
	.byte 2, chrPlayer_P_ID

	.byte $FF

anUNK0B:
	;0B 0CA3BD (0x0183CD)
	.word imgUNK0B_0_ofs
	.byte 2, chrPlayer_H_ID

	.word imgUNK0B_1_ofs
	.byte 2, chrPlayer_H_ID

	.byte $FF

anUNK0C:
	;0C 0CA3C6 (0x0183D6)
	.word imgUNK0B_1_ofs
	.byte 2, chrPlayer_H_ID

	.word imgUNK0B_0_ofs
	.byte 2, chrPlayer_H_ID

	.byte $FF

anPlayerWeakenL:
	;0D 0CA3CF (0x0183DF)
	.word imgUNK0B_0_ofs
	.byte 16, chrPlayer_G_ID

	.byte $FF

anPlayerWeakenR:
	;0E 0CA3D4 (0x0183E4)
	.word imgUNK0B_1_ofs
	.byte 16, chrPlayer_G_ID

	.byte $FF

anPlayerInhale1L:
	;0F 0CA3D9 (0x0183E9)
	.word imgUNK0B_0_ofs
	.byte 255, chrPlayer_A_ID

	.byte $FF

anPlayerInhale1R:
	;10 0CA3DE (0x0183EE)
	.word imgUNK0B_1_ofs
	.byte 255, chrPlayer_A_ID

	.byte $FF

anPlayerInhale2L:
	;19 0CA3E3 (0x0183F3)
	.word imgUNK0B_0_ofs
	.byte 255, chrPlayer_B_ID

	.byte $FF

anPlayerInhale2R:
	;1A 0CA3E8 (0x0183F8)
	.word imgUNK0B_1_ofs
	.byte 255, chrPlayer_B_ID

	.byte $FF

anPlayerInhale3L:
	;28 0CA3ED (0x0183FD)
	.word imgUNK0B_0_ofs
	.byte 255, chrPlayer_C_ID

	.byte $FF

anPlayerInhale3R:
	;29 0CA3F2 (0x018402)
	.word imgUNK0B_1_ofs
	.byte 255, chrPlayer_C_ID

	.byte $FF

anPlayerLoseL:
	;2C 0CA3F7 (0x018407)
	.word imgUNK0B_0_ofs
	.byte 255, chrPlayer_D_ID

	.byte $FF

anPlayerLoseR:
	;2D 0CA3FC (0x01840C)
	.word imgUNK0B_1_ofs
	.byte 255, chrPlayer_D_ID

	.byte $FF

anUNK35:
	;35 0CA401 (0x018411)
	.word imgUNK0B_0_ofs
	.byte 255, chrPlayer_E_ID

	.byte $FF

anUNK36:
	;36 0CA406 (0x018416)
	.word imgUNK0B_1_ofs
	.byte 255, chrPlayer_E_ID

	.byte $FF

anUNK11:
	;11 0CA40B (0x01841B)
	.word imgPlayerL_ofs
	.byte 2, chrPlayer_I_ID

	.word imgPlayerL_ofs
	.byte 2, chrPlayer_J_ID

	.word imgPlayerL_ofs
	.byte 2, chrPlayer_K_ID

	.byte $FF

anUNK12:
	;12 0CA418 (0x018428)
	.word imgPlayerR_ofs
	.byte 2, chrPlayer_I_ID

	.word imgPlayerR_ofs
	.byte 2, chrPlayer_J_ID

	.word imgPlayerR_ofs
	.byte 2, chrPlayer_K_ID

	.byte $FF

anUNK13:
	;13 0CA425 (0x018435)
	.word imgPlayerJumpL_0_ofs
	.byte 255, chrPlayer_C_ID

	.byte $FF

anUNK14:
	;14 0CA42A (0x01843A)
	.word imgPlayerJumpR_0_ofs
	.byte 255, chrPlayer_C_ID

	.byte $FF

anUNK15:
	;15 0CA42F (0x01843F)
	.word imgPlayerJumpL_0_ofs
	.byte 255, chrPlayer_D_ID

	.byte $FF

anUNK16:
	;16 0CA434 (0x018444)
	.word imgPlayerJumpR_0_ofs
	.byte 255, chrPlayer_D_ID

	.byte $FF

anUNK17:
	;17 0CA439 (0x018449)
	.word imgPlayerJumpL_0_ofs
	.byte 255, chrPlayer_K_ID

	.byte $FF

anUNK18:
	;18 0CA43E (0x01844E)
	.word imgPlayerJumpR_0_ofs
	.byte 255, chrPlayer_K_ID

	.byte $FF

anUNK1B:
	;1B 0CA443 (0x018453)
	.word imgUNK0B_0_ofs
	.byte 2, chrPlayer_I_ID

	.word imgUNK0B_0_ofs
	.byte 2, chrPlayer_J_ID

	.word imgUNK0B_0_ofs
	.byte 2, chrPlayer_K_ID

	.byte $FF

anUNK1C:
	;1C 0CA450 (0x018460)
	.word imgUNK0B_1_ofs
	.byte 2, chrPlayer_I_ID

	.word imgUNK0B_1_ofs
	.byte 2, chrPlayer_J_ID

	.word imgUNK0B_1_ofs
	.byte 2, chrPlayer_K_ID

	.byte $FF

anUNK1D:
	;1D 0CA45D (0x01846D)
	.word imgPlayerJumpL_0_ofs
	.byte 255, chrPlayer_E_ID

	.byte $FF

anUNK1E:
	;1E 0CA462 (0x018472)
	.word imgPlayerJumpR_0_ofs
	.byte 255, chrPlayer_E_ID

	.byte $FF

anUNK1F:
	;1F 0CA467 (0x018477)
	.word imgPlayerJumpL_0_ofs
	.byte 255, chrPlayer_F_ID

	.byte $FF

anUNK20:
	;20 0CA46C (0x01847C)
	.word imgPlayerJumpR_0_ofs
	.byte 255, chrPlayer_F_ID

	.byte $FF

anUNK21:
	;21 0CA471 (0x018481)
	.word imgPlayerJumpL_0_ofs
	.byte 255, chrPlayer_L_ID

	.byte $FF

anUNK22:
	;22 0CA476 (0x018486)
	.word imgPlayerJumpR_0_ofs
	.byte 255, chrPlayer_L_ID

	.byte $FF

anPlayerInhale4L:
	;23 0CA47B (0x01848B)
	.word imgPlayerJumpL_0_ofs
	.byte 6, chrPlayer_G_ID

	.word imgPlayerJumpL_0_ofs
	.byte 6, chrPlayer_H_ID

	.word imgPlayerJumpL_0_ofs
	.byte 6, chrPlayer_I_ID

	.word imgPlayerJumpL_0_ofs
	.byte 6, chrPlayer_H_ID

	.byte $FF

anPlayerInhale4R:
	;24 0CA48C (0x01849C)
	.word imgPlayerJumpR_0_ofs
	.byte 6, chrPlayer_G_ID

	.word imgPlayerJumpR_0_ofs
	.byte 6, chrPlayer_H_ID

	.word imgPlayerJumpR_0_ofs
	.byte 6, chrPlayer_I_ID

	.word imgPlayerJumpR_0_ofs
	.byte 6, chrPlayer_H_ID

	.byte $FF

anPlayerRoundStart:
	;25 0CA49D (0x0184AD)
	.word imgPlayerRoundStart_0_ofs
	.byte 6, chrPlayerTravel_A_ID

	.word imgPlayerRoundStart_1_ofs
	.byte 6, chrPlayerTravel_A_ID

	.byte $FF

anBubble:
	;27 0CA4A6 (0x0184B6)
	.word imgBubble_0_ofs
	.byte 4, 0

	.word imgBubble_1_ofs
	.byte 4, 0

	.byte $FF

anPlayerDie:
	;2A 0CA4AF (0x0184BF)
	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_L_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_M_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_N_ID

	.word imgPlayerJumpL_0_ofs
	.byte 3, chrPlayer_M_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_L_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_M_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_N_ID

	.word imgPlayerJumpL_0_ofs
	.byte 3, chrPlayer_M_ID

	.word imgPlayerJumpL_0_ofs
	.byte 3, chrPlayer_N_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_L_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_M_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_N_ID

	.word imgPlayerJumpL_0_ofs
	.byte 3, chrPlayer_M_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_L_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_M_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_N_ID

	.word imgPlayerJumpL_0_ofs
	.byte 3, chrPlayer_M_ID

	.word imgPlayerJumpL_0_ofs
	.byte 3, chrPlayer_N_ID

	.word imgUNK0B_0_ofs
	.byte 3, chrPlayer_O_ID

	.word imgPlayerJumpL_0_ofs
	.byte 3, chrPlayer_O_ID

	.byte $FF

anPlayerWin:
	;2B 0CA500 (0x018510)
	.word imgPlayerL_ofs
	.byte 8, chrPlayer_L_ID

	.word imgPlayerL_ofs
	.byte 6, chrPlayer_M_ID

	.word imgPlayerL_ofs
	.byte 6, chrPlayer_N_ID

	.byte $FF

anBubblePop:
	;2E 0CA50D (0x01851D)
	.word imgBubblePop_0_ofs
	.byte 2, 0

	.word imgBubblePop_1_ofs
	.byte 2, 0

	.byte $FF

anBubbleEmerge:
	;2F 0CA516 (0x018526)
	.word imgBubbleEmerge_0_ofs
	.byte 5, 0

	.word imgBubble_0_ofs
	.byte 255, 0

	.byte $FF

anBubbleWeak:
	;30 0CA51F (0x01852F)
	.word imgBubbleEmerge_0_ofs
	.byte 2, 0

	.word imgBubble_0_ofs
	.byte 2, 0

	.byte $FF

anPlayerShootL:
	;33 0CA528 (0x018538)
	.word imgUNK0B_0_ofs
	.byte 8, chrPlayer_F_ID

	.byte $FF

anPlayerShootR:
	;34 0CA52D (0x01853D)
	.word imgUNK0B_1_ofs
	.byte 8, chrPlayer_F_ID

	.byte $FF

anPlayerRotateR:
	;37 0CA532 (0x018542)
	.word imgPlayerRotateR_0_ofs
	.byte 3, chrPlayer_A_ID

	.word imgPlayerRotateR_0_ofs
	.byte 3, chrPlayer_D_ID

	.word imgPlayerRotateR_2_ofs
	.byte 3, chrPlayer_B_ID

	.word imgPlayerRotateR_2_ofs
	.byte 3, chrPlayer_C_ID

	.word imgPlayerRotateR_2_ofs
	.byte 3, chrPlayer_A_ID

	.word imgPlayerRotateR_2_ofs
	.byte 3, chrPlayer_D_ID

	.word imgPlayerRotateR_0_ofs
	.byte 3, chrPlayer_B_ID

	.word imgPlayerRotateR_0_ofs
	.byte 3, chrPlayer_C_ID

	.byte $FF

anPlayerRotateL:
	;26 0CA553 (0x018563)
	.word imgPlayerRotateL_0_ofs
	.byte 3, chrPlayer_A_ID

	.word imgPlayerRotateL_0_ofs
	.byte 3, chrPlayer_D_ID

	.word imgPlayerRotateL_2_ofs
	.byte 3, chrPlayer_B_ID

	.word imgPlayerRotateL_2_ofs
	.byte 3, chrPlayer_C_ID

	.word imgPlayerRotateL_2_ofs
	.byte 3, chrPlayer_A_ID

	.word imgPlayerRotateL_2_ofs
	.byte 3, chrPlayer_D_ID

	.word imgPlayerRotateL_0_ofs
	.byte 3, chrPlayer_B_ID

	.word imgPlayerRotateL_0_ofs
	.byte 3, chrPlayer_C_ID

	.byte $FF

anDoubleBubble:
	;31 0CA574 (0x018584)
	.word imgBubbleEmerge_0_ofs
	.byte 1, 0

	.word imgBubble_0_ofs
	.byte 1, 0

	.word imgDoubleBubble_2_ofs
	.byte 255, 0

	.byte $FF

anTripleBubble:
	;32 0CA581 (0x018591)
	.word imgBubbleEmerge_0_ofs
	.byte 1, 0

	.word imgBubble_0_ofs
	.byte 1, 0

	.word imgTripleBubble_2_ofs
	.byte 255, 0

	.byte $FF

anPlayerGameOver:
	;D2 0CA58E (0x01859E)
	.word imgPlayerGameOver_0_ofs
	.byte 8, chrGameOver_ID

	.word imgPlayerGameOver_1_ofs
	.byte 8, chrGameOver_ID

	.byte $FF

anPlayerContinue:
	;D3 0CA597 (0x0185A7)
	.word imgPlayerContinue_ofs
	.byte 255, chrGameOver_ID

	.byte $FF

anZenChanL:
	;3C 0CA59C (0x0185AC)
	.word imgZenChanL_0_ofs
	.byte 2, chrZenChan_ID

	.word imgZenChanL_1_ofs
	.byte 2, chrZenChan_ID

	.word imgZenChanL_2_ofs
	.byte 2, chrZenChan_ID

	.word imgZenChanL_3_ofs
	.byte 2, chrZenChan_ID

	.byte $FF

anZenChanR:
	;3D 0CA5AD (0x0185BD)
	.word imgZenChanR_0_ofs
	.byte 2, chrZenChan_ID

	.word imgZenChanR_1_ofs
	.byte 2, chrZenChan_ID

	.word imgZenChanR_2_ofs
	.byte 2, chrZenChan_ID

	.word imgZenChanR_3_ofs
	.byte 2, chrZenChan_ID

	.byte $FF

anMonstaL:
	;3E 0CA5BE (0x0185CE)
	.word imgZenChanL_0_ofs
	.byte 4, chrMonsta_ID

	.word imgZenChanL_1_ofs
	.byte 4, chrMonsta_ID

	.byte $FF

anMonstaR:
	;3F 0CA5C7 (0x0185D7)
	.word imgZenChanR_0_ofs
	.byte 4, chrMonsta_ID

	.word imgZenChanR_1_ofs
	.byte 4, chrMonsta_ID

	.byte $FF

anNeedler:
	;40 0CA5D0 (0x0185E0)
	.word imgNeedler_0_ofs
	.byte 4, chrNeedler_ID

	.word imgNeedler_1_ofs
	.byte 4, chrNeedler_ID

	.word imgNeedler_1_ofs
	.byte 1, chrNeedler_ID

	.word imgNeedler_1_ofs
	.byte 1, chrNeedler_ID

	.word imgNeedler_1_ofs
	.byte 1, chrNeedler_ID

	.word imgNeedler_1_ofs
	.byte 3, chrNeedler_ID

	.byte $FF

anSnaggerL:
	;41 0CA5E9 (0x0185F9)
	.word imgSnaggerL_0_ofs
	.byte 4, chrSnagger_ID

	.word imgSnaggerL_1_ofs
	.byte 4, chrSnagger_ID

	.byte $FF

anSnaggerR:
	;42 0CA5F2 (0x018602)
	.word imgSnaggerR_0_ofs
	.byte 4, chrSnagger_ID

	.word imgSnaggerR_1_ofs
	.byte 4, chrSnagger_ID

	.byte $FF

anBanebouL:
	;43 0CA5FB (0x01860B)
	.word imgBanebouL_0_ofs
	.byte 255, chrBanebou_ID

	.word imgBanebouL_1_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanL_3_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanL_2_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanL_1_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanL_0_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanR_1_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanR_2_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanR_3_ofs
	.byte 255, chrBanebou_ID

	.word imgBanebouL_9_ofs
	.byte 255, chrBanebou_ID

	.byte $FF

anBanebouR:
	;44 0CA624 (0x018634)
	.word imgBanebouL_0_ofs
	.byte 255, chrBanebou_ID

	.word imgBanebouL_9_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanR_3_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanR_2_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanR_1_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanL_0_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanL_1_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanL_2_ofs
	.byte 255, chrBanebou_ID

	.word imgZenChanL_3_ofs
	.byte 255, chrBanebou_ID

	.word imgBanebouL_1_ofs
	.byte 255, chrBanebou_ID

	.byte $FF

anBlobbyL:
	;45 0CA64D (0x01865D)
	.word imgZenChanL_0_ofs
	.byte 2, chrBlobby_ID

	.word imgZenChanL_1_ofs
	.byte 2, chrBlobby_ID

	.byte $FF

anBlobbyR:
	;46 0CA656 (0x018666)
	.word imgZenChanR_0_ofs
	.byte 2, chrBlobby_ID

	.word imgZenChanR_1_ofs
	.byte 2, chrBlobby_ID

	.byte $FF

anPulpul:
	;47 0CA65F (0x01866F)
	.word imgZenChanL_0_ofs
	.byte 2, chrPulpul_ID

	.word imgZenChanL_1_ofs
	.byte 2, chrPulpul_ID

	.word imgZenChanL_2_ofs
	.byte 2, chrPulpul_ID

	.word imgZenChanL_3_ofs
	.byte 2, chrPulpul_ID

	.byte $FF

anInvader:
	;48 0CA670 (0x018680)
	.word imgZenChanL_0_ofs
	.byte 2, chrInvader_ID

	.word imgZenChanL_1_ofs
	.byte 2, chrInvader_ID

	.word imgZenChanL_2_ofs
	.byte 2, chrInvader_ID

	.word imgZenChanL_3_ofs
	.byte 2, chrInvader_ID

	.byte $FF

anHeitaiKunL:
	;49 0CA681 (0x018691)
	.word imgZenChanL_0_ofs
	.byte 2, chrHeitaiKun_ID

	.word imgZenChanL_1_ofs
	.byte 2, chrHeitaiKun_ID

	.byte $FF

anHeitaiKunR:
	;4A 0CA68A (0x01869A)
	.word imgZenChanR_0_ofs
	.byte 2, chrHeitaiKun_ID

	.word imgZenChanR_1_ofs
	.byte 2, chrHeitaiKun_ID

	.byte $FF

anCarryHeliL:
	;4B 0CA693 (0x0186A3)
	.word imgCarryHeliL_0_ofs
	.byte 2, chrCarryHeli_ID

	.word imgCarryHeliL_1_ofs
	.byte 2, chrCarryHeli_ID

	.byte $FF

anCarryHeliR:
	;4C 0CA69C (0x0186AC)
	.word imgCarryHeliR_0_ofs
	.byte 2, chrCarryHeli_ID

	.word imgCarryHeliR_1_ofs
	.byte 2, chrCarryHeli_ID

	.byte $FF

anFlarion:
	;4D 0CA6A5 (0x0186B5)
	.word imgFlarion_0_ofs
	.byte 2, chrFlarion_ID

	.word imgFlarion_1_ofs
	.byte 2, chrFlarion_ID

	.byte $FF

anManticharL:
	;4E 0CA6AE (0x0186BE)
	.word imgManticharL_0_ofs
	.byte 3, chrMantichar_ID

	.word imgManticharL_1_ofs
	.byte 3, chrMantichar_ID

	.word imgManticharL_2_ofs
	.byte 3, chrMantichar_ID

	.word imgManticharL_1_ofs
	.byte 3, chrMantichar_ID

	.byte $FF

anManticharR:
	;4F 0CA6BF (0x0186CF)
	.word imgManticharR_0_ofs
	.byte 3, chrMantichar_ID

	.word imgManticharR_1_ofs
	.byte 3, chrMantichar_ID

	.word imgManticharR_2_ofs
	.byte 3, chrMantichar_ID

	.word imgManticharR_1_ofs
	.byte 3, chrMantichar_ID

	.byte $FF

anRoboZenL:
	;50 0CA6D0 (0x0186E0)
	.word imgRoboZenL_0_ofs
	.byte 8, chrRoboZen_A_ID

	.word imgRoboZenL_0_ofs
	.byte 8, chrRoboZen_B_ID

	.word imgRoboZenL_0_ofs
	.byte 8, chrRoboZen_C_ID

	.word imgRoboZenL_0_ofs
	.byte 8, chrRoboZen_D_ID

	.byte $FF

anRoboZenR:
	;51 0CA6E1 (0x0186F1)
	.word imgRoboZenR_0_ofs
	.byte 8, chrRoboZen_A_ID

	.word imgRoboZenR_0_ofs
	.byte 8, chrRoboZen_B_ID

	.word imgRoboZenR_0_ofs
	.byte 8, chrRoboZen_C_ID

	.word imgRoboZenR_0_ofs
	.byte 8, chrRoboZen_D_ID

	.byte $FF

anRoboZenHandL:
	;52 0CA6F2 (0x018702)
	.word imgRoboZenHandL_0_ofs
	.byte 4, 0

	.word imgRoboZenHandL_1_ofs
	.byte 4, 0

	.byte $FF

anRoboZenHandR:
	;53 0CA6FB (0x01870B)
	.word imgRoboZenHandR_0_ofs
	.byte 4, 0

	.word imgRoboZenHandR_1_ofs
	.byte 4, 0

	.byte $FF

anKirikabun:
	;54 0CA704 (0x018714)
	.word imgKirikabun_ofs
	.byte 255, chrKirikabun_ID

	.byte $FF

anFlutterfly:
	;55 0CA709 (0x018719)
	.word imgFlutterfly_0_ofs
	.byte 2, chrKirikabun_ID

	.word imgFlutterfly_1_ofs
	.byte 2, chrKirikabun_ID

	.byte $FF

anUNK56:
	;56 0CA712 (0x018722)
	.word imgUNK56_0_ofs
	.byte 2, chrKirikabun_ID

	.word imgUNK56_1_ofs
	.byte 2, chrKirikabun_ID

	.byte $FF

anTwizzerSpin:
	;57 0CA71B (0x01872B)
	.word imgTwizzerSpin_0_ofs
	.byte 2, chrTwizzer_ID

	.word imgTwizzerSpin_1_ofs
	.byte 2, chrTwizzer_ID

	.word imgTwizzerSpin_2_ofs
	.byte 2, chrTwizzer_ID

	.byte $FF

anDrunkL:
	;58 0CA728 (0x018738)
	.word imgDrunkL_0_ofs
	.byte 2, chrDrunk_A_ID

	.word imgDrunkL_1_ofs
	.byte 2, chrDrunk_A_ID

	.word imgDrunkL_2_ofs
	.byte 2, chrDrunk_A_ID

	.word imgDrunkL_3_ofs
	.byte 2, chrDrunk_A_ID

	.word imgDrunkL_2_ofs
	.byte 2, chrDrunk_A_ID

	.word imgDrunkL_1_ofs
	.byte 2, chrDrunk_A_ID

	.byte $FF

anDrunkR:
	;59 0CA741 (0x018751)
	.word imgDrunkR_0_ofs
	.byte 2, chrDrunk_A_ID

	.word imgDrunkR_1_ofs
	.byte 2, chrDrunk_A_ID

	.word imgDrunkR_2_ofs
	.byte 2, chrDrunk_A_ID

	.word imgDrunkR_3_ofs
	.byte 2, chrDrunk_A_ID

	.word imgDrunkR_2_ofs
	.byte 2, chrDrunk_A_ID

	.word imgDrunkR_1_ofs
	.byte 2, chrDrunk_A_ID

	.byte $FF

anZenChanTrapped:
	;5B 0CA75A (0x01876A)
	.word imgRoboZenHandL_0_ofs
	.byte 3, chrZenChan_ID

	.word imgRoboZenHandL_1_ofs
	.byte 3, chrZenChan_ID

	.word imgZenChanTrapped_2_ofs
	.byte 3, chrZenChan_ID

	.word imgRoboZenHandL_1_ofs
	.byte 3, chrZenChan_ID

	.byte $FF

anBanebouTrapped:
	;5C 0CA76B (0x01877B)
	.word imgRoboZenHandL_0_ofs
	.byte 3, chrBanebou_ID

	.word imgRoboZenHandL_1_ofs
	.byte 3, chrBanebou_ID

	.word imgZenChanTrapped_2_ofs
	.byte 3, chrBanebou_ID

	.word imgRoboZenHandL_1_ofs
	.byte 3, chrBanebou_ID

	.byte $FF

anBlobbyTrapped:
	;5D 0CA77C (0x01878C)
	.word imgBlobbyTrapped_0_ofs
	.byte 3, chrBlobby_ID

	.word imgBlobbyTrapped_1_ofs
	.byte 3, chrBlobby_ID

	.word imgBlobbyTrapped_2_ofs
	.byte 3, chrBlobby_ID

	.word imgBlobbyTrapped_1_ofs
	.byte 3, chrBlobby_ID

	.byte $FF

anPulpulTrapped:
	;5E 0CA78D (0x01879D)
	.word imgRoboZenHandL_0_ofs
	.byte 3, chrPulpul_ID

	.word imgRoboZenHandL_1_ofs
	.byte 3, chrPulpul_ID

	.word imgZenChanTrapped_2_ofs
	.byte 3, chrPulpul_ID

	.word imgRoboZenHandL_1_ofs
	.byte 3, chrPulpul_ID

	.byte $FF

anNeedlerTrapped:
	;5F 0CA79E (0x0187AE)
	.word imgZenChanTrapped_2_ofs
	.byte 3, chrNeedler_ID

	.word imgNeedlerTrapped_1_ofs
	.byte 3, chrNeedler_ID

	.word imgBlobbyTrapped_0_ofs
	.byte 3, chrNeedler_ID

	.word imgNeedlerTrapped_1_ofs
	.byte 3, chrNeedler_ID

	.byte $FF

anInvaderTrapped:
	;60 0CA7AF (0x0187BF)
	.word imgInvaderTrapped_0_ofs
	.byte 3, chrInvader_ID

	.word imgInvaderTrapped_1_ofs
	.byte 3, chrInvader_ID

	.word imgRoboZenHandL_0_ofs
	.byte 3, chrInvader_ID

	.word imgInvaderTrapped_1_ofs
	.byte 3, chrInvader_ID

	.byte $FF

anMonstaTrapped:
	;61 0CA7C0 (0x0187D0)
	.word imgRoboZenHandL_0_ofs
	.byte 3, chrMonsta_ID

	.word imgRoboZenHandL_1_ofs
	.byte 3, chrMonsta_ID

	.word imgZenChanTrapped_2_ofs
	.byte 3, chrMonsta_ID

	.word imgRoboZenHandL_1_ofs
	.byte 3, chrMonsta_ID

	.byte $FF

anHeitaiKunTrapped:
	;62 0CA7D1 (0x0187E1)
	.word imgRoboZenHandL_1_ofs
	.byte 3, chrHeitaiKun_ID

	.word imgZenChanTrapped_2_ofs
	.byte 3, chrHeitaiKun_ID

	.byte $FF

anDrunkTrapped:
	;6A 0CA7DA (0x0187EA)
	.word imgRoboZenHandL_1_ofs
	.byte 3, chrDrunk_B_ID

	.word imgZenChanTrapped_2_ofs
	.byte 3, chrDrunk_B_ID

	.word imgNeedlerTrapped_1_ofs
	.byte 3, chrDrunk_B_ID

	.word imgZenChanTrapped_2_ofs
	.byte 3, chrDrunk_B_ID

	.byte $FF

anZenChanTurnL:
	;69 0CA7EB (0x0187FB)
	.word imgBanebouL_9_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_0_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_1_ofs
	.byte 2, chrZenChan_ID

	.byte $FF

anZenChanTurnR:
	;6D 0CA7F8 (0x018808)
	.word imgBanebouL_1_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_0_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_9_ofs
	.byte 2, chrZenChan_ID

	.byte $FF

anGhostMonstaL:
	;6E 0CA805 (0x018815)
	.word imgZenChanL_2_ofs
	.byte 4, chrMonsta_ID

	.word imgZenChanL_3_ofs
	.byte 4, chrMonsta_ID

	.byte $FF

anGhostMonstaR:
	;6F 0CA80E (0x01881E)
	.word imgZenChanR_2_ofs
	.byte 4, chrMonsta_ID

	.word imgZenChanR_3_ofs
	.byte 4, chrMonsta_ID

	.byte $FF

anGhostMonstaReveal:
	;70 0CA817 (0x018827)
	.word imgBanebouL_1_ofs
	.byte 4, chrMonsta_ID

	.word imgBanebouL_0_ofs
	.byte 4, chrMonsta_ID

	.byte $FF

anNeedlerExposed:
	;D5 0CA820 (0x018830)
	.word imgNeedlerExposed_0_ofs
	.byte 4, chrNeedler_ID

	.word imgNeedlerExposed_1_ofs
	.byte 4, chrNeedler_ID

	.byte $FF

anSnaggerAttackL:
	;73 0CA829 (0x018839)
	.word imgSnaggerAttackL_0_ofs
	.byte 4, chrSnagger_ID

	.word imgSnaggerAttackL_1_ofs
	.byte 3, chrSnagger_ID

	.word imgSnaggerAttackL_2_ofs
	.byte 2, chrSnagger_ID

	.word imgSnaggerAttackL_3_ofs
	.byte 2, chrSnagger_ID

	.word imgSnaggerAttackL_2_ofs
	.byte 2, chrSnagger_ID

	.word imgSnaggerAttackL_1_ofs
	.byte 3, chrSnagger_ID

	.word imgSnaggerAttackL_0_ofs
	.byte 4, chrSnagger_ID

	.word imgSnaggerL_0_ofs
	.byte 8, chrSnagger_ID

	.byte $FF

anSnaggerAttackR:
	;74 0CA84A (0x01885A)
	.word imgSnaggerAttackR_0_ofs
	.byte 4, chrSnagger_ID

	.word imgSnaggerAttackR_1_ofs
	.byte 3, chrSnagger_ID

	.word imgSnaggerAttackR_2_ofs
	.byte 2, chrSnagger_ID

	.word imgSnaggerAttackR_3_ofs
	.byte 2, chrSnagger_ID

	.word imgSnaggerAttackR_2_ofs
	.byte 2, chrSnagger_ID

	.word imgSnaggerAttackR_1_ofs
	.byte 3, chrSnagger_ID

	.word imgSnaggerAttackR_0_ofs
	.byte 4, chrSnagger_ID

	.word imgSnaggerR_0_ofs
	.byte 8, chrSnagger_ID

	.byte $FF

anBlobbyCeilL:
	;77 0CA86B (0x01887B)
	.word imgBlobbyCeilL_0_ofs
	.byte 4, chrBlobby_ID

	.word imgBlobbyCeilL_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyCeilR:
	;78 0CA874 (0x018884)
	.word imgBlobbyCeilR_0_ofs
	.byte 4, chrBlobby_ID

	.word imgBlobbyCeilR_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyOverL:
	;79 0CA87D (0x01888D)
	.word imgZenChanL_2_ofs
	.byte 4, chrBlobby_ID

	.word imgZenChanL_3_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyOverR:
	;7A 0CA886 (0x018896)
	.word imgZenChanR_2_ofs
	.byte 4, chrBlobby_ID

	.word imgZenChanR_3_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyUnderL:
	;7B 0CA88F (0x01889F)
	.word imgBlobbyUnderL_0_ofs
	.byte 4, chrBlobby_ID

	.word imgBlobbyUnderL_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyUnderR:
	;7C 0CA898 (0x0188A8)
	.word imgBlobbyUnderR_0_ofs
	.byte 4, chrBlobby_ID

	.word imgBlobbyUnderR_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyUpL:
	;7D 0CA8A1 (0x0188B1)
	.word imgInvaderTrapped_0_ofs
	.byte 4, chrBlobby_ID

	.word imgInvaderTrapped_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyUpR:
	;7E 0CA8AA (0x0188BA)
	.word imgBlobbyUpR_0_ofs
	.byte 4, chrBlobby_ID

	.word imgBlobbyUpR_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyFlyDownL:
	;7F 0CA8B3 (0x0188C3)
	.word imgRoboZenHandL_0_ofs
	.byte 4, chrBlobby_ID

	.word imgRoboZenHandL_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyFlyDownR:
	;80 0CA8BC (0x0188CC)
	.word imgRoboZenHandR_0_ofs
	.byte 4, chrBlobby_ID

	.word imgRoboZenHandR_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyDownL:
	;81 0CA8C5 (0x0188D5)
	.word imgBlobbyDownL_0_ofs
	.byte 4, chrBlobby_ID

	.word imgBlobbyDownL_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyDownR:
	;82 0CA8CE (0x0188DE)
	.word imgBlobbyDownR_0_ofs
	.byte 4, chrBlobby_ID

	.word imgBlobbyDownR_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyFlyUpL:
	;83 0CA8D7 (0x0188E7)
	.word imgBlobbyFlyUpL_0_ofs
	.byte 4, chrBlobby_ID

	.word imgBlobbyFlyUpL_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anBlobbyFlyUpR:
	;84 0CA8E0 (0x0188F0)
	.word imgBlobbyFlyUpR_0_ofs
	.byte 4, chrBlobby_ID

	.word imgBlobbyFlyUpR_1_ofs
	.byte 4, chrBlobby_ID

	.byte $FF

anPulpulBlink:
	;9A 0CA8E9 (0x0188F9)
	.word imgBanebouL_1_ofs
	.byte 4, chrPulpul_ID

	.word imgBanebouL_0_ofs
	.byte 4, chrPulpul_ID

	.byte $FF

anHeitaiKunExposedL:
	;87 0CA8F2 (0x018902)
	.word imgZenChanL_2_ofs
	.byte 4, chrHeitaiKun_ID

	.word imgZenChanL_3_ofs
	.byte 4, chrHeitaiKun_ID

	.byte $FF

anHeitaiKunExposedR:
	;88 0CA8FB (0x01890B)
	.word imgZenChanR_2_ofs
	.byte 4, chrHeitaiKun_ID

	.word imgZenChanR_3_ofs
	.byte 4, chrHeitaiKun_ID

	.byte $FF

anHeitaiKunHelmetL:
	;89 0CA904 (0x018914)
	.word imgBanebouL_1_ofs
	.byte 255, chrHeitaiKun_ID

	.byte $FF

anHeitaiKunHelmetR:
	;8A 0CA909 (0x018919)
	.word imgBanebouL_9_ofs
	.byte 255, chrHeitaiKun_ID

	.byte $FF

anCarryHeliOpenL:
	;8B 0CA90E (0x01891E)
	.word imgCarryHeliOpenL_0_ofs
	.byte 2, chrCarryHeli_ID

	.word imgCarryHeliOpenL_1_ofs
	.byte 16, chrCarryHeli_ID

	.byte $FF

anCarryHeliOpenR:
	;8C 0CA917 (0x018927)
	.word imgCarryHeliOpenR_0_ofs
	.byte 2, chrCarryHeli_ID

	.word imgCarryHeliOpenR_1_ofs
	.byte 16, chrCarryHeli_ID

	.byte $FF

anFlarionShrunk:
	;8D 0CA920 (0x018930)
	.word imgFlarionShrunk_0_ofs
	.byte 4, chrFlarion_ID

	.word imgFlarionShrunk_1_ofs
	.byte 4, chrFlarion_ID

	.byte $FF

anFlarionSmall:
	;8E 0CA929 (0x018939)
	.word imgFlarionSmall_0_ofs
	.byte 4, chrFlarion_ID

	.word imgFlarionSmall_1_ofs
	.byte 4, chrFlarion_ID

	.byte $FF

anFlarionSmaller:
	;8F 0CA932 (0x018942)
	.word imgFlarionSmaller_0_ofs
	.byte 4, chrFlarion_ID

	.word imgFlarionSmaller_1_ofs
	.byte 4, chrFlarion_ID

	.byte $FF

anFlarionSmallest:
	;90 0CA93B (0x01894B)
	.word imgFlarionSmallest_0_ofs
	.byte 4, chrFlarion_ID

	.word imgFlarionSmallest_1_ofs
	.byte 4, chrFlarion_ID

	.byte $FF

anManticharAngryL:
	;91 0CA944 (0x018954)
	.word imgManticharL_0_ofs
	.byte 4, chrMantichar_ID

	.word imgManticharAngryL_1_ofs
	.byte 4, chrMantichar_ID

	.word imgManticharL_0_ofs
	.byte 4, chrMantichar_ID

	.word imgManticharAngryL_3_ofs
	.byte 4, chrMantichar_ID

	.byte $FF

anManticharAngryR:
	;92 0CA955 (0x018965)
	.word imgManticharR_0_ofs
	.byte 4, chrMantichar_ID

	.word imgManticharAngryR_1_ofs
	.byte 4, chrMantichar_ID

	.word imgManticharR_0_ofs
	.byte 4, chrMantichar_ID

	.word imgManticharAngryR_3_ofs
	.byte 4, chrMantichar_ID

	.byte $FF

anRoboZenShootL:
	;93 0CA966 (0x018976)
	.word imgRoboZenShootL_ofs
	.byte 255, chrRoboZen_A_ID

	.byte $FF

anRoboZenShootR:
	;94 0CA96B (0x01897B)
	.word imgRoboZenShootR_ofs
	.byte 255, chrRoboZen_A_ID

	.byte $FF

anRoboZenWindingL:
	;95 0CA970 (0x018980)
	.word imgRoboZenL_0_ofs
	.byte 2, chrRoboZen_B_ID

	.word imgRoboZenWindingL_1_ofs
	.byte 5, chrRoboZen_B_ID

	.word imgRoboZenWindingL_2_ofs
	.byte 8, chrRoboZen_B_ID

	.word imgRoboZenWindingL_3_ofs
	.byte 5, chrRoboZen_B_ID

	.byte $FF

anRoboZenWindingR:
	;96 0CA981 (0x018991)
	.word imgRoboZenR_0_ofs
	.byte 2, chrRoboZen_B_ID

	.word imgRoboZenWindingR_1_ofs
	.byte 5, chrRoboZen_B_ID

	.word imgRoboZenWindingR_2_ofs
	.byte 8, chrRoboZen_B_ID

	.word imgRoboZenWindingR_3_ofs
	.byte 5, chrRoboZen_B_ID

	.byte $FF

anHandWindingL:
	;97 0CA992 (0x0189A2)
	.word imgZenChanTrapped_2_ofs
	.byte 3, 0

	.word imgNeedlerTrapped_1_ofs
	.byte 3, 0

	.word imgBlobbyTrapped_0_ofs
	.byte 8, 0

	.byte $FF

anHandWindingR:
	;98 0CA99F (0x0189AF)
	.word imgHandWindingR_0_ofs
	.byte 3, 0

	.word imgHandWindingR_1_ofs
	.byte 3, 0

	.word imgHandWindingR_2_ofs
	.byte 8, 0

	.byte $FF

anKirikabunBlink:
	;99 0CA9AC (0x0189BC)
	.word imgKirikabunBlink_ofs
	.byte 255, chrKirikabun_ID

	.byte $FF

anFlutterflyTrapped:
	;6B 0CA9B1 (0x0189C1)
	.word imgFlutterflyTrapped_0_ofs
	.byte 3, chrKirikabun_ID

	.word imgFlutterflyTrapped_1_ofs
	.byte 3, chrKirikabun_ID

	.word imgFlutterflyTrapped_2_ofs
	.byte 3, chrKirikabun_ID

	.word imgFlutterflyTrapped_1_ofs
	.byte 3, chrKirikabun_ID

	.byte $FF

anTwizzer:
	;9C 0CA9C2 (0x0189D2)
	.word imgTwizzer_ofs
	.byte 255, chrTwizzer_ID

	.byte $FF

anDrunkThrowL:
	;9D 0CA9C7 (0x0189D7)
	.word imgDrunkL_0_ofs
	.byte 4, chrDrunk_B_ID

	.word imgDrunkL_1_ofs
	.byte 4, chrDrunk_B_ID

	.byte $FF

anDrunkThrowR:
	;9E 0CA9D0 (0x0189E0)
	.word imgDrunkR_0_ofs
	.byte 4, chrDrunk_B_ID

	.word imgDrunkR_1_ofs
	.byte 4, chrDrunk_B_ID

	.byte $FF

anZenChanDie:
	;9F 0CA9D9 (0x0189E9)
	.word imgInvaderTrapped_0_ofs
	.byte 2, chrZenChan_ID

	.word imgInvaderTrapped_1_ofs
	.byte 2, chrZenChan_ID

	.word imgBlobbyDownR_0_ofs
	.byte 2, chrZenChan_ID

	.word imgBlobbyDownR_1_ofs
	.byte 2, chrZenChan_ID

	.byte $FF

anMonstaDie:
	;A0 0CA9EA (0x0189FA)
	.word imgInvaderTrapped_0_ofs
	.byte 2, chrMonsta_ID

	.word imgInvaderTrapped_1_ofs
	.byte 2, chrMonsta_ID

	.word imgBlobbyDownR_0_ofs
	.byte 2, chrMonsta_ID

	.word imgBlobbyDownR_1_ofs
	.byte 2, chrMonsta_ID

	.byte $FF

anNeedlerDie:
	;A1 0CA9FB (0x018A0B)
	.word imgBlobbyTrapped_1_ofs
	.byte 2, chrNeedler_ID

	.word imgBlobbyTrapped_2_ofs
	.byte 2, chrNeedler_ID

	.word imgNeedlerDie_2_ofs
	.byte 2, chrNeedler_ID

	.word imgNeedlerDie_3_ofs
	.byte 2, chrNeedler_ID

	.byte $FF

anBanebouDie:
	;A2 0CAA0C (0x018A1C)
	.word imgInvaderTrapped_0_ofs
	.byte 2, chrBanebou_ID

	.word imgInvaderTrapped_1_ofs
	.byte 2, chrBanebou_ID

	.word imgBlobbyDownR_0_ofs
	.byte 2, chrBanebou_ID

	.word imgBlobbyDownR_1_ofs
	.byte 2, chrBanebou_ID

	.byte $FF

anBlobbyDie:
	;A3 0CAA1D (0x018A2D)
	.word imgZenChanTrapped_2_ofs
	.byte 2, chrBlobby_ID

	.word imgNeedlerTrapped_1_ofs
	.byte 2, chrBlobby_ID

	.word imgBlobbyDie_2_ofs
	.byte 2, chrBlobby_ID

	.word imgBlobbyDie_3_ofs
	.byte 2, chrBlobby_ID

	.byte $FF

anPulpulDie:
	;A4 0CAA2E (0x018A3E)
	.word imgInvaderTrapped_0_ofs
	.byte 2, chrPulpul_ID

	.word imgInvaderTrapped_1_ofs
	.byte 2, chrPulpul_ID

	.word imgBlobbyDownR_0_ofs
	.byte 2, chrPulpul_ID

	.word imgBlobbyDownR_1_ofs
	.byte 2, chrPulpul_ID

	.byte $FF

anInvaderDie:
	;A5 0CAA3F (0x018A4F)
	.word imgBanebouL_1_ofs
	.byte 2, chrInvader_ID

	.word imgBanebouL_0_ofs
	.byte 2, chrInvader_ID

	.word imgInvaderDie_2_ofs
	.byte 2, chrInvader_ID

	.word imgInvaderDie_3_ofs
	.byte 2, chrInvader_ID

	.byte $FF

anHeitaiKunDie:
	;A6 0CAA50 (0x018A60)
	.word imgInvaderTrapped_1_ofs
	.byte 2, chrHeitaiKun_ID

	.word imgRoboZenHandL_0_ofs
	.byte 2, chrHeitaiKun_ID

	.word imgBlobbyDownR_1_ofs
	.byte 2, chrHeitaiKun_ID

	.word imgBlobbyFlyUpR_0_ofs
	.byte 2, chrHeitaiKun_ID

	.byte $FF

anCarryHeliDieL:
	;A7 0CAA61 (0x018A71)
	.word imgCarryHeliDieL_ofs
	.byte 255, chrCarryHeli_ID

	.byte $FF

anCarryHeliDieR:
	;A8 0CAA66 (0x018A76)
	.word imgCarryHeliDieR_ofs
	.byte 255, chrCarryHeli_ID

	.byte $FF

anManticharDie:
	;A9 0CAA6B (0x018A7B)
	.word imgManticharAngryL_1_ofs
	.byte 2, chrMantichar_ID

	.word imgManticharAngryR_1_ofs
	.byte 2, chrMantichar_ID

	.byte $FF

anFlutterflyDie:
	;AC 0CAA74 (0x018A84)
	.word imgFlutterflyDie_0_ofs
	.byte 2, chrKirikabun_ID

	.word imgFlutterflyDie_1_ofs
	.byte 2, chrKirikabun_ID

	.word imgFlutterflyDie_2_ofs
	.byte 2, chrKirikabun_ID

	.word imgFlutterflyDie_3_ofs
	.byte 2, chrKirikabun_ID

	.byte $FF

anTwizzerDie:
	;AD 0CAA85 (0x018A95)
	.word imgTwizzerDie_0_ofs
	.byte 4, chrTwizzer_ID

	.word imgTwizzerDie_1_ofs
	.byte 4, chrTwizzer_ID

	.word imgTwizzerDie_2_ofs
	.byte 4, chrTwizzer_ID

	.byte $FF

anDrunkDie:
	;AE 0CAA92 (0x018AA2)
	.word imgDrunkDie_0_ofs
	.byte 2, chrDrunk_B_ID

	.word imgDrunkDie_1_ofs
	.byte 2, chrDrunk_B_ID

	.word imgDrunkDie_2_ofs
	.byte 2, chrDrunk_B_ID

	.word imgDrunkDie_3_ofs
	.byte 2, chrDrunk_B_ID

	.byte $FF

anKirikabunDie:
	;AB 0CAAA3 (0x018AB3)
	.word imgKirikabun_ofs
	.byte 2, chrKirikabun_ID

	.word imgKirikabunDie_1_ofs
	.byte 2, chrKirikabun_ID

	.word imgKirikabunDie_2_ofs
	.byte 2, chrKirikabun_ID

	.word imgKirikabunDie_3_ofs
	.byte 2, chrKirikabun_ID

	.byte $FF

anNeedlerSyringe:
	;AF 0CAAB4 (0x018AC4)
	.word imgRounderTrapped_0_ofs
	.byte 255, chrNeedler_ID

	.byte $FF

anInvaderBeam:
	;B0 0CAAB9 (0x018AC9)
	.word imgInvaderBeam_0_ofs
	.byte 2, chrInvader_ID

	.word imgInvaderBeam_1_ofs
	.byte 2, chrInvader_ID

	.byte $FF

anInvaderBlast:
	;75 0CAAC2 (0x018AD2)
	.word imgZenChanTrapped_2_ofs
	.byte 255, chrInvader_ID

	.byte $FF

anHeitaiKunPara:
	;B1 0CAAC7 (0x018AD7)
	.word imgHeitaiKunPara_0_ofs
	.byte 4, chrHeitaiKun_ID

	.word imgHeitaiKunPara_1_ofs
	.byte 4, chrHeitaiKun_ID

	.byte $FF

anHeitaiKunParaLand:
	;B2 0CAAD0 (0x018AE0)
	.word imgHeitaiKunParaLand_ofs
	.byte 255, chrHeitaiKun_ID

	.byte $FF

anFlarionFlame:
	;B3 0CAAD5 (0x018AE5)
	.word imgFlarionFlame_0_ofs
	.byte 2, chrFlarion_ID

	.word imgFlarionFlame_1_ofs
	.byte 2, chrFlarion_ID

	.byte $FF

anRoboZenMissileLeft:
	;B4 0CAADE (0x018AEE)
	.word imgBlobbyTrapped_1_ofs
	.byte 255, 0

	.byte $FF

anRoboZenMissileDownLeft:
	;B5 0CAAE3 (0x018AF3)
	.word imgBlobbyTrapped_2_ofs
	.byte 255, 0

	.byte $FF

anRoboZenMissileUp:
	;B6 0CAAE8 (0x018AF8)
	.word imgRoboZenMissileUp_ofs
	.byte 255, 0

	.byte $FF

anRoboZenMissileRight:
	;B7 0CAAED (0x018AFD)
	.word imgRoboZenMissileRight_ofs
	.byte 255, 0

	.byte $FF

anDrunkBottle:
	;B8 0CAAF2 (0x018B02)
	.word imgBlobbyTrapped_0_ofs
	.byte 255, 0

	.byte $FF

anDrunkBlast:
	;B9 0CAAF7 (0x018B07)
	.word imgBlobbyTrapped_1_ofs
	.byte 2, 0

	.word imgBlobbyTrapped_2_ofs
	.byte 2, 0

	.byte $FF

anRoboZenMissileDownRight:
	;BA 0CAB00 (0x018B10)
	.word imgRoboZenMissileDownRight_ofs
	.byte 255, 0

	.byte $FF

anRoboZenMissileDown:
	;BB 0CAB05 (0x018B15)
	.word imgRoboZenMissileDown_ofs
	.byte 255, 0

	.byte $FF

anRoboZenMissileUpLeft:
	;BC 0CAB0A (0x018B1A)
	.word imgRoboZenMissileUpLeft_ofs
	.byte 255, 0

	.byte $FF

anRoboZenMissileUpRight:
	;BD 0CAB0F (0x018B1F)
	.word imgNeedlerDie_3_ofs
	.byte 255, 0

	.byte $FF

anEnemySpecificReward:
	;BE 0CAB14 (0x018B24)
	.word imgRoboZenMissileUp_ofs
	.byte 255, 0

	.byte $FF

anSpringitBodyR:
	;38 0CAB19 (0x018B29)
	.word imgSpringitBodyR_0_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyR_1_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyR_2_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyR_3_ofs
	.byte 3, chrSpringit_A_ID

	.byte $FF

anSpringitR:
	;39 0CAB2A (0x018B3A)
	.word imgSpringitR_0_ofs
	.byte 3, chrSpringit_B_ID

	.word imgSpringitR_1_ofs
	.byte 3, chrSpringit_B_ID

	.word imgSpringitR_2_ofs
	.byte 3, chrSpringit_B_ID

	.word imgSpringitR_3_ofs
	.byte 3, chrSpringit_B_ID

	.byte $FF

anSpringitBodyL:
	;3A 0CAB3B (0x018B4B)
	.word imgSpringitBodyL_0_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyL_1_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyL_2_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyL_3_ofs
	.byte 3, chrSpringit_A_ID

	.byte $FF

anSpringitL:
	;3B 0CAB4C (0x018B5C)
	.word imgSpringitL_0_ofs
	.byte 3, chrSpringit_B_ID

	.word imgSpringitL_1_ofs
	.byte 3, chrSpringit_B_ID

	.word imgSpringitL_2_ofs
	.byte 3, chrSpringit_B_ID

	.word imgSpringitL_3_ofs
	.byte 3, chrSpringit_B_ID

	.byte $FF

anSpringitBlast:
	;5A 0CAB5D (0x018B6D)
	.word imgSpringitBlast_0_ofs
	.byte 3, chrSpringit_B_ID

	.word imgSpringitBlast_1_ofs
	.byte 3, chrSpringit_B_ID

	.word imgSpringitBlast_2_ofs
	.byte 3, chrSpringit_B_ID

	.byte $FF

anSpringitBodyDieR:
	;63 0CAB6A (0x018B7A)
	.word imgSpringitBodyDieR_0_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyDieR_1_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyDieR_2_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyDieR_3_ofs
	.byte 3, chrSpringit_A_ID

	.byte $FF

anSpringitDieR:
	;64 0CAB7B (0x018B8B)
	.word imgSpringitDieR_0_ofs
	.byte 6, chrSpringit_B_ID

	.word imgSpringitDieR_1_ofs
	.byte 6, chrSpringit_B_ID

	.byte $FF

anSpringitBodyDieL:
	;65 0CAB84 (0x018B94)
	.word imgSpringitBodyDieL_0_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyDieL_1_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyDieL_2_ofs
	.byte 3, chrSpringit_A_ID

	.word imgSpringitBodyDieL_3_ofs
	.byte 3, chrSpringit_A_ID

	.byte $FF

anSpringitDieL:
	;66 0CAB95 (0x018BA5)
	.word imgSpringitDieL_0_ofs
	.byte 6, chrSpringit_B_ID

	.word imgSpringitDieL_1_ofs
	.byte 6, chrSpringit_B_ID

	.byte $FF

anDOHProj:
	;67 0CAB9E (0x018BAE)
	.word imgDOHProj_ofs
	.byte 255, chrDOH_ID

	.byte $FF

anDOHProjSpin:
	;68 0CABA3 (0x018BB3)
	.word imgDOHProj_ofs
	.byte 4, chrDOH_ID

	.word imgDOHProjSpin_1_ofs
	.byte 4, chrDOH_ID

	.word imgDOHProjSpin_2_ofs
	.byte 4, chrDOH_ID

	.word imgDOHProjSpin_3_ofs
	.byte 4, chrDOH_ID

	.byte $FF

anDOHTrapped:
	;6C 0CABB4 (0x018BC4)
	.word imgDOHTrapped_0_ofs
	.byte 4, chrDOH_ID

	.word imgDOHTrapped_1_ofs
	.byte 4, chrDOH_ID

	.byte $FF

anDOHTop:
	;C6 0CABBD (0x018BCD)
	.word imgDOHTop_ofs
	.byte 255, chrDOH_ID

	.byte $FF

anDOHFace:
	;C7 0CABC2 (0x018BD2)
	.word imgDOHFace_ofs
	.byte 255, chrDOH_ID

	.byte $FF

anDOHMouth:
	;C8 0CABC7 (0x018BD7)
	.word imgDOHMouth_ofs
	.byte 255, chrDOH_ID

	.byte $FF

anDOHBody:
	;C9 0CABCC (0x018BDC)
	.word imgDOHBody_ofs
	.byte 255, chrDOH_ID

	.byte $FF

anDOHTopShoot:
	;CA 0CABD1 (0x018BE1)
	.word imgDOHTopShoot_ofs
	.byte 255, chrDOH_ID

	.byte $FF

anDOHFaceShoot:
	;CB 0CABD6 (0x018BE6)
	.word imgDOHFaceShoot_ofs
	.byte 255, chrDOH_ID

	.byte $FF

anDOHMouthShoot:
	;CC 0CABDB (0x018BEB)
	.word imgDOHMouthShoot_ofs
	.byte 255, chrDOH_ID

	.byte $FF

anDOHBodyShoot:
	;CD 0CABE0 (0x018BF0)
	.word imgDOHBodyShoot_ofs
	.byte 255, chrDOH_ID

	.byte $FF

anDOHDie:
	;9B 0CABE5 (0x018BF5)
	.word imgInvaderTrapped_0_ofs
	.byte 4, chrDOH_ID

	.word imgInvaderTrapped_1_ofs
	.byte 4, chrDOH_ID

	.word imgBlobbyDownR_0_ofs
	.byte 4, chrDOH_ID

	.word imgBlobbyDownR_1_ofs
	.byte 4, chrDOH_ID

	.byte $FF

anRuckusLAlt:
	;CE 0CABF6 (0x018C06)
	.word imgRuckusLAlt_0_ofs
	.byte 2, chrRuckus_A_ID

	.word imgRuckusLAlt_1_ofs
	.byte 2, chrRuckus_A_ID

	.byte $FF

anRuckusRAlt:
	;CF 0CABFF (0x018C0F)
	.word imgRuckusRAlt_0_ofs
	.byte 2, chrRuckus_A_ID

	.word imgRuckusRAlt_1_ofs
	.byte 2, chrRuckus_A_ID

	.byte $FF

anRuckusL:
	;D0 0CAC08 (0x018C18)
	.word imgRuckusL_0_ofs
	.byte 2, chrRuckus_A_ID

	.word imgRuckusL_1_ofs
	.byte 2, chrRuckus_A_ID

	.byte $FF

anRuckusR:
	;D1 0CAC11 (0x018C21)
	.word imgRuckusR_0_ofs
	.byte 2, chrRuckus_A_ID

	.word imgRuckusR_1_ofs
	.byte 2, chrRuckus_A_ID

	.byte $FF

anRuckusBomb:
	;F9 0CAC1A (0x018C2A)
	.word imgRuckusBomb_ofs
	.byte 2, chrRuckus_A_ID

	.byte $FF

anRuckusBlast:
	;76 0CAC1F (0x018C2F)
	.word imgRoboZenHandL_1_ofs
	.byte 2, chrRuckus_A_ID

	.word imgZenChanTrapped_2_ofs
	.byte 2, chrRuckus_A_ID

	.word imgNeedlerTrapped_1_ofs
	.byte 2, chrRuckus_A_ID

	.byte $FF

anMadMonkey:
	;DB 0CAC2C (0x018C3C)
	.word imgMadMonkey_0_ofs
	.byte 16, chrMadMonkey_ID

	.word imgMadMonkey_1_ofs
	.byte 3, chrMadMonkey_ID

	.byte $FF

anMadMonkeyStartJump:
	;DC 0CAC35 (0x018C45)
	.word imgMadMonkeyStartJump_ofs
	.byte 255, chrMadMonkey_ID

	.byte $FF

anMadMonkeyJump:
	;DD 0CAC3A (0x018C4A)
	.word imgMadMonkeyJump_ofs
	.byte 255, chrMadMonkey_ID

	.byte $FF

anMadMonkeyDie:
	;DE 0CAC3F (0x018C4F)
	.word imgMadMonkey_1_ofs
	.byte 255, chrMadMonkey_ID

	.byte $FF

anRounder:
	;DF 0CAC44 (0x018C54)
	.word imgRounder_0_ofs
	.byte 2, chrRounder_ID

	.word imgRounder_1_ofs
	.byte 2, chrRounder_ID

	.byte $FF

anRounderFall:
	;E0 0CAC4D (0x018C5D)
	.word imgRounderFall_0_ofs
	.byte 2, chrRounder_ID

	.word imgRounderFall_1_ofs
	.byte 2, chrRounder_ID

	.byte $FF

anRounderHang:
	;E1 0CAC56 (0x018C66)
	.word imgRounderHang_0_ofs
	.byte 4, chrRounder_ID

	.word imgRounderHang_1_ofs
	.byte 4, chrRounder_ID

	.byte $FF

anRounderTrapped:
	;72 0CAC5F (0x018C6F)
	.word imgRounderTrapped_0_ofs
	.byte 2, chrRounder_ID

	.word imgSnaggerL_0_ofs
	.byte 2, chrRounder_ID

	.byte $FF

anRounderDie:
	;E3 0CAC68 (0x018C78)
	.word imgRounderDie_0_ofs
	.byte 2, chrRounder_ID

	.word imgRounderDie_1_ofs
	.byte 2, chrRounder_ID

	.word imgRounderDie_2_ofs
	.byte 2, chrRounder_ID

	.word imgRounderDie_3_ofs
	.byte 2, chrRounder_ID

	.byte $FF

anRoc:
	;E4 0CAC79 (0x018C89)
	.word imgRoc_0_ofs
	.byte 2, chrRoc_A_ID

	.word imgRoc_1_ofs
	.byte 4, chrRoc_A_ID

	.word imgRoc_0_ofs
	.byte 2, chrRoc_A_ID

	.word imgRoc_1_ofs
	.byte 4, chrRoc_A_ID

	.word imgRoc_0_ofs
	.byte 2, chrRoc_A_ID

	.word imgRoc_1_ofs
	.byte 4, chrRoc_A_ID

	.word imgRoc_6_ofs
	.byte 2, chrRoc_A_ID

	.word imgRoc_7_ofs
	.byte 4, chrRoc_A_ID

	.byte $FF

anRocDie:
	;12F 0CAC9A (0x018CAA)
	.word imgRoc_0_ofs
	.byte 4, chrRoc_B_ID

	.word imgRocDie_1_ofs
	.byte 4, chrRoc_B_ID

	.byte $FF

anRocShoot:
	;E5 0CACA3 (0x018CB3)
	.word imgRocShoot_0_ofs
	.byte 2, chrRoc_A_ID

	.word imgRocShoot_1_ofs
	.byte 4, chrRoc_A_ID

	.byte $FF

anRocMad:
	;E6 0CACAC (0x018CBC)
	.word imgRoc_0_ofs
	.byte 2, chrRoc_B_ID

	.word imgRoc_1_ofs
	.byte 4, chrRoc_B_ID

	.word imgRoc_0_ofs
	.byte 2, chrRoc_B_ID

	.word imgRoc_1_ofs
	.byte 4, chrRoc_B_ID

	.word imgRoc_0_ofs
	.byte 2, chrRoc_B_ID

	.word imgRoc_1_ofs
	.byte 4, chrRoc_B_ID

	.word imgRoc_6_ofs
	.byte 2, chrRoc_B_ID

	.word imgRoc_7_ofs
	.byte 4, chrRoc_B_ID

	.byte $FF

anRocMadShoot:
	;E7 0CACCD (0x018CDD)
	.word imgRocShoot_0_ofs
	.byte 2, chrRoc_B_ID

	.word imgRocShoot_1_ofs
	.byte 4, chrRoc_B_ID

	.byte $FF

anRocBigLightning:
	;E8 0CACD6 (0x018CE6)
	.word imgRocBigLightning_ofs
	.byte 255, chrRoc_A_ID

	.byte $FF

anRounderReward:
	;D4 0CACDB (0x018CEB)
	.word imgRounderReward_ofs
	.byte 255, chrRounder_ID

	.byte $FF

anRocSmallLightning:
	;137 0CACE0 (0x018CF0)
	.word imgRocSmallLightning_ofs
	.byte 255, chrRoc_B_ID

	.byte $FF

anSkullL:
	;E9 0CACE5 (0x018CF5)
	.word imgSkullL_ofs
	.byte 255, chrSkullBrothers_ID

	.byte $FF

anBurningSkullL:
	;EA 0CACEA (0x018CFA)
	.word imgBurningSkullL_0_ofs
	.byte 2, chrSkullBrothers_ID

	.word imgBurningSkullL_1_ofs
	.byte 2, chrSkullBrothers_ID

	.byte $FF

anSkullFireL:
	;EB 0CACF3 (0x018D03)
	.word imgSkullFireL_ofs
	.byte 255, chrSkullBrothers_ID

	.byte $FF

anSkullReticle:
	;EC 0CACF8 (0x018D08)
	.word imgSkullReticle_ofs
	.byte 255, chrSkullBrothers_ID

	.byte $FF

anSkullHeart:
	;ED 0CACFD (0x018D0D)
	.word imgSkullHeart_ofs
	.byte 255, chrSkullBrothers_ID

	.byte $FF

anSkullFireR:
	;D8 0CAD02 (0x018D12)
	.word imgSkullFireR_ofs
	.byte 255, chrSkullBrothers_ID

	.byte $FF

anSkullR:
	;D9 0CAD07 (0x018D17)
	.word imgSkullR_ofs
	.byte 255, chrSkullBrothers_ID

	.byte $FF

anBurningSkullR:
	;DA 0CAD0C (0x018D1C)
	.word imgBurningSkullR_0_ofs
	.byte 2, chrSkullBrothers_ID

	.word imgBurningSkullR_1_ofs
	.byte 2, chrSkullBrothers_ID

	.byte $FF

anSuperDrunkL:
	;EE 0CAD15 (0x018D25)
	.word imgSuperDrunkL_0_ofs
	.byte 6, chrSuperDrunk_ID

	.word imgSuperDrunkL_1_ofs
	.byte 6, chrSuperDrunk_ID

	.word imgSuperDrunkL_2_ofs
	.byte 6, chrSuperDrunk_ID

	.word imgSuperDrunkL_3_ofs
	.byte 6, chrSuperDrunk_ID

	.byte $FF

anSuperDrunkR:
	;EF 0CAD26 (0x018D36)
	.word imgSuperDrunkR_0_ofs
	.byte 6, chrSuperDrunk_ID

	.word imgSuperDrunkR_1_ofs
	.byte 6, chrSuperDrunk_ID

	.word imgSuperDrunkR_2_ofs
	.byte 6, chrSuperDrunk_ID

	.word imgSuperDrunkR_3_ofs
	.byte 6, chrSuperDrunk_ID

	.byte $FF

anSuperDrunkOrb:
	;F0 0CAD37 (0x018D47)
	.word imgSuperDrunkOrb_ofs
	.byte 255, chrSuperDrunk_ID

	.byte $FF

anSuperDrunkDebrisA:
	;F1 0CAD3C (0x018D4C)
	.word imgSuperDrunkDebrisA_ofs
	.byte 255, chrSuperDrunk_ID

	.byte $FF

anSuperDrunkDebrisB:
	;F2 0CAD41 (0x018D51)
	.word imgSuperDrunkDebrisB_ofs
	.byte 255, chrSuperDrunk_ID

	.byte $FF

anSuperDrunkDebrisC:
	;F3 0CAD46 (0x018D56)
	.word imgSuperDrunkDebrisC_ofs
	.byte 255, chrSuperDrunk_ID

	.byte $FF

anFinalSkullL:
	;F4 0CAD4B (0x018D5B)
	.word imgFinalSkullL_0_ofs
	.byte 4, chrFinalSkull_A_ID

	.word imgFinalSkullL_1_ofs
	.byte 4, chrFinalSkull_A_ID

	.byte $FF

anFinalSkullR:
	;F5 0CAD54 (0x018D64)
	.word imgFinalSkullR_0_ofs
	.byte 4, chrFinalSkull_A_ID

	.word imgFinalSkullR_1_ofs
	.byte 4, chrFinalSkull_A_ID

	.byte $FF

anFinalSkullJumpL:
	;F6 0CAD5D (0x018D6D)
	.word imgFinalSkullJumpL_ofs
	.byte 255, chrFinalSkull_A_ID

	.byte $FF

anFinalSkullJumpR:
	;F7 0CAD62 (0x018D72)
	.word imgFinalSkullJumpR_ofs
	.byte 255, chrFinalSkull_A_ID

	.byte $FF

anFinalSkullDie:
	;F8 0CAD67 (0x018D77)
	.word imgFinalSkullDie_0_ofs
	.byte 4, chrFinalSkull_B_ID

	.word imgFinalSkullDie_1_ofs
	.byte 4, chrFinalSkull_B_ID

	.byte $FF

anZenChanLookAroundL:
	;FC 0CAD70 (0x018D80)
	.word imgBanebouL_1_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_0_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_9_ofs
	.byte 2, chrZenChan_ID

	.word imgZenChanR_0_ofs
	.byte 10, chrZenChan_ID

	.word imgBanebouL_9_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_0_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_1_ofs
	.byte 2, chrZenChan_ID

	.byte $FF

anZenChanLookAroundR:
	;FD 0CAD8D (0x018D9D)
	.word imgBanebouL_9_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_0_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_1_ofs
	.byte 2, chrZenChan_ID

	.word imgZenChanL_0_ofs
	.byte 10, chrZenChan_ID

	.word imgBanebouL_1_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_0_ofs
	.byte 2, chrZenChan_ID

	.word imgBanebouL_9_ofs
	.byte 2, chrZenChan_ID

	.byte $FF

anPlayerNeedlerL:
	;FA 0CADAA (0x018DBA)
	.word imgUNK0B_0_ofs
	.byte 8, chrPlayer_A_ID

	.word imgUNK0B_0_ofs
	.byte 8, chrPlayer_B_ID

	.word imgUNK0B_0_ofs
	.byte 8, chrPlayer_C_ID

	.word imgUNK0B_0_ofs
	.byte 8, chrPlayer_D_ID

	.word imgUNK0B_0_ofs
	.byte 8, chrPlayer_E_ID

	.word imgUNK0B_0_ofs
	.byte 2, chrPlayer_E_ID

	.word imgUNK0B_0_ofs
	.byte 2, chrPlayer_D_ID

	.word imgUNK0B_0_ofs
	.byte 2, chrPlayer_C_ID

	.word imgUNK0B_0_ofs
	.byte 2, chrPlayer_B_ID

	.word imgUNK0B_0_ofs
	.byte 2, chrPlayer_A_ID

	.byte $FF

anPlayerNeedlerR:
	;FB 0CADD3 (0x018DE3)
	.word imgUNK0B_1_ofs
	.byte 8, chrPlayer_A_ID

	.word imgUNK0B_1_ofs
	.byte 8, chrPlayer_B_ID

	.word imgUNK0B_1_ofs
	.byte 8, chrPlayer_C_ID

	.word imgUNK0B_1_ofs
	.byte 8, chrPlayer_D_ID

	.word imgUNK0B_1_ofs
	.byte 8, chrPlayer_E_ID

	.word imgUNK0B_1_ofs
	.byte 2, chrPlayer_E_ID

	.word imgUNK0B_1_ofs
	.byte 2, chrPlayer_D_ID

	.word imgUNK0B_1_ofs
	.byte 2, chrPlayer_C_ID

	.word imgUNK0B_1_ofs
	.byte 2, chrPlayer_B_ID

	.word imgUNK0B_1_ofs
	.byte 2, chrPlayer_A_ID

	.byte $FF

anCarryHeliExitL:
	;85 0CADFC (0x018E0C)
	.word imgCarryHeliExitL_0_ofs
	.byte 4, chrCarryHeli_ID

	.word imgCarryHeliExitL_1_ofs
	.byte 4, chrCarryHeli_ID

	.word imgCarryHeliExitL_2_ofs
	.byte 4, chrCarryHeli_ID

	.word imgCarryHeliExitL_3_ofs
	.byte 255, chrCarryHeli_ID

	.byte $FF

anCarryHeliExitR:
	;86 0CAE0D (0x018E1D)
	.word imgCarryHeliExitR_0_ofs
	.byte 4, chrCarryHeli_ID

	.word imgCarryHeliExitR_1_ofs
	.byte 4, chrCarryHeli_ID

	.word imgCarryHeliExitR_2_ofs
	.byte 4, chrCarryHeli_ID

	.word imgCarryHeliExitR_3_ofs
	.byte 255, chrCarryHeli_ID

	.byte $FF

anThunderBubble:
	;101 0CAE1E (0x018E2E)
	.word imgThunderBubble_0_ofs
	.byte 3, chrThunder_ID

	.word imgThunderBubble_1_ofs
	.byte 3, chrThunder_ID

	.byte $FF

anFireBubble:
	;102 0CAE27 (0x018E37)
	.word imgThunderBubble_0_ofs
	.byte 3, chrFire_ID

	.word imgThunderBubble_1_ofs
	.byte 3, chrFire_ID

	.byte $FF

anFloodBubble:
	;103 0CAE30 (0x018E40)
	.word imgThunderBubble_0_ofs
	.byte 3, chrFlood_ID

	.word imgThunderBubble_1_ofs
	.byte 3, chrFlood_ID

	.byte $FF

anSnowBubble:
	;104 0CAE39 (0x018E49)
	.word imgThunderBubble_0_ofs
	.byte 3, chrSnow_ID

	.word imgThunderBubble_1_ofs
	.byte 3, chrSnow_ID

	.byte $FF

anWindBubble:
	;105 0CAE42 (0x018E52)
	.word imgThunderBubble_0_ofs
	.byte 255, chrWind_ID

	.byte $FF

anStarBubble:
	;106 0CAE47 (0x018E57)
	.word imgThunderBubble_0_ofs
	.byte 3, chrStar_ID

	.word imgThunderBubble_1_ofs
	.byte 3, chrStar_ID

	.byte $FF

anThunder:
	;107 0CAE50 (0x018E60)
	.word imgThunder_ofs
	.byte 255, chrThunder_ID

	.byte $FF

anFlame:
	;108 0CAE55 (0x018E65)
	.word imgThunder_ofs
	.byte 255, chrFire_ID

	.byte $FF

anFloodV:
	;109 0CAE5A (0x018E6A)
	.word imgFloodV_ofs
	.byte 2, chrFlood_ID

	.byte $FF

anSnowRelease:
	;10A 0CAE5F (0x018E6F)
	.word imgThunder_ofs
	.byte 255, chrSnow_ID

	.byte $FF

anWind:
	;10B 0CAE64 (0x018E74)
	.word imgThunderBubble_1_ofs
	.byte 3, chrWind_ID

	.word imgThunder_ofs
	.byte 3, chrWind_ID

	.byte $FF

anStar:
	;10C 0CAE6D (0x018E7D)
	.word imgThunder_ofs
	.byte 255, chrStar_ID

	.byte $FF

anThunderAlt:
	;10D 0CAE72 (0x018E82)
	.word imgThunder_ofs
	.byte 255, chrThunder_ID

	.byte $FF

anStarAlt:
	;10E 0CAE77 (0x018E87)
	.word imgStarAlt_ofs
	.byte 255, chrStar_ID

	.byte $FF

anSnowAlt:
	;10F 0CAE7C (0x018E8C)
	.word imgThunder_ofs
	.byte 255, chrSnow_ID

	.byte $FF

anWindAlt:
	;110 0CAE81 (0x018E91)
	.word imgThunder_ofs
	.byte 255, chrWind_ID

	.byte $FF

anFloodHAlt:
	;13F 0CAE86 (0x018E96)
	.word imgFloodHAlt_ofs
	.byte 2, chrFlood_ID

	.byte $FF

anFloodH:
	;12C 0CAE8B (0x018E9B)
	.word imgStarAlt_ofs
	.byte 2, chrFlood_ID

	.byte $FF

anUNK140:
	;140 0CAE90 (0x018EA0)
	.word imgUNK140_ofs
	.byte 2, chrFlood_ID

	.byte $FF

anUNK141:
	;141 0CAE95 (0x018EA5)
	.word imgUNK141_ofs
	.byte 2, chrFlood_ID

	.byte $FF

anFlames4:
	;125 0CAE9A (0x018EAA)
	.word imgFlames4_0_ofs
	.byte 2, chrFire_ID

	.word imgFlames4_1_ofs
	.byte 2, chrFire_ID

	.byte $FF

anFlames2:
	;128 0CAEA3 (0x018EB3)
	.word imgFlames2_0_ofs
	.byte 2, chrFire_ID

	.word imgFlames2_1_ofs
	.byte 2, chrFire_ID

	.byte $FF

anFlames2L:
	;129 0CAEAC (0x018EBC)
	.word imgFlames2L_0_ofs
	.byte 2, chrFire_ID

	.word imgFlames2L_1_ofs
	.byte 2, chrFire_ID

	.byte $FF

anFlames3:
	;12A 0CAEB5 (0x018EC5)
	.word imgFlames3_0_ofs
	.byte 2, chrFire_ID

	.word imgFlames3_1_ofs
	.byte 2, chrFire_ID

	.byte $FF

anFlames3R:
	;12B 0CAEBE (0x018ECE)
	.word imgFlames3R_0_ofs
	.byte 2, chrFire_ID

	.word imgFlames3R_1_ofs
	.byte 2, chrFire_ID

	.byte $FF

anSnowSpread:
	;13D 0CAEC7 (0x018ED7)
	.word imgSnowSpread_0_ofs
	.byte 6, chrSnow_ID

	.word imgSnowSpread_1_ofs
	.byte 6, chrSnow_ID

	.word imgSnowSpread_2_ofs
	.byte 8, chrSnow_ID

	.byte $FF

anSnowFall:
	;13E 0CAED4 (0x018EE4)
	.word imgSnowFall_0_ofs
	.byte 4, chrSnow_ID

	.word imgSnowFall_1_ofs
	.byte 4, chrSnow_ID

	.word imgSnowFall_2_ofs
	.byte 4, chrSnow_ID

	.word imgSnowFall_3_ofs
	.byte 4, chrSnow_ID

	.byte $FF

anShoe:
	;117 0CAEE5 (0x018EF5)
	.word imgShoe_ofs
	.byte 255, 0

	.byte $FF

anHolyCup:
	;112 0CAEEA (0x018EFA)
	.word imgHolyCup_ofs
	.byte 255, 0

	.byte $FF

anPencil:
	;114 0CAEEF (0x018EFF)
	.word imgPencil_ofs
	.byte 255, 0

	.byte $FF

anCandy:
	;118 0CAEF4 (0x018F04)
	.word imgCandy_ofs
	.byte 255, 0

	.byte $FF

anHeart:
	;111 0CAEF9 (0x018F09)
	.word imgHeart_ofs
	.byte 255, 0

	.byte $FF

anJrDoll:
	;119 0CAEFE (0x018F0E)
	.word imgJrDoll_ofs
	.byte 255, 0

	.byte $FF

an1UP:
	;11E 0CAF03 (0x018F13)
	.word img1UP_ofs
	.byte 255, 0

	.byte $FF

anSpinyChestnut:
	;11F 0CAF08 (0x018F18)
	.word imgSpinyChestnut_ofs
	.byte 255, 0

	.byte $FF

anSecretDoor:
	;113 0CAF0D (0x018F1D)
	.word imgSecretDoor_ofs
	.byte 255, 0

	.byte $FF

anCrystal:
	;115 0CAF12 (0x018F22)
	.word imgCrystal_ofs
	.byte 255, 0

	.byte $FF

anStarRod:
	;116 0CAF17 (0x018F27)
	.word imgStarRod_ofs
	.byte 255, 0

	.byte $FF

anClock:
	;11A 0CAF1C (0x018F2C)
	.word imgClock_ofs
	.byte 255, 0

	.byte $FF

anStaff:
	;11B 0CAF21 (0x018F31)
	.word imgStaff_ofs
	.byte 255, 0

	.byte $FF

anTree:
	;11C 0CAF26 (0x018F36)
	.word imgTree_ofs
	.byte 255, 0

	.byte $FF

anParasol:
	;11D 0CAF2B (0x018F3B)
	.word imgParasol_ofs
	.byte 255, 0

	.byte $FF

anSpikeBall:
	;D6 0CAF30 (0x018F40)
	.word imgSpikeBall_ofs
	.byte 255, chrThunder_ID

	.byte $FF

anTractorMissile:
	;121 0CAF35 (0x018F45)
	.word imgTractorMissile_ofs
	.byte 255, chrThunder_ID

	.byte $FF

anUNK122:
	;122 0CAF3A (0x018F4A)
	.word imgUNK122_0_ofs
	.byte 22, chrItems_ID

	.word imgUNK122_1_ofs
	.byte 255, chrItems_ID

	.byte $FF

anFlashingCircle:
	;133 0CAF43 (0x018F53)
	.word imgFlashingCircle_0_ofs
	.byte 8, chrItems_ID

	.word imgFlashingCircle_1_ofs
	.byte 8, chrItems_ID

	.byte $FF

anDrinkThunder:
	;120 0CAF4C (0x018F5C)
	.word imgDrinkThunder_ofs
	.byte 255, chrThunder_ID

	.byte $FF

anDrinkStar:
	;123 0CAF51 (0x018F61)
	.word imgDrinkThunder_ofs
	.byte 255, chrStar_ID

	.byte $FF

anDrinkSnow:
	;124 0CAF56 (0x018F66)
	.word imgDrinkThunder_ofs
	.byte 255, chrSnow_ID

	.byte $FF

anDrinkWind:
	;12E 0CAF5B (0x018F6B)
	.word imgDrinkThunder_ofs
	.byte 255, chrWind_ID

	.byte $FF

anTrash:
	;FE 0CAF60 (0x018F70)
	.word imgTrash_ofs
	.byte 255, chrTrash_ID

	.byte $FF

anTrashFall:
	;FF 0CAF65 (0x018F75)
	.word imgTrashFall_0_ofs
	.byte 6, chrTrash_ID

	.word imgTrashFall_1_ofs
	.byte 4, chrTrash_ID

	.word imgTrashFall_2_ofs
	.byte 4, chrTrash_ID

	.word imgTrashFall_1_ofs
	.byte 4, chrTrash_ID

	.word imgTrashFall_2_ofs
	.byte 4, chrTrash_ID

	.word imgTrashFall_1_ofs
	.byte 4, chrTrash_ID

	.word imgTrashFall_2_ofs
	.byte 4, chrTrash_ID

	.word imgTrashFall_1_ofs
	.byte 4, chrTrash_ID

	.word imgTrashFall_2_ofs
	.byte 4, chrTrash_ID

	.byte $FF

anSkelMonstaL:
	;138 0CAF8A (0x018F9A)
	.word imgBlobbyTrapped_1_ofs
	.byte 4, 0

	.word imgBlobbyTrapped_2_ofs
	.byte 4, 0

	.byte $FF

anSkelMonstaR:
	;139 0CAF93 (0x018FA3)
	.word imgRoboZenMissileRight_ofs
	.byte 4, 0

	.word imgRoboZenMissileDownRight_ofs
	.byte 4, 0

	.byte $FF

anSkelMonstaSpawn:
	;13A 0CAF9C (0x018FAC)
	.word imgSkelMonstaSpawn_0_ofs
	.byte 6, 0

	.word imgSkelMonstaSpawn_1_ofs
	.byte 6, 0

	.word imgSkelMonstaSpawn_2_ofs
	.byte 6, 0

	.byte $FF

anSkelMonstaLeave:
	;13B 0CAFA9 (0x018FB9)
	.word imgSkelMonstaSpawn_2_ofs
	.byte 6, 0

	.word imgSkelMonstaSpawn_1_ofs
	.byte 6, 0

	.word imgSkelMonstaSpawn_0_ofs
	.byte 255, 0

	.byte $FF

anChuckerL:
	;BF 0CAFB6 (0x018FC6)
	.word imgZenChanL_0_ofs
	.byte 4, chrChucker_ID

	.word imgZenChanL_1_ofs
	.byte 4, chrChucker_ID

	.byte $FF

anChuckerR:
	;C0 0CAFBF (0x018FCF)
	.word imgZenChanR_0_ofs
	.byte 4, chrChucker_ID

	.word imgZenChanR_1_ofs
	.byte 4, chrChucker_ID

	.byte $FF

anChuckerSmallL:
	;C1 0CAFC8 (0x018FD8)
	.word imgZenChanL_2_ofs
	.byte 4, chrChucker_ID

	.word imgZenChanL_3_ofs
	.byte 4, chrChucker_ID

	.byte $FF

anChuckerSmallR:
	;C2 0CAFD1 (0x018FE1)
	.word imgZenChanR_2_ofs
	.byte 4, chrChucker_ID

	.word imgZenChanR_3_ofs
	.byte 4, chrChucker_ID

	.byte $FF

anChuckerShootL:
	;C3 0CAFDA (0x018FEA)
	.word imgZenChanL_0_ofs
	.byte 4, chrChucker_ID

	.word imgBanebouL_0_ofs
	.byte 4, chrChucker_ID

	.word imgInvaderTrapped_0_ofs
	.byte 4, chrChucker_ID

	.word imgBanebouL_0_ofs
	.byte 4, chrChucker_ID

	.word imgZenChanL_0_ofs
	.byte 4, chrChucker_ID

	.word imgNeedlerTrapped_1_ofs
	.byte 4, chrChucker_ID

	.word imgZenChanL_2_ofs
	.byte 4, chrChucker_ID

	.byte $FF

anChuckerShootR:
	;C4 0CAFF7 (0x019007)
	.word imgZenChanR_0_ofs
	.byte 4, chrChucker_ID

	.word imgChuckerShootR_1_ofs
	.byte 4, chrChucker_ID

	.word imgBlobbyUpR_0_ofs
	.byte 4, chrChucker_ID

	.word imgChuckerShootR_1_ofs
	.byte 4, chrChucker_ID

	.word imgZenChanR_0_ofs
	.byte 4, chrChucker_ID

	.word imgHandWindingR_1_ofs
	.byte 4, chrChucker_ID

	.word imgZenChanR_2_ofs
	.byte 4, chrChucker_ID

	.byte $FF

anChuckerRock:
	;C5 0CB014 (0x019024)
	.word imgBanebouL_1_ofs
	.byte 255, 0

	.byte $FF

anChuckerTrapped:
	;71 0CB019 (0x019029)
	.word imgZenChanTrapped_2_ofs
	.byte 255, chrChucker_ID

	.byte $FF

anChuckerDie:
	;D7 0CB01E (0x01902E)
	.word imgInvaderTrapped_1_ofs
	.byte 4, chrChucker_ID

	.word imgRoboZenHandL_0_ofs
	.byte 4, chrChucker_ID

	.word imgBlobbyDownR_1_ofs
	.byte 4, chrChucker_ID

	.word imgBlobbyUpR_1_ofs
	.byte 4, chrChucker_ID

	.byte $FF

anChuckerBlast:
	;132 0CB02F (0x01903F)
	.word imgChuckerBlast_ofs
	.byte 255, chrChucker_ID

	.byte $FF

anBombBubble:
	;12D 0CB034 (0x019044)
	.word imgNeedlerTrapped_1_ofs
	.byte 4, 0

	.byte $FF

anFairy015E:
	;15E 0CB039 (0x019049)
	.word imgFairy015E_0_ofs
	.byte 4, chrEndingActors_A_ID

	.word imgFairy015E_1_ofs
	.byte 4, chrEndingActors_A_ID

	.byte $FF

anFairy015F:
	;15F 0CB042 (0x019052)
	.word imgFairy015E_0_ofs
	.byte 4, chrEndingActors_A_ID

	.word imgFairy015F_1_ofs
	.byte 4, chrEndingActors_A_ID

	.byte $FF

anFairy0160:
	;160 0CB04B (0x01905B)
	.word imgFairy015F_1_ofs
	.byte 255, chrEndingActors_A_ID

	.byte $FF

anFairy0161:
	;161 0CB050 (0x019060)
	.word imgFairy0161_0_ofs
	.byte 4, chrEndingActors_A_ID

	.word imgAnnounce10000_ofs
	.byte 4, chrEndingActors_A_ID

	.byte $FF

anFairy0162:
	;162 0CB059 (0x019069)
	.word imgFairy0161_0_ofs
	.byte 4, chrEndingActors_A_ID

	.word imgAnnounce30000_ofs
	.byte 4, chrEndingActors_A_ID

	.byte $FF

anFairy0163:
	;163 0CB062 (0x019072)
	.word imgFairy0163_ofs
	.byte 255, chrEndingActors_A_ID

	.byte $FF

anCubby0164:
	;164 0CB067 (0x019077)
	.word imgCubby0164_ofs
	.byte 255, chrEndingActors_B_ID

	.byte $FF

anJudy0165:
	;165 0CB06C (0x01907C)
	.word imgJudy0165_ofs
	.byte 255, chrEndingActors_B_ID

	.byte $FF

anHeart0166:
	;166 0CB071 (0x019081)
	.word imgHeart0166_ofs
	.byte 255, chrEndingActors_B_ID

	.byte $FF

anFinalSkelMonstaL:
	;167 0CB076 (0x019086)
	.word imgFinalSkelMonstaL_0_ofs
	.byte 4, chrFinalSkull_B_ID

	.word imgFinalSkelMonstaL_1_ofs
	.byte 4, chrFinalSkull_B_ID

	.byte $FF

anFinalSkelMonstaR:
	;168 0CB07F (0x01908F)
	.word imgFinalSkelMonstaR_0_ofs
	.byte 4, chrFinalSkull_B_ID

	.word imgFinalSkelMonstaR_1_ofs
	.byte 4, chrFinalSkull_B_ID

	.byte $FF

anFinalSkelMonstaSpawn:
	;169 0CB088 (0x019098)
	.word imgFinalSkelMonstaSpawn_0_ofs
	.byte 4, chrFinalSkull_B_ID

	.word imgFinalSkelMonstaSpawn_1_ofs
	.byte 4, chrFinalSkull_B_ID

	.word imgFinalSkelMonstaSpawn_2_ofs
	.byte 4, chrFinalSkull_B_ID

	.byte $FF

anFinalSkelMonstaLeave:
	;16A 0CB095 (0x0190A5)
	.word imgFinalSkelMonstaSpawn_2_ofs
	.byte 4, chrFinalSkull_B_ID

	.word imgFinalSkelMonstaSpawn_1_ofs
	.byte 4, chrFinalSkull_B_ID

	.word imgFinalSkelMonstaSpawn_0_ofs
	.byte 4, chrFinalSkull_B_ID

	.byte $FF

anSnaggerDie:
	;16B 0CB0A2 (0x0190B2)
	.word imgSnaggerDie_0_ofs
	.byte 4, chrSnagger_ID

	.word imgSnaggerDie_1_ofs
	.byte 4, chrSnagger_ID

	.word imgSnaggerDie_2_ofs
	.byte 4, chrSnagger_ID

	.word imgSnaggerDie_3_ofs
	.byte 4, chrSnagger_ID

	.byte $FF

anBonusBall:
	;16C 0CB0B3 (0x0190C3)
	.word imgBonusBall_0_ofs
	.byte 4, chrBonusBall_A_ID

	.word imgBonusBall_1_ofs
	.byte 4, chrBonusBall_A_ID

	.word imgBonusBall_2_ofs
	.byte 4, chrBonusBall_A_ID

	.word imgBonusBall_3_ofs
	.byte 4, chrBonusBall_A_ID

	.byte $FF

anBonusHead:
	;16D 0CB0C4 (0x0190D4)
	.word imgBonusHead_0_ofs
	.byte 8, chrBonusBall_A_ID

	.word imgBonusHead_1_ofs
	.byte 8, chrBonusBall_A_ID

	.byte $FF

anBonusHand:
	;16E 0CB0CD (0x0190DD)
	.word imgBonusHand_0_ofs
	.byte 4, chrBonusBall_A_ID

	.word imgBonusHand_1_ofs
	.byte 4, chrBonusBall_A_ID

	.byte $FF

anIntroCubbySit:
	;16F 0CB0D6 (0x0190E6)
	.word imgCubby0164_ofs
	.byte 255, chrIntroActors_A_ID

	.byte $FF

anIntroJudySit:
	;170 0CB0DB (0x0190EB)
	.word imgJudy0165_ofs
	.byte 255, chrIntroActors_A_ID

	.byte $FF

anIntroHeart:
	;171 0CB0E0 (0x0190F0)
	.word imgHeart0166_ofs
	.byte 255, chrIntroActors_A_ID

	.byte $FF

anFairyFlyL:
	;172 0CB0E5 (0x0190F5)
	.word imgFairy015E_0_ofs
	.byte 8, chrEndingActors_A_ID

	.word imgFairy015F_1_ofs
	.byte 8, chrEndingActors_A_ID

	.word imgFairyFlyL_2_ofs
	.byte 8, chrEndingActors_A_ID

	.word imgFairy015F_1_ofs
	.byte 8, chrEndingActors_A_ID

	.byte $FF

anFairyFlyR:
	;173 0CB0F6 (0x019106)
	.word imgFairy015E_1_ofs
	.byte 8, chrEndingActors_A_ID

	.word imgFairy0161_0_ofs
	.byte 8, chrEndingActors_A_ID

	.word imgFairy0163_ofs
	.byte 8, chrEndingActors_A_ID

	.word imgFairy0161_0_ofs
	.byte 8, chrEndingActors_A_ID

	.byte $FF

anBonusHandUpLeft:
	;175 0CB107 (0x019117)
	.word imgBonusHandUpLeft_0_ofs
	.byte 4, chrBonusBall_A_ID

	.word imgBonusHandUpLeft_1_ofs
	.byte 4, chrBonusBall_A_ID

	.byte $FF

anBonusHandDownRight:
	;176 0CB110 (0x019120)
	.word imgBonusHandDownRight_0_ofs
	.byte 4, chrBonusBall_A_ID

	.word imgBonusHandDownRight_1_ofs
	.byte 4, chrBonusBall_A_ID

	.byte $FF

anBonusHandDownLeft:
	;177 0CB119 (0x019129)
	.word imgBonusHandDownLeft_0_ofs
	.byte 4, chrBonusBall_A_ID

	.word imgBonusHandDownLeft_1_ofs
	.byte 4, chrBonusBall_A_ID

	.byte $FF

anIntroSkull:
	;17B 0CB122 (0x019132)
	.word imgIntroSkull_0_ofs
	.byte 8, chrIntroActors_A_ID

	.word imgIntroSkull_1_ofs
	.byte 8, chrIntroActors_B_ID

	.byte $FF

anIntroDrunksHide:
	;17C 0CB12B (0x01913B)
	.word imgIntroDrunksHide_ofs
	.byte 255, chrIntroActors_A_ID

	.byte $FF

anSpell:
	;17D 0CB130 (0x019140)
	.word imgSpell_0_ofs
	.byte 4, chrIntroActors_A_ID

	.word imgSpell_1_ofs
	.byte 4, chrIntroActors_A_ID

	.byte $FF

anIntroCubbyFloat:
	;17E 0CB139 (0x019149)
	.word imgIntroCubbyFloat_ofs
	.byte 255, chrIntroActors_A_ID

	.byte $FF

anIntroJudyTrapped:
	;17F 0CB13E (0x01914E)
	.word imgIntroJudyTrapped_ofs
	.byte 255, chrIntroActors_B_ID

	.byte $FF

anIntroJudyShout:
	;180 0CB143 (0x019153)
	.word imgIntroJudyShout_0_ofs
	.byte 4, chrIntroActors_B_ID

	.word imgIntroJudyShout_1_ofs
	.byte 8, chrIntroActors_B_ID

	.byte $FF

anCubbyL:
	;181 0CB14C (0x01915C)
	.word imgCubby0164_ofs
	.byte 255, chrEndingActors_B_ID

	.byte $FF

anBossJudyL:
	;182 0CB151 (0x019161)
	.word imgJudy0165_ofs
	.byte 255, chrEndingActors_B_ID

	.byte $FF

anIntroDrunksWalkL:
	;183 0CB156 (0x019166)
	.word imgIntroDrunksWalkL_0_ofs
	.byte 4, chrDrunk_A_ID

	.word imgIntroDrunksWalkL_1_ofs
	.byte 4, chrDrunk_A_ID

	.word imgIntroDrunksWalkL_2_ofs
	.byte 4, chrDrunk_A_ID

	.word imgIntroDrunksWalkL_3_ofs
	.byte 4, chrDrunk_A_ID

	.word imgIntroDrunksWalkL_2_ofs
	.byte 4, chrDrunk_A_ID

	.word imgIntroDrunksWalkL_1_ofs
	.byte 4, chrDrunk_A_ID

	.byte $FF

anIntroDrunksWalkR:
	;184 0CB16F (0x01917F)
	.word imgIntroDrunksWalkR_0_ofs
	.byte 4, chrDrunk_A_ID

	.word imgIntroDrunksWalkR_1_ofs
	.byte 4, chrDrunk_A_ID

	.word imgIntroDrunksWalkR_2_ofs
	.byte 4, chrDrunk_A_ID

	.word imgIntroDrunksWalkR_3_ofs
	.byte 4, chrDrunk_A_ID

	.word imgIntroDrunksWalkR_2_ofs
	.byte 4, chrDrunk_A_ID

	.word imgIntroDrunksWalkR_1_ofs
	.byte 4, chrDrunk_A_ID

	.byte $FF

anIntroPlayerWalkL:
	;185 0CB188 (0x019198)
	.word imgPlayerL_Copy_ofs
	.byte 3, chrPlayer_A_ID

	.word imgPlayerL_Copy_ofs
	.byte 3, chrPlayer_B_ID

	.word imgPlayerL_Copy_ofs
	.byte 3, chrPlayer_C_ID

	.word imgPlayerL_Copy_ofs
	.byte 3, chrPlayer_D_ID

	.word imgPlayerL_Copy_ofs
	.byte 3, chrPlayer_E_ID

	.word imgPlayerL_Copy_ofs
	.byte 3, chrPlayer_F_ID

	.word imgPlayerL_Copy_ofs
	.byte 3, chrPlayer_G_ID

	.word imgPlayerL_Copy_ofs
	.byte 3, chrPlayer_H_ID

	.byte $FF

anBarcelonL:
	;186 0CB1A9 (0x0191B9)
	.word imgBarcelonL_0_ofs
	.byte 4, chrBarcelon_A_ID

	.word imgBarcelonL_1_ofs
	.byte 4, chrBarcelon_A_ID

	.word imgBarcelonL_2_ofs
	.byte 4, chrBarcelon_A_ID

	.byte $FF

anBarcelonLoseL:
	;187 0CB1B6 (0x0191C6)
	.word imgBarcelonLoseL_0_ofs
	.byte 4, chrBarcelon_A_ID

	.word imgBarcelonLoseL_1_ofs
	.byte 4, chrBarcelon_A_ID

	.word imgBarcelonL_0_ofs
	.byte 4, chrBarcelon_B_ID

	.byte $FF

anBarcelonJumpL:
	;188 0CB1C3 (0x0191D3)
	.word imgBarcelonL_1_ofs
	.byte 255, chrBarcelon_B_ID

	.byte $FF

anBarcelonFallL:
	;189 0CB1C8 (0x0191D8)
	.word imgBarcelonL_2_ofs
	.byte 255, chrBarcelon_B_ID

	.byte $FF

anBarcelonR:
	;18A 0CB1CD (0x0191DD)
	.word imgBarcelonR_0_ofs
	.byte 4, chrBarcelon_A_ID

	.word imgBarcelonR_1_ofs
	.byte 4, chrBarcelon_A_ID

	.word imgBarcelonR_2_ofs
	.byte 4, chrBarcelon_A_ID

	.byte $FF

anBarcelonLoseR:
	;18B 0CB1DA (0x0191EA)
	.word imgBarcelonLoseR_0_ofs
	.byte 4, chrBarcelon_A_ID

	.word imgBarcelonLoseR_1_ofs
	.byte 4, chrBarcelon_A_ID

	.word imgBarcelonR_0_ofs
	.byte 4, chrBarcelon_B_ID

	.byte $FF

anBarcelonJumpR:
	;18C 0CB1E7 (0x0191F7)
	.word imgBarcelonR_1_ofs
	.byte 255, chrBarcelon_B_ID

	.byte $FF

anBarcelonFallR:
	;18D 0CB1EC (0x0191FC)
	.word imgBarcelonR_2_ofs
	.byte 255, chrBarcelon_B_ID

	.byte $FF

anBarcelonWin:
	;18E 0CB1F1 (0x019201)
	.word imgBarcelonLoseL_0_ofs
	.byte 4, chrBarcelon_B_ID

	.word imgBarcelonLoseL_1_ofs
	.byte 4, chrBarcelon_B_ID

	.byte $FF

anEndingPlayerWalkR:
	;18F 0CB1FA (0x01920A)
	.word imgPlayerR_ofs
	.byte 3, chrPlayer_A_ID

	.word imgPlayerR_ofs
	.byte 3, chrPlayer_B_ID

	.word imgPlayerR_ofs
	.byte 3, chrPlayer_C_ID

	.word imgPlayerR_ofs
	.byte 3, chrPlayer_D_ID

	.word imgPlayerR_ofs
	.byte 3, chrPlayer_E_ID

	.word imgPlayerR_ofs
	.byte 3, chrPlayer_F_ID

	.word imgPlayerR_ofs
	.byte 3, chrPlayer_G_ID

	.word imgPlayerR_ofs
	.byte 3, chrPlayer_H_ID

	.byte $FF

anBigCoin:
	;190 0CB21B (0x01922B)
	.word imgDrunkL_0_ofs
	.byte 255, chrBigReward_B_ID

	.byte $FF

anBigBell:
	;191 0CB220 (0x019230)
	.word imgDrunkL_1_ofs
	.byte 255, chrBigReward_B_ID

	.byte $FF

anBigTriangle:
	;192 0CB225 (0x019235)
	.word imgDrunkL_2_ofs
	.byte 255, chrBigReward_B_ID

	.byte $FF

anBigDiamond:
	;193 0CB22A (0x01923A)
	.word imgDrunkL_3_ofs
	.byte 255, chrBigReward_B_ID

	.byte $FF

anBigPudding:
	;194 0CB22F (0x01923F)
	.word imgBigPudding_ofs
	.byte 255, chrBigReward_A_ID

	.byte $FF

anBigPineapple:
	;195 0CB234 (0x019244)
	.word imgBigPineapple_ofs
	.byte 255, chrBigReward_A_ID

	.byte $FF

anBigHamburger:
	;196 0CB239 (0x019249)
	.word imgBigHamburger_ofs
	.byte 255, chrBigReward_A_ID

	.byte $FF

anBigDessert:
	;197 0CB23E (0x01924E)
	.word imgBigDessert_ofs
	.byte 255, chrBigReward_A_ID

	.byte $FF

anBigFieldPeas:
	;198 0CB243 (0x019253)
	.word imgBigFieldPeas_ofs
	.byte 255, chrBigReward_A_ID

	.byte $FF

anJudyR:
	;199 0CB248 (0x019258)
	.word imgJudyR_ofs
	.byte 255, chrEndingActors_B_ID

	.byte $FF

anJudyWalkR:
	;19A 0CB24D (0x01925D)
	.word imgJudyR_ofs
	.byte 8, chrEndingActors_B_ID

	.word imgJudyWalkR_1_ofs
	.byte 8, chrEndingActors_B_ID

	.byte $FF

anAnnounceRound:
	;142 0CB256 (0x019266)
	.word imgAnnounceRound_ofs
	.byte 255, chrTallFont_A_ID

	.byte $FF

anAnnounceClear:
	;143 0CB25B (0x01926B)
	.word imgAnnounceClear_ofs
	.byte 255, chrTallFont_A_ID

	.byte $FF

anAnnounceBonus:
	;144 0CB260 (0x019270)
	.word imgAnnounceBonus_ofs
	.byte 255, chrTallFont_A_ID

	.byte $FF

anAnnounceGame:
	;145 0CB265 (0x019275)
	.word imgAnnounceGame_ofs
	.byte 255, chrTallFont_A_ID

	.byte $FF

anAnnounceNo:
	;146 0CB26A (0x01927A)
	.word imgAnnounceNo_ofs
	.byte 255, chrTallFont_A_ID

	.byte $FF

anAnnouncePause:
	;147 0CB26F (0x01927F)
	.word imgAnnouncePause_ofs
	.byte 255, chrTallFont_A_ID

	.byte $FF

anAnnounceTheEnd:
	;148 0CB274 (0x019284)
	.word imgAnnounceTheEnd_ofs
	.byte 255, chrTallFont_A_ID

	.byte $FF

anAnnounce0:
	;149 0CB279 (0x019289)
	.word imgAnnounce0_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce1:
	;14A 0CB27E (0x01928E)
	.word imgAnnounce1_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce2:
	;14B 0CB283 (0x019293)
	.word imgAnnounce2_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce3:
	;14C 0CB288 (0x019298)
	.word imgAnnounce3_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce4:
	;14D 0CB28D (0x01929D)
	.word imgAnnounce4_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce5:
	;14E 0CB292 (0x0192A2)
	.word imgAnnounce5_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce6:
	;14F 0CB297 (0x0192A7)
	.word imgAnnounce6_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce7:
	;150 0CB29C (0x0192AC)
	.word imgAnnounce7_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce8:
	;151 0CB2A1 (0x0192B1)
	.word imgAnnounce8_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce9:
	;152 0CB2A6 (0x0192B6)
	.word imgAnnounce9_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce30000:
	;153 0CB2AB (0x0192BB)
	.word imgAnnounce30000_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce10000:
	;154 0CB2B0 (0x0192C0)
	.word imgAnnounce10000_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnounce100000:
	;156 0CB2B5 (0x0192C5)
	.word imgAnnounce100000_ofs
	.byte 255, chrTallFont_B_ID

	.byte $FF

anAnnouncePlayer:
	;155 0CB2BA (0x0192CA)
	.word imgAnnouncePlayer_ofs
	.byte 255, chrTallFont_A_ID

	.byte $FF

anPlayerSmallL:
	;130 0CB2BF (0x0192CF)
	.word imgPlayerSmallL_ofs
	.byte 255, chrPlayer_O_ID

	.byte $FF

anPlayerSmallR:
	;131 0CB2C4 (0x0192D4)
	.word imgPlayerSmallR_ofs
	.byte 255, chrPlayer_O_ID

	.byte $FF

anPlayerSmallWalkL:
	;134 0CB2C9 (0x0192D9)
	.word imgPlayerSmallWalkL_0_ofs
	.byte 2, chrPlayer_O_ID

	.word imgPlayerSmallWalkL_1_ofs
	.byte 2, chrPlayer_O_ID

	.word imgPlayerSmallWalkL_0_ofs
	.byte 2, chrPlayer_P_ID

	.word imgPlayerSmallWalkL_1_ofs
	.byte 2, chrPlayer_P_ID

	.byte $FF

anPlayerSmallWalkR:
	;135 0CB2DA (0x0192EA)
	.word imgPlayerSmallWalkR_0_ofs
	.byte 2, chrPlayer_O_ID

	.word imgPlayerSmallWalkR_1_ofs
	.byte 2, chrPlayer_O_ID

	.word imgPlayerSmallWalkR_0_ofs
	.byte 2, chrPlayer_P_ID

	.word imgPlayerSmallWalkR_1_ofs
	.byte 2, chrPlayer_P_ID

	.byte $FF

anRuckusDie:
	;AA 0CB2EB (0x0192FB)
	.word imgRuckusDie_0_ofs
	.byte 4, chrRuckus_A_ID

	.word imgRuckusDie_1_ofs
	.byte 4, chrRuckus_A_ID

	.word imgRuckusDie_2_ofs
	.byte 4, chrRuckus_A_ID

	.word imgRuckusDie_3_ofs
	.byte 4, chrRuckus_A_ID

	.word imgRuckusDie_4_ofs
	.byte 4, chrRuckus_A_ID

	.word imgRuckusDie_5_ofs
	.byte 4, chrRuckus_A_ID

	.word imgRuckusDie_6_ofs
	.byte 4, chrRuckus_A_ID

	.word imgRuckusDie_7_ofs
	.byte 4, chrRuckus_A_ID

	.byte $FF