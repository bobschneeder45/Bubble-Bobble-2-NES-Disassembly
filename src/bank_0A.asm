.segment "PRG_BANK_A"
; 0x014010-0x01600F

;--- Contents ---
;Sprite data (table expected to be at start of bank)
;Enemy projectile scripts

.include "anim/images2.asm"

IRQRounds:
	.byte 8						;- D 0 - - - 0x015A7C 05:BA6C: 08
	.byte 13					;- D 0 - - - 0x015A7D 05:BA6D: 0D
	.byte 17					;- D 0 - - - 0x015A7E 05:BA6E: 11
	.byte 20					;- D 0 - - - 0x015A7F 05:BA6F: 14
	.byte 28					;- D 0 - - - 0x015A80 05:BA70: 1C
	.byte 33					;- D 0 - - - 0x015A81 05:BA71: 21
	.byte 38					;- D 0 - - - 0x015A82 05:BA72: 26
	.byte 40					;- D 0 - - - 0x015A83 05:BA73: 28
	.byte 43					;- D 0 - - - 0x015A84 05:BA74: 2B
	.byte 48					;- D 0 - - - 0x015A85 05:BA75: 30
	.byte 50					;- D 0 - - - 0x015A86 05:BA76: 32
	.byte 57					;- D 0 - - - 0x015A87 05:BA77: 39
	.byte 60					;- D 0 - - - 0x015A88 05:BA78: 3C
	.byte 72					;- D 0 - - - 0x015A89 05:BA79: 48

IRQRoundsLatch:
.ifdef REGION_JP
	.byte 170					;- - - - - - 0x015A8A 05:BA7A: AA Round 08
	.byte 146					;- - - - - - 0x015A8B 05:BA7B: 92 Round 13
	.byte 177					;- - - - - - 0x015A8C 05:BA7C: B1 Round 17
	.byte 224					;- - - - - - 0x015A8D 05:BA7D: E0 Round 20
	.byte 180					;- - - - - - 0x015A8E 05:BA7E: B4 Round 28
	.byte 85					;- - - - - - 0x015A8F 05:BA7F: 55 Round 33
	.byte 209					;- - - - - - 0x015A90 05:BA80: D1 Round 38
	.byte 224					;- - - - - - 0x015A91 05:BA81: E0 Round 40
	.byte 36					;- - - - - - 0x015A92 05:BA82: 24 Round 43
	.byte 170					;- - - - - - 0x015A93 05:BA83: AA Round 48
	.byte 116					;- - - - - - 0x015A94 05:BA84: 74 Round 50
	.byte 160					;- - - - - - 0x015A95 05:BA85: A0 Round 57
	.byte 225					;- - - - - - 0x015A96 05:BA86: E1 Round 60
	.byte 177					;- - - - - - 0x015A97 05:BA87: B1 Round 72
.else
	.byte 86					;- D 0 - - - 0x015A8A 05:BA7A: 56 Round 08
	.byte 110					;- D 0 - - - 0x015A8B 05:BA7B: 6E Round 13
	.byte 78					;- D 0 - - - 0x015A8C 05:BA7C: 4E Round 17
	.byte 32					;- D 0 - - - 0x015A8D 05:BA7D: 20 Round 20
	.byte 76					;- D 0 - - - 0x015A8E 05:BA7E: 4C Round 28
	.byte 171					;- D 0 - - - 0x015A8F 05:BA7F: AB Round 33
	.byte 47					;- D 0 - - - 0x015A90 05:BA80: 2F Round 38
	.byte 32					;- D 0 - - - 0x015A91 05:BA81: 20 Round 40
	.byte 216					;- D 0 - - - 0x015A92 05:BA82: D8 Round 43
	.byte 86					;- D 0 - - - 0x015A93 05:BA83: 56 Round 48
	.byte 140					;- D 0 - - - 0x015A94 05:BA84: 8C Round 50
	.byte 97					;- D 0 - - - 0x015A95 05:BA85: 61 Round 57
	.byte 31					;- D 0 - - - 0x015A96 05:BA86: 1F Round 60
	.byte 79					;- D 0 - - - 0x015A97 05:BA87: 4F Round 72
.endif

ProjScriptTable:
	;- - - - - - 0x015A98 05:BA88: EC
	.word psPlaceholder				;00
	.word psInvaderBeam				;01
	.word psInvaderBlast				;02
	.word psDrunkBottleBegin				;03
	.word psDrunkBottle				;04
	.word psDrunkBlast				;05
	.word psDOHBrickBegin				;06
	.word psDangerUntilOffscreen				;07
	.word psNeedlerSyringe				;08
	.word psDespawnParentState7				;09
	.word psRoboZenMissileBegin				;0A
	.word psRoboZenMissile				;0B
	.word psGravityProj				;0C
	.word psNeedlerSyringeBegin				;0D
	.word psFlarionFireBeginR				;0E
	.word psFlarionFireBeginL				;0F
	.word psMissileTractor				;10
	.word psChuckerRockBegin				;11
	.word psChuckerRock				;12
	.word psRoboZenHand				;13
	.word psRoboZenHandWinding				;14
	.word psNeedParentAndScreen				;15
	.word psBonusBall				;16
	.word psSplashText				;17
	.word psArmorDrop				;18
	.word psArmorFalling				;19
	.word psRuckusBomb				;1A
	.word psDangerousExplosion				;1B
	.word psBossProj				;1C
	.word psRocNextPhase				;1D
	.word psRocCircle				;1E
	.word psRocMadLightning				;1F
	.word psSuperDrunkOrbsBegin			;20
	.word psSuperDrunkOrb				;21
	.word psSuperDrunkShatterBegin				;22
	.word psSuperDrunkShatter				;23
	.word psBlueSkullFireBegin				;24
	.word psBlueSkullFire				;25
	.word psPurpleSkullTarget				;26
	.word psRedSkullHeart				;27
	.word psFinalSkelMonstaSideways				;28
	.word psFinalSkelMonstaMovingSideways				;29
	.word psFinalSkelMonstaHalt				;2A
	.word psFinalSkelMonstaHDist				;2B
	.word psFinalSkelMonstaVDist				;2C
	.word psFinalSkelMonstaLose				;2D
	.word psRoboZenDieBeginL				;2E
	.word psRoboZenDieBeginR				;2F
	.word psRoboZenDie				;30
	.word psChuckerRockBreak				;31

psPlaceholder:
	;- - - - - - 0x015AFC 05:BAEC: 00
	.byte PO_BREAK
	.byte PO_END

