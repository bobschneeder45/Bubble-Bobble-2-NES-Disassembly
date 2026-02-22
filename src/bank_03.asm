.segment "PRG_BANK_3"
; 0x006010-0x00800F

;Contents: Maps

mapRound61:
	;- D 0 - - - 0x006010 01:A000: 11
	.incbin "map/mapRound61.bin"

mapRound62:
	;- D 0 - - - 0x006110 01:A100: 11
	.incbin "map/mapRound62.bin"

mapRound63:
	;- D 0 - - - 0x006210 01:A200: 11
	.incbin "map/mapRound63.bin"

mapRound64:
	;- D 0 - - - 0x006310 01:A300: 11
	.incbin "map/mapRound64.bin"

mapRound65:
	;- D 0 - - - 0x006410 01:A400: 11
	.incbin "map/mapRound65.bin"

mapRound66:
	;- D 0 - - - 0x006510 01:A500: 11
	.incbin "map/mapRound66.bin"

mapRound67:
	;- D 0 - - - 0x006610 01:A600: 11
	.incbin "map/mapRound67.bin"

mapRound68:
	;- D 0 - - - 0x006710 01:A700: 11
	.incbin "map/mapRound68.bin"

mapRound69:
	;- D 0 - - - 0x006810 01:A800: 11
	.incbin "map/mapRound69.bin"

mapRound70:
	;- D 0 - - - 0x006910 01:A900: 11
	.incbin "map/mapRound70.bin"

mapRound71:
	;- D 0 - - - 0x006A10 01:AA00: 11
	.incbin "map/mapRound71.bin"

mapRound72:
	;- D 0 - - - 0x006B10 01:AB00: 13
	.incbin "map/mapRound72.bin"

mapRound73:
	;- D 0 - - - 0x006C10 01:AC00: 11
	.incbin "map/mapRound73.bin"

mapRound74:
	;- D 0 - - - 0x006D10 01:AD00: 11
	.incbin "map/mapRound74.bin"

mapRound75:
	;- D 0 - - - 0x006E10 01:AE00: 11
	.incbin "map/mapRound75.bin"

mapRound76:
	;- D 0 - - - 0x006F10 01:AF00: 13
	.incbin "map/mapRound76.bin"

mapRound77:
	;- D 0 - - - 0x007010 01:B000: 11
	.incbin "map/mapRound77.bin"

mapRound78:
	;- D 0 - - - 0x007110 01:B100: 11
	.incbin "map/mapRound78.bin"

mapRound79:
	;- D 0 - - - 0x007210 01:B200: 0F
	.incbin "map/mapRound79.bin"

macWorld4:
	;- - - - - - 0x007310 01:B300: 00
	.incbin "map/macWorld4.bin"

mapRound20:
	;- D 0 - - - 0x007649 01:B639: 4D
	.incbin "map/mapRound20.bin"

mapRound40:
	;- D 0 - - - 0x007849 01:B839: 0F
	.incbin "map/mapRound40.bin"

mapRound40B:
	;- D 0 - - - 0x007939 01:B929: 07
	.incbin "map/mapRound40B.bin"

mapRound60:
	;- D 0 - - - 0x007A09 01:B9F9: 27
	.incbin "map/mapRound60.bin"

macBoss:
	;- - - - - - 0x007B09 01:BAF9: 00
	.incbin "map/macBoss.bin"

macFlood:
	;- - - - - - 0x007C99 01:BC89: 01
	.incbin "map/macFlood.bin"

mapFloodA:
	;- D 0 - - - 0x007CB2 01:BCA2: 01
	.incbin "map/mapFloodA.bin"

mapFloodB:
	;- D 0 - - - 0x007CC2 01:BCB2: 03
	.incbin "map/mapFloodB.bin"


mapFloodC:
	;- D 0 - - - 0x007CD2 01:BCC2: 04
	.incbin "map/mapFloodC.bin"

macEnding:
	;- - - - - - 0x007CE2 01:BCD2: 00
	.incbin "map/macEnding.bin"

mapEnding:
	;- D 0 - - - 0x007EEF 01:BEDF: 02
	.incbin "map/mapEnding.bin"

.ifdef REGION_JP
;Filler data
	;- - - - - - 0x007FDF 01:BFCF: 00
	.incbin "filler/fill03_JP.bin"
.endif