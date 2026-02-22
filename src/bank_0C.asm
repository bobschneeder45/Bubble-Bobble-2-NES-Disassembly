.segment "PRG_BANK_C"
; 0x018010-0x01A00F

;Contents: Animations, Enemy placement

.include "anim/animations.asm"

EnemyPalettes:
	;- D 0 - - - 0x01931C 06:B30C: 30
	.byte $30,$22	;00(00) Zen-chan
	.byte $30,$16	;01(04) Banebou
	.byte $30,$24	;02(08) Blobby
	.byte $24,$38	;03(0C) Pulpul
	.byte $29,$39	;04(10) Needler
	.byte $38,$27	;05(14) Invader
	.byte $38,$24	;06(18) Monsta
	.byte $30,$2B	;07(1C) Heitai-kun
	.byte $30,$2B	;08(20) Carry-Heli
	.byte $38,$16	;09(24) Flarion
	.byte $30,$23	;0A(28) Snagger
	.byte $38,$25	;0B(2C) Mantichar
	.byte $30,$11	;0C(30) Robo-Zen
	.byte $11,$32	;0D(34) UNUSED (Robo-Zen missile alt? Dark blue and light blue)
	.byte $2B,$27	;0E(38) Kirikabun
	.byte $3B,$2C	;0F(3C) Twizzer
	.byte $38,$1A	;10(40) Drunk
	.byte $30,$2A	;11(44) Rounder
	.byte $27,$20	;12(48) UNUSED (Gold and white)
	.byte $30,$11	;13(4C) Springit
	.byte $37,$27	;14(50) DOH
	.byte $10,$00	;15(54) Trash can
	.byte $38,$18	;16(58) Ruckus
	.byte $38,$25	;17(5C) Mad Monkey
	.byte $38,$27	;18(60) Roc yellow
	.byte $38,$25	;19(64) Roc
	.byte $3B,$2C	;1A(68) Blue skull brother
	.byte $30,$22	;1B(6C) Purple skull brother (real palette)
	.byte $26,$16	;1C(70) UNUSED (Red skull brother, duplicate of red bubble/enemy palette)
	.byte $33,$13	;1D(74) Super Drunk, purple skull brother on round 79
	.byte $26,$16	;1E(78) UNUSED (Red Super Drunk?)
	.byte $38,$27	;1F(7C) UNUSED (Yellow)
	.byte $30,$38	;20(80) Chucker

RoundsEnemyTable:
	;- - - - - - 0x01935E 06:B34E: F0

	;00: Number of enemies
	;Then
	;00: Y
	;01: X
	;02: CHR slot
	;03: Anim
	;04: Enemy ID
	;05: Direction

	;Direction:
	;01: Left
	;02: Right
	;80: Insta-spawn instead of dropping

	.word EnemiesRound01
	.word EnemiesRound01
	.word EnemiesRound02
	.word EnemiesRound03
	.word EnemiesRound04
	.word EnemiesRound05
	.word EnemiesRound06
	.word EnemiesRound07
	.word EnemiesRound08
	.word EnemiesRound09
	.word EnemiesRound10
	.word EnemiesRound11
	.word EnemiesRound12
	.word EnemiesRound13
	.word EnemiesRound14
	.word EnemiesRound15
	.word EnemiesRound16
	.word EnemiesRound17
	.word EnemiesRound18
	.word EnemiesRound19
	.word EnemiesRound20
	.word EnemiesRound21
	.word EnemiesRound22
	.word EnemiesRound23
	.word EnemiesRound24
	.word EnemiesRound25
	.word EnemiesRound26
	.word EnemiesRound27
	.word EnemiesRound28
	.word EnemiesRound29
	.word EnemiesRound30
	.word EnemiesRound31
	.word EnemiesRound32
	.word EnemiesRound33
	.word EnemiesRound34
	.word EnemiesRound35
	.word EnemiesRound36
	.word EnemiesRound37
	.word EnemiesRound38
	.word EnemiesRound39
	.word EnemiesRound40
	.word EnemiesRound41
	.word EnemiesRound42
	.word EnemiesRound43
	.word EnemiesRound44
	.word EnemiesRound45
	.word EnemiesRound46
	.word EnemiesRound47
	.word EnemiesRound48
	.word EnemiesRound49
	.word EnemiesRound50
	.word EnemiesRound51
	.word EnemiesRound52
	.word EnemiesRound53
	.word EnemiesRound54
	.word EnemiesRound55
	.word EnemiesRound56
	.word EnemiesRound57
	.word EnemiesRound58
	.word EnemiesRound59
	.word EnemiesRound60
	.word EnemiesRound61
	.word EnemiesRound62
	.word EnemiesRound63
	.word EnemiesRound64
	.word EnemiesRound65
	.word EnemiesRound66
	.word EnemiesRound67
	.word EnemiesRound68
	.word EnemiesRound69
	.word EnemiesRound70
	.word EnemiesRound71
	.word EnemiesRound72
	.word EnemiesRound73
	.word EnemiesRound74
	.word EnemiesRound75
	.word EnemiesRound76
	.word EnemiesRound77
	.word EnemiesRound78
	.word EnemiesRound79
	.word EnemiesRound80

EnemiesRound01:
.ifdef JP_ENEMY_PLACEMENT
	.byte $06					;- - - - - - 0x019400 06:B3F0: 06
.else
	.byte $04					;- D 0 - - - 0x019400 06:B3F0: 04
.endif

	.byte $A0					;- D 0 - - - 0x019401 06:B3F1: A0
	.byte $28					;- D 0 - - - 0x019402 06:B3F2: 28
	.byte $02					;- D 0 - - - 0x019403 06:B3F3: 02
	.byte anZenChanR_ID					;- D 0 - - - 0x019404 06:B3F4: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019405 06:B3F5: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019406 06:B3F6: 02

	.byte $A0					;- D 0 - - - 0x019407 06:B3F7: A0
	.byte $D8					;- D 0 - - - 0x019408 06:B3F8: D8
	.byte $02					;- D 0 - - - 0x019409 06:B3F9: 02
	.byte anZenChanL_ID					;- D 0 - - - 0x01940A 06:B3FA: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01940B 06:B3FB: 01
	.byte DIR_LEFT					;- D 0 - - - 0x01940C 06:B3FC: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $78					;- - - - - - 0x01940D 06:B3FD: 78
	.byte $58					;- - - - - - 0x01940E 06:B3FE: 58
	.byte $02					;- - - - - - 0x01940F 06:B3FF: 02
	.byte anZenChanR_ID					;- - - - - - 0x019410 06:B400: 3D
	.byte ENEMY_ZENCHAN					;- - - - - - 0x019411 06:B401: 01
	.byte DIR_RIGHT					;- - - - - - 0x019412 06:B402: 02

	.byte $78					;- - - - - - 0x019413 06:B403: 78
	.byte $A8					;- - - - - - 0x019414 06:B404: A8
	.byte $02					;- - - - - - 0x019415 06:B405: 02
	.byte anZenChanL_ID					;- - - - - - 0x019416 06:B406: 3C
	.byte ENEMY_ZENCHAN					;- - - - - - 0x019417 06:B407: 01
	.byte DIR_LEFT					;- - - - - - 0x019418 06:B408: 01
.endif

	.byte $50					;- D 0 - - - 0x01940D 06:B3FD: 50
	.byte $70					;- D 0 - - - 0x01940E 06:B3FE: 70
	.byte $02					;- D 0 - - - 0x01940F 06:B3FF: 02
	.byte anZenChanR_ID					;- D 0 - - - 0x019410 06:B400: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019411 06:B401: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019412 06:B402: 02

	.byte $50					;- D 0 - - - 0x019413 06:B403: 50
	.byte $90					;- D 0 - - - 0x019414 06:B404: 90
	.byte $03					;- D 0 - - - 0x019415 06:B405: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019416 06:B406: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019417 06:B407: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019418 06:B408: 01

EnemiesRound02:
.ifdef JP_ENEMY_PLACEMENT
	.byte $05					;- - - - - - 0x019425 06:B415: 05
.else
	.byte $04					;- D 0 - - - 0x019419 06:B409: 04
.endif

	.byte $A0					;- D 0 - - - 0x01941A 06:B40A: A0
	.byte $68					;- D 0 - - - 0x01941B 06:B40B: 68
	.byte $03					;- D 0 - - - 0x01941C 06:B40C: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x01941D 06:B40D: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01941E 06:B40E: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x01941F 06:B40F: 02

	.byte $A0					;- D 0 - - - 0x019420 06:B410: A0
	.byte $86					;- D 0 - - - 0x019421 06:B411: 86
	.byte $03					;- D 0 - - - 0x019422 06:B412: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019423 06:B413: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019424 06:B414: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019425 06:B415: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $A0					;- - - - - - 0x019432 06:B422: A0
	.byte $A0					;- - - - - - 0x019433 06:B423: A0
	.byte $03					;- - - - - - 0x019434 06:B424: 03
	.byte anZenChanR_ID					;- - - - - - 0x019435 06:B425: 3D
	.byte ENEMY_ZENCHAN					;- - - - - - 0x019436 06:B426: 01
	.byte DIR_RIGHT					;- - - - - - 0x019437 06:B427: 02
.endif

	.byte $38					;- D 0 - - - 0x019426 06:B416: 38
	.byte $58					;- D 0 - - - 0x019427 06:B417: 58
	.byte $02					;- D 0 - - - 0x019428 06:B418: 02
	.byte anMonstaL_ID					;- D 0 - - - 0x019429 06:B419: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x01942A 06:B41A: 07
	.byte DIR_LEFT					;- D 0 - - - 0x01942B 06:B41B: 01

	.byte $38					;- D 0 - - - 0x01942C 06:B41C: 38
	.byte $A8					;- D 0 - - - 0x01942D 06:B41D: A8
	.byte $02					;- D 0 - - - 0x01942E 06:B41E: 02
	.byte anMonstaR_ID					;- D 0 - - - 0x01942F 06:B41F: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019430 06:B420: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x019431 06:B421: 02

EnemiesRound03:
	.byte $04					;- D 0 - - - 0x019432 06:B422: 04

	.byte $38					;- D 0 - - - 0x019433 06:B423: 38
	.byte $82					;- D 0 - - - 0x019434 06:B424: 82
	.byte $03					;- D 0 - - - 0x019435 06:B425: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x019436 06:B426: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019437 06:B427: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019438 06:B428: 02

	.byte $50					;- D 0 - - - 0x019439 06:B429: 50
	.byte $84					;- D 0 - - - 0x01943A 06:B42A: 84
	.byte $03					;- D 0 - - - 0x01943B 06:B42B: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x01943C 06:B42C: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01943D 06:B42D: 01
	.byte DIR_LEFT					;- D 0 - - - 0x01943E 06:B42E: 01

	.byte $98					;- D 0 - - - 0x01943F 06:B42F: 98
	.byte $48					;- D 0 - - - 0x019440 06:B430: 48
	.byte $02					;- D 0 - - - 0x019441 06:B431: 02
	.byte anNeedler_ID					;- D 0 - - - 0x019442 06:B432: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x019443 06:B433: 05
	.byte DIR_LEFT					;- D 0 - - - 0x019444 06:B434: 01

	.byte $98					;- D 0 - - - 0x019445 06:B435: 98
	.byte $B8					;- D 0 - - - 0x019446 06:B436: B8
	.byte $02					;- D 0 - - - 0x019447 06:B437: 02
	.byte anNeedler_ID					;- D 0 - - - 0x019448 06:B438: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x019449 06:B439: 05
	.byte DIR_LEFT					;- D 0 - - - 0x01944A 06:B43A: 01

EnemiesRound04:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x01945D 06:B44D: 07
.else
	.byte $05					;- D 0 - - - 0x01944B 06:B43B: 05
.endif

	.byte $50					;- D 0 - - - 0x01944C 06:B43C: 50
	.byte $50					;- D 0 - - - 0x01944D 06:B43D: 50
	.byte $03					;- D 0 - - - 0x01944E 06:B43E: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x01944F 06:B43F: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019450 06:B440: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019451 06:B441: 02

	.byte $50					;- D 0 - - - 0x019452 06:B442: 50
	.byte $B0					;- D 0 - - - 0x019453 06:B443: B0
	.byte $03					;- D 0 - - - 0x019454 06:B444: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019455 06:B445: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019456 06:B446: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019457 06:B447: 01

	.byte $80					;- D 0 - - - 0x019458 06:B448: 80
	.byte $50					;- D 0 - - - 0x019459 06:B449: 50
	.byte $03					;- D 0 - - - 0x01945A 06:B44A: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x01945B 06:B44B: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01945C 06:B44C: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x01945D 06:B44D: 02

	.byte $80					;- D 0 - - - 0x01945E 06:B44E: 80
	.byte $B0					;- D 0 - - - 0x01945F 06:B44F: B0
	.byte $03					;- D 0 - - - 0x019460 06:B450: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019461 06:B451: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019462 06:B452: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019463 06:B453: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $68					;- - - - - - 0x019476 06:B466: 68
	.byte $18					;- - - - - - 0x019477 06:B467: 18
	.byte $03					;- - - - - - 0x019478 06:B468: 03
	.byte anZenChanR_ID					;- - - - - - 0x019479 06:B469: 3D
	.byte ENEMY_ZENCHAN					;- - - - - - 0x01947A 06:B46A: 01
	.byte DIR_RIGHT					;- - - - - - 0x01947B 06:B46B: 02

	.byte $68					;- - - - - - 0x01947C 06:B46C: 68
	.byte $E8					;- - - - - - 0x01947D 06:B46D: E8
	.byte $03					;- - - - - - 0x01947E 06:B46E: 03
	.byte anZenChanL_ID					;- - - - - - 0x01947F 06:B46F: 3C
	.byte ENEMY_ZENCHAN					;- - - - - - 0x019480 06:B470: 01
	.byte DIR_LEFT					;- - - - - - 0x019481 06:B471: 01
.endif

	.byte $80					;- D 0 - - - 0x019464 06:B454: 80
	.byte $80					;- D 0 - - - 0x019465 06:B455: 80
	.byte $02					;- D 0 - - - 0x019466 06:B456: 02
	.byte anNeedler_ID					;- D 0 - - - 0x019467 06:B457: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x019468 06:B458: 05
	.byte DIR_LEFT					;- D 0 - - - 0x019469 06:B459: 01

EnemiesRound05:
	.byte $07					;- D 0 - - - 0x01946A 06:B45A: 07

	.byte $98					;- D 0 - - - 0x01946B 06:B45B: 98
	.byte $2C					;- D 0 - - - 0x01946C 06:B45C: 2C
	.byte $02					;- D 0 - - - 0x01946D 06:B45D: 02
	.byte anNeedler_ID					;- D 0 - - - 0x01946E 06:B45E: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x01946F 06:B45F: 05
	.byte DIR_LEFT					;- D 0 - - - 0x019470 06:B460: 01

	.byte $98					;- D 0 - - - 0x019471 06:B461: 98
	.byte $D4					;- D 0 - - - 0x019472 06:B462: D4
	.byte $02					;- D 0 - - - 0x019473 06:B463: 02
	.byte anNeedler_ID					;- D 0 - - - 0x019474 06:B464: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x019475 06:B465: 05
	.byte DIR_LEFT					;- D 0 - - - 0x019476 06:B466: 01

	.byte $48					;- D 0 - - - 0x019477 06:B467: 48
	.byte $2C					;- D 0 - - - 0x019478 06:B468: 2C
	.byte $02					;- D 0 - - - 0x019479 06:B469: 02
	.byte anNeedler_ID					;- D 0 - - - 0x01947A 06:B46A: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x01947B 06:B46B: 05
	.byte DIR_LEFT					;- D 0 - - - 0x01947C 06:B46C: 01

	.byte $48					;- D 0 - - - 0x01947D 06:B46D: 48
	.byte $D4					;- D 0 - - - 0x01947E 06:B46E: D4
	.byte $02					;- D 0 - - - 0x01947F 06:B46F: 02
	.byte anNeedler_ID					;- D 0 - - - 0x019480 06:B470: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x019481 06:B471: 05
	.byte DIR_LEFT					;- D 0 - - - 0x019482 06:B472: 01

	.byte $38					;- D 0 - - - 0x019483 06:B473: 38
	.byte $70					;- D 0 - - - 0x019484 06:B474: 70
	.byte $02					;- D 0 - - - 0x019485 06:B475: 02
	.byte anNeedler_ID					;- D 0 - - - 0x019486 06:B476: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x019487 06:B477: 05
	.byte DIR_LEFT					;- D 0 - - - 0x019488 06:B478: 01

	.byte $38					;- D 0 - - - 0x019489 06:B479: 38
	.byte $90					;- D 0 - - - 0x01948A 06:B47A: 90
	.byte $02					;- D 0 - - - 0x01948B 06:B47B: 02
	.byte anNeedler_ID					;- D 0 - - - 0x01948C 06:B47C: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x01948D 06:B47D: 05
	.byte DIR_LEFT					;- D 0 - - - 0x01948E 06:B47E: 01

	.byte $80					;- D 0 - - - 0x01948F 06:B47F: 80
	.byte $80					;- D 0 - - - 0x019490 06:B480: 80
	.byte $03					;- D 0 - - - 0x019491 06:B481: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019492 06:B482: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019493 06:B483: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019494 06:B484: 01

EnemiesRound06:
	.byte $03					;- D 0 - - - 0x019495 06:B485: 03

	.byte $68					;- D 0 - - - 0x019496 06:B486: 68
	.byte $80					;- D 0 - - - 0x019497 06:B487: 80
	.byte $02					;- D 0 - - - 0x019498 06:B488: 02
	.byte anFlarion_ID					;- D 0 - - - 0x019499 06:B489: 4D
	.byte ENEMY_FLARION					;- D 0 - - - 0x01949A 06:B48A: 0A
	.byte DIR_LEFT					;- D 0 - - - 0x01949B 06:B48B: 01

	.byte $30					;- D 0 - - - 0x01949C 06:B48C: 30
	.byte $40					;- D 0 - - - 0x01949D 06:B48D: 40
	.byte $03					;- D 0 - - - 0x01949E 06:B48E: 03
	.byte anPulpul_ID					;- D 0 - - - 0x01949F 06:B48F: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x0194A0 06:B490: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x0194A1 06:B491: 02

	.byte $30					;- D 0 - - - 0x0194A2 06:B492: 30
	.byte $C0					;- D 0 - - - 0x0194A3 06:B493: C0
	.byte $03					;- D 0 - - - 0x0194A4 06:B494: 03
	.byte anPulpul_ID					;- D 0 - - - 0x0194A5 06:B495: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x0194A6 06:B496: 04
	.byte DIR_LEFT					;- D 0 - - - 0x0194A7 06:B497: 01

EnemiesRound07:
.ifdef JP_ENEMY_PLACEMENT
	.byte $06					;- - - - - - 0x0194C6 06:B4B6: 06
.else
	.byte $04					;- D 0 - - - 0x0194A8 06:B498: 04
.endif

.ifdef JP_ENEMY_PLACEMENT
	.byte $38					;- - - - - - 0x0194C7 06:B4B7: 38
	.byte $68					;- - - - - - 0x0194C8 06:B4B8: 68
	.byte $03					;- - - - - - 0x0194C9 06:B4B9: 03
	.byte anZenChanR_ID					;- - - - - - 0x0194CA 06:B4BA: 3D
	.byte ENEMY_ZENCHAN					;- - - - - - 0x0194CB 06:B4BB: 01
	.byte DIR_RIGHT					;- - - - - - 0x0194CC 06:B4BC: 02

	.byte $38					;- - - - - - 0x0194CD 06:B4BD: 38
	.byte $98					;- - - - - - 0x0194CE 06:B4BE: 98
	.byte $03					;- - - - - - 0x0194CF 06:B4BF: 03
	.byte anZenChanL_ID					;- - - - - - 0x0194D0 06:B4C0: 3C
	.byte ENEMY_ZENCHAN					;- - - - - - 0x0194D1 06:B4C1: 01
	.byte DIR_LEFT					;- - - - - - 0x0194D2 06:B4C2: 01
.endif

	.byte $48					;- D 0 - - - 0x0194A9 06:B499: 48
	.byte $48					;- D 0 - - - 0x0194AA 06:B49A: 48
	.byte $03					;- D 0 - - - 0x0194AB 06:B49B: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x0194AC 06:B49C: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0194AD 06:B49D: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x0194AE 06:B49E: 02

	.byte $48					;- D 0 - - - 0x0194AF 06:B49F: 48
	.byte $B8					;- D 0 - - - 0x0194B0 06:B4A0: B8
	.byte $03					;- D 0 - - - 0x0194B1 06:B4A1: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x0194B2 06:B4A2: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0194B3 06:B4A3: 01
	.byte DIR_LEFT					;- D 0 - - - 0x0194B4 06:B4A4: 01

	.byte $88					;- D 0 - - - 0x0194B5 06:B4A5: 88
	.byte $50					;- D 0 - - - 0x0194B6 06:B4A6: 50
	.byte $02					;- D 0 - - - 0x0194B7 06:B4A7: 02
	.byte anMonstaL_ID					;- D 0 - - - 0x0194B8 06:B4A8: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0194B9 06:B4A9: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0194BA 06:B4AA: 01

	.byte $88					;- D 0 - - - 0x0194BB 06:B4AB: 88
	.byte $B0					;- D 0 - - - 0x0194BC 06:B4AC: B0
	.byte $02					;- D 0 - - - 0x0194BD 06:B4AD: 02
	.byte anMonstaR_ID					;- D 0 - - - 0x0194BE 06:B4AE: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0194BF 06:B4AF: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x0194C0 06:B4B0: 02

EnemiesRound08:
	.byte $03					;- D 0 - - - 0x0194C1 06:B4B1: 03

	.byte $70					;- D 0 - - - 0x0194C2 06:B4B2: 70
	.byte $80					;- D 0 - - - 0x0194C3 06:B4B3: 80
	.byte $02					;- D 0 - - - 0x0194C4 06:B4B4: 02
	.byte anFlarion_ID					;- D 0 - - - 0x0194C5 06:B4B5: 4D
	.byte ENEMY_FLARION					;- D 0 - - - 0x0194C6 06:B4B6: 0A
	.byte DIR_LEFT					;- D 0 - - - 0x0194C7 06:B4B7: 01

	.byte $50					;- D 0 - - - 0x0194C8 06:B4B8: 50
	.byte $18					;- D 0 - - - 0x0194C9 06:B4B9: 18
	.byte $03					;- D 0 - - - 0x0194CA 06:B4BA: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x0194CB 06:B4BB: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0194CC 06:B4BC: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x0194CD 06:B4BD: 02

	.byte $50					;- D 0 - - - 0x0194CE 06:B4BE: 50
	.byte $E8					;- D 0 - - - 0x0194CF 06:B4BF: E8
	.byte $03					;- D 0 - - - 0x0194D0 06:B4C0: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x0194D1 06:B4C1: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0194D2 06:B4C2: 01
	.byte DIR_LEFT					;- D 0 - - - 0x0194D3 06:B4C3: 01

EnemiesRound09:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x0194FE 06:B4EE: 07
.else
	.byte $05					;- D 0 - - - 0x0194D4 06:B4C4: 05
.endif

	.byte $38					;- D 0 - - - 0x0194D5 06:B4C5: 38
	.byte $64					;- D 0 - - - 0x0194D6 06:B4C6: 64
	.byte $02					;- D 0 - - - 0x0194D7 06:B4C7: 02
	.byte anZenChanR_ID					;- D 0 - - - 0x0194D8 06:B4C8: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0194D9 06:B4C9: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x0194DA 06:B4CA: 02

	.byte $38					;- D 0 - - - 0x0194DB 06:B4CB: 38
	.byte $94					;- D 0 - - - 0x0194DC 06:B4CC: 94
	.byte $02					;- D 0 - - - 0x0194DD 06:B4CD: 02
	.byte anZenChanL_ID					;- D 0 - - - 0x0194DE 06:B4CE: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0194DF 06:B4CF: 01
	.byte DIR_LEFT					;- D 0 - - - 0x0194E0 06:B4D0: 01

	.byte $48					;- D 0 - - - 0x0194E1 06:B4D1: 48
	.byte $18					;- D 0 - - - 0x0194E2 06:B4D2: 18
	.byte $02					;- D 0 - - - 0x0194E3 06:B4D3: 02
	.byte anZenChanR_ID					;- D 0 - - - 0x0194E4 06:B4D4: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0194E5 06:B4D5: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x0194E6 06:B4D6: 02

	.byte $48					;- D 0 - - - 0x0194E7 06:B4D7: 48
	.byte $E0					;- D 0 - - - 0x0194E8 06:B4D8: E0
	.byte $02					;- D 0 - - - 0x0194E9 06:B4D9: 02
	.byte anZenChanL_ID					;- D 0 - - - 0x0194EA 06:B4DA: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0194EB 06:B4DB: 01
	.byte DIR_LEFT					;- D 0 - - - 0x0194EC 06:B4DC: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $88					;- - - - - - 0x019517 06:B507: 88
	.byte $48					;- - - - - - 0x019518 06:B508: 48
	.byte $02					;- - - - - - 0x019519 06:B509: 02
	.byte anZenChanR_ID					;- - - - - - 0x01951A 06:B50A: 3D
	.byte ENEMY_ZENCHAN					;- - - - - - 0x01951B 06:B50B: 01
	.byte DIR_RIGHT					;- - - - - - 0x01951C 06:B50C: 02

	.byte $88					;- - - - - - 0x01951D 06:B50D: 88
	.byte $80					;- - - - - - 0x01951E 06:B50E: 80
	.byte $02					;- - - - - - 0x01951F 06:B50F: 02
	.byte anZenChanL_ID					;- - - - - - 0x019520 06:B510: 3C
	.byte ENEMY_ZENCHAN					;- - - - - - 0x019521 06:B511: 01
	.byte DIR_LEFT					;- - - - - - 0x019522 06:B512: 01
.endif

	.byte $88					;- D 0 - - - 0x0194ED 06:B4DD: 88
	.byte $B0					;- D 0 - - - 0x0194EE 06:B4DE: B0
	.byte $03					;- D 0 - - - 0x0194EF 06:B4DF: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x0194F0 06:B4E0: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0194F1 06:B4E1: 01
	.byte DIR_LEFT					;- D 0 - - - 0x0194F2 06:B4E2: 01

EnemiesRound10:
	.byte $02					;- D 0 - - - 0x0194F3 06:B4E3: 02

	.byte $78					;- D 0 - - - 0x0194F4 06:B4E4: 78
	.byte $80					;- D 0 - - - 0x0194F5 06:B4E5: 80
	.byte $02					;- D 0 - - - 0x0194F6 06:B4E6: 02
	.byte anSpringitR_ID					;- D 0 - - - 0x0194F7 06:B4E7: 39
	.byte ENEMY_SPRINGIT					;- D 0 - - - 0x0194F8 06:B4E8: 13
	.byte DIR_RIGHT					;- D 0 - - - 0x0194F9 06:B4E9: 02

	.byte $98					;- D 0 - - - 0x0194FA 06:B4EA: 98
	.byte $80					;- D 0 - - - 0x0194FB 06:B4EB: 80
	.byte $03					;- D 0 - - - 0x0194FC 06:B4EC: 03
	.byte anSpringitBodyR_ID					;- D 0 - - - 0x0194FD 06:B4ED: 38
	.byte ENEMY_SPRINGITBODY					;- D 0 - - - 0x0194FE 06:B4EE: 14
	.byte DIR_RIGHT					;- D 0 - - - 0x0194FF 06:B4EF: 02

EnemiesRound11:
.ifdef JP_ENEMY_PLACEMENT
	.byte $06					;- - - - - - 0x019536 06:B526: 06
.else
	.byte $04					;- D 0 - - - 0x019500 06:B4F0: 04
.endif

	.byte $18					;- D 0 - - - 0x019501 06:B4F1: 18
	.byte $18					;- D 0 - - - 0x019502 06:B4F2: 18
	.byte $03					;- D 0 - - - 0x019503 06:B4F3: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019504 06:B4F4: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019505 06:B4F5: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019506 06:B4F6: 01

	.byte $18					;- D 0 - - - 0x019507 06:B4F7: 18
	.byte $E8					;- D 0 - - - 0x019508 06:B4F8: E8
	.byte $03					;- D 0 - - - 0x019509 06:B4F9: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x01950A 06:B4FA: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x01950B 06:B4FB: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x01950C 06:B4FC: 02

.ifdef JP_ENEMY_PLACEMENT
	.byte $40					;- - - - - - 0x019543 06:B533: 40
	.byte $3F					;- - - - - - 0x019544 06:B534: 3F
	.byte $03					;- - - - - - 0x019545 06:B535: 03
	.byte anMonstaL_ID					;- - - - - - 0x019546 06:B536: 3E
	.byte ENEMY_MONSTA					;- - - - - - 0x019547 06:B537: 07
	.byte DIR_LEFT					;- - - - - - 0x019548 06:B538: 01

	.byte $40					;- - - - - - 0x019549 06:B539: 40
	.byte $C0					;- - - - - - 0x01954A 06:B53A: C0
	.byte $03					;- - - - - - 0x01954B 06:B53B: 03
	.byte anMonstaR_ID					;- - - - - - 0x01954C 06:B53C: 3F
	.byte ENEMY_MONSTA					;- - - - - - 0x01954D 06:B53D: 07
	.byte DIR_RIGHT					;- - - - - - 0x01954E 06:B53E: 02