psInvaderBeam:
	;- D 0 - - - 0x015AFE 05:BAEE: 07
	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @baf8
		.byte PO_HURT_PLAYER
		.byte PO_JUMP
		.word @bb00
	@baf8:
	.byte PO_VSPEED,2
	.byte PO_GET_POS
	.byte PO_JUMP_LARGER,scratch5,208
	.word @end

	@bb00:
	.byte PO_NEXT_TYPE
	.byte PO_ANIM
	.word anInvaderBlast_ID
	.byte PO_VSPEED,0
	.byte PO_COUNT,0
	@end:
	.byte PO_END

psInvaderBlast:
	;- D 0 - - - 0x015B19 05:BB09: 0E
	.byte PO_JUMP_COUNT,8
	.word @end
		.byte PO_DESPAWN
	@end:
	.byte PO_END

psDrunkBottleBegin:
	;- D 0 - - - 0x015B1F 05:BB0F: 04
	.byte PO_VSPEED,0
	.byte PO_COUNT,0
	.byte PO_GET_PARENT_DIR
	.byte PO_JUMP_EQUAL,scratch5,DIR_LEFT
	.word @left
		.byte PO_HSPEED,4
		.byte PO_JUMP
		.word @havespeed
	@left:
	.byte PO_HSPEED,-4
	@havespeed:
	.byte PO_NEXT_TYPE
	.byte PO_END

psDrunkBottle:
	;- D 0 - - - 0x015B32 05:BB22: 13
	.byte PO_GET_PARENT_STATE
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @bb47
		.byte PO_GET_COUNT
		.byte PO_JUMP_NOT_EQUAL,scratch5,0
		.word @bb40
			.byte PO_TERRAIN
			.byte PO_JUMP_NOT_EQUAL,scratch4,0
			.word @bounce
				.byte PO_GET_OFFSCREEN
				.byte PO_JUMP_EQUAL,scratch5,0
				.word @bb40
			@bounce:
			.byte PO_COUNT,1
			.byte PO_HTURN
			.byte PO_JUMP
			.word @end
		@bb40:
		.byte PO_GET_PLAYER_CONTACT
		.byte PO_JUMP_EQUAL,scratch5,0
		.word @bb52

		.byte PO_HURT_PLAYER
	@bb47:
	.byte PO_NEXT_TYPE
	.byte PO_ANIM
	.word anDrunkBlast_ID
	.byte PO_HSPEED,0
	.byte PO_COUNT,0
	.byte PO_JUMP
	.word @end

	@bb52:
	.byte PO_GET_COUNT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @end

	.byte PO_GET_PARENT
	.byte PO_GET_ENEMY_REACHED
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @end

	.byte PO_PARENT_STATE,1
	.byte PO_DESPAWN
	@end:
	.byte PO_END

psDrunkBlast:
	;- D 0 - - - 0x015B73 05:BB63: 13
	.byte PO_GET_PARENT_STATE
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @bb6b
		.byte PO_PARENT_STATE,1
	@bb6b:
	.byte PO_JUMP_COUNT,12
	.word @end
		.byte PO_DESPAWN
	@end:
	.byte PO_END

psDOHBrickBegin:
	;- D 0 - - - 0x015B81 05:BB71: 02
	.byte PO_NEXT_TYPE
	.byte PO_HOMING_PLAYER
	.byte PO_APPLY_ANGLE
	.byte PO_SOUND,snEnemyThrow_ID
	.byte PO_END

psDangerUntilOffscreen:
	;- D 0 - - - 0x015B87 05:BB77: 07
	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @notplayer
		.byte PO_HURT_PLAYER
		.byte PO_JUMP
		.word @despawn
	@notplayer:
	.byte PO_GET_OFFSCREEN
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @end

	@despawn:
	.byte PO_DESPAWN
	@end:
	.byte PO_END

psNeedlerSyringe:
	;- D 0 - - - 0x015B99 05:BB89: 13
	.byte PO_GET_PARENT_STATE
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @bbb1

	.byte PO_JUMP_NOT_LARGER,scratch5,11
	.word @bbb1

	.byte PO_COPY_PLAYER_STATE,scratch5
	.byte PO_JUMP_EQUAL,scratch5,8
	.word @bba1

	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_NOT_EQUAL,scratch5,0
	.word @bbc6

	@bba1:
	.byte PO_GET_SPEED
	.byte PO_JUMP_NOT_LARGER,scratch5,$80
	.word @bbbd
	.byte PO_GET_PARENT
	.byte PO_GET_ENEMY_REACHED
	.byte PO_JUMP_NOT_EQUAL,scratch5,0
	.word @bbcd
	.byte PO_JUMP
	.word @bbbd

	@bbb1:
	.byte PO_GET_SPEED
	.byte PO_JUMP_NOT_EQUAL,scratch5,4
	.word @bbbd
	.byte PO_GET_POS
	.byte PO_JUMP_NOT_LARGER,scratch5,-24
	.word @bbd2
	@bbbd:
	.byte PO_JUMP_FRAME,$02
	.word @bbc3
		.byte PO_GRAV,4
	@bbc3:
	.byte PO_JUMP
	.word @end
	@bbc6:
	.byte PO_CATCH_PLAYER
	.byte PO_NEXT_TYPE
	.byte PO_PARENT_STATE,$06
	.byte PO_JUMP
	.word @end
	@bbcd:
	.byte PO_PARENT_ANIM
	.word anNeedler_ID
	.byte PO_PARENT_STATE,$02
	@bbd2:
	.byte PO_DESPAWN
	@end:
	.byte PO_END

psDespawnParentState7:
	;- D 0 - - - 0x015BE4 05:BBD4: 05
	.byte PO_SPEED,0,0
	.byte PO_GET_PARENT_STATE
	.byte PO_JUMP_LARGER,scratch5,7
	.word @end
		.byte PO_DESPAWN
	@end:
	.byte PO_END

psRoboZenMissileBegin:
	;- D 0 - - - 0x015BEF 05:BBDF: 09
	.byte PO_ANIM
	.word anRoboZenMissileRight_ID
	.byte PO_SPEED,2,0
	.byte PO_GET_PARENT_DIR
	.byte PO_JUMP_EQUAL,scratch5,DIR_RIGHT
	.word @dirchecked
		.byte PO_ANIM
		.word anRoboZenMissileLeft_ID
		.byte PO_HSPEED,-2
	@dirchecked:
	.byte PO_NEXT_TYPE
	.byte PO_END

