.segment "PRG_BANK_6"
; 0x00C010-0x00E00F

;Contents: Air flow data, Multi-projectiles, Cutscene actor scripts

RoundsFlowTable:
	;- - - - - - 0x00C010 03:A000: A8
	.word flowRound01
	.word flowRound01
	.word flowRound02
	.word flowRound03
	.word flowRound04
	.word flowRound05
	.word flowRound06
	.word flowRound07
	.word flowRound08
	.word flowRound09
	.word flowRound10
	.word flowRound11
	.word flowRound12
	.word flowRound13
	.word flowRound14
	.word flowRound15
	.word flowRound16
	.word flowRound17
	.word flowRound18
	.word flowRound19
	.word flowRound19
	.word flowRound21
	.word flowRound22
	.word flowRound23
	.word flowRound24
	.word flowRound25
	.word flowRound26
	.word flowRound27
	.word flowRound28
	.word flowRound29
	.word flowRound30
	.word flowRound31
	.word flowRound32
	.word flowRound33
	.word flowRound34
	.word flowRound35
	.word flowRound36
	.word flowRound37
	.word flowRound38
	.word flowRound39
	.word flowRound40
	.word flowRound41
	.word flowRound42
	.word flowRound43
	.word flowRound44
	.word flowRound45
	.word flowRound46
	.word flowRound47
	.word flowRound48
	.word flowRound49
	.word flowRound50
	.word flowRound51
	.word flowRound52
	.word flowRound53
	.word flowRound54
	.word flowRound55
	.word flowRound56
	.word flowRound57
	.word flowRound58
	.word flowRound59
	.word flowRound48
	.word flowRound61
	.word flowRound62
	.word flowRound63
	.word flowRound64
	.word flowRound65
	.word flowRound66
	.word flowRound67
	.word flowRound68
	.word flowRound69
	.word flowRound70
	.word flowRound71
	.word flowRound72
	.word flowRound73
	.word flowRound74
	.word flowRound75
	.word flowRound76
	.word flowRound77
	.word flowRound78
	.word flowRound79
	.word flowRound79

DATA_06A0A2:
.ifdef REGION_JP
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
.else
	.byte $6E					;- - - - - - 0x00C0B2 03:A0A2: 6E
	.byte $4F					;- - - - - - 0x00C0B3 03:A0A3: 4F
	.byte $73					;- - - - - - 0x00C0B4 03:A0A4: 73
	.byte $4F					;- - - - - - 0x00C0B5 03:A0A5: 4F
	.byte $78					;- - - - - - 0x00C0B6 03:A0A6: 78
	.byte $4F					;- - - - - - 0x00C0B7 03:A0A7: 4F
.endif

flowRound01:
	;- - - - - - 0x00C0B8 03:A0A8: C0
	.incbin "flow/flowRound01.bin"

flowRound02:
	;- - - - - - 0x00C0F8 03:A0E8: C0
	.incbin "flow/flowRound02.bin"

flowRound03:
.ifdef JP_AIRFLOW
	;- - - - - - 0x00C138 03:A128: D5
	.incbin "flow/flowRound03_JP.bin"
.else
	;- - - - - - 0x00C138 03:A128: C0
	.incbin "flow/flowRound03.bin"
.endif

flowRound04:
	;- - - - - - 0x00C178 03:A168: C0
	.incbin "flow/flowRound04.bin"

flowRound05:
	;- - - - - - 0x00C1B8 03:A1A8: C0
	.incbin "flow/flowRound05.bin"

flowRound06:
.ifdef JP_AIRFLOW
	;- - - - - - 0x00C1F8 03:A1E8: C0
	.incbin "flow/flowRound06_JP.bin"
.else
	;- - - - - - 0x00C1F8 03:A1E8: C0
	.incbin "flow/flowRound06.bin"
.endif

flowRound07:
	;- - - - - - 0x00C238 03:A228: C0
	.incbin "flow/flowRound07.bin"

flowRound08:
	;- - - - - - 0x00C278 03:A268: C0
	.incbin "flow/flowRound08.bin"

flowRound09:
	;- - - - - - 0x00C2B8 03:A2A8: C0
	.incbin "flow/flowRound09.bin"

flowRound10:
	;- D 0 - - - 0x00C2F8 03:A2E8: C0
	.incbin "flow/flowRound10.bin"

flowRound11:
	;- - - - - - 0x00C338 03:A328: 55
	.incbin "flow/flowRound11.bin"

flowRound12:
	;- - - - - - 0x00C378 03:A368: C0
	.incbin "flow/flowRound12.bin"

flowRound13:
	;- - - - - - 0x00C3B8 03:A3A8: C0
	.incbin "flow/flowRound13.bin"

flowRound14:
	;- - - - - - 0x00C3F8 03:A3E8: C0
	.incbin "flow/flowRound14.bin"

flowRound15:
.ifdef JP_AIRFLOW
	;- - - - - - 0x00C438 03:A428: D5
	.incbin "flow/flowRound15_JP.bin"
.else
	;- - - - - - 0x00C438 03:A428: C0
	.incbin "flow/flowRound15.bin"
.endif

flowRound16:
	;- - - - - - 0x00C478 03:A468: C0
	.incbin "flow/flowRound16.bin"

flowRound17:
	;- D 0 - - - 0x00C4B8 03:A4A8: 00
	.incbin "flow/flowRound17.bin"

flowRound18:
	;- - - - - - 0x00C4F8 03:A4E8: C0
	.incbin "flow/flowRound18.bin"

flowRound19:
	;- D 0 - - - 0x00C538 03:A528: C0
	.incbin "flow/flowRound19.bin"

flowRound21:
	;- - - - - - 0x00C578 03:A568: C0
	.incbin "flow/flowRound21.bin"

flowRound22:
	;- D 0 - - - 0x00C5B8 03:A5A8: C0
	.incbin "flow/flowRound22.bin"

flowRound23:
	;- - - - - - 0x00C5F8 03:A5E8: C0
	.incbin "flow/flowRound23.bin"

flowRound24:
	;- - - - - - 0x00C638 03:A628: C0
	.incbin "flow/flowRound24.bin"

flowRound25:
.ifdef JP_AIRFLOW
	;- - - - - - 0x00C678 03:A668: D5
	.incbin "flow/flowRound25_JP.bin"
.else
	;- D 0 - - - 0x00C678 03:A668: C0
	.incbin "flow/flowRound25.bin"
.endif

flowRound26:
.ifdef JP_AIRFLOW
	;- - - - - - 0x00C6B8 03:A6A8: D5
	.incbin "flow/flowRound26_JP.bin"
.else
	;- - - - - - 0x00C6B8 03:A6A8: C0
	.incbin "flow/flowRound26.bin"
.endif

flowRound27:
	;- D 0 - - - 0x00C6F8 03:A6E8: C0
	.incbin "flow/flowRound27.bin"

flowRound28:
	;- - - - - - 0x00C738 03:A728: 00
	.incbin "flow/flowRound28.bin"

flowRound29:
	;- D 0 - - - 0x00C778 03:A768: 00
	.incbin "flow/flowRound29.bin"

flowRound30:
	;- D 0 - - - 0x00C7B8 03:A7A8: C0
	.incbin "flow/flowRound30.bin"

flowRound31:
.ifdef JP_AIRFLOW
	;- - - - - - 0x00C7F8 03:A7E8: D5
	.incbin "flow/flowRound31_JP.bin"
.else
	;- - - - - - 0x00C7F8 03:A7E8: C0
	.incbin "flow/flowRound31.bin"
.endif

flowRound32:
	;- - - - - - 0x00C838 03:A828: C0
	.incbin "flow/flowRound32.bin"

flowRound33:
	;- - - - - - 0x00C878 03:A868: C0
	.incbin "flow/flowRound33.bin"

flowRound34:
	;- - - - - - 0x00C8B8 03:A8A8: C0
	.incbin "flow/flowRound34.bin"

flowRound35:
.ifdef JP_AIRFLOW
	;- - - - - - 0x00C8F8 03:A8E8: D5
	.incbin "flow/flowRound35_JP.bin"
.else
	;- - - - - - 0x00C8F8 03:A8E8: C0
	.incbin "flow/flowRound35.bin"
.endif

flowRound36:
	;- - - - - - 0x00C938 03:A928: C0
	.incbin "flow/flowRound36.bin"

flowRound37:
	;- - - - - - 0x00C978 03:A968: C0
	.incbin "flow/flowRound37.bin"

flowRound38:
.ifdef JP_AIRFLOW
	;- - - - - - 0x00C9B8 03:A9A8: C0
	.incbin "flow/flowRound38_JP.bin"
.else
	;- - - - - - 0x00C9B8 03:A9A8: 00
	.incbin "flow/flowRound38.bin"
.endif

flowRound39:
	;- - - - - - 0x00C9F8 03:A9E8: C0
	.incbin "flow/flowRound39.bin"

flowRound40:
	;- D 0 - - - 0x00CA38 03:AA28: C0
	.incbin "flow/flowRound40.bin"

flowRound41:
	;- - - - - - 0x00CA78 03:AA68: C0
	.incbin "flow/flowRound41.bin"

flowRound42:
	;- - - - - - 0x00CAB8 03:AAA8: C0
	.incbin "flow/flowRound42.bin"

flowRound43:
	;- - - - - - 0x00CAF8 03:AAE8: 00
	.incbin "flow/flowRound43.bin"

flowRound44:
	;- - - - - - 0x00CB38 03:AB28: C0
	.incbin "flow/flowRound44.bin"

flowRound45:
	;- - - - - - 0x00CB78 03:AB68: C0
	.incbin "flow/flowRound45.bin"

flowRound46:
	;- D 0 - - - 0x00CBB8 03:ABA8: C0
	.incbin "flow/flowRound46.bin"

flowRound47:
	;- - - - - - 0x00CBF8 03:ABE8: C0
	.incbin "flow/flowRound47.bin"

flowRound49:
	;- - - - - - 0x00CC38 03:AC28: C0
	.incbin "flow/flowRound49.bin"

flowRound50:
	;- - - - - - 0x00CC78 03:AC68: 00
	.incbin "flow/flowRound50.bin"

flowRound51:
	;- - - - - - 0x00CCB8 03:ACA8: C0
	.incbin "flow/flowRound51.bin"

flowRound52:
	;- - - - - - 0x00CCF8 03:ACE8: D5
	.incbin "flow/flowRound52.bin"

flowRound53:
	;- - - - - - 0x00CD38 03:AD28: C0
	.incbin "flow/flowRound53.bin"

flowRound54:
	;- - - - - - 0x00CD78 03:AD68: C0
	.incbin "flow/flowRound54.bin"

flowRound55:
	;- - - - - - 0x00CDB8 03:ADA8: C0
	.incbin "flow/flowRound55.bin"

flowRound56:
	;- - - - - - 0x00CDF8 03:ADE8: C0
	.incbin "flow/flowRound56.bin"

flowRound57:
	;- - - - - - 0x00CE38 03:AE28: C0
	.incbin "flow/flowRound57.bin"

flowRound58:
	;- - - - - - 0x00CE78 03:AE68: C0
	.incbin "flow/flowRound58.bin"

flowRound59:
	;- - - - - - 0x00CEB8 03:AEA8: C0
	.incbin "flow/flowRound59.bin"

flowRound48:
	;- D 0 - - - 0x00CEF8 03:AEE8: 00
	.incbin "flow/flowRound48.bin"

flowRound61:
	;- - - - - - 0x00CF38 03:AF28: C0
	.incbin "flow/flowRound61.bin"

flowRound62:
	;- - - - - - 0x00CF78 03:AF68: C0
	.incbin "flow/flowRound62.bin"

flowRound63:
	;- - - - - - 0x00CFB8 03:AFA8: C0
	.incbin "flow/flowRound63.bin"

flowRound64:
	;- D 0 - - - 0x00CFF8 03:AFE8: C0
	.incbin "flow/flowRound64.bin"

flowRound65:
	;- D 0 - - - 0x00D038 03:B028: C0
	.incbin "flow/flowRound65.bin"

flowRound66:
	;- - - - - - 0x00D078 03:B068: C0
	.incbin "flow/flowRound66.bin"

flowRound67:
	;- - - - - - 0x00D0B8 03:B0A8: C0
	.incbin "flow/flowRound67.bin"

flowRound68:
	;- D 0 - - - 0x00D0F8 03:B0E8: C0
	.incbin "flow/flowRound68.bin"

flowRound69:
	;- - - - - - 0x00D138 03:B128: C0
	.incbin "flow/flowRound69.bin"

flowRound70:
	;- - - - - - 0x00D178 03:B168: C0
	.incbin "flow/flowRound70.bin"

flowRound71:
	;- - - - - - 0x00D1B8 03:B1A8: C0
	.incbin "flow/flowRound71.bin"

flowRound72:
.ifdef JP_AIRFLOW
	;- - - - - - 0x00D1F8 03:B1E8: 55
	.incbin "flow/flowRound72_JP.bin"
.else
	;- - - - - - 0x00D1F8 03:B1E8: 00
	.incbin "flow/flowRound72.bin"
.endif

flowRound73:
	;- - - - - - 0x00D238 03:B228: C0
	.incbin "flow/flowRound73.bin"

flowRound74:
	;- - - - - - 0x00D278 03:B268: C0
	.incbin "flow/flowRound74.bin"

flowRound75:
	;- - - - - - 0x00D2B8 03:B2A8: C0
	.incbin "flow/flowRound75.bin"

flowRound76:
	;- - - - - - 0x00D2F8 03:B2E8: C0
	.incbin "flow/flowRound76.bin"

flowRound77:
	;- - - - - - 0x00D338 03:B328: C0
	.incbin "flow/flowRound77.bin"

flowRound78:
	;- - - - - - 0x00D378 03:B368: C0
	.incbin "flow/flowRound78.bin"

flowRound79:
	;- D 0 - - - 0x00D3B8 03:B3A8: C0
	.incbin "flow/flowRound79.bin"

DATA_06B3E8:
	.byte $00					;- - - - - - 0x00D3F8 03:B3E8: 00
	.byte $00					;- D 0 - - - 0x00D3F9 03:B3E9: 00
	.byte $00					;- D 0 - - - 0x00D3FA 03:B3EA: 00
	.byte $00					;- D 0 - - - 0x00D3FB 03:B3EB: 00
	.byte $00					;- D 0 - - - 0x00D3FC 03:B3EC: 00
	.byte $04					;- D 0 - - - 0x00D3FD 03:B3ED: 04
	.byte $04					;- D 0 - - - 0x00D3FE 03:B3EE: 04
	.byte $00					;- D 0 - - - 0x00D3FF 03:B3EF: 00
	.byte $00					;- D 0 - - - 0x00D400 03:B3F0: 00
	.byte $04					;- D 0 - - - 0x00D401 03:B3F1: 04
	.byte $04					;- D 0 - - - 0x00D402 03:B3F2: 04
	.byte $00					;- D 0 - - - 0x00D403 03:B3F3: 00
	.byte $04					;- D 0 - - - 0x00D404 03:B3F4: 04
	.byte $00					;- D 0 - - - 0x00D405 03:B3F5: 00
	.byte $08					;- D 0 - - - 0x00D406 03:B3F6: 08
	.byte $00					;- D 0 - - - 0x00D407 03:B3F7: 00
	.byte $04					;- D 0 - - - 0x00D408 03:B3F8: 04
	.byte $00					;- D 0 - - - 0x00D409 03:B3F9: 00
	.byte $00					;- D 0 - - - 0x00D40A 03:B3FA: 00
	.byte $04					;- D 0 - - - 0x00D40B 03:B3FB: 04
	.byte $04					;- D 0 - - - 0x00D40C 03:B3FC: 04
	.byte $00					;- D 0 - - - 0x00D40D 03:B3FD: 00
	.byte $00					;- D 0 - - - 0x00D40E 03:B3FE: 00
	.byte $00					;- D 0 - - - 0x00D40F 03:B3FF: 00
	.byte $00					;- D 0 - - - 0x00D410 03:B400: 00
	.byte $00					;- D 0 - - - 0x00D411 03:B401: 00
	.byte $00					;- D 0 - - - 0x00D412 03:B402: 00
	.byte $04					;- D 0 - - - 0x00D413 03:B403: 04
	.byte $00					;- D 0 - - - 0x00D414 03:B404: 00
	.byte $00					;- D 0 - - - 0x00D415 03:B405: 00
	.byte $00					;- D 0 - - - 0x00D416 03:B406: 00
	.byte $00					;- D 0 - - - 0x00D417 03:B407: 00
	.byte $08					;- D 0 - - - 0x00D418 03:B408: 08
	.byte $00					;- D 0 - - - 0x00D419 03:B409: 00
	.byte $04					;- D 0 - - - 0x00D41A 03:B40A: 04
	.byte $04					;- D 0 - - - 0x00D41B 03:B40B: 04
	.byte $04					;- D 0 - - - 0x00D41C 03:B40C: 04
	.byte $08					;- D 0 - - - 0x00D41D 03:B40D: 08
	.byte $04					;- D 0 - - - 0x00D41E 03:B40E: 04
	.byte $0C					;- D 0 - - - 0x00D41F 03:B40F: 0C
	.byte $04					;- D 0 - - - 0x00D420 03:B410: 04
	.byte $00					;- D 0 - - - 0x00D421 03:B411: 00
	.byte $04					;- D 0 - - - 0x00D422 03:B412: 04
	.byte $08					;- D 0 - - - 0x00D423 03:B413: 08
	.byte $04					;- D 0 - - - 0x00D424 03:B414: 04
	.byte $00					;- D 0 - - - 0x00D425 03:B415: 00
	.byte $0C					;- D 0 - - - 0x00D426 03:B416: 0C
	.byte $04					;- D 0 - - - 0x00D427 03:B417: 04
	.byte $08					;- D 0 - - - 0x00D428 03:B418: 08
	.byte $04					;- D 0 - - - 0x00D429 03:B419: 04
	.byte $00					;- D 0 - - - 0x00D42A 03:B41A: 00
	.byte $08					;- D 0 - - - 0x00D42B 03:B41B: 08
	.byte $08					;- D 0 - - - 0x00D42C 03:B41C: 08
	.byte $08					;- D 0 - - - 0x00D42D 03:B41D: 08
	.byte $0C					;- D 0 - - - 0x00D42E 03:B41E: 0C
	.byte $00					;- D 0 - - - 0x00D42F 03:B41F: 00
	.byte $00					;- D 0 - - - 0x00D430 03:B420: 00
	.byte $00					;- D 0 - - - 0x00D431 03:B421: 00
	.byte $04					;- D 0 - - - 0x00D432 03:B422: 04
	.byte $08					;- D 0 - - - 0x00D433 03:B423: 08
	.byte $0C					;- D 0 - - - 0x00D434 03:B424: 0C
	.byte $0C					;- D 0 - - - 0x00D435 03:B425: 0C
	.byte $04					;- D 0 - - - 0x00D436 03:B426: 04
	.byte $08					;- D 0 - - - 0x00D437 03:B427: 08
	.byte $00					;- D 0 - - - 0x00D438 03:B428: 00
	.byte $04					;- D 0 - - - 0x00D439 03:B429: 04
	.byte $04					;- D 0 - - - 0x00D43A 03:B42A: 04
	.byte $04					;- D 0 - - - 0x00D43B 03:B42B: 04
	.byte $04					;- D 0 - - - 0x00D43C 03:B42C: 04
	.byte $08					;- D 0 - - - 0x00D43D 03:B42D: 08
	.byte $00					;- D 0 - - - 0x00D43E 03:B42E: 00
	.byte $04					;- D 0 - - - 0x00D43F 03:B42F: 04
	.byte $04					;- D 0 - - - 0x00D440 03:B430: 04
	.byte $04					;- D 0 - - - 0x00D441 03:B431: 04
	.byte $04					;- D 0 - - - 0x00D442 03:B432: 04
	.byte $00					;- D 0 - - - 0x00D443 03:B433: 00
	.byte $04					;- D 0 - - - 0x00D444 03:B434: 04
	.byte $04					;- D 0 - - - 0x00D445 03:B435: 04
	.byte $08					;- D 0 - - - 0x00D446 03:B436: 08
	.byte $00					;- D 0 - - - 0x00D447 03:B437: 00
	.byte $04					;- D 0 - - - 0x00D448 03:B438: 04

