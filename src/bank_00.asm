.segment "PRG_BANK_0"
; 0x000010-0x00200F

;Contents: Maps

MapTable:
	;00: Adr of 16x16 definitions (attr and 8x8 combinations)
	;02: Adr of 16x16 tile list (used for both GFX and collision)
	;04: 16x16 tiles bank for 00 and 02
	;05: Nametables, another 16 tiles for each number above 01) (2 for wide rounds)
	;06: 16x16 row width (amount of horizontal 16x16 tiles)
	;07: 16x16 rows amount

	;- - - - - - 0x000010 00:A000: 48

	;00 Blank
	.word macBlank, mapBlank
	.byte .BANK(mapBlank), 1, 16, 15

	;01 Taito
	.word macTaito, mapTaito
	.byte .BANK(mapTaito), 0, 16, 15

	;02 Title screen
	.word macTitle, mapTitle
	.byte .BANK(mapTitle), 1, 16, 15

	;03 Opening skull brothers
	.word macOpeningSkulls, mapOpeningSkulls
	.byte .BANK(mapOpeningSkulls), 1, 7, 5

	;04 Opening tree
	.word macOpeningTree, mapOpeningTree
	.byte .BANK(mapOpeningTree), 1, 7, 5

	;05 Round 1
	.word macWorld1, mapRound01
	.byte .BANK(mapRound01), 1, 16, 15

	.word macWorld1, mapRound02
	.byte .BANK(mapRound02), 1, 16, 15

	.word macWorld1, mapRound03
	.byte .BANK(mapRound03), 1, 16, 15

	.word macWorld1, mapRound04
	.byte .BANK(mapRound04), 1, 16, 15

	.word macWorld1, mapRound05
	.byte .BANK(mapRound05), 1, 16, 15

	.word macWorld1, mapRound06
	.byte .BANK(mapRound06), 1, 16, 15

	.word macWorld1, mapRound07
	.byte .BANK(mapRound07), 1, 16, 15

	.word macWorld1, mapRound08
	.byte .BANK(mapRound08), 1, 16, 15

	.word macWorld1, mapRound09
	.byte .BANK(mapRound09), 1, 16, 15

	.word macWorld1, mapRound10
	.byte .BANK(mapRound10), 1, 16, 15

	.word macWorld1, mapRound11
	.byte .BANK(mapRound11), 1, 16, 15

	.word macWorld1, mapRound12
	.byte .BANK(mapRound12), 1, 16, 15

	.word macWorld1, mapRound13
	.byte .BANK(mapRound13), 1, 16, 15

	.word macWorld1, mapRound14
	.byte .BANK(mapRound14), 1, 16, 15

	.word macWorld1, mapRound15
	.byte .BANK(mapRound15), 1, 16, 15

	.word macWorld1, mapRound16
	.byte .BANK(mapRound16), 1, 16, 15

	.word macWorld1, mapRound17
	.byte .BANK(mapRound17), 1, 16, 15

	.word macWorld1, mapRound18
	.byte .BANK(mapRound18), 1, 16, 15

	.word macWorld1, mapRound19
	.byte .BANK(mapRound19), 1, 16, 15

	.word macBoss, mapRound20
	.byte .BANK(mapRound20), 2, 32, 15

	.word macWorld2, mapRound21
	.byte .BANK(mapRound21), 1, 16, 15

	.word macWorld2, mapRound22
	.byte .BANK(mapRound22), 1, 16, 15

	.word macWorld2, mapRound23
	.byte .BANK(mapRound23), 1, 16, 15

	.word macWorld2, mapRound24
	.byte .BANK(mapRound24), 1, 16, 15

	.word macWorld2, mapRound25
	.byte .BANK(mapRound25), 1, 16, 15

	.word macWorld2, mapRound26
	.byte .BANK(mapRound26), 1, 16, 15

	.word macWorld2, mapRound27
	.byte .BANK(mapRound27), 1, 16, 15

	.word macWorld2, mapRound28
	.byte .BANK(mapRound28), 1, 16, 15

	.word macWorld2, mapRound29
	.byte .BANK(mapRound29), 1, 16, 15

	.word macWorld2, mapRound30
	.byte .BANK(mapRound30), 1, 16, 15

	.word macWorld2, mapRound31
	.byte .BANK(mapRound31), 1, 16, 15

	.word macWorld2, mapRound32
	.byte .BANK(mapRound32), 1, 16, 15

	.word macWorld2, mapRound33
	.byte .BANK(mapRound33), 1, 16, 15

	.word macWorld2, mapRound34
	.byte .BANK(mapRound34), 1, 16, 15

	.word macWorld2, mapRound35
	.byte .BANK(mapRound35), 1, 16, 15

	.word macWorld2, mapRound36
	.byte .BANK(mapRound36), 1, 16, 15

	.word macWorld2, mapRound37
	.byte .BANK(mapRound37), 1, 16, 15

	.word macWorld2, mapRound38
	.byte .BANK(mapRound38), 1, 16, 15

	.word macWorld2, mapRound39
	.byte .BANK(mapRound39), 1, 16, 15

	.word macBoss, mapRound40
	.byte .BANK(mapRound40), 1, 16, 15

	.word macWorld3, mapRound41
	.byte .BANK(mapRound41), 1, 16, 15

	.word macWorld3, mapRound42
	.byte .BANK(mapRound42), 1, 16, 15

	.word macWorld3, mapRound43
	.byte .BANK(mapRound43), 1, 16, 15

	.word macWorld3, mapRound44
	.byte .BANK(mapRound44), 1, 16, 15

	.word macWorld3, mapRound45
	.byte .BANK(mapRound45), 1, 16, 15

	.word macWorld3, mapRound46
	.byte .BANK(mapRound46), 1, 16, 15

	.word macWorld3, mapRound47
	.byte .BANK(mapRound47), 1, 16, 15

	.word macWorld3, mapRound48
	.byte .BANK(mapRound48), 1, 16, 15

	.word macWorld3, mapRound49
	.byte .BANK(mapRound49), 1, 16, 15

	.word macWorld3, mapRound50
	.byte .BANK(mapRound50), 1, 16, 15

	.word macWorld3, mapRound51
	.byte .BANK(mapRound51), 1, 16, 15

	.word macWorld3, mapRound52
	.byte .BANK(mapRound52), 1, 16, 15

	.word macWorld3, mapRound53
	.byte .BANK(mapRound53), 1, 16, 15

	.word macWorld3, mapRound54
	.byte .BANK(mapRound54), 1, 16, 15

	.word macWorld3, mapRound55
	.byte .BANK(mapRound55), 1, 16, 15

	.word macWorld3, mapRound56
	.byte .BANK(mapRound56), 1, 16, 15

	.word macWorld3, mapRound57
	.byte .BANK(mapRound57), 1, 16, 15

	.word macWorld3, mapRound58
	.byte .BANK(mapRound58), 1, 16, 15

	.word macWorld3, mapRound59
	.byte .BANK(mapRound59), 1, 16, 15

	.word macBoss, mapRound60
	.byte .BANK(mapRound60), 1, 16, 15

	.word macWorld4, mapRound61
	.byte .BANK(mapRound61), 1, 16, 15

	.word macWorld4, mapRound62
	.byte .BANK(mapRound62), 1, 16, 15

	.word macWorld4, mapRound63
	.byte .BANK(mapRound63), 1, 16, 15

	.word macWorld4, mapRound64
	.byte .BANK(mapRound64), 1, 16, 15

	.word macWorld4, mapRound65
	.byte .BANK(mapRound66), 1, 16, 15

	.word macWorld4, mapRound66
	.byte .BANK(mapRound66), 1, 16, 15

	.word macWorld4, mapRound67
	.byte .BANK(mapRound67), 1, 16, 15

	.word macWorld4, mapRound68
	.byte .BANK(mapRound68), 1, 16, 15

	.word macWorld4, mapRound69
	.byte .BANK(mapRound69), 1, 16, 15

	.word macWorld4, mapRound70
	.byte .BANK(mapRound70), 1, 16, 15

	.word macWorld4, mapRound71
	.byte .BANK(mapRound71), 1, 16, 15

	.word macWorld4, mapRound72
	.byte .BANK(mapRound72), 1, 16, 15

	.word macWorld4, mapRound73
	.byte .BANK(mapRound73), 1, 16, 15

	.word macWorld4, mapRound74
	.byte .BANK(mapRound74), 1, 16, 15

	.word macWorld4, mapRound75
	.byte .BANK(mapRound75), 1, 16, 15

	.word macWorld4, mapRound76
	.byte .BANK(mapRound76), 1, 16, 15

	.word macWorld4, mapRound77
	.byte .BANK(mapRound77), 1, 16, 15

	.word macWorld4, mapRound78
	.byte .BANK(mapRound78), 1, 16, 15

	;53 Round 79
	.word macBoss, mapRound79
	.byte .BANK(mapRound79), 1, 16, 15

	;54 Round 80 (reuse 79)
	.word macBoss, mapRound79
	.byte .BANK(mapRound79), 1, 16, 15

	;55
	.word mapRound64+$48, mapRound64+$4d
	.byte .BANK(mapRound64), 1, 16, 6

	;56 Tractor
	.word macTractor, mapTractor
	.byte .BANK(mapTractor), 1, 4, 4

	;57 Shoe facing right
	.word macShoeR, mapShoe
	.byte .BANK(mapShoe), 1, 3, 2

	;58 Shoe facing left
	.word macShoeL, mapShoe
	.byte .BANK(mapShoe), 1, 3, 2

	;59 Continue
	.word macGameOver, mapGameOver
	.byte .BANK(mapGameOver), 1, 16, 15

	;5A Fan (counter-clockwise)
	.word macFanL, mapFan
	.byte .BANK(mapFan), 1, 2, 2

	;5B Fan (clockwise)
	.word macFanR, mapFan
	.byte .BANK(mapFan), 1, 2, 2

	;5C Bonus game 1
	.word macBonus, mapBonus1
	.byte .BANK(mapBonus1), 1, 16, 15

	;5D Bonus game 2
	.word macBonus, mapBonus2
	.byte .BANK(mapBonus2), 1, 16, 15

	;5E Bonus game 3
	.word macBonus, mapBonus3
	.byte .BANK(mapBonus3), 1, 16, 15

	;5F Adventure start
	.word macAdventure, mapAdventure
	.byte .BANK(mapAdventure), 1, 16, 15

	;60 Adventure start 2P? (Unused, same parameters)
	.word macAdventure, mapAdventure
	.byte .BANK(mapAdventure), 1, 16, 15

	;61 Opening stage
	.word macOpeningStage, mapOpeningStage
	.byte .BANK(mapOpeningStage), 1, 16, 15

	;62 Flood A
	.word macFlood, mapFloodA
	.byte .BANK(mapFloodA), 1, 16, 1

	;63 Flood B
	.word macFlood, mapFloodB
	.byte .BANK(mapFloodB), 1, 16, 1

	;64 Flood C
	.word macFlood, mapFloodC
	.byte .BANK(mapFloodC), 1, 16, 1

	;65 Round 20 map B
	.word macBoss, mapRound20+$10
	.byte .BANK(mapRound20), 2, 32, 15

	;66 Ending
	.word macEnding, mapEnding
	.byte .BANK(mapEnding), 1, 16, 15

	;67 Round 40 map B
	.word macBoss, mapRound40B
	.byte .BANK(mapRound40B), 1, 16, 13

	;68 Game over
	.word macGameOver, mapGameOver
	.byte .BANK(mapGameOver), 1, 16, 4