psRoboZenMissile:
	;- D 0 - - - 0x015C02 05:BBF2: 13
	.byte PO_GET_PARENT_STATE
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @despawn

	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @notplayer
		.byte PO_HURT_PLAYER
		.byte PO_DESPAWN
		.byte PO_JUMP
		.word @end
	@notplayer:
	.byte PO_JUMP_COUNT,80
	.word @bc12
		.byte PO_GET_PLAYER_DIST
		.byte PO_JUMP_NOT_LARGER,scratch4,48
		.word @bc1a

		.byte PO_JUMP_NOT_LARGER,scratch5,48
		.word @bc1a
	@bc12:
	.byte PO_JUMP_FRAME,$0E
	.word @bc1a
		.byte PO_HOMING_PLAYER
		.byte PO_HOMING_TURN
		.byte PO_APPLY_ANGLE
		.byte PO_MISSILE_ANIM
	@bc1a:
	.byte PO_GET_OFFSCREEN
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @end

	@despawn:
	.byte PO_DESPAWN
	@end:
	.byte PO_END

psGravityProj:
	;- D 0 - - - 0x015C32 05:BC22: 08
	.byte PO_GET_OFFSCREEN
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @onscreen
		.byte PO_DESPAWN
		.byte PO_JUMP
		.word @end
	@onscreen:
	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @playerchecked
		.byte PO_HURT_PLAYER
	@playerchecked:
	.byte PO_JUMP_FRAME,$06
	.word @bc43

	.byte PO_GET_SPEED
	.byte PO_JUMP_NOT_LARGER,scratch5,$80
	.word @bc43

	.byte PO_JUMP_LARGER,scratch5,4
	.word @bc43
		.byte PO_SLOW
	@bc43:
	.byte PO_JUMP_FRAME,$02
	.word @end
		.byte PO_GRAV,4
	@end:
	.byte PO_END

psNeedlerSyringeBegin:
	;- D 0 - - - 0x015C5A 05:BC4A: 05
	.byte PO_SPEED,0,-9
	.byte PO_TYPE,psNeedlerSyringe_ID
	.byte PO_END

psFlarionFireBeginR:
	;- D 0 - - - 0x015C60 05:BC50: 05
	.byte PO_SPEED,2,-8
	.byte PO_TYPE,psGravityProj_ID
	.byte PO_SOUND,snFire_ID
	.byte PO_END

psFlarionFireBeginL:
	;- D 0 - - - 0x015C68 05:BC58: 05
	.byte PO_SPEED,-2,-8
	.byte PO_TYPE,psGravityProj_ID
	.byte PO_END

psMissileTractor:
	;- D 0 - - - 0x015C6E 05:BC5E: 31
	.byte PO_COUNT_TYPE,$0C
	.byte PO_JUMP_NOT_EQUAL,scratch5,0
	.word @shootchecked
		.byte PO_TRACTOR_MISSILE,0,-8
		.byte PO_TRACTOR_MISSILE,2,-8
		.byte PO_TRACTOR_MISSILE,-2,-8
		.byte PO_SOUND,snEnemyThrow_ID
	@shootchecked:
	.byte PO_DESPAWN
	.byte PO_END

psChuckerRockBegin:
	;- D 0 - - - 0x015C82 05:BC72: 0D
	.byte PO_JUMP
	.word psDrunkBottleBegin

psChuckerRock:
	;- D 0 - - - 0x015C85 05:BC75: 07
	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @bc7f
		.byte PO_HURT_PLAYER
		.byte PO_JUMP
		.word @bc88
	@bc7f:
	.byte PO_TERRAIN
	.byte PO_JUMP_NOT_EQUAL,scratch4,0
	.word @bc88
		.byte PO_JUMP
		.word @end
	@bc88:
	.byte PO_HSPEED,0
	.byte PO_ANIM
	.word anChuckerBlast_ID
	.byte PO_TYPE,psChuckerRockBreak_ID
	@end:
	.byte PO_END

psRoboZenHand:
	;- D 0 - - - 0x015CA0 05:BC90: 13
	.byte PO_GET_PARENT_STATE
	.byte PO_JUMP_NOT_EQUAL,scratch5,0
	.word @bc99
		.byte PO_JUMP
		.word psNeedParentAndScreen_Despawn
	@bc99:
	.byte PO_GET_PARENT
	.byte PO_HOMING_ENEMY,scratch5
	.byte PO_APPLY_ANGLE
	.byte PO_GET_PARENT
	.byte PO_GET_ENEMY_REACHED
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @end

	.byte PO_NEXT_TYPE
.ifndef REGION_JP
	.byte PO_PARENT_STATE,$0E
.endif

	.byte PO_SOUND,snUNK19_ID
	.byte PO_VSPEED,-6
	.byte PO_GET_PARENT_DIR
	.byte PO_WARP_PARENT
	.byte PO_JUMP_EQUAL,scratch5,DIR_LEFT
	.word @bcbd
		.byte PO_ANIM
		.word anHandWindingR_ID
		.byte PO_PARENT_ANIM
		.word anRoboZenWindingR_ID
		.byte PO_HSPEED,-14
		.byte PO_JUMP
		.word @end
	@bcbd:
	.byte PO_ANIM
	.word anHandWindingL_ID
	.byte PO_PARENT_ANIM
	.word anRoboZenWindingL_ID
	.byte PO_HSPEED,14
	@end:
	.byte PO_END

psRoboZenHandWinding:
	;- D 0 - - - 0x015CD6 05:BCC6: 13
.ifdef REGION_JP
	;- - - - - - 0x015CD4 05:BCC4: 12
	.byte PO_PARENT_STATE,$0E
.endif

.ifndef REGION_JP
	.byte PO_GET_PARENT_STATE
	.byte PO_JUMP_EQUAL,scratch5,0
	.word psNeedParentAndScreen_Despawn
.endif

	.byte PO_SPEED,0,0
	.byte PO_GET_PARENT
	.byte PO_ADJUST_HITS,scratch5,-1
	.byte PO_JUMP_COUNT,84
	.word @end
		.byte PO_ANIM
		.word anRoboZenHandR_ID
		.byte PO_NEXT_TYPE
		.byte PO_PARENT_STATE,$01
		.byte PO_SPEED,2,1
	@end:
	.byte PO_END

psNeedParentAndScreen:
	;- D 0 - - - 0x015CF1 05:BCE1: 13
.ifndef REGION_JP
	.byte PO_GET_PARENT_STATE
	.byte PO_JUMP_EQUAL,scratch5,0
	.word psNeedParentAndScreen_Despawn
.endif

	.byte PO_GET_OFFSCREEN
	.byte PO_JUMP_EQUAL,scratch5,0
	.word psNeedParentAndScreen_End
psNeedParentAndScreen_Despawn:
	.byte PO_DESPAWN
psNeedParentAndScreen_End:
	.byte PO_END

psBonusBall:
	;- D 0 - - - 0x015CFF 05:BCEF: 35
	.byte PO_BONUS_BALL
	.byte PO_END