RoundsBubbleVariants:
	;- - - - - - 0x00D449 03:B439: 00
	.byte BUBV_REGULAR					;Round 00
	.byte BUBV_REGULAR					;Round 01
	.byte BUBV_REGULAR					;Round 02
	.byte BUBV_REGULAR					;Round 03
	.byte BUBV_WATER					;Round 04
	.byte BUBV_REGULAR					;Round 05
	.byte BUBV_REGULAR					;Round 06
	.byte BUBV_REGULAR					;Round 07
	.byte BUBV_WATER					;Round 08
	.byte BUBV_REGULAR					;Round 09
	.byte BUBV_REGULAR					;Round 10
	.byte BUBV_WATER					;Round 11
	.byte BUBV_REGULAR					;Round 12
	.byte BUBV_THUNDER					;Round 13
	.byte BUBV_REGULAR					;Round 14
	.byte BUBV_REGULAR					;Round 15
	.byte BUBV_WIND						;Round 16
	.byte BUBV_WATER					;Round 17
	.byte BUBV_FIRE						;Round 18
	.byte BUBV_STAR						;Round 19
	.byte BUBV_DRINK|BUBV_THUNDER		;Round 20
	.byte BUBV_REGULAR					;Round 21
	.byte BUBV_REGULAR					;Round 22
	.byte BUBV_THUNDER					;Round 23
	.byte BUBV_WIND						;Round 24
	.byte BUBV_WATER					;Round 25
	.byte BUBV_REGULAR					;Round 26
	.byte BUBV_WIND						;Round 27
	.byte BUBV_THUNDER					;Round 28
	.byte BUBV_WATER					;Round 29
	.byte BUBV_REGULAR					;Round 30
	.byte BUBV_REGULAR					;Round 31
	.byte BUBV_REGULAR					;Round 32
	.byte BUBV_REGULAR					;Round 33
	.byte BUBV_REGULAR					;Round 34
	.byte BUBV_WIND						;Round 35
	.byte BUBV_REGULAR					;Round 36
	.byte BUBV_REGULAR					;Round 37
	.byte BUBV_STAR						;Round 38
	.byte BUBV_REGULAR					;Round 39
	.byte BUBV_DRINK|BUBV_WIND			;Round 40
	.byte BUBV_REGULAR					;Round 41
	.byte BUBV_WIND						;Round 42
	.byte BUBV_REGULAR					;Round 43
	.byte BUBV_STAR						;Round 44
	.byte BUBV_REGULAR					;Round 45
	.byte BUBV_REGULAR					;Round 46
	.byte BUBV_REGULAR					;Round 47
	.byte BUBV_REGULAR					;Round 48
	.byte BUBV_SNOW						;Round 49
	.byte BUBV_STAR						;Round 50
	.byte BUBV_STAR						;Round 51
	.byte BUBV_REGULAR					;Round 52
	.byte BUBV_THUNDER					;Round 53
	.byte BUBV_STAR						;Round 54
	.byte BUBV_FIRE						;Round 55
	.byte BUBV_SNOW						;Round 56
	.byte BUBV_WATER					;Round 57
	.byte BUBV_REGULAR					;Round 58
	.byte BUBV_REGULAR					;Round 59
	.byte BUBV_DRINK|BUBV_STAR			;Round 60
	.byte BUBV_SNOW						;Round 61
	.byte BUBV_WIND						;Round 62
	.byte BUBV_REGULAR					;Round 63
	.byte BUBV_SNOW						;Round 64
	.byte BUBV_THUNDER					;Round 65
	.byte BUBV_REGULAR					;Round 66
	.byte BUBV_WIND						;Round 67
	.byte BUBV_REGULAR					;Round 68
	.byte BUBV_REGULAR					;Round 69
	.byte BUBV_DRINK|BUBV_SNOW			;Round 70
	.byte BUBV_REGULAR					;Round 71
	.byte BUBV_REGULAR					;Round 72
	.byte BUBV_FIRE						;Round 73
	.byte BUBV_REGULAR					;Round 74
	.byte BUBV_REGULAR					;Round 75
	.byte BUBV_REGULAR					;Round 76
	.byte BUBV_BOMB						;Round 77
	.byte BUBV_BOMB						;Round 78
	.byte BUBV_DRINK|BUBV_THUNDER		;Round 79
	.byte BUBV_DRINK|BUBV_SNOW			;Round 80

DATA_06B48A:
	.byte $00					;- - - - - - 0x00D49A 03:B48A: 00
	.byte $00					;- D 0 - - - 0x00D49B 03:B48B: 00
	.byte $00					;- D 0 - - - 0x00D49C 03:B48C: 00
	.byte $00					;- D 0 - - - 0x00D49D 03:B48D: 00
	.byte $03					;- D 0 - - - 0x00D49E 03:B48E: 03
	.byte $00					;- D 0 - - - 0x00D49F 03:B48F: 00
	.byte $00					;- D 0 - - - 0x00D4A0 03:B490: 00
	.byte $00					;- D 0 - - - 0x00D4A1 03:B491: 00
	.byte $01					;- D 0 - - - 0x00D4A2 03:B492: 01
	.byte $00					;- D 0 - - - 0x00D4A3 03:B493: 00
	.byte $00					;- D 0 - - - 0x00D4A4 03:B494: 00
	.byte $03					;- D 0 - - - 0x00D4A5 03:B495: 03
	.byte $00					;- D 0 - - - 0x00D4A6 03:B496: 00
	.byte $03					;- D 0 - - - 0x00D4A7 03:B497: 03
	.byte $00					;- D 0 - - - 0x00D4A8 03:B498: 00
	.byte $00					;- D 0 - - - 0x00D4A9 03:B499: 00
	.byte $03					;- D 0 - - - 0x00D4AA 03:B49A: 03
	.byte $03					;- D 0 - - - 0x00D4AB 03:B49B: 03
	.byte $03					;- D 0 - - - 0x00D4AC 03:B49C: 03
	.byte $03					;- D 0 - - - 0x00D4AD 03:B49D: 03
	.byte $00					;- D 0 - - - 0x00D4AE 03:B49E: 00
	.byte $00					;- D 0 - - - 0x00D4AF 03:B49F: 00
	.byte $00					;- D 0 - - - 0x00D4B0 03:B4A0: 00
	.byte $03					;- D 0 - - - 0x00D4B1 03:B4A1: 03
	.byte $03					;- D 0 - - - 0x00D4B2 03:B4A2: 03
	.byte $03					;- D 0 - - - 0x00D4B3 03:B4A3: 03
	.byte $00					;- D 0 - - - 0x00D4B4 03:B4A4: 00
	.byte $03					;- D 0 - - - 0x00D4B5 03:B4A5: 03
	.byte $03					;- D 0 - - - 0x00D4B6 03:B4A6: 03
	.byte $03					;- D 0 - - - 0x00D4B7 03:B4A7: 03
	.byte $00					;- D 0 - - - 0x00D4B8 03:B4A8: 00
	.byte $00					;- D 0 - - - 0x00D4B9 03:B4A9: 00
	.byte $00					;- D 0 - - - 0x00D4BA 03:B4AA: 00
	.byte $00					;- D 0 - - - 0x00D4BB 03:B4AB: 00
	.byte $00					;- D 0 - - - 0x00D4BC 03:B4AC: 00
	.byte $02					;- D 0 - - - 0x00D4BD 03:B4AD: 02
	.byte $00					;- D 0 - - - 0x00D4BE 03:B4AE: 00
	.byte $00					;- D 0 - - - 0x00D4BF 03:B4AF: 00
	.byte $03					;- D 0 - - - 0x00D4C0 03:B4B0: 03
	.byte $00					;- D 0 - - - 0x00D4C1 03:B4B1: 00
	.byte $00					;- D 0 - - - 0x00D4C2 03:B4B2: 00
	.byte $00					;- D 0 - - - 0x00D4C3 03:B4B3: 00
	.byte $03					;- D 0 - - - 0x00D4C4 03:B4B4: 03
	.byte $00					;- D 0 - - - 0x00D4C5 03:B4B5: 00
	.byte $01					;- D 0 - - - 0x00D4C6 03:B4B6: 01
	.byte $00					;- D 0 - - - 0x00D4C7 03:B4B7: 00
	.byte $00					;- D 0 - - - 0x00D4C8 03:B4B8: 00
	.byte $00					;- D 0 - - - 0x00D4C9 03:B4B9: 00
	.byte $01					;- D 0 - - - 0x00D4CA 03:B4BA: 01
	.byte $03					;- D 0 - - - 0x00D4CB 03:B4BB: 03
	.byte $02					;- D 0 - - - 0x00D4CC 03:B4BC: 02
	.byte $02					;- D 0 - - - 0x00D4CD 03:B4BD: 02
	.byte $00					;- D 0 - - - 0x00D4CE 03:B4BE: 00
	.byte $03					;- D 0 - - - 0x00D4CF 03:B4BF: 03
	.byte $03					;- D 0 - - - 0x00D4D0 03:B4C0: 03
	.byte $03					;- D 0 - - - 0x00D4D1 03:B4C1: 03
	.byte $03					;- D 0 - - - 0x00D4D2 03:B4C2: 03
	.byte $03					;- D 0 - - - 0x00D4D3 03:B4C3: 03
	.byte $00					;- D 0 - - - 0x00D4D4 03:B4C4: 00
	.byte $00					;- D 0 - - - 0x00D4D5 03:B4C5: 00
	.byte $00					;- D 0 - - - 0x00D4D6 03:B4C6: 00
	.byte $02					;- D 0 - - - 0x00D4D7 03:B4C7: 02
	.byte $02					;- D 0 - - - 0x00D4D8 03:B4C8: 02
	.byte $00					;- D 0 - - - 0x00D4D9 03:B4C9: 00
	.byte $03					;- D 0 - - - 0x00D4DA 03:B4CA: 03
	.byte $03					;- D 0 - - - 0x00D4DB 03:B4CB: 03
	.byte $00					;- D 0 - - - 0x00D4DC 03:B4CC: 00
	.byte $03					;- D 0 - - - 0x00D4DD 03:B4CD: 03
	.byte $00					;- D 0 - - - 0x00D4DE 03:B4CE: 00
	.byte $00					;- D 0 - - - 0x00D4DF 03:B4CF: 00
	.byte $00					;- D 0 - - - 0x00D4E0 03:B4D0: 00
	.byte $00					;- D 0 - - - 0x00D4E1 03:B4D1: 00
	.byte $00					;- D 0 - - - 0x00D4E2 03:B4D2: 00
	.byte $02					;- D 0 - - - 0x00D4E3 03:B4D3: 02
	.byte $00					;- D 0 - - - 0x00D4E4 03:B4D4: 00
	.byte $00					;- D 0 - - - 0x00D4E5 03:B4D5: 00
	.byte $00					;- D 0 - - - 0x00D4E6 03:B4D6: 00
	.byte $01					;- D 0 - - - 0x00D4E7 03:B4D7: 01
	.byte $01					;- D 0 - - - 0x00D4E8 03:B4D8: 01
	.byte $00					;- D 0 - - - 0x00D4E9 03:B4D9: 00
	.byte $00					;- D 0 - - - 0x00D4EA 03:B4DA: 00

DATA_06B4DB:
	.byte $00					;- D 0 - - - 0x00D4EB 03:B4DB: 00
	.byte $00					;- D 0 - - - 0x00D4EC 03:B4DC: 00
	.byte $00					;- D 0 - - - 0x00D4ED 03:B4DD: 00
	.byte $01					;- - - - - - 0x00D4EE 03:B4DE: 01
	.byte $00					;- D 0 - - - 0x00D4EF 03:B4DF: 00
	.byte $00					;- - - - - - 0x00D4F0 03:B4E0: 00
	.byte $00					;- D 0 - - - 0x00D4F1 03:B4E1: 00
	.byte $00					;- D 0 - - - 0x00D4F2 03:B4E2: 00
	.byte $00					;- D 0 - - - 0x00D4F3 03:B4E3: 00
	.byte $00					;- D 0 - - - 0x00D4F4 03:B4E4: 00
	.byte $00					;- D 0 - - - 0x00D4F5 03:B4E5: 00
	.byte $01					;- - - - - - 0x00D4F6 03:B4E6: 01
	.byte $00					;- D 0 - - - 0x00D4F7 03:B4E7: 00
	.byte $00					;- D 0 - - - 0x00D4F8 03:B4E8: 00
	.byte $00					;- D 0 - - - 0x00D4F9 03:B4E9: 00
	.byte $00					;- D 0 - - - 0x00D4FA 03:B4EA: 00
	.byte $00					;- D 0 - - - 0x00D4FB 03:B4EB: 00
	.byte $00					;- D 0 - - - 0x00D4FC 03:B4EC: 00
	.byte $00					;- D 0 - - - 0x00D4FD 03:B4ED: 00
	.byte $01					;- - - - - - 0x00D4FE 03:B4EE: 01
	.byte $00					;- D 0 - - - 0x00D4FF 03:B4EF: 00
	.byte $00					;- D 0 - - - 0x00D500 03:B4F0: 00
	.byte $00					;- D 0 - - - 0x00D501 03:B4F1: 00
	.byte $00					;- D 0 - - - 0x00D502 03:B4F2: 00
	.byte $00					;- D 0 - - - 0x00D503 03:B4F3: 00
	.byte $00					;- D 0 - - - 0x00D504 03:B4F4: 00
	.byte $00					;- D 0 - - - 0x00D505 03:B4F5: 00
	.byte $01					;- - - - - - 0x00D506 03:B4F6: 01
	.byte $00					;- D 0 - - - 0x00D507 03:B4F7: 00
	.byte $00					;- D 0 - - - 0x00D508 03:B4F8: 00
	.byte $00					;- D 0 - - - 0x00D509 03:B4F9: 00
	.byte $00					;- D 0 - - - 0x00D50A 03:B4FA: 00
	.byte $00					;- D 0 - - - 0x00D50B 03:B4FB: 00
	.byte $00					;- D 0 - - - 0x00D50C 03:B4FC: 00
	.byte $00					;- D 0 - - - 0x00D50D 03:B4FD: 00
	.byte $01					;- - - - - - 0x00D50E 03:B4FE: 01
	.byte $00					;- D 0 - - - 0x00D50F 03:B4FF: 00
	.byte $00					;- D 0 - - - 0x00D510 03:B500: 00
	.byte $00					;- D 0 - - - 0x00D511 03:B501: 00
	.byte $00					;- D 0 - - - 0x00D512 03:B502: 00
	.byte $00					;- D 0 - - - 0x00D513 03:B503: 00
	.byte $00					;- D 0 - - - 0x00D514 03:B504: 00
	.byte $00					;- D 0 - - - 0x00D515 03:B505: 00
	.byte $01					;- - - - - - 0x00D516 03:B506: 01
	.byte $00					;- D 0 - - - 0x00D517 03:B507: 00
	.byte $00					;- D 0 - - - 0x00D518 03:B508: 00
	.byte $00					;- D 0 - - - 0x00D519 03:B509: 00
	.byte $00					;- D 0 - - - 0x00D51A 03:B50A: 00
	.byte $00					;- D 0 - - - 0x00D51B 03:B50B: 00
	.byte $00					;- D 0 - - - 0x00D51C 03:B50C: 00
	.byte $00					;- D 0 - - - 0x00D51D 03:B50D: 00
	.byte $01					;- - - - - - 0x00D51E 03:B50E: 01
	.byte $00					;- D 0 - - - 0x00D51F 03:B50F: 00
	.byte $00					;- D 0 - - - 0x00D520 03:B510: 00
	.byte $01					;- D 0 - - - 0x00D521 03:B511: 01
	.byte $00					;- D 0 - - - 0x00D522 03:B512: 00
	.byte $00					;- D 0 - - - 0x00D523 03:B513: 00
	.byte $00					;- D 0 - - - 0x00D524 03:B514: 00
	.byte $00					;- D 0 - - - 0x00D525 03:B515: 00
	.byte $01					;- - - - - - 0x00D526 03:B516: 01
	.byte $00					;- D 0 - - - 0x00D527 03:B517: 00
	.byte $00					;- D 0 - - - 0x00D528 03:B518: 00
	.byte $01					;- D 0 - - - 0x00D529 03:B519: 01
	.byte $00					;- D 0 - - - 0x00D52A 03:B51A: 00
	.byte $00					;- D 0 - - - 0x00D52B 03:B51B: 00
	.byte $00					;- D 0 - - - 0x00D52C 03:B51C: 00
	.byte $00					;- D 0 - - - 0x00D52D 03:B51D: 00
	.byte $01					;- - - - - - 0x00D52E 03:B51E: 01
	.byte $00					;- D 0 - - - 0x00D52F 03:B51F: 00
	.byte $00					;- D 0 - - - 0x00D530 03:B520: 00
	.byte $01					;- D 0 - - - 0x00D531 03:B521: 01
	.byte $00					;- D 0 - - - 0x00D532 03:B522: 00
	.byte $00					;- D 0 - - - 0x00D533 03:B523: 00
	.byte $00					;- D 0 - - - 0x00D534 03:B524: 00
	.byte $01					;- D 0 - - - 0x00D535 03:B525: 01
	.byte $01					;- - - - - - 0x00D536 03:B526: 01
	.byte $00					;- D 0 - - - 0x00D537 03:B527: 00
	.byte $00					;- D 0 - - - 0x00D538 03:B528: 00
	.byte $01					;- D 0 - - - 0x00D539 03:B529: 01
	.byte $00					;- D 0 - - - 0x00D53A 03:B52A: 00
	.byte $00					;- D 0 - - - 0x00D53B 03:B52B: 00
	.byte $00					;- D 0 - - - 0x00D53C 03:B52C: 00
	.byte $01					;- D 0 - - - 0x00D53D 03:B52D: 01
	.byte $01					;- - - - - - 0x00D53E 03:B52E: 01
	.byte $01					;- D 0 - - - 0x00D53F 03:B52F: 01
	.byte $00					;- D 0 - - - 0x00D540 03:B530: 00
	.byte $02					;- D 0 - - - 0x00D541 03:B531: 02
	.byte $00					;- D 0 - - - 0x00D542 03:B532: 00
	.byte $01					;- D 0 - - - 0x00D543 03:B533: 01
	.byte $00					;- D 0 - - - 0x00D544 03:B534: 00
	.byte $01					;- D 0 - - - 0x00D545 03:B535: 01
	.byte $01					;- - - - - - 0x00D546 03:B536: 01
	.byte $01					;- D 0 - - - 0x00D547 03:B537: 01
	.byte $00					;- D 0 - - - 0x00D548 03:B538: 00
	.byte $02					;- D 0 - - - 0x00D549 03:B539: 02
	.byte $00					;- D 0 - - - 0x00D54A 03:B53A: 00
	.byte $02					;- D 0 - - - 0x00D54B 03:B53B: 02
	.byte $00					;- D 0 - - - 0x00D54C 03:B53C: 00
	.byte $02					;- D 0 - - - 0x00D54D 03:B53D: 02
	.byte $01					;- - - - - - 0x00D54E 03:B53E: 01
	.byte $01					;- D 0 - - - 0x00D54F 03:B53F: 01
	.byte $00					;- D 0 - - - 0x00D550 03:B540: 00
	.byte $02					;- D 0 - - - 0x00D551 03:B541: 02
	.byte $00					;- D 0 - - - 0x00D552 03:B542: 00
	.byte $02					;- D 0 - - - 0x00D553 03:B543: 02
	.byte $00					;- D 0 - - - 0x00D554 03:B544: 00
	.byte $02					;- D 0 - - - 0x00D555 03:B545: 02
	.byte $01					;- - - - - - 0x00D556 03:B546: 01
	.byte $01					;- D 0 - - - 0x00D557 03:B547: 01
	.byte $00					;- D 0 - - - 0x00D558 03:B548: 00
	.byte $02					;- D 0 - - - 0x00D559 03:B549: 02
	.byte $00					;- D 0 - - - 0x00D55A 03:B54A: 00
	.byte $02					;- D 0 - - - 0x00D55B 03:B54B: 02
	.byte $01					;- D 0 - - - 0x00D55C 03:B54C: 01
	.byte $02					;- D 0 - - - 0x00D55D 03:B54D: 02
	.byte $01					;- - - - - - 0x00D55E 03:B54E: 01
	.byte $01					;- D 0 - - - 0x00D55F 03:B54F: 01
	.byte $00					;- D 0 - - - 0x00D560 03:B550: 00
	.byte $03					;- D 0 - - - 0x00D561 03:B551: 03
	.byte $00					;- D 0 - - - 0x00D562 03:B552: 00
	.byte $02					;- D 0 - - - 0x00D563 03:B553: 02
	.byte $01					;- D 0 - - - 0x00D564 03:B554: 01
	.byte $03					;- D 0 - - - 0x00D565 03:B555: 03
	.byte $01					;- - - - - - 0x00D566 03:B556: 01
	.byte $01					;- D 0 - - - 0x00D567 03:B557: 01
	.byte $00					;- D 0 - - - 0x00D568 03:B558: 00
	.byte $03					;- D 0 - - - 0x00D569 03:B559: 03
	.byte $00					;- D 0 - - - 0x00D56A 03:B55A: 00
	.byte $02					;- D 0 - - - 0x00D56B 03:B55B: 02
	.byte $01					;- D 0 - - - 0x00D56C 03:B55C: 01
	.byte $03					;- D 0 - - - 0x00D56D 03:B55D: 03
	.byte $01					;- - - - - - 0x00D56E 03:B55E: 01
	.byte $02					;- D 0 - - - 0x00D56F 03:B55F: 02
	.byte $00					;- D 0 - - - 0x00D570 03:B560: 00
	.byte $03					;- D 0 - - - 0x00D571 03:B561: 03
	.byte $00					;- D 0 - - - 0x00D572 03:B562: 00
	.byte $02					;- D 0 - - - 0x00D573 03:B563: 02
	.byte $01					;- D 0 - - - 0x00D574 03:B564: 01
	.byte $04					;- D 0 - - - 0x00D575 03:B565: 04
	.byte $01					;- - - - - - 0x00D576 03:B566: 01
	.byte $02					;- D 0 - - - 0x00D577 03:B567: 02
	.byte $00					;- D 0 - - - 0x00D578 03:B568: 00
	.byte $03					;- D 0 - - - 0x00D579 03:B569: 03
	.byte $00					;- D 0 - - - 0x00D57A 03:B56A: 00
	.byte $02					;- D 0 - - - 0x00D57B 03:B56B: 02
	.byte $01					;- D 0 - - - 0x00D57C 03:B56C: 01
	.byte $04					;- D 0 - - - 0x00D57D 03:B56D: 04
	.byte $01					;- - - - - - 0x00D57E 03:B56E: 01
	.byte $02					;- D 0 - - - 0x00D57F 03:B56F: 02
	.byte $00					;- D 0 - - - 0x00D580 03:B570: 00
	.byte $04					;- D 0 - - - 0x00D581 03:B571: 04
	.byte $00					;- D 0 - - - 0x00D582 03:B572: 00
	.byte $02					;- D 0 - - - 0x00D583 03:B573: 02
	.byte $01					;- D 0 - - - 0x00D584 03:B574: 01
	.byte $04					;- D 0 - - - 0x00D585 03:B575: 04
	.byte $01					;- - - - - - 0x00D586 03:B576: 01
	.byte $02					;- D 0 - - - 0x00D587 03:B577: 02
	.byte $00					;- D 0 - - - 0x00D588 03:B578: 00
	.byte $04					;- D 0 - - - 0x00D589 03:B579: 04
	.byte $00					;- D 0 - - - 0x00D58A 03:B57A: 00
	.byte $02					;- D 0 - - - 0x00D58B 03:B57B: 02
	.byte $01					;- D 0 - - - 0x00D58C 03:B57C: 01
	.byte $05					;- D 0 - - - 0x00D58D 03:B57D: 05
	.byte $01					;- - - - - - 0x00D58E 03:B57E: 01
	.byte $02					;- D 0 - - - 0x00D58F 03:B57F: 02
	.byte $00					;- D 0 - - - 0x00D590 03:B580: 00
	.byte $04					;- D 0 - - - 0x00D591 03:B581: 04
	.byte $00					;- D 0 - - - 0x00D592 03:B582: 00
	.byte $03					;- D 0 - - - 0x00D593 03:B583: 03
	.byte $02					;- D 0 - - - 0x00D594 03:B584: 02
	.byte $05					;- D 0 - - - 0x00D595 03:B585: 05
	.byte $01					;- - - - - - 0x00D596 03:B586: 01
	.byte $02					;- D 0 - - - 0x00D597 03:B587: 02
	.byte $00					;- D 0 - - - 0x00D598 03:B588: 00
	.byte $04					;- D 0 - - - 0x00D599 03:B589: 04
	.byte $00					;- D 0 - - - 0x00D59A 03:B58A: 00
	.byte $04					;- D 0 - - - 0x00D59B 03:B58B: 04
	.byte $02					;- D 0 - - - 0x00D59C 03:B58C: 02
	.byte $06					;- D 0 - - - 0x00D59D 03:B58D: 06
	.byte $01					;- - - - - - 0x00D59E 03:B58E: 01
	.byte $02					;- D 0 - - - 0x00D59F 03:B58F: 02
	.byte $01					;- D 0 - - - 0x00D5A0 03:B590: 01
	.byte $05					;- D 0 - - - 0x00D5A1 03:B591: 05
	.byte $00					;- D 0 - - - 0x00D5A2 03:B592: 00
	.byte $04					;- D 0 - - - 0x00D5A3 03:B593: 04
	.byte $02					;- D 0 - - - 0x00D5A4 03:B594: 02
	.byte $06					;- D 0 - - - 0x00D5A5 03:B595: 06
	.byte $01					;- - - - - - 0x00D5A6 03:B596: 01
	.byte $02					;- D 0 - - - 0x00D5A7 03:B597: 02
	.byte $01					;- D 0 - - - 0x00D5A8 03:B598: 01
	.byte $05					;- D 0 - - - 0x00D5A9 03:B599: 05
	.byte $00					;- D 0 - - - 0x00D5AA 03:B59A: 00
	.byte $04					;- D 0 - - - 0x00D5AB 03:B59B: 04
	.byte $02					;- D 0 - - - 0x00D5AC 03:B59C: 02
	.byte $06					;- D 0 - - - 0x00D5AD 03:B59D: 06
	.byte $01					;- - - - - - 0x00D5AE 03:B59E: 01
	.byte $02					;- D 0 - - - 0x00D5AF 03:B59F: 02
	.byte $01					;- D 0 - - - 0x00D5B0 03:B5A0: 01
	.byte $05					;- D 0 - - - 0x00D5B1 03:B5A1: 05
	.byte $00					;- D 0 - - - 0x00D5B2 03:B5A2: 00
	.byte $04					;- D 0 - - - 0x00D5B3 03:B5A3: 04
	.byte $02					;- D 0 - - - 0x00D5B4 03:B5A4: 02
	.byte $06					;- D 0 - - - 0x00D5B5 03:B5A5: 06
	.byte $01					;- - - - - - 0x00D5B6 03:B5A6: 01
	.byte $02					;- D 0 - - - 0x00D5B7 03:B5A7: 02
	.byte $01					;- D 0 - - - 0x00D5B8 03:B5A8: 01
	.byte $05					;- D 0 - - - 0x00D5B9 03:B5A9: 05
	.byte $00					;- D 0 - - - 0x00D5BA 03:B5AA: 00
	.byte $04					;- D 0 - - - 0x00D5BB 03:B5AB: 04
	.byte $02					;- D 0 - - - 0x00D5BC 03:B5AC: 02
	.byte $06					;- D 0 - - - 0x00D5BD 03:B5AD: 06
	.byte $01					;- - - - - - 0x00D5BE 03:B5AE: 01
	.byte $02					;- D 0 - - - 0x00D5BF 03:B5AF: 02
	.byte $02					;- D 0 - - - 0x00D5C0 03:B5B0: 02
	.byte $06					;- D 0 - - - 0x00D5C1 03:B5B1: 06
	.byte $00					;- D 0 - - - 0x00D5C2 03:B5B2: 00
	.byte $04					;- D 0 - - - 0x00D5C3 03:B5B3: 04
	.byte $02					;- D 0 - - - 0x00D5C4 03:B5B4: 02
	.byte $06					;- D 0 - - - 0x00D5C5 03:B5B5: 06
	.byte $01					;- - - - - - 0x00D5C6 03:B5B6: 01
	.byte $02					;- D 0 - - - 0x00D5C7 03:B5B7: 02
	.byte $02					;- - - - - - 0x00D5C8 03:B5B8: 02
	.byte $06					;- D 0 - - - 0x00D5C9 03:B5B9: 06
	.byte $00					;- D 0 - - - 0x00D5CA 03:B5BA: 00
	.byte $04					;- D 0 - - - 0x00D5CB 03:B5BB: 04
	.byte $02					;- D 0 - - - 0x00D5CC 03:B5BC: 02
	.byte $06					;- D 0 - - - 0x00D5CD 03:B5BD: 06
	.byte $01					;- - - - - - 0x00D5CE 03:B5BE: 01
	.byte $02					;- D 0 - - - 0x00D5CF 03:B5BF: 02
	.byte $02					;- - - - - - 0x00D5D0 03:B5C0: 02
	.byte $06					;- D 0 - - - 0x00D5D1 03:B5C1: 06
	.byte $00					;- D 0 - - - 0x00D5D2 03:B5C2: 00
	.byte $04					;- D 0 - - - 0x00D5D3 03:B5C3: 04
	.byte $02					;- D 0 - - - 0x00D5D4 03:B5C4: 02
	.byte $06					;- D 0 - - - 0x00D5D5 03:B5C5: 06
	.byte $01					;- - - - - - 0x00D5D6 03:B5C6: 01
	.byte $02					;- D 0 - - - 0x00D5D7 03:B5C7: 02
	.byte $02					;- - - - - - 0x00D5D8 03:B5C8: 02
	.byte $06					;- D 0 - - - 0x00D5D9 03:B5C9: 06
	.byte $00					;- D 0 - - - 0x00D5DA 03:B5CA: 00
	.byte $04					;- D 0 - - - 0x00D5DB 03:B5CB: 04
	.byte $02					;- D 0 - - - 0x00D5DC 03:B5CC: 02
	.byte $06					;- D 0 - - - 0x00D5DD 03:B5CD: 06
	.byte $01					;- - - - - - 0x00D5DE 03:B5CE: 01
	.byte $02					;- D 0 - - - 0x00D5DF 03:B5CF: 02
	.byte $02					;- - - - - - 0x00D5E0 03:B5D0: 02
	.byte $06					;- D 0 - - - 0x00D5E1 03:B5D1: 06
	.byte $00					;- D 0 - - - 0x00D5E2 03:B5D2: 00
	.byte $04					;- D 0 - - - 0x00D5E3 03:B5D3: 04
	.byte $02					;- D 0 - - - 0x00D5E4 03:B5D4: 02
	.byte $06					;- D 0 - - - 0x00D5E5 03:B5D5: 06
	.byte $01					;- - - - - - 0x00D5E6 03:B5D6: 01
	.byte $02					;- D 0 - - - 0x00D5E7 03:B5D7: 02
	.byte $02					;- - - - - - 0x00D5E8 03:B5D8: 02
	.byte $06					;- D 0 - - - 0x00D5E9 03:B5D9: 06
	.byte $00					;- D 0 - - - 0x00D5EA 03:B5DA: 00

