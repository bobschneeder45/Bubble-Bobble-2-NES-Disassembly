.segment "PRG_BANK_2"
; 0x004010-0x00600F

;Contents: Maps

macTaito:
	;- - - - - - 0x004010 01:A000: 00
	.incbin "map/macTaito.bin"

mapTaito:
	;- D 0 - - - 0x00406F 01:A05F: 02
	.incbin "map/mapTaito.bin"

mapRound41:
	;- D 0 - - - 0x00416F 01:A15F: 24
	.incbin "map/mapRound41.bin"

mapRound42:
	;- D 0 - - - 0x00426F 01:A25F: 24
	.incbin "map/mapRound42.bin"

mapRound43:
	;- D 0 - - - 0x00436F 01:A35F: 02
	.incbin "map/mapRound43.bin"

mapRound44:
	;- D 0 - - - 0x00446F 01:A45F: 24
	.incbin "map/mapRound44.bin"

mapRound45:
	;- D 0 - - - 0x00456F 01:A55F: 24
	.incbin "map/mapRound45.bin"

mapRound46:
	;- D 0 - - - 0x00466F 01:A65F: 24
	.incbin "map/mapRound46.bin"

mapRound47:
	;- D 0 - - - 0x00476F 01:A75F: 24
	.incbin "map/mapRound47.bin"

mapRound48:
	;- D 0 - - - 0x00486F 01:A85F: 02
	.incbin "map/mapRound48.bin"

mapRound49:
	;- D 0 - - - 0x00496F 01:A95F: 24
	.incbin "map/mapRound49.bin"

mapRound50:
	;- D 0 - - - 0x004A6F 01:AA5F: 02
	.incbin "map/mapRound50.bin"

mapRound51:
	;- D 0 - - - 0x004B6F 01:AB5F: 24
	.incbin "map/mapRound51.bin"

mapRound52:
	;- D 0 - - - 0x004C6F 01:AC5F: 24
	.incbin "map/mapRound52.bin"

mapRound53:
	;- D 0 - - - 0x004D6F 01:AD5F: 24
	.incbin "map/mapRound53.bin"

mapRound54:
	;- D 0 - - - 0x004E6F 01:AE5F: 24
	.incbin "map/mapRound54.bin"

mapRound55:
.ifdef JP_ROUND_MAPS
	;- - - - - - 0x004F6F 01:AF5F: 24
	.incbin "map/mapRound55_JP.bin"
.else
	;- D 0 - - - 0x004F6F 01:AF5F: 24
	.incbin "map/mapRound55.bin"
.endif

mapRound56:
	;- D 0 - - - 0x00506F 01:B05F: 24
	.incbin "map/mapRound56.bin"

mapRound57:
	;- D 0 - - - 0x00516F 01:B15F: 24
	.incbin "map/mapRound57.bin"

mapRound58:
	;- D 0 - - - 0x00526F 01:B25F: 24
	.incbin "map/mapRound58.bin"

mapRound59:
	;- D 0 - - - 0x00536F 01:B35F: 24
	.incbin "map/mapRound59.bin"

macWorld3:
	;- - - - - - 0x00546F 01:B45F: 00
	.incbin "map/macWorld3.bin"

macTractor:
	;- D 0 - - - 0x0057F3 01:B7E3: 03
	.incbin "map/macTractor.bin"

mapTractor:
	;- D 0 - - - 0x00583E 01:B82E: 00
	.incbin "map/mapTractor.bin"

macShoeL:
	;- - - - - - 0x00584E 01:B83E: 00
	.incbin "map/macShoeL.bin"

macShoeR:
	;- - - - - - 0x005871 01:B861: 00
	.incbin "map/macShoeR.bin"

mapShoe:
	;- D 0 - - - 0x005894 01:B884: 01
	.incbin "map/mapShoe.bin"

macGameOver:
	;- - - - - - 0x00589A 01:B88A: 00
	.incbin "map/macGameOver.bin"

mapGameOver:
	;- D 0 - - - 0x00594E 01:B93E: 02
	.incbin "map/mapGameOver.bin"

mapBonus1:
	;- D 0 - - - 0x005A4E 01:BA3E: 08
	.incbin "map/mapBonus1.bin"

mapBonus2:
	;- D 0 - - - 0x005B4E 01:BB3E: 08
	.incbin "map/mapBonus2.bin"

mapBonus3:
	;- D 0 - - - 0x005C4E 01:BC3E: 08
	.incbin "map/mapBonus3.bin"

macBonus:
	;- - - - - - 0x005D4E 01:BD3E: 00
	.incbin "map/macBonus.bin"

.ifdef REGION_JP
;Filler data
	;- - - - - - 0x005F29 01:BF19: 7F
	.incbin "filler/fill02_JP.bin"
.endif