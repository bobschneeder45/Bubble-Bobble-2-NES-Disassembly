.segment "PRG_BANK_4"
; 0x008010-0x00A00F

;--- Contents ---
;Sprite data (table expected to be at start of bank)
;Palettes
;Reward data

.include "anim/images1.asm"

RoundsEnemyPalettes:
	;- - - - - - 0x0099A7 02:B997: 00
	.byte $00,$00		;Round 00 (dummy)
	.byte $00,$00		;Round 01
	.byte $18,$00		;Round 02
	.byte $10,$00		;Round 03
	.byte $10,$00		;Round 04
	.byte $10,$18		;Round 05
	.byte $24,$0C		;Round 06
	.byte $18,$00		;Round 07
	.byte $24,$00		;Round 08
	.byte $00,$00		;Round 09
	.byte $4C,$4C		;Round 10
	.byte $10,$18		;Round 11
	.byte $28,$04		;Round 12
	.byte $0C,$00		;Round 13
	.byte $04,$0C		;Round 14
	.byte $00,$00		;Round 15
	.byte $24,$00		;Round 16
	.byte $00,$00		;Round 17
	.byte $04,$04		;Round 18
	.byte $18,$18		;Round 19
	.byte $58,$00		;Round 20
	.byte $00,$00		;Round 21
	.byte $28,$28		;Round 22
	.byte $0C,$18		;Round 23
	.byte $54,$18		;Round 24
	.byte $80,$80		;Round 25
	.byte $3C,$04		;Round 26
	.byte $38,$04		;Round 27
	.byte $80,$0C		;Round 28
	.byte $10,$18		;Round 29
	.byte $50,$50		;Round 30
	.byte $28,$00		;Round 31
	.byte $28,$18		;Round 32
	.byte $54,$0C		;Round 33
	.byte $08,$18		;Round 34
	.byte $54,$14		;Round 35
	.byte $2C,$14		;Round 36
	.byte $08,$0C		;Round 37
	.byte $18,$14		;Round 38
	.byte $38,$18		;Round 39
	.byte $5C,$44		;Round 40
	.byte $14,$14		;Round 41
	.byte $80,$80		;Round 42
	.byte $2C,$18		;Round 43
	.byte $08,$00		;Round 44
	.byte $20,$1C		;Round 45
	.byte $2C,$04		;Round 46
	.byte $80,$80		;Round 47
	.byte $04,$04		;Round 48
	.byte $1C,$04		;Round 49
.ifdef REGION_JP
	.byte $00,$14		;Round 50
.else
	.byte $00,$00		;Round 50
.endif
	.byte $14,$14		;Round 51
	.byte $10,$18		;Round 52
	.byte $24,$18		;Round 53
	.byte $2C,$18		;Round 54
	.byte $10,$0C		;Round 55
	.byte $2C,$0C		;Round 56
	.byte $24,$0C		;Round 57
	.byte $28,$18		;Round 58
	.byte $30,$14		;Round 59
	.byte $64,$60		;Round 60
	.byte $30,$0C		;Round 61
	.byte $08,$0C		;Round 62
	.byte $18,$14		;Round 63
	.byte $14,$14		;Round 64
	.byte $3C,$00		;Round 65
	.byte $20,$1C		;Round 66
	.byte $14,$18		;Round 67
	.byte $18,$18		;Round 68
	.byte $40,$04		;Round 69
	.byte $68,$00		;Round 70
	.byte $80,$18		;Round 71
	.byte $04,$04		;Round 72
	.byte $30,$1C		;Round 73
	.byte $30,$14		;Round 74
	.byte $1C,$18		;Round 75
	.byte $40,$1C		;Round 76
	.byte $40,$04		;Round 77
	.byte $30,$18		;Round 78
	.byte $68,$74		;Round 79
	.byte $68,$6C		;Round 80

DATA_04BA39:
	.byte $20					;- D 0 - - - 0x009A49 02:BA39: 20
	.byte $28					;- D 0 - - - 0x009A4A 02:BA3A: 28

DATA_04BA3B:
	.byte $03					;- - - - - - 0x009A4B 02:BA3B: 03
	.byte $03					;- D 0 - - - 0x009A4C 02:BA3C: 03
	.byte $03					;- D 0 - - - 0x009A4D 02:BA3D: 03
	.byte $03					;- D 0 - - - 0x009A4E 02:BA3E: 03
	.byte $03					;- D 0 - - - 0x009A4F 02:BA3F: 03
	.byte $03					;- D 0 - - - 0x009A50 02:BA40: 03
	.byte $03					;- D 0 - - - 0x009A51 02:BA41: 03
	.byte $03					;- D 0 - - - 0x009A52 02:BA42: 03
	.byte $03					;- D 0 - - - 0x009A53 02:BA43: 03
	.byte $03					;- D 0 - - - 0x009A54 02:BA44: 03
	.byte $03					;- D 0 - - - 0x009A55 02:BA45: 03
	.byte $03					;- D 0 - - - 0x009A56 02:BA46: 03
	.byte $03					;- D 0 - - - 0x009A57 02:BA47: 03
	.byte $03					;- D 0 - - - 0x009A58 02:BA48: 03
	.byte $03					;- D 0 - - - 0x009A59 02:BA49: 03
	.byte $03					;- D 0 - - - 0x009A5A 02:BA4A: 03
	.byte $03					;- D 0 - - - 0x009A5B 02:BA4B: 03
	.byte $03					;- D 0 - - - 0x009A5C 02:BA4C: 03
	.byte $03					;- D 0 - - - 0x009A5D 02:BA4D: 03
	.byte $03					;- D 0 - - - 0x009A5E 02:BA4E: 03
	.byte $03					;- D 0 - - - 0x009A5F 02:BA4F: 03
	.byte $03					;- D 0 - - - 0x009A60 02:BA50: 03
	.byte $03					;- D 0 - - - 0x009A61 02:BA51: 03
	.byte $03					;- D 0 - - - 0x009A62 02:BA52: 03
	.byte $03					;- D 0 - - - 0x009A63 02:BA53: 03
	.byte $03					;- D 0 - - - 0x009A64 02:BA54: 03
	.byte $03					;- D 0 - - - 0x009A65 02:BA55: 03
	.byte $03					;- D 0 - - - 0x009A66 02:BA56: 03
	.byte $03					;- D 0 - - - 0x009A67 02:BA57: 03
	.byte $03					;- D 0 - - - 0x009A68 02:BA58: 03
	.byte $03					;- D 0 - - - 0x009A69 02:BA59: 03
	.byte $03					;- D 0 - - - 0x009A6A 02:BA5A: 03
	.byte $03					;- D 0 - - - 0x009A6B 02:BA5B: 03
	.byte $04					;- D 0 - - - 0x009A6C 02:BA5C: 04
	.byte $03					;- D 0 - - - 0x009A6D 02:BA5D: 03
	.byte $0C					;- D 0 - - - 0x009A6E 02:BA5E: 0C
	.byte $03					;- D 0 - - - 0x009A6F 02:BA5F: 03
	.byte $03					;- D 0 - - - 0x009A70 02:BA60: 03
	.byte $05					;- D 0 - - - 0x009A71 02:BA61: 05
	.byte $03					;- D 0 - - - 0x009A72 02:BA62: 03
	.byte $12					;- D 0 - - - 0x009A73 02:BA63: 12
	.byte $03					;- D 0 - - - 0x009A74 02:BA64: 03
	.byte $03					;- D 0 - - - 0x009A75 02:BA65: 03
	.byte $06					;- D 0 - - - 0x009A76 02:BA66: 06
	.byte $03					;- D 0 - - - 0x009A77 02:BA67: 03
	.byte $14					;- D 0 - - - 0x009A78 02:BA68: 14
	.byte $03					;- D 0 - - - 0x009A79 02:BA69: 03
	.byte $15					;- D 0 - - - 0x009A7A 02:BA6A: 15
	.byte $03					;- D 0 - - - 0x009A7B 02:BA6B: 03
	.byte $16					;- D 0 - - - 0x009A7C 02:BA6C: 16
	.byte $03					;- D 0 - - - 0x009A7D 02:BA6D: 03
	.byte $03					;- D 0 - - - 0x009A7E 02:BA6E: 03
	.byte $07					;- D 0 - - - 0x009A7F 02:BA6F: 07
	.byte $03					;- D 0 - - - 0x009A80 02:BA70: 03
	.byte $13					;- D 0 - - - 0x009A81 02:BA71: 13
	.byte $03					;- D 0 - - - 0x009A82 02:BA72: 03
	.byte $03					;- D 0 - - - 0x009A83 02:BA73: 03
	.byte $08					;- D 0 - - - 0x009A84 02:BA74: 08
	.byte $03					;- D 0 - - - 0x009A85 02:BA75: 03
	.byte $0D					;- D 0 - - - 0x009A86 02:BA76: 0D
	.byte $03					;- D 0 - - - 0x009A87 02:BA77: 03
	.byte $03					;- D 0 - - - 0x009A88 02:BA78: 03
	.byte $09					;- D 0 - - - 0x009A89 02:BA79: 09
	.byte $03					;- D 0 - - - 0x009A8A 02:BA7A: 03
	.byte $0E					;- D 0 - - - 0x009A8B 02:BA7B: 0E
	.byte $03					;- D 0 - - - 0x009A8C 02:BA7C: 03
	.byte $03					;- D 0 - - - 0x009A8D 02:BA7D: 03
	.byte $0A					;- D 0 - - - 0x009A8E 02:BA7E: 0A
	.byte $03					;- D 0 - - - 0x009A8F 02:BA7F: 03
	.byte $0D					;- D 0 - - - 0x009A90 02:BA80: 0D
	.byte $03					;- D 0 - - - 0x009A91 02:BA81: 03
	.byte $0F					;- D 0 - - - 0x009A92 02:BA82: 0F
	.byte $03					;- D 0 - - - 0x009A93 02:BA83: 03
	.byte $03					;- D 0 - - - 0x009A94 02:BA84: 03
	.byte $0B					;- D 0 - - - 0x009A95 02:BA85: 0B
	.byte $03					;- D 0 - - - 0x009A96 02:BA86: 03
	.byte $10					;- D 0 - - - 0x009A97 02:BA87: 10
	.byte $03					;- D 0 - - - 0x009A98 02:BA88: 03
	.byte $11					;- D 0 - - - 0x009A99 02:BA89: 11
	.byte $03					;- D 0 - - - 0x009A9A 02:BA8A: 03
	.byte $17					;- D 0 - - - 0x009A9B 02:BA8B: 17
	.byte $03					;- D 0 - - - 0x009A9C 02:BA8C: 03
	.byte $03					;- D 0 - - - 0x009A9D 02:BA8D: 03
	.byte $03					;- D 0 - - - 0x009A9E 02:BA8E: 03
	.byte $03					;- D 0 - - - 0x009A9F 02:BA8F: 03
	.byte $03					;- D 0 - - - 0x009AA0 02:BA90: 03
	.byte $03					;- D 0 - - - 0x009AA1 02:BA91: 03
	.byte $03					;- D 0 - - - 0x009AA2 02:BA92: 03
	.byte $03					;- D 0 - - - 0x009AA3 02:BA93: 03
	.byte $03					;- D 0 - - - 0x009AA4 02:BA94: 03
	.byte $03					;- D 0 - - - 0x009AA5 02:BA95: 03
	.byte $03					;- D 0 - - - 0x009AA6 02:BA96: 03
	.byte $03					;- D 0 - - - 0x009AA7 02:BA97: 03
	.byte $03					;- D 0 - - - 0x009AA8 02:BA98: 03
	.byte $03					;- D 0 - - - 0x009AA9 02:BA99: 03
	.byte $03					;- D 0 - - - 0x009AAA 02:BA9A: 03
	.byte $03					;- D 0 - - - 0x009AAB 02:BA9B: 03
	.byte $03					;- D 0 - - - 0x009AAC 02:BA9C: 03
	.byte $18					;- D 0 - - - 0x009AAD 02:BA9D: 18
	.byte $03					;- D 0 - - - 0x009AAE 02:BA9E: 03
	.byte $03					;- D 0 - - - 0x009AAF 02:BA9F: 03
	.byte $03					;- D 0 - - - 0x009AB0 02:BAA0: 03
	.byte $03					;- D 0 - - - 0x009AB1 02:BAA1: 03
	.byte $03					;- D 0 - - - 0x009AB2 02:BAA2: 03
	.byte $03					;- D 0 - - - 0x009AB3 02:BAA3: 03
	.byte $03					;- D 0 - - - 0x009AB4 02:BAA4: 03
	.byte $03					;- D 0 - - - 0x009AB5 02:BAA5: 03
	.byte $03					;- D 0 - - - 0x009AB6 02:BAA6: 03
	.byte $03					;- D 0 - - - 0x009AB7 02:BAA7: 03
	.byte $03					;- D 0 - - - 0x009AB8 02:BAA8: 03
	.byte $03					;- D 0 - - - 0x009AB9 02:BAA9: 03
	.byte $03					;- D 0 - - - 0x009ABA 02:BAAA: 03
	.byte $03					;- D 0 - - - 0x009ABB 02:BAAB: 03
	.byte $03					;- D 0 - - - 0x009ABC 02:BAAC: 03
	.byte $03					;- D 0 - - - 0x009ABD 02:BAAD: 03