DATA_06B5DB:
	.byte $00					;- D 0 - - - 0x00D5EB 03:B5DB: 00
	.byte $00					;- D 0 - - - 0x00D5EC 03:B5DC: 00
	.byte $00					;- D 0 - - - 0x00D5ED 03:B5DD: 00
	.byte $00					;- D 0 - - - 0x00D5EE 03:B5DE: 00
	.byte $00					;- D 0 - - - 0x00D5EF 03:B5DF: 00
	.byte $00					;- D 0 - - - 0x00D5F0 03:B5E0: 00
	.byte $00					;- - - - - - 0x00D5F1 03:B5E1: 00
	.byte $00					;- - - - - - 0x00D5F2 03:B5E2: 00
	.byte $00					;- D 0 - - - 0x00D5F3 03:B5E3: 00
	.byte $00					;- D 0 - - - 0x00D5F4 03:B5E4: 00
	.byte $00					;- D 0 - - - 0x00D5F5 03:B5E5: 00
	.byte $00					;- D 0 - - - 0x00D5F6 03:B5E6: 00
	.byte $00					;- D 0 - - - 0x00D5F7 03:B5E7: 00
	.byte $00					;- D 0 - - - 0x00D5F8 03:B5E8: 00
	.byte $00					;- - - - - - 0x00D5F9 03:B5E9: 00
	.byte $00					;- - - - - - 0x00D5FA 03:B5EA: 00
	.byte $00					;- D 0 - - - 0x00D5FB 03:B5EB: 00
	.byte $00					;- D 0 - - - 0x00D5FC 03:B5EC: 00
	.byte $00					;- D 0 - - - 0x00D5FD 03:B5ED: 00
	.byte $00					;- D 0 - - - 0x00D5FE 03:B5EE: 00
	.byte $00					;- D 0 - - - 0x00D5FF 03:B5EF: 00
	.byte $00					;- D 0 - - - 0x00D600 03:B5F0: 00
	.byte $00					;- - - - - - 0x00D601 03:B5F1: 00
	.byte $00					;- - - - - - 0x00D602 03:B5F2: 00
	.byte $00					;- D 0 - - - 0x00D603 03:B5F3: 00
	.byte $00					;- D 0 - - - 0x00D604 03:B5F4: 00
	.byte $00					;- D 0 - - - 0x00D605 03:B5F5: 00
	.byte $00					;- D 0 - - - 0x00D606 03:B5F6: 00
	.byte $00					;- D 0 - - - 0x00D607 03:B5F7: 00
	.byte $00					;- D 0 - - - 0x00D608 03:B5F8: 00
	.byte $00					;- - - - - - 0x00D609 03:B5F9: 00
	.byte $00					;- - - - - - 0x00D60A 03:B5FA: 00
	.byte $00					;- D 0 - - - 0x00D60B 03:B5FB: 00
	.byte $00					;- D 0 - - - 0x00D60C 03:B5FC: 00
	.byte $00					;- D 0 - - - 0x00D60D 03:B5FD: 00
	.byte $00					;- D 0 - - - 0x00D60E 03:B5FE: 00
	.byte $01					;- D 0 - - - 0x00D60F 03:B5FF: 01
	.byte $00					;- D 0 - - - 0x00D610 03:B600: 00
	.byte $00					;- - - - - - 0x00D611 03:B601: 00
	.byte $00					;- - - - - - 0x00D612 03:B602: 00
	.byte $00					;- D 0 - - - 0x00D613 03:B603: 00
	.byte $00					;- D 0 - - - 0x00D614 03:B604: 00
	.byte $00					;- D 0 - - - 0x00D615 03:B605: 00
	.byte $00					;- D 0 - - - 0x00D616 03:B606: 00
	.byte $01					;- D 0 - - - 0x00D617 03:B607: 01
	.byte $00					;- D 0 - - - 0x00D618 03:B608: 00
	.byte $00					;- - - - - - 0x00D619 03:B609: 00
	.byte $00					;- - - - - - 0x00D61A 03:B60A: 00
	.byte $00					;- D 0 - - - 0x00D61B 03:B60B: 00
	.byte $00					;- D 0 - - - 0x00D61C 03:B60C: 00
	.byte $00					;- D 0 - - - 0x00D61D 03:B60D: 00
	.byte $00					;- D 0 - - - 0x00D61E 03:B60E: 00
	.byte $01					;- D 0 - - - 0x00D61F 03:B60F: 01
	.byte $00					;- D 0 - - - 0x00D620 03:B610: 00
	.byte $00					;- - - - - - 0x00D621 03:B611: 00
	.byte $00					;- - - - - - 0x00D622 03:B612: 00
	.byte $00					;- D 0 - - - 0x00D623 03:B613: 00
	.byte $00					;- D 0 - - - 0x00D624 03:B614: 00
	.byte $00					;- D 0 - - - 0x00D625 03:B615: 00
	.byte $00					;- D 0 - - - 0x00D626 03:B616: 00
	.byte $01					;- D 0 - - - 0x00D627 03:B617: 01
	.byte $00					;- D 0 - - - 0x00D628 03:B618: 00
	.byte $00					;- - - - - - 0x00D629 03:B619: 00
	.byte $00					;- - - - - - 0x00D62A 03:B61A: 00
	.byte $00					;- D 0 - - - 0x00D62B 03:B61B: 00
	.byte $00					;- D 0 - - - 0x00D62C 03:B61C: 00
	.byte $00					;- D 0 - - - 0x00D62D 03:B61D: 00
	.byte $00					;- D 0 - - - 0x00D62E 03:B61E: 00
	.byte $01					;- D 0 - - - 0x00D62F 03:B61F: 01
	.byte $00					;- D 0 - - - 0x00D630 03:B620: 00
	.byte $01					;- - - - - - 0x00D631 03:B621: 01
	.byte $01					;- - - - - - 0x00D632 03:B622: 01
	.byte $00					;- D 0 - - - 0x00D633 03:B623: 00
	.byte $00					;- D 0 - - - 0x00D634 03:B624: 00
	.byte $00					;- D 0 - - - 0x00D635 03:B625: 00
	.byte $00					;- D 0 - - - 0x00D636 03:B626: 00
	.byte $01					;- D 0 - - - 0x00D637 03:B627: 01
	.byte $00					;- D 0 - - - 0x00D638 03:B628: 00
	.byte $01					;- - - - - - 0x00D639 03:B629: 01
	.byte $01					;- - - - - - 0x00D63A 03:B62A: 01
	.byte $00					;- D 0 - - - 0x00D63B 03:B62B: 00
	.byte $00					;- D 0 - - - 0x00D63C 03:B62C: 00
	.byte $00					;- D 0 - - - 0x00D63D 03:B62D: 00
	.byte $00					;- D 0 - - - 0x00D63E 03:B62E: 00
	.byte $01					;- D 0 - - - 0x00D63F 03:B62F: 01
	.byte $01					;- D 0 - - - 0x00D640 03:B630: 01
	.byte $02					;- - - - - - 0x00D641 03:B631: 02
	.byte $02					;- - - - - - 0x00D642 03:B632: 02
	.byte $00					;- D 0 - - - 0x00D643 03:B633: 00
	.byte $01					;- D 0 - - - 0x00D644 03:B634: 01
	.byte $00					;- D 0 - - - 0x00D645 03:B635: 00
	.byte $00					;- D 0 - - - 0x00D646 03:B636: 00
	.byte $01					;- D 0 - - - 0x00D647 03:B637: 01
	.byte $01					;- D 0 - - - 0x00D648 03:B638: 01
	.byte $02					;- - - - - - 0x00D649 03:B639: 02
	.byte $02					;- - - - - - 0x00D64A 03:B63A: 02
	.byte $00					;- D 0 - - - 0x00D64B 03:B63B: 00
	.byte $02					;- D 0 - - - 0x00D64C 03:B63C: 02
	.byte $00					;- D 0 - - - 0x00D64D 03:B63D: 00
	.byte $01					;- D 0 - - - 0x00D64E 03:B63E: 01
	.byte $01					;- D 0 - - - 0x00D64F 03:B63F: 01
	.byte $01					;- D 0 - - - 0x00D650 03:B640: 01
	.byte $03					;- - - - - - 0x00D651 03:B641: 03
	.byte $03					;- - - - - - 0x00D652 03:B642: 03
	.byte $00					;- D 0 - - - 0x00D653 03:B643: 00
	.byte $02					;- D 0 - - - 0x00D654 03:B644: 02
	.byte $00					;- D 0 - - - 0x00D655 03:B645: 00
	.byte $01					;- D 0 - - - 0x00D656 03:B646: 01
	.byte $01					;- D 0 - - - 0x00D657 03:B647: 01
	.byte $01					;- D 0 - - - 0x00D658 03:B648: 01
	.byte $03					;- - - - - - 0x00D659 03:B649: 03
	.byte $03					;- - - - - - 0x00D65A 03:B64A: 03
	.byte $05					;- D 0 - - - 0x00D65B 03:B64B: 05
	.byte $02					;- D 0 - - - 0x00D65C 03:B64C: 02
	.byte $00					;- D 0 - - - 0x00D65D 03:B64D: 00
	.byte $01					;- D 0 - - - 0x00D65E 03:B64E: 01
	.byte $01					;- D 0 - - - 0x00D65F 03:B64F: 01
	.byte $02					;- D 0 - - - 0x00D660 03:B650: 02
	.byte $04					;- - - - - - 0x00D661 03:B651: 04
	.byte $04					;- - - - - - 0x00D662 03:B652: 04
	.byte $05					;- D 0 - - - 0x00D663 03:B653: 05
	.byte $02					;- D 0 - - - 0x00D664 03:B654: 02
	.byte $00					;- D 0 - - - 0x00D665 03:B655: 00
	.byte $01					;- D 0 - - - 0x00D666 03:B656: 01
	.byte $01					;- D 0 - - - 0x00D667 03:B657: 01
	.byte $02					;- D 0 - - - 0x00D668 03:B658: 02
	.byte $04					;- - - - - - 0x00D669 03:B659: 04
	.byte $04					;- - - - - - 0x00D66A 03:B65A: 04
	.byte $05					;- D 0 - - - 0x00D66B 03:B65B: 05
	.byte $03					;- D 0 - - - 0x00D66C 03:B65C: 03
	.byte $00					;- D 0 - - - 0x00D66D 03:B65D: 00
	.byte $01					;- D 0 - - - 0x00D66E 03:B65E: 01
	.byte $01					;- D 0 - - - 0x00D66F 03:B65F: 01
	.byte $02					;- D 0 - - - 0x00D670 03:B660: 02
	.byte $05					;- - - - - - 0x00D671 03:B661: 05
	.byte $05					;- - - - - - 0x00D672 03:B662: 05
	.byte $05					;- D 0 - - - 0x00D673 03:B663: 05
	.byte $04					;- D 0 - - - 0x00D674 03:B664: 04
	.byte $00					;- D 0 - - - 0x00D675 03:B665: 00
	.byte $01					;- D 0 - - - 0x00D676 03:B666: 01
	.byte $01					;- D 0 - - - 0x00D677 03:B667: 01
	.byte $02					;- D 0 - - - 0x00D678 03:B668: 02
	.byte $05					;- - - - - - 0x00D679 03:B669: 05
	.byte $05					;- - - - - - 0x00D67A 03:B66A: 05
	.byte $05					;- D 0 - - - 0x00D67B 03:B66B: 05
	.byte $04					;- D 0 - - - 0x00D67C 03:B66C: 04
	.byte $01					;- D 0 - - - 0x00D67D 03:B66D: 01
	.byte $01					;- D 0 - - - 0x00D67E 03:B66E: 01
	.byte $01					;- D 0 - - - 0x00D67F 03:B66F: 01
	.byte $03					;- D 0 - - - 0x00D680 03:B670: 03
	.byte $06					;- - - - - - 0x00D681 03:B671: 06
	.byte $06					;- - - - - - 0x00D682 03:B672: 06
	.byte $05					;- D 0 - - - 0x00D683 03:B673: 05
	.byte $04					;- D 0 - - - 0x00D684 03:B674: 04
	.byte $01					;- D 0 - - - 0x00D685 03:B675: 01
	.byte $01					;- D 0 - - - 0x00D686 03:B676: 01
	.byte $01					;- D 0 - - - 0x00D687 03:B677: 01
	.byte $03					;- D 0 - - - 0x00D688 03:B678: 03
	.byte $06					;- - - - - - 0x00D689 03:B679: 06
	.byte $06					;- - - - - - 0x00D68A 03:B67A: 06
	.byte $05					;- D 0 - - - 0x00D68B 03:B67B: 05
	.byte $04					;- D 0 - - - 0x00D68C 03:B67C: 04
	.byte $01					;- D 0 - - - 0x00D68D 03:B67D: 01
	.byte $01					;- D 0 - - - 0x00D68E 03:B67E: 01
	.byte $01					;- D 0 - - - 0x00D68F 03:B67F: 01
	.byte $03					;- D 0 - - - 0x00D690 03:B680: 03
	.byte $07					;- - - - - - 0x00D691 03:B681: 07
	.byte $07					;- - - - - - 0x00D692 03:B682: 07
	.byte $05					;- D 0 - - - 0x00D693 03:B683: 05
	.byte $05					;- D 0 - - - 0x00D694 03:B684: 05
	.byte $01					;- D 0 - - - 0x00D695 03:B685: 01
	.byte $02					;- D 0 - - - 0x00D696 03:B686: 02
	.byte $01					;- D 0 - - - 0x00D697 03:B687: 01
	.byte $03					;- D 0 - - - 0x00D698 03:B688: 03
	.byte $07					;- - - - - - 0x00D699 03:B689: 07
	.byte $07					;- - - - - - 0x00D69A 03:B68A: 07
	.byte $05					;- D 0 - - - 0x00D69B 03:B68B: 05
	.byte $06					;- D 0 - - - 0x00D69C 03:B68C: 06
	.byte $01					;- D 0 - - - 0x00D69D 03:B68D: 01
	.byte $02					;- D 0 - - - 0x00D69E 03:B68E: 02
	.byte $01					;- D 0 - - - 0x00D69F 03:B68F: 01
	.byte $04					;- D 0 - - - 0x00D6A0 03:B690: 04
	.byte $08					;- - - - - - 0x00D6A1 03:B691: 08
	.byte $08					;- - - - - - 0x00D6A2 03:B692: 08
	.byte $05					;- D 0 - - - 0x00D6A3 03:B693: 05
	.byte $06					;- D 0 - - - 0x00D6A4 03:B694: 06
	.byte $01					;- D 0 - - - 0x00D6A5 03:B695: 01
	.byte $02					;- D 0 - - - 0x00D6A6 03:B696: 02
	.byte $01					;- D 0 - - - 0x00D6A7 03:B697: 01
	.byte $04					;- D 0 - - - 0x00D6A8 03:B698: 04
	.byte $08					;- - - - - - 0x00D6A9 03:B699: 08
	.byte $08					;- - - - - - 0x00D6AA 03:B69A: 08
	.byte $05					;- D 0 - - - 0x00D6AB 03:B69B: 05
	.byte $06					;- D 0 - - - 0x00D6AC 03:B69C: 06
	.byte $01					;- D 0 - - - 0x00D6AD 03:B69D: 01
	.byte $02					;- D 0 - - - 0x00D6AE 03:B69E: 02
	.byte $01					;- D 0 - - - 0x00D6AF 03:B69F: 01
	.byte $04					;- D 0 - - - 0x00D6B0 03:B6A0: 04
	.byte $08					;- - - - - - 0x00D6B1 03:B6A1: 08
	.byte $08					;- - - - - - 0x00D6B2 03:B6A2: 08
	.byte $05					;- D 0 - - - 0x00D6B3 03:B6A3: 05
	.byte $06					;- D 0 - - - 0x00D6B4 03:B6A4: 06
	.byte $01					;- D 0 - - - 0x00D6B5 03:B6A5: 01
	.byte $02					;- D 0 - - - 0x00D6B6 03:B6A6: 02
	.byte $01					;- D 0 - - - 0x00D6B7 03:B6A7: 01
	.byte $04					;- D 0 - - - 0x00D6B8 03:B6A8: 04
	.byte $08					;- - - - - - 0x00D6B9 03:B6A9: 08
	.byte $08					;- - - - - - 0x00D6BA 03:B6AA: 08
	.byte $05					;- D 0 - - - 0x00D6BB 03:B6AB: 05
	.byte $06					;- D 0 - - - 0x00D6BC 03:B6AC: 06
	.byte $02					;- D 0 - - - 0x00D6BD 03:B6AD: 02
	.byte $02					;- D 0 - - - 0x00D6BE 03:B6AE: 02
	.byte $02					;- D 0 - - - 0x00D6BF 03:B6AF: 02
	.byte $05					;- D 0 - - - 0x00D6C0 03:B6B0: 05
	.byte $08					;- - - - - - 0x00D6C1 03:B6B1: 08
	.byte $08					;- - - - - - 0x00D6C2 03:B6B2: 08
	.byte $05					;- - - - - - 0x00D6C3 03:B6B3: 05
	.byte $06					;- D 0 - - - 0x00D6C4 03:B6B4: 06
	.byte $02					;- D 0 - - - 0x00D6C5 03:B6B5: 02
	.byte $02					;- D 0 - - - 0x00D6C6 03:B6B6: 02
	.byte $02					;- D 0 - - - 0x00D6C7 03:B6B7: 02
	.byte $05					;- D 0 - - - 0x00D6C8 03:B6B8: 05
	.byte $08					;- - - - - - 0x00D6C9 03:B6B9: 08
	.byte $08					;- - - - - - 0x00D6CA 03:B6BA: 08
	.byte $05					;- - - - - - 0x00D6CB 03:B6BB: 05
	.byte $06					;- D 0 - - - 0x00D6CC 03:B6BC: 06
	.byte $02					;- D 0 - - - 0x00D6CD 03:B6BD: 02
	.byte $02					;- D 0 - - - 0x00D6CE 03:B6BE: 02
	.byte $02					;- D 0 - - - 0x00D6CF 03:B6BF: 02
	.byte $05					;- D 0 - - - 0x00D6D0 03:B6C0: 05
	.byte $08					;- - - - - - 0x00D6D1 03:B6C1: 08
	.byte $08					;- - - - - - 0x00D6D2 03:B6C2: 08
	.byte $05					;- - - - - - 0x00D6D3 03:B6C3: 05
	.byte $06					;- D 0 - - - 0x00D6D4 03:B6C4: 06
	.byte $02					;- D 0 - - - 0x00D6D5 03:B6C5: 02
	.byte $02					;- D 0 - - - 0x00D6D6 03:B6C6: 02
	.byte $02					;- D 0 - - - 0x00D6D7 03:B6C7: 02
	.byte $05					;- D 0 - - - 0x00D6D8 03:B6C8: 05
	.byte $08					;- - - - - - 0x00D6D9 03:B6C9: 08
	.byte $08					;- - - - - - 0x00D6DA 03:B6CA: 08
	.byte $06					;- - - - - - 0x00D6DB 03:B6CB: 06
	.byte $06					;- D 0 - - - 0x00D6DC 03:B6CC: 06
	.byte $02					;- - - - - - 0x00D6DD 03:B6CD: 02
	.byte $02					;- D 0 - - - 0x00D6DE 03:B6CE: 02
	.byte $02					;- D 0 - - - 0x00D6DF 03:B6CF: 02
	.byte $05					;- D 0 - - - 0x00D6E0 03:B6D0: 05
	.byte $08					;- - - - - - 0x00D6E1 03:B6D1: 08
	.byte $08					;- - - - - - 0x00D6E2 03:B6D2: 08
	.byte $06					;- D 0 - - - 0x00D6E3 03:B6D3: 06
	.byte $06					;- D 0 - - - 0x00D6E4 03:B6D4: 06
	.byte $02					;- D 0 - - - 0x00D6E5 03:B6D5: 02
	.byte $02					;- D 0 - - - 0x00D6E6 03:B6D6: 02
	.byte $02					;- D 0 - - - 0x00D6E7 03:B6D7: 02
	.byte $05					;- D 0 - - - 0x00D6E8 03:B6D8: 05
	.byte $08					;- - - - - - 0x00D6E9 03:B6D9: 08
	.byte $08					;- - - - - - 0x00D6EA 03:B6DA: 08