.endif

	.byte $A0					;- D 0 - - - 0x01950D 06:B4FD: A0
	.byte $78					;- D 0 - - - 0x01950E 06:B4FE: 78
	.byte $02					;- D 0 - - - 0x01950F 06:B4FF: 02
	.byte anNeedler_ID					;- D 0 - - - 0x019510 06:B500: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x019511 06:B501: 05
	.byte DIR_LEFT					;- D 0 - - - 0x019512 06:B502: 01

	.byte $A0					;- D 0 - - - 0x019513 06:B503: A0
	.byte $88					;- D 0 - - - 0x019514 06:B504: 88
	.byte $02					;- D 0 - - - 0x019515 06:B505: 02
	.byte anNeedler_ID					;- D 0 - - - 0x019516 06:B506: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x019517 06:B507: 05
	.byte DIR_LEFT					;- D 0 - - - 0x019518 06:B508: 01

EnemiesRound12:
.ifdef JP_ENEMY_PLACEMENT
	.byte $05					;- - - - - - 0x01955B 06:B54B: 05
.else
	.byte $03					;- D 0 - - - 0x019519 06:B509: 03
.endif

	.byte $38					;- D 0 - - - 0x01951A 06:B50A: 38
	.byte $80					;- D 0 - - - 0x01951B 06:B50B: 80
	.byte $02					;- D 0 - - - 0x01951C 06:B50C: 02
	.byte anSnaggerL_ID					;- D 0 - - - 0x01951D 06:B50D: 41
	.byte ENEMY_SNAGGER					;- D 0 - - - 0x01951E 06:B50E: 0B
	.byte DIR_LEFT					;- D 0 - - - 0x01951F 06:B50F: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $40					;- - - - - - 0x019562 06:B552: 40
	.byte $18					;- - - - - - 0x019563 06:B553: 18
	.byte $03					;- - - - - - 0x019564 06:B554: 03
	.byte anBanebouL_ID					;- - - - - - 0x019565 06:B555: 43
	.byte ENEMY_BANEBOU					;- - - - - - 0x019566 06:B556: 02
	.byte DIR_LEFT					;- - - - - - 0x019567 06:B557: 01

	.byte $40					;- - - - - - 0x019568 06:B558: 40
	.byte $E8					;- - - - - - 0x019569 06:B559: E8
	.byte $03					;- - - - - - 0x01956A 06:B55A: 03
	.byte anBanebouR_ID					;- - - - - - 0x01956B 06:B55B: 44
	.byte ENEMY_BANEBOU					;- - - - - - 0x01956C 06:B55C: 02
	.byte DIR_RIGHT					;- - - - - - 0x01956D 06:B55D: 02
.endif

	.byte $68					;- D 0 - - - 0x019520 06:B510: 68
	.byte $68					;- D 0 - - - 0x019521 06:B511: 68
	.byte $03					;- D 0 - - - 0x019522 06:B512: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x019523 06:B513: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019524 06:B514: 02
	.byte DIR_LEFT					;- D 0 - - - 0x019525 06:B515: 01

	.byte $68					;- D 0 - - - 0x019526 06:B516: 68
	.byte $98					;- D 0 - - - 0x019527 06:B517: 98
	.byte $03					;- D 0 - - - 0x019528 06:B518: 03
	.byte anBanebouR_ID					;- D 0 - - - 0x019529 06:B519: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x01952A 06:B51A: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x01952B 06:B51B: 02

EnemiesRound13:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x01957A 06:B56A: 07
.else
	.byte $04					;- D 0 - - - 0x01952C 06:B51C: 04
.endif

	.byte $38					;- D 0 - - - 0x01952D 06:B51D: 38
	.byte $28					;- D 0 - - - 0x01952E 06:B51E: 28
	.byte $03					;- D 0 - - - 0x01952F 06:B51F: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019530 06:B520: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019531 06:B521: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019532 06:B522: 01

	.byte $38					;- D 0 - - - 0x019533 06:B523: 38
	.byte $C8					;- D 0 - - - 0x019534 06:B524: C8
	.byte $03					;- D 0 - - - 0x019535 06:B525: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x019536 06:B526: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019537 06:B527: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019538 06:B528: 02

	.byte $50					;- D 0 - - - 0x019539 06:B529: 50
	.byte $58					;- D 0 - - - 0x01953A 06:B52A: 58
	.byte $02					;- D 0 - - - 0x01953B 06:B52B: 02
	.byte anPulpul_ID					;- D 0 - - - 0x01953C 06:B52C: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x01953D 06:B52D: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x01953E 06:B52E: 02

	.byte $50					;- D 0 - - - 0x01953F 06:B52F: 50
	.byte $98					;- D 0 - - - 0x019540 06:B530: 98
	.byte $02					;- D 0 - - - 0x019541 06:B531: 02
	.byte anPulpul_ID					;- D 0 - - - 0x019542 06:B532: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019543 06:B533: 04
	.byte DIR_LEFT					;- D 0 - - - 0x019544 06:B534: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $60					;- - - - - - 0x019593 06:B583: 60
	.byte $38					;- - - - - - 0x019594 06:B584: 38
	.byte $02					;- - - - - - 0x019595 06:B585: 02
	.byte anPulpul_ID					;- - - - - - 0x019596 06:B586: 47
	.byte ENEMY_PULPUL					;- - - - - - 0x019597 06:B587: 04
	.byte DIR_RIGHT					;- - - - - - 0x019598 06:B588: 02

	.byte $60					;- - - - - - 0x019599 06:B589: 60
	.byte $78					;- - - - - - 0x01959A 06:B58A: 78
	.byte $02					;- - - - - - 0x01959B 06:B58B: 02
	.byte anPulpul_ID					;- - - - - - 0x01959C 06:B58C: 47
	.byte ENEMY_PULPUL					;- - - - - - 0x01959D 06:B58D: 04
	.byte DIR_LEFT					;- - - - - - 0x01959E 06:B58E: 01

	.byte $60					;- - - - - - 0x01959F 06:B58F: 60
	.byte $B8					;- - - - - - 0x0195A0 06:B590: B8
	.byte $02					;- - - - - - 0x0195A1 06:B591: 02
	.byte anPulpul_ID					;- - - - - - 0x0195A2 06:B592: 47
	.byte ENEMY_PULPUL					;- - - - - - 0x0195A3 06:B593: 04
	.byte DIR_RIGHT					;- - - - - - 0x0195A4 06:B594: 02
.endif

EnemiesRound14:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x0195A5 06:B595: 07
.else
	.byte $04					;- D 0 - - - 0x019545 06:B535: 04
.endif

	.byte $78					;- D 0 - - - 0x019546 06:B536: 78
	.byte $40					;- D 0 - - - 0x019547 06:B537: 40
	.byte $03					;- D 0 - - - 0x019548 06:B538: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019549 06:B539: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x01954A 06:B53A: 04
	.byte DIR_LEFT					;- D 0 - - - 0x01954B 06:B53B: 01

	.byte $78					;- D 0 - - - 0x01954C 06:B53C: 78
	.byte $80					;- D 0 - - - 0x01954D 06:B53D: 80
	.byte $03					;- D 0 - - - 0x01954E 06:B53E: 03
	.byte anPulpul_ID					;- D 0 - - - 0x01954F 06:B53F: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019550 06:B540: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x019551 06:B541: 02

	.byte $78					;- D 0 - - - 0x019552 06:B542: 78
	.byte $C0					;- D 0 - - - 0x019553 06:B543: C0
	.byte $03					;- D 0 - - - 0x019554 06:B544: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019555 06:B545: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019556 06:B546: 04
	.byte DIR_LEFT					;- D 0 - - - 0x019557 06:B547: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $C8					;- - - - - - 0x0195B8 06:B5A8: C8
	.byte $40					;- - - - - - 0x0195B9 06:B5A9: 40
	.byte $02					;- - - - - - 0x0195BA 06:B5AA: 02
	.byte anBanebouL_ID					;- - - - - - 0x0195BB 06:B5AB: 43
	.byte ENEMY_BANEBOU					;- - - - - - 0x0195BC 06:B5AC: 02
	.byte DIR_LEFT					;- - - - - - 0x0195BD 06:B5AD: 01

	.byte $C8					;- - - - - - 0x0195BE 06:B5AE: C8
	.byte $60					;- - - - - - 0x0195BF 06:B5AF: 60
	.byte $02					;- - - - - - 0x0195C0 06:B5B0: 02
	.byte anBanebouL_ID					;- - - - - - 0x0195C1 06:B5B1: 43
	.byte ENEMY_BANEBOU					;- - - - - - 0x0195C2 06:B5B2: 02
	.byte DIR_LEFT					;- - - - - - 0x0195C3 06:B5B3: 01
.endif

	.byte $C8					;- D 0 - - - 0x019558 06:B548: C8
	.byte $80					;- D 0 - - - 0x019559 06:B549: 80
	.byte $02					;- D 0 - - - 0x01955A 06:B54A: 02
	.byte anBanebouL_ID					;- D 0 - - - 0x01955B 06:B54B: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x01955C 06:B54C: 02
	.byte DIR_LEFT					;- D 0 - - - 0x01955D 06:B54D: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $C8					;- - - - - - 0x0195CA 06:B5BA: C8
	.byte $A0					;- - - - - - 0x0195CB 06:B5BB: A0
	.byte $02					;- - - - - - 0x0195CC 06:B5BC: 02
	.byte anBanebouL_ID					;- - - - - - 0x0195CD 06:B5BD: 43
	.byte ENEMY_BANEBOU					;- - - - - - 0x0195CE 06:B5BE: 02
	.byte DIR_LEFT					;- - - - - - 0x0195CF 06:B5BF: 01
.endif

EnemiesRound15:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x0195D0 06:B5C0: 07
.else
	.byte $05					;- D 0 - - - 0x01955E 06:B54E: 05
.endif

	.byte $38					;- D 0 - - - 0x01955F 06:B54F: 38
	.byte $78					;- D 0 - - - 0x019560 06:B550: 78
	.byte $02					;- D 0 - - - 0x019561 06:B551: 02
	.byte anZenChanR_ID					;- D 0 - - - 0x019562 06:B552: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019563 06:B553: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019564 06:B554: 02

	.byte $38					;- D 0 - - - 0x019565 06:B555: 38
	.byte $88					;- D 0 - - - 0x019566 06:B556: 88
	.byte $02					;- D 0 - - - 0x019567 06:B557: 02
	.byte anZenChanL_ID					;- D 0 - - - 0x019568 06:B558: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019569 06:B559: 01
	.byte DIR_LEFT					;- D 0 - - - 0x01956A 06:B55A: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $58					;- - - - - - 0x0195DD 06:B5CD: 58
	.byte $50					;- - - - - - 0x0195DE 06:B5CE: 50
	.byte $02					;- - - - - - 0x0195DF 06:B5CF: 02
	.byte anZenChanR_ID					;- - - - - - 0x0195E0 06:B5D0: 3D
	.byte ENEMY_ZENCHAN					;- - - - - - 0x0195E1 06:B5D1: 01
	.byte DIR_RIGHT					;- - - - - - 0x0195E2 06:B5D2: 02

	.byte $58					;- - - - - - 0x0195E3 06:B5D3: 58
	.byte $B0					;- - - - - - 0x0195E4 06:B5D4: B0
	.byte $02					;- - - - - - 0x0195E5 06:B5D5: 02
	.byte anZenChanL_ID					;- - - - - - 0x0195E6 06:B5D6: 3C
	.byte ENEMY_ZENCHAN					;- - - - - - 0x0195E7 06:B5D7: 01
	.byte DIR_LEFT					;- - - - - - 0x0195E8 06:B5D8: 01
.endif

	.byte $78					;- D 0 - - - 0x01956B 06:B55B: 78
	.byte $30					;- D 0 - - - 0x01956C 06:B55C: 30
	.byte $02					;- D 0 - - - 0x01956D 06:B55D: 02
	.byte anZenChanR_ID					;- D 0 - - - 0x01956E 06:B55E: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01956F 06:B55F: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019570 06:B560: 02

	.byte $70					;- D 0 - - - 0x019571 06:B561: 70
	.byte $78					;- D 0 - - - 0x019572 06:B562: 78
	.byte $02					;- D 0 - - - 0x019573 06:B563: 02
	.byte anZenChanL_ID					;- D 0 - - - 0x019574 06:B564: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019575 06:B565: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019576 06:B566: 01

	.byte $78					;- D 0 - - - 0x019577 06:B567: 78
	.byte $D0					;- D 0 - - - 0x019578 06:B568: D0
	.byte $03					;- D 0 - - - 0x019579 06:B569: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x01957A 06:B56A: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01957B 06:B56B: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x01957C 06:B56C: 02

EnemiesRound16:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x0195FB 06:B5EB: 07
.else
	.byte $05					;- D 0 - - - 0x01957D 06:B56D: 05
.endif

	.byte $70					;- D 0 - - - 0x01957E 06:B56E: 70
	.byte $80					;- D 0 - - - 0x01957F 06:B56F: 80
	.byte $02					;- D 0 - - - 0x019580 06:B570: 02
	.byte anFlarion_ID					;- D 0 - - - 0x019581 06:B571: 4D
	.byte ENEMY_FLARION					;- D 0 - - - 0x019582 06:B572: 0A
	.byte DIR_LEFT					;- D 0 - - - 0x019583 06:B573: 01

	.byte $30					;- D 0 - - - 0x019584 06:B574: 30
	.byte $28					;- D 0 - - - 0x019585 06:B575: 28
	.byte $03					;- D 0 - - - 0x019586 06:B576: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x019587 06:B577: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019588 06:B578: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019589 06:B579: 02

	.byte $30					;- D 0 - - - 0x01958A 06:B57A: 30
	.byte $D8					;- D 0 - - - 0x01958B 06:B57B: D8
	.byte $03					;- D 0 - - - 0x01958C 06:B57C: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x01958D 06:B57D: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01958E 06:B57E: 01
	.byte DIR_LEFT					;- D 0 - - - 0x01958F 06:B57F: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $30					;- - - - - - 0x01960E 06:B5FE: 30
	.byte $40					;- - - - - - 0x01960F 06:B5FF: 40
	.byte $03					;- - - - - - 0x019610 06:B600: 03
	.byte anZenChanR_ID					;- - - - - - 0x019611 06:B601: 3D
	.byte ENEMY_ZENCHAN					;- - - - - - 0x019612 06:B602: 01
	.byte DIR_RIGHT					;- - - - - - 0x019613 06:B603: 02

	.byte $30					;- - - - - - 0x019614 06:B604: 30
	.byte $C0					;- - - - - - 0x019615 06:B605: C0
	.byte $03					;- - - - - - 0x019616 06:B606: 03
	.byte anZenChanL_ID					;- - - - - - 0x019617 06:B607: 3C
	.byte ENEMY_ZENCHAN					;- - - - - - 0x019618 06:B608: 01
	.byte DIR_LEFT					;- - - - - - 0x019619 06:B609: 01
.endif

	.byte $C8					;- D 0 - - - 0x019590 06:B580: C8
	.byte $40					;- D 0 - - - 0x019591 06:B581: 40
	.byte $03					;- D 0 - - - 0x019592 06:B582: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019593 06:B583: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019594 06:B584: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019595 06:B585: 01

	.byte $C8					;- D 0 - - - 0x019596 06:B586: C8
	.byte $C0					;- D 0 - - - 0x019597 06:B587: C0
	.byte $03					;- D 0 - - - 0x019598 06:B588: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019599 06:B589: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01959A 06:B58A: 01
	.byte DIR_LEFT					;- D 0 - - - 0x01959B 06:B58B: 01

EnemiesRound17:
.ifdef JP_ENEMY_PLACEMENT
	.byte $05					;- - - - - - 0x019626 06:B616: 05
.else
	.byte $03					;- D 0 - - - 0x01959C 06:B58C: 03
.endif

	.byte $28					;- D 0 - - - 0x01959D 06:B58D: 28
	.byte $38					;- D 0 - - - 0x01959E 06:B58E: 38
	.byte $02					;- D 0 - - - 0x01959F 06:B58F: 02
	.byte anZenChanR_ID					;- D 0 - - - 0x0195A0 06:B590: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0195A1 06:B591: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x0195A2 06:B592: 02

	.byte $28					;- D 0 - - - 0x0195A3 06:B593: 28
	.byte $C8					;- D 0 - - - 0x0195A4 06:B594: C8
	.byte $02					;- D 0 - - - 0x0195A5 06:B595: 02
	.byte anZenChanL_ID					;- D 0 - - - 0x0195A6 06:B596: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0195A7 06:B597: 01
	.byte DIR_LEFT					;- D 0 - - - 0x0195A8 06:B598: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $50					;- - - - - - 0x019633 06:B623: 50
	.byte $48					;- - - - - - 0x019634 06:B624: 48
	.byte $02					;- - - - - - 0x019635 06:B625: 02
	.byte anZenChanR_ID					;- - - - - - 0x019636 06:B626: 3D
	.byte ENEMY_ZENCHAN					;- - - - - - 0x019637 06:B627: 01
	.byte DIR_RIGHT					;- - - - - - 0x019638 06:B628: 02

	.byte $50					;- - - - - - 0x019639 06:B629: 50
	.byte $B8					;- - - - - - 0x01963A 06:B62A: B8
	.byte $02					;- - - - - - 0x01963B 06:B62B: 02
	.byte anZenChanL_ID					;- - - - - - 0x01963C 06:B62C: 3C
	.byte ENEMY_ZENCHAN					;- - - - - - 0x01963D 06:B62D: 01
	.byte DIR_LEFT					;- - - - - - 0x01963E 06:B62E: 01
.endif

	.byte $78					;- D 0 - - - 0x0195A9 06:B599: 78
	.byte $80					;- D 0 - - - 0x0195AA 06:B59A: 80
	.byte $03					;- D 0 - - - 0x0195AB 06:B59B: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x0195AC 06:B59C: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0195AD 06:B59D: 01
	.byte DIR_LEFT					;- D 0 - - - 0x0195AE 06:B59E: 01

EnemiesRound18:
.ifdef JP_ENEMY_PLACEMENT
	.byte $06					;- - - - - - 0x019645 06:B635: 06
.else
	.byte $04					;- D 0 - - - 0x0195AF 06:B59F: 04
.endif

.ifdef JP_ENEMY_PLACEMENT
	.byte $78					;- - - - - - 0x019646 06:B636: 78
	.byte $48					;- - - - - - 0x019647 06:B637: 48
	.byte $02					;- - - - - - 0x019648 06:B638: 02
	.byte anBanebouL_ID					;- - - - - - 0x019649 06:B639: 43
	.byte ENEMY_BANEBOU					;- - - - - - 0x01964A 06:B63A: 02
	.byte DIR_LEFT					;- - - - - - 0x01964B 06:B63B: 01

	.byte $78					;- - - - - - 0x01964C 06:B63C: 78
	.byte $C0					;- - - - - - 0x01964D 06:B63D: C0
	.byte $02					;- - - - - - 0x01964E 06:B63E: 02
	.byte anBanebouR_ID					;- - - - - - 0x01964F 06:B63F: 44
	.byte ENEMY_BANEBOU					;- - - - - - 0x019650 06:B640: 02
	.byte DIR_RIGHT					;- - - - - - 0x019651 06:B641: 02
.endif

	.byte $A0					;- D 0 - - - 0x0195B0 06:B5A0: A0
	.byte $68					;- D 0 - - - 0x0195B1 06:B5A1: 68
	.byte $02					;- D 0 - - - 0x0195B2 06:B5A2: 02
	.byte anBanebouL_ID					;- D 0 - - - 0x0195B3 06:B5A3: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0195B4 06:B5A4: 02
	.byte DIR_LEFT					;- D 0 - - - 0x0195B5 06:B5A5: 01

	.byte $A0					;- D 0 - - - 0x0195B6 06:B5A6: A0
	.byte $A0					;- D 0 - - - 0x0195B7 06:B5A7: A0
	.byte $02					;- D 0 - - - 0x0195B8 06:B5A8: 02
	.byte anBanebouR_ID					;- D 0 - - - 0x0195B9 06:B5A9: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0195BA 06:B5AA: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x0195BB 06:B5AB: 02

	.byte $50					;- D 0 - - - 0x0195BC 06:B5AC: 50
	.byte $68					;- D 0 - - - 0x0195BD 06:B5AD: 68
	.byte $02					;- D 0 - - - 0x0195BE 06:B5AE: 02
	.byte anBanebouL_ID					;- D 0 - - - 0x0195BF 06:B5AF: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0195C0 06:B5B0: 02
	.byte DIR_LEFT					;- D 0 - - - 0x0195C1 06:B5B1: 01

	.byte $50					;- D 0 - - - 0x0195C2 06:B5B2: 50
	.byte $A0					;- D 0 - - - 0x0195C3 06:B5B3: A0
	.byte $03					;- D 0 - - - 0x0195C4 06:B5B4: 03
	.byte anBanebouR_ID					;- D 0 - - - 0x0195C5 06:B5B5: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0195C6 06:B5B6: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x0195C7 06:B5B7: 02

EnemiesRound19:
	.byte $07					;- D 0 - - - 0x0195C8 06:B5B8: 07

	.byte $B0					;- D 0 - - - 0x0195C9 06:B5B9: B0
	.byte $30					;- D 0 - - - 0x0195CA 06:B5BA: 30
	.byte $02					;- D 0 - - - 0x0195CB 06:B5BB: 02
	.byte anMonstaL_ID					;- D 0 - - - 0x0195CC 06:B5BC: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0195CD 06:B5BD: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0195CE 06:B5BE: 01

	.byte $B0					;- D 0 - - - 0x0195CF 06:B5BF: B0
	.byte $D0					;- D 0 - - - 0x0195D0 06:B5C0: D0
	.byte $02					;- D 0 - - - 0x0195D1 06:B5C1: 02
	.byte anMonstaR_ID					;- D 0 - - - 0x0195D2 06:B5C2: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0195D3 06:B5C3: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x0195D4 06:B5C4: 02

	.byte $78					;- D 0 - - - 0x0195D5 06:B5C5: 78
	.byte $80					;- D 0 - - - 0x0195D6 06:B5C6: 80
	.byte $02					;- D 0 - - - 0x0195D7 06:B5C7: 02
	.byte anMonstaL_ID					;- D 0 - - - 0x0195D8 06:B5C8: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0195D9 06:B5C9: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0195DA 06:B5CA: 01

	.byte $68					;- D 0 - - - 0x0195DB 06:B5CB: 68
	.byte $70					;- D 0 - - - 0x0195DC 06:B5CC: 70
	.byte $02					;- D 0 - - - 0x0195DD 06:B5CD: 02
	.byte anMonstaL_ID					;- D 0 - - - 0x0195DE 06:B5CE: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0195DF 06:B5CF: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0195E0 06:B5D0: 01

	.byte $68					;- D 0 - - - 0x0195E1 06:B5D1: 68
	.byte $90					;- D 0 - - - 0x0195E2 06:B5D2: 90
	.byte $02					;- D 0 - - - 0x0195E3 06:B5D3: 02
	.byte anMonstaR_ID					;- D 0 - - - 0x0195E4 06:B5D4: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0195E5 06:B5D5: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x0195E6 06:B5D6: 02

	.byte $88					;- D 0 - - - 0x0195E7 06:B5D7: 88
	.byte $70					;- D 0 - - - 0x0195E8 06:B5D8: 70
	.byte $02					;- D 0 - - - 0x0195E9 06:B5D9: 02
	.byte anMonstaL_ID					;- D 0 - - - 0x0195EA 06:B5DA: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0195EB 06:B5DB: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0195EC 06:B5DC: 01

	.byte $88					;- D 0 - - - 0x0195ED 06:B5DD: 88
	.byte $90					;- D 0 - - - 0x0195EE 06:B5DE: 90
	.byte $03					;- D 0 - - - 0x0195EF 06:B5DF: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x0195F0 06:B5E0: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0195F1 06:B5E1: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x0195F2 06:B5E2: 02

EnemiesRound20:
	.byte $01					;- D 0 - - - 0x0195F3 06:B5E3: 01

	.byte $38					;- D 0 - - - 0x0195F4 06:B5E4: 38
	.byte $C0					;- D 0 - - - 0x0195F5 06:B5E5: C0
	.byte $02					;- D 0 - - - 0x0195F6 06:B5E6: 02
	.byte anRuckusRAlt_ID					;- D 0 - - - 0x0195F7 06:B5E7: CF
	.byte ENEMY_RUCKUS					;- D 0 - - - 0x0195F8 06:B5E8: 19
	.byte DIR_LEFT|DIR_INSTAPLACE					;- D 0 - - - 0x0195F9 06:B5E9: 81

EnemiesRound21:
.ifdef JP_ENEMY_PLACEMENT
	.byte $06					;- - - - - - 0x01969C 06:B68C: 06
.else
	.byte $05					;- D 0 - - - 0x0195FA 06:B5EA: 05
.endif

	.byte $48					;- D 0 - - - 0x0195FB 06:B5EB: 48
	.byte $70					;- D 0 - - - 0x0195FC 06:B5EC: 70
	.byte $02					;- D 0 - - - 0x0195FD 06:B5ED: 02
	.byte anZenChanR_ID					;- D 0 - - - 0x0195FE 06:B5EE: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x0195FF 06:B5EF: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019600 06:B5F0: 02

.ifdef JP_ENEMY_PLACEMENT
	.byte $68					;- - - - - - 0x0196A3 06:B693: 68
	.byte $48					;- - - - - - 0x0196A4 06:B694: 48
	.byte $02					;- - - - - - 0x0196A5 06:B695: 02
	.byte anZenChanR_ID					;- - - - - - 0x0196A6 06:B696: 3D
	.byte ENEMY_ZENCHAN					;- - - - - - 0x0196A7 06:B697: 01
	.byte DIR_RIGHT					;- - - - - - 0x0196A8 06:B698: 02
.endif

	.byte $68					;- D 0 - - - 0x019601 06:B5F1: 68
	.byte $70					;- D 0 - - - 0x019602 06:B5F2: 70
	.byte $02					;- D 0 - - - 0x019603 06:B5F3: 02
	.byte anZenChanR_ID					;- D 0 - - - 0x019604 06:B5F4: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019605 06:B5F5: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019606 06:B5F6: 02

	.byte $68					;- D 0 - - - 0x019607 06:B5F7: 68
	.byte $98					;- D 0 - - - 0x019608 06:B5F8: 98
	.byte $02					;- D 0 - - - 0x019609 06:B5F9: 02
	.byte anZenChanR_ID					;- D 0 - - - 0x01960A 06:B5FA: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01960B 06:B5FB: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x01960C 06:B5FC: 02

	.byte $88					;- D 0 - - - 0x01960D 06:B5FD: 88
	.byte $70					;- D 0 - - - 0x01960E 06:B5FE: 70
	.byte $02					;- D 0 - - - 0x01960F 06:B5FF: 02
	.byte anZenChanR_ID					;- D 0 - - - 0x019610 06:B600: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019611 06:B601: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019612 06:B602: 02

	.byte $88					;- D 0 - - - 0x019613 06:B603: 88
	.byte $98					;- D 0 - - - 0x019614 06:B604: 98
	.byte $03					;- D 0 - - - 0x019615 06:B605: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x019616 06:B606: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019617 06:B607: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019618 06:B608: 02

EnemiesRound22:
	.byte $03					;- D 0 - - - 0x019619 06:B609: 03

	.byte $B8					;- D 0 - - - 0x01961A 06:B60A: B8
	.byte $80					;- D 0 - - - 0x01961B 06:B60B: 80
	.byte $02					;- D 0 - - - 0x01961C 06:B60C: 02
	.byte anSnaggerL_ID					;- D 0 - - - 0x01961D 06:B60D: 41
	.byte ENEMY_SNAGGER					;- D 0 - - - 0x01961E 06:B60E: 0B
	.byte DIR_LEFT					;- D 0 - - - 0x01961F 06:B60F: 01

	.byte $B8					;- D 0 - - - 0x019620 06:B610: B8
	.byte $D0					;- D 0 - - - 0x019621 06:B611: D0
	.byte $02					;- D 0 - - - 0x019622 06:B612: 02
	.byte anSnaggerL_ID					;- D 0 - - - 0x019623 06:B613: 41
	.byte ENEMY_SNAGGER					;- D 0 - - - 0x019624 06:B614: 0B
	.byte DIR_LEFT					;- D 0 - - - 0x019625 06:B615: 01

	.byte $58					;- D 0 - - - 0x019626 06:B616: 58
	.byte $38					;- D 0 - - - 0x019627 06:B617: 38
	.byte $03					;- D 0 - - - 0x019628 06:B618: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x019629 06:B619: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01962A 06:B61A: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x01962B 06:B61B: 02