RoundMaps:
	;- - - - - - 0x009ABE 02:BAAE: 00
	.byte mapBlank_ID
	.byte mapRound01_ID
	.byte mapRound02_ID
	.byte mapRound03_ID
	.byte mapRound04_ID
	.byte mapRound05_ID
	.byte mapRound06_ID
	.byte mapRound07_ID
	.byte mapRound08_ID
	.byte mapRound09_ID
	.byte mapRound10_ID
	.byte mapRound11_ID
	.byte mapRound12_ID
	.byte mapRound13_ID
	.byte mapRound14_ID
	.byte mapRound15_ID
	.byte mapRound16_ID
	.byte mapRound17_ID
	.byte mapRound18_ID
	.byte mapRound19_ID
	.byte mapRound20_ID
	.byte mapRound21_ID
	.byte mapRound22_ID
	.byte mapRound23_ID
	.byte mapRound24_ID
	.byte mapRound25_ID
	.byte mapRound26_ID
	.byte mapRound27_ID
	.byte mapRound28_ID
	.byte mapRound29_ID
	.byte mapRound30_ID
	.byte mapRound31_ID
	.byte mapRound32_ID
	.byte mapRound33_ID
	.byte mapRound34_ID
	.byte mapRound35_ID
	.byte mapRound36_ID
	.byte mapRound37_ID
	.byte mapRound38_ID
	.byte mapRound39_ID
	.byte mapRound40_ID
	.byte mapRound41_ID
	.byte mapRound42_ID
	.byte mapRound43_ID
	.byte mapRound44_ID
	.byte mapRound45_ID
	.byte mapRound46_ID
	.byte mapRound47_ID
	.byte mapRound48_ID
	.byte mapRound49_ID
	.byte mapRound50_ID
	.byte mapRound51_ID
	.byte mapRound52_ID
	.byte mapRound53_ID
	.byte mapRound54_ID
	.byte mapRound55_ID
	.byte mapRound56_ID
	.byte mapRound57_ID
	.byte mapRound58_ID
	.byte mapRound59_ID
	.byte mapRound60_ID
	.byte mapRound61_ID
	.byte mapRound62_ID
	.byte mapRound63_ID
	.byte mapRound64_ID
	.byte mapRound65_ID
	.byte mapRound66_ID
	.byte mapRound67_ID
	.byte mapRound68_ID
	.byte mapRound69_ID
	.byte mapRound70_ID
	.byte mapRound71_ID
	.byte mapRound72_ID
	.byte mapRound73_ID
	.byte mapRound74_ID
	.byte mapRound75_ID
	.byte mapRound76_ID
	.byte mapRound77_ID
	.byte mapRound78_ID
	.byte mapRound79_ID
	.byte mapRound80_ID

RoundChrBanks:
	;- - - - - - 0x009B0F 02:BAFF: 00
	.byte $00						;Round 00
	.byte chrGiantTower_AA_ID		;Round 01
	.byte chrGiantTower_AA_ID		;Round 02
	.byte chrGiantTower_AA_ID		;Round 03
	.byte chrGiantTower_AA_ID		;Round 04
	.byte chrGiantTower_AA_ID		;Round 05
	.byte chrGiantTower_AA_ID		;Round 06
	.byte chrGiantTower_AA_ID		;Round 07
	.byte chrGiantTower_AA_ID		;Round 08
	.byte chrGiantTower_AA_ID		;Round 09
	.byte chrGiantTower_AA_ID		;Round 10
	.byte chrGiantTower_BA_ID		;Round 11
	.byte chrGiantTower_AA_ID		;Round 12
	.byte chrGiantTower_AA_ID		;Round 13
	.byte chrGiantTower_BA_ID		;Round 14
	.byte chrGiantTower_AA_ID		;Round 15
	.byte chrGiantTower_AA_ID		;Round 16
	.byte chrGiantTower_AA_ID		;Round 17
	.byte chrGiantTower_AA_ID		;Round 18
	.byte chrGiantTower_AA_ID		;Round 19
	.byte chrBossCave_A_ID			;Round 20
	.byte chrBoomtown_A_ID			;Round 21
	.byte chrBoomtown_A_ID			;Round 22
	.byte chrBoomtown_A_ID			;Round 23
	.byte chrBoomtown_A_ID			;Round 24
	.byte chrBoomtown_A_ID			;Round 25
	.byte chrBoomtown_A_ID			;Round 26
	.byte chrBoomtown_A_ID			;Round 27
	.byte chrBoomtown_A_ID			;Round 28
	.byte chrBoomtown_A_ID			;Round 29
	.byte chrBoomtown_A_ID			;Round 30
	.byte chrBoomtown_A_ID			;Round 31
	.byte chrBoomtown_A_ID			;Round 32
	.byte chrBoomtown_A_ID			;Round 33
	.byte chrBoomtown_A_ID			;Round 34
	.byte chrBoomtown_A_ID			;Round 35
	.byte chrBoomtown_A_ID			;Round 36
	.byte chrBoomtown_A_ID			;Round 37
	.byte chrBoomtown_A_ID			;Round 38
	.byte chrBoomtown_A_ID			;Round 39
	.byte chrBossCave_A_ID			;Round 40
	.byte chrShiningLake_AA_ID		;Round 41
	.byte chrShiningLake_AA_ID		;Round 42
	.byte chrShiningLake_BA_ID		;Round 43
	.byte chrShiningLake_AA_ID		;Round 44
	.byte chrShiningLake_AA_ID		;Round 45
	.byte chrShiningLake_AA_ID		;Round 46
	.byte chrShiningLake_BA_ID		;Round 47
	.byte chrShiningLake_AA_ID		;Round 48
	.byte chrShiningLake_BA_ID		;Round 49
	.byte chrShiningLake_AA_ID		;Round 50
	.byte chrShiningLake_AA_ID		;Round 51
	.byte chrShiningLake_BA_ID		;Round 52
	.byte chrShiningLake_BA_ID		;Round 53
	.byte chrShiningLake_AA_ID		;Round 54
	.byte chrShiningLake_AA_ID		;Round 55
	.byte chrShiningLake_AA_ID		;Round 56
	.byte chrShiningLake_BA_ID		;Round 57
	.byte chrShiningLake_AA_ID		;Round 58
	.byte chrShiningLake_AA_ID		;Round 59
	.byte chrBossCave_A_ID			;Round 60
	.byte chrFireCastle_AA_ID		;Round 61
	.byte chrFireCastle_AA_ID		;Round 62
	.byte chrFireCastle_AA_ID		;Round 63
	.byte chrFireCastle_AA_ID		;Round 64
	.byte chrFireCastle_AA_ID		;Round 65
	.byte chrFireCastle_AA_ID		;Round 66
	.byte chrFireCastle_AA_ID		;Round 67
	.byte chrFireCastle_AA_ID		;Round 68
	.byte chrFireCastle_AA_ID		;Round 69
	.byte chrFireCastle_AA_ID		;Round 70
	.byte chrFireCastle_AA_ID		;Round 71
	.byte chrFireCastle_AA_ID		;Round 72
	.byte chrFireCastle_AA_ID		;Round 73
	.byte chrFireCastle_AA_ID		;Round 74
	.byte chrFireCastle_AA_ID		;Round 75
	.byte chrFireCastle_AA_ID		;Round 76
	.byte chrFireCastle_AA_ID		;Round 77
	.byte chrFireCastle_AA_ID		;Round 78
	.byte chrBossCave_A_ID			;Round 79
	.byte chrBossCave_A_ID			;Round 80

OpeningChrA:
	.byte chrIntroStage_A_ID					;- D 0 - - - 0x009B60 02:BB50: 06
	.byte chrIntroStage_A_ID					;- D 0 - - - 0x009B61 02:BB51: 06
	.byte chrIntroStage_A_ID					;- D 0 - - - 0x009B62 02:BB52: 06
	.byte chrTitleScreen_A_ID					;- D 0 - - - 0x009B63 02:BB53: 7C
	.byte chrShoeCar_A_ID					;- D 0 - - - 0x009B64 02:BB54: 38
	.byte chrOldTitle_A_ID					;- D 0 - - - 0x009B65 02:BB55: 00

OpeningChrB:
	.byte chrIntroSkull_A_ID					;- D 0 - - - 0x009B66 02:BB56: 08
	.byte chrIntroSkull_A_ID					;- D 0 - - - 0x009B67 02:BB57: 08
	.byte chrIntroTree_A_ID					;- D 0 - - - 0x009B68 02:BB58: 0A
	.byte chrTitleScreen_C_ID					;- D 0 - - - 0x009B69 02:BB59: 7E
	.byte chrSmallFont_A_ID					;- D 0 - - - 0x009B6A 02:BB5A: 0E
	.byte chrOldTitle_C_ID					;- D 0 - - - 0x009B6B 02:BB5B: 02

OpeningMaps:
	.byte mapOpeningStage_ID					;- D 0 - - - 0x009B6C 02:BB5C: 61
	.byte mapOpeningSkulls_ID					;- D 0 - - - 0x009B6D 02:BB5D: 03
	.byte mapOpeningTree_ID					;- D 0 - - - 0x009B6E 02:BB5E: 04
	.byte mapTitle_ID					;- D 0 - - - 0x009B6F 02:BB5F: 02
	.byte mapAdventure1_ID					;- D 0 - - - 0x009B70 02:BB60: 5F
	.byte mapEnding_ID					;- D 0 - - - 0x009B71 02:BB61: 66

OpeningBaseTiles:
	.byte $00					;- D 0 - - - 0x009B72 02:BB62: 00
	.byte $80					;- D 0 - - - 0x009B73 02:BB63: 80
	.byte $80					;- D 0 - - - 0x009B74 02:BB64: 80
	.byte $00					;- D 0 - - - 0x009B75 02:BB65: 00
	.byte $80					;- D 0 - - - 0x009B76 02:BB66: 80
	.byte $00					;- D 0 - - - 0x009B77 02:BB67: 00

OpeningTargetL:
	.byte $00					;- D 0 - - - 0x009B78 02:BB68: 00
	.byte $88					;- D 0 - - - 0x009B79 02:BB69: 88
	.byte $88					;- D 0 - - - 0x009B7A 02:BB6A: 88
	.byte $00					;- D 0 - - - 0x009B7B 02:BB6B: 00
	.byte $00					;- D 0 - - - 0x009B7C 02:BB6C: 00
	.byte $00					;- D 0 - - - 0x009B7D 02:BB6D: 00

OpeningTargetH:
	.byte $20					;- D 0 - - - 0x009B7E 02:BB6E: 20
	.byte $21					;- D 0 - - - 0x009B7F 02:BB6F: 21
	.byte $21					;- D 0 - - - 0x009B80 02:BB70: 21
	.byte $20					;- D 0 - - - 0x009B81 02:BB71: 20
	.byte $20					;- D 0 - - - 0x009B82 02:BB72: 20
	.byte $20					;- D 0 - - - 0x009B83 02:BB73: 20

OpeningHScroll:
	.byte $F8					;- D 0 - - - 0x009B84 02:BB74: F8
	.byte $F8					;- D 0 - - - 0x009B85 02:BB75: F8
	.byte $F8					;- D 0 - - - 0x009B86 02:BB76: F8
	.byte $00					;- D 0 - - - 0x009B87 02:BB77: 00
	.byte $00					;- D 0 - - - 0x009B88 02:BB78: 00
	.byte $00					;- D 0 - - - 0x009B89 02:BB79: 00

OpeningFadeColorAmounts:
	.byte 32					;- D 0 - - - 0x009B8A 02:BB7A: 20
	.byte 12					;- D 0 - - - 0x009B8B 02:BB7B: 0C
	.byte 12					;- D 0 - - - 0x009B8C 02:BB7C: 0C
	.byte 20					;- D 0 - - - 0x009B8D 02:BB7D: 14
	.byte 32					;- D 0 - - - 0x009B8E 02:BB7E: 20
	.byte 32					;- D 0 - - - 0x009B8F 02:BB7F: 20

DATA_04BB80:
	.byte $0C					;- - - - - - 0x009B90 02:BB80: 0C
	.byte $0C					;- D 0 - - - 0x009B91 02:BB81: 0C
	.byte $20					;- D 0 - - - 0x009B92 02:BB82: 20
	.byte $20					;- - - - - - 0x009B93 02:BB83: 20
	.byte $20					;- D 0 - - - 0x009B94 02:BB84: 20
	.byte $20					;- - - - - - 0x009B95 02:BB85: 20