RoundsSolidRangeTable:
	;- - - - - - 0x00D6EB 03:B6DB: 83
	.word SolidsGiantTowerA				;Round 00
	.word SolidsGiantTowerA				;Round 01
	.word SolidsGiantTowerA				;Round 02
	.word SolidsGiantTowerA				;Round 03
	.word SolidsGiantTowerA				;Round 04
	.word SolidsGiantTowerA				;Round 05
	.word SolidsGiantTowerA				;Round 06
	.word SolidsGiantTowerA				;Round 07
	.word SolidsGiantTowerA				;Round 08
	.word SolidsGiantTowerA				;Round 09
	.word SolidsGiantTowerA				;Round 10
	.word SolidsGiantTowerB				;Round 11
	.word SolidsGiantTowerA				;Round 12
	.word SolidsGiantTowerA				;Round 13
	.word SolidsGiantTowerB				;Round 14
	.word SolidsGiantTowerA				;Round 15
	.word SolidsGiantTowerA				;Round 16
	.word SolidsGiantTowerA				;Round 17
	.word SolidsGiantTowerA				;Round 18
	.word SolidsGiantTowerA				;Round 19
	.word SolidsWideBossCave			;Round 20
	.word SolidsBoomtown				;Round 21
	.word SolidsBoomtown				;Round 22
	.word SolidsBoomtown				;Round 23
	.word SolidsBoomtown				;Round 24
	.word SolidsBoomtown				;Round 25
	.word SolidsBoomtown				;Round 26
	.word SolidsBoomtown				;Round 27
	.word SolidsBoomtown				;Round 28
	.word SolidsBoomtown				;Round 29
	.word SolidsBoomtown				;Round 30
	.word SolidsBoomtown				;Round 31
	.word SolidsBoomtown				;Round 32
	.word SolidsBoomtown				;Round 33
	.word SolidsBoomtown				;Round 34
	.word SolidsBoomtown				;Round 35
	.word SolidsBoomtown				;Round 36
	.word SolidsBoomtown				;Round 37
	.word SolidsBoomtown				;Round 38
	.word SolidsBoomtown				;Round 39
	.word SolidsBossCave				;Round 40
	.word SolidsShiningTownA			;Round 41
	.word SolidsShiningTownA			;Round 42
	.word SolidsShiningTownB			;Round 43
	.word SolidsShiningTownA			;Round 44
	.word SolidsShiningTownA			;Round 45
	.word SolidsShiningTownA			;Round 46
	.word SolidsShiningTownB			;Round 47
	.word SolidsShiningTownA			;Round 48
	.word SolidsShiningTownB			;Round 49
	.word SolidsShiningTownA			;Round 50
	.word SolidsShiningTownA			;Round 51
	.word SolidsShiningTownB			;Round 52
	.word SolidsShiningTownB			;Round 53
	.word SolidsShiningTownA			;Round 54
	.word SolidsShiningTownA			;Round 55
	.word SolidsShiningTownA			;Round 56
	.word SolidsShiningTownB			;Round 57
	.word SolidsShiningTownA			;Round 58
	.word SolidsShiningTownA			;Round 59
	.word SolidsBossCave				;Round 60
	.word SolidsFireCastle				;Round 61
	.word SolidsFireCastle				;Round 62
	.word SolidsFireCastle				;Round 63
	.word SolidsFireCastle				;Round 64
	.word SolidsFireCastle				;Round 65
	.word SolidsFireCastle				;Round 66
	.word SolidsFireCastle				;Round 67
	.word SolidsFireCastle				;Round 68
	.word SolidsFireCastle				;Round 69
	.word SolidsFireCastle				;Round 70
	.word SolidsFireCastle				;Round 71
	.word SolidsFireCastle				;Round 72
	.word SolidsFireCastle				;Round 73
	.word SolidsFireCastle				;Round 74
	.word SolidsFireCastle				;Round 75
	.word SolidsFireCastle				;Round 76
	.word SolidsFireCastle				;Round 77
	.word SolidsFireCastle				;Round 78
	.word SolidsBossCave				;Round 79
	.word SolidsBossCave				;Round 80
	.word SolidsBonusGame				;Round 81 (Bonus 1)
	.word SolidsBonusGame				;Round 82 (Bonus 2)
	.word SolidsBonusGame				;Round 83 (Bonus 3)

SolidsGiantTowerA:
	.byte $01					;- D 0 - - - 0x00D793 03:B783: 01
	.byte $21					;- D 0 - - - 0x00D794 03:B784: 21
	.byte $1D					;- D 0 - - - 0x00D795 03:B785: 1D
	.byte $21					;- D 0 - - - 0x00D796 03:B786: 21
	.byte $FF					;- D 0 - - - 0x00D797 03:B787: FF
	.byte $FF					;- D 0 - - - 0x00D798 03:B788: FF
	.byte $FF					;- D 0 - - - 0x00D799 03:B789: FF
	.byte $FF					;- D 0 - - - 0x00D79A 03:B78A: FF
	.byte $FF					;- D 0 - - - 0x00D79B 03:B78B: FF
	.byte $FF					;- D 0 - - - 0x00D79C 03:B78C: FF
	.byte $FF					;- D 0 - - - 0x00D79D 03:B78D: FF

SolidsGiantTowerB:
	.byte $01					;- D 0 - - - 0x00D79E 03:B78E: 01
	.byte $38					;- D 0 - - - 0x00D79F 03:B78F: 38
	.byte $1D					;- D 0 - - - 0x00D7A0 03:B790: 1D
	.byte $21					;- D 0 - - - 0x00D7A1 03:B791: 21
	.byte $FF					;- D 0 - - - 0x00D7A2 03:B792: FF
	.byte $FF					;- D 0 - - - 0x00D7A3 03:B793: FF
	.byte $1D					;- D 0 - - - 0x00D7A4 03:B794: 1D
	.byte $38					;- D 0 - - - 0x00D7A5 03:B795: 38
	.byte $FF					;- D 0 - - - 0x00D7A6 03:B796: FF
	.byte $FF					;- D 0 - - - 0x00D7A7 03:B797: FF
	.byte $FF					;- D 0 - - - 0x00D7A8 03:B798: FF

SolidsUnkB799:
	.byte $01					;- - - - - - 0x00D7A9 03:B799: 01
	.byte $10					;- - - - - - 0x00D7AA 03:B79A: 10
	.byte $0C					;- - - - - - 0x00D7AB 03:B79B: 0C
	.byte $10					;- - - - - - 0x00D7AC 03:B79C: 10
	.byte $FF					;- - - - - - 0x00D7AD 03:B79D: FF
	.byte $FF					;- - - - - - 0x00D7AE 03:B79E: FF
	.byte $FF					;- - - - - - 0x00D7AF 03:B79F: FF
	.byte $FF					;- - - - - - 0x00D7B0 03:B7A0: FF
	.byte $10					;- - - - - - 0x00D7B1 03:B7A1: 10
	.byte $20					;- - - - - - 0x00D7B2 03:B7A2: 20
	.byte $FF					;- - - - - - 0x00D7B3 03:B7A3: FF

SolidsBoomtown:
	.byte $01					;- D 0 - - - 0x00D7B4 03:B7A4: 01
	.byte $1A					;- D 0 - - - 0x00D7B5 03:B7A5: 1A
	.byte $16					;- D 0 - - - 0x00D7B6 03:B7A6: 16
	.byte $1A					;- D 0 - - - 0x00D7B7 03:B7A7: 1A
	.byte $1C					;- D 0 - - - 0x00D7B8 03:B7A8: 1C
	.byte $20					;- D 0 - - - 0x00D7B9 03:B7A9: 20
	.byte $FF					;- D 0 - - - 0x00D7BA 03:B7AA: FF
	.byte $FF					;- D 0 - - - 0x00D7BB 03:B7AB: FF
	.byte $1A					;- D 0 - - - 0x00D7BC 03:B7AC: 1A
	.byte $1A					;- D 0 - - - 0x00D7BD 03:B7AD: 1A
	.byte $09					;- D 0 - - - 0x00D7BE 03:B7AE: 09

SolidsShiningTownA:
	.byte $01					;- D 0 - - - 0x00D7BF 03:B7AF: 01
	.byte $14					;- D 0 - - - 0x00D7C0 03:B7B0: 14
	.byte $12					;- D 0 - - - 0x00D7C1 03:B7B1: 12
	.byte $14					;- D 0 - - - 0x00D7C2 03:B7B2: 14
	.byte $14					;- D 0 - - - 0x00D7C3 03:B7B3: 14
	.byte $18					;- D 0 - - - 0x00D7C4 03:B7B4: 18
	.byte $FF					;- D 0 - - - 0x00D7C5 03:B7B5: FF
	.byte $FF					;- D 0 - - - 0x00D7C6 03:B7B6: FF
	.byte $FF					;- D 0 - - - 0x00D7C7 03:B7B7: FF
	.byte $FF					;- D 0 - - - 0x00D7C8 03:B7B8: FF
	.byte $18					;- D 0 - - - 0x00D7C9 03:B7B9: 18

SolidsShiningTownB:
	.byte $01					;- D 0 - - - 0x00D7CA 03:B7BA: 01
	.byte $26					;- D 0 - - - 0x00D7CB 03:B7BB: 26
	.byte $12					;- D 0 - - - 0x00D7CC 03:B7BC: 12
	.byte $14					;- D 0 - - - 0x00D7CD 03:B7BD: 14
	.byte $14					;- D 0 - - - 0x00D7CE 03:B7BE: 14
	.byte $18					;- D 0 - - - 0x00D7CF 03:B7BF: 18
	.byte $18					;- D 0 - - - 0x00D7D0 03:B7C0: 18
	.byte $26					;- D 0 - - - 0x00D7D1 03:B7C1: 26
	.byte $FF					;- D 0 - - - 0x00D7D2 03:B7C2: FF
	.byte $FF					;- D 0 - - - 0x00D7D3 03:B7C3: FF
	.byte $FF					;- D 0 - - - 0x00D7D4 03:B7C4: FF

SolidsFireCastle:
	.byte $01					;- D 0 - - - 0x00D7D5 03:B7C5: 01
	.byte $20					;- D 0 - - - 0x00D7D6 03:B7C6: 20
	.byte $FF					;- D 0 - - - 0x00D7D7 03:B7C7: FF
	.byte $FF					;- D 0 - - - 0x00D7D8 03:B7C8: FF
	.byte $20					;- D 0 - - - 0x00D7D9 03:B7C9: 20
	.byte $24					;- D 0 - - - 0x00D7DA 03:B7CA: 24
	.byte $FF					;- D 0 - - - 0x00D7DB 03:B7CB: FF
	.byte $FF					;- D 0 - - - 0x00D7DC 03:B7CC: FF
	.byte $FF					;- D 0 - - - 0x00D7DD 03:B7CD: FF
	.byte $FF					;- D 0 - - - 0x00D7DE 03:B7CE: FF
	.byte $FF					;- D 0 - - - 0x00D7DF 03:B7CF: FF