EnemiesRound23:
	.byte $07					;- D 0 - - - 0x01962C 06:B61C: 07

	.byte $68					;- D 0 - - - 0x01962D 06:B61D: 68
	.byte $20					;- D 0 - - - 0x01962E 06:B61E: 20
	.byte $02					;- D 0 - - - 0x01962F 06:B61F: 02
	.byte anPulpul_ID					;- D 0 - - - 0x019630 06:B620: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019631 06:B621: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x019632 06:B622: 02

	.byte $60					;- D 0 - - - 0x019633 06:B623: 60
	.byte $80					;- D 0 - - - 0x019634 06:B624: 80
	.byte $02					;- D 0 - - - 0x019635 06:B625: 02
	.byte anPulpul_ID					;- D 0 - - - 0x019636 06:B626: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019637 06:B627: 04
	.byte DIR_LEFT					;- D 0 - - - 0x019638 06:B628: 01

	.byte $68					;- D 0 - - - 0x019639 06:B629: 68
	.byte $E0					;- D 0 - - - 0x01963A 06:B62A: E0
	.byte $02					;- D 0 - - - 0x01963B 06:B62B: 02
	.byte anPulpul_ID					;- D 0 - - - 0x01963C 06:B62C: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x01963D 06:B62D: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x01963E 06:B62E: 02

	.byte $90					;- D 0 - - - 0x01963F 06:B62F: 90
	.byte $20					;- D 0 - - - 0x019640 06:B630: 20
	.byte $02					;- D 0 - - - 0x019641 06:B631: 02
	.byte anPulpul_ID					;- D 0 - - - 0x019642 06:B632: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019643 06:B633: 04
	.byte DIR_LEFT					;- D 0 - - - 0x019644 06:B634: 01

	.byte $90					;- D 0 - - - 0x019645 06:B635: 90
	.byte $80					;- D 0 - - - 0x019646 06:B636: 80
	.byte $02					;- D 0 - - - 0x019647 06:B637: 02
	.byte anPulpul_ID					;- D 0 - - - 0x019648 06:B638: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019649 06:B639: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x01964A 06:B63A: 02

	.byte $90					;- D 0 - - - 0x01964B 06:B63B: 90
	.byte $E0					;- D 0 - - - 0x01964C 06:B63C: E0
	.byte $02					;- D 0 - - - 0x01964D 06:B63D: 02
	.byte anPulpul_ID					;- D 0 - - - 0x01964E 06:B63E: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x01964F 06:B63F: 04
	.byte DIR_LEFT					;- D 0 - - - 0x019650 06:B640: 01

	.byte $30					;- D 0 - - - 0x019651 06:B641: 30
	.byte $80					;- D 0 - - - 0x019652 06:B642: 80
	.byte $03					;- D 0 - - - 0x019653 06:B643: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019654 06:B644: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019655 06:B645: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019656 06:B646: 01

EnemiesRound24:
.ifdef JP_ENEMY_PLACEMENT
	.byte $08					;- - - - - - 0x0196FF 06:B6EF: 08
.else
	.byte $06					;- D 0 - - - 0x019657 06:B647: 06
.endif

	.byte $50					;- D 0 - - - 0x019658 06:B648: 50
	.byte $80					;- D 0 - - - 0x019659 06:B649: 80
	.byte $02					;- D 0 - - - 0x01965A 06:B64A: 02
	.byte anTrash_ID					;- D 0 - - - 0x01965B 06:B64B: FE
	.byte ENEMY_TRASH					;- D 0 - - - 0x01965C 06:B64C: 15
	.byte DIR_NONE					;- D 0 - - - 0x01965D 06:B64D: 00

	.byte $00					;- D 0 - - - 0x01965E 06:B64E: 00
	.byte $00					;- D 0 - - - 0x01965F 06:B64F: 00
	.byte $03					;- D 0 - - - 0x019660 06:B650: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x019661 06:B651: 3F
	.byte ENEMY_NONE					;- D 0 - - - 0x019662 06:B652: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x019663 06:B653: 02

	.byte $00					;- D 0 - - - 0x019664 06:B654: 00
	.byte $00					;- D 0 - - - 0x019665 06:B655: 00
	.byte $03					;- D 0 - - - 0x019666 06:B656: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x019667 06:B657: 3F
	.byte ENEMY_NONE					;- D 0 - - - 0x019668 06:B658: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x019669 06:B659: 02

	.byte $00					;- D 0 - - - 0x01966A 06:B65A: 00
	.byte $00					;- D 0 - - - 0x01966B 06:B65B: 00
	.byte $03					;- D 0 - - - 0x01966C 06:B65C: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x01966D 06:B65D: 3F
	.byte ENEMY_NONE					;- D 0 - - - 0x01966E 06:B65E: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x01966F 06:B65F: 02

	.byte $00					;- D 0 - - - 0x019670 06:B660: 00
	.byte $00					;- D 0 - - - 0x019671 06:B661: 00
	.byte $03					;- D 0 - - - 0x019672 06:B662: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x019673 06:B663: 3F
	.byte ENEMY_NONE					;- D 0 - - - 0x019674 06:B664: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x019675 06:B665: 02

.ifdef JP_ENEMY_PLACEMENT
	.byte $C0					;- - - - - - 0x01971E 06:B70E: C0
	.byte $80					;- - - - - - 0x01971F 06:B70F: 80
	.byte $03					;- - - - - - 0x019720 06:B710: 03
	.byte anMonstaL_ID					;- - - - - - 0x019721 06:B711: 3E
	.byte ENEMY_MONSTA					;- - - - - - 0x019722 06:B712: 07
	.byte DIR_LEFT					;- - - - - - 0x019723 06:B713: 01

	.byte $40					;- - - - - - 0x019724 06:B714: 40
	.byte $80					;- - - - - - 0x019725 06:B715: 80
	.byte $03					;- - - - - - 0x019726 06:B716: 03
	.byte anMonstaR_ID					;- - - - - - 0x019727 06:B717: 3F
	.byte ENEMY_MONSTA					;- - - - - - 0x019728 06:B718: 07
	.byte DIR_RIGHT					;- - - - - - 0x019729 06:B719: 02
.endif

	.byte $C0					;- D 0 - - - 0x019676 06:B666: C0
	.byte $D8					;- D 0 - - - 0x019677 06:B667: D8
	.byte $03					;- D 0 - - - 0x019678 06:B668: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019679 06:B669: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x01967A 06:B66A: 07
	.byte DIR_LEFT					;- D 0 - - - 0x01967B 06:B66B: 01

EnemiesRound25:
	.byte $07					;- D 0 - - - 0x01967C 06:B66C: 07

	.byte $38					;- D 0 - - - 0x01967D 06:B66D: 38
	.byte $50					;- D 0 - - - 0x01967E 06:B66E: 50
	.byte $02					;- D 0 - - - 0x01967F 06:B66F: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x019680 06:B670: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x019681 06:B671: 17
	.byte DIR_LEFT					;- D 0 - - - 0x019682 06:B672: 01

	.byte $38					;- D 0 - - - 0x019683 06:B673: 38
	.byte $B8					;- D 0 - - - 0x019684 06:B674: B8
	.byte $02					;- D 0 - - - 0x019685 06:B675: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x019686 06:B676: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x019687 06:B677: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x019688 06:B678: 02

	.byte $60					;- D 0 - - - 0x019689 06:B679: 60
	.byte $84					;- D 0 - - - 0x01968A 06:B67A: 84
	.byte $02					;- D 0 - - - 0x01968B 06:B67B: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x01968C 06:B67C: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x01968D 06:B67D: 17
	.byte DIR_LEFT					;- D 0 - - - 0x01968E 06:B67E: 01

	.byte $88					;- D 0 - - - 0x01968F 06:B67F: 88
	.byte $84					;- D 0 - - - 0x019690 06:B680: 84
	.byte $02					;- D 0 - - - 0x019691 06:B681: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x019692 06:B682: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x019693 06:B683: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x019694 06:B684: 02

	.byte $88					;- D 0 - - - 0x019695 06:B685: 88
	.byte $50					;- D 0 - - - 0x019696 06:B686: 50
	.byte $02					;- D 0 - - - 0x019697 06:B687: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x019698 06:B688: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x019699 06:B689: 17
	.byte DIR_LEFT					;- D 0 - - - 0x01969A 06:B68A: 01

	.byte $88					;- D 0 - - - 0x01969B 06:B68B: 88
	.byte $B8					;- D 0 - - - 0x01969C 06:B68C: B8
	.byte $02					;- D 0 - - - 0x01969D 06:B68D: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x01969E 06:B68E: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x01969F 06:B68F: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x0196A0 06:B690: 02

	.byte $B0					;- D 0 - - - 0x0196A1 06:B691: B0
	.byte $84					;- D 0 - - - 0x0196A2 06:B692: 84
	.byte $03					;- D 0 - - - 0x0196A3 06:B693: 03
	.byte anChuckerL_ID					;- D 0 - - - 0x0196A4 06:B694: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x0196A5 06:B695: 17
	.byte DIR_LEFT					;- D 0 - - - 0x0196A6 06:B696: 01

EnemiesRound26:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x01975B 06:B74B: 07
.else
	.byte $05					;- D 0 - - - 0x0196A7 06:B697: 05
.endif

	.byte $88					;- D 0 - - - 0x0196A8 06:B698: 88
	.byte $80					;- D 0 - - - 0x0196A9 06:B699: 80
	.byte $02					;- D 0 - - - 0x0196AA 06:B69A: 02
	.byte anTwizzer_ID					;- D 0 - - - 0x0196AB 06:B69B: 9C
	.byte ENEMY_TWIZZER					;- D 0 - - - 0x0196AC 06:B69C: 0F
	.byte DIR_LEFT					;- D 0 - - - 0x0196AD 06:B69D: 01

	.byte $38					;- D 0 - - - 0x0196AE 06:B69E: 38
	.byte $38					;- D 0 - - - 0x0196AF 06:B69F: 38
	.byte $03					;- D 0 - - - 0x0196B0 06:B6A0: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x0196B1 06:B6A1: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0196B2 06:B6A2: 02
	.byte DIR_LEFT					;- D 0 - - - 0x0196B3 06:B6A3: 01

	.byte $38					;- D 0 - - - 0x0196B4 06:B6A4: 38
	.byte $C8					;- D 0 - - - 0x0196B5 06:B6A5: C8
	.byte $03					;- D 0 - - - 0x0196B6 06:B6A6: 03
	.byte anBanebouR_ID					;- D 0 - - - 0x0196B7 06:B6A7: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0196B8 06:B6A8: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x0196B9 06:B6A9: 02

	.byte $50					;- D 0 - - - 0x0196BA 06:B6AA: 50
	.byte $68					;- D 0 - - - 0x0196BB 06:B6AB: 68
	.byte $03					;- D 0 - - - 0x0196BC 06:B6AC: 03
	.byte anBanebouR_ID					;- D 0 - - - 0x0196BD 06:B6AD: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0196BE 06:B6AE: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x0196BF 06:B6AF: 02

	.byte $50					;- D 0 - - - 0x0196C0 06:B6B0: 50
	.byte $98					;- D 0 - - - 0x0196C1 06:B6B1: 98
	.byte $03					;- D 0 - - - 0x0196C2 06:B6B2: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x0196C3 06:B6B3: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0196C4 06:B6B4: 02
	.byte DIR_LEFT					;- D 0 - - - 0x0196C5 06:B6B5: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $68					;- - - - - - 0x01977A 06:B76A: 68
	.byte $20					;- - - - - - 0x01977B 06:B76B: 20
	.byte $03					;- - - - - - 0x01977C 06:B76C: 03
	.byte anBanebouL_ID					;- - - - - - 0x01977D 06:B76D: 43
	.byte ENEMY_BANEBOU					;- - - - - - 0x01977E 06:B76E: 02
	.byte DIR_LEFT					;- - - - - - 0x01977F 06:B76F: 01

	.byte $68					;- - - - - - 0x019780 06:B770: 68
	.byte $DF					;- - - - - - 0x019781 06:B771: DF
	.byte $03					;- - - - - - 0x019782 06:B772: 03
	.byte anBanebouR_ID					;- - - - - - 0x019783 06:B773: 44
	.byte ENEMY_BANEBOU					;- - - - - - 0x019784 06:B774: 02
	.byte DIR_RIGHT					;- - - - - - 0x019785 06:B775: 02
.endif

EnemiesRound27:
	.byte $02					;- D 0 - - - 0x0196C6 06:B6B6: 02

	.byte $30					;- D 0 - - - 0x0196C7 06:B6B7: 30
	.byte $28					;- D 0 - - - 0x0196C8 06:B6B8: 28
	.byte $02					;- D 0 - - - 0x0196C9 06:B6B9: 02
	.byte anKirikabun_ID					;- D 0 - - - 0x0196CA 06:B6BA: 54
	.byte ENEMY_KIRIKABUN					;- D 0 - - - 0x0196CB 06:B6BB: 0E
	.byte DIR_LEFT					;- D 0 - - - 0x0196CC 06:B6BC: 01

	.byte $30					;- D 0 - - - 0x0196CD 06:B6BD: 30
	.byte $D8					;- D 0 - - - 0x0196CE 06:B6BE: D8
	.byte $03					;- D 0 - - - 0x0196CF 06:B6BF: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x0196D0 06:B6C0: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0196D1 06:B6C1: 02
	.byte DIR_LEFT					;- D 0 - - - 0x0196D2 06:B6C2: 01

EnemiesRound28:
.ifdef JP_ENEMY_PLACEMENT
	.byte $05					;- - - - - - 0x019793 06:B783: 05
.else
	.byte $03					;- D 0 - - - 0x0196D3 06:B6C3: 03
.endif

	.byte $70					;- D 0 - - - 0x0196D4 06:B6C4: 70
	.byte $38					;- D 0 - - - 0x0196D5 06:B6C5: 38
	.byte $02					;- D 0 - - - 0x0196D6 06:B6C6: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x0196D7 06:B6C7: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x0196D8 06:B6C8: 17
	.byte DIR_LEFT					;- D 0 - - - 0x0196D9 06:B6C9: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $70					;- - - - - - 0x01979A 06:B78A: 70
	.byte $80					;- - - - - - 0x01979B 06:B78B: 80
	.byte $02					;- - - - - - 0x01979C 06:B78C: 02
	.byte anChuckerL_ID					;- - - - - - 0x01979D 06:B78D: BF
	.byte ENEMY_CHUCKER					;- - - - - - 0x01979E 06:B78E: 17
	.byte DIR_RIGHT					;- - - - - - 0x01979F 06:B78F: 02
.endif

	.byte $70					;- D 0 - - - 0x0196DA 06:B6CA: 70
	.byte $C8					;- D 0 - - - 0x0196DB 06:B6CB: C8
	.byte $02					;- D 0 - - - 0x0196DC 06:B6CC: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x0196DD 06:B6CD: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x0196DE 06:B6CE: 17
	.byte DIR_LEFT					;- D 0 - - - 0x0196DF 06:B6CF: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $28					;- - - - - - 0x0197A6 06:B796: 28
	.byte $1C					;- - - - - - 0x0197A7 06:B797: 1C
	.byte $03					;- - - - - - 0x0197A8 06:B798: 03
	.byte anPulpul_ID					;- - - - - - 0x0197A9 06:B799: 47
	.byte ENEMY_PULPUL					;- - - - - - 0x0197AA 06:B79A: 04
	.byte DIR_RIGHT					;- - - - - - 0x0197AB 06:B79B: 02
.endif

	.byte $A0					;- D 0 - - - 0x0196E0 06:B6D0: A0
	.byte $E0					;- D 0 - - - 0x0196E1 06:B6D1: E0
	.byte $03					;- D 0 - - - 0x0196E2 06:B6D2: 03
	.byte anPulpul_ID					;- D 0 - - - 0x0196E3 06:B6D3: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x0196E4 06:B6D4: 04
	.byte DIR_LEFT					;- D 0 - - - 0x0196E5 06:B6D5: 01

EnemiesRound29:
	.byte $06					;- D 0 - - - 0x0196E6 06:B6D6: 06

	.byte $20					;- D 0 - - - 0x0196E7 06:B6D7: 20
	.byte $40					;- D 0 - - - 0x0196E8 06:B6D8: 40
	.byte $03					;- D 0 - - - 0x0196E9 06:B6D9: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x0196EA 06:B6DA: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0196EB 06:B6DB: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0196EC 06:B6DC: 01

	.byte $20					;- D 0 - - - 0x0196ED 06:B6DD: 20
	.byte $C0					;- D 0 - - - 0x0196EE 06:B6DE: C0
	.byte $03					;- D 0 - - - 0x0196EF 06:B6DF: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x0196F0 06:B6E0: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0196F1 06:B6E1: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x0196F2 06:B6E2: 02

	.byte $78					;- D 0 - - - 0x0196F3 06:B6E3: 78
	.byte $5B					;- D 0 - - - 0x0196F4 06:B6E4: 5B
	.byte $03					;- D 0 - - - 0x0196F5 06:B6E5: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x0196F6 06:B6E6: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0196F7 06:B6E7: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0196F8 06:B6E8: 01

	.byte $78					;- D 0 - - - 0x0196F9 06:B6E9: 78
	.byte $A4					;- D 0 - - - 0x0196FA 06:B6EA: A4
	.byte $03					;- D 0 - - - 0x0196FB 06:B6EB: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x0196FC 06:B6EC: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0196FD 06:B6ED: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x0196FE 06:B6EE: 02

	.byte $88					;- D 0 - - - 0x0196FF 06:B6EF: 88
	.byte $3B					;- D 0 - - - 0x019700 06:B6F0: 3B
	.byte $03					;- D 0 - - - 0x019701 06:B6F1: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019702 06:B6F2: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019703 06:B6F3: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019704 06:B6F4: 01

	.byte $88					;- D 0 - - - 0x019705 06:B6F5: 88
	.byte $C4					;- D 0 - - - 0x019706 06:B6F6: C4
	.byte $03					;- D 0 - - - 0x019707 06:B6F7: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x019708 06:B6F8: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019709 06:B6F9: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x01970A 06:B6FA: 02

EnemiesRound30:
	.byte $04					;- D 0 - - - 0x01970B 06:B6FB: 04

	.byte $A0					;- D 0 - - - 0x01970C 06:B6FC: A0
	.byte $80					;- D 0 - - - 0x01970D 06:B6FD: 80
	.byte $02					;- D 0 - - - 0x01970E 06:B6FE: 02
	.byte anDOHBody_ID					;- D 0 - - - 0x01970F 06:B6FF: C9
	.byte ENEMY_DOH					;- D 0 - - - 0x019710 06:B700: 12
	.byte DIR_LEFT					;- D 0 - - - 0x019711 06:B701: 01

	.byte $90					;- D 0 - - - 0x019712 06:B702: 90
	.byte $80					;- D 0 - - - 0x019713 06:B703: 80
	.byte $02					;- D 0 - - - 0x019714 06:B704: 02
	.byte anDOHMouth_ID					;- D 0 - - - 0x019715 06:B705: C8
	.byte ENEMY_DOH					;- D 0 - - - 0x019716 06:B706: 12
	.byte DIR_LEFT					;- D 0 - - - 0x019717 06:B707: 01

	.byte $80					;- D 0 - - - 0x019718 06:B708: 80
	.byte $80					;- D 0 - - - 0x019719 06:B709: 80
	.byte $02					;- D 0 - - - 0x01971A 06:B70A: 02
	.byte anDOHFace_ID					;- D 0 - - - 0x01971B 06:B70B: C7
	.byte ENEMY_DOH					;- D 0 - - - 0x01971C 06:B70C: 12
	.byte DIR_LEFT					;- D 0 - - - 0x01971D 06:B70D: 01

	.byte $70					;- D 0 - - - 0x01971E 06:B70E: 70
	.byte $80					;- D 0 - - - 0x01971F 06:B70F: 80
	.byte $02					;- D 0 - - - 0x019720 06:B710: 02
	.byte anDOHTop_ID					;- D 0 - - - 0x019721 06:B711: C6
	.byte ENEMY_DOH					;- D 0 - - - 0x019722 06:B712: 12
	.byte DIR_LEFT					;- D 0 - - - 0x019723 06:B713: 01

EnemiesRound31:
	.byte $04					;- D 0 - - - 0x019724 06:B714: 04

	.byte $78					;- D 0 - - - 0x019725 06:B715: 78
	.byte $B8					;- D 0 - - - 0x019726 06:B716: B8
	.byte $02					;- D 0 - - - 0x019727 06:B717: 02
	.byte anSnaggerL_ID					;- D 0 - - - 0x019728 06:B718: 41
	.byte ENEMY_SNAGGER					;- D 0 - - - 0x019729 06:B719: 0B
	.byte DIR_LEFT					;- D 0 - - - 0x01972A 06:B71A: 01

	.byte $90					;- D 0 - - - 0x01972B 06:B71B: 90
	.byte $78					;- D 0 - - - 0x01972C 06:B71C: 78
	.byte $03					;- D 0 - - - 0x01972D 06:B71D: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x01972E 06:B71E: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01972F 06:B71F: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019730 06:B720: 02

	.byte $C8					;- D 0 - - - 0x019731 06:B721: C8
	.byte $80					;- D 0 - - - 0x019732 06:B722: 80
	.byte $03					;- D 0 - - - 0x019733 06:B723: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019734 06:B724: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019735 06:B725: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019736 06:B726: 01

	.byte $C8					;- D 0 - - - 0x019737 06:B727: C8
	.byte $A8					;- D 0 - - - 0x019738 06:B728: A8
	.byte $03					;- D 0 - - - 0x019739 06:B729: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x01973A 06:B72A: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01973B 06:B72B: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x01973C 06:B72C: 02

EnemiesRound32:
	.byte $03					;- D 0 - - - 0x01973D 06:B72D: 03

	.byte $B8					;- D 0 - - - 0x01973E 06:B72E: B8
	.byte $80					;- D 0 - - - 0x01973F 06:B72F: 80
	.byte $02					;- D 0 - - - 0x019740 06:B730: 02
	.byte anSnaggerL_ID					;- D 0 - - - 0x019741 06:B731: 41
	.byte ENEMY_SNAGGER					;- D 0 - - - 0x019742 06:B732: 0B
	.byte DIR_LEFT					;- D 0 - - - 0x019743 06:B733: 01

	.byte $50					;- D 0 - - - 0x019744 06:B734: 50
	.byte $60					;- D 0 - - - 0x019745 06:B735: 60
	.byte $03					;- D 0 - - - 0x019746 06:B736: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019747 06:B737: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019748 06:B738: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019749 06:B739: 01

	.byte $50					;- D 0 - - - 0x01974A 06:B73A: 50
	.byte $A0					;- D 0 - - - 0x01974B 06:B73B: A0
	.byte $03					;- D 0 - - - 0x01974C 06:B73C: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x01974D 06:B73D: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x01974E 06:B73E: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x01974F 06:B73F: 02

EnemiesRound33:
.ifdef JP_ENEMY_PLACEMENT
	.byte $08					;- - - - - - 0x01981C 06:B80C: 08
.else
	.byte $06					;- D 0 - - - 0x019750 06:B740: 06
.endif

	.byte $70					;- D 0 - - - 0x019751 06:B741: 70
	.byte $80					;- D 0 - - - 0x019752 06:B742: 80
	.byte $02					;- D 0 - - - 0x019753 06:B743: 02
	.byte anTrash_ID					;- D 0 - - - 0x019754 06:B744: FE
	.byte ENEMY_TRASH					;- D 0 - - - 0x019755 06:B745: 15
	.byte DIR_NONE					;- D 0 - - - 0x019756 06:B746: 00

	.byte $00					;- D 0 - - - 0x019757 06:B747: 00
	.byte $00					;- D 0 - - - 0x019758 06:B748: 00
	.byte $03					;- D 0 - - - 0x019759 06:B749: 03
	.byte anPulpul_ID					;- D 0 - - - 0x01975A 06:B74A: 47
	.byte ENEMY_NONE					;- D 0 - - - 0x01975B 06:B74B: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x01975C 06:B74C: 02

	.byte $00					;- D 0 - - - 0x01975D 06:B74D: 00
	.byte $00					;- D 0 - - - 0x01975E 06:B74E: 00
	.byte $03					;- D 0 - - - 0x01975F 06:B74F: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019760 06:B750: 47
	.byte ENEMY_NONE					;- D 0 - - - 0x019761 06:B751: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x019762 06:B752: 02

	.byte $00					;- D 0 - - - 0x019763 06:B753: 00
	.byte $00					;- D 0 - - - 0x019764 06:B754: 00
	.byte $03					;- D 0 - - - 0x019765 06:B755: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019766 06:B756: 47
	.byte ENEMY_NONE					;- D 0 - - - 0x019767 06:B757: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x019768 06:B758: 02

	.byte $00					;- D 0 - - - 0x019769 06:B759: 00
	.byte $00					;- D 0 - - - 0x01976A 06:B75A: 00
	.byte $03					;- D 0 - - - 0x01976B 06:B75B: 03
	.byte anPulpul_ID					;- D 0 - - - 0x01976C 06:B75C: 47
	.byte ENEMY_NONE					;- D 0 - - - 0x01976D 06:B75D: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x01976E 06:B75E: 02

.ifdef JP_ENEMY_PLACEMENT
	.byte $00					;- - - - - - 0x01983B 06:B82B: 00
	.byte $00					;- - - - - - 0x01983C 06:B82C: 00
	.byte $03					;- - - - - - 0x01983D 06:B82D: 03
	.byte anPulpul_ID					;- - - - - - 0x01983E 06:B82E: 47
	.byte ENEMY_NONE					;- - - - - - 0x01983F 06:B82F: 00
	.byte DIR_RIGHT					;- - - - - - 0x019840 06:B830: 02

	.byte $00					;- - - - - - 0x019841 06:B831: 00
	.byte $00					;- - - - - - 0x019842 06:B832: 00
	.byte $03					;- - - - - - 0x019843 06:B833: 03
	.byte anPulpul_ID					;- - - - - - 0x019844 06:B834: 47
	.byte ENEMY_NONE					;- - - - - - 0x019845 06:B835: 00
	.byte DIR_RIGHT					;- - - - - - 0x019846 06:B836: 02
.endif

	.byte $48					;- D 0 - - - 0x01976F 06:B75F: 48
	.byte $60					;- D 0 - - - 0x019770 06:B760: 60
	.byte $03					;- D 0 - - - 0x019771 06:B761: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019772 06:B762: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019773 06:B763: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x019774 06:B764: 02

EnemiesRound34:
	.byte $07					;- D 0 - - - 0x019775 06:B765: 07

	.byte $38					;- D 0 - - - 0x019776 06:B766: 38
	.byte $38					;- D 0 - - - 0x019777 06:B767: 38
	.byte $02					;- D 0 - - - 0x019778 06:B768: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x019779 06:B769: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x01977A 06:B76A: 03
	.byte DIR_LEFT					;- D 0 - - - 0x01977B 06:B76B: 01

	.byte $38					;- D 0 - - - 0x01977C 06:B76C: 38
	.byte $58					;- D 0 - - - 0x01977D 06:B76D: 58
	.byte $02					;- D 0 - - - 0x01977E 06:B76E: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x01977F 06:B76F: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019780 06:B770: 03
	.byte DIR_LEFT					;- D 0 - - - 0x019781 06:B771: 01

	.byte $38					;- D 0 - - - 0x019782 06:B772: 38
	.byte $A8					;- D 0 - - - 0x019783 06:B773: A8
	.byte $02					;- D 0 - - - 0x019784 06:B774: 02
	.byte anBlobbyR_ID					;- D 0 - - - 0x019785 06:B775: 46
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019786 06:B776: 03
	.byte DIR_RIGHT					;- D 0 - - - 0x019787 06:B777: 02

	.byte $38					;- D 0 - - - 0x019788 06:B778: 38
	.byte $C8					;- D 0 - - - 0x019789 06:B779: C8
	.byte $02					;- D 0 - - - 0x01978A 06:B77A: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x01978B 06:B77B: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x01978C 06:B77C: 03
	.byte DIR_LEFT					;- D 0 - - - 0x01978D 06:B77D: 01

	.byte $90					;- D 0 - - - 0x01978E 06:B77E: 90
	.byte $58					;- D 0 - - - 0x01978F 06:B77F: 58
	.byte $02					;- D 0 - - - 0x019790 06:B780: 02
	.byte anBlobbyR_ID					;- D 0 - - - 0x019791 06:B781: 46
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019792 06:B782: 03
	.byte DIR_RIGHT					;- D 0 - - - 0x019793 06:B783: 02

	.byte $90					;- D 0 - - - 0x019794 06:B784: 90
	.byte $A8					;- D 0 - - - 0x019795 06:B785: A8
	.byte $02					;- D 0 - - - 0x019796 06:B786: 02
	.byte anBlobbyR_ID					;- D 0 - - - 0x019797 06:B787: 46
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019798 06:B788: 03
	.byte DIR_RIGHT					;- D 0 - - - 0x019799 06:B789: 02

	.byte $C8					;- D 0 - - - 0x01979A 06:B78A: C8
	.byte $80					;- D 0 - - - 0x01979B 06:B78B: 80
	.byte $03					;- D 0 - - - 0x01979C 06:B78C: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x01979D 06:B78D: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x01979E 06:B78E: 07
	.byte DIR_LEFT					;- D 0 - - - 0x01979F 06:B78F: 01