psSplashText:
	;- D 0 - - - 0x015D01 05:BCF1: 05
	.byte PO_SPEED,0,0
	.byte PO_JUMP_COUNT,120
	.word @end
		.byte PO_DESPAWN
	@end:
	.byte PO_END

psArmorDrop:
	;- D 0 - - - 0x015D0A 05:BCFA: 05
	.byte PO_SPEED,4,-8
	.byte PO_NEXT_TYPE
	.byte PO_END

psArmorFalling:
	;- D 0 - - - 0x015D0F 05:BCFF: 11
	.byte PO_GRAV,8
	.byte PO_JUMP
	.word psNeedParentAndScreen

psRuckusBomb:
	;- D 0 - - - 0x015D14 05:BD04: 2B
	.byte PO_GET_SPEED
	.byte PO_GRAV,6
	.byte PO_JUMP_NOT_EQUAL,scratch5,6
	.word @checkplayer

	;Bounce on floor
	.byte PO_SOUND,snBall_ID
	.byte PO_VTURN
	.byte PO_JUMP_COUNT,3
	.word @checkplayer

	.byte PO_JUMP
	.word @explode

	@checkplayer:
	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @playerchecked
		.byte PO_HURT_PLAYER
		@explode:
		.byte PO_SOUND,snBomb_ID
		.byte PO_NEXT_TYPE
		.byte PO_ANIM
		.word anRuckusBlast_ID
	@playerchecked:
	.byte PO_JUMP
	.word psNeedParentAndScreen

psDangerousExplosion:
	;- D 0 - - - 0x015D36 05:BD26: 05
	.byte PO_SPEED,0,0
	.byte PO_JUMP_COUNT,40
	.word @active
		.byte PO_DESPAWN
	@active:
	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @end
		.byte PO_HURT_PLAYER
	@end:
	.byte PO_END

psBossProj:
	;- D 0 - - - 0x015D46 05:BD36: 07
	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @bd3d
		.byte PO_HURT_PLAYER
	@bd3d:
	.byte PO_GET_OFFSCREEN
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @end
		.byte PO_DESPAWN
	@end:
	.byte PO_END

psRocNextPhase:
	;- D 0 - - - 0x015D55 05:BD45: 29
	;Lightning pair going into Roc
	.byte PO_GET_PARENT
	.byte PO_GET_ENEMY_REACHED
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @end
		.byte PO_PARENT_ANIM
		.word anRocMad_ID
		.byte PO_GET_PARENT
		.byte PO_ADJUST_HITS,scratch5,1
		.byte PO_PARENT_STATE,$03
		.byte PO_DESPAWN
	@end:
	.byte PO_END

psRocCircle:
	;- D 0 - - - 0x015D67 05:BD57: 1B
	.byte PO_MULTIPROJ,MULTIPROJ_ROC
	.byte PO_END

psRocMadLightning:
	;- D 0 - - - 0x015D6A 05:BD5A: 0D
	.byte PO_JUMP
	.word psBossProj

psSuperDrunkOrbsBegin:
	;- D 0 - - - 0x015D6D 05:BD5D: 1B
	.byte PO_MULTIPROJ,MULTIPROJ_SUPERDRUNK
	.byte PO_END

psSuperDrunkOrb:
	;- D 0 - - - 0x015D70 05:BD60: 0D
	.byte PO_JUMP
	.word psBossProj

psSuperDrunkShatterBegin:
	;- D 0 - - - 0x015D73 05:BD63: 36
	.byte PO_DESPAWN_ALL
	.byte PO_MULTIPROJ,MULTIPROJ_SUPERDRUNK_DEFEAT
	.byte PO_END

psSuperDrunkShatter:
	;- D 0 - - - 0x015D77 05:BD67: 0D
	.byte PO_JUMP
	.word psNeedParentAndScreen

psBlueSkullFireBegin:
	;- D 0 - - - 0x015D7A 05:BD6A: 31
	.byte PO_COUNT_TYPE,$25
	.byte PO_JUMP_NOT_EQUAL,scratch5,0
	.word @bd76
		.byte PO_MULTIPROJ,MULTIPROJ_BLUESKULL
		.byte PO_JUMP
		.word @end
	@bd76:
	.byte PO_DESPAWN
	@end:
	.byte PO_END

psBlueSkullFire:
	;- D 0 - - - 0x015D88 05:BD78: 0D
	.byte PO_JUMP
	.word psBossProj

psPurpleSkullTarget:
	;- D 0 - - - 0x015D8B 05:BD7B: 07
	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @notplayer
		;Reached player
		.byte PO_COPY_PLAYER_STATE,scratch5
		.byte PO_JUMP_EQUAL,scratch5,3
		.word @notplayer
			;Shrink player
			.byte PO_PLAYER_STATE,$0D
			.byte PO_JUMP
			.word @despawn
	@notplayer:
	.byte PO_JUMP_COUNT,30
	.word @checkaim

	.byte PO_GET_PLAYER_DIST
	.byte PO_JUMP_NOT_LARGER,scratch4,40
	.word @travel

	.byte PO_JUMP_NOT_LARGER,scratch5,40
	.word @travel

	@checkaim:
	.byte PO_JUMP_FRAME,$06
	.word @travel

	.byte PO_HOMING_PLAYER
	.byte PO_HOMING_TURN
	.byte PO_APPLY_ANGLE

	@travel:
	.byte PO_GET_OFFSCREEN
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @end
	;Despawn if offscreen

	@despawn:
	.byte PO_DESPAWN
	@end:
	.byte PO_END

psRedSkullHeart:
	;- D 0 - - - 0x015DBB 05:BDAB: 2D
	.byte PO_COPY_PLAYER_STATE,scratch5
	.byte PO_JUMP_EQUAL,scratch5,3
	.word @bdb8
		.byte PO_GET_PLAYER_CONTACT
		.byte PO_JUMP_NOT_EQUAL,scratch5,0
		.word @bdd1
	@bdb8:
	.byte PO_GET_COUNT
	.byte PO_GET_ENEMY_REACHED
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @bdc6

	.byte PO_GET_COUNT
	.byte PO_ADJUST_HITS,scratch5,-1
	.byte PO_JUMP
	.word @bdd2

	@bdc6:
	.byte PO_JUMP_FRAME,$06
	.word @end

	.byte PO_GET_COUNT
	.byte PO_HOMING_ENEMY,scratch5
	.byte PO_APPLY_ANGLE
	.byte PO_JUMP
	.word @end
	@bdd1:
	.byte PO_HEART
	@bdd2:
	.byte PO_DESPAWN
	@end:
	.byte PO_END