SolidsBossCave:
	.byte $01					;- D 0 - - - 0x00D7E0 03:B7D0: 01
	.byte $2A					;- D 0 - - - 0x00D7E1 03:B7D1: 2A
	.byte $FF					;- D 0 - - - 0x00D7E2 03:B7D2: FF
	.byte $FF					;- D 0 - - - 0x00D7E3 03:B7D3: FF
	.byte $2A					;- D 0 - - - 0x00D7E4 03:B7D4: 2A
	.byte $2E					;- D 0 - - - 0x00D7E5 03:B7D5: 2E
	.byte $FF					;- D 0 - - - 0x00D7E6 03:B7D6: FF
	.byte $FF					;- D 0 - - - 0x00D7E7 03:B7D7: FF
	.byte $FF					;- D 0 - - - 0x00D7E8 03:B7D8: FF
	.byte $FF					;- D 0 - - - 0x00D7E9 03:B7D9: FF
	.byte $FF					;- D 0 - - - 0x00D7EA 03:B7DA: FF

SolidsWideBossCave:
	.byte $01					;- D 0 - - - 0x00D7EB 03:B7DB: 01
	.byte $2F					;- D 0 - - - 0x00D7EC 03:B7DC: 2F
	.byte $FF					;- D 0 - - - 0x00D7ED 03:B7DD: FF
	.byte $FF					;- D 0 - - - 0x00D7EE 03:B7DE: FF
	.byte $FF					;- D 0 - - - 0x00D7EF 03:B7DF: FF
	.byte $FF					;- D 0 - - - 0x00D7F0 03:B7E0: FF
	.byte $FF					;- D 0 - - - 0x00D7F1 03:B7E1: FF
	.byte $FF					;- D 0 - - - 0x00D7F2 03:B7E2: FF
	.byte $FF					;- D 0 - - - 0x00D7F3 03:B7E3: FF
	.byte $FF					;- D 0 - - - 0x00D7F4 03:B7E4: FF
	.byte $FF					;- D 0 - - - 0x00D7F5 03:B7E5: FF

SolidsBonusGame:
	.byte $01					;- D 0 - - - 0x00D7F6 03:B7E6: 01
	.byte $22					;- D 0 - - - 0x00D7F7 03:B7E7: 22
	.byte $FF					;- D 0 - - - 0x00D7F8 03:B7E8: FF
	.byte $FF					;- D 0 - - - 0x00D7F9 03:B7E9: FF
	.byte $FF					;- D 0 - - - 0x00D7FA 03:B7EA: FF
	.byte $FF					;- D 0 - - - 0x00D7FB 03:B7EB: FF
	.byte $FF					;- D 0 - - - 0x00D7FC 03:B7EC: FF
	.byte $FF					;- D 0 - - - 0x00D7FD 03:B7ED: FF
	.byte $FF					;- D 0 - - - 0x00D7FE 03:B7EE: FF
	.byte $FF					;- D 0 - - - 0x00D7FF 03:B7EF: FF
	.byte $FF					;- D 0 - - - 0x00D800 03:B7F0: FF

DATA_06B7F1:
	;- D 0 - - - 0x00D801 03:B7F1: 01
	.byte $01					;Round 30
	.byte $01					;Round 31
	.byte $03					;Round 32
	.byte $03					;Round 33
	.byte $04					;Round 34
	.byte $04					;Round 35
	.byte $05					;Round 36
	.byte $0B					;Round 37
	.byte $0B					;Round 38
	.byte $0E					;Round 39
	.byte $0E					;Round 40 (not used)

DATA_06B7FC:
	;- D 0 - - - 0x00D80C 03:B7FC: 03
	.byte $03					;Round 30
	.byte $03					;Round 31
	.byte $04					;Round 32
	.byte $04					;Round 33
	.byte $05					;Round 34
	.byte $05					;Round 35
	.byte $0B					;Round 36
	.byte $0E					;Round 37
	.byte $0E					;Round 38
	.byte $11					;Round 39
	.byte $11					;Round 40 (not used)

DATA_06B807:
	;- - - - - - 0x00D817 03:B807: 00
	.byte $00					;Round 00
	.byte $00					;Round 01
	.byte $00					;Round 02
	.byte $00					;Round 03
	.byte $00					;Round 04
	.byte $00					;Round 05
	.byte $00					;Round 06
	.byte $00					;Round 07
	.byte $00					;Round 08
	.byte $00					;Round 09
	.byte $00					;Round 10
	.byte $00					;Round 11
	.byte $00					;Round 12
	.byte $00					;Round 13
	.byte $00					;Round 14
	.byte $00					;Round 15
	.byte $00					;Round 16
	.byte $00					;Round 17
	.byte $00					;Round 18
	.byte $00					;Round 19
	.byte $00					;Round 20
	.byte $04					;Round 21
	.byte $04					;Round 22
	.byte $04					;Round 23
	.byte $04					;Round 24
	.byte $04					;Round 25
	.byte $04					;Round 26
	.byte $04					;Round 27
	.byte $04					;Round 28
	.byte $04					;Round 29
	.byte $04					;Round 30
	.byte $04					;Round 31
	.byte $04					;Round 32
	.byte $00					;Round 33
	.byte $04					;Round 34
	.byte $04					;Round 35
	.byte $04					;Round 36
	.byte $04					;Round 37
	.byte $00					;Round 38
	.byte $04					;Round 39
	.byte $04					;Round 40
	.byte $04					;Round 41
	.byte $04					;Round 42
	.byte $04					;Round 43
	.byte $04					;Round 44
	.byte $04					;Round 45
	.byte $04					;Round 46
	.byte $04					;Round 47
	.byte $04					;Round 48
	.byte $04					;Round 49
	.byte $00					;Round 50
	.byte $04					;Round 51
	.byte $04					;Round 52
	.byte $04					;Round 53
	.byte $04					;Round 54
	.byte $04					;Round 55
	.byte $04					;Round 56
	.byte $FE					;Round 57
	.byte $04					;Round 58
	.byte $04					;Round 59
	.byte $04					;Round 60
	.byte $04					;Round 61
	.byte $04					;Round 62
	.byte $04					;Round 63
	.byte $04					;Round 64
	.byte $04					;Round 65
	.byte $04					;Round 66
	.byte $04					;Round 67
	.byte $04					;Round 68
	.byte $04					;Round 69
	.byte $04					;Round 70
	.byte $04					;Round 71
	.byte $04					;Round 72
	.byte $04					;Round 73
	.byte $04					;Round 74
	.byte $04					;Round 75
	.byte $04					;Round 76
	.byte $04					;Round 77
	.byte $04					;Round 78
	.byte $04					;Round 79
	.byte $04					;Round 80

DATA_06B858:
	.byte $00					;- D 0 - - - 0x00D868 03:B858: 00
	.byte $7E					;- D 0 - - - 0x00D869 03:B859: 7E
	.byte $7E					;- D 0 - - - 0x00D86A 03:B85A: 7E
	.byte $7E					;- - - - - - 0x00D86B 03:B85B: 7E
	.byte $7E					;- - - - - - 0x00D86C 03:B85C: 7E
	.byte $7E					;- - - - - - 0x00D86D 03:B85D: 7E
	.byte $7E					;- - - - - - 0x00D86E 03:B85E: 7E
	.byte $7E					;- - - - - - 0x00D86F 03:B85F: 7E
	.byte $7E					;- - - - - - 0x00D870 03:B860: 7E
	.byte $7E					;- - - - - - 0x00D871 03:B861: 7E
	.byte $7E					;- - - - - - 0x00D872 03:B862: 7E
	.byte $7E					;- - - - - - 0x00D873 03:B863: 7E
	.byte $7E					;- - - - - - 0x00D874 03:B864: 7E
	.byte $7E					;- - - - - - 0x00D875 03:B865: 7E
	.byte $7E					;- - - - - - 0x00D876 03:B866: 7E
	.byte $7E					;- - - - - - 0x00D877 03:B867: 7E
	.byte $7E					;- - - - - - 0x00D878 03:B868: 7E
	.byte $7E					;- - - - - - 0x00D879 03:B869: 7E
	.byte $7E					;- - - - - - 0x00D87A 03:B86A: 7E
	.byte $7E					;- - - - - - 0x00D87B 03:B86B: 7E
	.byte $7E					;- - - - - - 0x00D87C 03:B86C: 7E
	.byte $7E					;- - - - - - 0x00D87D 03:B86D: 7E
	.byte $7E					;- - - - - - 0x00D87E 03:B86E: 7E
	.byte $7E					;- - - - - - 0x00D87F 03:B86F: 7E
	.byte $7E					;- - - - - - 0x00D880 03:B870: 7E
	.byte $7E					;- - - - - - 0x00D881 03:B871: 7E
	.byte $7E					;- - - - - - 0x00D882 03:B872: 7E
	.byte $7E					;- - - - - - 0x00D883 03:B873: 7E
	.byte $7E					;- - - - - - 0x00D884 03:B874: 7E
	.byte $7E					;- - - - - - 0x00D885 03:B875: 7E
	.byte $7E					;- - - - - - 0x00D886 03:B876: 7E
	.byte $7E					;- - - - - - 0x00D887 03:B877: 7E
	.byte $7E					;- D 0 - - - 0x00D888 03:B878: 7E
	.byte $7E					;- - - - - - 0x00D889 03:B879: 7E
	.byte $7E					;- - - - - - 0x00D88A 03:B87A: 7E
	.byte $7E					;- - - - - - 0x00D88B 03:B87B: 7E
	.byte $7E					;- - - - - - 0x00D88C 03:B87C: 7E
	.byte $7E					;- - - - - - 0x00D88D 03:B87D: 7E
	.byte $7E					;- - - - - - 0x00D88E 03:B87E: 7E
	.byte $7E					;- - - - - - 0x00D88F 03:B87F: 7E
	.byte $7E					;- - - - - - 0x00D890 03:B880: 7E
	.byte $7E					;- - - - - - 0x00D891 03:B881: 7E
	.byte $7E					;- - - - - - 0x00D892 03:B882: 7E
	.byte $7E					;- - - - - - 0x00D893 03:B883: 7E
	.byte $7E					;- - - - - - 0x00D894 03:B884: 7E
	.byte $7E					;- - - - - - 0x00D895 03:B885: 7E
	.byte $7E					;- - - - - - 0x00D896 03:B886: 7E
	.byte $7E					;- - - - - - 0x00D897 03:B887: 7E
	.byte $6A					;- - - - - - 0x00D898 03:B888: 6A
	.byte $6C					;- - - - - - 0x00D899 03:B889: 6C
	.byte $6E					;- - - - - - 0x00D89A 03:B88A: 6E
	.byte $70					;- - - - - - 0x00D89B 03:B88B: 70
	.byte $72					;- - - - - - 0x00D89C 03:B88C: 72
	.byte $74					;- - - - - - 0x00D89D 03:B88D: 74
	.byte $76					;- - - - - - 0x00D89E 03:B88E: 76
	.byte $78					;- - - - - - 0x00D89F 03:B88F: 78
	.byte $7A					;- - - - - - 0x00D8A0 03:B890: 7A
	.byte $7C					;- - - - - - 0x00D8A1 03:B891: 7C
	.byte $7E					;- - - - - - 0x00D8A2 03:B892: 7E
	.byte $7E					;- - - - - - 0x00D8A3 03:B893: 7E
	.byte $7E					;- - - - - - 0x00D8A4 03:B894: 7E
	.byte $7E					;- - - - - - 0x00D8A5 03:B895: 7E
	.byte $7E					;- - - - - - 0x00D8A6 03:B896: 7E
	.byte $7E					;- - - - - - 0x00D8A7 03:B897: 7E
	.byte $00					;- - - - - - 0x00D8A8 03:B898: 00
	.byte $2E					;- D 0 - - - 0x00D8A9 03:B899: 2E
	.byte $30					;- - - - - - 0x00D8AA 03:B89A: 30
	.byte $32					;- - - - - - 0x00D8AB 03:B89B: 32
	.byte $34					;- - - - - - 0x00D8AC 03:B89C: 34
	.byte $36					;- - - - - - 0x00D8AD 03:B89D: 36
	.byte $38					;- - - - - - 0x00D8AE 03:B89E: 38
	.byte $3A					;- - - - - - 0x00D8AF 03:B89F: 3A
	.byte $3C					;- D 0 - - - 0x00D8B0 03:B8A0: 3C
	.byte $3E					;- - - - - - 0x00D8B1 03:B8A1: 3E
	.byte $40					;- - - - - - 0x00D8B2 03:B8A2: 40
	.byte $42					;- D 0 - - - 0x00D8B3 03:B8A3: 42
	.byte $44					;- - - - - - 0x00D8B4 03:B8A4: 44
	.byte $46					;- - - - - - 0x00D8B5 03:B8A5: 46
	.byte $48					;- D 0 - - - 0x00D8B6 03:B8A6: 48
	.byte $4A					;- D 0 - - - 0x00D8B7 03:B8A7: 4A
	.byte $4C					;- - - - - - 0x00D8B8 03:B8A8: 4C
	.byte $4E					;- - - - - - 0x00D8B9 03:B8A9: 4E
	.byte $50					;- - - - - - 0x00D8BA 03:B8AA: 50
	.byte $52					;- - - - - - 0x00D8BB 03:B8AB: 52
	.byte $54					;- D 0 - - - 0x00D8BC 03:B8AC: 54
	.byte $56					;- D 0 - - - 0x00D8BD 03:B8AD: 56
	.byte $58					;- - - - - - 0x00D8BE 03:B8AE: 58
	.byte $5A					;- - - - - - 0x00D8BF 03:B8AF: 5A
	.byte $5C					;- - - - - - 0x00D8C0 03:B8B0: 5C
	.byte $5E					;- D 0 - - - 0x00D8C1 03:B8B1: 5E
	.byte $60					;- - - - - - 0x00D8C2 03:B8B2: 60
	.byte $7E					;- - - - - - 0x00D8C3 03:B8B3: 7E
	.byte $7E					;- - - - - - 0x00D8C4 03:B8B4: 7E
	.byte $7E					;- - - - - - 0x00D8C5 03:B8B5: 7E

DATA_06B8B6:
	;- - - - - - 0x00D8C6 03:B8B6: E8
	.word DATA_06B8E8
	.word DATA_06B8E8
	.word DATA_06B8FF
	.word DATA_06B909
	.word DATA_06B92A
	.word DATA_06B933
	.word DATA_06B944
	.word DATA_06B950
	.word DATA_06B960
	.word DATA_06B971
	.word DATA_06B97E
	.word DATA_06B98D
	.word DATA_06B99C
	.word DATA_06B9AD
	.word DATA_06B9BE
	.word DATA_06B9CC
	.word DATA_06B9D9
	.word DATA_06B9E0
	.word DATA_06B9E8
	.word DATA_06B9F5
	.word DATA_06BA07
	.word DATA_06BA17
	.word DATA_06BA26
	.word DATA_06BA35
	.word DATA_06BA44

DATA_06B8E8:
	.byte $58					;- - - - - - 0x00D8F8 03:B8E8: 58
	.byte $30					;- - - - - - 0x00D8F9 03:B8E9: 30
	.byte $30					;- - - - - - 0x00D8FA 03:B8EA: 30
	.byte $20					;- - - - - - 0x00D8FB 03:B8EB: 20
	.byte $20					;- - - - - - 0x00D8FC 03:B8EC: 20
	.byte $20					;- - - - - - 0x00D8FD 03:B8ED: 20
	.byte $20					;- - - - - - 0x00D8FE 03:B8EE: 20
	.byte $20					;- - - - - - 0x00D8FF 03:B8EF: 20
	.byte $20					;- - - - - - 0x00D900 03:B8F0: 20
	.byte $20					;- - - - - - 0x00D901 03:B8F1: 20
	.byte $20					;- - - - - - 0x00D902 03:B8F2: 20
	.byte $20					;- - - - - - 0x00D903 03:B8F3: 20
	.byte $20					;- - - - - - 0x00D904 03:B8F4: 20
	.byte $20					;- - - - - - 0x00D905 03:B8F5: 20
	.byte $20					;- - - - - - 0x00D906 03:B8F6: 20
	.byte $30					;- - - - - - 0x00D907 03:B8F7: 30
	.byte $30					;- - - - - - 0x00D908 03:B8F8: 30
	.byte $30					;- - - - - - 0x00D909 03:B8F9: 30
	.byte $30					;- - - - - - 0x00D90A 03:B8FA: 30
	.byte $30					;- - - - - - 0x00D90B 03:B8FB: 30
	.byte $30					;- - - - - - 0x00D90C 03:B8FC: 30
	.byte $30					;- - - - - - 0x00D90D 03:B8FD: 30
	.byte $00					;- - - - - - 0x00D90E 03:B8FE: 00

DATA_06B8FF:
	.byte $54					;- D 0 - - - 0x00D90F 03:B8FF: 54
	.byte $48					;- D 0 - - - 0x00D910 03:B900: 48
	.byte $41					;- D 0 - - - 0x00D911 03:B901: 41
	.byte $4E					;- D 0 - - - 0x00D912 03:B902: 4E
	.byte $4B					;- D 0 - - - 0x00D913 03:B903: 4B
	.byte $20					;- D 0 - - - 0x00D914 03:B904: 20
	.byte $59					;- D 0 - - - 0x00D915 03:B905: 59
	.byte $4F					;- D 0 - - - 0x00D916 03:B906: 4F
	.byte $55					;- D 0 - - - 0x00D917 03:B907: 55
	.byte $00					;- D 0 - - - 0x00D918 03:B908: 00

DATA_06B909:
	.byte $20					;- D 0 - - - 0x00D919 03:B909: 20
	.byte $20					;- D 0 - - - 0x00D91A 03:B90A: 20
	.byte $20					;- D 0 - - - 0x00D91B 03:B90B: 20
	.byte $20					;- D 0 - - - 0x00D91C 03:B90C: 20
	.byte $20					;- D 0 - - - 0x00D91D 03:B90D: 20
	.byte $20					;- D 0 - - - 0x00D91E 03:B90E: 20
	.byte $20					;- D 0 - - - 0x00D91F 03:B90F: 20
	.byte $20					;- D 0 - - - 0x00D920 03:B910: 20
	.byte $20					;- D 0 - - - 0x00D921 03:B911: 20
	.byte $20					;- D 0 - - - 0x00D922 03:B912: 20
	.byte $20					;- D 0 - - - 0x00D923 03:B913: 20
	.byte $20					;- D 0 - - - 0x00D924 03:B914: 20
	.byte $20					;- D 0 - - - 0x00D925 03:B915: 20
	.byte $20					;- D 0 - - - 0x00D926 03:B916: 20
	.byte $20					;- D 0 - - - 0x00D927 03:B917: 20
	.byte $20					;- D 0 - - - 0x00D928 03:B918: 20
	.byte $20					;- D 0 - - - 0x00D929 03:B919: 20
	.byte $20					;- D 0 - - - 0x00D92A 03:B91A: 20
	.byte $20					;- D 0 - - - 0x00D92B 03:B91B: 20
	.byte $20					;- D 0 - - - 0x00D92C 03:B91C: 20
	.byte $20					;- D 0 - - - 0x00D92D 03:B91D: 20
	.byte $20					;- D 0 - - - 0x00D92E 03:B91E: 20
	.byte $20					;- D 0 - - - 0x00D92F 03:B91F: 20
	.byte $20					;- D 0 - - - 0x00D930 03:B920: 20
	.byte $20					;- D 0 - - - 0x00D931 03:B921: 20
	.byte $20					;- D 0 - - - 0x00D932 03:B922: 20
	.byte $20					;- D 0 - - - 0x00D933 03:B923: 20
	.byte $20					;- D 0 - - - 0x00D934 03:B924: 20
	.byte $20					;- D 0 - - - 0x00D935 03:B925: 20
	.byte $20					;- D 0 - - - 0x00D936 03:B926: 20
	.byte $20					;- D 0 - - - 0x00D937 03:B927: 20
	.byte $20					;- D 0 - - - 0x00D938 03:B928: 20
	.byte $00					;- - - - - - 0x00D939 03:B929: 00

DATA_06B92A:
	.byte $44					;- D 0 - - - 0x00D93A 03:B92A: 44
	.byte $49					;- D 0 - - - 0x00D93B 03:B92B: 49
	.byte $52					;- D 0 - - - 0x00D93C 03:B92C: 52
	.byte $45					;- D 0 - - - 0x00D93D 03:B92D: 45
	.byte $43					;- D 0 - - - 0x00D93E 03:B92E: 43
	.byte $54					;- D 0 - - - 0x00D93F 03:B92F: 54
	.byte $4F					;- D 0 - - - 0x00D940 03:B930: 4F
	.byte $52					;- D 0 - - - 0x00D941 03:B931: 52
	.byte $00					;- D 0 - - - 0x00D942 03:B932: 00