EnemiesRound35:
.ifdef JP_ENEMY_PLACEMENT
	.byte $08					;- - - - - - 0x019878 06:B868: 08
.else
	.byte $07					;- D 0 - - - 0x0197A0 06:B790: 07
.endif

	.byte $30					;- D 0 - - - 0x0197A1 06:B791: 30
	.byte $80					;- D 0 - - - 0x0197A2 06:B792: 80
	.byte $02					;- D 0 - - - 0x0197A3 06:B793: 02
	.byte anTrash_ID					;- D 0 - - - 0x0197A4 06:B794: FE
	.byte ENEMY_TRASH					;- D 0 - - - 0x0197A5 06:B795: 15
	.byte DIR_NONE					;- D 0 - - - 0x0197A6 06:B796: 00

	.byte $00					;- D 0 - - - 0x0197A7 06:B797: 00
	.byte $00					;- D 0 - - - 0x0197A8 06:B798: 00
	.byte $03					;- D 0 - - - 0x0197A9 06:B799: 03
	.byte anInvader_ID					;- D 0 - - - 0x0197AA 06:B79A: 48
	.byte ENEMY_NONE					;- D 0 - - - 0x0197AB 06:B79B: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x0197AC 06:B79C: 02

	.byte $00					;- D 0 - - - 0x0197AD 06:B79D: 00
	.byte $00					;- D 0 - - - 0x0197AE 06:B79E: 00
	.byte $03					;- D 0 - - - 0x0197AF 06:B79F: 03
	.byte anInvader_ID					;- D 0 - - - 0x0197B0 06:B7A0: 48
	.byte ENEMY_NONE					;- D 0 - - - 0x0197B1 06:B7A1: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x0197B2 06:B7A2: 02

	.byte $00					;- D 0 - - - 0x0197B3 06:B7A3: 00
	.byte $00					;- D 0 - - - 0x0197B4 06:B7A4: 00
	.byte $03					;- D 0 - - - 0x0197B5 06:B7A5: 03
	.byte anInvader_ID					;- D 0 - - - 0x0197B6 06:B7A6: 48
	.byte ENEMY_NONE					;- D 0 - - - 0x0197B7 06:B7A7: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x0197B8 06:B7A8: 02

	.byte $00					;- D 0 - - - 0x0197B9 06:B7A9: 00
	.byte $00					;- D 0 - - - 0x0197BA 06:B7AA: 00
	.byte $03					;- D 0 - - - 0x0197BB 06:B7AB: 03
	.byte anInvader_ID					;- D 0 - - - 0x0197BC 06:B7AC: 48
	.byte ENEMY_NONE					;- D 0 - - - 0x0197BD 06:B7AD: 00
	.byte DIR_RIGHT					;- D 0 - - - 0x0197BE 06:B7AE: 02

.ifdef JP_ENEMY_PLACEMENT
	.byte $C4					;- - - - - - 0x019897 06:B887: C4
	.byte $A0					;- - - - - - 0x019898 06:B888: A0
	.byte $03					;- - - - - - 0x019899 06:B889: 03
	.byte anInvader_ID					;- - - - - - 0x01989A 06:B88A: 48
	.byte ENEMY_INVADER					;- - - - - - 0x01989B 06:B88B: 06
	.byte DIR_LEFT					;- - - - - - 0x01989C 06:B88C: 01
.endif

	.byte $C4					;- D 0 - - - 0x0197BF 06:B7AF: C4
	.byte $60					;- D 0 - - - 0x0197C0 06:B7B0: 60
	.byte $03					;- D 0 - - - 0x0197C1 06:B7B1: 03
	.byte anInvader_ID					;- D 0 - - - 0x0197C2 06:B7B2: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x0197C3 06:B7B3: 06
	.byte DIR_LEFT					;- D 0 - - - 0x0197C4 06:B7B4: 01

	.byte $C4					;- D 0 - - - 0x0197C5 06:B7B5: C4
	.byte $E0					;- D 0 - - - 0x0197C6 06:B7B6: E0
	.byte $03					;- D 0 - - - 0x0197C7 06:B7B7: 03
	.byte anInvader_ID					;- D 0 - - - 0x0197C8 06:B7B8: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x0197C9 06:B7B9: 06
	.byte DIR_LEFT					;- D 0 - - - 0x0197CA 06:B7BA: 01

EnemiesRound36:
	.byte $03					;- D 0 - - - 0x0197CB 06:B7BB: 03

	.byte $88					;- D 0 - - - 0x0197CC 06:B7BC: 88
	.byte $80					;- D 0 - - - 0x0197CD 06:B7BD: 80
	.byte $02					;- D 0 - - - 0x0197CE 06:B7BE: 02
	.byte anManticharR_ID					;- D 0 - - - 0x0197CF 06:B7BF: 4F
	.byte ENEMY_MANTICHAR					;- D 0 - - - 0x0197D0 06:B7C0: 0C
	.byte DIR_LEFT					;- D 0 - - - 0x0197D1 06:B7C1: 01

	.byte $60					;- D 0 - - - 0x0197D2 06:B7C2: 60
	.byte $80					;- D 0 - - - 0x0197D3 06:B7C3: 80
	.byte $02					;- D 0 - - - 0x0197D4 06:B7C4: 02
	.byte anManticharR_ID					;- D 0 - - - 0x0197D5 06:B7C5: 4F
	.byte ENEMY_MANTICHAR					;- D 0 - - - 0x0197D6 06:B7C6: 0C
	.byte DIR_RIGHT					;- D 0 - - - 0x0197D7 06:B7C7: 02

	.byte $40					;- D 0 - - - 0x0197D8 06:B7C8: 40
	.byte $88					;- D 0 - - - 0x0197D9 06:B7C9: 88
	.byte $03					;- D 0 - - - 0x0197DA 06:B7CA: 03
	.byte anInvader_ID					;- D 0 - - - 0x0197DB 06:B7CB: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x0197DC 06:B7CC: 06
	.byte DIR_LEFT					;- D 0 - - - 0x0197DD 06:B7CD: 01

EnemiesRound37:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x0198BC 06:B8AC: 07
.else
	.byte $05					;- D 0 - - - 0x0197DE 06:B7CE: 05
.endif

	.byte $30					;- D 0 - - - 0x0197DF 06:B7CF: 30
	.byte $48					;- D 0 - - - 0x0197E0 06:B7D0: 48
	.byte $03					;- D 0 - - - 0x0197E1 06:B7D1: 03
	.byte anPulpul_ID					;- D 0 - - - 0x0197E2 06:B7D2: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x0197E3 06:B7D3: 04
	.byte DIR_LEFT					;- D 0 - - - 0x0197E4 06:B7D4: 01

	.byte $30					;- D 0 - - - 0x0197E5 06:B7D5: 30
	.byte $B8					;- D 0 - - - 0x0197E6 06:B7D6: B8
	.byte $03					;- D 0 - - - 0x0197E7 06:B7D7: 03
	.byte anPulpul_ID					;- D 0 - - - 0x0197E8 06:B7D8: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x0197E9 06:B7D9: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x0197EA 06:B7DA: 02

.ifdef JP_ENEMY_PLACEMENT
	.byte $A8					;- - - - - - 0x0198C9 06:B8B9: A8
	.byte $58					;- - - - - - 0x0198CA 06:B8BA: 58
	.byte $03					;- - - - - - 0x0198CB 06:B8BB: 03
	.byte anPulpul_ID					;- - - - - - 0x0198CC 06:B8BC: 47
	.byte ENEMY_PULPUL					;- - - - - - 0x0198CD 06:B8BD: 04
	.byte DIR_LEFT					;- - - - - - 0x0198CE 06:B8BE: 01

	.byte $A8					;- - - - - - 0x0198CF 06:B8BF: A8
	.byte $A8					;- - - - - - 0x0198D0 06:B8C0: A8
	.byte $03					;- - - - - - 0x0198D1 06:B8C1: 03
	.byte anPulpul_ID					;- - - - - - 0x0198D2 06:B8C2: 47
	.byte ENEMY_PULPUL					;- - - - - - 0x0198D3 06:B8C3: 04
	.byte DIR_LEFT					;- - - - - - 0x0198D4 06:B8C4: 01
.endif

	.byte $50					;- D 0 - - - 0x0197EB 06:B7DB: 50
	.byte $48					;- D 0 - - - 0x0197EC 06:B7DC: 48
	.byte $02					;- D 0 - - - 0x0197ED 06:B7DD: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x0197EE 06:B7DE: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x0197EF 06:B7DF: 03
	.byte DIR_LEFT					;- D 0 - - - 0x0197F0 06:B7E0: 01

	.byte $50					;- D 0 - - - 0x0197F1 06:B7E1: 50
	.byte $B8					;- D 0 - - - 0x0197F2 06:B7E2: B8
	.byte $02					;- D 0 - - - 0x0197F3 06:B7E3: 02
	.byte anBlobbyR_ID					;- D 0 - - - 0x0197F4 06:B7E4: 46
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x0197F5 06:B7E5: 03
	.byte DIR_RIGHT					;- D 0 - - - 0x0197F6 06:B7E6: 02

	.byte $A8					;- D 0 - - - 0x0197F7 06:B7E7: A8
	.byte $80					;- D 0 - - - 0x0197F8 06:B7E8: 80
	.byte $02					;- D 0 - - - 0x0197F9 06:B7E9: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x0197FA 06:B7EA: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x0197FB 06:B7EB: 03
	.byte DIR_LEFT					;- D 0 - - - 0x0197FC 06:B7EC: 01

EnemiesRound38:
	.byte $03					;- D 0 - - - 0x0197FD 06:B7ED: 03

	.byte $48					;- D 0 - - - 0x0197FE 06:B7EE: 48
	.byte $30					;- D 0 - - - 0x0197FF 06:B7EF: 30
	.byte $03					;- D 0 - - - 0x019800 06:B7F0: 03
	.byte anInvader_ID					;- D 0 - - - 0x019801 06:B7F1: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019802 06:B7F2: 06
	.byte DIR_LEFT					;- D 0 - - - 0x019803 06:B7F3: 01

	.byte $48					;- D 0 - - - 0x019804 06:B7F4: 48
	.byte $B0					;- D 0 - - - 0x019805 06:B7F5: B0
	.byte $03					;- D 0 - - - 0x019806 06:B7F6: 03
	.byte anInvader_ID					;- D 0 - - - 0x019807 06:B7F7: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019808 06:B7F8: 06
	.byte DIR_RIGHT					;- D 0 - - - 0x019809 06:B7F9: 02

	.byte $88					;- D 0 - - - 0x01980A 06:B7FA: 88
	.byte $90					;- D 0 - - - 0x01980B 06:B7FB: 90
	.byte $02					;- D 0 - - - 0x01980C 06:B7FC: 02
	.byte anMonstaR_ID					;- D 0 - - - 0x01980D 06:B7FD: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x01980E 06:B7FE: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x01980F 06:B7FF: 02

EnemiesRound39:
	.byte $03					;- D 0 - - - 0x019810 06:B800: 03

	.byte $30					;- D 0 - - - 0x019811 06:B801: 30
	.byte $80					;- D 0 - - - 0x019812 06:B802: 80
	.byte $02					;- D 0 - - - 0x019813 06:B803: 02
	.byte anKirikabun_ID					;- D 0 - - - 0x019814 06:B804: 54
	.byte ENEMY_KIRIKABUN					;- D 0 - - - 0x019815 06:B805: 0E
	.byte DIR_LEFT					;- D 0 - - - 0x019816 06:B806: 01

	.byte $78					;- D 0 - - - 0x019817 06:B807: 78
	.byte $30					;- D 0 - - - 0x019818 06:B808: 30
	.byte $03					;- D 0 - - - 0x019819 06:B809: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x01981A 06:B80A: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x01981B 06:B80B: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x01981C 06:B80C: 02

	.byte $78					;- D 0 - - - 0x01981D 06:B80D: 78
	.byte $D0					;- D 0 - - - 0x01981E 06:B80E: D0
	.byte $03					;- D 0 - - - 0x01981F 06:B80F: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019820 06:B810: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019821 06:B811: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019822 06:B812: 01

EnemiesRound40:
	.byte $01					;- D 0 - - - 0x019823 06:B813: 01

	.byte $78					;- D 0 - - - 0x019824 06:B814: 78
	.byte $80					;- D 0 - - - 0x019825 06:B815: 80
	.byte $02					;- D 0 - - - 0x019826 06:B816: 02
	.byte anMadMonkey_ID					;- D 0 - - - 0x019827 06:B817: DB
	.byte ENEMY_MADMONKEY					;- D 0 - - - 0x019828 06:B818: 1A
	.byte DIR_LEFT|DIR_INSTAPLACE					;- D 0 - - - 0x019829 06:B819: 81

EnemiesRound41:
.ifdef JP_ENEMY_PLACEMENT
	.byte $06					;- - - - - - 0x019914 06:B904: 06
.else
	.byte $04					;- D 0 - - - 0x01982A 06:B81A: 04
.endif

	.byte $48					;- D 0 - - - 0x01982B 06:B81B: 48
	.byte $68					;- D 0 - - - 0x01982C 06:B81C: 68
	.byte $03					;- D 0 - - - 0x01982D 06:B81D: 03
	.byte anInvader_ID					;- D 0 - - - 0x01982E 06:B81E: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x01982F 06:B81F: 06
	.byte DIR_LEFT					;- D 0 - - - 0x019830 06:B820: 01

	.byte $48					;- D 0 - - - 0x019831 06:B821: 48
	.byte $98					;- D 0 - - - 0x019832 06:B822: 98
	.byte $03					;- D 0 - - - 0x019833 06:B823: 03
	.byte anInvader_ID					;- D 0 - - - 0x019834 06:B824: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019835 06:B825: 06
	.byte DIR_RIGHT					;- D 0 - - - 0x019836 06:B826: 02

.ifdef JP_ENEMY_PLACEMENT
	.byte $68					;- - - - - - 0x019921 06:B911: 68
	.byte $48					;- - - - - - 0x019922 06:B912: 48
	.byte $03					;- - - - - - 0x019923 06:B913: 03
	.byte anInvader_ID					;- - - - - - 0x019924 06:B914: 48
	.byte ENEMY_INVADER					;- - - - - - 0x019925 06:B915: 06
	.byte DIR_LEFT					;- - - - - - 0x019926 06:B916: 01

	.byte $68					;- - - - - - 0x019927 06:B917: 68
	.byte $B8					;- - - - - - 0x019928 06:B918: B8
	.byte $03					;- - - - - - 0x019929 06:B919: 03
	.byte anInvader_ID					;- - - - - - 0x01992A 06:B91A: 48
	.byte ENEMY_INVADER					;- - - - - - 0x01992B 06:B91B: 06
	.byte DIR_RIGHT					;- - - - - - 0x01992C 06:B91C: 02
.endif

	.byte $88					;- D 0 - - - 0x019837 06:B827: 88
	.byte $68					;- D 0 - - - 0x019838 06:B828: 68
	.byte $03					;- D 0 - - - 0x019839 06:B829: 03
	.byte anInvader_ID					;- D 0 - - - 0x01983A 06:B82A: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x01983B 06:B82B: 06
	.byte DIR_LEFT					;- D 0 - - - 0x01983C 06:B82C: 01

	.byte $88					;- D 0 - - - 0x01983D 06:B82D: 88
	.byte $98					;- D 0 - - - 0x01983E 06:B82E: 98
	.byte $03					;- D 0 - - - 0x01983F 06:B82F: 03
	.byte anInvader_ID					;- D 0 - - - 0x019840 06:B830: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019841 06:B831: 06
	.byte DIR_RIGHT					;- D 0 - - - 0x019842 06:B832: 02

EnemiesRound42:
	.byte $06					;- D 0 - - - 0x019843 06:B833: 06

	.byte $88					;- D 0 - - - 0x019844 06:B834: 88
	.byte $70					;- D 0 - - - 0x019845 06:B835: 70
	.byte $02					;- D 0 - - - 0x019846 06:B836: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x019847 06:B837: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x019848 06:B838: 17
	.byte DIR_LEFT					;- D 0 - - - 0x019849 06:B839: 01

	.byte $88					;- D 0 - - - 0x01984A 06:B83A: 88
	.byte $90					;- D 0 - - - 0x01984B 06:B83B: 90
	.byte $02					;- D 0 - - - 0x01984C 06:B83C: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x01984D 06:B83D: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x01984E 06:B83E: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x01984F 06:B83F: 02

	.byte $58					;- D 0 - - - 0x019850 06:B840: 58
	.byte $38					;- D 0 - - - 0x019851 06:B841: 38
	.byte $02					;- D 0 - - - 0x019852 06:B842: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x019853 06:B843: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x019854 06:B844: 17
	.byte DIR_LEFT					;- D 0 - - - 0x019855 06:B845: 01

	.byte $58					;- D 0 - - - 0x019856 06:B846: 58
	.byte $C8					;- D 0 - - - 0x019857 06:B847: C8
	.byte $02					;- D 0 - - - 0x019858 06:B848: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x019859 06:B849: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x01985A 06:B84A: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x01985B 06:B84B: 02

	.byte $70					;- D 0 - - - 0x01985C 06:B84C: 70
	.byte $60					;- D 0 - - - 0x01985D 06:B84D: 60
	.byte $02					;- D 0 - - - 0x01985E 06:B84E: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x01985F 06:B84F: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x019860 06:B850: 17
	.byte DIR_LEFT					;- D 0 - - - 0x019861 06:B851: 01

	.byte $70					;- D 0 - - - 0x019862 06:B852: 70
	.byte $A0					;- D 0 - - - 0x019863 06:B853: A0
	.byte $03					;- D 0 - - - 0x019864 06:B854: 03
	.byte anChuckerL_ID					;- D 0 - - - 0x019865 06:B855: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x019866 06:B856: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x019867 06:B857: 02

EnemiesRound43:
	.byte $03					;- D 0 - - - 0x019868 06:B858: 03

	.byte $28					;- D 0 - - - 0x019869 06:B859: 28
	.byte $60					;- D 0 - - - 0x01986A 06:B85A: 60
	.byte $03					;- D 0 - - - 0x01986B 06:B85B: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x01986C 06:B85C: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x01986D 06:B85D: 07
	.byte DIR_LEFT					;- D 0 - - - 0x01986E 06:B85E: 01

	.byte $28					;- D 0 - - - 0x01986F 06:B85F: 28
	.byte $A8					;- D 0 - - - 0x019870 06:B860: A8
	.byte $03					;- D 0 - - - 0x019871 06:B861: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019872 06:B862: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019873 06:B863: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019874 06:B864: 01

	.byte $50					;- D 0 - - - 0x019875 06:B865: 50
	.byte $80					;- D 0 - - - 0x019876 06:B866: 80
	.byte $02					;- D 0 - - - 0x019877 06:B867: 02
	.byte anManticharL_ID					;- D 0 - - - 0x019878 06:B868: 4E
	.byte ENEMY_MANTICHAR					;- D 0 - - - 0x019879 06:B869: 0C
	.byte DIR_LEFT					;- D 0 - - - 0x01987A 06:B86A: 01

EnemiesRound44:
	.byte $06					;- D 0 - - - 0x01987B 06:B86B: 06

	.byte $60					;- D 0 - - - 0x01987C 06:B86C: 60
	.byte $B8					;- D 0 - - - 0x01987D 06:B86D: B8
	.byte $03					;- D 0 - - - 0x01987E 06:B86E: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x01987F 06:B86F: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019880 06:B870: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019881 06:B871: 01

	.byte $30					;- D 0 - - - 0x019882 06:B872: 30
	.byte $18					;- D 0 - - - 0x019883 06:B873: 18
	.byte $02					;- D 0 - - - 0x019884 06:B874: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x019885 06:B875: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019886 06:B876: 03
	.byte DIR_LEFT					;- D 0 - - - 0x019887 06:B877: 01

	.byte $58					;- D 0 - - - 0x019888 06:B878: 58
	.byte $50					;- D 0 - - - 0x019889 06:B879: 50
	.byte $02					;- D 0 - - - 0x01988A 06:B87A: 02
	.byte anBlobbyR_ID					;- D 0 - - - 0x01988B 06:B87B: 46
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x01988C 06:B87C: 03
	.byte DIR_RIGHT					;- D 0 - - - 0x01988D 06:B87D: 02

	.byte $60					;- D 0 - - - 0x01988E 06:B87E: 60
	.byte $E8					;- D 0 - - - 0x01988F 06:B87F: E8
	.byte $02					;- D 0 - - - 0x019890 06:B880: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x019891 06:B881: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019892 06:B882: 03
	.byte DIR_LEFT					;- D 0 - - - 0x019893 06:B883: 01

	.byte $C8					;- D 0 - - - 0x019894 06:B884: C8
	.byte $80					;- D 0 - - - 0x019895 06:B885: 80
	.byte $02					;- D 0 - - - 0x019896 06:B886: 02
	.byte anBlobbyR_ID					;- D 0 - - - 0x019897 06:B887: 46
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019898 06:B888: 03
	.byte DIR_RIGHT					;- D 0 - - - 0x019899 06:B889: 02

	.byte $C0					;- D 0 - - - 0x01989A 06:B88A: C0
	.byte $D0					;- D 0 - - - 0x01989B 06:B88B: D0
	.byte $02					;- D 0 - - - 0x01989C 06:B88C: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x01989D 06:B88D: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x01989E 06:B88E: 03
	.byte DIR_LEFT					;- D 0 - - - 0x01989F 06:B88F: 01

EnemiesRound45:
	.byte $02					;- D 0 - - - 0x0198A0 06:B890: 02

	.byte $40					;- D 0 - - - 0x0198A1 06:B891: 40
	.byte $80					;- D 0 - - - 0x0198A2 06:B892: 80
	.byte $02					;- D 0 - - - 0x0198A3 06:B893: 02
	.byte anCarryHeliR_ID					;- D 0 - - - 0x0198A4 06:B894: 4C
	.byte ENEMY_CARRYHELI					;- D 0 - - - 0x0198A5 06:B895: 09
	.byte DIR_RIGHT					;- D 0 - - - 0x0198A6 06:B896: 02

	.byte $80					;- D 0 - - - 0x0198A7 06:B897: 80
	.byte $80					;- D 0 - - - 0x0198A8 06:B898: 80
	.byte $03					;- D 0 - - - 0x0198A9 06:B899: 03
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x0198AA 06:B89A: 49
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x0198AB 06:B89B: 08
	.byte DIR_LEFT					;- D 0 - - - 0x0198AC 06:B89C: 01

EnemiesRound46:
	.byte $06					;- D 0 - - - 0x0198AD 06:B89D: 06

	.byte $30					;- D 0 - - - 0x0198AE 06:B89E: 30
	.byte $80					;- D 0 - - - 0x0198AF 06:B89F: 80
	.byte $02					;- D 0 - - - 0x0198B0 06:B8A0: 02
	.byte anManticharR_ID					;- D 0 - - - 0x0198B1 06:B8A1: 4F
	.byte ENEMY_MANTICHAR					;- D 0 - - - 0x0198B2 06:B8A2: 0C
	.byte DIR_RIGHT					;- D 0 - - - 0x0198B3 06:B8A3: 02

	.byte $38					;- D 0 - - - 0x0198B4 06:B8A4: 38
	.byte $D8					;- D 0 - - - 0x0198B5 06:B8A5: D8
	.byte $03					;- D 0 - - - 0x0198B6 06:B8A6: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x0198B7 06:B8A7: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0198B8 06:B8A8: 02
	.byte DIR_LEFT					;- D 0 - - - 0x0198B9 06:B8A9: 01

	.byte $60					;- D 0 - - - 0x0198BA 06:B8AA: 60
	.byte $30					;- D 0 - - - 0x0198BB 06:B8AB: 30
	.byte $03					;- D 0 - - - 0x0198BC 06:B8AC: 03
	.byte anBanebouR_ID					;- D 0 - - - 0x0198BD 06:B8AD: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0198BE 06:B8AE: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x0198BF 06:B8AF: 02

	.byte $60					;- D 0 - - - 0x0198C0 06:B8B0: 60
	.byte $A0					;- D 0 - - - 0x0198C1 06:B8B1: A0
	.byte $03					;- D 0 - - - 0x0198C2 06:B8B2: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x0198C3 06:B8B3: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0198C4 06:B8B4: 02
	.byte DIR_LEFT					;- D 0 - - - 0x0198C5 06:B8B5: 01

	.byte $B0					;- D 0 - - - 0x0198C6 06:B8B6: B0
	.byte $60					;- D 0 - - - 0x0198C7 06:B8B7: 60
	.byte $03					;- D 0 - - - 0x0198C8 06:B8B8: 03
	.byte anBanebouR_ID					;- D 0 - - - 0x0198C9 06:B8B9: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0198CA 06:B8BA: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x0198CB 06:B8BB: 02

	.byte $C8					;- D 0 - - - 0x0198CC 06:B8BC: C8
	.byte $80					;- D 0 - - - 0x0198CD 06:B8BD: 80
	.byte $03					;- D 0 - - - 0x0198CE 06:B8BE: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x0198CF 06:B8BF: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0198D0 06:B8C0: 02
	.byte DIR_LEFT					;- D 0 - - - 0x0198D1 06:B8C1: 01

EnemiesRound47:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x0199C8 06:B9B8: 07
.else
	.byte $06					;- D 0 - - - 0x0198D2 06:B8C2: 06
.endif

	.byte $48					;- D 0 - - - 0x0198D3 06:B8C3: 48
	.byte $A8					;- D 0 - - - 0x0198D4 06:B8C4: A8
	.byte $02					;- D 0 - - - 0x0198D5 06:B8C5: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x0198D6 06:B8C6: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x0198D7 06:B8C7: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x0198D8 06:B8C8: 02

	.byte $68					;- D 0 - - - 0x0198D9 06:B8C9: 68
	.byte $88					;- D 0 - - - 0x0198DA 06:B8CA: 88
	.byte $02					;- D 0 - - - 0x0198DB 06:B8CB: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x0198DC 06:B8CC: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x0198DD 06:B8CD: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x0198DE 06:B8CE: 02

	.byte $68					;- D 0 - - - 0x0198DF 06:B8CF: 68
	.byte $A8					;- D 0 - - - 0x0198E0 06:B8D0: A8
	.byte $02					;- D 0 - - - 0x0198E1 06:B8D1: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x0198E2 06:B8D2: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x0198E3 06:B8D3: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x0198E4 06:B8D4: 02

	.byte $68					;- D 0 - - - 0x0198E5 06:B8D5: 68
	.byte $C8					;- D 0 - - - 0x0198E6 06:B8D6: C8
	.byte $02					;- D 0 - - - 0x0198E7 06:B8D7: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x0198E8 06:B8D8: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x0198E9 06:B8D9: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x0198EA 06:B8DA: 02

.ifdef JP_ENEMY_PLACEMENT
	.byte $88					;- - - - - - 0x0199E1 06:B9D1: 88
	.byte $88					;- - - - - - 0x0199E2 06:B9D2: 88
	.byte $02					;- - - - - - 0x0199E3 06:B9D3: 02
	.byte anChuckerL_ID					;- - - - - - 0x0199E4 06:B9D4: BF
	.byte ENEMY_CHUCKER					;- - - - - - 0x0199E5 06:B9D5: 17
	.byte DIR_RIGHT					;- - - - - - 0x0199E6 06:B9D6: 02
.endif

	.byte $88					;- D 0 - - - 0x0198EB 06:B8DB: 88
	.byte $A8					;- D 0 - - - 0x0198EC 06:B8DC: A8
	.byte $02					;- D 0 - - - 0x0198ED 06:B8DD: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x0198EE 06:B8DE: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x0198EF 06:B8DF: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x0198F0 06:B8E0: 02

	.byte $88					;- D 0 - - - 0x0198F1 06:B8E1: 88
	.byte $C8					;- D 0 - - - 0x0198F2 06:B8E2: C8
	.byte $03					;- D 0 - - - 0x0198F3 06:B8E3: 03
	.byte anChuckerL_ID					;- D 0 - - - 0x0198F4 06:B8E4: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x0198F5 06:B8E5: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x0198F6 06:B8E6: 02