psFinalSkelMonstaSideways:
	;- D 0 - - - 0x015DE4 05:BDD4: 0E
	.byte PO_JUMP_COUNT,12
	.word @end

	.byte PO_COUNT,0
	.byte PO_HSPEED,4
	.byte PO_ANIM
	.word anFinalSkelMonstaR_ID
	.byte PO_GET_PARENT_DIR
	.byte PO_JUMP_EQUAL,scratch5,DIR_RIGHT
	.word @bdea
		.byte PO_ANIM
		.word anFinalSkelMonstaL_ID
		.byte PO_HSPEED,-4
	@bdea:
	.byte PO_NEXT_TYPE
	@end:
	.byte PO_END

psFinalSkelMonstaMovingSideways:
	;- D 0 - - - 0x015DFC 05:BDEC: 0E
	.byte PO_JUMP_COUNT,10
	.word @bdf5
		.byte PO_COUNT,0
		.byte PO_PARENT,1
		.byte PO_NEXT_TYPE
	@bdf5:
	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @end
		.byte PO_HURT_PLAYER
	@end:
	.byte PO_END

psFinalSkelMonstaHalt:
	;- D 0 - - - 0x015E0D 05:BDFD: 05
	.byte PO_SPEED,0,0
	.byte PO_JUMP_COUNT,16
	.word psFinalSkelMonstaHalt_CheckPlayer

	.byte PO_COUNT,0
	.byte PO_GET_PARENT
	.byte PO_JUMP_EQUAL,scratch5,1
	.word @be24

	.byte PO_TYPE,psFinalSkelMonstaHDist_ID
	.byte PO_GET_PLAYER_SIDE
	.byte PO_JUMP_EQUAL,scratch4,1
	.word @be1c

	.byte PO_ANIM
	.word anFinalSkelMonstaL_ID
	.byte PO_HSPEED,-3
	.byte PO_JUMP
	.word psFinalSkelMonstaHalt_CheckPlayer

	@be1c:
	.byte PO_ANIM
	.word anFinalSkelMonstaR_ID
	.byte PO_HSPEED,3
	.byte PO_JUMP
	.word psFinalSkelMonstaHalt_CheckPlayer

	@be24:
	.byte PO_TYPE,psFinalSkelMonstaVDist_ID
	.byte PO_GET_PLAYER_SIDE
	.byte PO_JUMP_EQUAL,scratch5,1
	.word @be31

	.byte PO_VSPEED,-3
	.byte PO_JUMP
	.word psFinalSkelMonstaHalt_CheckPlayer

	@be31:
	.byte PO_VSPEED,3
psFinalSkelMonstaHalt_CheckPlayer:
	.byte PO_GET_PLAYER_CONTACT
	.byte PO_JUMP_EQUAL,scratch5,0
	.word @end
		.byte PO_HURT_PLAYER
	@end:
	.byte PO_END

psFinalSkelMonstaHDist:
	;- D 0 - - - 0x015E4B 05:BE3B: 1A
	.byte PO_GET_PLAYER_DIST
	.byte PO_JUMP_LARGER,scratch4,9
	.word @be45
		.byte PO_JUMP_COUNT,16
		.word @be4b
	@be45:
		.byte PO_TYPE,psFinalSkelMonstaHalt_ID
		.byte PO_PARENT,1
		.byte PO_COUNT,0
	@be4b:
	.byte PO_JUMP
	.word psFinalSkelMonstaHalt_CheckPlayer

psFinalSkelMonstaVDist:
	;- D 0 - - - 0x015E5E 05:BE4E: 1A
	.byte PO_GET_PLAYER_DIST
	.byte PO_JUMP_LARGER,scratch5,9
	.word @be58
		.byte PO_JUMP_COUNT,16
		.word @be5e
	@be58:
		.byte PO_TYPE,psFinalSkelMonstaHalt_ID
		.byte PO_PARENT,0
		.byte PO_COUNT,0
	@be5e:
	.byte PO_JUMP
	.word psFinalSkelMonstaHalt_CheckPlayer

psFinalSkelMonstaLose:
	;- D 0 - - - 0x015E71 05:BE61: 05
	.byte PO_SPEED,0,0
	.byte PO_JUMP_COUNT,112
	.word @be6c
		.byte PO_DESPAWN
		.byte PO_JUMP
		.word @end
	@be6c:
	.byte PO_GET_COUNT
	.byte PO_JUMP_NOT_EQUAL,scratch5,100
	.word @end
		.byte PO_ANIM
		.word anFinalSkelMonstaLeave_ID
	@end:
	.byte PO_END

psRoboZenDieBeginL:
	;- D 0 - - - 0x015E86 05:BE76: 05
	.byte PO_SPEED,2,-8
	.byte PO_TYPE,psRoboZenDie_ID
	.byte PO_SOUND,snFire_ID
	.byte PO_END

psRoboZenDieBeginR:
	;- D 0 - - - 0x015E8E 05:BE7E: 05
	.byte PO_SPEED,-2,-8
	.byte PO_TYPE,psRoboZenDie_ID
	.byte PO_END

psRoboZenDie:
	;- D 0 - - - 0x015E94 05:BE84: 26
	.byte PO_GET_POS
	.byte PO_JUMP_LARGER,scratch5,-24
	.word @be93

	.byte PO_JUMP_NOT_LARGER,scratch5,-16
	.word @be93

	.byte PO_DESPAWN
	.byte PO_JUMP
	.word @end

	@be93:
	.byte PO_JUMP_FRAME,$06
	.word @bea3

	.byte PO_GET_SPEED
	.byte PO_JUMP_NOT_LARGER,scratch5,$80
	.word @bea3

	.byte PO_JUMP_LARGER,scratch5,4
	.word @bea3
		.byte PO_SLOW
	@bea3:
	.byte PO_JUMP_FRAME,$02
	.word @end
		.byte PO_GRAV,4
	@end:
	.byte PO_END

psChuckerRockBreak:
	;- D 0 - - - 0x015EBA 05:BEAA: 0E
	.byte PO_JUMP_COUNT,8
	.word @end
		.byte PO_DESPAWN
	@end:
	.byte PO_END

DATA_0ABEB0:
	.byte $00					;- D 0 - - - 0x015EC0 05:BEB0: 00
	.byte $00					;- D 0 - - - 0x015EC1 05:BEB1: 00
	.byte $20					;- D 0 - - - 0x015EC2 05:BEB2: 20
	.byte $40					;- D 0 - - - 0x015EC3 05:BEB3: 40
	.byte $00					;- D 0 - - - 0x015EC4 05:BEB4: 00
	.byte $20					;- D 0 - - - 0x015EC5 05:BEB5: 20
	.byte $40					;- D 0 - - - 0x015EC6 05:BEB6: 40
	.byte $00					;- D 0 - - - 0x015EC7 05:BEB7: 00
	.byte $20					;- D 0 - - - 0x015EC8 05:BEB8: 20