DATA_06B933:
	.byte $50					;- D 0 - - - 0x00D943 03:B933: 50
	.byte $52					;- D 0 - - - 0x00D944 03:B934: 52
	.byte $4F					;- D 0 - - - 0x00D945 03:B935: 4F
	.byte $47					;- D 0 - - - 0x00D946 03:B936: 47
	.byte $52					;- D 0 - - - 0x00D947 03:B937: 52
	.byte $41					;- D 0 - - - 0x00D948 03:B938: 41
	.byte $4D					;- D 0 - - - 0x00D949 03:B939: 4D
	.byte $20					;- D 0 - - - 0x00D94A 03:B93A: 20
	.byte $44					;- D 0 - - - 0x00D94B 03:B93B: 44
	.byte $49					;- D 0 - - - 0x00D94C 03:B93C: 49
	.byte $52					;- D 0 - - - 0x00D94D 03:B93D: 52
	.byte $45					;- D 0 - - - 0x00D94E 03:B93E: 45
	.byte $43					;- D 0 - - - 0x00D94F 03:B93F: 43
	.byte $54					;- D 0 - - - 0x00D950 03:B940: 54
	.byte $4F					;- D 0 - - - 0x00D951 03:B941: 4F
	.byte $52					;- D 0 - - - 0x00D952 03:B942: 52
	.byte $00					;- D 0 - - - 0x00D953 03:B943: 00

DATA_06B944:
	.byte $50					;- D 0 - - - 0x00D954 03:B944: 50
	.byte $52					;- D 0 - - - 0x00D955 03:B945: 52
	.byte $4F					;- D 0 - - - 0x00D956 03:B946: 4F
	.byte $47					;- D 0 - - - 0x00D957 03:B947: 47
	.byte $52					;- D 0 - - - 0x00D958 03:B948: 52
	.byte $41					;- D 0 - - - 0x00D959 03:B949: 41
	.byte $4D					;- D 0 - - - 0x00D95A 03:B94A: 4D
	.byte $4D					;- D 0 - - - 0x00D95B 03:B94B: 4D
	.byte $45					;- D 0 - - - 0x00D95C 03:B94C: 45
	.byte $52					;- D 0 - - - 0x00D95D 03:B94D: 52
	.byte $53					;- D 0 - - - 0x00D95E 03:B94E: 53
	.byte $00					;- D 0 - - - 0x00D95F 03:B94F: 00

DATA_06B950:
	.byte $47					;- D 0 - - - 0x00D960 03:B950: 47
	.byte $52					;- D 0 - - - 0x00D961 03:B951: 52
	.byte $41					;- D 0 - - - 0x00D962 03:B952: 41
	.byte $50					;- D 0 - - - 0x00D963 03:B953: 50
	.byte $48					;- D 0 - - - 0x00D964 03:B954: 48
	.byte $49					;- D 0 - - - 0x00D965 03:B955: 49
	.byte $43					;- D 0 - - - 0x00D966 03:B956: 43
	.byte $53					;- D 0 - - - 0x00D967 03:B957: 53
	.byte $20					;- D 0 - - - 0x00D968 03:B958: 20
	.byte $44					;- D 0 - - - 0x00D969 03:B959: 44
	.byte $45					;- D 0 - - - 0x00D96A 03:B95A: 45
	.byte $53					;- D 0 - - - 0x00D96B 03:B95B: 53
	.byte $49					;- D 0 - - - 0x00D96C 03:B95C: 49
	.byte $47					;- D 0 - - - 0x00D96D 03:B95D: 47
	.byte $4E					;- D 0 - - - 0x00D96E 03:B95E: 4E
	.byte $00					;- D 0 - - - 0x00D96F 03:B95F: 00

DATA_06B960:
	.byte $43					;- D 0 - - - 0x00D970 03:B960: 43
	.byte $48					;- D 0 - - - 0x00D971 03:B961: 48
	.byte $41					;- D 0 - - - 0x00D972 03:B962: 41
	.byte $52					;- D 0 - - - 0x00D973 03:B963: 52
	.byte $41					;- D 0 - - - 0x00D974 03:B964: 41
	.byte $43					;- D 0 - - - 0x00D975 03:B965: 43
	.byte $54					;- D 0 - - - 0x00D976 03:B966: 54
	.byte $45					;- D 0 - - - 0x00D977 03:B967: 45
	.byte $52					;- D 0 - - - 0x00D978 03:B968: 52
	.byte $20					;- D 0 - - - 0x00D979 03:B969: 20
	.byte $44					;- D 0 - - - 0x00D97A 03:B96A: 44
	.byte $45					;- D 0 - - - 0x00D97B 03:B96B: 45
	.byte $53					;- D 0 - - - 0x00D97C 03:B96C: 53
	.byte $49					;- D 0 - - - 0x00D97D 03:B96D: 49
	.byte $47					;- D 0 - - - 0x00D97E 03:B96E: 47
	.byte $4E					;- D 0 - - - 0x00D97F 03:B96F: 4E
	.byte $00					;- D 0 - - - 0x00D980 03:B970: 00

DATA_06B971:
	.byte $4D					;- D 0 - - - 0x00D981 03:B971: 4D
	.byte $55					;- D 0 - - - 0x00D982 03:B972: 55
	.byte $53					;- D 0 - - - 0x00D983 03:B973: 53
	.byte $49					;- D 0 - - - 0x00D984 03:B974: 49
	.byte $43					;- D 0 - - - 0x00D985 03:B975: 43
	.byte $20					;- D 0 - - - 0x00D986 03:B976: 20
	.byte $44					;- D 0 - - - 0x00D987 03:B977: 44
	.byte $45					;- D 0 - - - 0x00D988 03:B978: 45
	.byte $53					;- D 0 - - - 0x00D989 03:B979: 53
	.byte $49					;- D 0 - - - 0x00D98A 03:B97A: 49
	.byte $47					;- D 0 - - - 0x00D98B 03:B97B: 47
	.byte $4E					;- D 0 - - - 0x00D98C 03:B97C: 4E
	.byte $00					;- D 0 - - - 0x00D98D 03:B97D: 00

DATA_06B97E:
	.byte $47					;- D 0 - - - 0x00D98E 03:B97E: 47
	.byte $41					;- D 0 - - - 0x00D98F 03:B97F: 41
	.byte $4D					;- D 0 - - - 0x00D990 03:B980: 4D
	.byte $45					;- D 0 - - - 0x00D991 03:B981: 45
	.byte $20					;- D 0 - - - 0x00D992 03:B982: 20
	.byte $44					;- D 0 - - - 0x00D993 03:B983: 44
	.byte $45					;- D 0 - - - 0x00D994 03:B984: 45
	.byte $53					;- D 0 - - - 0x00D995 03:B985: 53
	.byte $49					;- D 0 - - - 0x00D996 03:B986: 49
	.byte $47					;- D 0 - - - 0x00D997 03:B987: 47
	.byte $4E					;- D 0 - - - 0x00D998 03:B988: 4E
	.byte $45					;- D 0 - - - 0x00D999 03:B989: 45
	.byte $52					;- D 0 - - - 0x00D99A 03:B98A: 52
	.byte $53					;- D 0 - - - 0x00D99B 03:B98B: 53
	.byte $00					;- D 0 - - - 0x00D99C 03:B98C: 00

DATA_06B98D:
	.byte $53					;- D 0 - - - 0x00D99D 03:B98D: 53
	.byte $50					;- D 0 - - - 0x00D99E 03:B98E: 50
	.byte $45					;- D 0 - - - 0x00D99F 03:B98F: 45
	.byte $43					;- D 0 - - - 0x00D9A0 03:B990: 43
	.byte $49					;- D 0 - - - 0x00D9A1 03:B991: 49
	.byte $41					;- D 0 - - - 0x00D9A2 03:B992: 41
	.byte $4C					;- D 0 - - - 0x00D9A3 03:B993: 4C
	.byte $20					;- D 0 - - - 0x00D9A4 03:B994: 20
	.byte $54					;- D 0 - - - 0x00D9A5 03:B995: 54
	.byte $48					;- D 0 - - - 0x00D9A6 03:B996: 48
	.byte $41					;- D 0 - - - 0x00D9A7 03:B997: 41
	.byte $4E					;- D 0 - - - 0x00D9A8 03:B998: 4E
	.byte $4B					;- D 0 - - - 0x00D9A9 03:B999: 4B
	.byte $53					;- D 0 - - - 0x00D9AA 03:B99A: 53
	.byte $00					;- D 0 - - - 0x00D9AB 03:B99B: 00

DATA_06B99C:
	.byte $54					;- D 0 - - - 0x00D9AC 03:B99C: 54
	.byte $41					;- D 0 - - - 0x00D9AD 03:B99D: 41
	.byte $4B					;- D 0 - - - 0x00D9AE 03:B99E: 4B
	.byte $41					;- D 0 - - - 0x00D9AF 03:B99F: 41
	.byte $53					;- D 0 - - - 0x00D9B0 03:B9A0: 53
	.byte $48					;- D 0 - - - 0x00D9B1 03:B9A1: 48
	.byte $49					;- D 0 - - - 0x00D9B2 03:B9A2: 49
	.byte $20					;- D 0 - - - 0x00D9B3 03:B9A3: 20
	.byte $53					;- D 0 - - - 0x00D9B4 03:B9A4: 53
	.byte $48					;- D 0 - - - 0x00D9B5 03:B9A5: 48
	.byte $49					;- D 0 - - - 0x00D9B6 03:B9A6: 49
	.byte $4F					;- D 0 - - - 0x00D9B7 03:B9A7: 4F
	.byte $4B					;- D 0 - - - 0x00D9B8 03:B9A8: 4B
	.byte $41					;- D 0 - - - 0x00D9B9 03:B9A9: 41
	.byte $57					;- D 0 - - - 0x00D9BA 03:B9AA: 57
	.byte $41					;- D 0 - - - 0x00D9BB 03:B9AB: 41
	.byte $00					;- D 0 - - - 0x00D9BC 03:B9AC: 00

DATA_06B9AD:
	.byte $59					;- D 0 - - - 0x00D9BD 03:B9AD: 59
	.byte $4F					;- D 0 - - - 0x00D9BE 03:B9AE: 4F
	.byte $53					;- D 0 - - - 0x00D9BF 03:B9AF: 53
	.byte $48					;- D 0 - - - 0x00D9C0 03:B9B0: 48
	.byte $49					;- D 0 - - - 0x00D9C1 03:B9B1: 49
	.byte $48					;- D 0 - - - 0x00D9C2 03:B9B2: 48
	.byte $49					;- D 0 - - - 0x00D9C3 03:B9B3: 49
	.byte $53					;- D 0 - - - 0x00D9C4 03:B9B4: 53
	.byte $41					;- D 0 - - - 0x00D9C5 03:B9B5: 41
	.byte $20					;- D 0 - - - 0x00D9C6 03:B9B6: 20
	.byte $41					;- D 0 - - - 0x00D9C7 03:B9B7: 41
	.byte $4B					;- D 0 - - - 0x00D9C8 03:B9B8: 4B
	.byte $41					;- D 0 - - - 0x00D9C9 03:B9B9: 41
	.byte $53					;- D 0 - - - 0x00D9CA 03:B9BA: 53
	.byte $48					;- D 0 - - - 0x00D9CB 03:B9BB: 48
	.byte $49					;- D 0 - - - 0x00D9CC 03:B9BC: 49
	.byte $00					;- D 0 - - - 0x00D9CD 03:B9BD: 00

DATA_06B9BE:
	.byte $4B					;- D 0 - - - 0x00D9CE 03:B9BE: 4B
	.byte $45					;- D 0 - - - 0x00D9CF 03:B9BF: 45
	.byte $4E					;- D 0 - - - 0x00D9D0 03:B9C0: 4E
	.byte $49					;- D 0 - - - 0x00D9D1 03:B9C1: 49
	.byte $43					;- D 0 - - - 0x00D9D2 03:B9C2: 43
	.byte $48					;- D 0 - - - 0x00D9D3 03:B9C3: 48
	.byte $49					;- D 0 - - - 0x00D9D4 03:B9C4: 49
	.byte $20					;- D 0 - - - 0x00D9D5 03:B9C5: 20
	.byte $4B					;- D 0 - - - 0x00D9D6 03:B9C6: 4B
	.byte $41					;- D 0 - - - 0x00D9D7 03:B9C7: 41
	.byte $4D					;- D 0 - - - 0x00D9D8 03:B9C8: 4D
	.byte $49					;- D 0 - - - 0x00D9D9 03:B9C9: 49
	.byte $4F					;- D 0 - - - 0x00D9DA 03:B9CA: 4F
	.byte $00					;- D 0 - - - 0x00D9DB 03:B9CB: 00

DATA_06B9CC:
	.byte $54					;- D 0 - - - 0x00D9DC 03:B9CC: 54
	.byte $49					;- D 0 - - - 0x00D9DD 03:B9CD: 49
	.byte $47					;- D 0 - - - 0x00D9DE 03:B9CE: 47
	.byte $45					;- D 0 - - - 0x00D9DF 03:B9CF: 45
	.byte $52					;- D 0 - - - 0x00D9E0 03:B9D0: 52
	.byte $20					;- D 0 - - - 0x00D9E1 03:B9D1: 20
	.byte $4B					;- D 0 - - - 0x00D9E2 03:B9D2: 4B
	.byte $41					;- D 0 - - - 0x00D9E3 03:B9D3: 41
	.byte $57					;- D 0 - - - 0x00D9E4 03:B9D4: 57
	.byte $41					;- D 0 - - - 0x00D9E5 03:B9D5: 41
	.byte $4E					;- D 0 - - - 0x00D9E6 03:B9D6: 4E
	.byte $4F					;- D 0 - - - 0x00D9E7 03:B9D7: 4F
	.byte $00					;- D 0 - - - 0x00D9E8 03:B9D8: 00

DATA_06B9D9:
	.byte $53					;- D 0 - - - 0x00D9E9 03:B9D9: 53
	.byte $4F					;- D 0 - - - 0x00D9EA 03:B9DA: 4F
	.byte $4E					;- D 0 - - - 0x00D9EB 03:B9DB: 4E
	.byte $4F					;- D 0 - - - 0x00D9EC 03:B9DC: 4F
	.byte $44					;- D 0 - - - 0x00D9ED 03:B9DD: 44
	.byte $41					;- D 0 - - - 0x00D9EE 03:B9DE: 41
	.byte $00					;- D 0 - - - 0x00D9EF 03:B9DF: 00

DATA_06B9E0:
	.byte $53					;- D 0 - - - 0x00D9F0 03:B9E0: 53
	.byte $48					;- D 0 - - - 0x00D9F1 03:B9E1: 48
	.byte $4F					;- D 0 - - - 0x00D9F2 03:B9E2: 4F
	.byte $54					;- D 0 - - - 0x00D9F3 03:B9E3: 54
	.byte $41					;- D 0 - - - 0x00D9F4 03:B9E4: 41
	.byte $52					;- D 0 - - - 0x00D9F5 03:B9E5: 52
	.byte $4F					;- D 0 - - - 0x00D9F6 03:B9E6: 4F
	.byte $00					;- D 0 - - - 0x00D9F7 03:B9E7: 00

DATA_06B9E8:
	.byte $4B					;- D 0 - - - 0x00D9F8 03:B9E8: 4B
	.byte $45					;- D 0 - - - 0x00D9F9 03:B9E9: 45
	.byte $4E					;- D 0 - - - 0x00D9FA 03:B9EA: 4E
	.byte $49					;- D 0 - - - 0x00D9FB 03:B9EB: 49
	.byte $43					;- D 0 - - - 0x00D9FC 03:B9EC: 43
	.byte $48					;- D 0 - - - 0x00D9FD 03:B9ED: 48
	.byte $49					;- D 0 - - - 0x00D9FE 03:B9EE: 49
	.byte $20					;- D 0 - - - 0x00D9FF 03:B9EF: 20
	.byte $48					;- D 0 - - - 0x00DA00 03:B9F0: 48
	.byte $49					;- D 0 - - - 0x00DA01 03:B9F1: 49
	.byte $5A					;- D 0 - - - 0x00DA02 03:B9F2: 5A
	.byte $41					;- D 0 - - - 0x00DA03 03:B9F3: 41
	.byte $00					;- D 0 - - - 0x00DA04 03:B9F4: 00

DATA_06B9F5:
	.byte $48					;- D 0 - - - 0x00DA05 03:B9F5: 48
	.byte $49					;- D 0 - - - 0x00DA06 03:B9F6: 49
	.byte $52					;- D 0 - - - 0x00DA07 03:B9F7: 52
	.byte $4F					;- D 0 - - - 0x00DA08 03:B9F8: 4F
	.byte $54					;- D 0 - - - 0x00DA09 03:B9F9: 54
	.byte $55					;- D 0 - - - 0x00DA0A 03:B9FA: 55
	.byte $47					;- D 0 - - - 0x00DA0B 03:B9FB: 47
	.byte $55					;- D 0 - - - 0x00DA0C 03:B9FC: 55
	.byte $20					;- D 0 - - - 0x00DA0D 03:B9FD: 20
	.byte $49					;- D 0 - - - 0x00DA0E 03:B9FE: 49
	.byte $43					;- D 0 - - - 0x00DA0F 03:B9FF: 43
	.byte $48					;- D 0 - - - 0x00DA10 03:BA00: 48
	.byte $49					;- D 0 - - - 0x00DA11 03:BA01: 49
	.byte $53					;- D 0 - - - 0x00DA12 03:BA02: 53
	.byte $55					;- D 0 - - - 0x00DA13 03:BA03: 55
	.byte $4D					;- D 0 - - - 0x00DA14 03:BA04: 4D
	.byte $49					;- D 0 - - - 0x00DA15 03:BA05: 49
	.byte $00					;- D 0 - - - 0x00DA16 03:BA06: 00

DATA_06BA07:
	.byte $48					;- D 0 - - - 0x00DA17 03:BA07: 48
	.byte $49					;- D 0 - - - 0x00DA18 03:BA08: 49
	.byte $52					;- D 0 - - - 0x00DA19 03:BA09: 52
	.byte $4F					;- D 0 - - - 0x00DA1A 03:BA0A: 4F
	.byte $59					;- D 0 - - - 0x00DA1B 03:BA0B: 59
	.byte $55					;- D 0 - - - 0x00DA1C 03:BA0C: 55
	.byte $4B					;- D 0 - - - 0x00DA1D 03:BA0D: 4B
	.byte $49					;- D 0 - - - 0x00DA1E 03:BA0E: 49
	.byte $20					;- D 0 - - - 0x00DA1F 03:BA0F: 20
	.byte $4B					;- D 0 - - - 0x00DA20 03:BA10: 4B
	.byte $55					;- D 0 - - - 0x00DA21 03:BA11: 55
	.byte $53					;- D 0 - - - 0x00DA22 03:BA12: 53
	.byte $41					;- D 0 - - - 0x00DA23 03:BA13: 41
	.byte $4E					;- D 0 - - - 0x00DA24 03:BA14: 4E
	.byte $4F					;- D 0 - - - 0x00DA25 03:BA15: 4F
	.byte $00					;- D 0 - - - 0x00DA26 03:BA16: 00

DATA_06BA17:
	.byte $54					;- D 0 - - - 0x00DA27 03:BA17: 54
	.byte $4F					;- D 0 - - - 0x00DA28 03:BA18: 4F
	.byte $52					;- D 0 - - - 0x00DA29 03:BA19: 52
	.byte $55					;- D 0 - - - 0x00DA2A 03:BA1A: 55
	.byte $20					;- D 0 - - - 0x00DA2B 03:BA1B: 20
	.byte $4B					;- D 0 - - - 0x00DA2C 03:BA1C: 4B
	.byte $55					;- D 0 - - - 0x00DA2D 03:BA1D: 55
	.byte $4E					;- D 0 - - - 0x00DA2E 03:BA1E: 4E
	.byte $49					;- D 0 - - - 0x00DA2F 03:BA1F: 49
	.byte $59					;- D 0 - - - 0x00DA30 03:BA20: 59
	.byte $4F					;- D 0 - - - 0x00DA31 03:BA21: 4F
	.byte $53					;- D 0 - - - 0x00DA32 03:BA22: 53
	.byte $48					;- D 0 - - - 0x00DA33 03:BA23: 48
	.byte $49					;- D 0 - - - 0x00DA34 03:BA24: 49
	.byte $00					;- D 0 - - - 0x00DA35 03:BA25: 00

DATA_06BA26:
	.byte $4B					;- D 0 - - - 0x00DA36 03:BA26: 4B
	.byte $45					;- D 0 - - - 0x00DA37 03:BA27: 45
	.byte $4E					;- D 0 - - - 0x00DA38 03:BA28: 4E
	.byte $4A					;- D 0 - - - 0x00DA39 03:BA29: 4A
	.byte $49					;- D 0 - - - 0x00DA3A 03:BA2A: 49
	.byte $20					;- D 0 - - - 0x00DA3B 03:BA2B: 20
	.byte $59					;- D 0 - - - 0x00DA3C 03:BA2C: 59
	.byte $4F					;- D 0 - - - 0x00DA3D 03:BA2D: 4F
	.byte $53					;- D 0 - - - 0x00DA3E 03:BA2E: 53
	.byte $48					;- D 0 - - - 0x00DA3F 03:BA2F: 48
	.byte $49					;- D 0 - - - 0x00DA40 03:BA30: 49
	.byte $4F					;- D 0 - - - 0x00DA41 03:BA31: 4F
	.byte $4B					;- D 0 - - - 0x00DA42 03:BA32: 4B
	.byte $41					;- D 0 - - - 0x00DA43 03:BA33: 41
	.byte $00					;- D 0 - - - 0x00DA44 03:BA34: 00