OpeningPalTable:
	;- D 0 - - - 0x009B96 02:BB86: 92
	.word palOpeningFrame
	.word palOpeningSkulls
	.word palOpeningTree
	.word palTitleScreen
	.word palAdventure
	.word palEnding

palOpeningFrame:
	.byte $0F					;- D 0 - - - 0x009BA2 02:BB92: 0F
	.byte $0F					;- D 0 - - - 0x009BA3 02:BB93: 0F
	.byte $0F					;- D 0 - - - 0x009BA4 02:BB94: 0F
	.byte $0F					;- D 0 - - - 0x009BA5 02:BB95: 0F
	.byte $0F					;- D 0 - - - 0x009BA6 02:BB96: 0F
	.byte $0F					;- D 0 - - - 0x009BA7 02:BB97: 0F
	.byte $0F					;- D 0 - - - 0x009BA8 02:BB98: 0F
	.byte $0F					;- D 0 - - - 0x009BA9 02:BB99: 0F
	.byte $0F					;- D 0 - - - 0x009BAA 02:BB9A: 0F
	.byte $0F					;- D 0 - - - 0x009BAB 02:BB9B: 0F
	.byte $0F					;- D 0 - - - 0x009BAC 02:BB9C: 0F
	.byte $0F					;- D 0 - - - 0x009BAD 02:BB9D: 0F
	.byte $0F					;- D 0 - - - 0x009BAE 02:BB9E: 0F
	.byte $08					;- D 0 - - - 0x009BAF 02:BB9F: 08
	.byte $18					;- D 0 - - - 0x009BB0 02:BBA0: 18
	.byte $27					;- D 0 - - - 0x009BB1 02:BBA1: 27
	.byte $0F					;- D 0 - - - 0x009BB2 02:BBA2: 0F
	.byte $0F					;- D 0 - - - 0x009BB3 02:BBA3: 0F
	.byte $37					;- D 0 - - - 0x009BB4 02:BBA4: 37
	.byte $2B					;- D 0 - - - 0x009BB5 02:BBA5: 2B
	.byte $0F					;- D 0 - - - 0x009BB6 02:BBA6: 0F
	.byte $0F					;- D 0 - - - 0x009BB7 02:BBA7: 0F
	.byte $3B					;- D 0 - - - 0x009BB8 02:BBA8: 3B
	.byte $2C					;- D 0 - - - 0x009BB9 02:BBA9: 2C
	.byte $0F					;- D 0 - - - 0x009BBA 02:BBAA: 0F
	.byte $0F					;- D 0 - - - 0x009BBB 02:BBAB: 0F
	.byte $37					;- D 0 - - - 0x009BBC 02:BBAC: 37
	.byte $25					;- D 0 - - - 0x009BBD 02:BBAD: 25
	.byte $0F					;- D 0 - - - 0x009BBE 02:BBAE: 0F
	.byte $0F					;- D 0 - - - 0x009BBF 02:BBAF: 0F
	.byte $38					;- D 0 - - - 0x009BC0 02:BBB0: 38
	.byte $1A					;- D 0 - - - 0x009BC1 02:BBB1: 1A

palOpeningSkulls:
	.byte $0F					;- D 0 - - - 0x009BC2 02:BBB2: 0F
	.byte $21					;- D 0 - - - 0x009BC3 02:BBB3: 21
	.byte $12					;- D 0 - - - 0x009BC4 02:BBB4: 12
	.byte $03					;- D 0 - - - 0x009BC5 02:BBB5: 03
	.byte $0F					;- D 0 - - - 0x009BC6 02:BBB6: 0F
	.byte $2A					;- D 0 - - - 0x009BC7 02:BBB7: 2A
	.byte $1A					;- D 0 - - - 0x009BC8 02:BBB8: 1A
	.byte $17					;- D 0 - - - 0x009BC9 02:BBB9: 17
	.byte $0F					;- D 0 - - - 0x009BCA 02:BBBA: 0F
	.byte $0C					;- D 0 - - - 0x009BCB 02:BBBB: 0C
	.byte $12					;- D 0 - - - 0x009BCC 02:BBBC: 12
	.byte $03					;- D 0 - - - 0x009BCD 02:BBBD: 03

palOpeningTree:
	.byte $0F					;- D 0 - - - 0x009BCE 02:BBBE: 0F
	.byte $27					;- D 0 - - - 0x009BCF 02:BBBF: 27
	.byte $17					;- D 0 - - - 0x009BD0 02:BBC0: 17
	.byte $1A					;- D 0 - - - 0x009BD1 02:BBC1: 1A
	.byte $0F					;- D 0 - - - 0x009BD2 02:BBC2: 0F
	.byte $2A					;- D 0 - - - 0x009BD3 02:BBC3: 2A
	.byte $0B					;- D 0 - - - 0x009BD4 02:BBC4: 0B
	.byte $1A					;- D 0 - - - 0x009BD5 02:BBC5: 1A
	.byte $0F					;- D 0 - - - 0x009BD6 02:BBC6: 0F
	.byte $19					;- D 0 - - - 0x009BD7 02:BBC7: 19
	.byte $29					;- D 0 - - - 0x009BD8 02:BBC8: 29
	.byte $3E					;- D 0 - - - 0x009BD9 02:BBC9: 3E

palTitleScreen:
.ifdef REGION_JP
	.byte $30					;- D 0 - - - 0x009BDA 02:BBCA: 30
	.byte $2A					;- D 0 - - - 0x009BDB 02:BBCB: 2A
	.byte $26					;- D 0 - - - 0x009BDC 02:BBCC: 26
	.byte $0F					;- D 0 - - - 0x009BDD 02:BBCD: 0F
	.byte $30					;- D 0 - - - 0x009BDE 02:BBCE: 30
	.byte $2A					;- D 0 - - - 0x009BDF 02:BBCF: 2A
	.byte $26					;- D 0 - - - 0x009BE0 02:BBD0: 26
	.byte $0F					;- D 0 - - - 0x009BE1 02:BBD1: 0F
	.byte $30					;- D 0 - - - 0x009BE2 02:BBD2: 30
	.byte $21					;- D 0 - - - 0x009BE3 02:BBD3: 21
	.byte $26					;- D 0 - - - 0x009BE4 02:BBD4: 26
	.byte $0F					;- D 0 - - - 0x009BE5 02:BBD5: 0F
	.byte $30					;- D 0 - - - 0x009BE6 02:BBD6: 30
	.byte $24					;- - - - - - 0x009BE7 02:BBD7: 24
	.byte $22					;- - - - - - 0x009BE8 02:BBD8: 22
	.byte $0F					;- - - - - - 0x009BE9 02:BBD9: 0F
	.byte $30					;- - - - - - 0x009BEA 02:BBDA: 30
	.byte $0F					;- - - - - - 0x009BEB 02:BBDB: 0F
	.byte $30					;- - - - - - 0x009BEC 02:BBDC: 30
	.byte $2A					;- - - - - - 0x009BED 02:BBDD: 2A
.else
	.byte $30					;- D 0 - - - 0x009BDA 02:BBCA: 30
	.byte $2A					;- D 0 - - - 0x009BDB 02:BBCB: 2A
	.byte $26					;- D 0 - - - 0x009BDC 02:BBCC: 26
	.byte $0F					;- D 0 - - - 0x009BDD 02:BBCD: 0F
	.byte $30					;- D 0 - - - 0x009BDE 02:BBCE: 30
	.byte $2A					;- D 0 - - - 0x009BDF 02:BBCF: 2A
	.byte $26					;- D 0 - - - 0x009BE0 02:BBD0: 26
	.byte $0F					;- D 0 - - - 0x009BE1 02:BBD1: 0F
	.byte $30					;- D 0 - - - 0x009BE2 02:BBD2: 30
	.byte $21					;- D 0 - - - 0x009BE3 02:BBD3: 21
	.byte $26					;- D 0 - - - 0x009BE4 02:BBD4: 26
	.byte $0F					;- D 0 - - - 0x009BE5 02:BBD5: 0F
	.byte $30					;- D 0 - - - 0x009BE6 02:BBD6: 30
	.byte $26					;- D 0 - - - 0x009BE7 02:BBD7: 26
	.byte $24					;- D 0 - - - 0x009BE8 02:BBD8: 24
	.byte $0F					;- D 0 - - - 0x009BE9 02:BBD9: 0F
	.byte $30					;- D 0 - - - 0x009BEA 02:BBDA: 30
	.byte $0F					;- D 0 - - - 0x009BEB 02:BBDB: 0F
	.byte $30					;- D 0 - - - 0x009BEC 02:BBDC: 30
	.byte $2A					;- D 0 - - - 0x009BED 02:BBDD: 2A
.endif

palEnding:
	;Full set of BG and sprite palettes for the ending
	.byte $0F					;- D 0 - - - 0x009BEE 02:BBDE: 0F
	.byte $30					;- D 0 - - - 0x009BEF 02:BBDF: 30
	.byte $31					;- D 0 - - - 0x009BF0 02:BBE0: 31
	.byte $22					;- D 0 - - - 0x009BF1 02:BBE1: 22
	.byte $0F					;- D 0 - - - 0x009BF2 02:BBE2: 0F
	.byte $37					;- D 0 - - - 0x009BF3 02:BBE3: 37
	.byte $26					;- D 0 - - - 0x009BF4 02:BBE4: 26
	.byte $22					;- D 0 - - - 0x009BF5 02:BBE5: 22
	.byte $0F					;- D 0 - - - 0x009BF6 02:BBE6: 0F
	.byte $37					;- D 0 - - - 0x009BF7 02:BBE7: 37
	.byte $26					;- D 0 - - - 0x009BF8 02:BBE8: 26
	.byte $2A					;- D 0 - - - 0x009BF9 02:BBE9: 2A
	.byte $0F					;- D 0 - - - 0x009BFA 02:BBEA: 0F
	.byte $30					;- D 0 - - - 0x009BFB 02:BBEB: 30
	.byte $31					;- D 0 - - - 0x009BFC 02:BBEC: 31
	.byte $22					;- D 0 - - - 0x009BFD 02:BBED: 22
	.byte $0F					;- D 0 - - - 0x009BFE 02:BBEE: 0F
	.byte $0F					;- D 0 - - - 0x009BFF 02:BBEF: 0F
	.byte $37					;- D 0 - - - 0x009C00 02:BBF0: 37
	.byte $2B					;- D 0 - - - 0x009C01 02:BBF1: 2B
	.byte $0F					;- D 0 - - - 0x009C02 02:BBF2: 0F
	.byte $0F					;- D 0 - - - 0x009C03 02:BBF3: 0F
	.byte $3B					;- D 0 - - - 0x009C04 02:BBF4: 3B
	.byte $2C					;- D 0 - - - 0x009C05 02:BBF5: 2C
	.byte $0F					;- D 0 - - - 0x009C06 02:BBF6: 0F
	.byte $0F					;- D 0 - - - 0x009C07 02:BBF7: 0F
	.byte $37					;- D 0 - - - 0x009C08 02:BBF8: 37
	.byte $25					;- D 0 - - - 0x009C09 02:BBF9: 25
	.byte $0F					;- D 0 - - - 0x009C0A 02:BBFA: 0F
	.byte $0F					;- D 0 - - - 0x009C0B 02:BBFB: 0F
	.byte $38					;- D 0 - - - 0x009C0C 02:BBFC: 38
	.byte $1A					;- D 0 - - - 0x009C0D 02:BBFD: 1A

palAdventure:
	.byte $0F					;- D 0 - - - 0x009C0E 02:BBFE: 0F
	.byte $37					;- D 0 - - - 0x009C0F 02:BBFF: 37
	.byte $27					;- D 0 - - - 0x009C10 02:BC00: 27
	.byte $17					;- D 0 - - - 0x009C11 02:BC01: 17
	.byte $0F					;- D 0 - - - 0x009C12 02:BC02: 0F
	.byte $1A					;- D 0 - - - 0x009C13 02:BC03: 1A
	.byte $0A					;- D 0 - - - 0x009C14 02:BC04: 0A
	.byte $2C					;- D 0 - - - 0x009C15 02:BC05: 2C
	.byte $0F					;- D 0 - - - 0x009C16 02:BC06: 0F
	.byte $27					;- D 0 - - - 0x009C17 02:BC07: 27
	.byte $17					;- D 0 - - - 0x009C18 02:BC08: 17
	.byte $2C					;- D 0 - - - 0x009C19 02:BC09: 2C
	.byte $0F					;- D 0 - - - 0x009C1A 02:BC0A: 0F
	.byte $30					;- D 0 - - - 0x009C1B 02:BC0B: 30
	.byte $3B					;- D 0 - - - 0x009C1C 02:BC0C: 3B
	.byte $2C					;- D 0 - - - 0x009C1D 02:BC0D: 2C
	.byte $0F					;- D 0 - - - 0x009C1E 02:BC0E: 0F
	.byte $0F					;- D 0 - - - 0x009C1F 02:BC0F: 0F
	.byte $30					;- D 0 - - - 0x009C20 02:BC10: 30
	.byte $2A					;- D 0 - - - 0x009C21 02:BC11: 2A
	.byte $0F					;- D 0 - - - 0x009C22 02:BC12: 0F
	.byte $0F					;- D 0 - - - 0x009C23 02:BC13: 0F
	.byte $3B					;- D 0 - - - 0x009C24 02:BC14: 3B
	.byte $2C					;- D 0 - - - 0x009C25 02:BC15: 2C
	.byte $0F					;- D 0 - - - 0x009C26 02:BC16: 0F
	.byte $0F					;- D 0 - - - 0x009C27 02:BC17: 0F
	.byte $37					;- D 0 - - - 0x009C28 02:BC18: 37
	.byte $25					;- D 0 - - - 0x009C29 02:BC19: 25
	.byte $0F					;- D 0 - - - 0x009C2A 02:BC1A: 0F
	.byte $0F					;- D 0 - - - 0x009C2B 02:BC1B: 0F
	.byte $38					;- D 0 - - - 0x009C2C 02:BC1C: 38
	.byte $1A					;- D 0 - - - 0x009C2D 02:BC1D: 1A