EnemiesRound48:
	.byte $06					;- D 0 - - - 0x0198F7 06:B8E7: 06

	.byte $30					;- D 0 - - - 0x0198F8 06:B8E8: 30
	.byte $50					;- D 0 - - - 0x0198F9 06:B8E9: 50
	.byte $02					;- D 0 - - - 0x0198FA 06:B8EA: 02
	.byte anBanebouR_ID					;- D 0 - - - 0x0198FB 06:B8EB: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x0198FC 06:B8EC: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x0198FD 06:B8ED: 02

	.byte $30					;- D 0 - - - 0x0198FE 06:B8EE: 30
	.byte $B0					;- D 0 - - - 0x0198FF 06:B8EF: B0
	.byte $02					;- D 0 - - - 0x019900 06:B8F0: 02
	.byte anBanebouL_ID					;- D 0 - - - 0x019901 06:B8F1: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019902 06:B8F2: 02
	.byte DIR_LEFT					;- D 0 - - - 0x019903 06:B8F3: 01

	.byte $58					;- D 0 - - - 0x019904 06:B8F4: 58
	.byte $28					;- D 0 - - - 0x019905 06:B8F5: 28
	.byte $02					;- D 0 - - - 0x019906 06:B8F6: 02
	.byte anBanebouL_ID					;- D 0 - - - 0x019907 06:B8F7: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019908 06:B8F8: 02
	.byte DIR_LEFT					;- D 0 - - - 0x019909 06:B8F9: 01

	.byte $58					;- D 0 - - - 0x01990A 06:B8FA: 58
	.byte $D8					;- D 0 - - - 0x01990B 06:B8FB: D8
	.byte $03					;- D 0 - - - 0x01990C 06:B8FC: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x01990D 06:B8FD: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x01990E 06:B8FE: 02
	.byte DIR_LEFT					;- D 0 - - - 0x01990F 06:B8FF: 01

	.byte $30					;- D 0 - - - 0x019910 06:B900: 30
	.byte $60					;- D 0 - - - 0x019911 06:B901: 60
	.byte $01					;- D 0 - - - 0x019912 06:B902: 01
	.byte anSpikeBall_ID					;- D 0 - - - 0x019913 06:B903: D6
	.byte ENEMY_SPIKEBALL					;- D 0 - - - 0x019914 06:B904: 21
	.byte DIR_LEFT					;- D 0 - - - 0x019915 06:B905: 01

	.byte $30					;- D 0 - - - 0x019916 06:B906: 30
	.byte $A0					;- D 0 - - - 0x019917 06:B907: A0
	.byte $01					;- D 0 - - - 0x019918 06:B908: 01
	.byte anSpikeBall_ID					;- D 0 - - - 0x019919 06:B909: D6
	.byte ENEMY_SPIKEBALL					;- D 0 - - - 0x01991A 06:B90A: 21
	.byte DIR_LEFT					;- D 0 - - - 0x01991B 06:B90B: 01

EnemiesRound49:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x019A18 06:BA08: 07
.else
	.byte $05					;- D 0 - - - 0x01991C 06:B90C: 05
.endif

	.byte $60					;- D 0 - - - 0x01991D 06:B90D: 60
	.byte $50					;- D 0 - - - 0x01991E 06:B90E: 50
	.byte $02					;- D 0 - - - 0x01991F 06:B90F: 02
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x019920 06:B910: 49
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019921 06:B911: 08
	.byte DIR_LEFT					;- D 0 - - - 0x019922 06:B912: 01

	.byte $60					;- D 0 - - - 0x019923 06:B913: 60
	.byte $B0					;- D 0 - - - 0x019924 06:B914: B0
	.byte $02					;- D 0 - - - 0x019925 06:B915: 02
	.byte anHeitaiKunR_ID					;- D 0 - - - 0x019926 06:B916: 4A
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019927 06:B917: 08
	.byte DIR_RIGHT					;- D 0 - - - 0x019928 06:B918: 02

	.byte $90					;- D 0 - - - 0x019929 06:B919: 90
	.byte $50					;- D 0 - - - 0x01992A 06:B91A: 50
	.byte $02					;- D 0 - - - 0x01992B 06:B91B: 02
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x01992C 06:B91C: 49
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x01992D 06:B91D: 08
	.byte DIR_LEFT					;- D 0 - - - 0x01992E 06:B91E: 01

	.byte $90					;- D 0 - - - 0x01992F 06:B91F: 90
	.byte $B0					;- D 0 - - - 0x019930 06:B920: B0
	.byte $02					;- D 0 - - - 0x019931 06:B921: 02
	.byte anHeitaiKunR_ID					;- D 0 - - - 0x019932 06:B922: 4A
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019933 06:B923: 08
	.byte DIR_RIGHT					;- D 0 - - - 0x019934 06:B924: 02

	.byte $80					;- D 0 - - - 0x019935 06:B925: 80
	.byte $80					;- D 0 - - - 0x019936 06:B926: 80
	.byte $03					;- D 0 - - - 0x019937 06:B927: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x019938 06:B928: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019939 06:B929: 02
	.byte DIR_LEFT					;- D 0 - - - 0x01993A 06:B92A: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $90					;- - - - - - 0x019A37 06:BA27: 90
	.byte $90					;- - - - - - 0x019A38 06:BA28: 90
	.byte $03					;- - - - - - 0x019A39 06:BA29: 03
	.byte anBanebouL_ID					;- - - - - - 0x019A3A 06:BA2A: 43
	.byte ENEMY_BANEBOU					;- - - - - - 0x019A3B 06:BA2B: 02
	.byte DIR_LEFT					;- - - - - - 0x019A3C 06:BA2C: 01

	.byte $90					;- - - - - - 0x019A3D 06:BA2D: 90
	.byte $70					;- - - - - - 0x019A3E 06:BA2E: 70
	.byte $03					;- - - - - - 0x019A3F 06:BA2F: 03
	.byte anBanebouR_ID					;- - - - - - 0x019A40 06:BA30: 44
	.byte ENEMY_BANEBOU					;- - - - - - 0x019A41 06:BA31: 02
	.byte DIR_RIGHT					;- - - - - - 0x019A42 06:BA32: 02
.endif

EnemiesRound50:
	;Missile Tractor spawned separately
	.byte $04					;- D 0 - - - 0x01993B 06:B92B: 04

.ifdef JP_ENEMY_PLACEMENT
	.byte $38					;- - - - - - 0x019A44 06:BA34: 38
	.byte $20					;- - - - - - 0x019A45 06:BA35: 20
	.byte $03					;- - - - - - 0x019A46 06:BA36: 03
	.byte anInvader_ID					;- - - - - - 0x019A47 06:BA37: 48
	.byte ENEMY_INVADER					;- - - - - - 0x019A48 06:BA38: 06
	.byte DIR_RIGHT					;- - - - - - 0x019A49 06:BA39: 02

	.byte $38					;- - - - - - 0x019A4A 06:BA3A: 38
	.byte $E0					;- - - - - - 0x019A4B 06:BA3B: E0
	.byte $03					;- - - - - - 0x019A4C 06:BA3C: 03
	.byte anInvader_ID					;- - - - - - 0x019A4D 06:BA3D: 48
	.byte ENEMY_INVADER					;- - - - - - 0x019A4E 06:BA3E: 06
	.byte DIR_LEFT					;- - - - - - 0x019A4F 06:BA3F: 01

	.byte $68					;- - - - - - 0x019A50 06:BA40: 68
	.byte $40					;- - - - - - 0x019A51 06:BA41: 40
	.byte $03					;- - - - - - 0x019A52 06:BA42: 03
	.byte anInvader_ID					;- - - - - - 0x019A53 06:BA43: 48
	.byte ENEMY_INVADER					;- - - - - - 0x019A54 06:BA44: 06
	.byte DIR_LEFT					;- - - - - - 0x019A55 06:BA45: 01

	.byte $68					;- - - - - - 0x019A56 06:BA46: 68
	.byte $C0					;- - - - - - 0x019A57 06:BA47: C0
	.byte $03					;- - - - - - 0x019A58 06:BA48: 03
	.byte anInvader_ID					;- - - - - - 0x019A59 06:BA49: 48
	.byte ENEMY_INVADER					;- - - - - - 0x019A5A 06:BA4A: 06
	.byte DIR_RIGHT					;- - - - - - 0x019A5B 06:BA4B: 02
.else
	.byte $38					;- D 0 - - - 0x01993C 06:B92C: 38
	.byte $20					;- D 0 - - - 0x01993D 06:B92D: 20
	.byte $03					;- D 0 - - - 0x01993E 06:B92E: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x01993F 06:B92F: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019940 06:B930: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019941 06:B931: 02

	.byte $38					;- D 0 - - - 0x019942 06:B932: 38
	.byte $E0					;- D 0 - - - 0x019943 06:B933: E0
	.byte $03					;- D 0 - - - 0x019944 06:B934: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019945 06:B935: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019946 06:B936: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019947 06:B937: 01

	.byte $68					;- D 0 - - - 0x019948 06:B938: 68
	.byte $40					;- D 0 - - - 0x019949 06:B939: 40
	.byte $03					;- D 0 - - - 0x01994A 06:B93A: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x01994B 06:B93B: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x01994C 06:B93C: 01
	.byte DIR_LEFT					;- D 0 - - - 0x01994D 06:B93D: 01

	.byte $68					;- D 0 - - - 0x01994E 06:B93E: 68
	.byte $C0					;- D 0 - - - 0x01994F 06:B93F: C0
	.byte $03					;- D 0 - - - 0x019950 06:B940: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x019951 06:B941: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019952 06:B942: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019953 06:B943: 02
.endif

EnemiesRound51:
	.byte $04					;- D 0 - - - 0x019954 06:B944: 04

	.byte $30					;- D 0 - - - 0x019955 06:B945: 30
	.byte $D8					;- D 0 - - - 0x019956 06:B946: D8
	.byte $02					;- D 0 - - - 0x019957 06:B947: 02
	.byte anInvader_ID					;- D 0 - - - 0x019958 06:B948: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019959 06:B949: 06
	.byte DIR_RIGHT					;- D 0 - - - 0x01995A 06:B94A: 02

	.byte $B0					;- D 0 - - - 0x01995B 06:B94B: B0
	.byte $D8					;- D 0 - - - 0x01995C 06:B94C: D8
	.byte $02					;- D 0 - - - 0x01995D 06:B94D: 02
	.byte anInvader_ID					;- D 0 - - - 0x01995E 06:B94E: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x01995F 06:B94F: 06
	.byte DIR_LEFT					;- D 0 - - - 0x019960 06:B950: 01

	.byte $B0					;- D 0 - - - 0x019961 06:B951: B0
	.byte $98					;- D 0 - - - 0x019962 06:B952: 98
	.byte $02					;- D 0 - - - 0x019963 06:B953: 02
	.byte anInvader_ID					;- D 0 - - - 0x019964 06:B954: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019965 06:B955: 06
	.byte DIR_RIGHT					;- D 0 - - - 0x019966 06:B956: 02

	.byte $B0					;- D 0 - - - 0x019967 06:B957: B0
	.byte $58					;- D 0 - - - 0x019968 06:B958: 58
	.byte $03					;- D 0 - - - 0x019969 06:B959: 03
	.byte anInvader_ID					;- D 0 - - - 0x01996A 06:B95A: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x01996B 06:B95B: 06
	.byte DIR_LEFT					;- D 0 - - - 0x01996C 06:B95C: 01

EnemiesRound52:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x019A75 06:BA65: 07
.else
	.byte $06					;- D 0 - - - 0x01996D 06:B95D: 06
.endif

.ifdef JP_ENEMY_PLACEMENT
	.byte $98					;- - - - - - 0x019A76 06:BA66: 98
	.byte $50					;- - - - - - 0x019A77 06:BA67: 50
	.byte $03					;- - - - - - 0x019A78 06:BA68: 03
	.byte anMonstaL_ID					;- - - - - - 0x019A79 06:BA69: 3E
	.byte ENEMY_MONSTA					;- - - - - - 0x019A7A 06:BA6A: 07
	.byte DIR_LEFT					;- - - - - - 0x019A7B 06:BA6B: 01
.endif

	.byte $78					;- D 0 - - - 0x01996E 06:B95E: 78
	.byte $70					;- D 0 - - - 0x01996F 06:B95F: 70
	.byte $03					;- D 0 - - - 0x019970 06:B960: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019971 06:B961: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019972 06:B962: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019973 06:B963: 01

	.byte $78					;- D 0 - - - 0x019974 06:B964: 78
	.byte $50					;- D 0 - - - 0x019975 06:B965: 50
	.byte $03					;- D 0 - - - 0x019976 06:B966: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019977 06:B967: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019978 06:B968: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019979 06:B969: 01

	.byte $78					;- D 0 - - - 0x01997A 06:B96A: 78
	.byte $B0					;- D 0 - - - 0x01997B 06:B96B: B0
	.byte $03					;- D 0 - - - 0x01997C 06:B96C: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x01997D 06:B96D: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x01997E 06:B96E: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x01997F 06:B96F: 02

	.byte $98					;- D 0 - - - 0x019980 06:B970: 98
	.byte $70					;- D 0 - - - 0x019981 06:B971: 70
	.byte $03					;- D 0 - - - 0x019982 06:B972: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019983 06:B973: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019984 06:B974: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019985 06:B975: 01

	.byte $98					;- D 0 - - - 0x019986 06:B976: 98
	.byte $90					;- D 0 - - - 0x019987 06:B977: 90
	.byte $03					;- D 0 - - - 0x019988 06:B978: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x019989 06:B979: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x01998A 06:B97A: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x01998B 06:B97B: 02

	.byte $B8					;- D 0 - - - 0x01998C 06:B97C: B8
	.byte $80					;- D 0 - - - 0x01998D 06:B97D: 80
	.byte $02					;- D 0 - - - 0x01998E 06:B97E: 02
	.byte anNeedler_ID					;- D 0 - - - 0x01998F 06:B97F: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x019990 06:B980: 05
	.byte DIR_LEFT					;- D 0 - - - 0x019991 06:B981: 01

EnemiesRound53:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x019AA0 06:BA90: 07
.else
	.byte $05					;- D 0 - - - 0x019992 06:B982: 05
.endif

	.byte $50					;- D 0 - - - 0x019993 06:B983: 50
	.byte $80					;- D 0 - - - 0x019994 06:B984: 80
	.byte $02					;- D 0 - - - 0x019995 06:B985: 02
	.byte anFlarion_ID					;- D 0 - - - 0x019996 06:B986: 4D
	.byte ENEMY_FLARION					;- D 0 - - - 0x019997 06:B987: 0A
	.byte DIR_LEFT					;- D 0 - - - 0x019998 06:B988: 01

	.byte $20					;- D 0 - - - 0x019999 06:B989: 20
	.byte $80					;- D 0 - - - 0x01999A 06:B98A: 80
	.byte $03					;- D 0 - - - 0x01999B 06:B98B: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x01999C 06:B98C: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x01999D 06:B98D: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x01999E 06:B98E: 02

	.byte $28					;- D 0 - - - 0x01999F 06:B98F: 28
	.byte $48					;- D 0 - - - 0x0199A0 06:B990: 48
	.byte $03					;- D 0 - - - 0x0199A1 06:B991: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x0199A2 06:B992: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0199A3 06:B993: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x0199A4 06:B994: 02

	.byte $28					;- D 0 - - - 0x0199A5 06:B995: 28
	.byte $B8					;- D 0 - - - 0x0199A6 06:B996: B8
	.byte $03					;- D 0 - - - 0x0199A7 06:B997: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x0199A8 06:B998: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0199A9 06:B999: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0199AA 06:B99A: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $40					;- - - - - - 0x019AB9 06:BAA9: 40
	.byte $68					;- - - - - - 0x019ABA 06:BAAA: 68
	.byte $03					;- - - - - - 0x019ABB 06:BAAB: 03
	.byte anMonstaL_ID					;- - - - - - 0x019ABC 06:BAAC: 3E
	.byte ENEMY_MONSTA					;- - - - - - 0x019ABD 06:BAAD: 07
	.byte DIR_LEFT					;- - - - - - 0x019ABE 06:BAAE: 01

	.byte $40					;- - - - - - 0x019ABF 06:BAAF: 40
	.byte $98					;- - - - - - 0x019AC0 06:BAB0: 98
	.byte $03					;- - - - - - 0x019AC1 06:BAB1: 03
	.byte anMonstaR_ID					;- - - - - - 0x019AC2 06:BAB2: 3F
	.byte ENEMY_MONSTA					;- - - - - - 0x019AC3 06:BAB3: 07
	.byte DIR_RIGHT					;- - - - - - 0x019AC4 06:BAB4: 02
.endif

	.byte $78					;- D 0 - - - 0x0199AB 06:B99B: 78
	.byte $80					;- D 0 - - - 0x0199AC 06:B99C: 80
	.byte $03					;- D 0 - - - 0x0199AD 06:B99D: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x0199AE 06:B99E: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0199AF 06:B99F: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0199B0 06:B9A0: 01

EnemiesRound54:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x019ACB 06:BABB: 07
.else
	.byte $05					;- D 0 - - - 0x0199B1 06:B9A1: 05
.endif

	.byte $60					;- D 0 - - - 0x0199B2 06:B9A2: 60
	.byte $80					;- D 0 - - - 0x0199B3 06:B9A3: 80
	.byte $02					;- D 0 - - - 0x0199B4 06:B9A4: 02
	.byte anManticharR_ID					;- D 0 - - - 0x0199B5 06:B9A5: 4F
	.byte ENEMY_MANTICHAR					;- D 0 - - - 0x0199B6 06:B9A6: 0C
	.byte DIR_RIGHT					;- D 0 - - - 0x0199B7 06:B9A7: 02

	.byte $A0					;- D 0 - - - 0x0199B8 06:B9A8: A0
	.byte $20					;- D 0 - - - 0x0199B9 06:B9A9: 20
	.byte $03					;- D 0 - - - 0x0199BA 06:B9AA: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x0199BB 06:B9AB: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0199BC 06:B9AC: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0199BD 06:B9AD: 01

	.byte $A0					;- D 0 - - - 0x0199BE 06:B9AE: A0
	.byte $D0					;- D 0 - - - 0x0199BF 06:B9AF: D0
	.byte $03					;- D 0 - - - 0x0199C0 06:B9B0: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x0199C1 06:B9B1: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0199C2 06:B9B2: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0199C3 06:B9B3: 01

	.byte $50					;- D 0 - - - 0x0199C4 06:B9B4: 50
	.byte $30					;- D 0 - - - 0x0199C5 06:B9B5: 30
	.byte $03					;- D 0 - - - 0x0199C6 06:B9B6: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x0199C7 06:B9B7: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0199C8 06:B9B8: 07
	.byte DIR_LEFT					;- D 0 - - - 0x0199C9 06:B9B9: 01

	.byte $50					;- D 0 - - - 0x0199CA 06:B9BA: 50
	.byte $D0					;- D 0 - - - 0x0199CB 06:B9BB: D0
	.byte $03					;- D 0 - - - 0x0199CC 06:B9BC: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x0199CD 06:B9BD: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x0199CE 06:B9BE: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x0199CF 06:B9BF: 02

.ifdef JP_ENEMY_PLACEMENT
	.byte $90					;- - - - - - 0x019AEA 06:BADA: 90
	.byte $60					;- - - - - - 0x019AEB 06:BADB: 60
	.byte $03					;- - - - - - 0x019AEC 06:BADC: 03
	.byte anMonstaL_ID					;- - - - - - 0x019AED 06:BADD: 3E
	.byte ENEMY_MONSTA					;- - - - - - 0x019AEE 06:BADE: 07
	.byte DIR_LEFT					;- - - - - - 0x019AEF 06:BADF: 01

	.byte $90					;- - - - - - 0x019AF0 06:BAE0: 90
	.byte $A0					;- - - - - - 0x019AF1 06:BAE1: A0
	.byte $03					;- - - - - - 0x019AF2 06:BAE2: 03
	.byte anMonstaR_ID					;- - - - - - 0x019AF3 06:BAE3: 3F
	.byte ENEMY_MONSTA					;- - - - - - 0x019AF4 06:BAE4: 07
	.byte DIR_RIGHT					;- - - - - - 0x019AF5 06:BAE5: 02
.endif

EnemiesRound55:
	.byte $05					;- D 0 - - - 0x0199D0 06:B9C0: 05

	.byte $C0					;- D 0 - - - 0x0199D1 06:B9C1: C0
	.byte $80					;- D 0 - - - 0x0199D2 06:B9C2: 80
	.byte $02					;- D 0 - - - 0x0199D3 06:B9C3: 02
	.byte anNeedler_ID					;- D 0 - - - 0x0199D4 06:B9C4: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x0199D5 06:B9C5: 05
	.byte DIR_LEFT					;- D 0 - - - 0x0199D6 06:B9C6: 01

	.byte $C0					;- D 0 - - - 0x0199D7 06:B9C7: C0
	.byte $CC					;- D 0 - - - 0x0199D8 06:B9C8: CC
	.byte $02					;- D 0 - - - 0x0199D9 06:B9C9: 02
	.byte anNeedler_ID					;- D 0 - - - 0x0199DA 06:B9CA: 40
	.byte ENEMY_NEEDLER					;- D 0 - - - 0x0199DB 06:B9CB: 05
	.byte DIR_LEFT					;- D 0 - - - 0x0199DC 06:B9CC: 01

	.byte $20					;- D 0 - - - 0x0199DD 06:B9CD: 20
	.byte $38					;- D 0 - - - 0x0199DE 06:B9CE: 38
	.byte $03					;- D 0 - - - 0x0199DF 06:B9CF: 03
	.byte anPulpul_ID					;- D 0 - - - 0x0199E0 06:B9D0: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x0199E1 06:B9D1: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x0199E2 06:B9D2: 02

	.byte $58					;- D 0 - - - 0x0199E3 06:B9D3: 58
	.byte $58					;- D 0 - - - 0x0199E4 06:B9D4: 58
	.byte $03					;- D 0 - - - 0x0199E5 06:B9D5: 03
	.byte anPulpul_ID					;- D 0 - - - 0x0199E6 06:B9D6: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x0199E7 06:B9D7: 04
	.byte DIR_LEFT					;- D 0 - - - 0x0199E8 06:B9D8: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $58					;- - - - - - 0x019B0F 06:BAFF: 58
	.byte $C0					;- - - - - - 0x019B10 06:BB00: C0
	.byte $03					;- - - - - - 0x019B11 06:BB01: 03
	.byte anPulpul_ID					;- - - - - - 0x019B12 06:BB02: 47
	.byte ENEMY_PULPUL					;- - - - - - 0x019B13 06:BB03: 04
	.byte DIR_RIGHT					;- - - - - - 0x019B14 06:BB04: 02
.else
	.byte $58					;- D 0 - - - 0x0199E9 06:B9D9: 58
	.byte $C8					;- D 0 - - - 0x0199EA 06:B9DA: C8
	.byte $03					;- D 0 - - - 0x0199EB 06:B9DB: 03
	.byte anPulpul_ID					;- D 0 - - - 0x0199EC 06:B9DC: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x0199ED 06:B9DD: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x0199EE 06:B9DE: 02
.endif

EnemiesRound56:
	.byte $05					;- D 0 - - - 0x0199EF 06:B9DF: 05

	.byte $58					;- D 0 - - - 0x0199F0 06:B9E0: 58
	.byte $28					;- D 0 - - - 0x0199F1 06:B9E1: 28
	.byte $02					;- D 0 - - - 0x0199F2 06:B9E2: 02
	.byte anManticharR_ID					;- D 0 - - - 0x0199F3 06:B9E3: 4F
	.byte ENEMY_MANTICHAR					;- D 0 - - - 0x0199F4 06:B9E4: 0C
	.byte DIR_RIGHT					;- D 0 - - - 0x0199F5 06:B9E5: 02

	.byte $98					;- D 0 - - - 0x0199F6 06:B9E6: 98
	.byte $D8					;- D 0 - - - 0x0199F7 06:B9E7: D8
	.byte $02					;- D 0 - - - 0x0199F8 06:B9E8: 02
	.byte anManticharR_ID					;- D 0 - - - 0x0199F9 06:B9E9: 4F
	.byte ENEMY_MANTICHAR					;- D 0 - - - 0x0199FA 06:B9EA: 0C
	.byte DIR_RIGHT					;- D 0 - - - 0x0199FB 06:B9EB: 02

	.byte $98					;- D 0 - - - 0x0199FC 06:B9EC: 98
	.byte $28					;- D 0 - - - 0x0199FD 06:B9ED: 28
	.byte $02					;- D 0 - - - 0x0199FE 06:B9EE: 02
	.byte anManticharR_ID					;- D 0 - - - 0x0199FF 06:B9EF: 4F
	.byte ENEMY_MANTICHAR					;- D 0 - - - 0x019A00 06:B9F0: 0C
	.byte DIR_RIGHT					;- D 0 - - - 0x019A01 06:B9F1: 02

	.byte $58					;- D 0 - - - 0x019A02 06:B9F2: 58
	.byte $D8					;- D 0 - - - 0x019A03 06:B9F3: D8
	.byte $02					;- D 0 - - - 0x019A04 06:B9F4: 02
	.byte anManticharR_ID					;- D 0 - - - 0x019A05 06:B9F5: 4F
	.byte ENEMY_MANTICHAR					;- D 0 - - - 0x019A06 06:B9F6: 0C
	.byte DIR_RIGHT					;- D 0 - - - 0x019A07 06:B9F7: 02

	.byte $20					;- D 0 - - - 0x019A08 06:B9F8: 20
	.byte $80					;- D 0 - - - 0x019A09 06:B9F9: 80
	.byte $03					;- D 0 - - - 0x019A0A 06:B9FA: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019A0B 06:B9FB: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019A0C 06:B9FC: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x019A0D 06:B9FD: 02

EnemiesRound57:
	.byte $05					;- D 0 - - - 0x019A0E 06:B9FE: 05

	.byte $78					;- D 0 - - - 0x019A0F 06:B9FF: 78
	.byte $74					;- D 0 - - - 0x019A10 06:BA00: 74
	.byte $03					;- D 0 - - - 0x019A11 06:BA01: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019A12 06:BA02: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019A13 06:BA03: 04
	.byte DIR_LEFT					;- D 0 - - - 0x019A14 06:BA04: 01

	.byte $78					;- D 0 - - - 0x019A15 06:BA05: 78
	.byte $8C					;- D 0 - - - 0x019A16 06:BA06: 8C
	.byte $03					;- D 0 - - - 0x019A17 06:BA07: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019A18 06:BA08: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019A19 06:BA09: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x019A1A 06:BA0A: 02

	.byte $90					;- D 0 - - - 0x019A1B 06:BA0B: 90
	.byte $74					;- D 0 - - - 0x019A1C 06:BA0C: 74
	.byte $03					;- D 0 - - - 0x019A1D 06:BA0D: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019A1E 06:BA0E: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019A1F 06:BA0F: 04
	.byte DIR_LEFT					;- D 0 - - - 0x019A20 06:BA10: 01

	.byte $90					;- D 0 - - - 0x019A21 06:BA11: 90
	.byte $8C					;- D 0 - - - 0x019A22 06:BA12: 8C
	.byte $03					;- D 0 - - - 0x019A23 06:BA13: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019A24 06:BA14: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019A25 06:BA15: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x019A26 06:BA16: 02

	.byte $38					;- D 0 - - - 0x019A27 06:BA17: 38
	.byte $80					;- D 0 - - - 0x019A28 06:BA18: 80
	.byte $02					;- D 0 - - - 0x019A29 06:BA19: 02
	.byte anFlarion_ID					;- D 0 - - - 0x019A2A 06:BA1A: 4D
	.byte ENEMY_FLARION					;- D 0 - - - 0x019A2B 06:BA1B: 0A
	.byte DIR_LEFT					;- D 0 - - - 0x019A2C 06:BA1C: 01

EnemiesRound58:
	.byte $05					;- D 0 - - - 0x019A2D 06:BA1D: 05

	.byte $68					;- D 0 - - - 0x019A2E 06:BA1E: 68
	.byte $80					;- D 0 - - - 0x019A2F 06:BA1F: 80
	.byte $02					;- D 0 - - - 0x019A30 06:BA20: 02
	.byte anSnaggerL_ID					;- D 0 - - - 0x019A31 06:BA21: 41
	.byte ENEMY_SNAGGER					;- D 0 - - - 0x019A32 06:BA22: 0B
	.byte DIR_LEFT					;- D 0 - - - 0x019A33 06:BA23: 01

	.byte $50					;- D 0 - - - 0x019A34 06:BA24: 50
	.byte $20					;- D 0 - - - 0x019A35 06:BA25: 20
	.byte $03					;- D 0 - - - 0x019A36 06:BA26: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019A37 06:BA27: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019A38 06:BA28: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019A39 06:BA29: 01

	.byte $50					;- D 0 - - - 0x019A3A 06:BA2A: 50
	.byte $E0					;- D 0 - - - 0x019A3B 06:BA2B: E0
	.byte $03					;- D 0 - - - 0x019A3C 06:BA2C: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x019A3D 06:BA2D: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019A3E 06:BA2E: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x019A3F 06:BA2F: 02

	.byte $90					;- D 0 - - - 0x019A40 06:BA30: 90
	.byte $20					;- D 0 - - - 0x019A41 06:BA31: 20
	.byte $03					;- D 0 - - - 0x019A42 06:BA32: 03
	.byte anMonstaL_ID					;- D 0 - - - 0x019A43 06:BA33: 3E
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019A44 06:BA34: 07
	.byte DIR_LEFT					;- D 0 - - - 0x019A45 06:BA35: 01

	.byte $90					;- D 0 - - - 0x019A46 06:BA36: 90
	.byte $E0					;- D 0 - - - 0x019A47 06:BA37: E0
	.byte $03					;- D 0 - - - 0x019A48 06:BA38: 03
	.byte anMonstaR_ID					;- D 0 - - - 0x019A49 06:BA39: 3F
	.byte ENEMY_MONSTA					;- D 0 - - - 0x019A4A 06:BA3A: 07
	.byte DIR_RIGHT					;- D 0 - - - 0x019A4B 06:BA3B: 02