DATA_06BA35:
	.byte $4B					;- D 0 - - - 0x00DA45 03:BA35: 4B
	.byte $49					;- D 0 - - - 0x00DA46 03:BA36: 49
	.byte $59					;- D 0 - - - 0x00DA47 03:BA37: 59
	.byte $4F					;- D 0 - - - 0x00DA48 03:BA38: 4F
	.byte $54					;- D 0 - - - 0x00DA49 03:BA39: 54
	.byte $41					;- D 0 - - - 0x00DA4A 03:BA3A: 41
	.byte $4B					;- D 0 - - - 0x00DA4B 03:BA3B: 4B
	.byte $41					;- D 0 - - - 0x00DA4C 03:BA3C: 41
	.byte $20					;- D 0 - - - 0x00DA4D 03:BA3D: 20
	.byte $41					;- D 0 - - - 0x00DA4E 03:BA3E: 41
	.byte $4B					;- D 0 - - - 0x00DA4F 03:BA3F: 4B
	.byte $41					;- D 0 - - - 0x00DA50 03:BA40: 41
	.byte $5A					;- D 0 - - - 0x00DA51 03:BA41: 5A
	.byte $41					;- D 0 - - - 0x00DA52 03:BA42: 41
	.byte $00					;- D 0 - - - 0x00DA53 03:BA43: 00

DATA_06BA44:
	.byte $54					;- D 0 - - - 0x00DA54 03:BA44: 54
	.byte $41					;- D 0 - - - 0x00DA55 03:BA45: 41
	.byte $49					;- D 0 - - - 0x00DA56 03:BA46: 49
	.byte $54					;- D 0 - - - 0x00DA57 03:BA47: 54
	.byte $4F					;- D 0 - - - 0x00DA58 03:BA48: 4F
	.byte $20					;- D 0 - - - 0x00DA59 03:BA49: 20
	.byte $20					;- D 0 - - - 0x00DA5A 03:BA4A: 20
	.byte $31					;- D 0 - - - 0x00DA5B 03:BA4B: 31
	.byte $39					;- D 0 - - - 0x00DA5C 03:BA4C: 39
	.byte $39					;- D 0 - - - 0x00DA5D 03:BA4D: 39
	.byte $33					;- D 0 - - - 0x00DA5E 03:BA4E: 33
	.byte $00					;- D 0 - - - 0x00DA5F 03:BA4F: 00

CutsceneActorScripts:

caIntroCubby:
	;- D 0 - - - 0x00DA60 03:BA50: 02
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$00
	.byte CO_ATTR,$00
	.byte CO_POS,132,152
	.byte CO_ANIM
	.word anIntroCubbySit_ID
	.byte CO_SHOW
	.byte CO_TIME,78
	.byte CO_WAIT
	.byte CO_ANIM
	.word anIntroCubbyFloat_ID
	.byte CO_TIME,45
	.byte CO_MOVE,$8|1

	.byte CO_BEGIN_LOOP,7
	@float:
	.byte CO_TIME,3
	.byte CO_MOVE,$8|1
	.byte CO_TIME,2
	.byte CO_WAIT
	.byte CO_TIME,3
	.byte CO_MOVE,1
	.byte CO_TIME,2
	.byte CO_WAIT
	.byte CO_LOOP
	.word @float

	.byte CO_BEGIN_LOOP,7
	@transform:
	.byte CO_HIDE
	.byte CO_ANIM
	.word anPlayerWeakenL_ID
	.byte CO_SHOW
	.byte CO_HIDE
	.byte CO_ANIM
	.word anIntroCubbySit_ID
	.byte CO_SHOW
	.byte CO_LOOP
	.word @transform

	.byte CO_PAL,4*4,$0F,$0F,$30,$2A
	.byte CO_ANIM
	.word anPlayerWeakenL_ID
	.byte CO_TIME,7
	.byte CO_MOVE,7
	.byte CO_TIME,1
	.byte CO_WAIT
	.byte CO_TIME,2
	.byte CO_MOVE,$8|4
	.byte CO_TIME,1
	.byte CO_WAIT
	.byte CO_TIME,2
	.byte CO_MOVE,4
	.byte CO_ANIM
	.word anPlayerL_ID
	.byte CO_TIME,3
	.byte CO_WAIT
	.byte CO_ANIM
	.word anPlayerR_ID
	.byte CO_TIME,3
	.byte CO_WAIT
	.byte CO_ANIM
	.word anPlayerL_ID
	.byte CO_TIME,6
	.byte CO_WAIT
	.byte CO_ANIM
	.word anPlayerR_ID
	.byte CO_TIME,3
	.byte CO_WAIT
	.byte CO_ANIM
	.word anPlayerL_ID
	.byte CO_TIME,3
	.byte CO_WAIT
	.byte CO_ANIM
	.word anIntroPlayerWalkL_ID
	.byte CO_TIME,38
	.byte CO_MOVE,$80|(3<<4)
	.byte CO_REMOVE

caIntroJudy:
	;- D 0 - - - 0x00DADA 03:BACA: 02
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$02
	.byte CO_ATTR,$02
	.byte CO_POS,116,152
	.byte CO_ANIM
	.word anIntroJudySit_ID
	.byte CO_SHOW
	.byte CO_TIME,78
	.byte CO_WAIT
	.byte CO_ANIM
	.word anIntroJudyTrapped_ID
	.byte CO_TIME,16
	.byte CO_MOVE,$8|1

	.byte CO_BEGIN_LOOP,7
	@float:
	.byte CO_TIME,3
	.byte CO_MOVE,$8|1
	.byte CO_TIME,2
	.byte CO_WAIT
	.byte CO_TIME,3
	.byte CO_MOVE,1
	.byte CO_TIME,2
	.byte CO_WAIT
	.byte CO_LOOP
	.word @float

	.byte CO_ANIM
	.word anIntroJudyShout_ID

	.byte CO_BEGIN_LOOP,5
	@carried:
	.byte CO_TIME,3
	.byte CO_MOVE,$80|(3<<4)|$8|1
	.byte CO_TIME,3
	.byte CO_MOVE,$80|(3<<4)|1
	.byte CO_LOOP
	.word @carried

	.byte CO_REMOVE

caIntroHeartSkull:
	;- D 0 - - - 0x00DB15 03:BB05: 02
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$00
	.byte CO_ATTR,$02
	.byte CO_POS,112,142
	;Start out as heart above Judy
	.byte CO_ANIM
	.word anIntroHeart_ID
	.byte CO_SHOW

	.byte CO_BEGIN_LOOP,6
	@heartmove:
	.byte CO_TIME,6
	.byte CO_MOVE,$80|(1<<4)|$8|1
	.byte CO_TIME,2
	.byte CO_WAIT
	.byte CO_POS,112,142
	.byte CO_LOOP
	.word @heartmove

	;Now Blue Skull Brother
	.byte CO_ATTR,$01
	.byte CO_CHR,$01
	.byte CO_POS,176,112
	.byte CO_ANIM
	.word anIntroSkull_ID
	.byte CO_TIME,6
	.byte CO_MOVE,$80|(3<<4)
	.byte CO_TIME,72
	.byte CO_WAIT
	.byte CO_TIME,46
	.byte CO_MOVE,$80|(3<<4)
	.byte CO_REMOVE

caREM04:
	;(Removed actor script)

caREM05:
	;(Removed actor script)

caREM06:
	;(Removed actor script)

caIntroDrunk:
	;- D 0 - - - 0x00DB47 03:BB37: 04
	.byte CO_TIME,8
	.byte CO_WAIT
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$03
	.byte CO_ATTR,$03
	.byte CO_POS,174,150
	.byte CO_ANIM
	.word anIntroDrunksHide_ID
	.byte CO_SHOW
	.byte CO_TIME,32
	.byte CO_WAIT
	.byte CO_HIDE
	.byte CO_TIME,16
	.byte CO_WAIT
	.byte CO_ATTR,$01
	.byte CO_POS,138,112
	.byte CO_ANIM
	.word anSpell_ID
	.byte CO_SHOW
	.byte CO_TIME,4
	.byte CO_MOVE,$80|(7<<4)|7
	.byte CO_POS,142,118
	.byte CO_TIME,4
	.byte CO_MOVE,$80|(7<<4)|7
	.byte CO_POS,146,123
	.byte CO_TIME,4
	.byte CO_MOVE,$80|(7<<4)|7
	.byte CO_HIDE
	.byte CO_TIME,37
	.byte CO_WAIT
	.byte CO_ATTR,$03
	.byte CO_POS,160,152
	.byte CO_ANIM
	.word anIntroDrunksWalkL_ID
	.byte CO_SHOW
	.byte CO_TIME,41
	.byte CO_WAIT
	.byte CO_TIME,45
	.byte CO_MOVE,$80|(3<<4)
	.byte CO_REMOVE

caRound70Judy:
	;- D 0 - - - 0x00DB8E 03:BB7E: 0F
	.byte CO_ATTR,$02
	.byte CO_PAL,4*6,$0F,$0F,$37,$25
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$03
	.byte CO_POS,128,15
	.byte CO_ANIM
	.word anIntroJudyShout_ID
	.byte CO_SHOW
	.byte CO_TIME,40
	.byte CO_MOVE,1

	.byte CO_BEGIN_LOOP,5
	@float:
	.byte CO_TIME,3
	.byte CO_MOVE,$8|1
	.byte CO_TIME,2
	.byte CO_WAIT
	.byte CO_TIME,3
	.byte CO_MOVE,1
	.byte CO_TIME,2
	.byte CO_WAIT
	.byte CO_LOOP
	.word @float

	.byte CO_TIME,20
	.byte CO_MOVE,$8|2
	.byte CO_REMOVE

caRound70Skull:
	.byte CO_TIME,52
	.byte CO_WAIT
	.byte CO_ATTR,$01
	.byte CO_PAL,4*5,$0F,$0F,$3B,$2C
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$02
	.byte CO_POS,156,15
	.byte CO_ANIM
	.word anSkullL_ID
	.byte CO_SHOW
	.byte CO_TIME,34
	.byte CO_MOVE,4
	.byte CO_BOSS
	.byte CO_REMOVE

caRound70PlayerWon:
	;- D 0 - - - 0x00DBD9 03:BBC9: 04
	.byte CO_TIME,48
	.byte CO_WAIT
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_ANIM
	.word anEndingPlayerWalkR_ID
	.byte CO_TIME,27
	.byte CO_MOVE,3<<4
	.byte CO_ANIM
	.word anPlayerR_ID
	.byte CO_STALL

caRound70JudyFree:
	;- D 0 - - - 0x00DBE9 03:BBD9: 0F
	.byte CO_ATTR,$02
	.byte CO_PAL,4*6,$0F,$0F,$37,$25
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$03
	.byte CO_POS,128,15
	.byte CO_ANIM
	.word anIntroJudyShout_ID
	.byte CO_SHOW
	.byte CO_TIME,24
	.byte CO_MOVE,2
	.byte CO_ANIM
	.word anIntroJudyTrapped_ID
	.byte CO_TIME,32
	.byte CO_MOVE,4
	.byte CO_ANIM
	.word anBossJudyL_ID
	.byte CO_TIME,99
	.byte CO_WAIT
	.byte CO_REMOVE

caRound70HeartL:
	;- D 0 - - - 0x00DC0E 03:BBFE: 04
	.byte CO_TIME,74
	.byte CO_WAIT
	.byte CO_ATTR,$02
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$02
	.byte CO_POS,123,186
	.byte CO_ANIM
	.word anIntroHeart_ID
	.byte CO_SHOW

	.byte CO_BEGIN_LOOP,11
	@move:
	.byte CO_TIME,7
	.byte CO_MOVE,$80|(1<<4)|$8|1
	.byte CO_TIME,4
	.byte CO_WAIT
	.byte CO_POS,123,186
	.byte CO_LOOP
	.word @move

	.byte CO_REMOVE

caRound70HeartR:
	;- D 0 - - - 0x00DC2E 03:BC1E: 04
	.byte CO_TIME,74
	.byte CO_WAIT
	.byte CO_ATTR,$02
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$02
	.byte CO_POS,140,186
	.byte CO_ANIM
	.word anIntroHeart_ID
	.byte CO_SHOW

	.byte CO_BEGIN_LOOP,11
	@move:
	.byte CO_TIME,7
	.byte CO_MOVE,(1<<4)|$8|1
	.byte CO_TIME,4
	.byte CO_WAIT
	.byte CO_POS,140,186
	.byte CO_LOOP
	.word @move

	.byte CO_REMOVE

caEndingCubby:
	;- D 0 - - - 0x00DC4E 03:BC3E: 0F
	.byte CO_ATTR,$00
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_POS,31,164
	.byte CO_ANIM
	.word anPlayerR_ID
	.byte CO_SHOW
	.byte CO_TIME,56
	.byte CO_WAIT
	.byte CO_ANIM
	.word anEndingPlayerWalkR_ID
	.byte CO_TIME,32
	.byte CO_MOVE,3<<4
	.byte CO_ANIM
	.word anPlayerR_ID
	.byte CO_TIME,42
	.byte CO_WAIT

	.byte CO_BEGIN_LOOP,7
	@transform:
	.byte CO_HIDE
	.byte CO_POS,127,164
	.byte CO_ANIM
	.word anPlayerR_ID
	.byte CO_SHOW
	.byte CO_HIDE
	.byte CO_POS,127,160
	.byte CO_ANIM
	.word anCubbyL_ID
	.byte CO_SHOW
	.byte CO_LOOP
	.word @transform

	.byte CO_PAL,4*4,$0F,$0F,$37,$2B
	.byte CO_STALL

caEndingFairyHeartR:
	;- D 0 - - - 0x00DC85 03:BC75: 04
	.byte CO_TIME,16
	.byte CO_WAIT
	;Start out as fairy
	.byte CO_ATTR,$03
	.byte CO_PAL,4*7,$0F,$0F,$38,$27
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$02
	.byte CO_POS,128,160
	.byte CO_ANIM
	.word anFairyFlyL_ID

	.byte CO_BEGIN_LOOP,8
	@appear:
	.byte CO_SHOW
	.byte CO_HIDE
	.byte CO_LOOP
	.word @appear

	.byte CO_SHOW
	.byte CO_TIME,32
	.byte CO_MOVE,$8|3

	.byte CO_BEGIN_LOOP,6
	@float:
	.byte CO_TIME,8
	.byte CO_MOVE,$80|(2<<4)
	.byte CO_ANIM
	.word anFairyFlyR_ID
	.byte CO_TIME,8
	.byte CO_MOVE,2<<4
	.byte CO_ANIM
	.word anFairyFlyL_ID
	.byte CO_LOOP
	.word @float

	.byte CO_ANIM
	.word anFairyFlyR_ID
	.byte CO_TIME,30
	.byte CO_MOVE,(4<<4)|$8|2

	.byte CO_HIDE
	;Continue as right heart
	.byte CO_ATTR,$02
	.byte CO_TIME,12
	.byte CO_WAIT
	.byte CO_POS,138,156
	.byte CO_ANIM
	.word anIntroHeart_ID
	.byte CO_CHR,$03
	.byte CO_SHOW

	@heartmove:
	.byte CO_TIME,7
	.byte CO_MOVE,(1<<4)|$8|1
	.byte CO_TIME,4
	.byte CO_WAIT
	.byte CO_POS,138,156
	.byte CO_JUMP
	.word @heartmove

	.byte CO_REMOVE

caEndingMagicRJudy:
	;- D 0 - - - 0x00DCDD 03:BCCD: 0F
	;Start out as right magic projectile
	.byte CO_ATTR,$01
	.byte CO_PAL,4*5,$0F,$0F,$30,$38
	.byte CO_TIME,86
	.byte CO_WAIT
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$03
	.byte CO_POS,126,80
	.byte CO_ANIM
	.word anSpell_ID
	.byte CO_SHOW

	.byte CO_BEGIN_LOOP,3
	@fall:
	.byte CO_TIME,11
	.byte CO_MOVE,(2<<4)|7
	.byte CO_POS,126,80
	.byte CO_LOOP
	.word @fall

	.byte CO_HIDE
	.byte CO_TIME,44
	.byte CO_WAIT
	;Continue as Judy
	.byte CO_ATTR,$02
	.byte CO_PAL,4*6,$0F,$0F,$37,$25
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$01
	.byte CO_POS,15,160
	.byte CO_ANIM
	.word anJudyWalkR_ID
	.byte CO_SHOW
	.byte CO_TIME,31
	.byte CO_MOVE,3<<4
	.byte CO_ANIM
	.word anJudyR_ID
	.byte CO_STALL

caEndingMagicLHeartL:
	;- D 0 - - - 0x00DD1E 03:BD0E: 0F
	;Start out as left magic projectile
	.byte CO_ATTR,$01
	.byte CO_PAL,4*5,$0F,$0F,$30,$38
	.byte CO_TIME,86
	.byte CO_WAIT
	.byte CO_PRG,.BANK(ImageTable2)
	.byte CO_CHR,$03
	.byte CO_POS,126,80
	.byte CO_ANIM
	.word anSpell_ID
	.byte CO_SHOW

	.byte CO_BEGIN_LOOP,3
	@fall:
	.byte CO_TIME,11
	.byte CO_MOVE,$80|(2<<4)|7
	.byte CO_POS,126,80
	.byte CO_LOOP
	.word @fall

	.byte CO_HIDE
	.byte CO_TIME,78
	.byte CO_WAIT
	;Continue as left heart
	.byte CO_ATTR,$02
	.byte CO_POS,104,156
	.byte CO_ANIM
	.word anIntroHeart_ID
	.byte CO_SHOW

	@heartmove:
	.byte CO_TIME,7
	.byte CO_MOVE,$80|(1<<4)|$8|1
	.byte CO_TIME,4
	.byte CO_WAIT
	.byte CO_POS,104,156
	.byte CO_JUMP
	.word @heartmove

	.byte CO_REMOVE

DATA_06BD4B:
	;- D 0 - - - 0x00DD5B 03:BD4B: 57
	.word DATA_06BD57
	.word DATA_06BD5C
	.word DATA_06BD61
	.word DATA_06BD66
	.word DATA_06BD6B
	.word DATA_06BD70

DATA_06BD57:
	.byte $00					;- D 0 - - - 0x00DD67 03:BD57: 00
	.byte $20					;- D 0 - - - 0x00DD68 03:BD58: 20
	.byte $41					;- D 0 - - - 0x00DD69 03:BD59: 41
	.byte $18					;- D 0 - - - 0x00DD6A 03:BD5A: 18
	.byte $40					;- D 0 - - - 0x00DD6B 03:BD5B: 40

DATA_06BD5C:
	.byte $00					;- D 0 - - - 0x00DD6C 03:BD5C: 00
	.byte $20					;- D 0 - - - 0x00DD6D 03:BD5D: 20
	.byte $41					;- D 0 - - - 0x00DD6E 03:BD5E: 41
	.byte $68					;- D 0 - - - 0x00DD6F 03:BD5F: 68
	.byte $90					;- D 0 - - - 0x00DD70 03:BD60: 90

DATA_06BD61:
	.byte $00					;- D 0 - - - 0x00DD71 03:BD61: 00
	.byte $4D					;- D 0 - - - 0x00DD72 03:BD62: 4D
	.byte $54					;- D 0 - - - 0x00DD73 03:BD63: 54
	.byte $B8					;- D 0 - - - 0x00DD74 03:BD64: B8
	.byte $F0					;- D 0 - - - 0x00DD75 03:BD65: F0

DATA_06BD66:
	.byte $01					;- D 0 - - - 0x00DD76 03:BD66: 01
	.byte $C0					;- D 0 - - - 0x00DD77 03:BD67: C0
	.byte $E1					;- D 0 - - - 0x00DD78 03:BD68: E1
	.byte $40					;- D 0 - - - 0x00DD79 03:BD69: 40
	.byte $68					;- D 0 - - - 0x00DD7A 03:BD6A: 68

DATA_06BD6B:
	.byte $01					;- D 0 - - - 0x00DD7B 03:BD6B: 01
	.byte $C0					;- D 0 - - - 0x00DD7C 03:BD6C: C0
	.byte $E1					;- D 0 - - - 0x00DD7D 03:BD6D: E1
	.byte $90					;- D 0 - - - 0x00DD7E 03:BD6E: 90
	.byte $B8					;- D 0 - - - 0x00DD7F 03:BD6F: B8