RoundsMusicTracks:
	;- - - - - - 0x009C2E 02:BC1E: 00
	.byte trSilence_ID							;Round 00
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 01
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 02
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 03
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 04
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 05
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 06
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 07
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 08
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 09
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 10
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 11
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 12
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 13
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 14
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 15
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 16
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 17
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 18
	.byte MUSIC_PLAYING|trGiantTower_ID			;Round 19
	.byte MUSIC_PLAYING|trBoss_ID				;Round 20
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 21
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 22
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 23
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 24
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 25
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 26
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 27
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 28
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 29
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 30
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 31
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 32
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 33
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 34
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 35
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 36
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 37
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 38
	.byte MUSIC_PLAYING|trBoomtown_ID			;Round 39
	.byte MUSIC_PLAYING|trBoss_ID				;Round 40
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 41
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 42
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 43
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 44
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 45
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 46
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 47
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 48
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 49
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 50
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 51
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 52
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 53
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 54
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 55
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 56
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 57
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 58
	.byte MUSIC_PLAYING|trShiningLake_ID		;Round 59
	.byte MUSIC_PLAYING|trBoss_ID				;Round 60
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 61
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 62
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 63
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 64
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 65
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 66
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 67
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 68
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 69
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 70
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 71
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 72
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 73
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 74
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 75
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 76
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 77
	.byte MUSIC_PLAYING|trFireCastle_ID			;Round 78
	.byte MUSIC_PLAYING|trBoss_ID				;Round 79
	.byte MUSIC_PLAYING|trBoss_ID				;Round 80

RoundHUDChrBanks:
	;- - - - - - 0x009C7F 02:BC6F: 00
	.byte $00						;Round 00
	.byte chrFans_AA_ID				;Round 01
	.byte chrFans_AA_ID				;Round 02
	.byte chrFans_AA_ID				;Round 03
	.byte chrFans_AA_ID				;Round 04
	.byte chrFans_AA_ID				;Round 05
	.byte chrFans_AA_ID				;Round 06
	.byte chrFans_AA_ID				;Round 07
	.byte chrFans_AA_ID				;Round 08
	.byte chrFans_AA_ID				;Round 09
	.byte chrFans_AA_ID				;Round 10
	.byte chrFans_AA_ID				;Round 11
	.byte chrFans_AA_ID				;Round 12
	.byte chrFans_AA_ID				;Round 13
	.byte chrFans_AA_ID				;Round 14
	.byte chrFans_AA_ID				;Round 15
	.byte chrFans_AA_ID				;Round 16
	.byte chrFans_AA_ID				;Round 17
	.byte chrFans_AA_ID				;Round 18
	.byte chrFans_AA_ID				;Round 19
	.byte chrFans_AA_ID				;Round 20
	.byte chrFans_AA_ID				;Round 21
	.byte chrFans_AA_ID				;Round 22
	.byte chrFans_AA_ID				;Round 23
	.byte chrFans_AA_ID				;Round 24
	.byte chrFans_AA_ID				;Round 25
	.byte chrFans_AA_ID				;Round 26
	.byte chrFans_AA_ID				;Round 27
	.byte chrFans_AA_ID				;Round 28
	.byte chrFans_AA_ID				;Round 29
	.byte chrFans_AA_ID				;Round 30
	.byte chrFans_AA_ID				;Round 31
	.byte chrFans_AA_ID				;Round 32
	.byte chrShoeCar_A_ID			;Round 33
	.byte chrFans_AA_ID				;Round 34
	.byte chrFans_AA_ID				;Round 35
	.byte chrFans_AA_ID				;Round 36
	.byte chrFans_AA_ID				;Round 37
	.byte chrShoeCar_A_ID			;Round 38
	.byte chrFans_AA_ID				;Round 39
	.byte chrFans_AA_ID				;Round 40
	.byte chrFans_AA_ID				;Round 41
	.byte chrFans_AA_ID				;Round 42
	.byte chrFans_AA_ID				;Round 43
	.byte chrFans_AA_ID				;Round 44
	.byte chrFans_AA_ID				;Round 45
	.byte chrFans_AA_ID				;Round 46
	.byte chrFans_AA_ID				;Round 47
	.byte chrFans_AA_ID				;Round 48
	.byte chrFans_AA_ID				;Round 49
	.byte chrMissileTractor_AA_ID	;Round 50
	.byte chrFans_AA_ID				;Round 51
	.byte chrFans_AA_ID				;Round 52
	.byte chrFans_AA_ID				;Round 53
	.byte chrFans_AA_ID				;Round 54
	.byte chrFans_AA_ID				;Round 55
	.byte chrFans_AA_ID				;Round 56
	.byte chrFans_AA_ID				;Round 57
	.byte chrFans_AA_ID				;Round 58
	.byte chrFans_AA_ID				;Round 59
	.byte chrFans_AA_ID				;Round 60
	.byte chrFans_AA_ID				;Round 61
	.byte chrFans_AA_ID				;Round 62
	.byte chrFans_AA_ID				;Round 63
	.byte chrFans_AA_ID				;Round 64
	.byte chrFans_AA_ID				;Round 65
	.byte chrFans_AA_ID				;Round 66
	.byte chrFans_AA_ID				;Round 67
	.byte chrFans_AA_ID				;Round 68
	.byte chrFans_AA_ID				;Round 69
	.byte chrFans_AA_ID				;Round 70
	.byte chrFans_AA_ID				;Round 71
	.byte chrFans_AA_ID				;Round 72
	.byte chrFans_AA_ID				;Round 73
	.byte chrFans_AA_ID				;Round 74
	.byte chrFans_AA_ID				;Round 75
	.byte chrFans_AA_ID				;Round 76
	.byte chrFans_AA_ID				;Round 77
	.byte chrFans_AA_ID				;Round 78
	.byte chrFans_AA_ID				;Round 79
	.byte chrFans_AA_ID				;Round 80
	.byte chrFans_AA_ID				;Round 81 (Bonus game 1)
	.byte chrFans_AA_ID				;Round 82 (Bonus game 2)
	.byte chrFans_AA_ID				;Round 83 (Bonus game 3)
	.byte chrFans_AA_ID				;Round 84

RoundHUDBlankTileIndexes:
	.byte $00					;- - - - - - 0x009CD4 02:BCC4: 00
	.byte $00					;- D 0 - - - 0x009CD5 02:BCC5: 00
	.byte $00					;- D 0 - - - 0x009CD6 02:BCC6: 00
	.byte $00					;- D 0 - - - 0x009CD7 02:BCC7: 00
	.byte $00					;- D 0 - - - 0x009CD8 02:BCC8: 00
	.byte $00					;- D 0 - - - 0x009CD9 02:BCC9: 00
	.byte $00					;- D 0 - - - 0x009CDA 02:BCCA: 00
	.byte $00					;- D 0 - - - 0x009CDB 02:BCCB: 00
	.byte $00					;- D 0 - - - 0x009CDC 02:BCCC: 00
	.byte $00					;- D 0 - - - 0x009CDD 02:BCCD: 00
	.byte $00					;- D 0 - - - 0x009CDE 02:BCCE: 00
	.byte $00					;- D 0 - - - 0x009CDF 02:BCCF: 00
	.byte $00					;- D 0 - - - 0x009CE0 02:BCD0: 00
	.byte $00					;- D 0 - - - 0x009CE1 02:BCD1: 00
	.byte $00					;- D 0 - - - 0x009CE2 02:BCD2: 00
	.byte $00					;- D 0 - - - 0x009CE3 02:BCD3: 00
	.byte $00					;- D 0 - - - 0x009CE4 02:BCD4: 00
	.byte $00					;- D 0 - - - 0x009CE5 02:BCD5: 00
	.byte $00					;- D 0 - - - 0x009CE6 02:BCD6: 00
	.byte $00					;- D 0 - - - 0x009CE7 02:BCD7: 00
	.byte $04					;- D 0 - - - 0x009CE8 02:BCD8: 04
	.byte $00					;- D 0 - - - 0x009CE9 02:BCD9: 00
	.byte $00					;- D 0 - - - 0x009CEA 02:BCDA: 00
	.byte $00					;- D 0 - - - 0x009CEB 02:BCDB: 00
	.byte $00					;- D 0 - - - 0x009CEC 02:BCDC: 00
	.byte $00					;- D 0 - - - 0x009CED 02:BCDD: 00
	.byte $00					;- D 0 - - - 0x009CEE 02:BCDE: 00
	.byte $00					;- D 0 - - - 0x009CEF 02:BCDF: 00
	.byte $00					;- D 0 - - - 0x009CF0 02:BCE0: 00
	.byte $00					;- D 0 - - - 0x009CF1 02:BCE1: 00
	.byte $00					;- D 0 - - - 0x009CF2 02:BCE2: 00
	.byte $00					;- D 0 - - - 0x009CF3 02:BCE3: 00
	.byte $00					;- D 0 - - - 0x009CF4 02:BCE4: 00
	.byte $00					;- D 0 - - - 0x009CF5 02:BCE5: 00
	.byte $00					;- D 0 - - - 0x009CF6 02:BCE6: 00
	.byte $00					;- D 0 - - - 0x009CF7 02:BCE7: 00
	.byte $00					;- D 0 - - - 0x009CF8 02:BCE8: 00
	.byte $00					;- D 0 - - - 0x009CF9 02:BCE9: 00
	.byte $06					;- D 0 - - - 0x009CFA 02:BCEA: 06
	.byte $00					;- D 0 - - - 0x009CFB 02:BCEB: 00
	.byte $04					;- D 0 - - - 0x009CFC 02:BCEC: 04
	.byte $00					;- D 0 - - - 0x009CFD 02:BCED: 00
	.byte $00					;- D 0 - - - 0x009CFE 02:BCEE: 00
	.byte $06					;- D 0 - - - 0x009CFF 02:BCEF: 06
	.byte $00					;- D 0 - - - 0x009D00 02:BCF0: 00
	.byte $00					;- D 0 - - - 0x009D01 02:BCF1: 00
	.byte $00					;- D 0 - - - 0x009D02 02:BCF2: 00
	.byte $00					;- D 0 - - - 0x009D03 02:BCF3: 00
	.byte $06					;- D 0 - - - 0x009D04 02:BCF4: 06
	.byte $00					;- D 0 - - - 0x009D05 02:BCF5: 00
	.byte $06					;- D 0 - - - 0x009D06 02:BCF6: 06
	.byte $00					;- D 0 - - - 0x009D07 02:BCF7: 00
	.byte $00					;- D 0 - - - 0x009D08 02:BCF8: 00
	.byte $00					;- D 0 - - - 0x009D09 02:BCF9: 00
	.byte $00					;- D 0 - - - 0x009D0A 02:BCFA: 00
	.byte $00					;- D 0 - - - 0x009D0B 02:BCFB: 00
	.byte $00					;- D 0 - - - 0x009D0C 02:BCFC: 00
	.byte $00					;- D 0 - - - 0x009D0D 02:BCFD: 00
	.byte $00					;- D 0 - - - 0x009D0E 02:BCFE: 00
	.byte $00					;- D 0 - - - 0x009D0F 02:BCFF: 00
	.byte $0A					;- D 0 - - - 0x009D10 02:BD00: 0A
	.byte $02					;- D 0 - - - 0x009D11 02:BD01: 02
	.byte $02					;- D 0 - - - 0x009D12 02:BD02: 02
	.byte $02					;- D 0 - - - 0x009D13 02:BD03: 02
	.byte $02					;- D 0 - - - 0x009D14 02:BD04: 02
	.byte $02					;- D 0 - - - 0x009D15 02:BD05: 02
	.byte $02					;- D 0 - - - 0x009D16 02:BD06: 02
	.byte $02					;- D 0 - - - 0x009D17 02:BD07: 02
	.byte $02					;- D 0 - - - 0x009D18 02:BD08: 02
	.byte $02					;- D 0 - - - 0x009D19 02:BD09: 02
	.byte $02					;- D 0 - - - 0x009D1A 02:BD0A: 02
	.byte $02					;- D 0 - - - 0x009D1B 02:BD0B: 02
	.byte $08					;- D 0 - - - 0x009D1C 02:BD0C: 08
	.byte $02					;- D 0 - - - 0x009D1D 02:BD0D: 02
	.byte $02					;- D 0 - - - 0x009D1E 02:BD0E: 02
	.byte $02					;- D 0 - - - 0x009D1F 02:BD0F: 02
	.byte $08					;- D 0 - - - 0x009D20 02:BD10: 08
	.byte $02					;- D 0 - - - 0x009D21 02:BD11: 02
	.byte $02					;- D 0 - - - 0x009D22 02:BD12: 02
	.byte $04					;- D 0 - - - 0x009D23 02:BD13: 04
	.byte $04					;- D 0 - - - 0x009D24 02:BD14: 04
	.byte $00					;- D 0 - - - 0x009D25 02:BD15: 00
	.byte $00					;- D 0 - - - 0x009D26 02:BD16: 00
	.byte $00					;- D 0 - - - 0x009D27 02:BD17: 00
	.byte $00					;- - - - - - 0x009D28 02:BD18: 00