EnemiesRound59:
.ifdef JP_ENEMY_PLACEMENT
	.byte $04					;- - - - - - 0x019B72 06:BB62: 04
.else
	.byte $03					;- D 0 - - - 0x019A4C 06:BA3C: 03
.endif

	.byte $38					;- D 0 - - - 0x019A4D 06:BA3D: 38
	.byte $90					;- D 0 - - - 0x019A4E 06:BA3E: 90
	.byte $02					;- D 0 - - - 0x019A4F 06:BA3F: 02
	.byte anRoboZenL_ID					;- D 0 - - - 0x019A50 06:BA40: 50
	.byte ENEMY_ROBOZEN					;- D 0 - - - 0x019A51 06:BA41: 0D
	.byte DIR_LEFT					;- D 0 - - - 0x019A52 06:BA42: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $78					;- - - - - - 0x019B79 06:BB69: 78
	.byte $98					;- - - - - - 0x019B7A 06:BB6A: 98
	.byte $03					;- - - - - - 0x019B7B 06:BB6B: 03
	.byte anInvader_ID					;- - - - - - 0x019B7C 06:BB6C: 48
	.byte ENEMY_INVADER					;- - - - - - 0x019B7D 06:BB6D: 06
	.byte DIR_LEFT					;- - - - - - 0x019B7E 06:BB6E: 01
.endif

	.byte $88					;- D 0 - - - 0x019A53 06:BA43: 88
	.byte $50					;- D 0 - - - 0x019A54 06:BA44: 50
	.byte $03					;- D 0 - - - 0x019A55 06:BA45: 03
	.byte anInvader_ID					;- D 0 - - - 0x019A56 06:BA46: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019A57 06:BA47: 06
	.byte DIR_RIGHT					;- D 0 - - - 0x019A58 06:BA48: 02

	.byte $88					;- D 0 - - - 0x019A59 06:BA49: 88
	.byte $B8					;- D 0 - - - 0x019A5A 06:BA4A: B8
	.byte $03					;- D 0 - - - 0x019A5B 06:BA4B: 03
	.byte anInvader_ID					;- D 0 - - - 0x019A5C 06:BA4C: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019A5D 06:BA4D: 06
	.byte DIR_LEFT					;- D 0 - - - 0x019A5E 06:BA4E: 01

EnemiesRound60:
	.byte $01					;- D 0 - - - 0x019A5F 06:BA4F: 01

	.byte $80					;- D 0 - - - 0x019A60 06:BA50: 80
	.byte $80					;- D 0 - - - 0x019A61 06:BA51: 80
	.byte $02					;- D 0 - - - 0x019A62 06:BA52: 02
	.byte anRoc_ID					;- D 0 - - - 0x019A63 06:BA53: E4
	.byte ENEMY_ROC					;- D 0 - - - 0x019A64 06:BA54: 1B
	.byte DIR_LEFT|DIR_INSTAPLACE					;- D 0 - - - 0x019A65 06:BA55: 81

EnemiesRound61:
.ifdef JP_ENEMY_PLACEMENT
	.byte $04					;- - - - - - 0x019B92 06:BB82: 04
.else
	.byte $03					;- D 0 - - - 0x019A66 06:BA56: 03
.endif

	.byte $37					;- D 0 - - - 0x019A67 06:BA57: 37
	.byte $80					;- D 0 - - - 0x019A68 06:BA58: 80
	.byte $02					;- D 0 - - - 0x019A69 06:BA59: 02
	.byte anRoboZenL_ID					;- D 0 - - - 0x019A6A 06:BA5A: 50
	.byte ENEMY_ROBOZEN					;- D 0 - - - 0x019A6B 06:BA5B: 0D
	.byte DIR_LEFT					;- D 0 - - - 0x019A6C 06:BA5C: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $70					;- - - - - - 0x019B99 06:BB89: 70
	.byte $C0					;- - - - - - 0x019B9A 06:BB8A: C0
	.byte $03					;- - - - - - 0x019B9B 06:BB8B: 03
	.byte anPulpul_ID					;- - - - - - 0x019B9C 06:BB8C: 47
	.byte ENEMY_PULPUL					;- - - - - - 0x019B9D 06:BB8D: 04
	.byte DIR_RIGHT					;- - - - - - 0x019B9E 06:BB8E: 02
.endif

	.byte $C0					;- D 0 - - - 0x019A6D 06:BA5D: C0
	.byte $58					;- D 0 - - - 0x019A6E 06:BA5E: 58
	.byte $03					;- D 0 - - - 0x019A6F 06:BA5F: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019A70 06:BA60: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019A71 06:BA61: 04
	.byte DIR_LEFT					;- D 0 - - - 0x019A72 06:BA62: 01

	.byte $C0					;- D 0 - - - 0x019A73 06:BA63: C0
	.byte $E0					;- D 0 - - - 0x019A74 06:BA64: E0
	.byte $03					;- D 0 - - - 0x019A75 06:BA65: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019A76 06:BA66: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019A77 06:BA67: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x019A78 06:BA68: 02

EnemiesRound62:
	.byte $07					;- D 0 - - - 0x019A79 06:BA69: 07

	.byte $50					;- D 0 - - - 0x019A7A 06:BA6A: 50
	.byte $28					;- D 0 - - - 0x019A7B 06:BA6B: 28
	.byte $02					;- D 0 - - - 0x019A7C 06:BA6C: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x019A7D 06:BA6D: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019A7E 06:BA6E: 03
	.byte DIR_LEFT					;- D 0 - - - 0x019A7F 06:BA6F: 01

	.byte $48					;- D 0 - - - 0x019A80 06:BA70: 48
	.byte $A8					;- D 0 - - - 0x019A81 06:BA71: A8
	.byte $02					;- D 0 - - - 0x019A82 06:BA72: 02
	.byte anBlobbyR_ID					;- D 0 - - - 0x019A83 06:BA73: 46
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019A84 06:BA74: 03
	.byte DIR_RIGHT					;- D 0 - - - 0x019A85 06:BA75: 02

	.byte $58					;- D 0 - - - 0x019A86 06:BA76: 58
	.byte $E8					;- D 0 - - - 0x019A87 06:BA77: E8
	.byte $02					;- D 0 - - - 0x019A88 06:BA78: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x019A89 06:BA79: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019A8A 06:BA7A: 03
	.byte DIR_LEFT					;- D 0 - - - 0x019A8B 06:BA7B: 01

	.byte $A8					;- D 0 - - - 0x019A8C 06:BA7C: A8
	.byte $E8					;- D 0 - - - 0x019A8D 06:BA7D: E8
	.byte $02					;- D 0 - - - 0x019A8E 06:BA7E: 02
	.byte anBlobbyR_ID					;- D 0 - - - 0x019A8F 06:BA7F: 46
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019A90 06:BA80: 03
	.byte DIR_RIGHT					;- D 0 - - - 0x019A91 06:BA81: 02

	.byte $88					;- D 0 - - - 0x019A92 06:BA82: 88
	.byte $38					;- D 0 - - - 0x019A93 06:BA83: 38
	.byte $02					;- D 0 - - - 0x019A94 06:BA84: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x019A95 06:BA85: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019A96 06:BA86: 03
	.byte DIR_LEFT					;- D 0 - - - 0x019A97 06:BA87: 01

	.byte $78					;- D 0 - - - 0x019A98 06:BA88: 78
	.byte $80					;- D 0 - - - 0x019A99 06:BA89: 80
	.byte $02					;- D 0 - - - 0x019A9A 06:BA8A: 02
	.byte anBlobbyL_ID					;- D 0 - - - 0x019A9B 06:BA8B: 45
	.byte ENEMY_BLOBBY					;- D 0 - - - 0x019A9C 06:BA8C: 03
	.byte DIR_LEFT					;- D 0 - - - 0x019A9D 06:BA8D: 01

	.byte $38					;- D 0 - - - 0x019A9E 06:BA8E: 38
	.byte $C0					;- D 0 - - - 0x019A9F 06:BA8F: C0
	.byte $03					;- D 0 - - - 0x019AA0 06:BA90: 03
	.byte anPulpul_ID					;- D 0 - - - 0x019AA1 06:BA91: 47
	.byte ENEMY_PULPUL					;- D 0 - - - 0x019AA2 06:BA92: 04
	.byte DIR_RIGHT					;- D 0 - - - 0x019AA3 06:BA93: 02

EnemiesRound63:
	.byte $07					;- D 0 - - - 0x019AA4 06:BA94: 07

	.byte $30					;- D 0 - - - 0x019AA5 06:BA95: 30
	.byte $50					;- D 0 - - - 0x019AA6 06:BA96: 50
	.byte $02					;- D 0 - - - 0x019AA7 06:BA97: 02
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019AA8 06:BA98: 6E
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019AA9 06:BA99: 24
	.byte DIR_LEFT					;- D 0 - - - 0x019AAA 06:BA9A: 01

	.byte $30					;- D 0 - - - 0x019AAB 06:BA9B: 30
	.byte $80					;- D 0 - - - 0x019AAC 06:BA9C: 80
	.byte $02					;- D 0 - - - 0x019AAD 06:BA9D: 02
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019AAE 06:BA9E: 6E
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019AAF 06:BA9F: 24
	.byte DIR_LEFT					;- D 0 - - - 0x019AB0 06:BAA0: 01

	.byte $30					;- D 0 - - - 0x019AB1 06:BAA1: 30
	.byte $B0					;- D 0 - - - 0x019AB2 06:BAA2: B0
	.byte $02					;- D 0 - - - 0x019AB3 06:BAA3: 02
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019AB4 06:BAA4: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019AB5 06:BAA5: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019AB6 06:BAA6: 02

	.byte $68					;- D 0 - - - 0x019AB7 06:BAA7: 68
	.byte $20					;- D 0 - - - 0x019AB8 06:BAA8: 20
	.byte $02					;- D 0 - - - 0x019AB9 06:BAA9: 02
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019ABA 06:BAAA: 6E
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019ABB 06:BAAB: 24
	.byte DIR_LEFT					;- D 0 - - - 0x019ABC 06:BAAC: 01

	.byte $68					;- D 0 - - - 0x019ABD 06:BAAD: 68
	.byte $E0					;- D 0 - - - 0x019ABE 06:BAAE: E0
	.byte $02					;- D 0 - - - 0x019ABF 06:BAAF: 02
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019AC0 06:BAB0: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019AC1 06:BAB1: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019AC2 06:BAB2: 02

	.byte $98					;- D 0 - - - 0x019AC3 06:BAB3: 98
	.byte $58					;- D 0 - - - 0x019AC4 06:BAB4: 58
	.byte $03					;- D 0 - - - 0x019AC5 06:BAB5: 03
	.byte anInvader_ID					;- D 0 - - - 0x019AC6 06:BAB6: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019AC7 06:BAB7: 06
	.byte DIR_RIGHT					;- D 0 - - - 0x019AC8 06:BAB8: 02

	.byte $98					;- D 0 - - - 0x019AC9 06:BAB9: 98
	.byte $A8					;- D 0 - - - 0x019ACA 06:BABA: A8
	.byte $03					;- D 0 - - - 0x019ACB 06:BABB: 03
	.byte anInvader_ID					;- D 0 - - - 0x019ACC 06:BABC: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019ACD 06:BABD: 06
	.byte DIR_LEFT					;- D 0 - - - 0x019ACE 06:BABE: 01

EnemiesRound64:
	.byte $05					;- D 0 - - - 0x019ACF 06:BABF: 05

	.byte $20					;- D 0 - - - 0x019AD0 06:BAC0: 20
	.byte $60					;- D 0 - - - 0x019AD1 06:BAC1: 60
	.byte $03					;- D 0 - - - 0x019AD2 06:BAC2: 03
	.byte anInvader_ID					;- D 0 - - - 0x019AD3 06:BAC3: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019AD4 06:BAC4: 06
	.byte DIR_RIGHT					;- D 0 - - - 0x019AD5 06:BAC5: 02

	.byte $20					;- D 0 - - - 0x019AD6 06:BAC6: 20
	.byte $A0					;- D 0 - - - 0x019AD7 06:BAC7: A0
	.byte $03					;- D 0 - - - 0x019AD8 06:BAC8: 03
	.byte anInvader_ID					;- D 0 - - - 0x019AD9 06:BAC9: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019ADA 06:BACA: 06
	.byte DIR_LEFT					;- D 0 - - - 0x019ADB 06:BACB: 01

	.byte $38					;- D 0 - - - 0x019ADC 06:BACC: 38
	.byte $68					;- D 0 - - - 0x019ADD 06:BACD: 68
	.byte $03					;- D 0 - - - 0x019ADE 06:BACE: 03
	.byte anInvader_ID					;- D 0 - - - 0x019ADF 06:BACF: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019AE0 06:BAD0: 06
	.byte DIR_LEFT					;- D 0 - - - 0x019AE1 06:BAD1: 01

	.byte $50					;- D 0 - - - 0x019AE2 06:BAD2: 50
	.byte $98					;- D 0 - - - 0x019AE3 06:BAD3: 98
	.byte $03					;- D 0 - - - 0x019AE4 06:BAD4: 03
	.byte anInvader_ID					;- D 0 - - - 0x019AE5 06:BAD5: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019AE6 06:BAD6: 06
	.byte DIR_RIGHT					;- D 0 - - - 0x019AE7 06:BAD7: 02

	.byte $80					;- D 0 - - - 0x019AE8 06:BAD8: 80
	.byte $98					;- D 0 - - - 0x019AE9 06:BAD9: 98
	.byte $03					;- D 0 - - - 0x019AEA 06:BADA: 03
	.byte anInvader_ID					;- D 0 - - - 0x019AEB 06:BADB: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019AEC 06:BADC: 06
	.byte DIR_RIGHT					;- D 0 - - - 0x019AED 06:BADD: 02

EnemiesRound65:
	.byte $05					;- D 0 - - - 0x019AEE 06:BADE: 05

	.byte $28					;- D 0 - - - 0x019AEF 06:BADF: 28
	.byte $38					;- D 0 - - - 0x019AF0 06:BAE0: 38
	.byte $03					;- D 0 - - - 0x019AF1 06:BAE1: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019AF2 06:BAE2: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019AF3 06:BAE3: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019AF4 06:BAE4: 01

	.byte $20					;- D 0 - - - 0x019AF5 06:BAE5: 20
	.byte $C8					;- D 0 - - - 0x019AF6 06:BAE6: C8
	.byte $03					;- D 0 - - - 0x019AF7 06:BAE7: 03
	.byte anZenChanR_ID					;- D 0 - - - 0x019AF8 06:BAE8: 3D
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019AF9 06:BAE9: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019AFA 06:BAEA: 02

	.byte $70					;- D 0 - - - 0x019AFB 06:BAEB: 70
	.byte $30					;- D 0 - - - 0x019AFC 06:BAEC: 30
	.byte $03					;- D 0 - - - 0x019AFD 06:BAED: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019AFE 06:BAEE: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019AFF 06:BAEF: 01
	.byte DIR_LEFT					;- D 0 - - - 0x019B00 06:BAF0: 01

	.byte $70					;- D 0 - - - 0x019B01 06:BAF1: 70
	.byte $D8					;- D 0 - - - 0x019B02 06:BAF2: D8
	.byte $03					;- D 0 - - - 0x019B03 06:BAF3: 03
	.byte anZenChanL_ID					;- D 0 - - - 0x019B04 06:BAF4: 3C
	.byte ENEMY_ZENCHAN					;- D 0 - - - 0x019B05 06:BAF5: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x019B06 06:BAF6: 02

	.byte $78					;- D 0 - - - 0x019B07 06:BAF7: 78
	.byte $80					;- D 0 - - - 0x019B08 06:BAF8: 80
	.byte $02					;- D 0 - - - 0x019B09 06:BAF9: 02
	.byte anTwizzer_ID					;- D 0 - - - 0x019B0A 06:BAFA: 9C
	.byte ENEMY_TWIZZER					;- D 0 - - - 0x019B0B 06:BAFB: 0F
	.byte DIR_LEFT					;- D 0 - - - 0x019B0C 06:BAFC: 01

EnemiesRound66:
	.byte $02					;- D 0 - - - 0x019B0D 06:BAFD: 02

	.byte $30					;- D 0 - - - 0x019B0E 06:BAFE: 30
	.byte $80					;- D 0 - - - 0x019B0F 06:BAFF: 80
	.byte $02					;- D 0 - - - 0x019B10 06:BB00: 02
	.byte anCarryHeliL_ID					;- D 0 - - - 0x019B11 06:BB01: 4B
	.byte ENEMY_CARRYHELI					;- D 0 - - - 0x019B12 06:BB02: 09
	.byte DIR_LEFT					;- D 0 - - - 0x019B13 06:BB03: 01

	.byte $80					;- D 0 - - - 0x019B14 06:BB04: 80
	.byte $80					;- D 0 - - - 0x019B15 06:BB05: 80
	.byte $03					;- D 0 - - - 0x019B16 06:BB06: 03
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x019B17 06:BB07: 49
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019B18 06:BB08: 08
	.byte DIR_LEFT					;- D 0 - - - 0x019B19 06:BB09: 01

EnemiesRound67:
.ifdef JP_ENEMY_PLACEMENT
	.byte $08					;- - - - - - 0x019C4C 06:BC3C: 08
.else
	.byte $06					;- D 0 - - - 0x019B1A 06:BB0A: 06
.endif

	.byte $2F					;- D 0 - - - 0x019B1B 06:BB0B: 2F
	.byte $D8					;- D 0 - - - 0x019B1C 06:BB0C: D8
	.byte $03					;- D 0 - - - 0x019B1D 06:BB0D: 03
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019B1E 06:BB0E: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B1F 06:BB0F: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019B20 06:BB10: 02

	.byte $2F					;- D 0 - - - 0x019B21 06:BB11: 2F
	.byte $E8					;- D 0 - - - 0x019B22 06:BB12: E8
	.byte $03					;- D 0 - - - 0x019B23 06:BB13: 03
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019B24 06:BB14: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B25 06:BB15: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019B26 06:BB16: 02

	.byte $5F					;- D 0 - - - 0x019B27 06:BB17: 5F
	.byte $18					;- D 0 - - - 0x019B28 06:BB18: 18
	.byte $03					;- D 0 - - - 0x019B29 06:BB19: 03
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019B2A 06:BB1A: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B2B 06:BB1B: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019B2C 06:BB1C: 02

	.byte $5F					;- D 0 - - - 0x019B2D 06:BB1D: 5F
	.byte $28					;- D 0 - - - 0x019B2E 06:BB1E: 28
	.byte $03					;- D 0 - - - 0x019B2F 06:BB1F: 03
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019B30 06:BB20: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B31 06:BB21: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019B32 06:BB22: 02

	.byte $2F					;- D 0 - - - 0x019B33 06:BB23: 2F
	.byte $C0					;- D 0 - - - 0x019B34 06:BB24: C0
	.byte $02					;- D 0 - - - 0x019B35 06:BB25: 02
	.byte anInvader_ID					;- D 0 - - - 0x019B36 06:BB26: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019B37 06:BB27: 06
	.byte DIR_LEFT					;- D 0 - - - 0x019B38 06:BB28: 01

	.byte $5F					;- D 0 - - - 0x019B39 06:BB29: 5F
	.byte $40					;- D 0 - - - 0x019B3A 06:BB2A: 40
	.byte $02					;- D 0 - - - 0x019B3B 06:BB2B: 02
	.byte anInvader_ID					;- D 0 - - - 0x019B3C 06:BB2C: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019B3D 06:BB2D: 06
	.byte DIR_RIGHT					;- D 0 - - - 0x019B3E 06:BB2E: 02

.ifdef JP_ENEMY_PLACEMENT
	.byte $8F					;- - - - - - 0x019C71 06:BC61: 8F
	.byte $D8					;- - - - - - 0x019C72 06:BC62: D8
	.byte $02					;- - - - - - 0x019C73 06:BC63: 02
	.byte anInvader_ID					;- - - - - - 0x019C74 06:BC64: 48
	.byte ENEMY_INVADER					;- - - - - - 0x019C75 06:BC65: 06
	.byte DIR_LEFT					;- - - - - - 0x019C76 06:BC66: 01

	.byte $8F					;- - - - - - 0x019C77 06:BC67: 8F
	.byte $E8					;- - - - - - 0x019C78 06:BC68: E8
	.byte $02					;- - - - - - 0x019C79 06:BC69: 02
	.byte anInvader_ID					;- - - - - - 0x019C7A 06:BC6A: 48
	.byte ENEMY_INVADER					;- - - - - - 0x019C7B 06:BC6B: 06
	.byte DIR_RIGHT					;- - - - - - 0x019C7C 06:BC6C: 02
.endif

EnemiesRound68:
	.byte $07					;- D 0 - - - 0x019B3F 06:BB2F: 07

	.byte $38					;- D 0 - - - 0x019B40 06:BB30: 38
	.byte $18					;- D 0 - - - 0x019B41 06:BB31: 18
	.byte $02					;- D 0 - - - 0x019B42 06:BB32: 02
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019B43 06:BB33: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B44 06:BB34: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019B45 06:BB35: 02

	.byte $38					;- D 0 - - - 0x019B46 06:BB36: 38
	.byte $E8					;- D 0 - - - 0x019B47 06:BB37: E8
	.byte $02					;- D 0 - - - 0x019B48 06:BB38: 02
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019B49 06:BB39: 6E
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B4A 06:BB3A: 24
	.byte DIR_LEFT					;- D 0 - - - 0x019B4B 06:BB3B: 01

	.byte $58					;- D 0 - - - 0x019B4C 06:BB3C: 58
	.byte $50					;- D 0 - - - 0x019B4D 06:BB3D: 50
	.byte $02					;- D 0 - - - 0x019B4E 06:BB3E: 02
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019B4F 06:BB3F: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B50 06:BB40: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019B51 06:BB41: 02

	.byte $58					;- D 0 - - - 0x019B52 06:BB42: 58
	.byte $B0					;- D 0 - - - 0x019B53 06:BB43: B0
	.byte $02					;- D 0 - - - 0x019B54 06:BB44: 02
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019B55 06:BB45: 6E
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B56 06:BB46: 24
	.byte DIR_LEFT					;- D 0 - - - 0x019B57 06:BB47: 01

	.byte $80					;- D 0 - - - 0x019B58 06:BB48: 80
	.byte $80					;- D 0 - - - 0x019B59 06:BB49: 80
	.byte $02					;- D 0 - - - 0x019B5A 06:BB4A: 02
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019B5B 06:BB4B: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B5C 06:BB4C: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019B5D 06:BB4D: 02

	.byte $A0					;- D 0 - - - 0x019B5E 06:BB4E: A0
	.byte $38					;- D 0 - - - 0x019B5F 06:BB4F: 38
	.byte $02					;- D 0 - - - 0x019B60 06:BB50: 02
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019B61 06:BB51: 6E
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B62 06:BB52: 24
	.byte DIR_LEFT					;- D 0 - - - 0x019B63 06:BB53: 01

	.byte $A0					;- D 0 - - - 0x019B64 06:BB54: A0
	.byte $C8					;- D 0 - - - 0x019B65 06:BB55: C8
	.byte $03					;- D 0 - - - 0x019B66 06:BB56: 03
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019B67 06:BB57: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B68 06:BB58: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019B69 06:BB59: 02

EnemiesRound69:
	.byte $05					;- D 0 - - - 0x019B6A 06:BB5A: 05

	.byte $48					;- D 0 - - - 0x019B6B 06:BB5B: 48
	.byte $58					;- D 0 - - - 0x019B6C 06:BB5C: 58
	.byte $02					;- D 0 - - - 0x019B6D 06:BB5D: 02
	.byte anDrunkL_ID					;- D 0 - - - 0x019B6E 06:BB5E: 58
	.byte ENEMY_DRUNK					;- D 0 - - - 0x019B6F 06:BB5F: 10
	.byte DIR_LEFT					;- D 0 - - - 0x019B70 06:BB60: 01

	.byte $78					;- D 0 - - - 0x019B71 06:BB61: 78
	.byte $58					;- D 0 - - - 0x019B72 06:BB62: 58
	.byte $03					;- D 0 - - - 0x019B73 06:BB63: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x019B74 06:BB64: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019B75 06:BB65: 02
	.byte DIR_LEFT					;- D 0 - - - 0x019B76 06:BB66: 01

	.byte $78					;- D 0 - - - 0x019B77 06:BB67: 78
	.byte $A8					;- D 0 - - - 0x019B78 06:BB68: A8
	.byte $03					;- D 0 - - - 0x019B79 06:BB69: 03
	.byte anBanebouR_ID					;- D 0 - - - 0x019B7A 06:BB6A: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019B7B 06:BB6B: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x019B7C 06:BB6C: 02

	.byte $A0					;- D 0 - - - 0x019B7D 06:BB6D: A0
	.byte $58					;- D 0 - - - 0x019B7E 06:BB6E: 58
	.byte $03					;- D 0 - - - 0x019B7F 06:BB6F: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x019B80 06:BB70: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019B81 06:BB71: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x019B82 06:BB72: 02

	.byte $A0					;- D 0 - - - 0x019B83 06:BB73: A0
	.byte $A8					;- D 0 - - - 0x019B84 06:BB74: A8
	.byte $03					;- D 0 - - - 0x019B85 06:BB75: 03
	.byte anBanebouR_ID					;- D 0 - - - 0x019B86 06:BB76: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019B87 06:BB77: 02
	.byte DIR_LEFT					;- D 0 - - - 0x019B88 06:BB78: 01

EnemiesRound70:
	.byte $01					;- D 0 - - - 0x019B89 06:BB79: 01

	.byte $97					;- D 0 - - - 0x019B8A 06:BB7A: 97
	.byte $9C					;- D 0 - - - 0x019B8B 06:BB7B: 9C
	.byte $02					;- D 0 - - - 0x019B8C 06:BB7C: 02
	.byte anSkullL_ID					;- D 0 - - - 0x019B8D 06:BB7D: E9
	.byte ENEMY_BLUESKULL					;- D 0 - - - 0x019B8E 06:BB7E: 1D
	.byte DIR_LEFT|DIR_INSTAPLACE					;- D 0 - - - 0x019B8F 06:BB7F: 81

EnemiesRound71:
	.byte $07					;- D 0 - - - 0x019B90 06:BB80: 07

	.byte $80					;- D 0 - - - 0x019B91 06:BB81: 80
	.byte $20					;- D 0 - - - 0x019B92 06:BB82: 20
	.byte $03					;- D 0 - - - 0x019B93 06:BB83: 03
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019B94 06:BB84: 6E
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B95 06:BB85: 24
	.byte DIR_LEFT					;- D 0 - - - 0x019B96 06:BB86: 01

	.byte $80					;- D 0 - - - 0x019B97 06:BB87: 80
	.byte $E0					;- D 0 - - - 0x019B98 06:BB88: E0
	.byte $03					;- D 0 - - - 0x019B99 06:BB89: 03
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019B9A 06:BB8A: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019B9B 06:BB8B: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019B9C 06:BB8C: 02

	.byte $C8					;- D 0 - - - 0x019B9D 06:BB8D: C8
	.byte $40					;- D 0 - - - 0x019B9E 06:BB8E: 40
	.byte $03					;- D 0 - - - 0x019B9F 06:BB8F: 03
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019BA0 06:BB90: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019BA1 06:BB91: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019BA2 06:BB92: 02

	.byte $C8					;- D 0 - - - 0x019BA3 06:BB93: C8
	.byte $C0					;- D 0 - - - 0x019BA4 06:BB94: C0
	.byte $03					;- D 0 - - - 0x019BA5 06:BB95: 03
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019BA6 06:BB96: 6E
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019BA7 06:BB97: 24
	.byte DIR_LEFT					;- D 0 - - - 0x019BA8 06:BB98: 01

	.byte $80					;- D 0 - - - 0x019BA9 06:BB99: 80
	.byte $60					;- D 0 - - - 0x019BAA 06:BB9A: 60
	.byte $02					;- D 0 - - - 0x019BAB 06:BB9B: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x019BAC 06:BB9C: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x019BAD 06:BB9D: 17
	.byte DIR_LEFT					;- D 0 - - - 0x019BAE 06:BB9E: 01

	.byte $C8					;- D 0 - - - 0x019BAF 06:BB9F: C8
	.byte $80					;- D 0 - - - 0x019BB0 06:BBA0: 80
	.byte $02					;- D 0 - - - 0x019BB1 06:BBA1: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x019BB2 06:BBA2: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x019BB3 06:BBA3: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x019BB4 06:BBA4: 02

	.byte $80					;- D 0 - - - 0x019BB5 06:BBA5: 80
	.byte $A0					;- D 0 - - - 0x019BB6 06:BBA6: A0
	.byte $02					;- D 0 - - - 0x019BB7 06:BBA7: 02
	.byte anChuckerL_ID					;- D 0 - - - 0x019BB8 06:BBA8: BF
	.byte ENEMY_CHUCKER					;- D 0 - - - 0x019BB9 06:BBA9: 17
	.byte DIR_RIGHT					;- D 0 - - - 0x019BBA 06:BBAA: 02