DATA_06BD70:
	.byte $01					;- D 0 - - - 0x00DD80 03:BD70: 01
	.byte $90					;- D 0 - - - 0x00DD81 03:BD71: 90
	.byte $F1					;- D 0 - - - 0x00DD82 03:BD72: F1
	.byte $00					;- D 0 - - - 0x00DD83 03:BD73: 00
	.byte $17					;- D 0 - - - 0x00DD84 03:BD74: 17

DATA_06BD75:
	.byte $FD					;- D 0 - - - 0x00DD85 03:BD75: FD
	.byte $FD					;- D 0 - - - 0x00DD86 03:BD76: FD
	.byte $FD					;- D 0 - - - 0x00DD87 03:BD77: FD
	.byte $FD					;- D 0 - - - 0x00DD88 03:BD78: FD
	.byte $FD					;- D 0 - - - 0x00DD89 03:BD79: FD
	.byte $FD					;- D 0 - - - 0x00DD8A 03:BD7A: FD
	.byte $FD					;- D 0 - - - 0x00DD8B 03:BD7B: FD
	.byte $FE					;- D 0 - - - 0x00DD8C 03:BD7C: FE
	.byte $FE					;- D 0 - - - 0x00DD8D 03:BD7D: FE
	.byte $FE					;- D 0 - - - 0x00DD8E 03:BD7E: FE
	.byte $FE					;- D 0 - - - 0x00DD8F 03:BD7F: FE
	.byte $FE					;- D 0 - - - 0x00DD90 03:BD80: FE
	.byte $FE					;- D 0 - - - 0x00DD91 03:BD81: FE
	.byte $FE					;- D 0 - - - 0x00DD92 03:BD82: FE
	.byte $FE					;- D 0 - - - 0x00DD93 03:BD83: FE
	.byte $FF					;- D 0 - - - 0x00DD94 03:BD84: FF
	.byte $FF					;- D 0 - - - 0x00DD95 03:BD85: FF
	.byte $FF					;- D 0 - - - 0x00DD96 03:BD86: FF
	.byte $FF					;- D 0 - - - 0x00DD97 03:BD87: FF
	.byte $FF					;- D 0 - - - 0x00DD98 03:BD88: FF
	.byte $FF					;- D 0 - - - 0x00DD99 03:BD89: FF
	.byte $00					;- D 0 - - - 0x00DD9A 03:BD8A: 00
	.byte $00					;- D 0 - - - 0x00DD9B 03:BD8B: 00
	.byte $00					;- D 0 - - - 0x00DD9C 03:BD8C: 00
	.byte $00					;- D 0 - - - 0x00DD9D 03:BD8D: 00
	.byte $01					;- D 0 - - - 0x00DD9E 03:BD8E: 01
	.byte $01					;- D 0 - - - 0x00DD9F 03:BD8F: 01
	.byte $01					;- D 0 - - - 0x00DDA0 03:BD90: 01
	.byte $01					;- D 0 - - - 0x00DDA1 03:BD91: 01
	.byte $01					;- D 0 - - - 0x00DDA2 03:BD92: 01
	.byte $01					;- D 0 - - - 0x00DDA3 03:BD93: 01
	.byte $02					;- D 0 - - - 0x00DDA4 03:BD94: 02
	.byte $02					;- D 0 - - - 0x00DDA5 03:BD95: 02
	.byte $02					;- D 0 - - - 0x00DDA6 03:BD96: 02
	.byte $02					;- D 0 - - - 0x00DDA7 03:BD97: 02
	.byte $02					;- D 0 - - - 0x00DDA8 03:BD98: 02
	.byte $02					;- D 0 - - - 0x00DDA9 03:BD99: 02
	.byte $02					;- D 0 - - - 0x00DDAA 03:BD9A: 02
	.byte $02					;- D 0 - - - 0x00DDAB 03:BD9B: 02
	.byte $03					;- D 0 - - - 0x00DDAC 03:BD9C: 03
	.byte $03					;- D 0 - - - 0x00DDAD 03:BD9D: 03
	.byte $03					;- D 0 - - - 0x00DDAE 03:BD9E: 03
	.byte $03					;- D 0 - - - 0x00DDAF 03:BD9F: 03
	.byte $03					;- D 0 - - - 0x00DDB0 03:BDA0: 03
	.byte $03					;- D 0 - - - 0x00DDB1 03:BDA1: 03
	.byte $03					;- D 0 - - - 0x00DDB2 03:BDA2: 03
	.byte $03					;- D 0 - - - 0x00DDB3 03:BDA3: 03

BonusGameMaps:
	;- - - - - - 0x00DDB4 03:BDA4: 00
	.byte $00
	.byte mapBonus1_ID
	.byte mapBonus1_ID
	.byte mapBonus2_ID
	.byte mapBonus3_ID

DATA_06BDA9:
	.byte $00					;- D 0 - - - 0x00DDB9 03:BDA9: 00
	.byte $80					;- D 0 - - - 0x00DDBA 03:BDAA: 80
	.byte $00					;- - - - - - 0x00DDBB 03:BDAB: 00

DATA_06BDAC:
	.byte $28					;- D 0 - - - 0x00DDBC 03:BDAC: 28
	.byte $20					;- D 0 - - - 0x00DDBD 03:BDAD: 20
	.byte $28					;- - - - - - 0x00DDBE 03:BDAE: 28

palBonusGameA:
	;Full palette set for bonus games 1 and 3
	.byte $0F					;- D 0 - - - 0x00DDBF 03:BDAF: 0F
	.byte $37					;- D 0 - - - 0x00DDC0 03:BDB0: 37
	.byte $28					;- D 0 - - - 0x00DDC1 03:BDB1: 28
	.byte $2B					;- D 0 - - - 0x00DDC2 03:BDB2: 2B
	.byte $0F					;- D 0 - - - 0x00DDC3 03:BDB3: 0F
	.byte $31					;- D 0 - - - 0x00DDC4 03:BDB4: 31
	.byte $12					;- D 0 - - - 0x00DDC5 03:BDB5: 12
	.byte $14					;- D 0 - - - 0x00DDC6 03:BDB6: 14
	.byte $0F					;- D 0 - - - 0x00DDC7 03:BDB7: 0F
	.byte $30					;- D 0 - - - 0x00DDC8 03:BDB8: 30
	.byte $0F					;- D 0 - - - 0x00DDC9 03:BDB9: 0F
	.byte $14					;- D 0 - - - 0x00DDCA 03:BDBA: 14
	.byte $0F					;- D 0 - - - 0x00DDCB 03:BDBB: 0F
	.byte $30					;- D 0 - - - 0x00DDCC 03:BDBC: 30
	.byte $21					;- D 0 - - - 0x00DDCD 03:BDBD: 21
	.byte $14					;- D 0 - - - 0x00DDCE 03:BDBE: 14
	.byte $0F					;- D 0 - - - 0x00DDCF 03:BDBF: 0F
	.byte $0F					;- D 0 - - - 0x00DDD0 03:BDC0: 0F
	.byte $30					;- D 0 - - - 0x00DDD1 03:BDC1: 30
	.byte $2A					;- D 0 - - - 0x00DDD2 03:BDC2: 2A
	.byte $0F					;- D 0 - - - 0x00DDD3 03:BDC3: 0F
	.byte $0F					;- D 0 - - - 0x00DDD4 03:BDC4: 0F
	.byte $30					;- D 0 - - - 0x00DDD5 03:BDC5: 30
	.byte $23					;- D 0 - - - 0x00DDD6 03:BDC6: 23
	.byte $0F					;- D 0 - - - 0x00DDD7 03:BDC7: 0F
	.byte $0F					;- D 0 - - - 0x00DDD8 03:BDC8: 0F
	.byte $30					;- D 0 - - - 0x00DDD9 03:BDC9: 30
	.byte $16					;- D 0 - - - 0x00DDDA 03:BDCA: 16
	.byte $0F					;- D 0 - - - 0x00DDDB 03:BDCB: 0F
	.byte $0F					;- D 0 - - - 0x00DDDC 03:BDCC: 0F
	.byte $26					;- D 0 - - - 0x00DDDD 03:BDCD: 26
	.byte $16					;- D 0 - - - 0x00DDDE 03:BDCE: 16

palBonusGameB:
	;Full palette set for bonus game 2
	.byte $0F					;- D 0 - - - 0x00DDDF 03:BDCF: 0F
	.byte $37					;- D 0 - - - 0x00DDE0 03:BDD0: 37
	.byte $28					;- D 0 - - - 0x00DDE1 03:BDD1: 28
	.byte $2B					;- D 0 - - - 0x00DDE2 03:BDD2: 2B
	.byte $0F					;- D 0 - - - 0x00DDE3 03:BDD3: 0F
	.byte $31					;- D 0 - - - 0x00DDE4 03:BDD4: 31
	.byte $21					;- D 0 - - - 0x00DDE5 03:BDD5: 21
	.byte $14					;- D 0 - - - 0x00DDE6 03:BDD6: 14
	.byte $0F					;- D 0 - - - 0x00DDE7 03:BDD7: 0F
	.byte $30					;- D 0 - - - 0x00DDE8 03:BDD8: 30
	.byte $0F					;- D 0 - - - 0x00DDE9 03:BDD9: 0F
	.byte $14					;- D 0 - - - 0x00DDEA 03:BDDA: 14
	.byte $0F					;- D 0 - - - 0x00DDEB 03:BDDB: 0F
	.byte $30					;- D 0 - - - 0x00DDEC 03:BDDC: 30
	.byte $21					;- D 0 - - - 0x00DDED 03:BDDD: 21
	.byte $14					;- D 0 - - - 0x00DDEE 03:BDDE: 14
	.byte $0F					;- D 0 - - - 0x00DDEF 03:BDDF: 0F
	.byte $0F					;- D 0 - - - 0x00DDF0 03:BDE0: 0F
	.byte $30					;- D 0 - - - 0x00DDF1 03:BDE1: 30
	.byte $2A					;- D 0 - - - 0x00DDF2 03:BDE2: 2A
	.byte $0F					;- D 0 - - - 0x00DDF3 03:BDE3: 0F
	.byte $0F					;- D 0 - - - 0x00DDF4 03:BDE4: 0F
	.byte $30					;- D 0 - - - 0x00DDF5 03:BDE5: 30
	.byte $23					;- D 0 - - - 0x00DDF6 03:BDE6: 23
	.byte $0F					;- D 0 - - - 0x00DDF7 03:BDE7: 0F
	.byte $0F					;- D 0 - - - 0x00DDF8 03:BDE8: 0F
	.byte $30					;- D 0 - - - 0x00DDF9 03:BDE9: 30
	.byte $16					;- D 0 - - - 0x00DDFA 03:BDEA: 16
	.byte $0F					;- D 0 - - - 0x00DDFB 03:BDEB: 0F
	.byte $0F					;- D 0 - - - 0x00DDFC 03:BDEC: 0F
	.byte $26					;- D 0 - - - 0x00DDFD 03:BDED: 26
	.byte $16					;- D 0 - - - 0x00DDFE 03:BDEE: 16

DATA_06BDEF:
	.byte $26					;- D 0 - - - 0x00DDFF 03:BDEF: 26
	.byte $27					;- D 0 - - - 0x00DE00 03:BDF0: 27
	.byte $38					;- D 0 - - - 0x00DE01 03:BDF1: 38
	.byte $39					;- D 0 - - - 0x00DE02 03:BDF2: 39
	.byte $2F					;- D 0 - - - 0x00DE03 03:BDF3: 2F
	.byte $30					;- D 0 - - - 0x00DE04 03:BDF4: 30
	.byte $31					;- D 0 - - - 0x00DE05 03:BDF5: 31

BonusAnnounceTable:
	;- - - - - - 0x00DE06 03:BDF6: 02
	;Used to spawn text in projectile slots during bonus games
	;00-01: Anim
	;02: X
	;03: Y
	;04: CHR slot
	.word BonusAnnounce10000
	.word BonusAnnounce10000
	.word BonusAnnounceNoBonus
	.word BonusAnnounceGame
	.word BonusAnnouncePause
	.word BonusAnnounce100000

BonusAnnounce10000:
	;- - - - - - 0x00DE12 03:BE02: 44
	.word anAnnounceBonus_ID
	.byte 128,77,$02

	.word anAnnounce10000_ID
	.byte 128,109,$03

BonusAnnounce30000:
	.word anAnnounceBonus_ID
	.byte 128,77,$02

	.word anAnnounce30000_ID
	.byte 128,109,$03

BonusAnnounceNoBonus:
	;- D 0 - - - 0x00DE26 03:BE16: 46
	.word anAnnounceNo_ID
	.byte 112,80,$03

	.word anAnnounceBonus_ID
	.byte 144,80,$03

BonusAnnounceGame:
	;- D 0 - - - 0x00DE30 03:BE20: 44
	.word anAnnounceBonus_ID
	.byte 128,77,$03

	.word anAnnounceGame_ID
	.byte 128,109,$03

BonusAnnouncePause:
	;- D 0 - - - 0x00DE3A 03:BE2A: 47
	.word anAnnouncePause_ID
	.byte 128,72,$03

	.word anAnnouncePause_ID
	.byte 128,72,$03

BonusAnnounce100000:
	;- D 0 - - - 0x00DE44 03:BE34: 44
	.word anAnnounceBonus_ID
	.byte 128,77,$02

	.word anAnnounce100000_ID
	.byte 120,109,$03

DATA_06BE3E:
	;- D 0 - - - 0x00DE4E 03:BE3E: 0D
	;Proj ID, Anim, Overwrite?
	.byte psNeedlerSyringeBegin_ID
	.word anNeedlerSyringe_ID
	.byte $01

	.byte psInvaderBeam_ID
	.word anInvaderBeam_ID
	.byte $01

	.byte psFlarionFireBeginR_ID
	.word anFlarionFlame_ID
	.byte $00

	.byte psFlarionFireBeginL_ID
	.word anFlarionFlame_ID
	.byte $00

	.byte psRoboZenMissileBegin_ID
	.word $0000
	.byte $01

	.byte psDrunkBottleBegin_ID
	.word anDrunkBottle_ID
	.byte $01

	.byte psChuckerRockBegin_ID
	.word anChuckerRock_ID
	.byte $01

	.byte psArmorDrop_ID
	.word anHeitaiKunHelmetL_ID
	.byte $01

	.byte psArmorDrop_ID
	.word anGhostMonstaReveal_ID
	.byte $01

	.byte psRoboZenHand_ID
	.word anRoboZenHandL_ID
	.byte $01

	.byte psRoboZenDieBeginL_ID
	.word anZenChanDie_ID
	.byte $00

	.byte psRoboZenDieBeginR_ID
	.word anZenChanDie_ID
	.byte $00

DATA_06BE6E:
	;- D 0 - - - 0x00DE7E 03:BE6E: 1A

	;00: Pojectile ID
	;01-02: Anim
	;03: ???

	.byte psRuckusBomb_ID
	.word anRuckusBomb_ID
	.byte $01

	.byte psRocCircle_ID
	.word anRocSmallLightning_ID
	.byte $00

	.byte psSuperDrunkShatterBegin_ID
	.word anSuperDrunkDebrisA_ID
	.byte $00

	.byte psSuperDrunkOrbsBegin_ID
	.word anSuperDrunkOrb_ID
	.byte $00

	.byte psBlueSkullFireBegin_ID
	.word anSkullFireL_ID
	.byte $00

	.byte psPurpleSkullTarget_ID
	.word anSkullReticle_ID
	.byte $01

	.byte psRedSkullHeart_ID
	.word anSkullHeart_ID
	.byte $01

	.byte psFinalSkelMonstaSideways_ID
	.word anFinalSkelMonstaSpawn_ID
	.byte $00

HomingAngleTable:
	;- D 0 - - - 0x00DE9E 03:BE8E: 08
	;Directions 0-15 (clockwise)
	.byte 8
	.byte 8
	.byte 0
	.byte 0

	.byte 4
	.byte 12
	.byte 4
	.byte 12

	.byte 7
	.byte 9
	.byte 1
	.byte 15

	.byte 5
	.byte 11
	.byte 3
	.byte 13

	.byte 6
	.byte 10
	.byte 2
	.byte 14

	.byte 6
	.byte 10
	.byte 2
	.byte 14

HomingSpeedTable:
	;- D 0 - - - 0x00DEB6 03:BEA6: FE
	;From index 0 for VSpeed, from index 4 for HSpeed
	.byte -2
	.byte -2
	.byte -2
	.byte -1
HomingSpeedTable_H:
	;- D 0 - - - 0x00DEBA 03:BEAA: 00
	.byte 0
	.byte 1
	.byte 2
	.byte 2

DATA_06BEAE:
	;- D 0 - - - 0x00DEBE 03:BEAE: 02
	.byte 2
	.byte 2
	.byte 2
	.byte 1

	.byte 0
	.byte -1
	.byte -2
	.byte -2

	.byte -2
	.byte -2
	.byte -2
	.byte -1

EnemyProjSizeIndexes:
	.byte 0
	.byte 1
	.byte 2
	.byte 2

	.byte 2
	.byte 3
	.byte 3
	.byte 5

	.byte 4
	.byte 4
	.byte 3
	.byte 3

	.byte 3
	.byte 4
	.byte 3
	.byte 3

	.byte 0
	.byte 8
	.byte 8
	.byte 3

	.byte 3
	.byte 0
	.byte 5
	.byte 0

	.byte 0
	.byte 0
	.byte 5
	.byte 9

	.byte 8
	.byte 8
	.byte 0
	.byte 11

	.byte 11
	.byte 11
	.byte 0
	.byte 0

	.byte 5
	.byte 5
	.byte 5
	.byte 5

	.byte 5
	.byte 5
	.byte 5
	.byte 5

	.byte 5
	.byte 0
	.byte 0
	.byte 0

EnemyProjSizeTable:
	;- D 0 - - - 0x00DEFA 03:BEEA: 00
	;W,H
	.byte 0,0
	.byte 9,16
	.byte 16,16
	.byte 11,11
	.byte 10,8
	.byte 12,12
	.byte 12,16
	.byte 10,15
	.byte 14,14
	.byte 32,32
	.byte 24,28
	.byte 10,10

MultiProjTable:
	;- D 0 - - - 0x00DF12 03:BF02: 0A
	;First
	;00: Amount
	;01: To scratch5 (projectile script value)
	;02: Non-zero means anim to use for other dir (also invert HSpeed in that case)
	;03: Attr
	;Then
	;00-01: Anim
	;02: HSpeed
	;03: VSpeed
	;...
	.word MultiProjRoc
	.word MultiProjSuperDrunk
	.word MultiProjBlueSkull
	.word MultiProjSuperDrunkDefeat

MultiProjRoc:
	;- D 0 - - - 0x00DF1A 03:BF0A: 08
	.byte 8,psRocLightning_ID,$00,$01

	.word anRocSmallLightning_ID
	.byte 0,-9

	.word anRocSmallLightning_ID
	.byte 6,-6

	.word anRocSmallLightning_ID
	.byte 9,0

	.word anRocSmallLightning_ID
	.byte 6,6

	.word anRocSmallLightning_ID
	.byte 0,9

	.word anRocSmallLightning_ID
	.byte -6,6

	.word anRocSmallLightning_ID
	.byte -9,0

	.word anRocSmallLightning_ID
	.byte -6,-6

MultiProjSuperDrunk:
	;- D 0 - - - 0x00DF3E 03:BF2E: 05
	.byte 5,psSuperDrunkOrb_ID,anPlayerL_ID,$02

	.word anSuperDrunkOrb_ID
	.byte 4,-6

	.word anSuperDrunkOrb_ID
	.byte 6,-4

	.word anSuperDrunkOrb_ID
	.byte 8,0

	.word anSuperDrunkOrb_ID
	.byte 6,4

	.word anSuperDrunkOrb_ID
	.byte 4,6

MultiProjBlueSkull:
	;- D 0 - - - 0x00DF56 03:BF46: 03
	.byte 3,psBlueSkullFire_ID,anSkullFireL_ID,$03

	.word anSkullFireR_ID
	.byte 8,-6

	.word anSkullFireR_ID
	.byte 8,0

	.word anSkullFireR_ID
	.byte 8,6

MultiProjSuperDrunkDefeat:
	;- D 0 - - - 0x00DF66 03:BF56: 08
	.byte 8,psSuperDrunkShatter_ID,$00,$02

	.word anSuperDrunkDebrisA_ID
	.byte 0,-6

	.word anSuperDrunkDebrisB_ID
	.byte 4,-4

	.word anSuperDrunkDebrisC_ID
	.byte 6,0

	.word anSuperDrunkDebrisA_ID
	.byte 4,4

	.word anSuperDrunkDebrisB_ID
	.byte 0,6

	.word anSuperDrunkDebrisC_ID
	.byte -4,4

	.word anSuperDrunkDebrisA_ID
	.byte -6,0

	.word anSuperDrunkDebrisB_ID
	.byte -4,-4