HUDBlankTiles:
	.byte $7F					;- D 0 - - - 0x009D29 02:BD19: 7F
	.byte $FF					;- D 0 - - - 0x009D2A 02:BD1A: FF
	.byte $F0					;- - - - - - 0x009D2B 02:BD1B: F0
	.byte $70					;- - - - - - 0x009D2C 02:BD1C: 70
	.byte $B9					;- - - - - - 0x009D2D 02:BD1D: B9
	.byte $39					;- - - - - - 0x009D2E 02:BD1E: 39
	.byte $F3					;- - - - - - 0x009D2F 02:BD1F: F3
	.byte $73					;- - - - - - 0x009D30 02:BD20: 73
	.byte $FF					;- - - - - - 0x009D31 02:BD21: FF
	.byte $7F					;- - - - - - 0x009D32 02:BD22: 7F
	.byte $AF					;- - - - - - 0x009D33 02:BD23: AF
	.byte $2F					;- - - - - - 0x009D34 02:BD24: 2F
	.byte $FE					;- - - - - - 0x009D35 02:BD25: FE
	.byte $7E					;- - - - - - 0x009D36 02:BD26: 7E

DATA_04BD27:
	.byte $67					;- D 0 - - - 0x009D37 02:BD27: 67
	.byte $BD					;- D 0 - - - 0x009D38 02:BD28: BD
	.byte $74					;- D 0 - - - 0x009D39 02:BD29: 74
	.byte $BD					;- D 0 - - - 0x009D3A 02:BD2A: BD
	.byte $67					;- D 0 - - - 0x009D3B 02:BD2B: 67
	.byte $BD					;- D 0 - - - 0x009D3C 02:BD2C: BD
	.byte $74					;- D 0 - - - 0x009D3D 02:BD2D: 74
	.byte $BD					;- D 0 - - - 0x009D3E 02:BD2E: BD
	.byte $67					;- D 0 - - - 0x009D3F 02:BD2F: 67
	.byte $BD					;- D 0 - - - 0x009D40 02:BD30: BD
	.byte $74					;- D 0 - - - 0x009D41 02:BD31: 74
	.byte $BD					;- D 0 - - - 0x009D42 02:BD32: BD
	.byte $67					;- D 0 - - - 0x009D43 02:BD33: 67
	.byte $BD					;- D 0 - - - 0x009D44 02:BD34: BD
	.byte $74					;- D 0 - - - 0x009D45 02:BD35: 74
	.byte $BD					;- D 0 - - - 0x009D46 02:BD36: BD
	.byte $67					;- D 0 - - - 0x009D47 02:BD37: 67
	.byte $BD					;- D 0 - - - 0x009D48 02:BD38: BD
	.byte $74					;- D 0 - - - 0x009D49 02:BD39: 74
	.byte $BD					;- D 0 - - - 0x009D4A 02:BD3A: BD
	.byte $67					;- D 0 - - - 0x009D4B 02:BD3B: 67
	.byte $BD					;- D 0 - - - 0x009D4C 02:BD3C: BD
	.byte $74					;- D 0 - - - 0x009D4D 02:BD3D: 74
	.byte $BD					;- D 0 - - - 0x009D4E 02:BD3E: BD
	.byte $67					;- D 0 - - - 0x009D4F 02:BD3F: 67
	.byte $BD					;- D 0 - - - 0x009D50 02:BD40: BD
	.byte $74					;- D 0 - - - 0x009D51 02:BD41: 74
	.byte $BD					;- D 0 - - - 0x009D52 02:BD42: BD
	.byte $67					;- D 0 - - - 0x009D53 02:BD43: 67
	.byte $BD					;- D 0 - - - 0x009D54 02:BD44: BD
	.byte $74					;- D 0 - - - 0x009D55 02:BD45: 74
	.byte $BD					;- D 0 - - - 0x009D56 02:BD46: BD

DATA_04BD47:
	.byte $81					;- D 0 - - - 0x009D57 02:BD47: 81
	.byte $BD					;- D 0 - - - 0x009D58 02:BD48: BD
	.byte $8E					;- D 0 - - - 0x009D59 02:BD49: 8E
	.byte $BD					;- D 0 - - - 0x009D5A 02:BD4A: BD
	.byte $81					;- D 0 - - - 0x009D5B 02:BD4B: 81
	.byte $BD					;- D 0 - - - 0x009D5C 02:BD4C: BD
	.byte $8E					;- D 0 - - - 0x009D5D 02:BD4D: 8E
	.byte $BD					;- D 0 - - - 0x009D5E 02:BD4E: BD
	.byte $81					;- D 0 - - - 0x009D5F 02:BD4F: 81
	.byte $BD					;- D 0 - - - 0x009D60 02:BD50: BD
	.byte $8E					;- D 0 - - - 0x009D61 02:BD51: 8E
	.byte $BD					;- D 0 - - - 0x009D62 02:BD52: BD
	.byte $81					;- D 0 - - - 0x009D63 02:BD53: 81
	.byte $BD					;- D 0 - - - 0x009D64 02:BD54: BD
	.byte $8E					;- D 0 - - - 0x009D65 02:BD55: 8E
	.byte $BD					;- D 0 - - - 0x009D66 02:BD56: BD
	.byte $81					;- D 0 - - - 0x009D67 02:BD57: 81
	.byte $BD					;- D 0 - - - 0x009D68 02:BD58: BD
	.byte $8E					;- D 0 - - - 0x009D69 02:BD59: 8E
	.byte $BD					;- D 0 - - - 0x009D6A 02:BD5A: BD
	.byte $81					;- D 0 - - - 0x009D6B 02:BD5B: 81
	.byte $BD					;- D 0 - - - 0x009D6C 02:BD5C: BD
	.byte $8E					;- D 0 - - - 0x009D6D 02:BD5D: 8E
	.byte $BD					;- D 0 - - - 0x009D6E 02:BD5E: BD
	.byte $81					;- D 0 - - - 0x009D6F 02:BD5F: 81
	.byte $BD					;- D 0 - - - 0x009D70 02:BD60: BD
	.byte $8E					;- D 0 - - - 0x009D71 02:BD61: 8E
	.byte $BD					;- D 0 - - - 0x009D72 02:BD62: BD
	.byte $81					;- D 0 - - - 0x009D73 02:BD63: 81
	.byte $BD					;- D 0 - - - 0x009D74 02:BD64: BD
	.byte $8E					;- D 0 - - - 0x009D75 02:BD65: 8E
	.byte $BD					;- D 0 - - - 0x009D76 02:BD66: BD
	.byte $73					;- D 0 - - - 0x009D77 02:BD67: 73
	.byte $73					;- D 0 - - - 0x009D78 02:BD68: 73
	.byte $73					;- D 0 - - - 0x009D79 02:BD69: 73
	.byte $73					;- D 0 - - - 0x009D7A 02:BD6A: 73
	.byte $73					;- D 0 - - - 0x009D7B 02:BD6B: 73
	.byte $73					;- D 0 - - - 0x009D7C 02:BD6C: 73
	.byte $73					;- D 0 - - - 0x009D7D 02:BD6D: 73
	.byte $73					;- D 0 - - - 0x009D7E 02:BD6E: 73
	.byte $73					;- D 0 - - - 0x009D7F 02:BD6F: 73
	.byte $73					;- D 0 - - - 0x009D80 02:BD70: 73
	.byte $73					;- D 0 - - - 0x009D81 02:BD71: 73
	.byte $73					;- D 0 - - - 0x009D82 02:BD72: 73
	.byte $73					;- D 0 - - - 0x009D83 02:BD73: 73
	.byte $74					;- D 0 - - - 0x009D84 02:BD74: 74
	.byte $74					;- D 0 - - - 0x009D85 02:BD75: 74
	.byte $74					;- D 0 - - - 0x009D86 02:BD76: 74
	.byte $74					;- D 0 - - - 0x009D87 02:BD77: 74
	.byte $74					;- D 0 - - - 0x009D88 02:BD78: 74
	.byte $74					;- D 0 - - - 0x009D89 02:BD79: 74
	.byte $74					;- D 0 - - - 0x009D8A 02:BD7A: 74
	.byte $74					;- D 0 - - - 0x009D8B 02:BD7B: 74
	.byte $74					;- D 0 - - - 0x009D8C 02:BD7C: 74
	.byte $74					;- D 0 - - - 0x009D8D 02:BD7D: 74
	.byte $74					;- D 0 - - - 0x009D8E 02:BD7E: 74
	.byte $74					;- D 0 - - - 0x009D8F 02:BD7F: 74
	.byte $70					;- D 0 - - - 0x009D90 02:BD80: 70
	.byte $75					;- D 0 - - - 0x009D91 02:BD81: 75
	.byte $75					;- D 0 - - - 0x009D92 02:BD82: 75
	.byte $75					;- D 0 - - - 0x009D93 02:BD83: 75
	.byte $75					;- D 0 - - - 0x009D94 02:BD84: 75
	.byte $75					;- D 0 - - - 0x009D95 02:BD85: 75
	.byte $75					;- D 0 - - - 0x009D96 02:BD86: 75
	.byte $75					;- D 0 - - - 0x009D97 02:BD87: 75
	.byte $75					;- D 0 - - - 0x009D98 02:BD88: 75
	.byte $75					;- D 0 - - - 0x009D99 02:BD89: 75
	.byte $75					;- D 0 - - - 0x009D9A 02:BD8A: 75
	.byte $75					;- D 0 - - - 0x009D9B 02:BD8B: 75
	.byte $75					;- D 0 - - - 0x009D9C 02:BD8C: 75
	.byte $61					;- D 0 - - - 0x009D9D 02:BD8D: 61
	.byte $73					;- D 0 - - - 0x009D9E 02:BD8E: 73
	.byte $73					;- D 0 - - - 0x009D9F 02:BD8F: 73
	.byte $73					;- D 0 - - - 0x009DA0 02:BD90: 73
	.byte $73					;- D 0 - - - 0x009DA1 02:BD91: 73
	.byte $73					;- D 0 - - - 0x009DA2 02:BD92: 73
	.byte $73					;- D 0 - - - 0x009DA3 02:BD93: 73
	.byte $73					;- D 0 - - - 0x009DA4 02:BD94: 73
	.byte $73					;- D 0 - - - 0x009DA5 02:BD95: 73
	.byte $73					;- D 0 - - - 0x009DA6 02:BD96: 73
	.byte $73					;- D 0 - - - 0x009DA7 02:BD97: 73
	.byte $73					;- D 0 - - - 0x009DA8 02:BD98: 73
	.byte $73					;- D 0 - - - 0x009DA9 02:BD99: 73
	.byte $73					;- D 0 - - - 0x009DAA 02:BD9A: 73
	.byte $74					;- - - - - - 0x009DAB 02:BD9B: 74
	.byte $71					;- - - - - - 0x009DAC 02:BD9C: 71
	.byte $73					;- - - - - - 0x009DAD 02:BD9D: 73
	.byte $73					;- - - - - - 0x009DAE 02:BD9E: 73
	.byte $73					;- - - - - - 0x009DAF 02:BD9F: 73
	.byte $73					;- - - - - - 0x009DB0 02:BDA0: 73
	.byte $73					;- - - - - - 0x009DB1 02:BDA1: 73
	.byte $73					;- - - - - - 0x009DB2 02:BDA2: 73
	.byte $73					;- - - - - - 0x009DB3 02:BDA3: 73
	.byte $73					;- - - - - - 0x009DB4 02:BDA4: 73
	.byte $73					;- - - - - - 0x009DB5 02:BDA5: 73
	.byte $74					;- - - - - - 0x009DB6 02:BDA6: 74
	.byte $71					;- - - - - - 0x009DB7 02:BDA7: 71