DATA_0ABEB9:
	.byte $00					;- D 0 - - - 0x015EC9 05:BEB9: 00
	.byte $04					;- D 0 - - - 0x015ECA 05:BEBA: 04
	.byte $01					;- D 0 - - - 0x015ECB 05:BEBB: 01
	.byte $03					;- D 0 - - - 0x015ECC 05:BEBC: 03
	.byte $02					;- D 0 - - - 0x015ECD 05:BEBD: 02
	.byte $02					;- D 0 - - - 0x015ECE 05:BEBE: 02
	.byte $03					;- D 0 - - - 0x015ECF 05:BEBF: 03
	.byte $01					;- D 0 - - - 0x015ED0 05:BEC0: 01
	.byte $04					;- D 0 - - - 0x015ED1 05:BEC1: 04
	.byte $00					;- D 0 - - - 0x015ED2 05:BEC2: 00
	.byte $03					;- D 0 - - - 0x015ED3 05:BEC3: 03
	.byte $FF					;- D 0 - - - 0x015ED4 05:BEC4: FF
	.byte $02					;- D 0 - - - 0x015ED5 05:BEC5: 02
	.byte $FE					;- D 0 - - - 0x015ED6 05:BEC6: FE
	.byte $01					;- D 0 - - - 0x015ED7 05:BEC7: 01
	.byte $FD					;- D 0 - - - 0x015ED8 05:BEC8: FD
	.byte $00					;- D 0 - - - 0x015ED9 05:BEC9: 00
	.byte $FC					;- D 0 - - - 0x015EDA 05:BECA: FC
	.byte $FF					;- D 0 - - - 0x015EDB 05:BECB: FF
	.byte $FD					;- D 0 - - - 0x015EDC 05:BECC: FD
	.byte $FE					;- D 0 - - - 0x015EDD 05:BECD: FE
	.byte $FE					;- D 0 - - - 0x015EDE 05:BECE: FE
	.byte $FD					;- D 0 - - - 0x015EDF 05:BECF: FD
	.byte $FF					;- D 0 - - - 0x015EE0 05:BED0: FF
	.byte $FC					;- D 0 - - - 0x015EE1 05:BED1: FC
	.byte $00					;- D 0 - - - 0x015EE2 05:BED2: 00
	.byte $FD					;- D 0 - - - 0x015EE3 05:BED3: FD
	.byte $01					;- D 0 - - - 0x015EE4 05:BED4: 01
	.byte $FE					;- D 0 - - - 0x015EE5 05:BED5: FE
	.byte $02					;- D 0 - - - 0x015EE6 05:BED6: 02
	.byte $FF					;- D 0 - - - 0x015EE7 05:BED7: FF
	.byte $03					;- D 0 - - - 0x015EE8 05:BED8: 03
	.byte $00					;- D 0 - - - 0x015EE9 05:BED9: 00
	.byte $05					;- D 0 - - - 0x015EEA 05:BEDA: 05
	.byte $01					;- D 0 - - - 0x015EEB 05:BEDB: 01
	.byte $04					;- D 0 - - - 0x015EEC 05:BEDC: 04
	.byte $02					;- D 0 - - - 0x015EED 05:BEDD: 02
	.byte $02					;- D 0 - - - 0x015EEE 05:BEDE: 02
	.byte $04					;- D 0 - - - 0x015EEF 05:BEDF: 04
	.byte $01					;- D 0 - - - 0x015EF0 05:BEE0: 01
	.byte $05					;- D 0 - - - 0x015EF1 05:BEE1: 05
	.byte $00					;- D 0 - - - 0x015EF2 05:BEE2: 00
	.byte $04					;- D 0 - - - 0x015EF3 05:BEE3: 04
	.byte $FF					;- D 0 - - - 0x015EF4 05:BEE4: FF
	.byte $02					;- D 0 - - - 0x015EF5 05:BEE5: 02
	.byte $FE					;- D 0 - - - 0x015EF6 05:BEE6: FE
	.byte $01					;- D 0 - - - 0x015EF7 05:BEE7: 01
	.byte $FC					;- D 0 - - - 0x015EF8 05:BEE8: FC
	.byte $00					;- D 0 - - - 0x015EF9 05:BEE9: 00
	.byte $FB					;- D 0 - - - 0x015EFA 05:BEEA: FB
	.byte $FF					;- D 0 - - - 0x015EFB 05:BEEB: FF
	.byte $FC					;- D 0 - - - 0x015EFC 05:BEEC: FC
	.byte $FE					;- D 0 - - - 0x015EFD 05:BEED: FE
	.byte $FE					;- D 0 - - - 0x015EFE 05:BEEE: FE
	.byte $FC					;- D 0 - - - 0x015EFF 05:BEEF: FC
	.byte $FF					;- D 0 - - - 0x015F00 05:BEF0: FF
	.byte $FB					;- D 0 - - - 0x015F01 05:BEF1: FB
	.byte $00					;- D 0 - - - 0x015F02 05:BEF2: 00
	.byte $FC					;- D 0 - - - 0x015F03 05:BEF3: FC
	.byte $01					;- D 0 - - - 0x015F04 05:BEF4: 01
	.byte $FE					;- D 0 - - - 0x015F05 05:BEF5: FE
	.byte $02					;- D 0 - - - 0x015F06 05:BEF6: 02
	.byte $FF					;- D 0 - - - 0x015F07 05:BEF7: FF
	.byte $04					;- D 0 - - - 0x015F08 05:BEF8: 04
	.byte $00					;- D 0 - - - 0x015F09 05:BEF9: 00
	.byte $06					;- D 0 - - - 0x015F0A 05:BEFA: 06
	.byte $02					;- D 0 - - - 0x015F0B 05:BEFB: 02
	.byte $04					;- D 0 - - - 0x015F0C 05:BEFC: 04
	.byte $03					;- D 0 - - - 0x015F0D 05:BEFD: 03
	.byte $03					;- D 0 - - - 0x015F0E 05:BEFE: 03
	.byte $04					;- D 0 - - - 0x015F0F 05:BEFF: 04
	.byte $02					;- D 0 - - - 0x015F10 05:BF00: 02
	.byte $06					;- D 0 - - - 0x015F11 05:BF01: 06
	.byte $00					;- D 0 - - - 0x015F12 05:BF02: 00
	.byte $04					;- D 0 - - - 0x015F13 05:BF03: 04
	.byte $FE					;- D 0 - - - 0x015F14 05:BF04: FE
	.byte $03					;- D 0 - - - 0x015F15 05:BF05: 03
	.byte $FD					;- D 0 - - - 0x015F16 05:BF06: FD
	.byte $02					;- D 0 - - - 0x015F17 05:BF07: 02
	.byte $FC					;- D 0 - - - 0x015F18 05:BF08: FC
	.byte $00					;- D 0 - - - 0x015F19 05:BF09: 00
	.byte $FA					;- D 0 - - - 0x015F1A 05:BF0A: FA
	.byte $FE					;- D 0 - - - 0x015F1B 05:BF0B: FE
	.byte $FC					;- D 0 - - - 0x015F1C 05:BF0C: FC
	.byte $FD					;- D 0 - - - 0x015F1D 05:BF0D: FD
	.byte $FD					;- D 0 - - - 0x015F1E 05:BF0E: FD
	.byte $FC					;- D 0 - - - 0x015F1F 05:BF0F: FC
	.byte $FE					;- D 0 - - - 0x015F20 05:BF10: FE
	.byte $FA					;- D 0 - - - 0x015F21 05:BF11: FA
	.byte $00					;- D 0 - - - 0x015F22 05:BF12: 00
	.byte $FC					;- D 0 - - - 0x015F23 05:BF13: FC
	.byte $02					;- D 0 - - - 0x015F24 05:BF14: 02
	.byte $FD					;- D 0 - - - 0x015F25 05:BF15: FD
	.byte $03					;- D 0 - - - 0x015F26 05:BF16: 03
	.byte $FE					;- D 0 - - - 0x015F27 05:BF17: FE
	.byte $04					;- D 0 - - - 0x015F28 05:BF18: 04