EnemiesRound72:
	.byte $04					;- D 0 - - - 0x019BBB 06:BBAB: 04

	.byte $48					;- D 0 - - - 0x019BBC 06:BBAC: 48
	.byte $20					;- D 0 - - - 0x019BBD 06:BBAD: 20
	.byte $02					;- D 0 - - - 0x019BBE 06:BBAE: 02
	.byte anBanebouL_ID					;- D 0 - - - 0x019BBF 06:BBAF: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019BC0 06:BBB0: 02
	.byte DIR_LEFT					;- D 0 - - - 0x019BC1 06:BBB1: 01

	.byte $48					;- D 0 - - - 0x019BC2 06:BBB2: 48
	.byte $60					;- D 0 - - - 0x019BC3 06:BBB3: 60
	.byte $02					;- D 0 - - - 0x019BC4 06:BBB4: 02
	.byte anBanebouR_ID					;- D 0 - - - 0x019BC5 06:BBB5: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019BC6 06:BBB6: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x019BC7 06:BBB7: 02

	.byte $48					;- D 0 - - - 0x019BC8 06:BBB8: 48
	.byte $A0					;- D 0 - - - 0x019BC9 06:BBB9: A0
	.byte $02					;- D 0 - - - 0x019BCA 06:BBBA: 02
	.byte anBanebouL_ID					;- D 0 - - - 0x019BCB 06:BBBB: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019BCC 06:BBBC: 02
	.byte DIR_LEFT					;- D 0 - - - 0x019BCD 06:BBBD: 01

	.byte $48					;- D 0 - - - 0x019BCE 06:BBBE: 48
	.byte $E0					;- D 0 - - - 0x019BCF 06:BBBF: E0
	.byte $03					;- D 0 - - - 0x019BD0 06:BBC0: 03
	.byte anBanebouR_ID					;- D 0 - - - 0x019BD1 06:BBC1: 44
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019BD2 06:BBC2: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x019BD3 06:BBC3: 02

EnemiesRound73:
	.byte $05					;- D 0 - - - 0x019BD4 06:BBC4: 05

	.byte $28					;- D 0 - - - 0x019BD5 06:BBC5: 28
	.byte $80					;- D 0 - - - 0x019BD6 06:BBC6: 80
	.byte $02					;- D 0 - - - 0x019BD7 06:BBC7: 02
	.byte anRoboZenL_ID					;- D 0 - - - 0x019BD8 06:BBC8: 50
	.byte ENEMY_ROBOZEN					;- D 0 - - - 0x019BD9 06:BBC9: 0D
	.byte DIR_LEFT					;- D 0 - - - 0x019BDA 06:BBCA: 01

	.byte $80					;- D 0 - - - 0x019BDB 06:BBCB: 80
	.byte $60					;- D 0 - - - 0x019BDC 06:BBCC: 60
	.byte $03					;- D 0 - - - 0x019BDD 06:BBCD: 03
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x019BDE 06:BBCE: 49
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019BDF 06:BBCF: 08
	.byte DIR_LEFT					;- D 0 - - - 0x019BE0 06:BBD0: 01

	.byte $80					;- D 0 - - - 0x019BE1 06:BBD1: 80
	.byte $80					;- D 0 - - - 0x019BE2 06:BBD2: 80
	.byte $03					;- D 0 - - - 0x019BE3 06:BBD3: 03
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x019BE4 06:BBD4: 49
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019BE5 06:BBD5: 08
	.byte DIR_LEFT					;- D 0 - - - 0x019BE6 06:BBD6: 01

	.byte $80					;- D 0 - - - 0x019BE7 06:BBD7: 80
	.byte $A0					;- D 0 - - - 0x019BE8 06:BBD8: A0
	.byte $03					;- D 0 - - - 0x019BE9 06:BBD9: 03
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x019BEA 06:BBDA: 49
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019BEB 06:BBDB: 08
	.byte DIR_LEFT					;- D 0 - - - 0x019BEC 06:BBDC: 01

	.byte $A0					;- D 0 - - - 0x019BED 06:BBDD: A0
	.byte $70					;- D 0 - - - 0x019BEE 06:BBDE: 70
	.byte $03					;- D 0 - - - 0x019BEF 06:BBDF: 03
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x019BF0 06:BBE0: 49
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019BF1 06:BBE1: 08
	.byte DIR_LEFT					;- D 0 - - - 0x019BF2 06:BBE2: 01

EnemiesRound74:
	.byte $03					;- D 0 - - - 0x019BF3 06:BBE3: 03

	.byte $78					;- D 0 - - - 0x019BF4 06:BBE4: 78
	.byte $80					;- D 0 - - - 0x019BF5 06:BBE5: 80
	.byte $02					;- D 0 - - - 0x019BF6 06:BBE6: 02
	.byte anRoboZenL_ID					;- D 0 - - - 0x019BF7 06:BBE7: 50
	.byte ENEMY_ROBOZEN					;- D 0 - - - 0x019BF8 06:BBE8: 0D
	.byte DIR_LEFT					;- D 0 - - - 0x019BF9 06:BBE9: 01

	.byte $30					;- D 0 - - - 0x019BFA 06:BBEA: 30
	.byte $80					;- D 0 - - - 0x019BFB 06:BBEB: 80
	.byte $03					;- D 0 - - - 0x019BFC 06:BBEC: 03
	.byte anInvader_ID					;- D 0 - - - 0x019BFD 06:BBED: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019BFE 06:BBEE: 06
	.byte DIR_LEFT					;- D 0 - - - 0x019BFF 06:BBEF: 01

	.byte $48					;- D 0 - - - 0x019C00 06:BBF0: 48
	.byte $C0					;- D 0 - - - 0x019C01 06:BBF1: C0
	.byte $03					;- D 0 - - - 0x019C02 06:BBF2: 03
	.byte anInvader_ID					;- D 0 - - - 0x019C03 06:BBF3: 48
	.byte ENEMY_INVADER					;- D 0 - - - 0x019C04 06:BBF4: 06
	.byte DIR_LEFT					;- D 0 - - - 0x019C05 06:BBF5: 01

EnemiesRound75:
	.byte $06					;- D 0 - - - 0x019C06 06:BBF6: 06

	.byte $80					;- D 0 - - - 0x019C07 06:BBF7: 80
	.byte $40					;- D 0 - - - 0x019C08 06:BBF8: 40
	.byte $02					;- D 0 - - - 0x019C09 06:BBF9: 02
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x019C0A 06:BBFA: 49
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019C0B 06:BBFB: 08
	.byte DIR_LEFT					;- D 0 - - - 0x019C0C 06:BBFC: 01

	.byte $80					;- D 0 - - - 0x019C0D 06:BBFD: 80
	.byte $C0					;- D 0 - - - 0x019C0E 06:BBFE: C0
	.byte $02					;- D 0 - - - 0x019C0F 06:BBFF: 02
	.byte anHeitaiKunR_ID					;- D 0 - - - 0x019C10 06:BC00: 4A
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019C11 06:BC01: 08
	.byte DIR_RIGHT					;- D 0 - - - 0x019C12 06:BC02: 02

	.byte $30					;- D 0 - - - 0x019C13 06:BC03: 30
	.byte $60					;- D 0 - - - 0x019C14 06:BC04: 60
	.byte $03					;- D 0 - - - 0x019C15 06:BC05: 03
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019C16 06:BC06: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019C17 06:BC07: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019C18 06:BC08: 02

	.byte $30					;- D 0 - - - 0x019C19 06:BC09: 30
	.byte $A0					;- D 0 - - - 0x019C1A 06:BC0A: A0
	.byte $03					;- D 0 - - - 0x019C1B 06:BC0B: 03
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019C1C 06:BC0C: 6E
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019C1D 06:BC0D: 24
	.byte DIR_LEFT					;- D 0 - - - 0x019C1E 06:BC0E: 01

	.byte $40					;- D 0 - - - 0x019C1F 06:BC0F: 40
	.byte $20					;- D 0 - - - 0x019C20 06:BC10: 20
	.byte $03					;- D 0 - - - 0x019C21 06:BC11: 03
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019C22 06:BC12: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019C23 06:BC13: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019C24 06:BC14: 02

	.byte $40					;- D 0 - - - 0x019C25 06:BC15: 40
	.byte $E0					;- D 0 - - - 0x019C26 06:BC16: E0
	.byte $03					;- D 0 - - - 0x019C27 06:BC17: 03
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019C28 06:BC18: 6E
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019C29 06:BC19: 24
	.byte DIR_LEFT					;- D 0 - - - 0x019C2A 06:BC1A: 01

EnemiesRound76:
.ifdef JP_ENEMY_PLACEMENT
	.byte $07					;- - - - - - 0x019D69 06:BD59: 07
.else
	.byte $05					;- D 0 - - - 0x019C2B 06:BC1B: 05
.endif

	.byte $40					;- D 0 - - - 0x019C2C 06:BC1C: 40
	.byte $58					;- D 0 - - - 0x019C2D 06:BC1D: 58
	.byte $02					;- D 0 - - - 0x019C2E 06:BC1E: 02
	.byte anDrunkL_ID					;- D 0 - - - 0x019C2F 06:BC1F: 58
	.byte ENEMY_DRUNK					;- D 0 - - - 0x019C30 06:BC20: 10
	.byte DIR_RIGHT					;- D 0 - - - 0x019C31 06:BC21: 02

	.byte $27					;- D 0 - - - 0x019C32 06:BC22: 27
	.byte $90					;- D 0 - - - 0x019C33 06:BC23: 90
	.byte $03					;- D 0 - - - 0x019C34 06:BC24: 03
	.byte anHeitaiKunR_ID					;- D 0 - - - 0x019C35 06:BC25: 4A
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019C36 06:BC26: 08
	.byte DIR_RIGHT					;- D 0 - - - 0x019C37 06:BC27: 02

	.byte $47					;- D 0 - - - 0x019C38 06:BC28: 47
	.byte $70					;- D 0 - - - 0x019C39 06:BC29: 70
	.byte $03					;- D 0 - - - 0x019C3A 06:BC2A: 03
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x019C3B 06:BC2B: 49
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019C3C 06:BC2C: 08
	.byte DIR_LEFT					;- D 0 - - - 0x019C3D 06:BC2D: 01

	.byte $67					;- D 0 - - - 0x019C3E 06:BC2E: 67
	.byte $90					;- D 0 - - - 0x019C3F 06:BC2F: 90
	.byte $03					;- D 0 - - - 0x019C40 06:BC30: 03
	.byte anHeitaiKunR_ID					;- D 0 - - - 0x019C41 06:BC31: 4A
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019C42 06:BC32: 08
	.byte DIR_RIGHT					;- D 0 - - - 0x019C43 06:BC33: 02

	.byte $87					;- D 0 - - - 0x019C44 06:BC34: 87
	.byte $70					;- D 0 - - - 0x019C45 06:BC35: 70
	.byte $03					;- D 0 - - - 0x019C46 06:BC36: 03
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x019C47 06:BC37: 49
	.byte ENEMY_HEITAIKUN					;- D 0 - - - 0x019C48 06:BC38: 08
	.byte DIR_LEFT					;- D 0 - - - 0x019C49 06:BC39: 01

.ifdef JP_ENEMY_PLACEMENT
	.byte $A7					;- - - - - - 0x019D88 06:BD78: A7
	.byte $90					;- - - - - - 0x019D89 06:BD79: 90
	.byte $03					;- - - - - - 0x019D8A 06:BD7A: 03
	.byte anHeitaiKunR_ID					;- - - - - - 0x019D8B 06:BD7B: 4A
	.byte ENEMY_HEITAIKUN					;- - - - - - 0x019D8C 06:BD7C: 08
	.byte DIR_RIGHT					;- - - - - - 0x019D8D 06:BD7D: 02

	.byte $C7					;- - - - - - 0x019D8E 06:BD7E: C7
	.byte $70					;- - - - - - 0x019D8F 06:BD7F: 70
	.byte $03					;- - - - - - 0x019D90 06:BD80: 03
	.byte anHeitaiKunL_ID					;- - - - - - 0x019D91 06:BD81: 49
	.byte ENEMY_HEITAIKUN					;- - - - - - 0x019D92 06:BD82: 08
	.byte DIR_LEFT					;- - - - - - 0x019D93 06:BD83: 01
.endif

EnemiesRound77:
	.byte $05					;- D 0 - - - 0x019C4A 06:BC3A: 05

	.byte $30					;- D 0 - - - 0x019C4B 06:BC3B: 30
	.byte $90					;- D 0 - - - 0x019C4C 06:BC3C: 90
	.byte $02					;- D 0 - - - 0x019C4D 06:BC3D: 02
	.byte anDrunkL_ID					;- D 0 - - - 0x019C4E 06:BC3E: 58
	.byte ENEMY_DRUNK					;- D 0 - - - 0x019C4F 06:BC3F: 10
	.byte DIR_RIGHT					;- D 0 - - - 0x019C50 06:BC40: 02

	.byte $30					;- D 0 - - - 0x019C51 06:BC41: 30
	.byte $30					;- D 0 - - - 0x019C52 06:BC42: 30
	.byte $03					;- D 0 - - - 0x019C53 06:BC43: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x019C54 06:BC44: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019C55 06:BC45: 02
	.byte DIR_LEFT					;- D 0 - - - 0x019C56 06:BC46: 01

	.byte $50					;- D 0 - - - 0x019C57 06:BC47: 50
	.byte $50					;- D 0 - - - 0x019C58 06:BC48: 50
	.byte $03					;- D 0 - - - 0x019C59 06:BC49: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x019C5A 06:BC4A: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019C5B 06:BC4B: 02
	.byte DIR_LEFT					;- D 0 - - - 0x019C5C 06:BC4C: 01

	.byte $50					;- D 0 - - - 0x019C5D 06:BC4D: 50
	.byte $80					;- D 0 - - - 0x019C5E 06:BC4E: 80
	.byte $03					;- D 0 - - - 0x019C5F 06:BC4F: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x019C60 06:BC50: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019C61 06:BC51: 02
	.byte DIR_LEFT					;- D 0 - - - 0x019C62 06:BC52: 01

	.byte $50					;- D 0 - - - 0x019C63 06:BC53: 50
	.byte $B0					;- D 0 - - - 0x019C64 06:BC54: B0
	.byte $03					;- D 0 - - - 0x019C65 06:BC55: 03
	.byte anBanebouL_ID					;- D 0 - - - 0x019C66 06:BC56: 43
	.byte ENEMY_BANEBOU					;- D 0 - - - 0x019C67 06:BC57: 02
	.byte DIR_LEFT					;- D 0 - - - 0x019C68 06:BC58: 01

EnemiesRound78:
	.byte $03					;- D 0 - - - 0x019C69 06:BC59: 03

	.byte $58					;- D 0 - - - 0x019C6A 06:BC5A: 58
	.byte $40					;- D 0 - - - 0x019C6B 06:BC5B: 40
	.byte $02					;- D 0 - - - 0x019C6C 06:BC5C: 02
	.byte anRoboZenL_ID					;- D 0 - - - 0x019C6D 06:BC5D: 50
	.byte ENEMY_ROBOZEN					;- D 0 - - - 0x019C6E 06:BC5E: 0D
	.byte DIR_LEFT					;- D 0 - - - 0x019C6F 06:BC5F: 01

	.byte $30					;- D 0 - - - 0x019C70 06:BC60: 30
	.byte $60					;- D 0 - - - 0x019C71 06:BC61: 60
	.byte $03					;- D 0 - - - 0x019C72 06:BC62: 03
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019C73 06:BC63: 6F
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019C74 06:BC64: 24
	.byte DIR_RIGHT					;- D 0 - - - 0x019C75 06:BC65: 02

	.byte $30					;- D 0 - - - 0x019C76 06:BC66: 30
	.byte $A0					;- D 0 - - - 0x019C77 06:BC67: A0
	.byte $03					;- D 0 - - - 0x019C78 06:BC68: 03
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019C79 06:BC69: 6E
	.byte ENEMY_GHOSTMONSTA					;- D 0 - - - 0x019C7A 06:BC6A: 24
	.byte DIR_LEFT					;- D 0 - - - 0x019C7B 06:BC6B: 01

EnemiesRound79:
	;Super Drunk spawned separately
	.byte $03					;- D 0 - - - 0x019C7C 06:BC6C: 03

	.byte $80					;- D 0 - - - 0x019C7D 06:BC6D: 80
	.byte $80					;- D 0 - - - 0x019C7E 06:BC6E: 80
	.byte $02					;- D 0 - - - 0x019C7F 06:BC6F: 02
	.byte anSkullL_ID					;- D 0 - - - 0x019C80 06:BC70: E9
	.byte ENEMY_BLUESKULL					;- D 0 - - - 0x019C81 06:BC71: 1D
	.byte DIR_LEFT					;- D 0 - - - 0x019C82 06:BC72: 01

	.byte $80					;- D 0 - - - 0x019C83 06:BC73: 80
	.byte $90					;- D 0 - - - 0x019C84 06:BC74: 90
	.byte $02					;- D 0 - - - 0x019C85 06:BC75: 02
	.byte anSkullL_ID					;- D 0 - - - 0x019C86 06:BC76: E9
	.byte ENEMY_PURPLESKULL					;- D 0 - - - 0x019C87 06:BC77: 1E
	.byte DIR_LEFT					;- D 0 - - - 0x019C88 06:BC78: 01

	.byte $80					;- D 0 - - - 0x019C89 06:BC79: 80
	.byte $A0					;- D 0 - - - 0x019C8A 06:BC7A: A0
	.byte $02					;- D 0 - - - 0x019C8B 06:BC7B: 02
	.byte anBurningSkullL_ID					;- D 0 - - - 0x019C8C 06:BC7C: EA
	.byte ENEMY_REDSKULL					;- D 0 - - - 0x019C8D 06:BC7D: 1F
	.byte DIR_LEFT					;- D 0 - - - 0x019C8E 06:BC7E: 01

EnemiesRound80:
	.byte $03					;- D 0 - - - 0x019C8F 06:BC7F: 03

	.byte $80					;- D 0 - - - 0x019C90 06:BC80: 80
	.byte $80					;- D 0 - - - 0x019C91 06:BC81: 80
	.byte $02					;- D 0 - - - 0x019C92 06:BC82: 02
	.byte anSkullL_ID					;- D 0 - - - 0x019C93 06:BC83: E9
	.byte ENEMY_BLUESKULL					;- D 0 - - - 0x019C94 06:BC84: 1D
	.byte DIR_LEFT					;- D 0 - - - 0x019C95 06:BC85: 01

	.byte $80					;- D 0 - - - 0x019C96 06:BC86: 80
	.byte $90					;- D 0 - - - 0x019C97 06:BC87: 90
	.byte $02					;- D 0 - - - 0x019C98 06:BC88: 02
	.byte anSkullL_ID					;- D 0 - - - 0x019C99 06:BC89: E9
	.byte ENEMY_PURPLESKULL					;- D 0 - - - 0x019C9A 06:BC8A: 1E
	.byte DIR_LEFT					;- D 0 - - - 0x019C9B 06:BC8B: 01

	.byte $80					;- D 0 - - - 0x019C9C 06:BC8C: 80
	.byte $A0					;- D 0 - - - 0x019C9D 06:BC8D: A0
	.byte $02					;- D 0 - - - 0x019C9E 06:BC8E: 02
	.byte anBurningSkullL_ID					;- D 0 - - - 0x019C9F 06:BC8F: EA
	.byte ENEMY_REDSKULL					;- D 0 - - - 0x019CA0 06:BC90: 1F
	.byte DIR_LEFT					;- D 0 - - - 0x019CA1 06:BC91: 01

EnemyRewardAnims:
	.byte $00					;- - - - - - 0x019CA2 06:BC92: 00
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CA3 06:BC93: BE
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CA4 06:BC94: BE
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CA5 06:BC95: BE
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CA6 06:BC96: BE
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CA7 06:BC97: BE
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CA8 06:BC98: BE
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CA9 06:BC99: BE
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CAA 06:BC9A: BE
	.byte anEnemySpecificReward_ID					;- - - - - - 0x019CAB 06:BC9B: BE
	.byte anEnemySpecificReward_ID					;- - - - - - 0x019CAC 06:BC9C: BE
	.byte anEnemySpecificReward_ID					;- - - - - - 0x019CAD 06:BC9D: BE
	.byte anEnemySpecificReward_ID					;- - - - - - 0x019CAE 06:BC9E: BE
	.byte anEnemySpecificReward_ID					;- - - - - - 0x019CAF 06:BC9F: BE
	.byte anEnemySpecificReward_ID					;- - - - - - 0x019CB0 06:BCA0: BE
	.byte anEnemySpecificReward_ID					;- - - - - - 0x019CB1 06:BCA1: BE
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CB2 06:BCA2: BE
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CB3 06:BCA3: BE
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CB4 06:BCA4: BE
	.byte $00					;- - - - - - 0x019CB5 06:BCA5: 00
	.byte $00					;- - - - - - 0x019CB6 06:BCA6: 00
	.byte $00					;- - - - - - 0x019CB7 06:BCA7: 00
	.byte $00					;- - - - - - 0x019CB8 06:BCA8: 00
	.byte anEnemySpecificReward_ID					;- D 0 - - - 0x019CB9 06:BCA9: BE
	.byte anRounderReward_ID					;- D 0 - - - 0x019CBA 06:BCAA: D4
	.byte $00					;- - - - - - 0x019CBB 06:BCAB: 00
	.byte $00					;- - - - - - 0x019CBC 06:BCAC: 00
	.byte $00					;- - - - - - 0x019CBD 06:BCAD: 00
	.byte $00					;- - - - - - 0x019CBE 06:BCAE: 00
	.byte $00					;- - - - - - 0x019CBF 06:BCAF: 00
	.byte $00					;- - - - - - 0x019CC0 06:BCB0: 00
	.byte $00					;- - - - - - 0x019CC1 06:BCB1: 00
	.byte $00					;- - - - - - 0x019CC2 06:BCB2: 00
	.byte $00					;- - - - - - 0x019CC3 06:BCB3: 00
	.byte $00					;- - - - - - 0x019CC4 06:BCB4: 00
	.byte anEnemySpecificReward_ID					;- - - - - - 0x019CC5 06:BCB5: BE

DATA_0CBCB6:
	.byte $0C					;- D 0 - - - 0x019CC6 06:BCB6: 0C
	.byte $0C					;- D 0 - - - 0x019CC7 06:BCB7: 0C
	.byte $0C					;- D 0 - - - 0x019CC8 06:BCB8: 0C
	.byte $0C					;- D 0 - - - 0x019CC9 06:BCB9: 0C
	.byte $0C					;- D 0 - - - 0x019CCA 06:BCBA: 0C
	.byte $0C					;- D 0 - - - 0x019CCB 06:BCBB: 0C
	.byte $08					;- D 0 - - - 0x019CCC 06:BCBC: 08
	.byte $08					;- D 0 - - - 0x019CCD 06:BCBD: 08
	.byte $06					;- D 0 - - - 0x019CCE 06:BCBE: 06
	.byte $06					;- D 0 - - - 0x019CCF 06:BCBF: 06
	.byte $06					;- D 0 - - - 0x019CD0 06:BCC0: 06
	.byte $06					;- D 0 - - - 0x019CD1 06:BCC1: 06
	.byte $06					;- D 0 - - - 0x019CD2 06:BCC2: 06
	.byte $06					;- D 0 - - - 0x019CD3 06:BCC3: 06
	.byte $06					;- D 0 - - - 0x019CD4 06:BCC4: 06
	.byte $06					;- D 0 - - - 0x019CD5 06:BCC5: 06
	.byte $03					;- D 0 - - - 0x019CD6 06:BCC6: 03
	.byte $03					;- D 0 - - - 0x019CD7 06:BCC7: 03
	.byte $03					;- D 0 - - - 0x019CD8 06:BCC8: 03
	.byte $03					;- D 0 - - - 0x019CD9 06:BCC9: 03
	.byte $03					;- D 0 - - - 0x019CDA 06:BCCA: 03
	.byte $03					;- D 0 - - - 0x019CDB 06:BCCB: 03
	.byte $03					;- D 0 - - - 0x019CDC 06:BCCC: 03
	.byte $03					;- D 0 - - - 0x019CDD 06:BCCD: 03
	.byte $00					;- D 0 - - - 0x019CDE 06:BCCE: 00
	.byte $00					;- D 0 - - - 0x019CDF 06:BCCF: 00
	.byte $00					;- D 0 - - - 0x019CE0 06:BCD0: 00
	.byte $00					;- D 0 - - - 0x019CE1 06:BCD1: 00

DATA_0CBCD2:
	.byte $18					;- D 0 - - - 0x019CE2 06:BCD2: 18
	.byte $18					;- D 0 - - - 0x019CE3 06:BCD3: 18
	.byte $18					;- D 0 - - - 0x019CE4 06:BCD4: 18
	.byte $10					;- D 0 - - - 0x019CE5 06:BCD5: 10
	.byte $0C					;- D 0 - - - 0x019CE6 06:BCD6: 0C
	.byte $0C					;- D 0 - - - 0x019CE7 06:BCD7: 0C
	.byte $0C					;- D 0 - - - 0x019CE8 06:BCD8: 0C
	.byte $0C					;- D 0 - - - 0x019CE9 06:BCD9: 0C
	.byte $06					;- D 0 - - - 0x019CEA 06:BCDA: 06
	.byte $06					;- D 0 - - - 0x019CEB 06:BCDB: 06
	.byte $06					;- D 0 - - - 0x019CEC 06:BCDC: 06
	.byte $06					;- D 0 - - - 0x019CED 06:BCDD: 06
	.byte $00					;- D 0 - - - 0x019CEE 06:BCDE: 00
	.byte $00					;- D 0 - - - 0x019CEF 06:BCDF: 00

DATA_0CBCE0:
	.byte $0C					;- D 0 - - - 0x019CF0 06:BCE0: 0C
	.byte $0C					;- D 0 - - - 0x019CF1 06:BCE1: 0C
	.byte $0C					;- D 0 - - - 0x019CF2 06:BCE2: 0C
	.byte $0C					;- D 0 - - - 0x019CF3 06:BCE3: 0C
	.byte $06					;- D 0 - - - 0x019CF4 06:BCE4: 06
	.byte $06					;- D 0 - - - 0x019CF5 06:BCE5: 06
	.byte $06					;- D 0 - - - 0x019CF6 06:BCE6: 06
	.byte $06					;- D 0 - - - 0x019CF7 06:BCE7: 06
	.byte $03					;- D 0 - - - 0x019CF8 06:BCE8: 03
	.byte $03					;- D 0 - - - 0x019CF9 06:BCE9: 03
	.byte $03					;- D 0 - - - 0x019CFA 06:BCEA: 03
	.byte $03					;- D 0 - - - 0x019CFB 06:BCEB: 03
	.byte $00					;- D 0 - - - 0x019CFC 06:BCEC: 00
	.byte $00					;- D 0 - - - 0x019CFD 06:BCED: 00
	.byte $03					;- D 0 - - - 0x019CFE 06:BCEE: 03
	.byte $03					;- D 0 - - - 0x019CFF 06:BCEF: 03
	.byte $03					;- D 0 - - - 0x019D00 06:BCF0: 03
	.byte $03					;- D 0 - - - 0x019D01 06:BCF1: 03
	.byte $06					;- D 0 - - - 0x019D02 06:BCF2: 06
	.byte $06					;- D 0 - - - 0x019D03 06:BCF3: 06
	.byte $06					;- D 0 - - - 0x019D04 06:BCF4: 06
	.byte $06					;- D 0 - - - 0x019D05 06:BCF5: 06
	.byte $0C					;- D 0 - - - 0x019D06 06:BCF6: 0C
	.byte $0C					;- D 0 - - - 0x019D07 06:BCF7: 0C
	.byte $0C					;- D 0 - - - 0x019D08 06:BCF8: 0C
	.byte $0C					;- D 0 - - - 0x019D09 06:BCF9: 0C