DATA_04BDA8:
	;- D 0 - - - 0x009DB8 02:BDA8: C0
	.word $20C0
	.word $20E0
	.word $2100
	.word $2120
	.word $2140
	.word $2160
	.word $2180
	.word $21A0
	.word $21C0
	.word $21E0
	.word $2200
	.word $2220
	.word $2240
	.word $2260
	.word $2280
	.word $22A0
	.word $22C0
	.word $22E0
	.word $2300

BigRewardPalettes:
	;- - - - - - 0x009DDE 02:BDCE: E2
	;00: Amount of colors
	;01...: Colors
	.word DATA_04BDE2
	.word DATA_04BDE2
	.word DATA_04BDE7
	.word DATA_04BDEC
	.word DATA_04BDF1
	.word DATA_04BDF6
	.word DATA_04BDFF
	.word DATA_04BE08
	.word DATA_04BE11
	.word DATA_04BE1A

DATA_04BDE2:
	.byte $04					;- - - - - - 0x009DF2 02:BDE2: 04

	.byte $0F					;- - - - - - 0x009DF3 02:BDE3: 0F
	.byte $38					;- - - - - - 0x009DF4 02:BDE4: 38
	.byte $27					;- - - - - - 0x009DF5 02:BDE5: 27
	.byte $06					;- - - - - - 0x009DF6 02:BDE6: 06

DATA_04BDE7:
	.byte $04					;- D 0 - - - 0x009DF7 02:BDE7: 04

	.byte $0F					;- D 0 - - - 0x009DF8 02:BDE8: 0F
	.byte $30					;- D 0 - - - 0x009DF9 02:BDE9: 30
	.byte $14					;- D 0 - - - 0x009DFA 02:BDEA: 14
	.byte $04					;- D 0 - - - 0x009DFB 02:BDEB: 04

DATA_04BDEC:
	.byte $04					;- D 0 - - - 0x009DFC 02:BDEC: 04

	.byte $0F					;- D 0 - - - 0x009DFD 02:BDED: 0F
	.byte $30					;- D 0 - - - 0x009DFE 02:BDEE: 30
	.byte $38					;- D 0 - - - 0x009DFF 02:BDEF: 38
	.byte $28					;- D 0 - - - 0x009E00 02:BDF0: 28

DATA_04BDF1:
	.byte $04					;- - - - - - 0x009E01 02:BDF1: 04

	.byte $0F					;- - - - - - 0x009E02 02:BDF2: 0F
	.byte $12					;- - - - - - 0x009E03 02:BDF3: 12
	.byte $22					;- - - - - - 0x009E04 02:BDF4: 22
	.byte $32					;- - - - - - 0x009E05 02:BDF5: 32

DATA_04BDF6:
	.byte $08					;- D 0 - - - 0x009E06 02:BDF6: 08

	.byte $0F					;- D 0 - - - 0x009E07 02:BDF7: 0F
	.byte $38					;- D 0 - - - 0x009E08 02:BDF8: 38
	.byte $27					;- D 0 - - - 0x009E09 02:BDF9: 27
	.byte $06					;- D 0 - - - 0x009E0A 02:BDFA: 06
	.byte $0F					;- D 0 - - - 0x009E0B 02:BDFB: 0F
	.byte $12					;- D 0 - - - 0x009E0C 02:BDFC: 12
	.byte $30					;- D 0 - - - 0x009E0D 02:BDFD: 30
	.byte $31					;- D 0 - - - 0x009E0E 02:BDFE: 31

DATA_04BDFF:
	.byte $08					;- - - - - - 0x009E0F 02:BDFF: 08

	.byte $0F					;- - - - - - 0x009E10 02:BE00: 0F
	.byte $0F					;- - - - - - 0x009E11 02:BE01: 0F
	.byte $30					;- - - - - - 0x009E12 02:BE02: 30
	.byte $3B					;- - - - - - 0x009E13 02:BE03: 3B
	.byte $0F					;- - - - - - 0x009E14 02:BE04: 0F
	.byte $38					;- - - - - - 0x009E15 02:BE05: 38
	.byte $27					;- - - - - - 0x009E16 02:BE06: 27
	.byte $06					;- - - - - - 0x009E17 02:BE07: 06

DATA_04BE08:
	.byte $08					;- - - - - - 0x009E18 02:BE08: 08

	.byte $0F					;- - - - - - 0x009E19 02:BE09: 0F
	.byte $38					;- - - - - - 0x009E1A 02:BE0A: 38
	.byte $27					;- - - - - - 0x009E1B 02:BE0B: 27
	.byte $06					;- - - - - - 0x009E1C 02:BE0C: 06
	.byte $0F					;- - - - - - 0x009E1D 02:BE0D: 0F
	.byte $2A					;- - - - - - 0x009E1E 02:BE0E: 2A
	.byte $06					;- - - - - - 0x009E1F 02:BE0F: 06
	.byte $27					;- - - - - - 0x009E20 02:BE10: 27

DATA_04BE11:
	.byte $08					;- D 0 - - - 0x009E21 02:BE11: 08

	.byte $0F					;- D 0 - - - 0x009E22 02:BE12: 0F
	.byte $0F					;- D 0 - - - 0x009E23 02:BE13: 0F
	.byte $38					;- D 0 - - - 0x009E24 02:BE14: 38
	.byte $27					;- D 0 - - - 0x009E25 02:BE15: 27
	.byte $0F					;- D 0 - - - 0x009E26 02:BE16: 0F
	.byte $0F					;- D 0 - - - 0x009E27 02:BE17: 0F
	.byte $30					;- D 0 - - - 0x009E28 02:BE18: 30
	.byte $31					;- D 0 - - - 0x009E29 02:BE19: 31

DATA_04BE1A:
	.byte $04					;- - - - - - 0x009E2A 02:BE1A: 04

	.byte $0F					;- - - - - - 0x009E2B 02:BE1B: 0F
	.byte $0A					;- - - - - - 0x009E2C 02:BE1C: 0A
	.byte $2B					;- - - - - - 0x009E2D 02:BE1D: 2B
	.byte $1A					;- - - - - - 0x009E2E 02:BE1E: 1A

BigRewardAnim:
	.byte $00									;- - - - - - 0x009E2F 02:BE1F: 00
	.byte .LOBYTE(anBigCoin_ID)					;- - - - - - 0x009E30 02:BE20: 90
	.byte .LOBYTE(anBigBell_ID)					;- D 0 - - - 0x009E31 02:BE21: 91
	.byte .LOBYTE(anBigTriangle_ID)				;- D 0 - - - 0x009E32 02:BE22: 92
	.byte .LOBYTE(anBigDiamond_ID)				;- - - - - - 0x009E33 02:BE23: 93
	.byte .LOBYTE(anBigPudding_ID)				;- D 0 - - - 0x009E34 02:BE24: 94
	.byte .LOBYTE(anBigPineapple_ID)			;- - - - - - 0x009E35 02:BE25: 95
	.byte .LOBYTE(anBigHamburger_ID)			;- - - - - - 0x009E36 02:BE26: 96
	.byte .LOBYTE(anBigDessert_ID)					;- D 0 - - - 0x009E37 02:BE27: 97
	.byte .LOBYTE(anBigFieldPeas_ID)			;- - - - - - 0x009E38 02:BE28: 98
BigRewardAnimHI:
	.byte $00									;- - - - - - 0x009E39 02:BE29: 00
	.byte .HIBYTE(anBigCoin_ID)					;- - - - - - 0x009E3A 02:BE2A: 01
	.byte .HIBYTE(anBigBell_ID)					;- D 0 - - - 0x009E3B 02:BE2B: 01
	.byte .HIBYTE(anBigTriangle_ID)				;- D 0 - - - 0x009E3C 02:BE2C: 01
	.byte .HIBYTE(anBigDiamond_ID)				;- - - - - - 0x009E3D 02:BE2D: 01
	.byte .HIBYTE(anBigPudding_ID)				;- D 0 - - - 0x009E3E 02:BE2E: 01
	.byte .HIBYTE(anBigPineapple_ID)			;- - - - - - 0x009E3F 02:BE2F: 01
	.byte .HIBYTE(anBigHamburger_ID)			;- - - - - - 0x009E40 02:BE30: 01
	.byte .HIBYTE(anBigDessert_ID)					;- D 0 - - - 0x009E41 02:BE31: 01
	.byte .HIBYTE(anBigFieldPeas_ID)			;- - - - - - 0x009E42 02:BE32: 01

RoundItemSounds:
	.byte snSilence_ID			;- - - - - - 0x009E43 02:BE33: 00
	.byte snRoundItem_ID					;- D 0 - - - 0x009E44 02:BE34: 0A
	.byte snHolyCup_ID					;- D 0 - - - 0x009E45 02:BE35: 1A
	.byte snRoundSkip_ID					;- D 0 - - - 0x009E46 02:BE36: 0C
	.byte snRoundItem_ID					;- D 0 - - - 0x009E47 02:BE37: 0A
	.byte snRoundItem_ID					;- D 0 - - - 0x009E48 02:BE38: 0A
	.byte snRoundSkip_ID					;- - - - - - 0x009E49 02:BE39: 0C
	.byte snRoundItem_ID					;- D 0 - - - 0x009E4A 02:BE3A: 0A
	.byte snRoundItem_ID					;- D 0 - - - 0x009E4B 02:BE3B: 0A
	.byte snExtraLife_ID					;- - - - - - 0x009E4C 02:BE3C: 0B
	.byte snClock_ID					;- D 0 - - - 0x009E4D 02:BE3D: 2F
	.byte snRoundItem_ID					;- - - - - - 0x009E4E 02:BE3E: 0A
	.byte snRoundItem_ID					;- D 0 - - - 0x009E4F 02:BE3F: 0A
	.byte snRoundSkip_ID					;- D 0 - - - 0x009E50 02:BE40: 0C
	.byte snRoundItem_ID					;- - - - - - 0x009E51 02:BE41: 0A
	.byte snRoundItem_ID					;- - - - - - 0x009E52 02:BE42: 0A
	.byte snRoundItem_ID					;- - - - - - 0x009E53 02:BE43: 0A
	.byte snRoundItem_ID					;- - - - - - 0x009E54 02:BE44: 0A

DATA_04BE45:
	.byte $00					;- - - - - - 0x009E55 02:BE45: 00
	.byte $04					;- D 0 - - - 0x009E56 02:BE46: 04
	.byte $04					;- D 0 - - - 0x009E57 02:BE47: 04
	.byte $06					;- D 0 - - - 0x009E58 02:BE48: 06
	.byte $06					;- D 0 - - - 0x009E59 02:BE49: 06
	.byte $03					;- D 0 - - - 0x009E5A 02:BE4A: 03
	.byte $02					;- - - - - - 0x009E5B 02:BE4B: 02
	.byte $04					;- D 0 - - - 0x009E5C 02:BE4C: 04
	.byte $04					;- D 0 - - - 0x009E5D 02:BE4D: 04
	.byte $04					;- - - - - - 0x009E5E 02:BE4E: 04
	.byte $03					;- D 0 - - - 0x009E5F 02:BE4F: 03
	.byte $04					;- - - - - - 0x009E60 02:BE50: 04
	.byte $05					;- D 0 - - - 0x009E61 02:BE51: 05
	.byte $04					;- D 0 - - - 0x009E62 02:BE52: 04
	.byte $02					;- - - - - - 0x009E63 02:BE53: 02
	.byte $02					;- - - - - - 0x009E64 02:BE54: 02
	.byte $02					;- - - - - - 0x009E65 02:BE55: 02
	.byte $01					;- - - - - - 0x009E66 02:BE56: 01

DATA_04BE57:
	.byte $00					;- - - - - - 0x009E67 02:BE57: 00
	.byte $01					;- D 0 - - - 0x009E68 02:BE58: 01
	.byte $05					;- D 0 - - - 0x009E69 02:BE59: 05
	.byte $00					;- D 0 - - - 0x009E6A 02:BE5A: 00
	.byte $00					;- D 0 - - - 0x009E6B 02:BE5B: 00
	.byte $05					;- D 0 - - - 0x009E6C 02:BE5C: 05
	.byte $01					;- - - - - - 0x009E6D 02:BE5D: 01
	.byte $01					;- D 0 - - - 0x009E6E 02:BE5E: 01
	.byte $01					;- D 0 - - - 0x009E6F 02:BE5F: 01
	.byte $01					;- - - - - - 0x009E70 02:BE60: 01
	.byte $02					;- D 0 - - - 0x009E71 02:BE61: 02
	.byte $05					;- - - - - - 0x009E72 02:BE62: 05
	.byte $03					;- D 0 - - - 0x009E73 02:BE63: 03
	.byte $01					;- D 0 - - - 0x009E74 02:BE64: 01
	.byte $03					;- - - - - - 0x009E75 02:BE65: 03
	.byte $03					;- - - - - - 0x009E76 02:BE66: 03
	.byte $03					;- - - - - - 0x009E77 02:BE67: 03
	.byte $01					;- - - - - - 0x009E78 02:BE68: 01