DATA_0ABF19:
	.byte $01					;- D 0 - - - 0x015F29 05:BF19: 01
	.byte $00					;- D 0 - - - 0x015F2A 05:BF1A: 00
	.byte $01					;- D 0 - - - 0x015F2B 05:BF1B: 01
	.byte $00					;- D 0 - - - 0x015F2C 05:BF1C: 00
	.byte $01					;- D 0 - - - 0x015F2D 05:BF1D: 01
	.byte $01					;- D 0 - - - 0x015F2E 05:BF1E: 01
	.byte $01					;- D 0 - - - 0x015F2F 05:BF1F: 01
	.byte $01					;- D 0 - - - 0x015F30 05:BF20: 01
	.byte $01					;- D 0 - - - 0x015F31 05:BF21: 01
	.byte $01					;- D 0 - - - 0x015F32 05:BF22: 01
	.byte $01					;- D 0 - - - 0x015F33 05:BF23: 01
	.byte $01					;- D 0 - - - 0x015F34 05:BF24: 01
	.byte $00					;- D 0 - - - 0x015F35 05:BF25: 00
	.byte $01					;- D 0 - - - 0x015F36 05:BF26: 01
	.byte $00					;- D 0 - - - 0x015F37 05:BF27: 00
	.byte $01					;- D 0 - - - 0x015F38 05:BF28: 01
	.byte $00					;- D 0 - - - 0x015F39 05:BF29: 00
	.byte $01					;- D 0 - - - 0x015F3A 05:BF2A: 01
	.byte $00					;- D 0 - - - 0x015F3B 05:BF2B: 00
	.byte $01					;- D 0 - - - 0x015F3C 05:BF2C: 01
	.byte $FF					;- D 0 - - - 0x015F3D 05:BF2D: FF
	.byte $01					;- D 0 - - - 0x015F3E 05:BF2E: 01
	.byte $FF					;- D 0 - - - 0x015F3F 05:BF2F: FF
	.byte $01					;- D 0 - - - 0x015F40 05:BF30: 01
	.byte $FF					;- D 0 - - - 0x015F41 05:BF31: FF
	.byte $01					;- D 0 - - - 0x015F42 05:BF32: 01
	.byte $FF					;- D 0 - - - 0x015F43 05:BF33: FF
	.byte $01					;- D 0 - - - 0x015F44 05:BF34: 01
	.byte $FF					;- D 0 - - - 0x015F45 05:BF35: FF
	.byte $00					;- D 0 - - - 0x015F46 05:BF36: 00
	.byte $FF					;- D 0 - - - 0x015F47 05:BF37: FF
	.byte $00					;- D 0 - - - 0x015F48 05:BF38: 00