macBlank:
	;- - - - - - 0x000358 00:A348: 02
	.incbin "map/macBlank.bin"

mapBlank:
	;- - - - - - 0x00035D 00:A34D: 00
	.incbin "map/mapBlank.bin"

mapRound01:
	;- D 0 - - - 0x00044D 00:A43D: 18
	.incbin "map/mapRound01.bin"

mapRound02:
	;- D 0 - - - 0x00054D 00:A53D: 18
	.incbin "map/mapRound02.bin"

mapRound03:
	;- D 0 - - - 0x00064D 00:A63D: 18
	.incbin "map/mapRound03.bin"

mapRound04:
	;- D 0 - - - 0x00074D 00:A73D: 18
	.incbin "map/mapRound04.bin"

mapRound05:
	;- D 0 - - - 0x00084D 00:A83D: 18
	.incbin "map/mapRound05.bin"

mapRound06:
	;- D 0 - - - 0x00094D 00:A93D: 18
	.incbin "map/mapRound06.bin"

mapRound07:
	;- D 0 - - - 0x000A4D 00:AA3D: 18
	.incbin "map/mapRound07.bin"

mapRound08:
	;- D 0 - - - 0x000B4D 00:AB3D: 18
	.incbin "map/mapRound08.bin"

mapRound09:
	;- D 0 - - - 0x000C4D 00:AC3D: 18
	.incbin "map/mapRound09.bin"