DATA_04BE69:
	.byte $00					;- - - - - - 0x009E79 02:BE69: 00
	.byte $03					;- - - - - - 0x009E7A 02:BE6A: 03
	.byte $03					;- D 0 - - - 0x009E7B 02:BE6B: 03
	.byte $03					;- D 0 - - - 0x009E7C 02:BE6C: 03
	.byte $01					;- - - - - - 0x009E7D 02:BE6D: 01
	.byte $01					;- D 0 - - - 0x009E7E 02:BE6E: 01
	.byte $01					;- - - - - - 0x009E7F 02:BE6F: 01
	.byte $01					;- - - - - - 0x009E80 02:BE70: 01
	.byte $01					;- D 0 - - - 0x009E81 02:BE71: 01
	.byte $01					;- - - - - - 0x009E82 02:BE72: 01

DATA_04BE73:
	.byte $00					;- - - - - - 0x009E83 02:BE73: 00
	.byte $02					;- - - - - - 0x009E84 02:BE74: 02
	.byte $02					;- D 0 - - - 0x009E85 02:BE75: 02
	.byte $02					;- D 0 - - - 0x009E86 02:BE76: 02
	.byte $01					;- - - - - - 0x009E87 02:BE77: 01
	.byte $02					;- D 0 - - - 0x009E88 02:BE78: 02
	.byte $02					;- - - - - - 0x009E89 02:BE79: 02
	.byte $02					;- - - - - - 0x009E8A 02:BE7A: 02
	.byte $02					;- D 0 - - - 0x009E8B 02:BE7B: 02
	.byte $02					;- - - - - - 0x009E8C 02:BE7C: 02

RoundsItemX:
	;- - - - - - 0x009E8D 02:BE7D: 00
	.byte $00					;Round 00
	.byte $E1					;Round 01
	.byte $80					;Round 02
	.byte $80					;Round 03
	.byte $80					;Round 04
	.byte $80					;Round 05
	.byte $C4					;Round 06
	.byte $80					;Round 07
	.byte $D8					;Round 08
	.byte $80					;Round 09
	.byte $80					;Round 10
	.byte $80					;Round 11
	.byte $80					;Round 12
	.byte $A8					;Round 13
	.byte $80					;Round 14
	.byte $80					;Round 15
	.byte $80					;Round 16
	.byte $80					;Round 17
	.byte $80					;Round 18
	.byte $BC					;Round 19
	.byte $45					;Round 20
	.byte $80					;Round 21
	.byte $B4					;Round 22
	.byte $57					;Round 23
	.byte $80					;Round 24
	.byte $80					;Round 25
	.byte $80					;Round 26
	.byte $80					;Round 27
	.byte $80					;Round 28
	.byte $DD					;Round 29
	.byte $80					;Round 30
	.byte $2A					;Round 31
	.byte $80					;Round 32
	.byte $80					;Round 33
	.byte $80					;Round 34
	.byte $30					;Round 35
	.byte $60					;Round 36
	.byte $80					;Round 37
	.byte $80					;Round 38
	.byte $80					;Round 39
	.byte $40					;Round 40
	.byte $80					;Round 41
	.byte $80					;Round 42
	.byte $80					;Round 43
	.byte $80					;Round 44
	.byte $80					;Round 45
	.byte $AC					;Round 46
	.byte $33					;Round 47
	.byte $80					;Round 48
	.byte $80					;Round 49
	.byte $80					;Round 50
	.byte $80					;Round 51
	.byte $67					;Round 52
	.byte $80					;Round 53
	.byte $D8					;Round 54
	.byte $80					;Round 55
	.byte $52					;Round 56
	.byte $80					;Round 57
	.byte $4C					;Round 58
	.byte $16					;Round 59
	.byte $80					;Round 60
	.byte $64					;Round 61
	.byte $80					;Round 62
	.byte $E0					;Round 63
	.byte $D8					;Round 64
	.byte $80					;Round 65
	.byte $80					;Round 66
	.byte $80					;Round 67
	.byte $80					;Round 68
	.byte $80					;Round 69
	.byte $80					;Round 70
	.byte $80					;Round 71
	.byte $66					;Round 72
	.byte $80					;Round 73
	.byte $40					;Round 74
	.byte $40					;Round 75
	.byte $80					;Round 76
	.byte $80					;Round 77
	.byte $80					;Round 78
	.byte $80					;Round 79
	.byte $45					;Round 80

RoundsItemY:
	;- - - - - - 0x009EDE 02:BECE: 00
	.byte $00					;Round 00
	.byte $5C					;Round 01
	.byte $87					;Round 02
	.byte $84					;Round 03
	.byte $B0					;Round 04
	.byte $D4					;Round 05
	.byte $9C					;Round 06
	.byte $3C					;Round 07
	.byte $42					;Round 08
	.byte $54					;Round 09
	.byte $80					;Round 10
	.byte $4D					;Round 11
	.byte $94					;Round 12
	.byte $34					;Round 13
	.byte $D4					;Round 14
	.byte $64					;Round 15
	.byte $C4					;Round 16
	.byte $D1					;Round 17
	.byte $D4					;Round 18
	.byte $3D					;Round 19
	.byte $A0					;Round 20
	.byte $34					;Round 21
	.byte $60					;Round 22
	.byte $5C					;Round 23
	.byte $AF					;Round 24
	.byte $80					;Round 25
	.byte $A4					;Round 26
	.byte $80					;Round 27
	.byte $A4					;Round 28
	.byte $D4					;Round 29
	.byte $80					;Round 30
	.byte $65					;Round 31
	.byte $36					;Round 32
	.byte $7D					;Round 33
	.byte $54					;Round 34
	.byte $40					;Round 35
	.byte $96					;Round 36
	.byte $38					;Round 37
	.byte $29					;Round 38
	.byte $66					;Round 39
	.byte $C8					;Round 40
	.byte $80					;Round 41
	.byte $4C					;Round 42
	.byte $80					;Round 43
	.byte $8B					;Round 44
	.byte $9F					;Round 45
	.byte $34					;Round 46
	.byte $95					;Round 47
	.byte $80					;Round 48
	.byte $80					;Round 49
	.byte $80					;Round 50
	.byte $A8					;Round 51
	.byte $4C					;Round 52
	.byte $38					;Round 53
	.byte $D4					;Round 54
	.byte $60					;Round 55
	.byte $94					;Round 56
	.byte $80					;Round 57
	.byte $34					;Round 58
	.byte $3C					;Round 59
	.byte $C8					;Round 60
	.byte $A0					;Round 61
	.byte $34					;Round 62
	.byte $A0					;Round 63
	.byte $66					;Round 64
	.byte $40					;Round 65
	.byte $80					;Round 66
	.byte $64					;Round 67
	.byte $44					;Round 68
	.byte $70					;Round 69
	.byte $C8					;Round 70
	.byte $A5					;Round 71
	.byte $AC					;Round 72
	.byte $6E					;Round 73
	.byte $3C					;Round 74
	.byte $44					;Round 75
	.byte $3D					;Round 76
	.byte $9A					;Round 77
	.byte $40					;Round 78
	.byte $80					;Round 79
	.byte $C8					;Round 80

BonusRewardsX:
	.byte $30					;- D 0 - - - 0x009F2F 02:BF1F: 30
	.byte $60					;- D 0 - - - 0x009F30 02:BF20: 60
	.byte $80					;- D 0 - - - 0x009F31 02:BF21: 80
	.byte $A0					;- D 0 - - - 0x009F32 02:BF22: A0
	.byte $D0					;- D 0 - - - 0x009F33 02:BF23: D0

DATA_04BF24:
	.byte $0F					;- D 0 - - - 0x009F34 02:BF24: 0F
	.byte $38					;- D 0 - - - 0x009F35 02:BF25: 38
	.byte $28					;- D 0 - - - 0x009F36 02:BF26: 28
	.byte $18					;- D 0 - - - 0x009F37 02:BF27: 18
	.byte $0F					;- D 0 - - - 0x009F38 02:BF28: 0F
	.byte $38					;- D 0 - - - 0x009F39 02:BF29: 38
	.byte $28					;- D 0 - - - 0x009F3A 02:BF2A: 28
	.byte $18					;- D 0 - - - 0x009F3B 02:BF2B: 18
	.byte $0F					;- D 0 - - - 0x009F3C 02:BF2C: 0F
	.byte $38					;- D 0 - - - 0x009F3D 02:BF2D: 38
	.byte $28					;- D 0 - - - 0x009F3E 02:BF2E: 28
	.byte $18					;- D 0 - - - 0x009F3F 02:BF2F: 18
	.byte $0F					;- D 0 - - - 0x009F40 02:BF30: 0F
	.byte $38					;- D 0 - - - 0x009F41 02:BF31: 38
	.byte $28					;- D 0 - - - 0x009F42 02:BF32: 28
	.byte $18					;- D 0 - - - 0x009F43 02:BF33: 18

DATA_04BF34:
	.byte $0F					;- - - - - - 0x009F44 02:BF34: 0F
	.byte $38					;- - - - - - 0x009F45 02:BF35: 38
	.byte $28					;- - - - - - 0x009F46 02:BF36: 28
	.byte $18					;- - - - - - 0x009F47 02:BF37: 18
	.byte $0F					;- - - - - - 0x009F48 02:BF38: 0F
	.byte $38					;- - - - - - 0x009F49 02:BF39: 38
	.byte $28					;- - - - - - 0x009F4A 02:BF3A: 28
	.byte $18					;- - - - - - 0x009F4B 02:BF3B: 18
	.byte $0F					;- - - - - - 0x009F4C 02:BF3C: 0F
	.byte $38					;- - - - - - 0x009F4D 02:BF3D: 38
	.byte $28					;- - - - - - 0x009F4E 02:BF3E: 28
	.byte $18					;- - - - - - 0x009F4F 02:BF3F: 18
	.byte $0F					;- - - - - - 0x009F50 02:BF40: 0F
	.byte $38					;- - - - - - 0x009F51 02:BF41: 38
	.byte $28					;- - - - - - 0x009F52 02:BF42: 28
	.byte $18					;- - - - - - 0x009F53 02:BF43: 18

DATA_04BF44:
	.byte $0F					;- D 0 - - - 0x009F54 02:BF44: 0F
	.byte $38					;- D 0 - - - 0x009F55 02:BF45: 38
	.byte $28					;- D 0 - - - 0x009F56 02:BF46: 28
	.byte $18					;- D 0 - - - 0x009F57 02:BF47: 18
	.byte $0F					;- D 0 - - - 0x009F58 02:BF48: 0F
	.byte $38					;- D 0 - - - 0x009F59 02:BF49: 38
	.byte $28					;- D 0 - - - 0x009F5A 02:BF4A: 28
	.byte $18					;- D 0 - - - 0x009F5B 02:BF4B: 18
	.byte $0F					;- D 0 - - - 0x009F5C 02:BF4C: 0F
	.byte $38					;- D 0 - - - 0x009F5D 02:BF4D: 38
	.byte $28					;- D 0 - - - 0x009F5E 02:BF4E: 28
	.byte $18					;- D 0 - - - 0x009F5F 02:BF4F: 18
	.byte $0F					;- D 0 - - - 0x009F60 02:BF50: 0F
	.byte $38					;- D 0 - - - 0x009F61 02:BF51: 38
	.byte $28					;- D 0 - - - 0x009F62 02:BF52: 28
	.byte $18					;- D 0 - - - 0x009F63 02:BF53: 18

DATA_04BF54:
	.byte $0F					;- - - - - - 0x009F64 02:BF54: 0F
	.byte $18					;- - - - - - 0x009F65 02:BF55: 18
	.byte $08					;- - - - - - 0x009F66 02:BF56: 08
	.byte $28					;- - - - - - 0x009F67 02:BF57: 28
	.byte $0F					;- - - - - - 0x009F68 02:BF58: 0F
	.byte $28					;- - - - - - 0x009F69 02:BF59: 28
	.byte $08					;- - - - - - 0x009F6A 02:BF5A: 08
	.byte $18					;- - - - - - 0x009F6B 02:BF5B: 18
	.byte $0F					;- - - - - - 0x009F6C 02:BF5C: 0F
	.byte $0F					;- - - - - - 0x009F6D 02:BF5D: 0F
	.byte $0F					;- - - - - - 0x009F6E 02:BF5E: 0F
	.byte $0F					;- - - - - - 0x009F6F 02:BF5F: 0F
	.byte $0F					;- - - - - - 0x009F70 02:BF60: 0F
	.byte $38					;- - - - - - 0x009F71 02:BF61: 38
	.byte $28					;- - - - - - 0x009F72 02:BF62: 28
	.byte $18					;- - - - - - 0x009F73 02:BF63: 18