DATA_0ABF39:
	.byte $00					;- - - - - - 0x015F49 05:BF39: 00
	.byte $00					;- D 0 - - - 0x015F4A 05:BF3A: 00
	.byte $00					;- D 0 - - - 0x015F4B 05:BF3B: 00
	.byte $00					;- D 0 - - - 0x015F4C 05:BF3C: 00
	.byte $00					;- D 0 - - - 0x015F4D 05:BF3D: 00
	.byte $00					;- D 0 - - - 0x015F4E 05:BF3E: 00
	.byte $00					;- D 0 - - - 0x015F4F 05:BF3F: 00
	.byte $00					;- D 0 - - - 0x015F50 05:BF40: 00
	.byte $0E					;- D 0 - - - 0x015F51 05:BF41: 0E
	.byte $00					;- D 0 - - - 0x015F52 05:BF42: 00
	.byte $00					;- D 0 - - - 0x015F53 05:BF43: 00
	.byte $00					;- D 0 - - - 0x015F54 05:BF44: 00
	.byte $00					;- D 0 - - - 0x015F55 05:BF45: 00
	.byte $0E					;- D 0 - - - 0x015F56 05:BF46: 0E
	.byte $00					;- D 0 - - - 0x015F57 05:BF47: 00
	.byte $00					;- D 0 - - - 0x015F58 05:BF48: 00
	.byte $00					;- D 0 - - - 0x015F59 05:BF49: 00
	.byte $0E					;- D 0 - - - 0x015F5A 05:BF4A: 0E
	.byte $00					;- D 0 - - - 0x015F5B 05:BF4B: 00
	.byte $00					;- D 0 - - - 0x015F5C 05:BF4C: 00
	.byte $0D					;- D 0 - - - 0x015F5D 05:BF4D: 0D
	.byte $00					;- D 0 - - - 0x015F5E 05:BF4E: 00
	.byte $00					;- D 0 - - - 0x015F5F 05:BF4F: 00
	.byte $00					;- D 0 - - - 0x015F60 05:BF50: 00
	.byte $00					;- D 0 - - - 0x015F61 05:BF51: 00
	.byte $00					;- D 0 - - - 0x015F62 05:BF52: 00
	.byte $00					;- D 0 - - - 0x015F63 05:BF53: 00
	.byte $00					;- D 0 - - - 0x015F64 05:BF54: 00
	.byte $0F					;- D 0 - - - 0x015F65 05:BF55: 0F
	.byte $00					;- D 0 - - - 0x015F66 05:BF56: 00
	.byte $01					;- D 0 - - - 0x015F67 05:BF57: 01
	.byte $00					;- D 0 - - - 0x015F68 05:BF58: 00
	.byte $02					;- D 0 - - - 0x015F69 05:BF59: 02
	.byte $03					;- D 0 - - - 0x015F6A 05:BF5A: 03
	.byte $02					;- D 0 - - - 0x015F6B 05:BF5B: 02
	.byte $00					;- D 0 - - - 0x015F6C 05:BF5C: 00
	.byte $02					;- D 0 - - - 0x015F6D 05:BF5D: 02
	.byte $02					;- D 0 - - - 0x015F6E 05:BF5E: 02
	.byte $03					;- D 0 - - - 0x015F6F 05:BF5F: 03
	.byte $02					;- D 0 - - - 0x015F70 05:BF60: 02
	.byte $04					;- D 0 - - - 0x015F71 05:BF61: 04
	.byte $00					;- D 0 - - - 0x015F72 05:BF62: 00
	.byte $00					;- D 0 - - - 0x015F73 05:BF63: 00
	.byte $0C					;- D 0 - - - 0x015F74 05:BF64: 0C
	.byte $00					;- D 0 - - - 0x015F75 05:BF65: 00
	.byte $00					;- D 0 - - - 0x015F76 05:BF66: 00
	.byte $00					;- D 0 - - - 0x015F77 05:BF67: 00
	.byte $00					;- D 0 - - - 0x015F78 05:BF68: 00
	.byte $0F					;- D 0 - - - 0x015F79 05:BF69: 0F
	.byte $00					;- D 0 - - - 0x015F7A 05:BF6A: 00
	.byte $05					;- D 0 - - - 0x015F7B 05:BF6B: 05
	.byte $00					;- D 0 - - - 0x015F7C 05:BF6C: 00
	.byte $00					;- D 0 - - - 0x015F7D 05:BF6D: 00
	.byte $00					;- D 0 - - - 0x015F7E 05:BF6E: 00
	.byte $00					;- D 0 - - - 0x015F7F 05:BF6F: 00
	.byte $00					;- D 0 - - - 0x015F80 05:BF70: 00
	.byte $00					;- D 0 - - - 0x015F81 05:BF71: 00
	.byte $0F					;- D 0 - - - 0x015F82 05:BF72: 0F
	.byte $00					;- D 0 - - - 0x015F83 05:BF73: 00
	.byte $00					;- D 0 - - - 0x015F84 05:BF74: 00
	.byte $06					;- D 0 - - - 0x015F85 05:BF75: 06
	.byte $00					;- D 0 - - - 0x015F86 05:BF76: 00
	.byte $00					;- D 0 - - - 0x015F87 05:BF77: 00
	.byte $00					;- D 0 - - - 0x015F88 05:BF78: 00
	.byte $00					;- D 0 - - - 0x015F89 05:BF79: 00
	.byte $00					;- D 0 - - - 0x015F8A 05:BF7A: 00
	.byte $00					;- D 0 - - - 0x015F8B 05:BF7B: 00
	.byte $00					;- D 0 - - - 0x015F8C 05:BF7C: 00
	.byte $00					;- D 0 - - - 0x015F8D 05:BF7D: 00
	.byte $0A					;- D 0 - - - 0x015F8E 05:BF7E: 0A
	.byte $07					;- D 0 - - - 0x015F8F 05:BF7F: 07
	.byte $00					;- D 0 - - - 0x015F90 05:BF80: 00
	.byte $0E					;- D 0 - - - 0x015F91 05:BF81: 0E
	.byte $0A					;- D 0 - - - 0x015F92 05:BF82: 0A
	.byte $00					;- D 0 - - - 0x015F93 05:BF83: 00
	.byte $00					;- D 0 - - - 0x015F94 05:BF84: 00
	.byte $00					;- D 0 - - - 0x015F95 05:BF85: 00
	.byte $00					;- D 0 - - - 0x015F96 05:BF86: 00
	.byte $0A					;- D 0 - - - 0x015F97 05:BF87: 0A
	.byte $08					;- D 0 - - - 0x015F98 05:BF88: 08
	.byte $09					;- D 0 - - - 0x015F99 05:BF89: 09

DATA_0ABF8A:
	.byte mapFanL_ID					;- - - - - - 0x015F9A 05:BF8A: 5A
	.byte mapFanR_ID					;- D 0 - - - 0x015F9B 05:BF8B: 5B
	.byte mapFanL_ID					;- D 0 - - - 0x015F9C 05:BF8C: 5A
	.byte mapFanL_ID					;- D 0 - - - 0x015F9D 05:BF8D: 5A
	.byte mapFanL_ID					;- D 0 - - - 0x015F9E 05:BF8E: 5A
	.byte mapFanR_ID					;- D 0 - - - 0x015F9F 05:BF8F: 5B
	.byte mapFanL_ID					;- D 0 - - - 0x015FA0 05:BF90: 5A
	.byte mapFanR_ID					;- D 0 - - - 0x015FA1 05:BF91: 5B
	.byte mapFanR_ID					;- D 0 - - - 0x015FA2 05:BF92: 5B
	.byte mapFanR_ID					;- D 0 - - - 0x015FA3 05:BF93: 5B
	.byte mapFanL_ID					;- D 0 - - - 0x015FA4 05:BF94: 5A
	.byte mapFanL_ID					;- D 0 - - - 0x015FA5 05:BF95: 5A
	.byte mapFanR_ID					;- D 0 - - - 0x015FA6 05:BF96: 5B
	.byte mapFanR_ID					;- D 0 - - - 0x015FA7 05:BF97: 5B
	.byte mapFanL_ID					;- D 0 - - - 0x015FA8 05:BF98: 5A
	.byte mapFanR_ID					;- D 0 - - - 0x015FA9 05:BF99: 5B
	.byte mapFanL_ID					;- D 0 - - - 0x015FAA 05:BF9A: 5A

DATA_0ABF9B:
	;- - - - - - 0x015FAB 05:BF9B: 00
	.word $2000
	.word $20C8
	.word $20D4
	.word $20CE
	.word $218E
	.word $20C6
	.word $218C
	.word $2194
	.word $21C4
	.word $224E
	.word $2298
	.word $20CE
	.word $21C8
	.word $21D4
	.word $21C6
	.word $21D6
	.word $224E

.ifdef REGION_JP
;Filler data
	;- - - - - - 0x015FC1 05:BFB1: 89
	.incbin "filler/fill0A_JP.bin"
.endif