mapRound10:
	;- D 0 - - - 0x000D4D 00:AD3D: 18
	.incbin "map/mapRound10.bin"

mapRound11:
	;- D 0 - - - 0x000E4D 00:AE3D: 18
	.incbin "map/mapRound11.bin"

mapRound12:
	;- D 0 - - - 0x000F4D 00:AF3D: 18
	.incbin "map/mapRound12.bin"

mapRound13:
	;- D 0 - - - 0x00104D 00:B03D: 18
	.incbin "map/mapRound13.bin"

mapRound14:
	;- D 0 - - - 0x00114D 00:B13D: 18
	.incbin "map/mapRound14.bin"

mapRound15:
	;- D 0 - - - 0x00124D 00:B23D: 18
	.incbin "map/mapRound15.bin"

mapRound16:
	;- D 0 - - - 0x00134D 00:B33D: 18
	.incbin "map/mapRound16.bin"

mapRound17:
	;- D 0 - - - 0x00144D 00:B43D: 18
	.incbin "map/mapRound17.bin"

mapRound18:
	;- D 0 - - - 0x00154D 00:B53D: 18
	.incbin "map/mapRound18.bin"

mapRound19:
	;- D 0 - - - 0x00164D 00:B63D: 18
	.incbin "map/mapRound19.bin"