DATA_04BF64:
	.byte $00					;- - - - - - 0x009F74 02:BF64: 00
	.byte $01					;- D 0 - - - 0x009F75 02:BF65: 01
	.byte $02					;- D 0 - - - 0x009F76 02:BF66: 02
	.byte $04					;- D 0 - - - 0x009F77 02:BF67: 04
	.byte $08					;- - - - - - 0x009F78 02:BF68: 08
	.byte $01					;- D 0 - - - 0x009F79 02:BF69: 01
	.byte $03					;- - - - - - 0x009F7A 02:BF6A: 03
	.byte $06					;- D 0 - - - 0x009F7B 02:BF6B: 06
	.byte $01					;- - - - - - 0x009F7C 02:BF6C: 01

DATA_04BF6D:
	.byte $00					;- - - - - - 0x009F7D 02:BF6D: 00
	.byte $03					;- D 0 - - - 0x009F7E 02:BF6E: 03
	.byte $03					;- D 0 - - - 0x009F7F 02:BF6F: 03
	.byte $03					;- D 0 - - - 0x009F80 02:BF70: 03
	.byte $03					;- - - - - - 0x009F81 02:BF71: 03
	.byte $02					;- D 0 - - - 0x009F82 02:BF72: 02
	.byte $02					;- - - - - - 0x009F83 02:BF73: 02
	.byte $02					;- D 0 - - - 0x009F84 02:BF74: 02
	.byte $01					;- - - - - - 0x009F85 02:BF75: 01

DATA_04BF76:
	.byte $00					;- - - - - - 0x009F86 02:BF76: 00
	.byte $00					;- D 0 - - - 0x009F87 02:BF77: 00
	.byte $00					;- D 0 - - - 0x009F88 02:BF78: 00
	.byte $00					;- D 0 - - - 0x009F89 02:BF79: 00
	.byte $00					;- - - - - - 0x009F8A 02:BF7A: 00
	.byte $06					;- D 0 - - - 0x009F8B 02:BF7B: 06
	.byte $02					;- - - - - - 0x009F8C 02:BF7C: 02
	.byte $04					;- D 0 - - - 0x009F8D 02:BF7D: 04
	.byte $02					;- - - - - - 0x009F8E 02:BF7E: 02

DATA_04BF7F:
	.byte $00					;- - - - - - 0x009F8F 02:BF7F: 00
	.byte $00					;- D 0 - - - 0x009F90 02:BF80: 00
	.byte $00					;- D 0 - - - 0x009F91 02:BF81: 00
	.byte $00					;- D 0 - - - 0x009F92 02:BF82: 00
	.byte $00					;- - - - - - 0x009F93 02:BF83: 00
	.byte $03					;- D 0 - - - 0x009F94 02:BF84: 03
	.byte $03					;- - - - - - 0x009F95 02:BF85: 03
	.byte $03					;- D 0 - - - 0x009F96 02:BF86: 03
	.byte $02					;- - - - - - 0x009F97 02:BF87: 02

DATA_04BF88:
	.byte $00					;- D 0 - - - 0x009F98 02:BF88: 00
	.byte $FC					;- D 0 - - - 0x009F99 02:BF89: FC
	.byte $18					;- D 0 - - - 0x009F9A 02:BF8A: 18
	.byte $F0					;- D 0 - - - 0x009F9B 02:BF8B: F0
	.byte $FE					;- D 0 - - - 0x009F9C 02:BF8C: FE
	.byte $20					;- D 0 - - - 0x009F9D 02:BF8D: 20
	.byte $E0					;- D 0 - - - 0x009F9E 02:BF8E: E0
	.byte $00					;- D 0 - - - 0x009F9F 02:BF8F: 00
	.byte $28					;- D 0 - - - 0x009FA0 02:BF90: 28
	.byte $D0					;- D 0 - - - 0x009FA1 02:BF91: D0
	.byte $08					;- D 0 - - - 0x009FA2 02:BF92: 08
	.byte $2C					;- D 0 - - - 0x009FA3 02:BF93: 2C
	.byte $CC					;- D 0 - - - 0x009FA4 02:BF94: CC
	.byte $10					;- D 0 - - - 0x009FA5 02:BF95: 10
	.byte $30					;- D 0 - - - 0x009FA6 02:BF96: 30
	.byte $C8					;- D 0 - - - 0x009FA7 02:BF97: C8
	.byte $28					;- D 0 - - - 0x009FA8 02:BF98: 28
	.byte $2C					;- D 0 - - - 0x009FA9 02:BF99: 2C
	.byte $BC					;- D 0 - - - 0x009FAA 02:BF9A: BC
	.byte $40					;- D 0 - - - 0x009FAB 02:BF9B: 40
	.byte $28					;- D 0 - - - 0x009FAC 02:BF9C: 28
	.byte $B0					;- D 0 - - - 0x009FAD 02:BF9D: B0
	.byte $4C					;- D 0 - - - 0x009FAE 02:BF9E: 4C
	.byte $08					;- D 0 - - - 0x009FAF 02:BF9F: 08
	.byte $AC					;- D 0 - - - 0x009FB0 02:BFA0: AC
	.byte $58					;- D 0 - - - 0x009FB1 02:BFA1: 58
	.byte $E8					;- D 0 - - - 0x009FB2 02:BFA2: E8
	.byte $A8					;- D 0 - - - 0x009FB3 02:BFA3: A8
	.byte $5C					;- D 0 - - - 0x009FB4 02:BFA4: 5C
	.byte $D4					;- D 0 - - - 0x009FB5 02:BFA5: D4
	.byte $B4					;- D 0 - - - 0x009FB6 02:BFA6: B4
	.byte $60					;- D 0 - - - 0x009FB7 02:BFA7: 60
	.byte $C0					;- D 0 - - - 0x009FB8 02:BFA8: C0
	.byte $C0					;- D 0 - - - 0x009FB9 02:BFA9: C0
	.byte $54					;- D 0 - - - 0x009FBA 02:BFAA: 54
	.byte $B4					;- D 0 - - - 0x009FBB 02:BFAB: B4
	.byte $E8					;- D 0 - - - 0x009FBC 02:BFAC: E8
	.byte $48					;- D 0 - - - 0x009FBD 02:BFAD: 48
	.byte $A8					;- D 0 - - - 0x009FBE 02:BFAE: A8
	.byte $10					;- D 0 - - - 0x009FBF 02:BFAF: 10
	.byte $3C					;- D 0 - - - 0x009FC0 02:BFB0: 3C
	.byte $A4					;- D 0 - - - 0x009FC1 02:BFB1: A4
	.byte $28					;- D 0 - - - 0x009FC2 02:BFB2: 28
	.byte $30					;- D 0 - - - 0x009FC3 02:BFB3: 30
	.byte $A0					;- D 0 - - - 0x009FC4 02:BFB4: A0
	.byte $40					;- D 0 - - - 0x009FC5 02:BFB5: 40
	.byte $18					;- D 0 - - - 0x009FC6 02:BFB6: 18
	.byte $A4					;- D 0 - - - 0x009FC7 02:BFB7: A4
	.byte $4C					;- D 0 - - - 0x009FC8 02:BFB8: 4C
	.byte $00					;- D 0 - - - 0x009FC9 02:BFB9: 00
	.byte $A8					;- D 0 - - - 0x009FCA 02:BFBA: A8
	.byte $58					;- - - - - - 0x009FCB 02:BFBB: 58

DATA_04BFBC:
	.byte $00					;- D 0 - - - 0x009FCC 02:BFBC: 00
	.byte $E8					;- D 0 - - - 0x009FCD 02:BFBD: E8
	.byte $08					;- D 0 - - - 0x009FCE 02:BFBE: 08
	.byte $10					;- D 0 - - - 0x009FCF 02:BFBF: 10
	.byte $E0					;- D 0 - - - 0x009FD0 02:BFC0: E0
	.byte $0C					;- D 0 - - - 0x009FD1 02:BFC1: 0C
	.byte $1C					;- D 0 - - - 0x009FD2 02:BFC2: 1C
	.byte $D8					;- D 0 - - - 0x009FD3 02:BFC3: D8
	.byte $10					;- D 0 - - - 0x009FD4 02:BFC4: 10
	.byte $18					;- D 0 - - - 0x009FD5 02:BFC5: 18
	.byte $CC					;- D 0 - - - 0x009FD6 02:BFC6: CC
	.byte $28					;- D 0 - - - 0x009FD7 02:BFC7: 28
	.byte $10					;- D 0 - - - 0x009FD8 02:BFC8: 10
	.byte $C0					;- D 0 - - - 0x009FD9 02:BFC9: C0
	.byte $40					;- D 0 - - - 0x009FDA 02:BFCA: 40
	.byte $08					;- D 0 - - - 0x009FDB 02:BFCB: 08
	.byte $BE					;- D 0 - - - 0x009FDC 02:BFCC: BE
	.byte $50					;- D 0 - - - 0x009FDD 02:BFCD: 50
	.byte $F8					;- D 0 - - - 0x009FDE 02:BFCE: F8
	.byte $C0					;- D 0 - - - 0x009FDF 02:BFCF: C0
	.byte $60					;- D 0 - - - 0x009FE0 02:BFD0: 60
	.byte $E8					;- D 0 - - - 0x009FE1 02:BFD1: E8
	.byte $D8					;- D 0 - - - 0x009FE2 02:BFD2: D8
	.byte $64					;- D 0 - - - 0x009FE3 02:BFD3: 64
	.byte $D4					;- D 0 - - - 0x009FE4 02:BFD4: D4
	.byte $F0					;- D 0 - - - 0x009FE5 02:BFD5: F0
	.byte $68					;- D 0 - - - 0x009FE6 02:BFD6: 68
	.byte $C0					;- D 0 - - - 0x009FE7 02:BFD7: C0
	.byte $08					;- D 0 - - - 0x009FE8 02:BFD8: 08
	.byte $58					;- D 0 - - - 0x009FE9 02:BFD9: 58
	.byte $B4					;- D 0 - - - 0x009FEA 02:BFDA: B4
	.byte $20					;- D 0 - - - 0x009FEB 02:BFDB: 20
	.byte $48					;- D 0 - - - 0x009FEC 02:BFDC: 48
	.byte $A8					;- D 0 - - - 0x009FED 02:BFDD: A8
	.byte $30					;- D 0 - - - 0x009FEE 02:BFDE: 30
	.byte $38					;- D 0 - - - 0x009FEF 02:BFDF: 38
	.byte $A6					;- D 0 - - - 0x009FF0 02:BFE0: A6
	.byte $40					;- D 0 - - - 0x009FF1 02:BFE1: 40
	.byte $28					;- D 0 - - - 0x009FF2 02:BFE2: 28
	.byte $A8					;- D 0 - - - 0x009FF3 02:BFE3: A8
	.byte $46					;- D 0 - - - 0x009FF4 02:BFE4: 46
	.byte $14					;- D 0 - - - 0x009FF5 02:BFE5: 14
	.byte $B0					;- D 0 - - - 0x009FF6 02:BFE6: B0
	.byte $58					;- D 0 - - - 0x009FF7 02:BFE7: 58
	.byte $00					;- D 0 - - - 0x009FF8 02:BFE8: 00
	.byte $B8					;- D 0 - - - 0x009FF9 02:BFE9: B8
	.byte $5C					;- D 0 - - - 0x009FFA 02:BFEA: 5C
	.byte $EC					;- D 0 - - - 0x009FFB 02:BFEB: EC
	.byte $C4					;- D 0 - - - 0x009FFC 02:BFEC: C4
	.byte $60					;- D 0 - - - 0x009FFD 02:BFED: 60
	.byte $D8					;- D 0 - - - 0x009FFE 02:BFEE: D8
	.byte $D0					;- - - - - - 0x009FFF 02:BFEF: D0

DrinkAnim:
	;- - - - - - 0x00A000 02:BFF0: 00
	.byte $00								;Regular
	.byte .LOBYTE(anDrinkThunder_ID)		;Thunder
	.byte $01								;Fire
	.byte $01								;Water
	.byte .LOBYTE(anDrinkSnow_ID)			;Snow
	.byte .LOBYTE(anDrinkWind_ID)			;Wind
	.byte .LOBYTE(anDrinkStar_ID)			;Star
DrinkAnimHI:
	;- - - - - - 0x00A007 02:BFF7: 00
	.byte $00								;Regular
	.byte .HIBYTE(anDrinkThunder_ID)		;Thunder
	.byte $00								;Fire
	.byte $00								;Water
	.byte .HIBYTE(anDrinkSnow_ID)			;Snow
	.byte .HIBYTE(anDrinkWind_ID)			;Wind
	.byte .HIBYTE(anDrinkStar_ID)			;Star

;Filler data
.ifdef REGION_JP
	.incbin "filler/fill04_JP.bin"
.else
	;- - - - - - 0x00A00E 02:BFFE: 00
	.incbin "filler/fill04.bin"
.endif



