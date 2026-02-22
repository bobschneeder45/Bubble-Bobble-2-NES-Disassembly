.segment "PRG_BANK_1"
; 0x002010-0x00400F

;Contents: Maps

macTitle:
.ifdef REGION_US
	;- D 0 - - - 0x002010 00:A000: 03
	.incbin "map/macTitle.bin"
.endif

.ifdef REGION_JP
	;- D 0 - - - 0x002010 00:A000: 03
	.incbin "map/macTitle_JP.bin"
.endif

mapTitle:
.ifdef REGION_US
	;- D 0 - - - 0x002295 00:A285: 00
	.incbin "map/mapTitle.bin"
.endif

.ifdef REGION_JP
	;- D 0 - - - 0x00229A 00:A28A: 00
	.incbin "map/mapTitle_JP.bin"
.endif

mapRound21:
	;- D 0 - - - 0x002395 00:A385: 09
	.incbin "map/mapRound21.bin"

mapRound22:
	;- D 0 - - - 0x002495 00:A485: 09
	.incbin "map/mapRound22.bin"

mapRound23:
	;- D 0 - - - 0x002595 00:A585: 09
	.incbin "map/mapRound23.bin"

mapRound24:
	;- D 0 - - - 0x002695 00:A685: 09
	.incbin "map/mapRound24.bin"

mapRound25:
	;- D 0 - - - 0x002795 00:A785: 09
	.incbin "map/mapRound25.bin"

mapRound26:
	;- D 0 - - - 0x002895 00:A885: 09
	.incbin "map/mapRound26.bin"

mapRound27:
	;- D 0 - - - 0x002995 00:A985: 09
	.incbin "map/mapRound27.bin"

mapRound28:
	;- D 0 - - - 0x002A95 00:AA85: 09
	.incbin "map/mapRound28.bin"

mapRound29:
	;- D 0 - - - 0x002B95 00:AB85: 09
	.incbin "map/mapRound29.bin"

mapRound30:
	;- D 0 - - - 0x002C95 00:AC85: 09
	.incbin "map/mapRound30.bin"

mapRound31:
	;- D 0 - - - 0x002D95 00:AD85: 09
	.incbin "map/mapRound31.bin"

mapRound32:
	;- D 0 - - - 0x002E95 00:AE85: 09
	.incbin "map/mapRound32.bin"

mapRound33:
	;- D 0 - - - 0x002F95 00:AF85: 09
	.incbin "map/mapRound33.bin"

mapRound34:
	;- D 0 - - - 0x003095 00:B085: 09
	.incbin "map/mapRound34.bin"

mapRound35:
	;- D 0 - - - 0x003195 00:B185: 09
	.incbin "map/mapRound35.bin"

mapRound36:
	;- D 0 - - - 0x003295 00:B285: 09
	.incbin "map/mapRound36.bin"

mapRound37:
	;- D 0 - - - 0x003395 00:B385: 09
	.incbin "map/mapRound37.bin"

mapRound38:
	;- D 0 - - - 0x003495 00:B485: 02
	.incbin "map/mapRound38.bin"

mapRound39:
	;- D 0 - - - 0x003595 00:B585: 09
	.incbin "map/mapRound39.bin"

macWorld2:
	;- - - - - - 0x003695 00:B685: 00
	.incbin "map/macWorld2.bin"

macFanR:
	;- - - - - - 0x003B95 00:BB85: 00
	.incbin "map/macFanR.bin"

macFanL:
	;- - - - - - 0x003BAE 00:BB9E: 00
	.incbin "map/macFanL.bin"

mapFan:
	;- D 0 - - - 0x003BC7 00:BBB7: 01
	.incbin "map/mapFan.bin"

macAdventure:
	;- - - - - - 0x003BCB 00:BBBB: 03
	.incbin "map/macAdventure.bin"

mapAdventure:
.ifdef REGION_JP
	;- - - - - - 0x003CD9 00:BCC9: 02
	.incbin "map/mapAdventure_JP.bin"
.else
	;- D 0 - - - 0x003CD4 00:BCC4: 02
	.incbin "map/mapAdventure.bin"
.endif

.ifdef REGION_JP
;Filler data
	;- - - - - - 0x003DD9 00:BDC9: 00
	.incbin "filler/fill01_JP.bin"
.endif