macWorld1:
	;- - - - - - 0x00174D 00:B73D: 00
	.incbin "map/macWorld1.bin"

macOpeningSkulls:
	;- D 0 - - - 0x001C4D 00:BC3D: 00
	.incbin "map/macOpeningSkulls.bin"

mapOpeningSkulls:
	;- D 0 - - - 0x001D0B 00:BCFB: 01
	.incbin "map/mapOpeningSkulls.bin"

macOpeningTree:
	;- - - - - - 0x001D2E 00:BD1E: 00
	.incbin "map/macOpeningTree.bin"

mapOpeningTree:
	;- D 0 - - - 0x001DFB 00:BDEB: 08
	.incbin "map/mapOpeningTree.bin"

macOpeningStage:
	;- D 0 - - - 0x001E1E 00:BE0E: 03
	.incbin "map/macOpeningStage.bin"

mapOpeningStage:
	;- D 0 - - - 0x001EC8 00:BEB8: 00
	.incbin "map/mapOpeningStage.bin"

;Filler data
.ifdef REGION_JP
	;- - - - - - 0x001FB8 00:BFA8: 00
	.incbin "filler/fill00_JP.bin"
.else
	;- - - - - - 0x001FB8 00:BFA8: 00
	.incbin "filler/fill00.bin"
.endif