DATA_0CBCFA:
	.byte $18					;- D 0 - - - 0x019D0A 06:BCFA: 18
	.byte $18					;- D 0 - - - 0x019D0B 06:BCFB: 18
	.byte $0C					;- D 0 - - - 0x019D0C 06:BCFC: 0C
	.byte $0C					;- D 0 - - - 0x019D0D 06:BCFD: 0C
	.byte $06					;- D 0 - - - 0x019D0E 06:BCFE: 06
	.byte $06					;- D 0 - - - 0x019D0F 06:BCFF: 06
	.byte $00					;- D 0 - - - 0x019D10 06:BD00: 00
	.byte $00					;- D 0 - - - 0x019D11 06:BD01: 00
	.byte $06					;- D 0 - - - 0x019D12 06:BD02: 06
	.byte $06					;- D 0 - - - 0x019D13 06:BD03: 06
	.byte $0C					;- D 0 - - - 0x019D14 06:BD04: 0C
	.byte $0C					;- D 0 - - - 0x019D15 06:BD05: 0C
	.byte $18					;- D 0 - - - 0x019D16 06:BD06: 18
	.byte $18					;- D 0 - - - 0x019D17 06:BD07: 18

DATA_0CBD08:
	.byte $00					;- - - - - - 0x019D18 06:BD08: 00
	.byte $02					;- D 0 - - - 0x019D19 06:BD09: 02
	.byte $00					;- - - - - - 0x019D1A 06:BD0A: 00
	.byte $00					;- - - - - - 0x019D1B 06:BD0B: 00
	.byte $00					;- - - - - - 0x019D1C 06:BD0C: 00
	.byte $00					;- - - - - - 0x019D1D 06:BD0D: 00
	.byte $00					;- - - - - - 0x019D1E 06:BD0E: 00
	.byte $00					;- - - - - - 0x019D1F 06:BD0F: 00
	.byte $02					;- D 0 - - - 0x019D20 06:BD10: 02
	.byte $00					;- - - - - - 0x019D21 06:BD11: 00
	.byte $00					;- - - - - - 0x019D22 06:BD12: 00
	.byte $00					;- - - - - - 0x019D23 06:BD13: 00
	.byte $00					;- - - - - - 0x019D24 06:BD14: 00
	.byte $F1					;- D 0 - - - 0x019D25 06:BD15: F1
	.byte $00					;- - - - - - 0x019D26 06:BD16: 00
	.byte $00					;- - - - - - 0x019D27 06:BD17: 00
	.byte $F9					;- - - - - - 0x019D28 06:BD18: F9
	.byte $00					;- - - - - - 0x019D29 06:BD19: 00
	.byte $00					;- - - - - - 0x019D2A 06:BD1A: 00
	.byte $DC					;- D 0 - - - 0x019D2B 06:BD1B: DC
	.byte $F1					;- - - - - - 0x019D2C 06:BD1C: F1
	.byte $00					;- - - - - - 0x019D2D 06:BD1D: 00
	.byte $00					;- - - - - - 0x019D2E 06:BD1E: 00
	.byte $00					;- - - - - - 0x019D2F 06:BD1F: 00

DATA_0CBD20:
	.byte $00					;- D 0 - - - 0x019D30 06:BD20: 00
	.byte $00					;- D 0 - - - 0x019D31 06:BD21: 00
	.byte $00					;- D 0 - - - 0x019D32 06:BD22: 00
	.byte $00					;- D 0 - - - 0x019D33 06:BD23: 00
	.byte $01					;- D 0 - - - 0x019D34 06:BD24: 01
	.byte $01					;- D 0 - - - 0x019D35 06:BD25: 01
	.byte $01					;- D 0 - - - 0x019D36 06:BD26: 01
	.byte $01					;- D 0 - - - 0x019D37 06:BD27: 01
	.byte $02					;- D 0 - - - 0x019D38 06:BD28: 02
	.byte $02					;- D 0 - - - 0x019D39 06:BD29: 02
	.byte $02					;- D 0 - - - 0x019D3A 06:BD2A: 02
	.byte $02					;- D 0 - - - 0x019D3B 06:BD2B: 02
	.byte $02					;- D 0 - - - 0x019D3C 06:BD2C: 02
	.byte $03					;- D 0 - - - 0x019D3D 06:BD2D: 03
	.byte $03					;- D 0 - - - 0x019D3E 06:BD2E: 03
	.byte $03					;- D 0 - - - 0x019D3F 06:BD2F: 03
	.byte $03					;- D 0 - - - 0x019D40 06:BD30: 03
	.byte $03					;- D 0 - - - 0x019D41 06:BD31: 03
	.byte $04					;- D 0 - - - 0x019D42 06:BD32: 04
	.byte $04					;- D 0 - - - 0x019D43 06:BD33: 04
	.byte $04					;- D 0 - - - 0x019D44 06:BD34: 04
	.byte $04					;- D 0 - - - 0x019D45 06:BD35: 04
	.byte $04					;- D 0 - - - 0x019D46 06:BD36: 04
	.byte $04					;- D 0 - - - 0x019D47 06:BD37: 04
	.byte $05					;- D 0 - - - 0x019D48 06:BD38: 05
	.byte $05					;- D 0 - - - 0x019D49 06:BD39: 05
	.byte $05					;- D 0 - - - 0x019D4A 06:BD3A: 05
	.byte $05					;- D 0 - - - 0x019D4B 06:BD3B: 05
	.byte $06					;- - - - - - 0x019D4C 06:BD3C: 06
	.byte $06					;- - - - - - 0x019D4D 06:BD3D: 06
	.byte $06					;- - - - - - 0x019D4E 06:BD3E: 06
	.byte $06					;- - - - - - 0x019D4F 06:BD3F: 06
	.byte $06					;- - - - - - 0x019D50 06:BD40: 06
	.byte $06					;- - - - - - 0x019D51 06:BD41: 06
	.byte $07					;- - - - - - 0x019D52 06:BD42: 07
	.byte $07					;- - - - - - 0x019D53 06:BD43: 07
	.byte $07					;- - - - - - 0x019D54 06:BD44: 07
	.byte $07					;- - - - - - 0x019D55 06:BD45: 07
	.byte $07					;- - - - - - 0x019D56 06:BD46: 07
	.byte $08					;- - - - - - 0x019D57 06:BD47: 08
	.byte $08					;- - - - - - 0x019D58 06:BD48: 08
	.byte $08					;- - - - - - 0x019D59 06:BD49: 08
	.byte $08					;- - - - - - 0x019D5A 06:BD4A: 08
	.byte $08					;- - - - - - 0x019D5B 06:BD4B: 08
	.byte $09					;- - - - - - 0x019D5C 06:BD4C: 09
	.byte $09					;- - - - - - 0x019D5D 06:BD4D: 09
	.byte $09					;- - - - - - 0x019D5E 06:BD4E: 09
	.byte $09					;- - - - - - 0x019D5F 06:BD4F: 09
	.byte $00					;- - - - - - 0x019D60 06:BD50: 00
	.byte $00					;- - - - - - 0x019D61 06:BD51: 00
	.byte $00					;- - - - - - 0x019D62 06:BD52: 00
	.byte $00					;- - - - - - 0x019D63 06:BD53: 00

DATA_0CBD54:
	.byte $00					;- D 0 - - - 0x019D64 06:BD54: 00
	.byte $00					;- D 0 - - - 0x019D65 06:BD55: 00
	.byte $01					;- D 0 - - - 0x019D66 06:BD56: 01
	.byte $01					;- D 0 - - - 0x019D67 06:BD57: 01
	.byte $02					;- D 0 - - - 0x019D68 06:BD58: 02
	.byte $02					;- D 0 - - - 0x019D69 06:BD59: 02
	.byte $03					;- D 0 - - - 0x019D6A 06:BD5A: 03
	.byte $03					;- D 0 - - - 0x019D6B 06:BD5B: 03
	.byte $03					;- D 0 - - - 0x019D6C 06:BD5C: 03
	.byte $04					;- D 0 - - - 0x019D6D 06:BD5D: 04
	.byte $04					;- D 0 - - - 0x019D6E 06:BD5E: 04
	.byte $04					;- D 0 - - - 0x019D6F 06:BD5F: 04
	.byte $05					;- D 0 - - - 0x019D70 06:BD60: 05
	.byte $05					;- D 0 - - - 0x019D71 06:BD61: 05
	.byte $06					;- D 0 - - - 0x019D72 06:BD62: 06
	.byte $06					;- D 0 - - - 0x019D73 06:BD63: 06
	.byte $06					;- D 0 - - - 0x019D74 06:BD64: 06
	.byte $07					;- D 0 - - - 0x019D75 06:BD65: 07
	.byte $07					;- D 0 - - - 0x019D76 06:BD66: 07
	.byte $07					;- D 0 - - - 0x019D77 06:BD67: 07
	.byte $08					;- D 0 - - - 0x019D78 06:BD68: 08
	.byte $08					;- D 0 - - - 0x019D79 06:BD69: 08
	.byte $09					;- D 0 - - - 0x019D7A 06:BD6A: 09
	.byte $09					;- D 0 - - - 0x019D7B 06:BD6B: 09
	.byte $00					;- D 0 - - - 0x019D7C 06:BD6C: 00
	.byte $00					;- D 0 - - - 0x019D7D 06:BD6D: 00

DATA_0CBD6E:
	.byte $00					;- D 0 - - - 0x019D7E 06:BD6E: 00
	.byte $01					;- D 0 - - - 0x019D7F 06:BD6F: 01
	.byte $02					;- D 0 - - - 0x019D80 06:BD70: 02
	.byte $03					;- D 0 - - - 0x019D81 06:BD71: 03
	.byte $04					;- D 0 - - - 0x019D82 06:BD72: 04
	.byte $04					;- D 0 - - - 0x019D83 06:BD73: 04
	.byte $05					;- D 0 - - - 0x019D84 06:BD74: 05
	.byte $05					;- D 0 - - - 0x019D85 06:BD75: 05
	.byte $06					;- D 0 - - - 0x019D86 06:BD76: 06
	.byte $06					;- D 0 - - - 0x019D87 06:BD77: 06
	.byte $07					;- D 0 - - - 0x019D88 06:BD78: 07
	.byte $08					;- D 0 - - - 0x019D89 06:BD79: 08
	.byte $09					;- D 0 - - - 0x019D8A 06:BD7A: 09
	.byte $00					;- D 0 - - - 0x019D8B 06:BD7B: 00

DATA_0CBD7C:
	.byte $00					;- - - - - - 0x019D8C 06:BD7C: 00
	.byte $00					;- - - - - - 0x019D8D 06:BD7D: 00
	.byte $00					;- - - - - - 0x019D8E 06:BD7E: 00
	.byte $00					;- D 0 - - - 0x019D8F 06:BD7F: 00
	.byte $00					;- D 0 - - - 0x019D90 06:BD80: 00
	.byte $00					;- D 0 - - - 0x019D91 06:BD81: 00
	.byte $00					;- D 0 - - - 0x019D92 06:BD82: 00
	.byte $FF					;- D 0 - - - 0x019D93 06:BD83: FF
	.byte $01					;- D 0 - - - 0x019D94 06:BD84: 01
	.byte $FF					;- D 0 - - - 0x019D95 06:BD85: FF
	.byte $01					;- D 0 - - - 0x019D96 06:BD86: 01
	.byte $00					;- D 0 - - - 0x019D97 06:BD87: 00
	.byte $00					;- D 0 - - - 0x019D98 06:BD88: 00
	.byte $00					;- D 0 - - - 0x019D99 06:BD89: 00
	.byte $00					;- D 0 - - - 0x019D9A 06:BD8A: 00
	.byte $00					;- D 0 - - - 0x019D9B 06:BD8B: 00
	.byte $00					;- D 0 - - - 0x019D9C 06:BD8C: 00
	.byte $00					;- D 0 - - - 0x019D9D 06:BD8D: 00
	.byte $00					;- D 0 - - - 0x019D9E 06:BD8E: 00
	.byte $F8					;- D 0 - - - 0x019D9F 06:BD8F: F8
	.byte $07					;- D 0 - - - 0x019DA0 06:BD90: 07
	.byte $F9					;- D 0 - - - 0x019DA1 06:BD91: F9
	.byte $08					;- D 0 - - - 0x019DA2 06:BD92: 08
	.byte $F9					;- D 0 - - - 0x019DA3 06:BD93: F9
	.byte $08					;- D 0 - - - 0x019DA4 06:BD94: 08
	.byte $F8					;- D 0 - - - 0x019DA5 06:BD95: F8
	.byte $07					;- D 0 - - - 0x019DA6 06:BD96: 07
	.byte $03					;- D 0 - - - 0x019DA7 06:BD97: 03
	.byte $03					;- D 0 - - - 0x019DA8 06:BD98: 03

DATA_0CBD99:
	.byte $00					;- - - - - - 0x019DA9 06:BD99: 00
	.byte $00					;- - - - - - 0x019DAA 06:BD9A: 00
	.byte $00					;- - - - - - 0x019DAB 06:BD9B: 00
	.byte $FF					;- D 0 - - - 0x019DAC 06:BD9C: FF
	.byte $01					;- D 0 - - - 0x019DAD 06:BD9D: 01
	.byte $FF					;- D 0 - - - 0x019DAE 06:BD9E: FF
	.byte $01					;- D 0 - - - 0x019DAF 06:BD9F: 01
	.byte $00					;- D 0 - - - 0x019DB0 06:BDA0: 00
	.byte $00					;- D 0 - - - 0x019DB1 06:BDA1: 00
	.byte $00					;- D 0 - - - 0x019DB2 06:BDA2: 00
	.byte $00					;- D 0 - - - 0x019DB3 06:BDA3: 00
	.byte $00					;- D 0 - - - 0x019DB4 06:BDA4: 00
	.byte $00					;- D 0 - - - 0x019DB5 06:BDA5: 00
	.byte $00					;- D 0 - - - 0x019DB6 06:BDA6: 00
	.byte $00					;- D 0 - - - 0x019DB7 06:BDA7: 00
	.byte $FF					;- D 0 - - - 0x019DB8 06:BDA8: FF
	.byte $01					;- D 0 - - - 0x019DB9 06:BDA9: 01
	.byte $FF					;- D 0 - - - 0x019DBA 06:BDAA: FF
	.byte $01					;- D 0 - - - 0x019DBB 06:BDAB: 01
	.byte $F8					;- D 0 - - - 0x019DBC 06:BDAC: F8
	.byte $08					;- D 0 - - - 0x019DBD 06:BDAD: 08
	.byte $F8					;- D 0 - - - 0x019DBE 06:BDAE: F8
	.byte $08					;- D 0 - - - 0x019DBF 06:BDAF: 08
	.byte $F8					;- D 0 - - - 0x019DC0 06:BDB0: F8
	.byte $08					;- D 0 - - - 0x019DC1 06:BDB1: 08
	.byte $F8					;- D 0 - - - 0x019DC2 06:BDB2: F8
	.byte $08					;- D 0 - - - 0x019DC3 06:BDB3: 08
	.byte $00					;- D 0 - - - 0x019DC4 06:BDB4: 00
	.byte $00					;- D 0 - - - 0x019DC5 06:BDB5: 00

EnemyDefaultAnims:
	.byte $00					;- - - - - - 0x019DC6 06:BDB6: 00
	.byte anZenChanL_ID					;- D 0 - - - 0x019DC7 06:BDB7: 3C
	.byte anZenChanR_ID					;- D 0 - - - 0x019DC8 06:BDB8: 3D
	.byte anZenChanL_ID					;- - - - - - 0x019DC9 06:BDB9: 3C
	.byte anZenChanR_ID					;- - - - - - 0x019DCA 06:BDBA: 3D
	.byte anBanebouL_ID					;- - - - - - 0x019DCB 06:BDBB: 43
	.byte anBanebouR_ID					;- - - - - - 0x019DCC 06:BDBC: 44
	.byte anBlobbyL_ID					;- - - - - - 0x019DCD 06:BDBD: 45
	.byte anBlobbyR_ID					;- - - - - - 0x019DCE 06:BDBE: 46
	.byte anPulpul_ID					;- D 0 - - - 0x019DCF 06:BDBF: 47
	.byte anPulpul_ID					;- D 0 - - - 0x019DD0 06:BDC0: 47
	.byte anNeedler_ID					;- - - - - - 0x019DD1 06:BDC1: 40
	.byte anNeedler_ID					;- - - - - - 0x019DD2 06:BDC2: 40
	.byte anInvader_ID					;- D 0 - - - 0x019DD3 06:BDC3: 48
	.byte anInvader_ID					;- D 0 - - - 0x019DD4 06:BDC4: 48
	.byte anMonstaL_ID					;- D 0 - - - 0x019DD5 06:BDC5: 3E
	.byte anMonstaR_ID					;- D 0 - - - 0x019DD6 06:BDC6: 3F
	.byte anHeitaiKunL_ID					;- D 0 - - - 0x019DD7 06:BDC7: 49
	.byte anHeitaiKunR_ID					;- D 0 - - - 0x019DD8 06:BDC8: 4A
	.byte anCarryHeliL_ID					;- - - - - - 0x019DD9 06:BDC9: 4B
	.byte anCarryHeliR_ID					;- - - - - - 0x019DDA 06:BDCA: 4C
	.byte anFlarion_ID					;- - - - - - 0x019DDB 06:BDCB: 4D
	.byte anFlarion_ID					;- - - - - - 0x019DDC 06:BDCC: 4D
	.byte anSnaggerL_ID					;- - - - - - 0x019DDD 06:BDCD: 41
	.byte anSnaggerR_ID					;- - - - - - 0x019DDE 06:BDCE: 42
	.byte anManticharL_ID					;- D 0 - - - 0x019DDF 06:BDCF: 4E
	.byte anManticharR_ID					;- D 0 - - - 0x019DE0 06:BDD0: 4F
	.byte anRoboZenL_ID					;- D 0 - - - 0x019DE1 06:BDD1: 50
	.byte anRoboZenR_ID					;- D 0 - - - 0x019DE2 06:BDD2: 51
	.byte anKirikabun_ID					;- - - - - - 0x019DE3 06:BDD3: 54
	.byte anKirikabun_ID					;- - - - - - 0x019DE4 06:BDD4: 54
	.byte anTwizzerSpin_ID					;- - - - - - 0x019DE5 06:BDD5: 57
	.byte anTwizzerSpin_ID					;- - - - - - 0x019DE6 06:BDD6: 57
	.byte anDrunkL_ID					;- - - - - - 0x019DE7 06:BDD7: 58
	.byte anDrunkR_ID					;- - - - - - 0x019DE8 06:BDD8: 59
	.byte anSpringitR_ID					;- - - - - - 0x019DE9 06:BDD9: 39
	.byte anSpringitL_ID					;- - - - - - 0x019DEA 06:BDDA: 3B
	.byte anSpringitBodyR_ID					;- - - - - - 0x019DEB 06:BDDB: 38
	.byte anSpringitBodyL_ID					;- - - - - - 0x019DEC 06:BDDC: 3A
	.byte anSpringitL_ID					;- D 0 - - - 0x019DED 06:BDDD: 3B
	.byte anSpringitR_ID					;- D 0 - - - 0x019DEE 06:BDDE: 39
	.byte anSpringitBodyL_ID					;- D 0 - - - 0x019DEF 06:BDDF: 3A
	.byte anSpringitBodyR_ID					;- D 0 - - - 0x019DF0 06:BDE0: 38
	.byte $00					;- - - - - - 0x019DF1 06:BDE1: 00
	.byte $00					;- - - - - - 0x019DF2 06:BDE2: 00
	.byte anChuckerL_ID					;- - - - - - 0x019DF3 06:BDE3: BF
	.byte anChuckerR_ID					;- - - - - - 0x019DF4 06:BDE4: C0
	.byte anChuckerL_ID					;- - - - - - 0x019DF5 06:BDE5: BF
	.byte anChuckerR_ID					;- - - - - - 0x019DF6 06:BDE6: C0
	.byte $00					;- - - - - - 0x019DF7 06:BDE7: 00
	.byte $00					;- - - - - - 0x019DF8 06:BDE8: 00
	.byte $00					;- - - - - - 0x019DF9 06:BDE9: 00
	.byte $00					;- - - - - - 0x019DFA 06:BDEA: 00
	.byte $00					;- - - - - - 0x019DFB 06:BDEB: 00
	.byte $00					;- - - - - - 0x019DFC 06:BDEC: 00
	.byte $00					;- - - - - - 0x019DFD 06:BDED: 00
	.byte $00					;- - - - - - 0x019DFE 06:BDEE: 00
	.byte $00					;- - - - - - 0x019DFF 06:BDEF: 00
	.byte $00					;- - - - - - 0x019E00 06:BDF0: 00
	.byte $00					;- - - - - - 0x019E01 06:BDF1: 00
	.byte $00					;- - - - - - 0x019E02 06:BDF2: 00
	.byte $00					;- - - - - - 0x019E03 06:BDF3: 00
	.byte $00					;- - - - - - 0x019E04 06:BDF4: 00
	.byte $00					;- - - - - - 0x019E05 06:BDF5: 00
	.byte $00					;- - - - - - 0x019E06 06:BDF6: 00
	.byte $00					;- - - - - - 0x019E07 06:BDF7: 00
	.byte $00					;- - - - - - 0x019E08 06:BDF8: 00
	.byte $00					;- - - - - - 0x019E09 06:BDF9: 00
	.byte $00					;- - - - - - 0x019E0A 06:BDFA: 00
	.byte $00					;- - - - - - 0x019E0B 06:BDFB: 00
	.byte $00					;- - - - - - 0x019E0C 06:BDFC: 00
	.byte $00					;- - - - - - 0x019E0D 06:BDFD: 00
	.byte $00					;- - - - - - 0x019E0E 06:BDFE: 00
	.byte anGhostMonstaL_ID					;- D 0 - - - 0x019E0F 06:BDFF: 6E
	.byte anGhostMonstaR_ID					;- D 0 - - - 0x019E10 06:BE00: 6F

DATA_0CBE01:
	.byte $00					;- D 0 - - - 0x019E11 06:BE01: 00
	.byte $01					;- D 0 - - - 0x019E12 06:BE02: 01
	.byte $06					;- D 0 - - - 0x019E13 06:BE03: 06
	.byte $0B					;- D 0 - - - 0x019E14 06:BE04: 0B
	.byte $10					;- D 0 - - - 0x019E15 06:BE05: 10
	.byte $12					;- D 0 - - - 0x019E16 06:BE06: 12
	.byte $14					;- D 0 - - - 0x019E17 06:BE07: 14
	.byte $19					;- D 0 - - - 0x019E18 06:BE08: 19
	.byte $01					;- D 0 - - - 0x019E19 06:BE09: 01
	.byte $00					;- D 0 - - - 0x019E1A 06:BE0A: 00
	.byte $00					;- D 0 - - - 0x019E1B 06:BE0B: 00
	.byte $20					;- D 0 - - - 0x019E1C 06:BE0C: 20
	.byte $00					;- D 0 - - - 0x019E1D 06:BE0D: 00
	.byte $01					;- D 0 - - - 0x019E1E 06:BE0E: 01
	.byte $00					;- D 0 - - - 0x019E1F 06:BE0F: 00
	.byte $00					;- D 0 - - - 0x019E20 06:BE10: 00
	.byte $01					;- D 0 - - - 0x019E21 06:BE11: 01
	.byte $00					;- - - - - - 0x019E22 06:BE12: 00
	.byte $1A					;- D 0 - - - 0x019E23 06:BE13: 1A
	.byte $00					;- D 0 - - - 0x019E24 06:BE14: 00
	.byte $00					;- D 0 - - - 0x019E25 06:BE15: 00
	.byte $00					;- D 0 - - - 0x019E26 06:BE16: 00
	.byte $00					;- - - - - - 0x019E27 06:BE17: 00
	.byte $00					;- D 0 - - - 0x019E28 06:BE18: 00
	.byte $00					;- - - - - - 0x019E29 06:BE19: 00
	.byte $01					;- D 0 - - - 0x019E2A 06:BE1A: 01
	.byte $00					;- D 0 - - - 0x019E2B 06:BE1B: 00
	.byte $00					;- D 0 - - - 0x019E2C 06:BE1C: 00
	.byte $2E					;- - - - - - 0x019E2D 06:BE1D: 2E
	.byte $19					;- D 0 - - - 0x019E2E 06:BE1E: 19
	.byte $19					;- D 0 - - - 0x019E2F 06:BE1F: 19
	.byte $19					;- D 0 - - - 0x019E30 06:BE20: 19
	.byte $00					;- - - - - - 0x019E31 06:BE21: 00
	.byte $00					;- D 0 - - - 0x019E32 06:BE22: 00
	.byte $00					;- - - - - - 0x019E33 06:BE23: 00
	.byte $00					;- - - - - - 0x019E34 06:BE24: 00
	.byte $19					;- D 0 - - - 0x019E35 06:BE25: 19
	.byte $CD					;- - - - - - 0x019E36 06:BE26: CD
	.byte $CC					;- - - - - - 0x019E37 06:BE27: CC
	.byte $CB					;- - - - - - 0x019E38 06:BE28: CB
	.byte $CA					;- - - - - - 0x019E39 06:BE29: CA
	.byte $C9					;- - - - - - 0x019E3A 06:BE2A: C9
	.byte $C8					;- - - - - - 0x019E3B 06:BE2B: C8
	.byte $C7					;- - - - - - 0x019E3C 06:BE2C: C7
	.byte $C6					;- - - - - - 0x019E3D 06:BE2D: C6

DATA_0CBE2E:
	.byte $00					;- - - - - - 0x019E3E 06:BE2E: 00
	.byte $00					;- D 0 - - - 0x019E3F 06:BE2F: 00
	.byte $10					;- D 0 - - - 0x019E40 06:BE30: 10
	.byte $20					;- D 0 - - - 0x019E41 06:BE31: 20
	.byte $30					;- D 0 - - - 0x019E42 06:BE32: 30

DATA_0CBE33:
	.byte $00					;- - - - - - 0x019E43 06:BE33: 00
	.byte $00					;- - - - - - 0x019E44 06:BE34: 00
	.byte $00					;- - - - - - 0x019E45 06:BE35: 00
	.byte anBlobbyL_ID					;- D 0 - - - 0x019E46 06:BE36: 45
	.byte anBlobbyR_ID					;- D 0 - - - 0x019E47 06:BE37: 46
	.byte anBlobbyCeilL_ID					;- D 0 - - - 0x019E48 06:BE38: 77
	.byte anBlobbyCeilR_ID					;- D 0 - - - 0x019E49 06:BE39: 78
	.byte anBlobbyUpL_ID					;- D 0 - - - 0x019E4A 06:BE3A: 7D
	.byte anBlobbyDownL_ID					;- D 0 - - - 0x019E4B 06:BE3B: 81
	.byte anBlobbyUpR_ID					;- D 0 - - - 0x019E4C 06:BE3C: 7E
	.byte anBlobbyDownR_ID					;- D 0 - - - 0x019E4D 06:BE3D: 82
	.byte anBlobbyFlyDownL_ID					;- D 0 - - - 0x019E4E 06:BE3E: 7F
	.byte anBlobbyFlyDownL_ID					;- D 0 - - - 0x019E4F 06:BE3F: 7F
	.byte anBlobbyFlyUpL_ID					;- D 0 - - - 0x019E50 06:BE40: 83
	.byte anBlobbyFlyUpL_ID					;- D 0 - - - 0x019E51 06:BE41: 83
	.byte anBlobbyFlyUpR_ID					;- D 0 - - - 0x019E52 06:BE42: 84
	.byte anBlobbyFlyUpR_ID					;- D 0 - - - 0x019E53 06:BE43: 84
	.byte anBlobbyFlyDownR_ID					;- D 0 - - - 0x019E54 06:BE44: 80
	.byte anBlobbyFlyDownR_ID					;- D 0 - - - 0x019E55 06:BE45: 80
	.byte anBlobbyUnderR_ID					;- D 0 - - - 0x019E56 06:BE46: 7C
	.byte anBlobbyUnderR_ID					;- D 0 - - - 0x019E57 06:BE47: 7C
	.byte anBlobbyOverR_ID					;- D 0 - - - 0x019E58 06:BE48: 7A
	.byte anBlobbyOverR_ID					;- D 0 - - - 0x019E59 06:BE49: 7A
	.byte anBlobbyOverL_ID					;- D 0 - - - 0x019E5A 06:BE4A: 79
	.byte anBlobbyOverL_ID					;- D 0 - - - 0x019E5B 06:BE4B: 79
	.byte anBlobbyUnderL_ID					;- D 0 - - - 0x019E5C 06:BE4C: 7B
	.byte anBlobbyUnderL_ID					;- D 0 - - - 0x019E5D 06:BE4D: 7B
	.byte anBlobbyL_ID					;- D 0 - - - 0x019E5E 06:BE4E: 45
	.byte anBlobbyR_ID					;- D 0 - - - 0x019E5F 06:BE4F: 46

;Filler data
.ifdef REGION_JP
	;- - - - - - 0x019FAA 06:BF9A: 3E
	.incbin "filler/fill0C_JP.bin"
.else
	;- - - - - - 0x019E60 06:BE50: 00
	.incbin "filler/fill0C.bin"
.endif