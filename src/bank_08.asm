.segment "PRG_BANK_8"
; 0x010010-0x01200F

;Contents: Round setup

CODE_088000:
	LDA #$00					;C - - - - - 0x010010 04:8000: A9 00
.ifndef REGION_JP
	STA a:jingleTrigger				;C - - - - - 0x010012 04:8002: 8D E2 00
	STA roundPaused				;C - - - - - 0x010015 04:8005: 8D 74 04
.endif
	STA ram_0475				;C - - - - - 0x010018 04:8008: 8D 75 04
	STA ram_0472				;C - - - - - 0x01001B 04:800B: 8D 72 04
	STA bigRewardCategory				;C - - - - - 0x01001E 04:800E: 8D 4F 05
	LDA playerHearts				;C - - - - - 0x010021 04:8011: AD 78 04
	BNE CODE_08801E				;C - - - - - 0x010024 04:8014: D0 08
		;Unreached
		LDA #$01					;- - - - - - 0x010026 04:8016: A9
		STA playerHearts				;- - - - - - 0x010028 04:8018: 8D
		DEC playerLives				;- - - - - - 0x01002B 04:801B: CE
CODE_08801E:
	LDA objState+OSLOT_ENEMY+9				;C - - - - - 0x01002E 04:801E: AD 75 05
	CMP #$05					;C - - - - - 0x010031 04:8021: C9 05
	BNE CODE_088028				;C - - - - - 0x010033 04:8023: D0 03
		INC ram_0544				;C - - - - - 0x010035 04:8025: EE 44 05
CODE_088028:
	LDY objState+OSLOT_ENEMY+9				;C - - - - - 0x010038 04:8028: AC 75 05
	BEQ CODE_088033				;C - - - - - 0x01003B 04:802B: F0 06
		DEY							;C - - - - - 0x01003D 04:802D: 88
		LDA #$00					;C - - - - - 0x01003E 04:802E: A9 00
		STA rewardsEaten,Y				;C - - - - - 0x010040 04:8030: 99 3F 05
CODE_088033:
	LDA #$00					;C - - - - - 0x010043 04:8033: A9 00
	STA objState+OSLOT_ENEMY+9				;C - - - - - 0x010045 04:8035: 8D 75 05
	STA ram_054C				;C - - - - - 0x010048 04:8038: 8D 4C 05
	STA ram_054D				;C - - - - - 0x01004B 04:803B: 8D 4D 05
	STA bonusRewardEarned				;C - - - - - 0x01004E 04:803E: 8D 51 05
	JSR CODE_0FE36B				;C - - - - - 0x010051 04:8041: 20 6B E3

	LDA currentRound				;C - - - - - 0x010054 04:8044: A5 D8
	CMP #20					;C - - - - - 0x010056 04:8046: C9 14
	BEQ CODE_088052				;C - - - - - 0x010058 04:8048: F0 08
		LDA #.BANK(DATA_04A000)					;C - - - - - 0x01005A 04:804A: A9 04
		STA sprPrgBank				;C - - - - - 0x01005C 04:804C: 8D 61 05
		JMP CODE_08805D				;C - - - - - 0x01005F 04:804F: 4C 5D 80
CODE_088052:
	LDA #$00					;C - - - - - 0x010062 04:8052: A9 00
	STA vNametable				;C - - - - - 0x010064 04:8054: 85 2D
	STA hNametable				;C - - - - - 0x010066 04:8056: 85 2F
	LDA #.BANK(DATA_0AA000)					;C - - - - - 0x010068 04:8058: A9 0A
	STA sprPrgBank				;C - - - - - 0x01006A 04:805A: 8D 61 05
CODE_08805D:
	LDA powerUps				;C - - - - - 0x01006D 04:805D: A5 DE
	AND #~POWERUP_BIG_COIN					;C - - - - - 0x01006F 04:805F: 29 EF
	STA powerUps				;C - - - - - 0x010071 04:8061: 85 DE

	LDA #chrThunder_ID					;C - - - - - 0x010073 04:8063: A9 50
	STA objChrBank+OSLOT_ENEMY+9				;C - - - - - 0x010075 04:8065: 8D 65 06
	JSR CODE_0880C8				;C - - - - - 0x010078 04:8068: 20 C8 80

	LDA #$01					;C - - - - - 0x01007B 04:806B: A9 01
	STA enteringRound				;C - - - - - 0x01007D 04:806D: 85 37
	JSR CODE_08812A				;C - - - - - 0x01007F 04:806F: 20 2A 81
	LDA #$FF					;C - - - - - 0x010082 04:8072: A9 FF
	LDX #$00					;C - - - - - 0x010084 04:8074: A2 00
CODE_088076:
	STA projParent,X				;C - - - - - 0x010086 04:8076: 9D 25 05
	INX							;C - - - - - 0x010089 04:8079: E8
	CPX #$08					;C - - - - - 0x01008A 04:807A: E0 08
	BNE CODE_088076				;C - - - - - 0x01008C 04:807C: D0 F8

	JSR RoundBGSetup				;C - - - - - 0x01008E 04:807E: 20 90 82
	JSR CODE_088105				;C - - - - - 0x010091 04:8081: 20 05 81
	JSR CODE_088508				;C - - - - - 0x010094 04:8084: 20 08 85
	LDA #$00					;C - - - - - 0x010097 04:8087: A9 00
	STA enemyFrozenCycles				;C - - - - - 0x010099 04:8089: 8D D4 04
	LDA #.LOBYTE(PickRoundAnimSub)					;C - - - - - 0x01009C 04:808C: A9 9E
	STA bankedSub				;C - - - - - 0x01009E 04:808E: 85 55
	LDA #.HIBYTE(PickRoundAnimSub)					;C - - - - - 0x0100A0 04:8090: A9 98
	STA bankedSub+1				;C - - - - - 0x0100A2 04:8092: 85 56
	LDA #.BANK(PickRoundAnimSub)					;C - - - - - 0x0100A4 04:8094: A9 09
	STA bankedSubBank				;C - - - - - 0x0100A6 04:8096: 85 57
	LDA #.BANK(*)					;C - - - - - 0x0100A8 04:8098: A9 08
	STA bankedSubRetBank				;C - - - - - 0x0100AA 04:809A: 85 58
	JSR RunBankedSub				;C - - - - - 0x0100AC 04:809C: 20 72 E7
	JSR SetRoundMusic				;C - - - - - 0x0100AF 04:809F: 20 8D 84
	LDA currentRound				;C - - - - - 0x0100B2 04:80A2: A5 D8
	CMP #20					;C - - - - - 0x0100B4 04:80A4: C9 14
	BEQ CODE_0880BB				;C - - - - - 0x0100B6 04:80A6: F0 13
	CMP #40					;C - - - - - 0x0100B8 04:80A8: C9 28
	BEQ CODE_0880BB				;C - - - - - 0x0100BA 04:80AA: F0 0F
	LDA #.BANK(CODE_088311)					;C - - - - - 0x0100BC 04:80AC: A9 08
	STA nmiPrgBankA				;C - - - - - 0x0100BE 04:80AE: 85 51
	LDA #.LOBYTE(CODE_088311)	;C - - - - - 0x0100C0 04:80B0: A9 11
	STA updateSub				;C - - - - - 0x0100C2 04:80B2: 85 19
	LDA #.HIBYTE(CODE_088311)	;C - - - - - 0x0100C4 04:80B4: A9 83
	STA updateSub+1				;C - - - - - 0x0100C6 04:80B6: 85 1A
	JMP CODE_0880C7				;C - - - - - 0x0100C8 04:80B8: 4C C7 80
CODE_0880BB:
	LDA #.BANK(CODE_059CD8)					;C - - - - - 0x0100CB 04:80BB: A9 05
	STA nmiPrgBankA				;C - - - - - 0x0100CD 04:80BD: 85 51
	LDA #.LOBYTE(CODE_059CD8)	;C - - - - - 0x0100CF 04:80BF: A9 D8
	STA updateSub				;C - - - - - 0x0100D1 04:80C1: 85 19
	LDA #.HIBYTE(CODE_059CD8)	;C - - - - - 0x0100D3 04:80C3: A9 9C
	STA updateSub+1				;C - - - - - 0x0100D5 04:80C5: 85 1A
CODE_0880C7:
	RTS							;C - - - - - 0x0100D7 04:80C7: 60

CODE_0880C8:
	LDA #$0F					;C - - - - - 0x0100D8 04:80C8: A9 0F
	STA colorBuffer+COL_SPR+1				;C - - - - - 0x0100DA 04:80CA: 8D 11 03

	LDA #$30					;C - - - - - 0x0100DD 04:80CD: A9 30
	STA colorBuffer+COL_SPR+2				;C - - - - - 0x0100DF 04:80CF: 8D 12 03

	LDX currentPlayer				;C - - - - - 0x0100E2 04:80D2: AE 99 04
	LDA PlayerSpecificColor,X			;C - - - - - 0x0100E5 04:80D5: BD F7 80
	STA colorBuffer+COL_SPR+3				;C - - - - - 0x0100E8 04:80D8: 8D 13 03

	LDA #$01					;C - - - - - 0x0100EB 04:80DB: A9 01
	STA objState				;C - - - - - 0x0100ED 04:80DD: 8D 63 05
	LDA #.LOBYTE(anPlayerRoundStart_ID)					;C - - - - - 0x0100F0 04:80E0: A9 25
	STA objAnim				;C - - - - - 0x0100F2 04:80E2: 8D 7B 06
	LDA #.HIBYTE(anPlayerRoundStart_ID)					;C - - - - - 0x0100F5 04:80E5: A9 00
	STA objAnimHI				;C - - - - - 0x0100F7 04:80E7: 8D 1B 07

	STA objChrSlot				;C - - - - - 0x0100FA 04:80EA: 8D 2B 06
	STA objAttr				;C - - - - - 0x0100FD 04:80ED: 8D F3 06
	STA objAnimProgress				;C - - - - - 0x010100 04:80F0: 8D CB 06
	STA objAnimTimer				;C - - - - - 0x010103 04:80F3: 8D A3 06
	RTS							;C - - - - - 0x010106 04:80F6: 60

PlayerSpecificColor:
	.byte $2A					;- D 0 - - - 0x010107 04:80F7: 2A
	.byte $21					;- D 0 - - - 0x010108 04:80F8: 21

CODE_0880F9:
	LDA mapID				;C - - - - - 0x010109 04:80F9: AD 60 03
	STA scratch0				;C - - - - - 0x01010C 04:80FC: 85 00
	JSR GetMapParams				;C - - - - - 0x01010E 04:80FE: 20 C9 E4
	JSR CODE_088105				;C - - - - - 0x010111 04:8101: 20 05 81
	RTS							;C - - - - - 0x010114 04:8104: 60

CODE_088105:
	LDA nmiPrgBankB				;C - - - - - 0x010115 04:8105: A5 52
	STA terrainBank				;C - - - - - 0x010117 04:8107: 8D 5B 07
	LDA mapMacroDefs				;C - - - - - 0x01011A 04:810A: A5 3E
	STA terrainTypeDefs				;C - - - - - 0x01011C 04:810C: 85 40
	LDA mapMacroDefs+1				;C - - - - - 0x01011E 04:810E: A5 3F
	STA terrainTypeDefs+1				;C - - - - - 0x010120 04:8110: 85 41

	LDA mapMacroList				;C - - - - - 0x010122 04:8112: A5 3C
	STA terrainAdr				;C - - - - - 0x010124 04:8114: 85 42
	STA originalTerrainAdr				;C - - - - - 0x010126 04:8116: 85 44

	LDA mapMacroList+1				;C - - - - - 0x010128 04:8118: A5 3D
	STA terrainAdr+1				;C - - - - - 0x01012A 04:811A: 85 43
	STA originalTerrainAdr+1				;C - - - - - 0x01012C 04:811C: 85 45

	LDA ram_0365				;C - - - - - 0x01012E 04:811E: AD 65 03
	STA ram_0047				;C - - - - - 0x010131 04:8121: 85 47
	JSR CODE_08816F				;C - - - - - 0x010133 04:8123: 20 6F 81
	JSR CODE_088264				;C - - - - - 0x010136 04:8126: 20 64 82
	RTS							;C - - - - - 0x010139 04:8129: 60

CODE_08812A:
	LDA #$01					;C - - - - - 0x01013A 04:812A: A9 01
	STA playerDir				;C - - - - - 0x01013C 04:812C: 85 77
	LDA #$00					;C - - - - - 0x01013E 04:812E: A9 00
	STA playerState				;C - - - - - 0x010140 04:8130: 85 75
	STA ram_0076				;C - - - - - 0x010142 04:8132: 85 76
	STA playerInvFrames				;C - - - - - 0x010144 04:8134: 8D 77 04
	STA playerDmgType				;C - - - - - 0x010147 04:8137: 85 7C
	STA ram_007D				;C - - - - - 0x010149 04:8139: 85 7D
	STA playerHazardTrigger				;C - - - - - 0x01014B 04:813B: 85 7E
	STA playerHazardSlot				;C - - - - - 0x01014D 04:813D: 85 7F
	STA inflateTime				;C - - - - - 0x01014F 04:813F: 8D 7C 04
	STA extraBubbles				;C - - - - - 0x010152 04:8142: 8D 7D 04
	STA ram_047B				;C - - - - - 0x010155 04:8145: 8D 7B 04
	STA shooting				;C - - - - - 0x010158 04:8148: 8D 17 05
	STA ram_077B				;C - - - - - 0x01015B 04:814B: 8D 7B 07
	STA wideScrollDir				;C - - - - - 0x01015E 04:814E: 85 31
	STA ram_007B				;C - - - - - 0x010160 04:8150: 85 7B
	STA playerHazardTrigger				;C - - - - - 0x010162 04:8152: 85 7E
	STA ram_007D				;C - - - - - 0x010164 04:8154: 85 7D
	STA playerDmgType				;C - - - - - 0x010166 04:8156: 85 7C
	LDA roundFlags				;C - - - - - 0x010168 04:8158: AD 71 04
	AND #$07					;C - - - - - 0x01016B 04:815B: 29 07
	STA roundFlags				;C - - - - - 0x01016D 04:815D: 8D 71 04
	LDA bubbleVariant				;C - - - - - 0x010170 04:8160: AD 19 05
	CMP #$80					;C - - - - - 0x010173 04:8163: C9 80
	BCS CODE_088169				;C - - - - - 0x010175 04:8165: B0 02
		LDA #$00					;C - - - - - 0x010177 04:8167: A9 00
CODE_088169:
	AND #$0F					;C - - - - - 0x010179 04:8169: 29 0F
	STA bubbleVariant				;C - - - - - 0x01017B 04:816B: 8D 19 05
	RTS							;C - - - - - 0x01017E 04:816E: 60

CODE_08816F:
	LDA #.BANK(RoundsSolidRangeTable)					;C - - - - - 0x01017F 04:816F: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x010181 04:8171: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x010183 04:8173: 20 56 FF
.endif

	LDA currentRound				;C - - - - - 0x010186 04:8176: A5 D8
	ASL							;C - - - - - 0x010188 04:8178: 0A
	TAX							;C - - - - - 0x010189 04:8179: AA
	LDA RoundsSolidRangeTable,X			;C - - - - - 0x01018A 04:817A: BD DB B6
	STA scratch6				;C - - - - - 0x01018D 04:817D: 85 06
	LDA RoundsSolidRangeTable+1,X			;C - - - - - 0x01018F 04:817F: BD DC B6
	STA scratch7				;C - - - - - 0x010192 04:8182: 85 07
	LDY #$00					;C - - - - - 0x010194 04:8184: A0 00
CODE_088186:
	LDA (scratch6),Y			;C - - - - - 0x010196 04:8186: B1 06
	STA solidTerrainStart0,Y				;C - - - - - 0x010198 04:8188: 99 4B 07
	INY							;C - - - - - 0x01019B 04:818B: C8
	CPY #$0B					;C - - - - - 0x01019C 04:818C: C0 0B
	BNE CODE_088186				;C - - - - - 0x01019E 04:818E: D0 F6

	LDA DATA_0881BC,X			;C - - - - - 0x0101A0 04:8190: BD BC 81
	STA ram_006E				;C - - - - - 0x0101A3 04:8193: 85 6E
	LDA DATA_0881BC+1,X			;C - - - - - 0x0101A5 04:8195: BD BD 81
	STA ram_006F				;C - - - - - 0x0101A8 04:8198: 85 6F

	LDA currentRound				;C - - - - - 0x0101AA 04:819A: A5 D8
	CMP #30					;C - - - - - 0x0101AC 04:819C: C9 1E
	BCC CODE_0881B4				;C - - - - - 0x0101AE 04:819E: 90 14
	CMP #40					;C - - - - - 0x0101B0 04:81A0: C9 28
	BCS CODE_0881B4				;C - - - - - 0x0101B2 04:81A2: B0 10

	SEC							;C - - - - - 0x0101B4 04:81A4: 38
	SBC #30					;C - - - - - 0x0101B5 04:81A5: E9 1E
	TAX							;C - - - - - 0x0101B7 04:81A7: AA
	LDA DATA_06B7F1,X			;C - - - - - 0x0101B8 04:81A8: BD F1 B7
	STA ram_077C				;C - - - - - 0x0101BB 04:81AB: 8D 7C 07
	LDA DATA_06B7FC,X			;C - - - - - 0x0101BE 04:81AE: BD FC B7
	STA ram_077D				;C - - - - - 0x0101C1 04:81B1: 8D 7D 07
CODE_0881B4:
	LDX currentRound				;C - - - - - 0x0101C4 04:81B4: A6 D8
	LDA DATA_06B807,X			;C - - - - - 0x0101C6 04:81B6: BD 07 B8
	STA ram_0070				;C - - - - - 0x0101C9 04:81B9: 85 70

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x0101CB 04:81BB: 60

DATA_0881BC:
	;- - - - - - 0x0101CC 04:81BC: 87
	.word CODE_0FF687				;Round 00
	.word CODE_0FF687				;Round 01
	.word CODE_0FF687				;Round 02
	.word CODE_0FF687				;Round 03
	.word CODE_0FF687				;Round 04
	.word CODE_0FF687				;Round 05
	.word CODE_0FF687				;Round 06
	.word CODE_0FF687				;Round 07
	.word CODE_0FF687				;Round 08
	.word CODE_0FF687				;Round 09
	.word CODE_0FF687				;Round 10
	.word CODE_0FF687				;Round 11
	.word CODE_0FF687				;Round 12
	.word CODE_0FF687				;Round 13
	.word CODE_0FF687				;Round 14
	.word CODE_0FF687				;Round 15
	.word CODE_0FF687				;Round 16
	.word CODE_0FF687				;Round 17
	.word CODE_0FF687				;Round 18
	.word CODE_0FF687				;Round 19
	.word CODE_0FF687				;Round 20
	.word CODE_0FF687				;Round 21
	.word CODE_0FF7AC				;Round 22
	.word CODE_0FF687				;Round 23
	.word CODE_0FF687				;Round 24
	.word CODE_0FF687				;Round 25
	.word CODE_0FF687				;Round 26
	.word CODE_0FF687				;Round 27
	.word CODE_0FF687				;Round 28
	.word CODE_0FF687				;Round 29
	.word CODE_0FF688				;Round 30
	.word CODE_0FF7AC				;Round 31
	.word CODE_0FF7DB				;Round 32
	.word CODE_0FF78B				;Round 33
	.word CODE_0FF688				;Round 34
	.word CODE_0FF687				;Round 35
	.word CODE_0FF688				;Round 36
	.word CODE_0FF688				;Round 37
	.word CODE_0FF78B				;Round 38
	.word CODE_0FF688				;Round 39
	.word CODE_0FF7CA				;Round 40
	.word CODE_0FF687				;Round 41
	.word CODE_0FF687				;Round 42
	.word CODE_0FF687				;Round 43
	.word CODE_0FF687				;Round 44
	.word CODE_0FF687				;Round 45
	.word CODE_0FF687				;Round 46
	.word CODE_0FF687				;Round 47
	.word CODE_0FF687				;Round 48
	.word CODE_0FF687				;Round 49
	.word CODE_0FF79A				;Round 50
	.word CODE_0FF687				;Round 51
	.word CODE_0FF687				;Round 52
	.word CODE_0FF687				;Round 53
	.word CODE_0FF687				;Round 54
	.word CODE_0FF687				;Round 55
	.word CODE_0FF687				;Round 56
	.word CODE_0FF7AC				;Round 57
	.word CODE_0FF687				;Round 58
	.word CODE_0FF687				;Round 59
	.word CODE_0FF687				;Round 60
	.word CODE_0FF687				;Round 61
	.word CODE_0FF687				;Round 62
	.word CODE_0FF687				;Round 63
	.word CODE_0FF687				;Round 64
	.word CODE_0FF687				;Round 65
	.word CODE_0FF687				;Round 66
	.word CODE_0FF687				;Round 67
	.word CODE_0FF7AC				;Round 68
	.word CODE_0FFCF6				;Round 69
	.word CODE_0FF687				;Round 70
	.word CODE_0FF687				;Round 71
	.word CODE_0FF687				;Round 72
	.word CODE_0FFCF6				;Round 73
	.word CODE_0FF687				;Round 74
	.word CODE_0FF687				;Round 75
	.word CODE_0FF687				;Round 76
	.word CODE_0FF687				;Round 77
	.word CODE_0FFCF6				;Round 78
	.word CODE_0FF687				;Round 79
	.word CODE_0FF687				;Round 80
	.word CODE_0FF687				;Bonus game 1
	.word CODE_0FF687				;Bonus game 2
	.word CODE_0FF687				;Bonus game 3

CODE_088264:
	LDA #.BANK(RoundsFlowTable)					;C - - - - - 0x010274 04:8264: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x010276 04:8266: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x010278 04:8268: 20 56 FF
.endif

	LDA currentRound				;C - - - - - 0x01027B 04:826B: A5 D8
	ASL							;C - - - - - 0x01027D 04:826D: 0A
	TAX							;C - - - - - 0x01027E 04:826E: AA
	LDA RoundsFlowTable,X			;C - - - - - 0x01027F 04:826F: BD 00 A0
	STA flowAdr				;C - - - - - 0x010282 04:8272: 8D 5D 07
	LDA RoundsFlowTable+1,X			;C - - - - - 0x010285 04:8275: BD 01 A0
	STA flowAdr+1				;C - - - - - 0x010288 04:8278: 8D 5E 07

	LDX currentRound				;C - - - - - 0x01028B 04:827B: A6 D8
	LDA DATA_06B3E8,X			;C - - - - - 0x01028D 04:827D: BD E8 B3
	STA ram_0476				;C - - - - - 0x010290 04:8280: 8D 76 04
	LDX currentRound				;C - - - - - 0x010293 04:8283: A6 D8
	LDA RoundsBubbleVariants,X			;C - - - - - 0x010295 04:8285: BD 39 B4
	STA roundBubbleVariant				;C - - - - - 0x010298 04:8288: 85 82
	LDA DATA_06B48A,X			;C - - - - - 0x01029A 04:828A: BD 8A B4
	STA ram_0083				;C - - - - - 0x01029D 04:828D: 85 83

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x01029F 04:828F: 60

RoundBGSetup:
	LDA #.BANK(RoundMaps)					;C - - - - - 0x0102A0 04:8290: A9 04
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x0102A2 04:8292: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x0102A4 04:8294: 20 56 FF
.endif

	LDX currentRound				;C - - - - - 0x0102A7 04:8297: A6 D8
	LDA RoundMaps,X			;C - - - - - 0x0102A9 04:8299: BD AE BA
	STA mapID				;C - - - - - 0x0102AC 04:829C: 8D 60 03

	TXA							;C - - - - - 0x0102AF 04:829F: 8A
	TAY							;C - - - - - 0x0102B0 04:82A0: A8
	LDX vNametable				;C - - - - - 0x0102B1 04:82A1: A6 2D
	LDA RoundChrBanks,Y			;C - - - - - 0x0102B3 04:82A3: B9 FF BA
	STA chrBankA,X				;C - - - - - 0x0102B6 04:82A6: 95 4B

	LDA RoundNTBaseTiles,X			;C - - - - - 0x0102B8 04:82A8: BD DA 82
	STA mapBaseTile				;C - - - - - 0x0102BB 04:82AB: 8D 63 03

	LDA #$00					;C - - - - - 0x0102BE 04:82AE: A9 00
	STA mapTargetAdr				;C - - - - - 0x0102C0 04:82B0: 85 49
	LDA RoundNTTargets,X			;C - - - - - 0x0102C2 04:82B2: BD DD 82
	STA mapTargetAdr+1				;C - - - - - 0x0102C5 04:82B5: 85 4A

	LDA #$00					;C - - - - - 0x0102C7 04:82B7: A9 00
	STA wideRound				;C - - - - - 0x0102C9 04:82B9: 8D B0 03

.ifdef REGION_JP
	LDA #$40					;- - - - - - 0x0102D4 04:82C4: A9
.else
	LDA #$01					;C - - - - - 0x0102CC 04:82BC: A9 01
.endif
	CPY #20						;C - - - - - 0x0102CE 04:82BE: C0 14
	BNE CODE_0882D3				;C - - - - - 0x0102D0 04:82C0: D0 11
		;Round 20 is two screens wide
		LDA mapTargetAdr+1				;C - - - - - 0x0102D2 04:82C2: A5 4A
		CMP #$28					;C - - - - - 0x0102D4 04:82C4: C9 28
		BNE CODE_0882CC				;C - - - - - 0x0102D6 04:82C6: D0 04
			LDA #$24					;C - - - - - 0x0102D8 04:82C8: A9 24
			STA mapTargetAdr+1				;C - - - - - 0x0102DA 04:82CA: 85 4A
	CODE_0882CC:
		LDA #$01					;C - - - - - 0x0102DC 04:82CC: A9 01
		STA wideRound				;C - - - - - 0x0102DE 04:82CE: 8D B0 03
		LDA #$00					;C - - - - - 0x0102E1 04:82D1: A9 00
CODE_0882D3:
.ifdef REGION_JP
	STA $E000					;- - - - - - 0x0102EB 04:82DB: 8D
.else
	STA $A000				;C - - - - - 0x0102E3 04:82D3: 8D 00 A0
.endif
	JSR LoadMap				;C - - - - - 0x0102E6 04:82D6: 20 23 E5

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x0102E9 04:82D9: 60

RoundNTBaseTiles:
	.byte $00					;- D 0 - - - 0x0102EA 04:82DA: 00
	.byte $80					;- D 0 - - - 0x0102EB 04:82DB: 80
	.byte $00					;- - - - - - 0x0102EC 04:82DC: 00

RoundNTTargets:
	.byte $28					;- D 0 - - - 0x0102ED 04:82DD: 28
	.byte $20					;- D 0 - - - 0x0102EE 04:82DE: 20
	.byte $28					;- - - - - - 0x0102EF 04:82DF: 28

CODE_0882E0:
	;Unreached
	LDA #.BANK(RoundMaps)					;- - - - - - 0x0102F0 04:82E0: A9
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;- - - - - - 0x0102F2 04:82E2: 85
	JSR SwapPrgBankB				;- - - - - - 0x0102F4 04:82E4: 20
.endif

	LDX currentRound				;- - - - - - 0x0102F7 04:82E7: A6
	DEX							;- - - - - - 0x0102F9 04:82E9: CA
	LDA RoundMaps,X			;- - - - - - 0x0102FA 04:82EA: BD
	STA mapID				;- - - - - - 0x0102FD 04:82ED: 8D
	TXA							;- - - - - - 0x010300 04:82F0: 8A
	TAY							;- - - - - - 0x010301 04:82F1: A8
	LDX vNametable				;- - - - - - 0x010302 04:82F2: A6
	LDA RoundNTBaseTiles+1,X			;- - - - - - 0x010304 04:82F4: BD
	STA mapBaseTile				;- - - - - - 0x010307 04:82F7: 8D
	LDA #$00					;- - - - - - 0x01030A 04:82FA: A9
	STA mapTargetAdr				;- - - - - - 0x01030C 04:82FC: 85
	LDA RoundNTTargets+1,X			;- - - - - - 0x01030E 04:82FE: BD
	STA mapTargetAdr+1				;- - - - - - 0x010311 04:8301: 85
	LDA #$00					;- - - - - - 0x010313 04:8303: A9
	STA wideRound				;- - - - - - 0x010315 04:8305: 8D

.ifdef REGION_JP
	LDA #$40					;- - - - - - 0x010327 04:8317: A9
	STA $E000					;- - - - - - 0x010329 04:8319: 8D
.else
	LDA #$01					;- - - - - - 0x010318 04:8308: A9
	STA $A000					;- - - - - - 0x01031A 04:830A: 8D
.endif
	JSR LoadMap				;- - - - - - 0x01031D 04:830D: 20

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;- - - - - - 0x010320 04:8310: 60

CODE_088311:
	LDA vScroll				;C - - - - - 0x010321 04:8311: A5 29
	CLC							;C - - - - - 0x010323 04:8313: 18
	ADC #$04					;C - - - - - 0x010324 04:8314: 69 04
	STA vScroll				;C - - - - - 0x010326 04:8316: 85 29
	CMP #$F0					;C - - - - - 0x010328 04:8318: C9 F0
	BCC CODE_088368				;C - - - - - 0x01032A 04:831A: 90 4C
		LDA #$00					;C - - - - - 0x01032C 04:831C: A9 00
		STA vScroll				;C - - - - - 0x01032E 04:831E: 85 29
		LDA vNametable				;C - - - - - 0x010330 04:8320: A5 2D
		ADC #$00					;C - - - - - 0x010332 04:8322: 69 00
		AND #$01					;C - - - - - 0x010334 04:8324: 29 01
		STA vNametable				;C - - - - - 0x010336 04:8326: 85 2D
		JSR SetRoundPalette				;C - - - - - 0x010338 04:8328: 20 7E 83
		LDA roundFlags				;C - - - - - 0x01033B 04:832B: AD 71 04
		AND #$07					;C - - - - - 0x01033E 04:832E: 29 07
		BEQ CODE_088342				;C - - - - - 0x010340 04:8330: F0 10
			DEC roundFlags				;C - - - - - 0x010342 04:8332: CE 71 04
			INC currentRound				;C - - - - - 0x010345 04:8335: E6 D8

			LDA #.LOBYTE(CODE_089DBC)	;C - - - - - 0x010347 04:8337: A9 BC
			STA nmiBankedSub			;C - - - - - 0x010349 04:8339: 85 16
			LDA #.HIBYTE(CODE_089DBC)	;C - - - - - 0x01034B 04:833B: A9 9D
			STA nmiBankedSub+1			;C - - - - - 0x01034D 04:833D: 85 17

			JMP CODE_088374				;C - - - - - 0x01034F 04:833F: 4C 74 83
	CODE_088342:
		LDA #.LOBYTE(CODE_0884AB)	;C - - - - - 0x010352 04:8342: A9 AB
		STA nmiBankedSub			;C - - - - - 0x010354 04:8344: 85 16
		LDA #.HIBYTE(CODE_0884AB)	;C - - - - - 0x010356 04:8346: A9 84
		STA nmiBankedSub+1			;C - - - - - 0x010358 04:8348: 85 17

		LDA #.BANK(CODE_0781B9)					;C - - - - - 0x01035A 04:834A: A9 07
		STA updateSubBankA				;C - - - - - 0x01035C 04:834C: 85 18
		LDA #.LOBYTE(CODE_0781B9)	;C - - - - - 0x01035E 04:834E: A9 B9
		STA updateSub				;C - - - - - 0x010360 04:8350: 85 19
		LDA #.HIBYTE(CODE_0781B9)	;C - - - - - 0x010362 04:8352: A9 81
		STA updateSub+1				;C - - - - - 0x010364 04:8354: 85 1A

		LDX currentRound				;C - - - - - 0x010366 04:8356: A6 D8
		CPX #$46					;C - - - - - 0x010368 04:8358: E0 46
		BNE CODE_088368				;C - - - - - 0x01036A 04:835A: D0 0C
			LDA #.BANK(CODE_058750)					;C - - - - - 0x01036C 04:835C: A9 05
			STA updateSubBankA				;C - - - - - 0x01036E 04:835E: 85 18
			LDA #.LOBYTE(CODE_058750)	;C - - - - - 0x010370 04:8360: A9 50
			STA updateSub				;C - - - - - 0x010372 04:8362: 85 19
			LDA #.HIBYTE(CODE_058750)	;C - - - - - 0x010374 04:8364: A9 87
			STA updateSub+1				;C - - - - - 0x010376 04:8366: 85 1A
CODE_088368:
	LDA globalTimer				;C - - - - - 0x010378 04:8368: A5 14
	AND #$01					;C - - - - - 0x01037A 04:836A: 29 01
	BNE CODE_088371				;C - - - - - 0x01037C 04:836C: D0 03
		JSR AnimateNonBubbles				;C - - - - - 0x01037E 04:836E: 20 5C EE
CODE_088371:
	JSR DrawObjects				;C - - - - - 0x010381 04:8371: 20 E2 EE
CODE_088374:
	RTS							;C - - - - - 0x010384 04:8374: 60

DATA_088375:
	;Unreached
	.byte $01					;- - - - - - 0x010385 04:8375: 01
	.byte $14					;- - - - - - 0x010386 04:8376: 14
	.byte $15					;- - - - - - 0x010387 04:8377: 15
	.byte $28					;- - - - - - 0x010388 04:8378: 28
	.byte $29					;- - - - - - 0x010389 04:8379: 29
	.byte $3C					;- - - - - - 0x01038A 04:837A: 3C
	.byte $3D					;- - - - - - 0x01038B 04:837B: 3D
	.byte $4F					;- - - - - - 0x01038C 04:837C: 4F
	.byte $50					;- - - - - - 0x01038D 04:837D: 50

SetRoundPalette:
	LDX #$00					;C - - - - - 0x01038E 04:837E: A2 00
@checkboss:
	LDA BossRounds,X			;C - - - - - 0x010390 04:8380: BD BC 83
	CMP currentRound				;C - - - - - 0x010393 04:8383: C5 D8
	BEQ @boss				;C - - - - - 0x010395 04:8385: F0 08
		INX							;C - - - - - 0x010397 04:8387: E8
		CPX #$05					;C - - - - - 0x010398 04:8388: E0 05
		BNE @checkboss				;C - - - - - 0x01039A 04:838A: D0 F4
			JMP @nonboss				;C - - - - - 0x01039C 04:838C: 4C 96 83
@boss:
	LDA BossRoundsColorIndexes,X			;C - - - - - 0x01039F 04:838F: BD C1 83
	TAX							;C - - - - - 0x0103A2 04:8392: AA
	JMP @getadr				;C - - - - - 0x0103A3 04:8393: 4C A3 83
@nonboss:
	LDX #$00					;C - - - - - 0x0103A6 04:8396: A2 00
@getchapter:
	INX							;C - - - - - 0x0103A8 04:8398: E8
	LDA NewColorRounds,X			;C - - - - - 0x0103A9 04:8399: BD C6 83
	CMP currentRound				;C - - - - - 0x0103AC 04:839C: C5 D8
	BCC @getchapter				;C - - - - - 0x0103AE 04:839E: 90 F8

	TXA							;C - - - - - 0x0103B0 04:83A0: 8A
	ASL							;C - - - - - 0x0103B1 04:83A1: 0A
	TAX							;C - - - - - 0x0103B2 04:83A2: AA
@getadr:
	LDA WorldsColorTable,X			;C - - - - - 0x0103B3 04:83A3: BD CF 83
	STA scratch6				;C - - - - - 0x0103B6 04:83A6: 85 06
	LDA WorldsColorTable+1,X			;C - - - - - 0x0103B8 04:83A8: BD D0 83
	STA scratch7				;C - - - - - 0x0103BB 04:83AB: 85 07

	LDA currentRound				;C - - - - - 0x0103BD 04:83AD: A5 D8
	LDY #$00					;C - - - - - 0x0103BF 04:83AF: A0 00
@copy:
	LDA (scratch6),Y			;C - - - - - 0x0103C1 04:83B1: B1 06
	STA colorBuffer,Y				;C - - - - - 0x0103C3 04:83B3: 99 00 03
	INY							;C - - - - - 0x0103C6 04:83B6: C8
	CPY #$11					;C - - - - - 0x0103C7 04:83B7: C0 11
	BNE @copy				;C - - - - - 0x0103C9 04:83B9: D0 F6

	RTS							;C - - - - - 0x0103CB 04:83BB: 60

BossRounds:
	.byte 20					;- D 0 - - - 0x0103CC 04:83BC: 14
	.byte 40					;- D 0 - - - 0x0103CD 04:83BD: 28
	.byte 60					;- D 0 - - - 0x0103CE 04:83BE: 3C
	.byte 79					;- D 0 - - - 0x0103CF 04:83BF: 4F
	.byte 80					;- D 0 - - - 0x0103D0 04:83C0: 50

BossRoundsColorIndexes:
	.byte 2*0					;- - - - - - 0x0103D1 04:83C1: 00
	.byte 2*0					;- - - - - - 0x0103D2 04:83C2: 00
	.byte 2*0					;- D 0 - - - 0x0103D3 04:83C3: 00
	.byte 2*9					;- D 0 - - - 0x0103D4 04:83C4: 12
	.byte 2*9					;- D 0 - - - 0x0103D5 04:83C5: 12

NewColorRounds:
	.byte 0					;- - - - - - 0x0103D6 04:83C6: 00
	.byte 10					;- D 0 - - - 0x0103D7 04:83C7: 0A
	.byte 20					;- D 0 - - - 0x0103D8 04:83C8: 14
	.byte 30					;- D 0 - - - 0x0103D9 04:83C9: 1E
	.byte 40					;- D 0 - - - 0x0103DA 04:83CA: 28
	.byte 50					;- D 0 - - - 0x0103DB 04:83CB: 32
	.byte 60					;- D 0 - - - 0x0103DC 04:83CC: 3C
	.byte 70					;- D 0 - - - 0x0103DD 04:83CD: 46
	.byte 80					;- D 0 - - - 0x0103DE 04:83CE: 50

WorldsColorTable:
	.word palBossCave			;- D 0 - - - 0x0103DF 04:83CF: 6B Boss (Blue)
	.word palWorld1A			;- D 0 - - - 0x0103E1 04:83D1: E3 Round 00-09
	.word palWorld1B			;- D 0 - - - 0x0103E3 04:83D3: F4 Round 10-19
	.word palWorld2A			;- D 0 - - - 0x0103E5 04:83D5: 05 Round 20-29
	.word palWorld2B			;- D 0 - - - 0x0103E7 04:83D7: 16 Round 30-39
	.word palWorld3A			;- D 0 - - - 0x0103E9 04:83D9: 27 Round 40-49
	.word palWorld3B			;- D 0 - - - 0x0103EB 04:83DB: 38 Round 50-59
	.word palWorld4A			;- D 0 - - - 0x0103ED 04:83DD: 49 Round 60-69
	.word palWorld4B			;- D 0 - - - 0x0103EF 04:83DF: 5A Round 70-78
	.word palFinalBossCave		;- D 0 - - - 0x0103F1 04:83E1: 7C Final bosses (Orange)

;Includes all four BG palettes as well as first sprite color

palWorld1A:
	.byte $0F					;- D 0 - - - 0x0103F3 04:83E3: 0F
	.byte $37					;- D 0 - - - 0x0103F4 04:83E4: 37
	.byte $27					;- D 0 - - - 0x0103F5 04:83E5: 27
	.byte $17					;- D 0 - - - 0x0103F6 04:83E6: 17
	.byte $0F					;- D 0 - - - 0x0103F7 04:83E7: 0F
	.byte $1A					;- D 0 - - - 0x0103F8 04:83E8: 1A
	.byte $0A					;- D 0 - - - 0x0103F9 04:83E9: 0A
	.byte $2C					;- D 0 - - - 0x0103FA 04:83EA: 2C
	.byte $0F					;- D 0 - - - 0x0103FB 04:83EB: 0F
	.byte $27					;- D 0 - - - 0x0103FC 04:83EC: 27
	.byte $17					;- D 0 - - - 0x0103FD 04:83ED: 17
	.byte $2C					;- D 0 - - - 0x0103FE 04:83EE: 2C
	.byte $0F					;- D 0 - - - 0x0103FF 04:83EF: 0F
	.byte $30					;- D 0 - - - 0x010400 04:83F0: 30
	.byte $3B					;- D 0 - - - 0x010401 04:83F1: 3B
	.byte $2C					;- D 0 - - - 0x010402 04:83F2: 2C
	.byte $0F					;- D 0 - - - 0x010403 04:83F3: 0F

palWorld1B:
	.byte $0F					;- D 0 - - - 0x010404 04:83F4: 0F
	.byte $37					;- D 0 - - - 0x010405 04:83F5: 37
	.byte $27					;- D 0 - - - 0x010406 04:83F6: 27
	.byte $17					;- D 0 - - - 0x010407 04:83F7: 17
	.byte $0F					;- D 0 - - - 0x010408 04:83F8: 0F
	.byte $28					;- D 0 - - - 0x010409 04:83F9: 28
	.byte $18					;- D 0 - - - 0x01040A 04:83FA: 18
	.byte $26					;- D 0 - - - 0x01040B 04:83FB: 26
	.byte $0F					;- D 0 - - - 0x01040C 04:83FC: 0F
	.byte $27					;- D 0 - - - 0x01040D 04:83FD: 27
	.byte $17					;- D 0 - - - 0x01040E 04:83FE: 17
	.byte $26					;- D 0 - - - 0x01040F 04:83FF: 26
	.byte $0F					;- D 0 - - - 0x010410 04:8400: 0F
	.byte $20					;- D 0 - - - 0x010411 04:8401: 20
	.byte $36					;- D 0 - - - 0x010412 04:8402: 36
	.byte $26					;- D 0 - - - 0x010413 04:8403: 26
	.byte $0F					;- D 0 - - - 0x010414 04:8404: 0F

palWorld2A:
	.byte $0F					;- D 0 - - - 0x010415 04:8405: 0F
	.byte $30					;- D 0 - - - 0x010416 04:8406: 30
	.byte $31					;- D 0 - - - 0x010417 04:8407: 31
	.byte $22					;- D 0 - - - 0x010418 04:8408: 22
	.byte $0F					;- D 0 - - - 0x010419 04:8409: 0F
	.byte $25					;- D 0 - - - 0x01041A 04:840A: 25
	.byte $2A					;- D 0 - - - 0x01041B 04:840B: 2A
	.byte $27					;- D 0 - - - 0x01041C 04:840C: 27
	.byte $0F					;- D 0 - - - 0x01041D 04:840D: 0F
	.byte $30					;- D 0 - - - 0x01041E 04:840E: 30
	.byte $29					;- D 0 - - - 0x01041F 04:840F: 29
	.byte $22					;- D 0 - - - 0x010420 04:8410: 22
	.byte $0F					;- D 0 - - - 0x010421 04:8411: 0F
	.byte $30					;- D 0 - - - 0x010422 04:8412: 30
	.byte $24					;- D 0 - - - 0x010423 04:8413: 24
	.byte $22					;- D 0 - - - 0x010424 04:8414: 22
	.byte $0F					;- D 0 - - - 0x010425 04:8415: 0F

palWorld2B:
	.byte $0F					;- D 0 - - - 0x010426 04:8416: 0F
	.byte $20					;- D 0 - - - 0x010427 04:8417: 20
	.byte $32					;- D 0 - - - 0x010428 04:8418: 32
	.byte $3A					;- D 0 - - - 0x010429 04:8419: 3A
	.byte $0F					;- D 0 - - - 0x01042A 04:841A: 0F
	.byte $25					;- D 0 - - - 0x01042B 04:841B: 25
	.byte $2A					;- D 0 - - - 0x01042C 04:841C: 2A
	.byte $27					;- D 0 - - - 0x01042D 04:841D: 27
	.byte $0F					;- D 0 - - - 0x01042E 04:841E: 0F
	.byte $30					;- D 0 - - - 0x01042F 04:841F: 30
	.byte $28					;- D 0 - - - 0x010430 04:8420: 28
	.byte $3A					;- D 0 - - - 0x010431 04:8421: 3A
	.byte $0F					;- D 0 - - - 0x010432 04:8422: 0F
	.byte $30					;- D 0 - - - 0x010433 04:8423: 30
	.byte $23					;- D 0 - - - 0x010434 04:8424: 23
	.byte $3A					;- D 0 - - - 0x010435 04:8425: 3A
	.byte $0F					;- D 0 - - - 0x010436 04:8426: 0F

palWorld3A:
	.byte $0F					;- D 0 - - - 0x010437 04:8427: 0F
	.byte $38					;- D 0 - - - 0x010438 04:8428: 38
	.byte $2A					;- D 0 - - - 0x010439 04:8429: 2A
	.byte $22					;- D 0 - - - 0x01043A 04:842A: 22
	.byte $0F					;- D 0 - - - 0x01043B 04:842B: 0F
	.byte $30					;- D 0 - - - 0x01043C 04:842C: 30
	.byte $31					;- D 0 - - - 0x01043D 04:842D: 31
	.byte $34					;- D 0 - - - 0x01043E 04:842E: 34
	.byte $0F					;- D 0 - - - 0x01043F 04:842F: 0F
	.byte $37					;- D 0 - - - 0x010440 04:8430: 37
	.byte $26					;- D 0 - - - 0x010441 04:8431: 26
	.byte $22					;- D 0 - - - 0x010442 04:8432: 22
	.byte $0F					;- D 0 - - - 0x010443 04:8433: 0F
	.byte $30					;- D 0 - - - 0x010444 04:8434: 30
	.byte $31					;- D 0 - - - 0x010445 04:8435: 31
	.byte $22					;- D 0 - - - 0x010446 04:8436: 22
	.byte $0F					;- D 0 - - - 0x010447 04:8437: 0F

palWorld3B:
	.byte $0F					;- D 0 - - - 0x010448 04:8438: 0F
	.byte $30					;- D 0 - - - 0x010449 04:8439: 30
	.byte $10					;- D 0 - - - 0x01044A 04:843A: 10
	.byte $23					;- D 0 - - - 0x01044B 04:843B: 23
	.byte $0F					;- D 0 - - - 0x01044C 04:843C: 0F
	.byte $30					;- D 0 - - - 0x01044D 04:843D: 30
	.byte $31					;- D 0 - - - 0x01044E 04:843E: 31
	.byte $34					;- D 0 - - - 0x01044F 04:843F: 34
	.byte $0F					;- D 0 - - - 0x010450 04:8440: 0F
	.byte $3C					;- D 0 - - - 0x010451 04:8441: 3C
	.byte $2B					;- D 0 - - - 0x010452 04:8442: 2B
	.byte $23					;- D 0 - - - 0x010453 04:8443: 23
	.byte $0F					;- D 0 - - - 0x010454 04:8444: 0F
	.byte $30					;- D 0 - - - 0x010455 04:8445: 30
	.byte $35					;- D 0 - - - 0x010456 04:8446: 35
	.byte $23					;- D 0 - - - 0x010457 04:8447: 23
	.byte $0F					;- D 0 - - - 0x010458 04:8448: 0F

palWorld4A:
	.byte $0F					;- D 0 - - - 0x010459 04:8449: 0F
	.byte $1B					;- D 0 - - - 0x01045A 04:844A: 1B
	.byte $0C					;- D 0 - - - 0x01045B 04:844B: 0C
	.byte $2A					;- D 0 - - - 0x01045C 04:844C: 2A
	.byte $0F					;- D 0 - - - 0x01045D 04:844D: 0F
	.byte $16					;- D 0 - - - 0x01045E 04:844E: 16
	.byte $0C					;- D 0 - - - 0x01045F 04:844F: 0C
	.byte $07					;- D 0 - - - 0x010460 04:8450: 07
	.byte $0F					;- D 0 - - - 0x010461 04:8451: 0F
	.byte $06					;- D 0 - - - 0x010462 04:8452: 06
	.byte $0C					;- D 0 - - - 0x010463 04:8453: 0C
	.byte $17					;- D 0 - - - 0x010464 04:8454: 17
	.byte $0F					;- D 0 - - - 0x010465 04:8455: 0F
	.byte $30					;- D 0 - - - 0x010466 04:8456: 30
	.byte $3C					;- D 0 - - - 0x010467 04:8457: 3C
	.byte $07					;- D 0 - - - 0x010468 04:8458: 07
	.byte $0F					;- D 0 - - - 0x010469 04:8459: 0F

palWorld4B:
	.byte $0F					;- D 0 - - - 0x01046A 04:845A: 0F
	.byte $21					;- D 0 - - - 0x01046B 04:845B: 21
	.byte $11					;- D 0 - - - 0x01046C 04:845C: 11
	.byte $30					;- D 0 - - - 0x01046D 04:845D: 30
	.byte $0F					;- D 0 - - - 0x01046E 04:845E: 0F
	.byte $36					;- D 0 - - - 0x01046F 04:845F: 36
	.byte $11					;- D 0 - - - 0x010470 04:8460: 11
	.byte $33					;- D 0 - - - 0x010471 04:8461: 33
	.byte $0F					;- D 0 - - - 0x010472 04:8462: 0F
	.byte $22					;- D 0 - - - 0x010473 04:8463: 22
	.byte $22					;- D 0 - - - 0x010474 04:8464: 22
	.byte $22					;- D 0 - - - 0x010475 04:8465: 22
	.byte $0F					;- D 0 - - - 0x010476 04:8466: 0F
	.byte $30					;- D 0 - - - 0x010477 04:8467: 30
	.byte $24					;- D 0 - - - 0x010478 04:8468: 24
	.byte $33					;- D 0 - - - 0x010479 04:8469: 33
	.byte $0F					;- D 0 - - - 0x01047A 04:846A: 0F

palBossCave:
	.byte $0F					;- D 0 - - - 0x01047B 04:846B: 0F
	.byte $2C					;- D 0 - - - 0x01047C 04:846C: 2C
	.byte $1C					;- D 0 - - - 0x01047D 04:846D: 1C
	.byte $0C					;- D 0 - - - 0x01047E 04:846E: 0C
	.byte $0F					;- D 0 - - - 0x01047F 04:846F: 0F
	.byte $2C					;- D 0 - - - 0x010480 04:8470: 2C
	.byte $1C					;- D 0 - - - 0x010481 04:8471: 1C
	.byte $0C					;- D 0 - - - 0x010482 04:8472: 0C
	.byte $0F					;- D 0 - - - 0x010483 04:8473: 0F
	.byte $2C					;- D 0 - - - 0x010484 04:8474: 2C
	.byte $1C					;- D 0 - - - 0x010485 04:8475: 1C
	.byte $0C					;- D 0 - - - 0x010486 04:8476: 0C
	.byte $0F					;- D 0 - - - 0x010487 04:8477: 0F
	.byte $30					;- D 0 - - - 0x010488 04:8478: 30
	.byte $16					;- D 0 - - - 0x010489 04:8479: 16
	.byte $0C					;- D 0 - - - 0x01048A 04:847A: 0C
	.byte $0F					;- D 0 - - - 0x01048B 04:847B: 0F

palFinalBossCave:
	.byte $0F					;- D 0 - - - 0x01048C 04:847C: 0F
	.byte $28					;- D 0 - - - 0x01048D 04:847D: 28
	.byte $17					;- D 0 - - - 0x01048E 04:847E: 17
	.byte $07					;- D 0 - - - 0x01048F 04:847F: 07
	.byte $0F					;- D 0 - - - 0x010490 04:8480: 0F
	.byte $28					;- D 0 - - - 0x010491 04:8481: 28
	.byte $17					;- D 0 - - - 0x010492 04:8482: 17
	.byte $07					;- D 0 - - - 0x010493 04:8483: 07
	.byte $0F					;- D 0 - - - 0x010494 04:8484: 0F
	.byte $28					;- D 0 - - - 0x010495 04:8485: 28
	.byte $17					;- D 0 - - - 0x010496 04:8486: 17
	.byte $07					;- D 0 - - - 0x010497 04:8487: 07
	.byte $0F					;- D 0 - - - 0x010498 04:8488: 0F
	.byte $30					;- D 0 - - - 0x010499 04:8489: 30
	.byte $16					;- D 0 - - - 0x01049A 04:848A: 16
	.byte $07					;- D 0 - - - 0x01049B 04:848B: 07
	.byte $0F					;- D 0 - - - 0x01049C 04:848C: 0F

SetRoundMusic:
	LDA #.BANK(RoundsMusicTracks)					;C - - - - - 0x01049D 04:848D: A9 04
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x01049F 04:848F: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x0104A1 04:8491: 20 56 FF
.endif

	LDX currentRound				;C - - - - - 0x0104A4 04:8494: A6 D8
	LDA RoundsMusicTracks,X			;C - - - - - 0x0104A6 04:8496: BD 1E BC
	CMP a:musicTrigger						;C - - - - - 0x0104A9 04:8499: CD E0 00
	BEQ CODE_0884A3				;C - - - - - 0x0104AC 04:849C: F0 05
		AND #~MUSIC_PLAYING					;C - - - - - 0x0104AE 04:849E: 29 7F
		STA a:musicTrigger						;C - - - - - 0x0104B0 04:84A0: 8D E0 00
CODE_0884A3:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x0104B3 04:84A3: 60

SetRoundPaletteAndMusic:
	JSR SetRoundPalette				;C - - - - - 0x0104B4 04:84A4: 20 7E 83
	JSR SetRoundMusic				;C - - - - - 0x0104B7 04:84A7: 20 8D 84
	RTS							;C - - - - - 0x0104BA 04:84AA: 60

CODE_0884AB:
	LDA objY				;C - - - - - 0x0104BB 04:84AB: AD 8B 05
	CMP #$C4					;C - - - - - 0x0104BE 04:84AE: C9 C4
	BEQ CODE_0884BD				;C - - - - - 0x0104C0 04:84B0: F0 0B
	BCC CODE_0884BA				;C - - - - - 0x0104C2 04:84B2: 90 06
		DEC objY				;C - - - - - 0x0104C4 04:84B4: CE 8B 05
		JMP CODE_0884BD				;C - - - - - 0x0104C7 04:84B7: 4C BD 84
CODE_0884BA:
	INC objY				;C - - - - - 0x0104CA 04:84BA: EE 8B 05
CODE_0884BD:
	LDA objX				;C - - - - - 0x0104CD 04:84BD: AD B3 05
	CMP #$1F					;C - - - - - 0x0104D0 04:84C0: C9 1F
	BEQ CODE_0884CF				;C - - - - - 0x0104D2 04:84C2: F0 0B
	BCC CODE_0884CC				;C - - - - - 0x0104D4 04:84C4: 90 06
		DEC objX				;C - - - - - 0x0104D6 04:84C6: CE B3 05
		JMP CODE_0884CF				;C - - - - - 0x0104D9 04:84C9: 4C CF 84
CODE_0884CC:
	INC objX				;C - - - - - 0x0104DC 04:84CC: EE B3 05
CODE_0884CF:
	LDA objY				;C - - - - - 0x0104DF 04:84CF: AD 8B 05
	CMP #$C4					;C - - - - - 0x0104E2 04:84D2: C9 C4
	BNE CODE_0884FB				;C - - - - - 0x0104E4 04:84D4: D0 25
		LDA objX				;C - - - - - 0x0104E6 04:84D6: AD B3 05
		CMP #$1F					;C - - - - - 0x0104E9 04:84D9: C9 1F
		BNE CODE_0884FB				;C - - - - - 0x0104EB 04:84DB: D0 1E
			LDA #.LOBYTE(anPlayerR_ID)					;C - - - - - 0x0104ED 04:84DD: A9 02
			STA objAnim				;C - - - - - 0x0104EF 04:84DF: 8D 7B 06
			STA playerDir				;C - - - - - 0x0104F2 04:84E2: 85 77

			LDA #$00					;C - - - - - 0x0104F4 04:84E4: A9 00
			STA objAnimProgress				;C - - - - - 0x0104F6 04:84E6: 8D CB 06
			STA objAnimTimer				;C - - - - - 0x0104F9 04:84E9: 8D A3 06
			JSR SetRoundIRQ				;C - - - - - 0x0104FC 04:84EC: 20 F8 E9

			LDA updateSubBankA				;C - - - - - 0x0104FF 04:84EF: A5 18
			STA nmiPrgBankA				;C - - - - - 0x010501 04:84F1: 85 51
			LDA updateSub				;C - - - - - 0x010503 04:84F3: A5 19
			STA nmiBankedSub				;C - - - - - 0x010505 04:84F5: 85 16
			LDA updateSub+1				;C - - - - - 0x010507 04:84F7: A5 1A
			STA nmiBankedSub+1				;C - - - - - 0x010509 04:84F9: 85 17
CODE_0884FB:
	LDA globalTimer				;C - - - - - 0x01050B 04:84FB: A5 14
	AND #$01					;C - - - - - 0x01050D 04:84FD: 29 01
	BNE CODE_088504				;C - - - - - 0x01050F 04:84FF: D0 03
		JSR AnimateNonBubbles				;C - - - - - 0x010511 04:8501: 20 5C EE
CODE_088504:
	JSR DrawObjects				;C - - - - - 0x010514 04:8504: 20 E2 EE
	RTS							;C - - - - - 0x010517 04:8507: 60

CODE_088508:
	LDY bubblesLifespanLevel				;C - - - - - 0x010518 04:8508: A4 DA
	LDA BubbleLifespans,Y			;C - - - - - 0x01051A 04:850A: B9 5D 85
	STA bubbleLifespan				;C - - - - - 0x01051D 04:850D: 8D 1C 05
	LDA #$01					;C - - - - - 0x010520 04:8510: A9 01
	STA roundSkelDelay				;C - - - - - 0x010522 04:8512: 85 6D
	LDX #$00					;C - - - - - 0x010524 04:8514: A2 00
CODE_088516:
	INX							;C - - - - - 0x010526 04:8516: E8
	LDA DATA_088542,X			;C - - - - - 0x010527 04:8517: BD 42 85
	CMP currentRound				;C - - - - - 0x01052A 04:851A: C5 D8
	BNE CODE_088528				;C - - - - - 0x01052C 04:851C: D0 0A
		LDA #$00					;C - - - - - 0x01052E 04:851E: A9 00
		STA roundSkelDelay				;C - - - - - 0x010530 04:8520: 85 6D
		STA roundFlags				;C - - - - - 0x010532 04:8522: 8D 71 04
		JMP CODE_08852C				;C - - - - - 0x010535 04:8525: 4C 2C 85
CODE_088528:
	CPX #$0B					;C - - - - - 0x010538 04:8528: E0 0B
	BCC CODE_088516				;C - - - - - 0x01053A 04:852A: 90 EA
CODE_08852C:
	LDA roundSkelDelay				;C - - - - - 0x01053C 04:852C: A5 6D
	STA ram_053E				;C - - - - - 0x01053E 04:852E: 8D 3E 05
	BEQ CODE_088541				;C - - - - - 0x010541 04:8531: F0 0E
		LDA powerUps				;C - - - - - 0x010543 04:8533: A5 DE
		AND #POWERUP_BIG_TRIANGLE					;C - - - - - 0x010545 04:8535: 29 08
		BEQ CODE_08853B				;C - - - - - 0x010547 04:8537: F0 02
			;Extra time before Skel-Monsta
			LDA #5					;C - - - - - 0x010549 04:8539: A9 05
	CODE_08853B:
		CLC							;C - - - - - 0x01054B 04:853B: 18
		ADC DATA_08854D,Y			;C - - - - - 0x01054C 04:853C: 79 4D 85
		STA roundSkelDelay				;C - - - - - 0x01054F 04:853F: 85 6D
CODE_088541:
	RTS							;C - - - - - 0x010551 04:8541: 60

DATA_088542:
	.byte 0					;- - - - - - 0x010552 04:8542: 00
	.byte 10					;- D 0 - - - 0x010553 04:8543: 0A
	.byte 20					;- D 0 - - - 0x010554 04:8544: 14
	.byte 30					;- D 0 - - - 0x010555 04:8545: 1E
	.byte 40					;- D 0 - - - 0x010556 04:8546: 28
	.byte 50					;- D 0 - - - 0x010557 04:8547: 32
	.byte 60					;- D 0 - - - 0x010558 04:8548: 3C
	.byte 70					;- D 0 - - - 0x010559 04:8549: 46
	.byte 79					;- D 0 - - - 0x01055A 04:854A: 4F
	.byte 80					;- D 0 - - - 0x01055B 04:854B: 50
	.byte $FF					;- D 0 - - - 0x01055C 04:854C: FF
DATA_08854D:
	.byte $0A					;- D 0 - - - 0x01055D 04:854D: 0A
	.byte $0A					;- D 0 - - - 0x01055E 04:854E: 0A
	.byte $0A					;- D 0 - - - 0x01055F 04:854F: 0A
	.byte $0A					;- D 0 - - - 0x010560 04:8550: 0A
	.byte $0A					;- D 0 - - - 0x010561 04:8551: 0A
	.byte $0A					;- D 0 - - - 0x010562 04:8552: 0A
	.byte $0A					;- D 0 - - - 0x010563 04:8553: 0A
	.byte $0A					;- D 0 - - - 0x010564 04:8554: 0A
	.byte $08					;- D 0 - - - 0x010565 04:8555: 08
	.byte $07					;- D 0 - - - 0x010566 04:8556: 07
	.byte $06					;- D 0 - - - 0x010567 04:8557: 06
	.byte $05					;- D 0 - - - 0x010568 04:8558: 05
	.byte $04					;- D 0 - - - 0x010569 04:8559: 04
	.byte $03					;- D 0 - - - 0x01056A 04:855A: 03
	.byte $02					;- D 0 - - - 0x01056B 04:855B: 02
	.byte $01					;- D 0 - - - 0x01056C 04:855C: 01
BubbleLifespans:
	.byte $80					;- D 0 - - - 0x01056D 04:855D: 80
	.byte $70					;- D 0 - - - 0x01056E 04:855E: 70
	.byte $60					;- D 0 - - - 0x01056F 04:855F: 60
	.byte $50					;- D 0 - - - 0x010570 04:8560: 50
	.byte $40					;- D 0 - - - 0x010571 04:8561: 40
	.byte $30					;- D 0 - - - 0x010572 04:8562: 30
	.byte $20					;- D 0 - - - 0x010573 04:8563: 20
	.byte $10					;- D 0 - - - 0x010574 04:8564: 10
	.byte $10					;- D 0 - - - 0x010575 04:8565: 10
	.byte $10					;- D 0 - - - 0x010576 04:8566: 10
	.byte $10					;- D 0 - - - 0x010577 04:8567: 10
	.byte $10					;- D 0 - - - 0x010578 04:8568: 10
	.byte $10					;- D 0 - - - 0x010579 04:8569: 10
	.byte $10					;- D 0 - - - 0x01057A 04:856A: 10
	.byte $10					;- D 0 - - - 0x01057B 04:856B: 10
	.byte $10					;- D 0 - - - 0x01057C 04:856C: 10

CODE_08856D:
	LDA roundNumberDuration				;C - - - - - 0x01057D 04:856D: AD 73 04
	BNE CODE_0885CE				;C - - - - - 0x010580 04:8570: D0 5C

	LDA sprPrgBank				;C - - - - - 0x010582 04:8572: AD 61 05
	STA announceOrigSprBank				;C - - - - - 0x010585 04:8575: 8D 62 05
	LDA #ANNOUNCE_ROUND					;C - - - - - 0x010588 04:8578: A9 00
	STA scratch0				;C - - - - - 0x01058A 04:857A: 85 00
	LDA #OSLOT_ENEMY					;C - - - - - 0x01058C 04:857C: A9 09
	STA scratch4				;C - - - - - 0x01058E 04:857E: 85 04
	JSR SpawnAnnounceObj				;C - - - - - 0x010590 04:8580: 20 76 9C

.ifndef REGION_JP
	LDA roundSkelDelay				;C - - - - - 0x010593 04:8583: A5 6D
	BEQ CODE_088599				;C - - - - - 0x010595 04:8585: F0 12
.endif

	LDA powerUps				;C - - - - - 0x010597 04:8587: A5 DE
	AND #POWERUP_BIG_BELL					;C - - - - - 0x010599 04:8589: 29 04
	BEQ CODE_088599				;C - - - - - 0x01059B 04:858B: F0 0C

	LDA skelMonstaWarnings				;C - - - - - 0x01059D 04:858D: AD 40 05
	CMP #6					;C - - - - - 0x0105A0 04:8590: C9 06
	BCC CODE_088599				;C - - - - - 0x0105A2 04:8592: 90 05
		;Unreached
		LDA #snBigBell_ID					;- - - - - - 0x0105A4 04:8594: A9
		STA a:soundTrigger			;- - - - - - 0x0105A6 04:8596: 8D
	CODE_088599:
		LDA #$98					;C - - - - - 0x0105A9 04:8599: A9 98
		STA scratch0				;C - - - - - 0x0105AB 04:859B: 85 00
		LDA #$78					;C - - - - - 0x0105AD 04:859D: A9 78
		STA scratch1				;C - - - - - 0x0105AF 04:859F: 85 01
		INC scratch4				;C - - - - - 0x0105B1 04:85A1: E6 04
		LDX #$00					;C - - - - - 0x0105B3 04:85A3: A2 00
		LDA currentRound				;C - - - - - 0x0105B5 04:85A5: A5 D8
	CODE_0885A7:
		CMP #$0A					;C - - - - - 0x0105B7 04:85A7: C9 0A
		BCC CODE_0885B2				;C - - - - - 0x0105B9 04:85A9: 90 07
			INX							;C - - - - - 0x0105BB 04:85AB: E8
			SEC							;C - - - - - 0x0105BC 04:85AC: 38
			SBC #$0A					;C - - - - - 0x0105BD 04:85AD: E9 0A
			JMP CODE_0885A7				;C - - - - - 0x0105BF 04:85AF: 4C A7 85
	CODE_0885B2:
		STA scratch3				;C - - - - - 0x0105C2 04:85B2: 85 03
		STX scratch2				;C - - - - - 0x0105C4 04:85B4: 86 02
		JSR CODE_0885FE				;C - - - - - 0x0105C6 04:85B6: 20 FE 85
		INC scratch4				;C - - - - - 0x0105C9 04:85B9: E6 04
		LDA scratch0				;C - - - - - 0x0105CB 04:85BB: A5 00
		CLC							;C - - - - - 0x0105CD 04:85BD: 18
		ADC #$08					;C - - - - - 0x0105CE 04:85BE: 69 08
		STA scratch0				;C - - - - - 0x0105D0 04:85C0: 85 00
		LDA scratch3				;C - - - - - 0x0105D2 04:85C2: A5 03
		STA scratch2				;C - - - - - 0x0105D4 04:85C4: 85 02
		JSR CODE_0885FE				;C - - - - - 0x0105D6 04:85C6: 20 FE 85
		LDA #$3C					;C - - - - - 0x0105D9 04:85C9: A9 3C
		STA roundNumberDuration				;C - - - - - 0x0105DB 04:85CB: 8D 73 04
CODE_0885CE:
	JSR AnimateNonBubbles				;C - - - - - 0x0105DE 04:85CE: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x0105E1 04:85D1: 20 E2 EE
	DEC roundNumberDuration				;C - - - - - 0x0105E4 04:85D4: CE 73 04
	BNE CODE_0885FD				;C - - - - - 0x0105E7 04:85D7: D0 24
		LDA announceOrigSprBank				;C - - - - - 0x0105E9 04:85D9: AD 62 05
		STA sprPrgBank				;C - - - - - 0x0105EC 04:85DC: 8D 61 05
		LDA #.BANK(LoadEnemyPalettes)					;C - - - - - 0x0105EF 04:85DF: A9 09
		STA nmiPrgBankA				;C - - - - - 0x0105F1 04:85E1: 85 51

		LDA #.LOBYTE(LoadEnemyPalettes)	;C - - - - - 0x0105F3 04:85E3: A9 29
		STA nmiBankedSub			;C - - - - - 0x0105F5 04:85E5: 85 16
		LDA #.HIBYTE(LoadEnemyPalettes)	;C - - - - - 0x0105F7 04:85E7: A9 8D
		STA nmiBankedSub+1			;C - - - - - 0x0105F9 04:85E9: 85 17

		LDA powerUps				;C - - - - - 0x0105FB 04:85EB: A5 DE
		AND #POWERUP_BIG_DIAMOND					;C - - - - - 0x0105FD 04:85ED: 29 20
		BEQ CODE_0885FD				;C - - - - - 0x0105FF 04:85EF: F0 0C
			;Unreached
			LDA roundSkelDelay				;- - - - - - 0x010601 04:85F1: A5
			BEQ CODE_0885FD				;- - - - - - 0x010603 04:85F3: F0
				LDA roundFlags				;- - - - - - 0x010605 04:85F5: AD
				ORA #RFLAG_MULTI_REWARD					;- - - - - - 0x010608 04:85F8: 09
				STA roundFlags				;- - - - - - 0x01060A 04:85FA: 8D
CODE_0885FD:
	RTS							;C - - - - - 0x01060D 04:85FD: 60

CODE_0885FE:
	LDX scratch4				;C - - - - - 0x01060E 04:85FE: A6 04
	LDA #$01					;C - - - - - 0x010610 04:8600: A9 01
	STA objState,X				;C - - - - - 0x010612 04:8602: 9D 63 05
	LDA scratch0				;C - - - - - 0x010615 04:8605: A5 00
	STA objX,X				;C - - - - - 0x010617 04:8607: 9D B3 05
	LDA scratch1				;C - - - - - 0x01061A 04:860A: A5 01
	STA objY,X				;C - - - - - 0x01061C 04:860C: 9D 8B 05
	LDA #.LOBYTE(anAnnounce0_ID)					;C - - - - - 0x01061F 04:860F: A9 49
	CLC							;C - - - - - 0x010621 04:8611: 18
	ADC scratch2				;C - - - - - 0x010622 04:8612: 65 02
	STA objAnim,X				;C - - - - - 0x010624 04:8614: 9D 7B 06
	LDA #.HIBYTE(anAnnounce0_ID)					;C - - - - - 0x010627 04:8617: A9 01
	STA objAnimHI,X				;C - - - - - 0x010629 04:8619: 9D 1B 07
	ADC #$00					;C - - - - - 0x01062C 04:861C: 69 00
	LDA #$03					;C - - - - - 0x01062E 04:861E: A9 03
	STA objChrSlot,X				;C - - - - - 0x010630 04:8620: 9D 2B 06
	INY							;C - - - - - 0x010633 04:8623: C8
	LDA #$03					;C - - - - - 0x010634 04:8624: A9 03
	STA objAttr,X				;C - - - - - 0x010636 04:8626: 9D F3 06
	LDA #$00					;C - - - - - 0x010639 04:8629: A9 00
	STA objAnimProgress,X				;C - - - - - 0x01063B 04:862B: 9D CB 06
	STA objAnimTimer,X				;C - - - - - 0x01063E 04:862E: 9D A3 06
	RTS							;C - - - - - 0x010641 04:8631: 60

CODE_088632:
	LDA #.LOBYTE(ColorBufferToVRAM)	;C - - - - - 0x010642 04:8632: A9 8A
	STA nmiUnbankedSub			;C - - - - - 0x010644 04:8634: 85 35
	LDA #.HIBYTE(ColorBufferToVRAM)	;C - - - - - 0x010646 04:8636: A9 E3
	STA nmiUnbankedSub+1		;C - - - - - 0x010648 04:8638: 85 36
	LDA #.BANK(*)					;C - - - - - 0x01064A 04:863A: A9 08
	STA nmiPrgBankA				;C - - - - - 0x01064C 04:863C: 85 51
	LDA #$00					;C - - - - - 0x01064E 04:863E: A9 00
	STA scratch0				;C - - - - - 0x010650 04:8640: 85 00
	JSR CODE_088652				;C - - - - - 0x010652 04:8642: 20 52 86
	RTS							;C - - - - - 0x010655 04:8645: 60

CODE_088646:
	LDA #$08					;C - - - - - 0x010656 04:8646: A9 08
	STA nmiPrgBankA				;C - - - - - 0x010658 04:8648: 85 51
	LDA #$15					;C - - - - - 0x01065A 04:864A: A9 15
	STA scratch0				;C - - - - - 0x01065C 04:864C: 85 00
	JSR CODE_088678				;C - - - - - 0x01065E 04:864E: 20 78 86
	RTS							;C - - - - - 0x010661 04:8651: 60

CODE_088652:
	LDA currentRound				;C - - - - - 0x010662 04:8652: A5 D8
	CMP #20					;C - - - - - 0x010664 04:8654: C9 14
	BEQ CODE_088664				;C - - - - - 0x010666 04:8656: F0 0C
	CMP #40					;C - - - - - 0x010668 04:8658: C9 28
	BEQ CODE_088664				;C - - - - - 0x01066A 04:865A: F0 08
	CMP #60					;C - - - - - 0x01066C 04:865C: C9 3C
	BEQ CODE_088664				;C - - - - - 0x01066E 04:865E: F0 04
	CMP #79					;C - - - - - 0x010670 04:8660: C9 4F
	BNE CODE_088674				;C - - - - - 0x010672 04:8662: D0 10
CODE_088664:
	LDA #.BANK(*)					;C - - - - - 0x010674 04:8664: A9 08
	STA nmiPrgBankA				;C - - - - - 0x010676 04:8666: 85 51
	LDA #$00					;C - - - - - 0x010678 04:8668: A9 00
	STA scratch0				;C - - - - - 0x01067A 04:866A: 85 00

	LDA powerUps				;C - - - - - 0x01067C 04:866C: A5 DE
	AND #~POWERUP_CANDY					;C - - - - - 0x01067E 04:866E: 29 FE
	ORA #POWERUP_BOSS_BONUS					;C - - - - - 0x010680 04:8670: 09 80
	STA powerUps				;C - - - - - 0x010682 04:8672: 85 DE
CODE_088674:
	JSR CODE_088678				;C - - - - - 0x010684 04:8674: 20 78 86
	RTS							;C - - - - - 0x010687 04:8677: 60

CODE_088678:
	JSR CODE_0FFE9A				;C - - - - - 0x010688 04:8678: 20 9A FE

	LDA #FADE_OUT					;C - - - - - 0x01068B 04:867B: A9 00
	STA fadeMode				;C - - - - - 0x01068D 04:867D: 8D 53 05
	LDA #$18					;C - - - - - 0x010690 04:8680: A9 18
	STA fadeUnk0556				;C - - - - - 0x010692 04:8682: 8D 56 05
	LDA #$03					;C - - - - - 0x010695 04:8685: A9 03
	STA fadeSpeedMask				;C - - - - - 0x010697 04:8687: 8D 57 05
	LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x01069A 04:868A: A9 00
	STA fadeColorsAdr				;C - - - - - 0x01069C 04:868C: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x01069F 04:868F: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x0106A1 04:8691: 8D 5B 05
	LDA #4					;C - - - - - 0x0106A4 04:8694: A9 04
	STA fadePasses				;C - - - - - 0x0106A6 04:8696: 8D 54 05
	LDA #16					;C - - - - - 0x0106A9 04:8699: A9 10
	STA fadeColorsAmount				;C - - - - - 0x0106AB 04:869B: 8D 55 05

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x0106AE 04:869E: A9 50
	STA nmiBankedSub			;C - - - - - 0x0106B0 04:86A0: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x0106B2 04:86A2: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x0106B4 04:86A4: 85 17
	RTS							;C - - - - - 0x0106B6 04:86A6: 60

RemoteEnemyUpdateSubs:

SpikeBallUpdate:
	DEC ram_00CB				;C - - - - - 0x0106B7 04:86A7: C6 CB
	LDA #$00					;C - - - - - 0x0106B9 04:86A9: A9 00
	STA ram_04AF,X				;C - - - - - 0x0106BB 04:86AB: 9D AF 04
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x0106BE 04:86AE: BD 6C 05
	CMP #$01					;C - - - - - 0x0106C1 04:86B1: C9 01
	BNE CODE_088704				;C - - - - - 0x0106C3 04:86B3: D0 4F
		LDA #$03					;C - - - - - 0x0106C5 04:86B5: A9 03
		STA scratch1				;C - - - - - 0x0106C7 04:86B7: 85 01
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0106C9 04:86B9: BD 94 05
		SEC							;C - - - - - 0x0106CC 04:86BC: 38
		SBC objY				;C - - - - - 0x0106CD 04:86BD: ED 8B 05
		BCS CODE_0886C9				;C - - - - - 0x0106D0 04:86C0: B0 07
			EOR #$FF					;C - - - - - 0x0106D2 04:86C2: 49 FF
			CLC							;C - - - - - 0x0106D4 04:86C4: 18
			ADC #$01					;C - - - - - 0x0106D5 04:86C5: 69 01
			INC scratch1				;C - - - - - 0x0106D7 04:86C7: E6 01
	CODE_0886C9:
		CMP #$10					;C - - - - - 0x0106D9 04:86C9: C9 10
		BCS CODE_0886D7				;C - - - - - 0x0106DB 04:86CB: B0 0A
			LDA #$02					;C - - - - - 0x0106DD 04:86CD: A9 02
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0106DF 04:86CF: 9D 6C 05
			LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x0106E2 04:86D2: BD BC 05
			STA ram_0084,X				;C - - - - - 0x0106E5 04:86D5: 95 84
	CODE_0886D7:
		LDA #$01					;C - - - - - 0x0106E7 04:86D7: A9 01
		STA scratch0				;C - - - - - 0x0106E9 04:86D9: 85 00
		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x0106EB 04:86DB: BD BC 05
		SEC							;C - - - - - 0x0106EE 04:86DE: 38
		SBC objX				;C - - - - - 0x0106EF 04:86DF: ED B3 05
		BCS CODE_0886EB				;C - - - - - 0x0106F2 04:86E2: B0 07
			INC scratch0				;C - - - - - 0x0106F4 04:86E4: E6 00
			EOR #$FF					;C - - - - - 0x0106F6 04:86E6: 49 FF
			CLC							;C - - - - - 0x0106F8 04:86E8: 18
			ADC #$01					;C - - - - - 0x0106F9 04:86E9: 69 01
	CODE_0886EB:
		CMP #$10					;C - - - - - 0x0106FB 04:86EB: C9 10
		BCS CODE_0886F9				;C - - - - - 0x0106FD 04:86ED: B0 0A
			LDA scratch1				;C - - - - - 0x0106FF 04:86EF: A5 01
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x010701 04:86F1: 9D 6C 05
			LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x010704 04:86F4: BD 94 05
			STA ram_0084,X				;C - - - - - 0x010707 04:86F7: 95 84
	CODE_0886F9:
		LDA scratch0				;C - - - - - 0x010709 04:86F9: A5 00
		STA enemyDir,X				;C - - - - - 0x01070B 04:86FB: 95 A2
		LDA #$1B					;C - - - - - 0x01070D 04:86FD: A9 1B
		STA ram_00B6,X				;C - - - - - 0x01070F 04:86FF: 95 B6
		JMP CODE_088792				;C - - - - - 0x010711 04:8701: 4C 92 87
CODE_088704:
	CMP #$02					;C - - - - - 0x010714 04:8704: C9 02
	BNE CODE_08871A				;C - - - - - 0x010716 04:8706: D0 12
		LDY enemyDir,X				;C - - - - - 0x010718 04:8708: B4 A2
		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01071A 04:870A: BD BC 05
		STA scratch0				;C - - - - - 0x01071D 04:870D: 85 00
		JSR CODE_088793				;C - - - - - 0x01071F 04:870F: 20 93 87
		LDA scratch0				;C - - - - - 0x010722 04:8712: A5 00
		STA objX+OSLOT_ENEMY,X				;C - - - - - 0x010724 04:8714: 9D BC 05
		JMP CODE_088792				;C - - - - - 0x010727 04:8717: 4C 92 87
CODE_08871A:
	CMP #$03					;C - - - - - 0x01072A 04:871A: C9 03
	BNE CODE_08872F				;C - - - - - 0x01072C 04:871C: D0 11
		;Unreached
		TAY							;- - - - - - 0x01072E 04:871E: A8
		LDA objY+OSLOT_ENEMY,X				;- - - - - - 0x01072F 04:871F: BD
		STA scratch0				;- - - - - - 0x010732 04:8722: 85
		JSR CODE_088793				;- - - - - - 0x010734 04:8724: 20
		LDA scratch0				;- - - - - - 0x010737 04:8727: A5
		STA objY+OSLOT_ENEMY,X					;- - - - - - 0x010739 04:8729: 9D
		JMP CODE_088792				;- - - - - - 0x01073C 04:872C: 4C
CODE_08872F:
	CMP #$04					;C - - - - - 0x01073F 04:872F: C9 04
	BNE CODE_088744				;C - - - - - 0x010741 04:8731: D0 11
	TAY							;C - - - - - 0x010743 04:8733: A8
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x010744 04:8734: BD 94 05
	STA scratch0				;C - - - - - 0x010747 04:8737: 85 00
	JSR CODE_088793				;C - - - - - 0x010749 04:8739: 20 93 87
	LDA scratch0				;C - - - - - 0x01074C 04:873C: A5 00
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x01074E 04:873E: 9D 94 05
	JMP CODE_088792				;C - - - - - 0x010751 04:8741: 4C 92 87
CODE_088744:
	CMP #$05					;C - - - - - 0x010754 04:8744: C9 05
	BNE CODE_08876B				;C - - - - - 0x010756 04:8746: D0 23
		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x010758 04:8748: BD BC 05
		CMP ram_0084,X				;C - - - - - 0x01075B 04:874B: D5 84
		BNE CODE_088757				;C - - - - - 0x01075D 04:874D: D0 08
			LDA #$01					;C - - - - - 0x01075F 04:874F: A9 01
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x010761 04:8751: 9D 6C 05
			JMP CODE_088792				;C - - - - - 0x010764 04:8754: 4C 92 87
	CODE_088757:
		BCC CODE_088762				;C - - - - - 0x010767 04:8757: 90 09
			SEC							;C - - - - - 0x010769 04:8759: 38
			SBC #$01					;C - - - - - 0x01076A 04:875A: E9 01
			STA objX+OSLOT_ENEMY,X				;C - - - - - 0x01076C 04:875C: 9D BC 05
			JMP CODE_088792				;C - - - - - 0x01076F 04:875F: 4C 92 87
	CODE_088762:
		CLC							;C - - - - - 0x010772 04:8762: 18
		ADC #$01					;C - - - - - 0x010773 04:8763: 69 01
		STA objX+OSLOT_ENEMY,X				;C - - - - - 0x010775 04:8765: 9D BC 05
		JMP CODE_088792				;C - - - - - 0x010778 04:8768: 4C 92 87
CODE_08876B:
	CMP #$06					;C - - - - - 0x01077B 04:876B: C9 06
	BNE CODE_088792				;C - - - - - 0x01077D 04:876D: D0 23
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01077F 04:876F: BD 94 05
		CMP ram_0084,X				;C - - - - - 0x010782 04:8772: D5 84
		BNE CODE_08877E				;C - - - - - 0x010784 04:8774: D0 08
			LDA #$01					;C - - - - - 0x010786 04:8776: A9 01
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x010788 04:8778: 9D 6C 05
			JMP CODE_088792				;C - - - - - 0x01078B 04:877B: 4C 92 87
	CODE_08877E:
		BCC DATA_088789				;C - - - - - 0x01078E 04:877E: 90 09
			SEC							;C - - - - - 0x010790 04:8780: 38
			SBC #$01					;C - - - - - 0x010791 04:8781: E9 01
			STA objY+OSLOT_ENEMY,X				;C - - - - - 0x010793 04:8783: 9D 94 05
			JMP CODE_088792				;C - - - - - 0x010796 04:8786: 4C 92 87
		DATA_088789:
			;Unreached
			CLC							;- - - - - - 0x010799 04:8789: 18
			ADC #$01					;- - - - - - 0x01079A 04:878A: 69
			STA objY+OSLOT_ENEMY,X				;- - - - - - 0x01079C 04:878C: 9D
			JMP CODE_088792				;- - - - - - 0x01079F 04:878F: 4C
CODE_088792:
	RTS							;C - - - - - 0x0107A2 04:8792: 60

CODE_088793:
	DEC ram_00B6,X				;C - - - - - 0x0107A3 04:8793: D6 B6
	BNE CODE_0887AE				;C - - - - - 0x0107A5 04:8795: D0 17
		LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x0107A7 04:8797: BD 6C 05
		CMP #$02					;C - - - - - 0x0107AA 04:879A: C9 02
		BNE CODE_0887A6				;C - - - - - 0x0107AC 04:879C: D0 08
			LDA #$05					;C - - - - - 0x0107AE 04:879E: A9 05
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0107B0 04:87A0: 9D 6C 05
			JMP CODE_0887C5				;C - - - - - 0x0107B3 04:87A3: 4C C5 87
	CODE_0887A6:
		LDA #$06					;C - - - - - 0x0107B6 04:87A6: A9 06
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0107B8 04:87A8: 9D 6C 05
		JMP CODE_0887C5				;C - - - - - 0x0107BB 04:87AB: 4C C5 87
CODE_0887AE:
	LDA scratch0				;C - - - - - 0x0107BE 04:87AE: A5 00
	CLC							;C - - - - - 0x0107C0 04:87B0: 18
	ADC DATA_0887CB,Y			;C - - - - - 0x0107C1 04:87B1: 79 CB 87
	CMP #$20					;C - - - - - 0x0107C4 04:87B4: C9 20
	BCC CODE_0887BC				;C - - - - - 0x0107C6 04:87B6: 90 04
		CMP #$E0					;C - - - - - 0x0107C8 04:87B8: C9 E0
		BCC CODE_0887C3				;C - - - - - 0x0107CA 04:87BA: 90 07
CODE_0887BC:
	LDA #$01					;C - - - - - 0x0107CC 04:87BC: A9 01
	STA ram_00B6,X				;C - - - - - 0x0107CE 04:87BE: 95 B6
	LDA DATA_0887C6,Y			;C - - - - - 0x0107D0 04:87C0: B9 C6 87
CODE_0887C3:
	STA scratch0				;C - - - - - 0x0107D3 04:87C3: 85 00
CODE_0887C5:
	RTS							;C - - - - - 0x0107D5 04:87C5: 60

DATA_0887C6:
	.byte $00					;- - - - - - 0x0107D6 04:87C6: 00
	.byte $20					;- D 0 - - - 0x0107D7 04:87C7: 20
	.byte $E0					;- D 0 - - - 0x0107D8 04:87C8: E0
	.byte $20					;- - - - - - 0x0107D9 04:87C9: 20
	.byte $E0					;- - - - - - 0x0107DA 04:87CA: E0
DATA_0887CB:
	.byte $00					;- - - - - - 0x0107DB 04:87CB: 00
	.byte $FA					;- D 0 - - - 0x0107DC 04:87CC: FA
	.byte $06					;- D 0 - - - 0x0107DD 04:87CD: 06
	.byte $FA					;- - - - - - 0x0107DE 04:87CE: FA
	.byte $06					;- D 0 - - - 0x0107DF 04:87CF: 06

RewardUpdate:
	DEC untrappedEnemies				;C - - - - - 0x0107E0 04:87D0: C6 CC
	LDA #$02					;C - - - - - 0x0107E2 04:87D2: A9 02
	STA scratch1				;C - - - - - 0x0107E4 04:87D4: 85 01
	LDA ram_00CD				;C - - - - - 0x0107E6 04:87D6: A5 CD
	CMP #$80					;C - - - - - 0x0107E8 04:87D8: C9 80
	BCC CODE_0887E4				;C - - - - - 0x0107EA 04:87DA: 90 08
		AND #$07					;C - - - - - 0x0107EC 04:87DC: 29 07
		EOR #$FF					;C - - - - - 0x0107EE 04:87DE: 49 FF
		STA scratch1				;C - - - - - 0x0107F0 04:87E0: 85 01
		INC scratch1				;C - - - - - 0x0107F2 04:87E2: E6 01
CODE_0887E4:
	LDA scratch1				;C - - - - - 0x0107F4 04:87E4: A5 01
	STA ram_00D5				;C - - - - - 0x0107F6 04:87E6: 85 D5
	DEC ram_00B6,X				;C - - - - - 0x0107F8 04:87E8: D6 B6
	BNE CODE_0887F3				;C - - - - - 0x0107FA 04:87EA: D0 07
		LDA #$00					;C - - - - - 0x0107FC 04:87EC: A9 00
		STA enemyType,X				;C - - - - - 0x0107FE 04:87EE: 95 98
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x010800 04:87F0: 9D 6C 05
CODE_0887F3:
	RTS							;C - - - - - 0x010803 04:87F3: 60

RuckusUpdate:
	LDA #.BANK(DATA_06BD4B)					;C - - - - - 0x010804 04:87F4: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x010806 04:87F6: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x010808 04:87F8: 20 56 FF
.endif

	LDA #$00					;C - - - - - 0x01080B 04:87FB: A9 00
	STA ram_04AD				;C - - - - - 0x01080D 04:87FD: 8D AD 04
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x010810 04:8800: AD 6C 05
	CMP #$C0					;C - - - - - 0x010813 04:8803: C9 C0
	BCC CODE_08882A				;C - - - - - 0x010815 04:8805: 90 23
		AND #$3F					;C - - - - - 0x010817 04:8807: 29 3F
		CMP #$04					;C - - - - - 0x010819 04:8809: C9 04
		BCS CODE_08882A				;C - - - - - 0x01081B 04:880B: B0 1D
			LDA #$04					;C - - - - - 0x01081D 04:880D: A9 04
			STA objState+OSLOT_ENEMY				;C - - - - - 0x01081F 04:880F: 8D 6C 05
			LDA #$00					;C - - - - - 0x010822 04:8812: A9 00
			STA ram_00B7				;C - - - - - 0x010824 04:8814: 85 B7
			LDA #snEnemyHurt_ID					;C - - - - - 0x010826 04:8816: A9 2B
			STA a:soundTrigger				;C - - - - - 0x010828 04:8818: 8D E1 00
			INC enemyHits				;C - - - - - 0x01082B 04:881B: EE BE 04
			LDA enemyHits				;C - - - - - 0x01082E 04:881E: AD BE 04
			CMP #$0F					;C - - - - - 0x010831 04:8821: C9 0F
			BCC CODE_08882A				;C - - - - - 0x010833 04:8823: 90 05
				LDA #$05					;C - - - - - 0x010835 04:8825: A9 05
				STA objState+OSLOT_ENEMY				;C - - - - - 0x010837 04:8827: 8D 6C 05
CODE_08882A:
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x01083A 04:882A: AD 6C 05
	AND #$3F					;C - - - - - 0x01083D 04:882D: 29 3F
	STA objState+OSLOT_ENEMY				;C - - - - - 0x01083F 04:882F: 8D 6C 05
	JSR CODE_08886E				;C - - - - - 0x010842 04:8832: 20 6E 88
	LDA objY				;C - - - - - 0x010845 04:8835: AD 8B 05
	CMP #$08					;C - - - - - 0x010848 04:8838: C9 08
	BCS CODE_088841				;C - - - - - 0x01084A 04:883A: B0 05
		LDA #$08					;C - - - - - 0x01084C 04:883C: A9 08
		STA objY				;C - - - - - 0x01084E 04:883E: 8D 8B 05
CODE_088841:
	CMP #$E8					;C - - - - - 0x010851 04:8841: C9 E8
	BCC CODE_088857				;C - - - - - 0x010853 04:8843: 90 12
		LDA #$00					;C - - - - - 0x010855 04:8845: A9 00
		STA objY				;C - - - - - 0x010857 04:8847: 8D 8B 05
		LDA #$A0					;C - - - - - 0x01085A 04:884A: A9 A0
		STA objX				;C - - - - - 0x01085C 04:884C: 8D B3 05
		LDA #$FF					;C - - - - - 0x01085F 04:884F: A9 FF
		STA wideHScroll				;C - - - - - 0x010861 04:8851: 8D 61 07
		JSR CODE_088AA2				;C - - - - - 0x010864 04:8854: 20 A2 8A
CODE_088857:
	LDA ram_00B2				;C - - - - - 0x010867 04:8857: A5 B2
	CMP #$E0					;C - - - - - 0x010869 04:8859: C9 E0
	BCC CODE_08886D				;C - - - - - 0x01086B 04:885B: 90 10
		LDA #$10					;C - - - - - 0x01086D 04:885D: A9 10
		STA ram_00B2				;C - - - - - 0x01086F 04:885F: 85 B2
		LDA #$01					;C - - - - - 0x010871 04:8861: A9 01
		STA ram_00B1				;C - - - - - 0x010873 04:8863: 85 B1
		LDA #$A0					;C - - - - - 0x010875 04:8865: A9 A0
		STA ram_00B0				;C - - - - - 0x010877 04:8867: 85 B0
		LDA #$E6					;C - - - - - 0x010879 04:8869: A9 E6
		STA ram_00B6				;C - - - - - 0x01087B 04:886B: 85 B6
CODE_08886D:
	RTS							;C - - - - - 0x01087D 04:886D: 60

CODE_08886E:
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x01087E 04:886E: AD 6C 05
	CMP #$01					;C - - - - - 0x010881 04:8871: C9 01
	BNE CODE_088891				;C - - - - - 0x010883 04:8873: D0 1C
		LDA #$02					;C - - - - - 0x010885 04:8875: A9 02
		STA objState+OSLOT_ENEMY				;C - - - - - 0x010887 04:8877: 8D 6C 05
		LDA #$01					;C - - - - - 0x01088A 04:887A: A9 01
		STA enemyDir				;C - - - - - 0x01088C 04:887C: 85 A2
		LDA objX+OSLOT_ENEMY				;C - - - - - 0x01088E 04:887E: AD BC 05
		STA ram_00B0				;C - - - - - 0x010891 04:8881: 85 B0
		LDA objY+OSLOT_ENEMY				;C - - - - - 0x010893 04:8883: AD 94 05
		STA ram_00B2				;C - - - - - 0x010896 04:8886: 85 B2
		LDA #$00					;C - - - - - 0x010898 04:8888: A9 00
		STA ram_00B1				;C - - - - - 0x01089A 04:888A: 85 B1
		STA ram_00B3				;C - - - - - 0x01089C 04:888C: 85 B3
		JMP CODE_0889BE				;C - - - - - 0x01089E 04:888E: 4C BE 89
CODE_088891:
	CMP #$02					;C - - - - - 0x0108A1 04:8891: C9 02
	BNE CODE_0888A2				;C - - - - - 0x0108A3 04:8893: D0 0D
		JSR CODE_08896E				;C - - - - - 0x0108A5 04:8895: 20 6E 89
		LDA ram_00AF				;C - - - - - 0x0108A8 04:8898: A5 AF
		BNE CODE_08889F				;C - - - - - 0x0108AA 04:889A: D0 03
			JSR CODE_088A71				;C - - - - - 0x0108AC 04:889C: 20 71 8A
	CODE_08889F:
		JMP CODE_0889BE				;C - - - - - 0x0108AF 04:889F: 4C BE 89
CODE_0888A2:
	CMP #$03					;C - - - - - 0x0108B2 04:88A2: C9 03
	BNE CODE_0888F2				;C - - - - - 0x0108B4 04:88A4: D0 4C

	LDA objY+OSLOT_ENEMY				;C - - - - - 0x0108B6 04:88A6: AD 94 05
	CMP #$E8					;C - - - - - 0x0108B9 04:88A9: C9 E8
	BCS CODE_0888E3				;C - - - - - 0x0108BB 04:88AB: B0 36
		STA ram_00B3				;C - - - - - 0x0108BD 04:88AD: 85 B3
		INC ram_00B3				;C - - - - - 0x0108BF 04:88AF: E6 B3
		INC ram_00B6				;C - - - - - 0x0108C1 04:88B1: E6 B6
		LDA ram_00B6				;C - - - - - 0x0108C3 04:88B3: A5 B6
		CMP #$0C					;C - - - - - 0x0108C5 04:88B5: C9 0C
		BCC CODE_0888EC				;C - - - - - 0x0108C7 04:88B7: 90 33
			LDY enemyDir				;C - - - - - 0x0108C9 04:88B9: A4 A2
			LDA DATA_0888EF,Y			;C - - - - - 0x0108CB 04:88BB: B9 EF 88
			STA ram_00BD				;C - - - - - 0x0108CE 04:88BE: 85 BD
			LDA #$00					;C - - - - - 0x0108D0 04:88C0: A9 00
			STA scratch4				;C - - - - - 0x0108D2 04:88C2: 85 04
			LDA #snEnemyThrow_ID					;C - - - - - 0x0108D4 04:88C4: A9 26
			STA a:soundTrigger				;C - - - - - 0x0108D6 04:88C6: 8D E1 00
			JSR CODE_0898F6				;C - - - - - 0x0108D9 04:88C9: 20 F6 98
			LDA #$03					;C - - - - - 0x0108DC 04:88CC: A9 03
			STA objAttr+OSLOT_PROJ,Y				;C - - - - - 0x0108DE 04:88CE: 99 F4 06
			LDA ram_00B2				;C - - - - - 0x0108E1 04:88D1: A5 B2
			CLC							;C - - - - - 0x0108E3 04:88D3: 18
			ADC #$10					;C - - - - - 0x0108E4 04:88D4: 69 10
			STA objY+OSLOT_PROJ,Y				;C - - - - - 0x0108E6 04:88D6: 99 8C 05
			LDA #$FA					;C - - - - - 0x0108E9 04:88D9: A9 FA
			STA projVSpeed,Y				;C - - - - - 0x0108EB 04:88DB: 99 35 05
			LDA ram_00BD				;C - - - - - 0x0108EE 04:88DE: A5 BD
			STA projHSpeed,Y				;C - - - - - 0x0108F0 04:88E0: 99 2D 05
CODE_0888E3:
	LDA #$02					;C - - - - - 0x0108F3 04:88E3: A9 02
	STA objState+OSLOT_ENEMY				;C - - - - - 0x0108F5 04:88E5: 8D 6C 05
	LDA enemyDir+8				;C - - - - - 0x0108F8 04:88E8: A5 AA
	STA enemyDir				;C - - - - - 0x0108FA 04:88EA: 85 A2
CODE_0888EC:
	JMP CODE_0889BE				;C - - - - - 0x0108FC 04:88EC: 4C BE 89

DATA_0888EF:
	.byte $00					;- - - - - - 0x0108FF 04:88EF: 00
	.byte $FC					;- D 0 - - - 0x010900 04:88F0: FC
	.byte $04					;- D 0 - - - 0x010901 04:88F1: 04

CODE_0888F2:
	CMP #$04					;C - - - - - 0x010902 04:88F2: C9 04
	BNE CODE_0888FF				;C - - - - - 0x010904 04:88F4: D0 09
		JSR CODE_08896E				;C - - - - - 0x010906 04:88F6: 20 6E 89
		JSR CODE_089934				;C - - - - - 0x010909 04:88F9: 20 34 99
		JMP CODE_0889BE				;C - - - - - 0x01090C 04:88FC: 4C BE 89
CODE_0888FF:
	CMP #$05					;C - - - - - 0x01090F 04:88FF: C9 05
	BNE CODE_088916				;C - - - - - 0x010911 04:8901: D0 13
		LDA #$05					;C - - - - - 0x010913 04:8903: A9 05
		STA ram_00B3				;C - - - - - 0x010915 04:8905: 85 B3

		LDA #trVictory_ID					;C - - - - - 0x010917 04:8907: A9 0A
		STA a:musicTrigger				;C - - - - - 0x010919 04:8909: 8D E0 00

		INC objState+OSLOT_ENEMY				;C - - - - - 0x01091C 04:890C: EE 6C 05
		LDA #$00					;C - - - - - 0x01091F 04:890F: A9 00
		STA ram_00B6				;C - - - - - 0x010921 04:8911: 85 B6
		JMP CODE_088A1E				;C - - - - - 0x010923 04:8913: 4C 1E 8A
CODE_088916:
	CMP #$06					;C - - - - - 0x010926 04:8916: C9 06
	BEQ CODE_08891D				;C - - - - - 0x010928 04:8918: F0 03
		;Unreached
		JMP CODE_0889BE				;- - - - - - 0x01092A 04:891A: 4C
CODE_08891D:
	LDA #$00					;C - - - - - 0x01092D 04:891D: A9 00
	STA ram_00AE				;C - - - - - 0x01092F 04:891F: 85 AE
	STA ram_00AF				;C - - - - - 0x010931 04:8921: 85 AF
	LDA objY+OSLOT_ENEMY				;C - - - - - 0x010933 04:8923: AD 94 05
	CLC							;C - - - - - 0x010936 04:8926: 18
	ADC #$10					;C - - - - - 0x010937 04:8927: 69 10
	STA objY+OSLOT_ENEMY				;C - - - - - 0x010939 04:8929: 8D 94 05
	LDY wideScrollDir				;C - - - - - 0x01093C 04:892C: A4 31
	LDA objX+OSLOT_ENEMY				;C - - - - - 0x01093E 04:892E: AD BC 05
	CLC							;C - - - - - 0x010941 04:8931: 18
	ADC DATA_08896B,Y			;C - - - - - 0x010942 04:8932: 79 6B 89
	STA objX+OSLOT_ENEMY				;C - - - - - 0x010945 04:8935: 8D BC 05
	LDA #$05					;C - - - - - 0x010948 04:8938: A9 05
	STA ram_00B3				;C - - - - - 0x01094A 04:893A: 85 B3
	LDA #$80					;C - - - - - 0x01094C 04:893C: A9 80
	STA ram_00C0				;C - - - - - 0x01094E 04:893E: 85 C0
	LDA objAnimTimer+OSLOT_ENEMY				;C - - - - - 0x010950 04:8940: AD AC 06
	BNE CODE_08894A				;C - - - - - 0x010953 04:8943: D0 05
		LDA #snBomb_ID					;C - - - - - 0x010955 04:8945: A9 29
		STA a:soundTrigger				;C - - - - - 0x010957 04:8947: 8D E1 00
CODE_08894A:
	INC ram_00B6				;C - - - - - 0x01095A 04:894A: E6 B6
	LDA ram_00B6				;C - - - - - 0x01095C 04:894C: A5 B6
	CMP #$78					;C - - - - - 0x01095E 04:894E: C9 78
	BCC CODE_088968				;C - - - - - 0x010960 04:8950: 90 16
		LDA #$00					;C - - - - - 0x010962 04:8952: A9 00
		STA enemyType				;C - - - - - 0x010964 04:8954: 85 98
		STA objState+OSLOT_ENEMY				;C - - - - - 0x010966 04:8956: 8D 6C 05
		LDA #RFLAG_BIG_REWARD					;C - - - - - 0x010969 04:8959: A9 80
		STA roundFlags				;C - - - - - 0x01096B 04:895B: 8D 71 04
		LDA #REWARDS_ROUND					;C - - - - - 0x01096E 04:895E: A9 01
		STA bigRewardCategory				;C - - - - - 0x010970 04:8960: 8D 4F 05
		LDA wideHScroll				;C - - - - - 0x010973 04:8963: AD 61 07
		STA ram_00BD				;C - - - - - 0x010976 04:8966: 85 BD
CODE_088968:
	JMP CODE_0889E7				;C - - - - - 0x010978 04:8968: 4C E7 89

DATA_08896B:
	.byte $00					;- D 0 - - - 0x01097B 04:896B: 00
	.byte $04					;- - - - - - 0x01097C 04:896C: 04
	.byte $FC					;- D 0 - - - 0x01097D 04:896D: FC

CODE_08896E:
	LDA #$00					;C - - - - - 0x01097E 04:896E: A9 00
	STA ram_00C0				;C - - - - - 0x010980 04:8970: 85 C0
	LDA objY+OSLOT_ENEMY				;C - - - - - 0x010982 04:8972: AD 94 05
	CMP #$F8					;C - - - - - 0x010985 04:8975: C9 F8
	BCC CODE_088980				;C - - - - - 0x010987 04:8977: 90 07
		LDA #$80					;C - - - - - 0x010989 04:8979: A9 80
		STA ram_00C0				;C - - - - - 0x01098B 04:897B: 85 C0
		JSR CODE_088A32				;C - - - - - 0x01098D 04:897D: 20 32 8A
CODE_088980:
	LDA #$04					;C - - - - - 0x010990 04:8980: A9 04
	STA ram_00AE				;C - - - - - 0x010992 04:8982: 85 AE
	LDA wideScrollDir				;C - - - - - 0x010994 04:8984: A5 31
	BEQ CODE_08898A				;C - - - - - 0x010996 04:8986: F0 02
		INC ram_00AE				;C - - - - - 0x010998 04:8988: E6 AE
CODE_08898A:
	LDA ram_00CD				;C - - - - - 0x01099A 04:898A: A5 CD
	BEQ CODE_0889B5				;C - - - - - 0x01099C 04:898C: F0 27
		AND #$07					;C - - - - - 0x01099E 04:898E: 29 07
		STA scratch0				;C - - - - - 0x0109A0 04:8990: 85 00
		LDA ram_00B2				;C - - - - - 0x0109A2 04:8992: A5 B2
		SEC							;C - - - - - 0x0109A4 04:8994: 38
		SBC scratch0				;C - - - - - 0x0109A5 04:8995: E5 00
		STA ram_00B2				;C - - - - - 0x0109A7 04:8997: 85 B2
		LDA ram_00B1				;C - - - - - 0x0109A9 04:8999: A5 B1
		BEQ CODE_0889A6				;C - - - - - 0x0109AB 04:899B: F0 09
			LDA ram_00B0				;C - - - - - 0x0109AD 04:899D: A5 B0
			CMP #$E0					;C - - - - - 0x0109AF 04:899F: C9 E0
			BCS CODE_0889AC				;C - - - - - 0x0109B1 04:89A1: B0 09
				JMP CODE_0889BD				;C - - - - - 0x0109B3 04:89A3: 4C BD 89
	CODE_0889A6:
		LDA ram_00B0				;C - - - - - 0x0109B6 04:89A6: A5 B0
		CMP #$20					;C - - - - - 0x0109B8 04:89A8: C9 20
		BCS CODE_0889BD				;C - - - - - 0x0109BA 04:89AA: B0 11
	CODE_0889AC:
		LDA enemyDir				;C - - - - - 0x0109BC 04:89AC: A5 A2
		EOR #$03					;C - - - - - 0x0109BE 04:89AE: 49 03
		STA enemyDir				;C - - - - - 0x0109C0 04:89B0: 85 A2
		JMP CODE_0889BD				;C - - - - - 0x0109C2 04:89B2: 4C BD 89
CODE_0889B5:
	LDA #$00					;C - - - - - 0x0109C5 04:89B5: A9 00
	STA ram_00AE				;C - - - - - 0x0109C7 04:89B7: 85 AE
	LDA #$03					;C - - - - - 0x0109C9 04:89B9: A9 03
	STA ram_00AF				;C - - - - - 0x0109CB 04:89BB: 85 AF
CODE_0889BD:
	RTS							;C - - - - - 0x0109CD 04:89BD: 60

CODE_0889BE:
	LDA enemyDir				;C - - - - - 0x0109CE 04:89BE: A5 A2
	CMP #$01					;C - - - - - 0x0109D0 04:89C0: C9 01
	BEQ CODE_0889D6				;C - - - - - 0x0109D2 04:89C2: F0 12
		LDA #$01					;C - - - - - 0x0109D4 04:89C4: A9 01
		STA ram_00B3				;C - - - - - 0x0109D6 04:89C6: 85 B3
		LDA ram_00B0				;C - - - - - 0x0109D8 04:89C8: A5 B0
		CLC							;C - - - - - 0x0109DA 04:89CA: 18
		ADC ram_00AE				;C - - - - - 0x0109DB 04:89CB: 65 AE
		STA ram_00B0				;C - - - - - 0x0109DD 04:89CD: 85 B0
		LDA ram_00B1				;C - - - - - 0x0109DF 04:89CF: A5 B1
		ADC #$00					;C - - - - - 0x0109E1 04:89D1: 69 00
		JMP CODE_0889E5				;C - - - - - 0x0109E3 04:89D3: 4C E5 89
CODE_0889D6:
	LDA #$00					;C - - - - - 0x0109E6 04:89D6: A9 00
	STA ram_00B3				;C - - - - - 0x0109E8 04:89D8: 85 B3
	LDA ram_00B0				;C - - - - - 0x0109EA 04:89DA: A5 B0
	SEC							;C - - - - - 0x0109EC 04:89DC: 38
	SBC ram_00AE				;C - - - - - 0x0109ED 04:89DD: E5 AE
	STA ram_00B0				;C - - - - - 0x0109EF 04:89DF: 85 B0
	LDA ram_00B1				;C - - - - - 0x0109F1 04:89E1: A5 B1
	SBC #$00					;C - - - - - 0x0109F3 04:89E3: E9 00
CODE_0889E5:
	STA ram_00B1				;C - - - - - 0x0109F5 04:89E5: 85 B1
CODE_0889E7:
	LDA ram_00B0				;C - - - - - 0x0109F7 04:89E7: A5 B0
	SEC							;C - - - - - 0x0109F9 04:89E9: 38
	SBC wideHScroll				;C - - - - - 0x0109FA 04:89EA: ED 61 07
	STA objX+OSLOT_ENEMY				;C - - - - - 0x0109FD 04:89ED: 8D BC 05
	LDA ram_00B1				;C - - - - - 0x010A00 04:89F0: A5 B1
	SBC #$00					;C - - - - - 0x010A02 04:89F2: E9 00
	STA scratch0				;C - - - - - 0x010A04 04:89F4: 85 00
	LDA ram_00B2				;C - - - - - 0x010A06 04:89F6: A5 B2
	CLC							;C - - - - - 0x010A08 04:89F8: 18
	ADC ram_00AF				;C - - - - - 0x010A09 04:89F9: 65 AF
	STA ram_00B2				;C - - - - - 0x010A0B 04:89FB: 85 B2
	STA objY+OSLOT_ENEMY				;C - - - - - 0x010A0D 04:89FD: 8D 94 05
	LDA objX+OSLOT_ENEMY				;C - - - - - 0x010A10 04:8A00: AD BC 05
	CMP #$0C					;C - - - - - 0x010A13 04:8A03: C9 0C
	BCC CODE_088A0F				;C - - - - - 0x010A15 04:8A05: 90 08
		CMP #$F4					;C - - - - - 0x010A17 04:8A07: C9 F4
		BCS CODE_088A0F				;C - - - - - 0x010A19 04:8A09: B0 04
			LDA scratch0				;C - - - - - 0x010A1B 04:8A0B: A5 00
			BEQ CODE_088A18				;C - - - - - 0x010A1D 04:8A0D: F0 09
CODE_088A0F:
	LDA #$F8					;C - - - - - 0x010A1F 04:8A0F: A9 F8
	STA objY+OSLOT_ENEMY				;C - - - - - 0x010A21 04:8A11: 8D 94 05
	LDA #$04					;C - - - - - 0x010A24 04:8A14: A9 04
	STA ram_00B3				;C - - - - - 0x010A26 04:8A16: 85 B3
CODE_088A18:
	LDA #$00					;C - - - - - 0x010A28 04:8A18: A9 00
	STA ram_00AE				;C - - - - - 0x010A2A 04:8A1A: 85 AE
	STA ram_00AF				;C - - - - - 0x010A2C 04:8A1C: 85 AF
CODE_088A1E:
	LDY ram_00B3				;C - - - - - 0x010A2E 04:8A1E: A4 B3
	LDA RuckusAnims,Y			;C - - - - - 0x010A30 04:8A20: B9 2C 8A
	CMP objAnim+OSLOT_ENEMY				;C - - - - - 0x010A33 04:8A23: CD 84 06
	BEQ CODE_088A2B				;C - - - - - 0x010A36 04:8A26: F0 03
		JSR StartEnemyAnim				;C - - - - - 0x010A38 04:8A28: 20 58 99
CODE_088A2B:
	RTS							;C - - - - - 0x010A3B 04:8A2B: 60

RuckusAnims:
	.byte anRuckusL_ID					;- D 0 - - - 0x010A3C 04:8A2C: D0
	.byte anRuckusR_ID					;- D 0 - - - 0x010A3D 04:8A2D: D1
	.byte anRuckusLAlt_ID					;- - - - - - 0x010A3E 04:8A2E: CE
	.byte anRuckusRAlt_ID					;- - - - - - 0x010A3F 04:8A2F: CF
	.byte anRuckusBlast_ID				;- D 0 - - - 0x010A40 04:8A30: 76
	.byte anRuckusDie_ID				;- D 0 - - - 0x010A41 04:8A31: AA

CODE_088A32:
	LDA #$80					;C - - - - - 0x010A42 04:8A32: A9 80
	STA ram_00CD				;C - - - - - 0x010A44 04:8A34: 85 CD
	TXA							;C - - - - - 0x010A46 04:8A36: 8A
	PHA							;C - - - - - 0x010A47 04:8A37: 48
	LDX #$00					;C - - - - - 0x010A48 04:8A38: A2 00
CODE_088A3A:
	LDA DATA_06BD4B,X			;C - - - - - 0x010A4A 04:8A3A: BD 4B BD
	STA scratch8				;C - - - - - 0x010A4D 04:8A3D: 85 08
	LDA DATA_06BD4B+1,X			;C - - - - - 0x010A4F 04:8A3F: BD 4C BD
	STA scratch9				;C - - - - - 0x010A52 04:8A42: 85 09
	LDY #$00					;C - - - - - 0x010A54 04:8A44: A0 00
	LDA ram_00B1				;C - - - - - 0x010A56 04:8A46: A5 B1
	CMP (scratch8),Y			;C - - - - - 0x010A58 04:8A48: D1 08
	BNE CODE_088A68				;C - - - - - 0x010A5A 04:8A4A: D0 1C
		INY							;C - - - - - 0x010A5C 04:8A4C: C8
		LDA ram_00B0				;C - - - - - 0x010A5D 04:8A4D: A5 B0
		CMP (scratch8),Y			;C - - - - - 0x010A5F 04:8A4F: D1 08
		BCC CODE_088A68				;C - - - - - 0x010A61 04:8A51: 90 15
			INY							;C - - - - - 0x010A63 04:8A53: C8
			CMP (scratch8),Y			;C - - - - - 0x010A64 04:8A54: D1 08
			BCS CODE_088A68				;C - - - - - 0x010A66 04:8A56: B0 10
				INY							;C - - - - - 0x010A68 04:8A58: C8
				LDA ram_00B2				;C - - - - - 0x010A69 04:8A59: A5 B2
				CMP (scratch8),Y			;C - - - - - 0x010A6B 04:8A5B: D1 08
				BCC CODE_088A68				;C - - - - - 0x010A6D 04:8A5D: 90 09
					INY							;C - - - - - 0x010A6F 04:8A5F: C8
					CMP (scratch8),Y			;C - - - - - 0x010A70 04:8A60: D1 08
					BCS CODE_088A68				;C - - - - - 0x010A72 04:8A62: B0 04
						LDA #$00					;C - - - - - 0x010A74 04:8A64: A9 00
						STA ram_00CD				;C - - - - - 0x010A76 04:8A66: 85 CD
CODE_088A68:
	INX							;C - - - - - 0x010A78 04:8A68: E8
	INX							;C - - - - - 0x010A79 04:8A69: E8
	CPX #$0C					;C - - - - - 0x010A7A 04:8A6A: E0 0C
	BCC CODE_088A3A				;C - - - - - 0x010A7C 04:8A6C: 90 CC

	PLA							;C - - - - - 0x010A7E 04:8A6E: 68
	TAX							;C - - - - - 0x010A7F 04:8A6F: AA
	RTS							;C - - - - - 0x010A80 04:8A70: 60

CODE_088A71:
	LDA enemyDir				;C - - - - - 0x010A81 04:8A71: A5 A2
	STA enemyDir+8				;C - - - - - 0x010A83 04:8A73: 85 AA
	INC ram_00B6				;C - - - - - 0x010A85 04:8A75: E6 B6
	LDA ram_00B6				;C - - - - - 0x010A87 04:8A77: A5 B6
	CMP #$F0					;C - - - - - 0x010A89 04:8A79: C9 F0
	BCC CODE_088AA1				;C - - - - - 0x010A8B 04:8A7B: 90 24
		LDA #$00					;C - - - - - 0x010A8D 04:8A7D: A9 00
		STA ram_00B6				;C - - - - - 0x010A8F 04:8A7F: 85 B6
		LDA objY+OSLOT_ENEMY				;C - - - - - 0x010A91 04:8A81: AD 94 05
		CMP #$F8					;C - - - - - 0x010A94 04:8A84: C9 F8
		BCS CODE_088AA1				;C - - - - - 0x010A96 04:8A86: B0 19
			LDA objX+OSLOT_ENEMY				;C - - - - - 0x010A98 04:8A88: AD BC 05
			CMP objX				;C - - - - - 0x010A9B 04:8A8B: CD B3 05
			BCS CODE_088A94				;C - - - - - 0x010A9E 04:8A8E: B0 04
				LDA #$02					;C - - - - - 0x010AA0 04:8A90: A9 02
				BNE CODE_088A96				;C - - - - - 0x010AA2 04:8A92: D0 02
		CODE_088A94:
			LDA #$01					;C - - - - - 0x010AA4 04:8A94: A9 01
		CODE_088A96:
			CMP enemyDir,X				;C - - - - - 0x010AA6 04:8A96: D5 A2
			BEQ CODE_088AA1				;C - - - - - 0x010AA8 04:8A98: F0 07
				STA enemyDir,X				;C - - - - - 0x010AAA 04:8A9A: 95 A2
				LDA #$03					;C - - - - - 0x010AAC 04:8A9C: A9 03
				STA objState+OSLOT_ENEMY				;C - - - - - 0x010AAE 04:8A9E: 8D 6C 05
CODE_088AA1:
	RTS							;C - - - - - 0x010AB1 04:8AA1: 60

CODE_088AA2:
	TXA							;C - - - - - 0x010AB2 04:8AA2: 8A
	PHA							;C - - - - - 0x010AB3 04:8AA3: 48
	LDX #$12					;C - - - - - 0x010AB4 04:8AA4: A2 12
CODE_088AA6:
	CPX #$13					;C - - - - - 0x010AB6 04:8AA6: E0 13
	BEQ CODE_088AAF				;C - - - - - 0x010AB8 04:8AA8: F0 05
		LDA #$00					;C - - - - - 0x010ABA 04:8AAA: A9 00
		STA objY,X				;C - - - - - 0x010ABC 04:8AAC: 9D 8B 05
CODE_088AAF:
	INX							;C - - - - - 0x010ABF 04:8AAF: E8
	CPX #$28					;C - - - - - 0x010AC0 04:8AB0: E0 28
	BCC CODE_088AA6				;C - - - - - 0x010AC2 04:8AB2: 90 F2

	PLA							;C - - - - - 0x010AC4 04:8AB4: 68
	TAX							;C - - - - - 0x010AC5 04:8AB5: AA
	RTS							;C - - - - - 0x010AC6 04:8AB6: 60

MadMonkeyUpdate:
	LDA #$00					;C - - - - - 0x010AC7 04:8AB7: A9 00
	STA ram_04AD				;C - - - - - 0x010AC9 04:8AB9: 8D AD 04
	INC ram_00B5				;C - - - - - 0x010ACC 04:8ABC: E6 B5
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x010ACE 04:8ABE: AD 6C 05
	STA scratch8				;C - - - - - 0x010AD1 04:8AC1: 85 08
	AND #$3F					;C - - - - - 0x010AD3 04:8AC3: 29 3F
	STA objState+OSLOT_ENEMY				;C - - - - - 0x010AD5 04:8AC5: 8D 6C 05
	CMP #$01					;C - - - - - 0x010AD8 04:8AC8: C9 01
	BNE CODE_088AEF				;C - - - - - 0x010ADA 04:8ACA: D0 23
		LDA #$00					;C - - - - - 0x010ADC 04:8ACC: A9 00
		STA openingCycle				;C - - - - - 0x010ADE 04:8ACE: 8D CD 04
		STA bgAnimValue				;C - - - - - 0x010AE1 04:8AD1: 8D CE 04
		STA openingCounter				;C - - - - - 0x010AE4 04:8AD4: 8D CC 04
		STA ram_00B6				;C - - - - - 0x010AE7 04:8AD7: 85 B6
		STA ram_00B5				;C - - - - - 0x010AE9 04:8AD9: 85 B5
		STA enemyReward,X				;C - - - - - 0x010AEB 04:8ADB: 95 8E
		LDA #$0D					;C - - - - - 0x010AED 04:8ADD: A9 0D
		STA ram_04AF,X				;C - - - - - 0x010AEF 04:8ADF: 9D AF 04
		LDA #$02					;C - - - - - 0x010AF2 04:8AE2: A9 02
		STA objState+OSLOT_ENEMY				;C - - - - - 0x010AF4 04:8AE4: 8D 6C 05
		LDA #$09					;C - - - - - 0x010AF7 04:8AE7: A9 09
		STA roundEnemies				;C - - - - - 0x010AF9 04:8AE9: 8D A8 04
		JMP CODE_088C99				;C - - - - - 0x010AFC 04:8AEC: 4C 99 8C
CODE_088AEF:
	CMP #$02					;C - - - - - 0x010AFF 04:8AEF: C9 02
	BNE CODE_088B45				;C - - - - - 0x010B01 04:8AF1: D0 52
		LDA #$00					;C - - - - - 0x010B03 04:8AF3: A9 00
		STA bgAnimValue				;C - - - - - 0x010B05 04:8AF5: 8D CE 04
		LDA scratch8				;C - - - - - 0x010B08 04:8AF8: A5 08
		CMP #$C0					;C - - - - - 0x010B0A 04:8AFA: C9 C0
		BCC CODE_088B1F				;C - - - - - 0x010B0C 04:8AFC: 90 21
			LDA #$05					;C - - - - - 0x010B0E 04:8AFE: A9 05
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x010B10 04:8B00: 9D 6C 05
			LDA #snEnemyHurt_ID					;C - - - - - 0x010B13 04:8B03: A9 2B
			STA a:soundTrigger				;C - - - - - 0x010B15 04:8B05: 8D E1 00
			INC enemyHits,X				;C - - - - - 0x010B18 04:8B08: FE BE 04
			LDA enemyHits,X				;C - - - - - 0x010B1B 04:8B0B: BD BE 04
			CMP #$05					;C - - - - - 0x010B1E 04:8B0E: C9 05
			BCC CODE_088B1F				;C - - - - - 0x010B20 04:8B10: 90 0D
				INC objState+OSLOT_ENEMY,X				;C - - - - - 0x010B22 04:8B12: FE 6C 05

				LDA #trVictory_ID					;C - - - - - 0x010B25 04:8B15: A9 0A
				STA a:musicTrigger				;C - - - - - 0x010B27 04:8B17: 8D E0 00
				LDA #snBomb_ID					;C - - - - - 0x010B2A 04:8B1A: A9 29
				STA a:soundTrigger				;C - - - - - 0x010B2C 04:8B1C: 8D E1 00
	CODE_088B1F:
		LDA #$00					;C - - - - - 0x010B2F 04:8B1F: A9 00
		STA bgAnimValue				;C - - - - - 0x010B31 04:8B21: 8D CE 04
		LDA ram_00CD				;C - - - - - 0x010B34 04:8B24: A5 CD
		BNE CODE_088B2D				;C - - - - - 0x010B36 04:8B26: D0 05
			LDA #chrTaito_A_ID					;C - - - - - 0x010B38 04:8B28: A9 04
			STA bgAnimValue				;C - - - - - 0x010B3A 04:8B2A: 8D CE 04
	CODE_088B2D:
		LDA ram_00B5				;C - - - - - 0x010B3D 04:8B2D: A5 B5
		CMP #$FE					;C - - - - - 0x010B3F 04:8B2F: C9 FE
		BCC CODE_088B42				;C - - - - - 0x010B41 04:8B31: 90 0F
			LDA #$03					;C - - - - - 0x010B43 04:8B33: A9 03
			STA objState+OSLOT_ENEMY				;C - - - - - 0x010B45 04:8B35: 8D 6C 05
			LDA #$00					;C - - - - - 0x010B48 04:8B38: A9 00
			STA openingCounter				;C - - - - - 0x010B4A 04:8B3A: 8D CC 04
			LDA #anMadMonkeyStartJump_ID					;C - - - - - 0x010B4D 04:8B3D: A9 DC
			JSR StartEnemyAnim				;C - - - - - 0x010B4F 04:8B3F: 20 58 99
	CODE_088B42:
		JMP CODE_088C85				;C - - - - - 0x010B52 04:8B42: 4C 85 8C
CODE_088B45:
	CMP #$03					;C - - - - - 0x010B55 04:8B45: C9 03
	BNE CODE_088B99				;C - - - - - 0x010B57 04:8B47: D0 50
		INC openingCounter				;C - - - - - 0x010B59 04:8B49: EE CC 04
		LDA openingCounter				;C - - - - - 0x010B5C 04:8B4C: AD CC 04
		CMP #$0A					;C - - - - - 0x010B5F 04:8B4F: C9 0A
		BCC CODE_088B96				;C - - - - - 0x010B61 04:8B51: 90 43
		BNE CODE_088B79				;C - - - - - 0x010B63 04:8B53: D0 24
			LDA #anMadMonkeyJump_ID					;C - - - - - 0x010B65 04:8B55: A9 DD
			JSR StartEnemyAnim				;C - - - - - 0x010B67 04:8B57: 20 58 99
			LDA objY+OSLOT_ENEMY				;C - - - - - 0x010B6A 04:8B5A: AD 94 05
			CMP #$B7					;C - - - - - 0x010B6D 04:8B5D: C9 B7
			BCC CODE_088B6E				;C - - - - - 0x010B6F 04:8B5F: 90 0D
				LDA #$07					;C - - - - - 0x010B71 04:8B61: A9 07
				STA objState+OSLOT_ENEMY				;C - - - - - 0x010B73 04:8B63: 8D 6C 05
				LDA #$FC					;C - - - - - 0x010B76 04:8B66: A9 FC
				STA bgAnimValue				;C - - - - - 0x010B78 04:8B68: 8D CE 04
				JMP CODE_088B96				;C - - - - - 0x010B7B 04:8B6B: 4C 96 8B
		CODE_088B6E:
			LDA #$F9					;C - - - - - 0x010B7E 04:8B6E: A9 F9
			STA bgAnimValue				;C - - - - - 0x010B80 04:8B70: 8D CE 04
			LDA objY+OSLOT_ENEMY				;C - - - - - 0x010B83 04:8B73: AD 94 05
			STA objY+8				;C - - - - - 0x010B86 04:8B76: 8D 93 05
		CODE_088B79:
			LDA globalTimer				;C - - - - - 0x010B89 04:8B79: A5 14
			AND #$03					;C - - - - - 0x010B8B 04:8B7B: 29 03
			BNE CODE_088B82				;C - - - - - 0x010B8D 04:8B7D: D0 03
				INC bgAnimValue				;C - - - - - 0x010B8F 04:8B7F: EE CE 04
		CODE_088B82:
			LDA bgAnimValue				;C - - - - - 0x010B92 04:8B82: AD CE 04
			CMP #$08					;C - - - - - 0x010B95 04:8B85: C9 08
			BNE CODE_088B96				;C - - - - - 0x010B97 04:8B87: D0 0D
				LDA #$04					;C - - - - - 0x010B99 04:8B89: A9 04
				STA objState+OSLOT_ENEMY				;C - - - - - 0x010B9B 04:8B8B: 8D 6C 05
				LDA #$00					;C - - - - - 0x010B9E 04:8B8E: A9 00
				STA bgAnimValue				;C - - - - - 0x010BA0 04:8B90: 8D CE 04
				STA openingCounter				;C - - - - - 0x010BA3 04:8B93: 8D CC 04
	CODE_088B96:
		JMP CODE_088C85				;C - - - - - 0x010BA6 04:8B96: 4C 85 8C
CODE_088B99:
	CMP #$04					;C - - - - - 0x010BA9 04:8B99: C9 04
	BEQ CODE_088BA0				;C - - - - - 0x010BAB 04:8B9B: F0 03
		JMP CODE_088C27				;C - - - - - 0x010BAD 04:8B9D: 4C 27 8C
CODE_088BA0:
	LDA openingCounter				;C - - - - - 0x010BB0 04:8BA0: AD CC 04
	BNE CODE_088C0A				;C - - - - - 0x010BB3 04:8BA3: D0 65

	JSR CODE_0FEC4B				;C - - - - - 0x010BB5 04:8BA5: 20 4B EC
	LDA #snBasketFail_ID					;C - - - - - 0x010BB8 04:8BA8: A9 1C
	STA a:soundTrigger				;C - - - - - 0x010BBA 04:8BAA: 8D E1 00
	TXA							;C - - - - - 0x010BBD 04:8BAD: 8A
	PHA							;C - - - - - 0x010BBE 04:8BAE: 48
	LDX #$01					;C - - - - - 0x010BBF 04:8BAF: A2 01
CODE_088BB1:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x010BC1 04:8BB1: BD 6C 05
	BEQ CODE_088BC3				;C - - - - - 0x010BC4 04:8BB4: F0 0D
		CMP #$0B					;C - - - - - 0x010BC6 04:8BB6: C9 0B
		BCS CODE_088BC3				;C - - - - - 0x010BC8 04:8BB8: B0 09
			LDA #$00					;C - - - - - 0x010BCA 04:8BBA: A9 00
			STA ram_00B6,X				;C - - - - - 0x010BCC 04:8BBC: 95 B6
			LDA #$03					;C - - - - - 0x010BCE 04:8BBE: A9 03
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x010BD0 04:8BC0: 9D 6C 05
CODE_088BC3:
	INX							;C - - - - - 0x010BD3 04:8BC3: E8
	CPX #$06					;C - - - - - 0x010BD4 04:8BC4: E0 06
	BCC CODE_088BB1				;C - - - - - 0x010BD6 04:8BC6: 90 E9

	LDX #$00					;C - - - - - 0x010BD8 04:8BC8: A2 00
CODE_088BCA:
	INX							;C - - - - - 0x010BDA 04:8BCA: E8
	CPX #$06					;C - - - - - 0x010BDB 04:8BCB: E0 06
	BCS CODE_088C08				;C - - - - - 0x010BDD 04:8BCD: B0 39
		LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x010BDF 04:8BCF: BD 6C 05
		BNE CODE_088BCA				;C - - - - - 0x010BE2 04:8BD2: D0 F6

		LDA enemyReward,X				;C - - - - - 0x010BE4 04:8BD4: B5 8E
		ORA ram_00AC,X				;C - - - - - 0x010BE6 04:8BD6: 15 AC
		CMP #$80					;C - - - - - 0x010BE8 04:8BD8: C9 80
		BEQ CODE_088BCA				;C - - - - - 0x010BEA 04:8BDA: F0 EE

		LDA #$01					;C - - - - - 0x010BEC 04:8BDC: A9 01
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x010BEE 04:8BDE: 9D 6C 05
		LDA #$18					;C - - - - - 0x010BF1 04:8BE1: A9 18
		STA enemyType,X				;C - - - - - 0x010BF3 04:8BE3: 95 98
		LDA #$03					;C - - - - - 0x010BF5 04:8BE5: A9 03
		STA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x010BF7 04:8BE7: 9D 34 06
		LDA #anRounderFall_ID					;C - - - - - 0x010BFA 04:8BEA: A9 E0
		JSR StartEnemyAnim				;C - - - - - 0x010BFC 04:8BEC: 20 58 99
		STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x010BFF 04:8BEF: 9D 24 07
		LDA objX				;C - - - - - 0x010C02 04:8BF2: AD B3 05
		STA objX+OSLOT_ENEMY,X				;C - - - - - 0x010C05 04:8BF5: 9D BC 05
		LDA #$10					;C - - - - - 0x010C08 04:8BF8: A9 10
		STA objY+OSLOT_ENEMY,X				;C - - - - - 0x010C0A 04:8BFA: 9D 94 05
		LDA #$02					;C - - - - - 0x010C0D 04:8BFD: A9 02
		STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x010C0F 04:8BFF: 9D FC 06
		LDA #$00					;C - - - - - 0x010C12 04:8C02: A9 00
		STA enemyMad,X				;C - - - - - 0x010C14 04:8C04: 95 63
		STA ram_00B6,X				;C - - - - - 0x010C16 04:8C06: 95 B6
CODE_088C08:
	PLA							;C - - - - - 0x010C18 04:8C08: 68
	TAX							;C - - - - - 0x010C19 04:8C09: AA
CODE_088C0A:
	INC openingCounter				;C - - - - - 0x010C1A 04:8C0A: EE CC 04
	LDA openingCounter				;C - - - - - 0x010C1D 04:8C0D: AD CC 04
	CMP #$0A					;C - - - - - 0x010C20 04:8C10: C9 0A
	BCC CODE_088C24				;C - - - - - 0x010C22 04:8C12: 90 10
		LDA #$02					;C - - - - - 0x010C24 04:8C14: A9 02
		STA objState+OSLOT_ENEMY				;C - - - - - 0x010C26 04:8C16: 8D 6C 05
		LDA #anMadMonkey_ID					;C - - - - - 0x010C29 04:8C19: A9 DB
		JSR StartEnemyAnim				;C - - - - - 0x010C2B 04:8C1B: 20 58 99
		LDA objY+8				;C - - - - - 0x010C2E 04:8C1E: AD 93 05
		STA objY+OSLOT_ENEMY				;C - - - - - 0x010C31 04:8C21: 8D 94 05
CODE_088C24:
	JMP CODE_088C85				;C - - - - - 0x010C34 04:8C24: 4C 85 8C
CODE_088C27:
	CMP #$05					;C - - - - - 0x010C37 04:8C27: C9 05
	BNE CODE_088C31				;C - - - - - 0x010C39 04:8C29: D0 06
		JSR CODE_089934				;C - - - - - 0x010C3B 04:8C2B: 20 34 99
		JMP CODE_088C85				;C - - - - - 0x010C3E 04:8C2E: 4C 85 8C
CODE_088C31:
	CMP #$06					;C - - - - - 0x010C41 04:8C31: C9 06
	BNE CODE_088C6B				;C - - - - - 0x010C43 04:8C33: D0 36
		LDA #$00					;C - - - - - 0x010C45 04:8C35: A9 00
		STA bgAnimValue				;C - - - - - 0x010C47 04:8C37: 8D CE 04
		LDA #$80					;C - - - - - 0x010C4A 04:8C3A: A9 80
		STA ram_00C0,X				;C - - - - - 0x010C4C 04:8C3C: 95 C0
		LDA #.LOBYTE(anMadMonkeyJump_ID)					;C - - - - - 0x010C4E 04:8C3E: A9 DD
		STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x010C50 04:8C40: 9D 84 06
		LDA #$00					;C - - - - - 0x010C53 04:8C43: A9 00
		STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x010C55 04:8C45: 9D D4 06
		LDA #$01					;C - - - - - 0x010C58 04:8C48: A9 01
		STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x010C5A 04:8C4A: 9D AC 06
		INC objY+OSLOT_ENEMY,X				;C - - - - - 0x010C5D 04:8C4D: FE 94 05
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x010C60 04:8C50: BD 94 05
		CMP #$F0					;C - - - - - 0x010C63 04:8C53: C9 F0
		BCC CODE_088C68				;C - - - - - 0x010C65 04:8C55: 90 11
			LDA #$00					;C - - - - - 0x010C67 04:8C57: A9 00
			STA enemyType				;C - - - - - 0x010C69 04:8C59: 85 98
			STA objState+OSLOT_ENEMY				;C - - - - - 0x010C6B 04:8C5B: 8D 6C 05
			LDA #RFLAG_BIG_REWARD					;C - - - - - 0x010C6E 04:8C5E: A9 80
			STA roundFlags				;C - - - - - 0x010C70 04:8C60: 8D 71 04
			LDA #REWARDS_ROUND					;C - - - - - 0x010C73 04:8C63: A9 01
			STA bigRewardCategory				;C - - - - - 0x010C75 04:8C65: 8D 4F 05
	CODE_088C68:
		JMP CODE_088C85				;C - - - - - 0x010C78 04:8C68: 4C 85 8C
CODE_088C6B:
	CMP #$07					;C - - - - - 0x010C7B 04:8C6B: C9 07
	BNE CODE_088C85				;C - - - - - 0x010C7D 04:8C6D: D0 16
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x010C7F 04:8C6F: BD 94 05
	CMP #$30					;C - - - - - 0x010C82 04:8C72: C9 30
	BCS CODE_088C85				;C - - - - - 0x010C84 04:8C74: B0 0F
	LDA #$00					;C - - - - - 0x010C86 04:8C76: A9 00
	STA bgAnimValue				;C - - - - - 0x010C88 04:8C78: 8D CE 04
	LDA #anMadMonkey_ID					;C - - - - - 0x010C8B 04:8C7B: A9 DB
	JSR StartEnemyAnim				;C - - - - - 0x010C8D 04:8C7D: 20 58 99
	LDA #$02					;C - - - - - 0x010C90 04:8C80: A9 02
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x010C92 04:8C82: 9D 6C 05
CODE_088C85:
	LDA objX+OSLOT_ENEMY				;C - - - - - 0x010C95 04:8C85: AD BC 05
	CLC							;C - - - - - 0x010C98 04:8C88: 18
	ADC openingCycle				;C - - - - - 0x010C99 04:8C89: 6D CD 04
	STA objX+OSLOT_ENEMY				;C - - - - - 0x010C9C 04:8C8C: 8D BC 05
	LDA objY+OSLOT_ENEMY				;C - - - - - 0x010C9F 04:8C8F: AD 94 05
	CLC							;C - - - - - 0x010CA2 04:8C92: 18
	ADC bgAnimValue				;C - - - - - 0x010CA3 04:8C93: 6D CE 04
	STA objY+OSLOT_ENEMY				;C - - - - - 0x010CA6 04:8C96: 8D 94 05
CODE_088C99:
	RTS							;C - - - - - 0x010CA9 04:8C99: 60

RocUpdate:
	LDA #$00					;C - - - - - 0x010CAA 04:8C9A: A9 00
	STA ram_04AD				;C - - - - - 0x010CAC 04:8C9C: 8D AD 04
	TXA							;C - - - - - 0x010CAF 04:8C9F: 8A
	PHA							;C - - - - - 0x010CB0 04:8CA0: 48
	JSR CODE_088CA7				;C - - - - - 0x010CB1 04:8CA1: 20 A7 8C
	PLA							;C - - - - - 0x010CB4 04:8CA4: 68
	TAX							;C - - - - - 0x010CB5 04:8CA5: AA
	RTS							;C - - - - - 0x010CB6 04:8CA6: 60

CODE_088CA7:
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x010CB7 04:8CA7: AD 6C 05
	AND #$C0					;C - - - - - 0x010CBA 04:8CAA: 29 C0
	STA scratch8				;C - - - - - 0x010CBC 04:8CAC: 85 08
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x010CBE 04:8CAE: AD 6C 05
	AND #$3F					;C - - - - - 0x010CC1 04:8CB1: 29 3F
	STA objState+OSLOT_ENEMY				;C - - - - - 0x010CC3 04:8CB3: 8D 6C 05
	CMP #$01					;C - - - - - 0x010CC6 04:8CB6: C9 01
	BNE CODE_088CD0				;C - - - - - 0x010CC8 04:8CB8: D0 16
		LDA #$02					;C - - - - - 0x010CCA 04:8CBA: A9 02
		STA objState+OSLOT_ENEMY				;C - - - - - 0x010CCC 04:8CBC: 8D 6C 05
		LDA #$03					;C - - - - - 0x010CCF 04:8CBF: A9 03
		STA openingCycle				;C - - - - - 0x010CD1 04:8CC1: 8D CD 04
		LDA #$FD					;C - - - - - 0x010CD4 04:8CC4: A9 FD
		STA bgAnimValue				;C - - - - - 0x010CD6 04:8CC6: 8D CE 04
		LDA #$00					;C - - - - - 0x010CD9 04:8CC9: A9 00
		STA enemyReward,X				;C - - - - - 0x010CDB 04:8CCB: 95 8E
		JMP CODE_088EB8				;C - - - - - 0x010CDD 04:8CCD: 4C B8 8E
CODE_088CD0:
	CMP #$02					;C - - - - - 0x010CE0 04:8CD0: C9 02
	BEQ CODE_088CD7				;C - - - - - 0x010CE2 04:8CD2: F0 03
		JMP CODE_088DB1				;C - - - - - 0x010CE4 04:8CD4: 4C B1 8D
CODE_088CD7:
	LDA objY+OSLOT_ENEMY				;C - - - - - 0x010CE7 04:8CD7: AD 94 05
	LDY bgAnimValue				;C - - - - - 0x010CEA 04:8CDA: AC CE 04
	BPL CODE_088CE5				;C - - - - - 0x010CED 04:8CDD: 10 06
		CMP #$30					;C - - - - - 0x010CEF 04:8CDF: C9 30
		BCC CODE_088CE9				;C - - - - - 0x010CF1 04:8CE1: 90 06
		BCS CODE_088CF2				;C - - - - - 0x010CF3 04:8CE3: B0 0D
CODE_088CE5:
	CMP #$B4					;C - - - - - 0x010CF5 04:8CE5: C9 B4
	BCC CODE_088CF2				;C - - - - - 0x010CF7 04:8CE7: 90 09
CODE_088CE9:
	LDA #$00					;C - - - - - 0x010CF9 04:8CE9: A9 00
	SEC							;C - - - - - 0x010CFB 04:8CEB: 38
	SBC bgAnimValue				;C - - - - - 0x010CFC 04:8CEC: ED CE 04
	STA bgAnimValue				;C - - - - - 0x010CFF 04:8CEF: 8D CE 04
CODE_088CF2:
	LDA objX+OSLOT_ENEMY				;C - - - - - 0x010D02 04:8CF2: AD BC 05
	LDY openingCycle				;C - - - - - 0x010D05 04:8CF5: AC CD 04
	BPL CODE_088D00				;C - - - - - 0x010D08 04:8CF8: 10 06
		CMP #$24					;C - - - - - 0x010D0A 04:8CFA: C9 24
		BCC CODE_088D04				;C - - - - - 0x010D0C 04:8CFC: 90 06
		BCS CODE_088D13				;C - - - - - 0x010D0E 04:8CFE: B0 13
CODE_088D00:
	CMP #$E0					;C - - - - - 0x010D10 04:8D00: C9 E0
	BCC CODE_088D13				;C - - - - - 0x010D12 04:8D02: 90 0F
CODE_088D04:
	LDA #$00					;C - - - - - 0x010D14 04:8D04: A9 00
	SEC							;C - - - - - 0x010D16 04:8D06: 38
	SBC openingCycle				;C - - - - - 0x010D17 04:8D07: ED CD 04
	STA openingCycle				;C - - - - - 0x010D1A 04:8D0A: 8D CD 04
	LDA enemyDir				;C - - - - - 0x010D1D 04:8D0D: A5 A2
	EOR #$03					;C - - - - - 0x010D1F 04:8D0F: 49 03
	STA enemyDir				;C - - - - - 0x010D21 04:8D11: 85 A2
CODE_088D13:
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x010D23 04:8D13: AD 6C 05
	CMP #$08					;C - - - - - 0x010D26 04:8D16: C9 08
	BNE CODE_088D1D				;C - - - - - 0x010D28 04:8D18: D0 03
		JMP CODE_088EB8				;C - - - - - 0x010D2A 04:8D1A: 4C B8 8E
CODE_088D1D:
	INC ram_00B6				;C - - - - - 0x010D2D 04:8D1D: E6 B6
	LDA ram_00B6				;C - - - - - 0x010D2F 04:8D1F: A5 B6
	CMP #$80					;C - - - - - 0x010D31 04:8D21: C9 80
	BCC CODE_088D3C				;C - - - - - 0x010D33 04:8D23: 90 17
		LDA #$00					;C - - - - - 0x010D35 04:8D25: A9 00
		STA ram_00B6				;C - - - - - 0x010D37 04:8D27: 85 B6
		STA ram_00AC				;C - - - - - 0x010D39 04:8D29: 85 AC
		STA objAnimProgress+OSLOT_ENEMY				;C - - - - - 0x010D3B 04:8D2B: 8D D4 06
		STA objAnimTimer+OSLOT_ENEMY				;C - - - - - 0x010D3E 04:8D2E: 8D AC 06
		LDA #$03					;C - - - - - 0x010D41 04:8D31: A9 03
		STA objState+OSLOT_ENEMY				;C - - - - - 0x010D43 04:8D33: 8D 6C 05
		INC objAnim+OSLOT_ENEMY				;C - - - - - 0x010D46 04:8D36: EE 84 06
		JMP CODE_088DAE				;C - - - - - 0x010D49 04:8D39: 4C AE 8D
CODE_088D3C:
	LDA scratch8				;C - - - - - 0x010D4C 04:8D3C: A5 08
	CMP #$C0					;C - - - - - 0x010D4E 04:8D3E: C9 C0
	BNE CODE_088D99				;C - - - - - 0x010D50 04:8D40: D0 57
		LDA #$08					;C - - - - - 0x010D52 04:8D42: A9 08
		STA objState+OSLOT_ENEMY				;C - - - - - 0x010D54 04:8D44: 8D 6C 05
		LDA #snEnemyHurt_ID					;C - - - - - 0x010D57 04:8D47: A9 2B
		STA a:soundTrigger				;C - - - - - 0x010D59 04:8D49: 8D E1 00
		INC enemyHits				;C - - - - - 0x010D5C 04:8D4C: EE BE 04
		LDA enemyHits				;C - - - - - 0x010D5F 04:8D4F: AD BE 04
		CMP #$19					;C - - - - - 0x010D62 04:8D52: C9 19
		BNE CODE_088D74				;C - - - - - 0x010D64 04:8D54: D0 1E
			LDA #$00					;C - - - - - 0x010D66 04:8D56: A9 00
			STA ram_00B6				;C - - - - - 0x010D68 04:8D58: 85 B6
			STA ram_00B7				;C - - - - - 0x010D6A 04:8D5A: 85 B7
			STA ram_00AC				;C - - - - - 0x010D6C 04:8D5C: 85 AC
			LDA #anRocShoot_ID					;C - - - - - 0x010D6E 04:8D5E: A9 E5
			JSR StartEnemyAnim				;C - - - - - 0x010D70 04:8D60: 20 58 99
			LDA #$03					;C - - - - - 0x010D73 04:8D63: A9 03
			STA objState+OSLOT_ENEMY				;C - - - - - 0x010D75 04:8D65: 8D 6C 05
			LDY #$00					;C - - - - - 0x010D78 04:8D68: A0 00
			JSR DespawnProj_Direct				;C - - - - - 0x010D7A 04:8D6A: 20 73 FE
			INY							;C - - - - - 0x010D7D 04:8D6D: C8
			JSR DespawnProj_Direct				;C - - - - - 0x010D7E 04:8D6E: 20 73 FE
			JMP CODE_088D99				;C - - - - - 0x010D81 04:8D71: 4C 99 8D
	CODE_088D74:
		CMP #$32					;C - - - - - 0x010D84 04:8D74: C9 32
		BCC CODE_088D99				;C - - - - - 0x010D86 04:8D76: 90 21
			LDA #trVictory_ID					;C - - - - - 0x010D88 04:8D78: A9 0A
			STA a:musicTrigger				;C - - - - - 0x010D8A 04:8D7A: 8D E0 00
			LDA #snBomb_ID					;C - - - - - 0x010D8D 04:8D7D: A9 29
			STA a:soundTrigger				;C - - - - - 0x010D8F 04:8D7F: 8D E1 00
			LDA #$09					;C - - - - - 0x010D92 04:8D82: A9 09
			STA objState+OSLOT_ENEMY				;C - - - - - 0x010D94 04:8D84: 8D 6C 05
			LDA #.LOBYTE(anRocDie_ID)					;C - - - - - 0x010D97 04:8D87: A9 2F
			STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x010D99 04:8D89: 9D 84 06
			LDA #.HIBYTE(anRocDie_ID)					;C - - - - - 0x010D9C 04:8D8C: A9 01
			STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x010D9E 04:8D8E: 9D 24 07
			LDA #$00					;C - - - - - 0x010DA1 04:8D91: A9 00
			STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x010DA3 04:8D93: 9D AC 06
			STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x010DA6 04:8D96: 9D D4 06
CODE_088D99:
	LDA enemyHits				;C - - - - - 0x010DA9 04:8D99: AD BE 04
	CMP #$1A					;C - - - - - 0x010DAC 04:8D9C: C9 1A
	BCC CODE_088DAE				;C - - - - - 0x010DAE 04:8D9E: 90 0E
		LDA globalTimer				;C - - - - - 0x010DB0 04:8DA0: A5 14
		AND #$07					;C - - - - - 0x010DB2 04:8DA2: 29 07
		BNE CODE_088DAE				;C - - - - - 0x010DB4 04:8DA4: D0 08
			LDA objAttr+OSLOT_ENEMY				;C - - - - - 0x010DB6 04:8DA6: AD FC 06
			EOR #$03					;C - - - - - 0x010DB9 04:8DA9: 49 03
			STA objAttr+OSLOT_ENEMY				;C - - - - - 0x010DBB 04:8DAB: 8D FC 06
CODE_088DAE:
	JMP CODE_088EB8				;C - - - - - 0x010DBE 04:8DAE: 4C B8 8E
CODE_088DB1:
	CMP #$03					;C - - - - - 0x010DC1 04:8DB1: C9 03
	BNE CODE_088DF5				;C - - - - - 0x010DC3 04:8DB3: D0 40
		LDY #$00					;C - - - - - 0x010DC5 04:8DB5: A0 00
		JSR DespawnProj_Direct				;C - - - - - 0x010DC7 04:8DB7: 20 73 FE
		INY							;C - - - - - 0x010DCA 04:8DBA: C8
		JSR DespawnProj_Direct				;C - - - - - 0x010DCB 04:8DBB: 20 73 FE
		LDA globalTimer				;C - - - - - 0x010DCE 04:8DBE: A5 14
		AND #$03					;C - - - - - 0x010DD0 04:8DC0: 29 03
		BNE CODE_088DEC				;C - - - - - 0x010DD2 04:8DC2: D0 28
			LDY ram_00AC				;C - - - - - 0x010DD4 04:8DC4: A4 AC
			LDA DATA_088DEF,Y			;C - - - - - 0x010DD6 04:8DC6: B9 EF 8D
			STA colorBuffer+COL_SPR				;C - - - - - 0x010DD9 04:8DC9: 8D 10 03
			INY							;C - - - - - 0x010DDC 04:8DCC: C8
			STY ram_00AC				;C - - - - - 0x010DDD 04:8DCD: 84 AC
			CPY #$06					;C - - - - - 0x010DDF 04:8DCF: C0 06
			BNE CODE_088DEC				;C - - - - - 0x010DE1 04:8DD1: D0 19
				LDA #$00					;C - - - - - 0x010DE3 04:8DD3: A9 00
				STA ram_00AC				;C - - - - - 0x010DE5 04:8DD5: 85 AC
				LDA enemyHits				;C - - - - - 0x010DE7 04:8DD7: AD BE 04
				CMP #$19					;C - - - - - 0x010DEA 04:8DDA: C9 19
				BCC CODE_088DE9				;C - - - - - 0x010DEC 04:8DDC: 90 0B
				BEQ CODE_088DE6				;C - - - - - 0x010DEE 04:8DDE: F0 06
					INC objState+OSLOT_ENEMY				;C - - - - - 0x010DF0 04:8DE0: EE 6C 05
					INC objState+OSLOT_ENEMY				;C - - - - - 0x010DF3 04:8DE3: EE 6C 05
			CODE_088DE6:
				INC objState+OSLOT_ENEMY				;C - - - - - 0x010DF6 04:8DE6: EE 6C 05
			CODE_088DE9:
				INC objState+OSLOT_ENEMY				;C - - - - - 0x010DF9 04:8DE9: EE 6C 05
	CODE_088DEC:
		JMP CODE_088ECC				;C - - - - - 0x010DFC 04:8DEC: 4C CC 8E

DATA_088DEF:
	.byte $30					;- D 0 - - - 0x010DFF 04:8DEF: 30
	.byte $0F					;- D 0 - - - 0x010E00 04:8DF0: 0F
	.byte $30					;- D 0 - - - 0x010E01 04:8DF1: 30
	.byte $0F					;- D 0 - - - 0x010E02 04:8DF2: 0F
	.byte $30					;- D 0 - - - 0x010E03 04:8DF3: 30
	.byte $0F					;- D 0 - - - 0x010E04 04:8DF4: 0F

CODE_088DF5:
	CMP #$04					;C - - - - - 0x010E05 04:8DF5: C9 04
	BNE CODE_088E23				;C - - - - - 0x010E07 04:8DF7: D0 2A
	LDA #$02					;C - - - - - 0x010E09 04:8DF9: A9 02
	STA objState+OSLOT_ENEMY				;C - - - - - 0x010E0B 04:8DFB: 8D 6C 05
	LDA #anRoc_ID					;C - - - - - 0x010E0E 04:8DFE: A9 E4
	JSR StartEnemyAnim				;C - - - - - 0x010E10 04:8E00: 20 58 99
	LDA #psBossProj_ID					;C - - - - - 0x010E13 04:8E03: A9 1C
	STA scratch5				;C - - - - - 0x010E15 04:8E05: 85 05
	LDA #$20					;C - - - - - 0x010E17 04:8E07: A9 20
	JSR CODE_088ECD				;C - - - - - 0x010E19 04:8E09: 20 CD 8E
	JSR CODE_088EEF				;C - - - - - 0x010E1C 04:8E0C: 20 EF 8E
	LDA #psBossProj_ID					;C - - - - - 0x010E1F 04:8E0F: A9 1C
	STA scratch5				;C - - - - - 0x010E21 04:8E11: 85 05
	LDA #$E0					;C - - - - - 0x010E23 04:8E13: A9 E0
	JSR CODE_088ECD				;C - - - - - 0x010E25 04:8E15: 20 CD 8E
	JSR CODE_088EEF				;C - - - - - 0x010E28 04:8E18: 20 EF 8E
	LDA #snThunder_ID					;C - - - - - 0x010E2B 04:8E1B: A9 11
	STA a:soundTrigger				;C - - - - - 0x010E2D 04:8E1D: 8D E1 00
	JMP CODE_088EB8				;C - - - - - 0x010E30 04:8E20: 4C B8 8E
CODE_088E23:
	CMP #$05					;C - - - - - 0x010E33 04:8E23: C9 05
	BNE CODE_088E4E				;C - - - - - 0x010E35 04:8E25: D0 27
		LDA #$06					;C - - - - - 0x010E37 04:8E27: A9 06
		STA objState+OSLOT_ENEMY				;C - - - - - 0x010E39 04:8E29: 8D 6C 05
		LDA #$00					;C - - - - - 0x010E3C 04:8E2C: A9 00
		STA scratch1				;C - - - - - 0x010E3E 04:8E2E: 85 01
		LDX #$00					;C - - - - - 0x010E40 04:8E30: A2 00
		LDA #psRocNextPhase_ID					;C - - - - - 0x010E42 04:8E32: A9 1D
		STA scratch5				;C - - - - - 0x010E44 04:8E34: 85 05
		JSR CODE_088ECD				;C - - - - - 0x010E46 04:8E36: 20 CD 8E
		JSR CODE_088F23				;C - - - - - 0x010E49 04:8E39: 20 23 8F
		LDA #snThunder_ID					;C - - - - - 0x010E4C 04:8E3C: A9 11
		STA a:soundTrigger				;C - - - - - 0x010E4E 04:8E3E: 8D E1 00
		LDA #psRocNextPhase_ID					;C - - - - - 0x010E51 04:8E41: A9 1D
		STA scratch5				;C - - - - - 0x010E53 04:8E43: 85 05
		JSR CODE_088ECD				;C - - - - - 0x010E55 04:8E45: 20 CD 8E
		JSR CODE_088F4D				;C - - - - - 0x010E58 04:8E48: 20 4D 8F
		JMP CODE_088EB8				;C - - - - - 0x010E5B 04:8E4B: 4C B8 8E
CODE_088E4E:
	CMP #$06					;C - - - - - 0x010E5E 04:8E4E: C9 06
	BNE CODE_088E55				;C - - - - - 0x010E60 04:8E50: D0 03
		JMP CODE_088ECC				;C - - - - - 0x010E62 04:8E52: 4C CC 8E
CODE_088E55:
	CMP #$07					;C - - - - - 0x010E65 04:8E55: C9 07
	BNE CODE_088E7C				;C - - - - - 0x010E67 04:8E57: D0 23
		LDA #$02					;C - - - - - 0x010E69 04:8E59: A9 02
		STA objState+OSLOT_ENEMY				;C - - - - - 0x010E6B 04:8E5B: 8D 6C 05
		LDA #anRocMad_ID					;C - - - - - 0x010E6E 04:8E5E: A9 E6
		JSR StartEnemyAnim				;C - - - - - 0x010E70 04:8E60: 20 58 99
		LDA #snThunder_ID					;C - - - - - 0x010E73 04:8E63: A9 11
		STA a:soundTrigger				;C - - - - - 0x010E75 04:8E65: 8D E1 00
		LDA #$01					;C - - - - - 0x010E78 04:8E68: A9 01
		STA objAttr+OSLOT_ENEMY				;C - - - - - 0x010E7A 04:8E6A: 8D FC 06
		LDA #$01					;C - - - - - 0x010E7D 04:8E6D: A9 01
		STA scratch4				;C - - - - - 0x010E7F 04:8E6F: 85 04
		JSR CODE_0898F6				;C - - - - - 0x010E81 04:8E71: 20 F6 98
		LDA #snThunder_ID					;C - - - - - 0x010E84 04:8E74: A9 11
		STA a:soundTrigger				;C - - - - - 0x010E86 04:8E76: 8D E1 00
		JMP CODE_088EB8				;C - - - - - 0x010E89 04:8E79: 4C B8 8E
CODE_088E7C:
	CMP #$08					;C - - - - - 0x010E8C 04:8E7C: C9 08
	BNE CODE_088E86				;C - - - - - 0x010E8E 04:8E7E: D0 06
		JSR CODE_089934				;C - - - - - 0x010E90 04:8E80: 20 34 99
		JMP CODE_088CD7				;C - - - - - 0x010E93 04:8E83: 4C D7 8C
CODE_088E86:
	CMP #$09					;C - - - - - 0x010E96 04:8E86: C9 09
	BNE CODE_088EB8				;C - - - - - 0x010E98 04:8E88: D0 2E
		LDA #$80					;C - - - - - 0x010E9A 04:8E8A: A9 80
		STA ram_00C0,X				;C - - - - - 0x010E9C 04:8E8C: 95 C0
		LDA objAttr+OSLOT_ENEMY				;C - - - - - 0x010E9E 04:8E8E: AD FC 06
		EOR #$02					;C - - - - - 0x010EA1 04:8E91: 49 02
		STA objAttr+OSLOT_ENEMY				;C - - - - - 0x010EA3 04:8E93: 8D FC 06
		LDA #$00					;C - - - - - 0x010EA6 04:8E96: A9 00
		STA openingCycle				;C - - - - - 0x010EA8 04:8E98: 8D CD 04
		LDA #$02					;C - - - - - 0x010EAB 04:8E9B: A9 02
		STA bgAnimValue				;C - - - - - 0x010EAD 04:8E9D: 8D CE 04
		LDA objY+OSLOT_ENEMY				;C - - - - - 0x010EB0 04:8EA0: AD 94 05
		CMP #$F0					;C - - - - - 0x010EB3 04:8EA3: C9 F0
		BCC CODE_088EB8				;C - - - - - 0x010EB5 04:8EA5: 90 11
			LDA #$00					;C - - - - - 0x010EB7 04:8EA7: A9 00
			STA enemyType				;C - - - - - 0x010EB9 04:8EA9: 85 98
			STA objState+OSLOT_ENEMY				;C - - - - - 0x010EBB 04:8EAB: 8D 6C 05

			LDA #RFLAG_BIG_REWARD					;C - - - - - 0x010EBE 04:8EAE: A9 80
			STA roundFlags				;C - - - - - 0x010EC0 04:8EB0: 8D 71 04

			LDA #REWARDS_ROUND					;C - - - - - 0x010EC3 04:8EB3: A9 01
			STA bigRewardCategory				;C - - - - - 0x010EC5 04:8EB5: 8D 4F 05
CODE_088EB8:
	LDA objX+OSLOT_ENEMY				;C - - - - - 0x010EC8 04:8EB8: AD BC 05
	CLC							;C - - - - - 0x010ECB 04:8EBB: 18
	ADC openingCycle				;C - - - - - 0x010ECC 04:8EBC: 6D CD 04
	STA objX+OSLOT_ENEMY				;C - - - - - 0x010ECF 04:8EBF: 8D BC 05
	LDA objY+OSLOT_ENEMY				;C - - - - - 0x010ED2 04:8EC2: AD 94 05
	CLC							;C - - - - - 0x010ED5 04:8EC5: 18
	ADC bgAnimValue				;C - - - - - 0x010ED6 04:8EC6: 6D CE 04
	STA objY+OSLOT_ENEMY				;C - - - - - 0x010ED9 04:8EC9: 8D 94 05
CODE_088ECC:
	RTS							;C - - - - - 0x010EDC 04:8ECC: 60

CODE_088ECD:
	;05: Proj ID
	CLC							;C - - - - - 0x010EDD 04:8ECD: 18
	ADC objX+OSLOT_ENEMY				;C - - - - - 0x010EDE 04:8ECE: 6D BC 05
	STA scratch0				;C - - - - - 0x010EE1 04:8ED1: 85 00
	LDA #$10					;C - - - - - 0x010EE3 04:8ED3: A9 10
	STA scratch1				;C - - - - - 0x010EE5 04:8ED5: 85 01
	LDX #$00					;C - - - - - 0x010EE7 04:8ED7: A2 00
	LDA #.LOBYTE(anRocBigLightning_ID)					;C - - - - - 0x010EE9 04:8ED9: A9 E8
	STA scratch6				;C - - - - - 0x010EEB 04:8EDB: 85 06
	LDA #.HIBYTE(anRocBigLightning_ID)					;C - - - - - 0x010EED 04:8EDD: A9 00
	STA scratch7				;C - - - - - 0x010EEF 04:8EDF: 85 07
	LDA objChrSlot+OSLOT_ENEMY				;C - - - - - 0x010EF1 04:8EE1: AD 34 06
	STA scratch2				;C - - - - - 0x010EF4 04:8EE4: 85 02
	JSR SpawnProj				;C - - - - - 0x010EF6 04:8EE6: 20 82 FE
	LDA #snBomb_ID					;C - - - - - 0x010EF9 04:8EE9: A9 29
	STA a:soundTrigger				;C - - - - - 0x010EFB 04:8EEB: 8D E1 00
	RTS							;C - - - - - 0x010EFE 04:8EEE: 60

CODE_088EEF:
	LDA #$06					;C - - - - - 0x010EFF 04:8EEF: A9 06
	STA projVSpeed,Y				;C - - - - - 0x010F01 04:8EF1: 99 35 05
	LDA objX+OSLOT_PROJ,Y				;C - - - - - 0x010F04 04:8EF4: B9 B4 05
	SEC							;C - - - - - 0x010F07 04:8EF7: 38
	SBC objX				;C - - - - - 0x010F08 04:8EF8: ED B3 05
	BCS CODE_088F02				;C - - - - - 0x010F0B 04:8EFB: B0 05
		EOR #$FF					;C - - - - - 0x010F0D 04:8EFD: 49 FF
		CLC							;C - - - - - 0x010F0F 04:8EFF: 18
		ADC #$01					;C - - - - - 0x010F10 04:8F00: 69 01
CODE_088F02:
	LSR							;C - - - - - 0x010F12 04:8F02: 4A
	LSR							;C - - - - - 0x010F13 04:8F03: 4A
	LSR							;C - - - - - 0x010F14 04:8F04: 4A
	LSR							;C - - - - - 0x010F15 04:8F05: 4A
	CMP #$08					;C - - - - - 0x010F16 04:8F06: C9 08
	BCC CODE_088F0C				;C - - - - - 0x010F18 04:8F08: 90 02
		LDA #$08					;C - - - - - 0x010F1A 04:8F0A: A9 08
CODE_088F0C:
	STA scratch0				;C - - - - - 0x010F1C 04:8F0C: 85 00
	LDA objX+OSLOT_PROJ,Y				;C - - - - - 0x010F1E 04:8F0E: B9 B4 05
	CMP objX				;C - - - - - 0x010F21 04:8F11: CD B3 05
	BCC CODE_088F1D				;C - - - - - 0x010F24 04:8F14: 90 07
		LDA #$00					;C - - - - - 0x010F26 04:8F16: A9 00
		SEC							;C - - - - - 0x010F28 04:8F18: 38
		SBC scratch0				;C - - - - - 0x010F29 04:8F19: E5 00
		STA scratch0				;C - - - - - 0x010F2B 04:8F1B: 85 00
CODE_088F1D:
	LDA scratch0				;C - - - - - 0x010F2D 04:8F1D: A5 00
	STA projHSpeed,Y				;C - - - - - 0x010F2F 04:8F1F: 99 2D 05
	RTS							;C - - - - - 0x010F32 04:8F22: 60

CODE_088F23:
	LDA #$FE					;C - - - - - 0x010F33 04:8F23: A9 FE
	STA projHSpeed,Y				;C - - - - - 0x010F35 04:8F25: 99 2D 05
	LDA #$08					;C - - - - - 0x010F38 04:8F28: A9 08
	STA projVSpeed,Y				;C - - - - - 0x010F3A 04:8F2A: 99 35 05
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x010F3D 04:8F2D: BD 94 05
	LSR							;C - - - - - 0x010F40 04:8F30: 4A
	LSR							;C - - - - - 0x010F41 04:8F31: 4A
	CLC							;C - - - - - 0x010F42 04:8F32: 18
	ADC objX+OSLOT_ENEMY,X				;C - - - - - 0x010F43 04:8F33: 7D BC 05
	BCC CODE_088F49				;C - - - - - 0x010F46 04:8F36: 90 11
		;Unreached
		LDA #$02					;- - - - - - 0x010F48 04:8F38: A9
		STA projHSpeed,Y				;- - - - - - 0x010F4A 04:8F3A: 99
		LDA objY+OSLOT_ENEMY,X				;- - - - - - 0x010F4D 04:8F3D: BD
		LSR							;- - - - - - 0x010F50 04:8F40: 4A
		STA scratch0				;- - - - - - 0x010F51 04:8F41: 85
		LDA objX+OSLOT_ENEMY,X				;- - - - - - 0x010F53 04:8F43: BD
		SEC							;- - - - - - 0x010F56 04:8F46: 38
		SBC scratch0				;- - - - - - 0x010F57 04:8F47: E5
CODE_088F49:
	STA objX+OSLOT_PROJ,Y				;C - - - - - 0x010F59 04:8F49: 99 B4 05
	RTS							;C - - - - - 0x010F5C 04:8F4C: 60

CODE_088F4D:
	LDA #$02					;C - - - - - 0x010F5D 04:8F4D: A9 02
	STA projHSpeed,Y				;C - - - - - 0x010F5F 04:8F4F: 99 2D 05
	LDA #$08					;C - - - - - 0x010F62 04:8F52: A9 08
	STA projVSpeed,Y				;C - - - - - 0x010F64 04:8F54: 99 35 05
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x010F67 04:8F57: BD 94 05
	LSR							;C - - - - - 0x010F6A 04:8F5A: 4A
	LSR							;C - - - - - 0x010F6B 04:8F5B: 4A
	STA scratch0				;C - - - - - 0x010F6C 04:8F5C: 85 00
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x010F6E 04:8F5E: BD BC 05
	SEC							;C - - - - - 0x010F71 04:8F61: 38
	SBC scratch0				;C - - - - - 0x010F72 04:8F62: E5 00
	BCS CODE_088F73				;C - - - - - 0x010F74 04:8F64: B0 0D
		;Unreached
		LDA #$FE					;- - - - - - 0x010F76 04:8F66: A9
		STA projHSpeed,Y				;- - - - - - 0x010F78 04:8F68: 99
		LDA objY+OSLOT_ENEMY,X				;- - - - - - 0x010F7B 04:8F6B: BD
		LSR							;- - - - - - 0x010F7E 04:8F6E: 4A
		CLC							;- - - - - - 0x010F7F 04:8F6F: 18
		ADC objX+OSLOT_ENEMY,X				;- - - - - - 0x010F80 04:8F70: 7D
CODE_088F73:
	STA objX+OSLOT_PROJ,Y				;C - - - - - 0x010F83 04:8F73: 99 B4 05
	RTS							;C - - - - - 0x010F86 04:8F76: 60

SuperDrunkUpdate:
	LDA #$00					;C - - - - - 0x010F87 04:8F77: A9 00
	STA ram_04AD				;C - - - - - 0x010F89 04:8F79: 8D AD 04
	JSR CODE_088F80				;C - - - - - 0x010F8C 04:8F7C: 20 80 8F
	RTS							;C - - - - - 0x010F8F 04:8F7F: 60

CODE_088F80:
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x010F90 04:8F80: AD 6C 05
	STA scratch8				;C - - - - - 0x010F93 04:8F83: 85 08
	AND #$3F					;C - - - - - 0x010F95 04:8F85: 29 3F
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x010F97 04:8F87: 9D 6C 05
	CMP #$01					;C - - - - - 0x010F9A 04:8F8A: C9 01
	BNE CODE_088FB4				;C - - - - - 0x010F9C 04:8F8C: D0 26
		LDA #$00					;C - - - - - 0x010F9E 04:8F8E: A9 00
		STA enemyReward,X				;C - - - - - 0x010FA0 04:8F90: 95 8E
		STA enemyHits+8				;C - - - - - 0x010FA2 04:8F92: 8D C6 04
		LDA #$00					;C - - - - - 0x010FA5 04:8F95: A9 00
		STA openingCounter				;C - - - - - 0x010FA7 04:8F97: 8D CC 04
		STA enemyHits				;C - - - - - 0x010FAA 04:8F9A: 8D BE 04
		STA openingStage				;C - - - - - 0x010FAD 04:8F9D: 8D CF 04
		LDA #$FE					;C - - - - - 0x010FB0 04:8FA0: A9 FE
		STA openingCycle				;C - - - - - 0x010FB2 04:8FA2: 8D CD 04
		STA bgAnimValue				;C - - - - - 0x010FB5 04:8FA5: 8D CE 04
		LDA #$01					;C - - - - - 0x010FB8 04:8FA8: A9 01
		STA enemyDir				;C - - - - - 0x010FBA 04:8FAA: 85 A2
		LDA #$02					;C - - - - - 0x010FBC 04:8FAC: A9 02
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x010FBE 04:8FAE: 9D 6C 05
		JMP CODE_0890E2				;C - - - - - 0x010FC1 04:8FB1: 4C E2 90
CODE_088FB4:
	CMP #$02					;C - - - - - 0x010FC4 04:8FB4: C9 02
	BEQ CODE_088FBB				;C - - - - - 0x010FC6 04:8FB6: F0 03
		JMP CODE_089078				;C - - - - - 0x010FC8 04:8FB8: 4C 78 90
CODE_088FBB:
	LDA #$02					;C - - - - - 0x010FCB 04:8FBB: A9 02
	STA objAttr+OSLOT_ENEMY				;C - - - - - 0x010FCD 04:8FBD: 8D FC 06
CODE_088FC0:
	INC openingCounter				;C - - - - - 0x010FD0 04:8FC0: EE CC 04
	LDA openingCounter				;C - - - - - 0x010FD3 04:8FC3: AD CC 04
	CMP #$40					;C - - - - - 0x010FD6 04:8FC6: C9 40
	BCC CODE_088FD9				;C - - - - - 0x010FD8 04:8FC8: 90 0F
		LDA #$00					;C - - - - - 0x010FDA 04:8FCA: A9 00
		STA openingCounter				;C - - - - - 0x010FDC 04:8FCC: 8D CC 04
		LDA #$03					;C - - - - - 0x010FDF 04:8FCF: A9 03
		STA objState+OSLOT_ENEMY				;C - - - - - 0x010FE1 04:8FD1: 8D 6C 05
		LDA #$02					;C - - - - - 0x010FE4 04:8FD4: A9 02
		STA objAttr+OSLOT_ENEMY				;C - - - - - 0x010FE6 04:8FD6: 8D FC 06
CODE_088FD9:
	LDA objY+OSLOT_ENEMY				;C - - - - - 0x010FE9 04:8FD9: AD 94 05
	LDY bgAnimValue				;C - - - - - 0x010FEC 04:8FDC: AC CE 04
	BPL CODE_088FE7				;C - - - - - 0x010FEF 04:8FDF: 10 06
		CMP #$30					;C - - - - - 0x010FF1 04:8FE1: C9 30
		BCC CODE_088FEB				;C - - - - - 0x010FF3 04:8FE3: 90 06
		BCS CODE_088FF4				;C - - - - - 0x010FF5 04:8FE5: B0 0D
CODE_088FE7:
	CMP #$B4					;C - - - - - 0x010FF7 04:8FE7: C9 B4
	BCC CODE_088FF4				;C - - - - - 0x010FF9 04:8FE9: 90 09
CODE_088FEB:
	LDA #$00					;C - - - - - 0x010FFB 04:8FEB: A9 00
	SEC							;C - - - - - 0x010FFD 04:8FED: 38
	SBC bgAnimValue				;C - - - - - 0x010FFE 04:8FEE: ED CE 04
	STA bgAnimValue				;C - - - - - 0x011001 04:8FF1: 8D CE 04
CODE_088FF4:
	LDA objX+OSLOT_ENEMY				;C - - - - - 0x011004 04:8FF4: AD BC 05
	LDY openingCycle				;C - - - - - 0x011007 04:8FF7: AC CD 04
	BPL CODE_089002				;C - - - - - 0x01100A 04:8FFA: 10 06
	CMP #$24					;C - - - - - 0x01100C 04:8FFC: C9 24
	BCC CODE_089006				;C - - - - - 0x01100E 04:8FFE: 90 06
		BCS CODE_089020				;C - - - - - 0x011010 04:9000: B0 1E
	CODE_089002:
		CMP #$E0					;C - - - - - 0x011012 04:9002: C9 E0
		BCC CODE_089020				;C - - - - - 0x011014 04:9004: 90 1A
CODE_089006:
	LDA #$00					;C - - - - - 0x011016 04:9006: A9 00
	SEC							;C - - - - - 0x011018 04:9008: 38
	SBC openingCycle				;C - - - - - 0x011019 04:9009: ED CD 04
	STA openingCycle				;C - - - - - 0x01101C 04:900C: 8D CD 04
	LDA objAnim+OSLOT_ENEMY				;C - - - - - 0x01101F 04:900F: AD 84 06
	EOR #$01					;C - - - - - 0x011022 04:9012: 49 01
	JSR StartEnemyAnim				;C - - - - - 0x011024 04:9014: 20 58 99
	STA objAnimHI+OSLOT_ENEMY				;C - - - - - 0x011027 04:9017: 8D 24 07
	LDA enemyDir				;C - - - - - 0x01102A 04:901A: A5 A2
	EOR #$03					;C - - - - - 0x01102C 04:901C: 49 03
	STA enemyDir				;C - - - - - 0x01102E 04:901E: 85 A2
CODE_089020:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x011030 04:9020: BD 6C 05
	CMP #$05					;C - - - - - 0x011033 04:9023: C9 05
	BEQ CODE_089075				;C - - - - - 0x011035 04:9025: F0 4E
		LDA scratch8				;C - - - - - 0x011037 04:9027: A5 08
		AND #$C0					;C - - - - - 0x011039 04:9029: 29 C0
		CMP #$C0					;C - - - - - 0x01103B 04:902B: C9 C0
		BNE CODE_089075				;C - - - - - 0x01103D 04:902D: D0 46
			LDA #$05					;C - - - - - 0x01103F 04:902F: A9 05
			STA objState+OSLOT_ENEMY				;C - - - - - 0x011041 04:9031: 8D 6C 05
			LDA #$01					;C - - - - - 0x011044 04:9034: A9 01
			STA objAttr+OSLOT_ENEMY				;C - - - - - 0x011046 04:9036: 8D FC 06
			LDA #snEnemyHurt_ID					;C - - - - - 0x011049 04:9039: A9 2B
			STA a:soundTrigger				;C - - - - - 0x01104B 04:903B: 8D E1 00
			INC enemyHits				;C - - - - - 0x01104E 04:903E: EE BE 04
			LDA enemyHits				;C - - - - - 0x011051 04:9041: AD BE 04
			CMP #$0A					;C - - - - - 0x011054 04:9044: C9 0A
			BNE CODE_089075				;C - - - - - 0x011056 04:9046: D0 2D
				LDA #$02					;C - - - - - 0x011058 04:9048: A9 02
				STA scratch4				;C - - - - - 0x01105A 04:904A: 85 04
				JSR CODE_0898F6				;C - - - - - 0x01105C 04:904C: 20 F6 98

				LDA #trVictory_ID					;C - - - - - 0x01105F 04:904F: A9 0A
				STA a:musicTrigger				;C - - - - - 0x011061 04:9051: 8D E0 00
				LDA #snBomb_ID					;C - - - - - 0x011064 04:9054: A9 29
				STA a:soundTrigger				;C - - - - - 0x011066 04:9056: 8D E1 00

				LDA #$04					;C - - - - - 0x011069 04:9059: A9 04
				STA objState+OSLOT_ENEMY				;C - - - - - 0x01106B 04:905B: 8D 6C 05
				LDA #$02					;C - - - - - 0x01106E 04:905E: A9 02
				STA objAttr+OSLOT_ENEMY				;C - - - - - 0x011070 04:9060: 8D FC 06
				LDA #$01					;C - - - - - 0x011073 04:9063: A9 01
				STA openingCycle				;C - - - - - 0x011075 04:9065: 8D CD 04
				LDA #$03					;C - - - - - 0x011078 04:9068: A9 03
				STA bgAnimValue				;C - - - - - 0x01107A 04:906A: 8D CE 04
				LDA #anSuperDrunkDebrisC_ID					;C - - - - - 0x01107D 04:906D: A9 F3
				JSR StartEnemyAnim				;C - - - - - 0x01107F 04:906F: 20 58 99
				STA objAnimHI+OSLOT_ENEMY				;C - - - - - 0x011082 04:9072: 8D 24 07
CODE_089075:
	JMP CODE_0890E2				;C - - - - - 0x011085 04:9075: 4C E2 90
CODE_089078:
	CMP #$03					;C - - - - - 0x011088 04:9078: C9 03
	BNE CODE_089090				;C - - - - - 0x01108A 04:907A: D0 14
		LDA #snEnemyThrow_ID					;C - - - - - 0x01108C 04:907C: A9 26
		STA a:soundTrigger				;C - - - - - 0x01108E 04:907E: 8D E1 00
		LDA #$02					;C - - - - - 0x011091 04:9081: A9 02
		STA objState+OSLOT_ENEMY				;C - - - - - 0x011093 04:9083: 8D 6C 05
		LDA #$03					;C - - - - - 0x011096 04:9086: A9 03
		STA scratch4				;C - - - - - 0x011098 04:9088: 85 04
		JSR CODE_0898F6				;C - - - - - 0x01109A 04:908A: 20 F6 98
		JMP CODE_0890E2				;C - - - - - 0x01109D 04:908D: 4C E2 90
CODE_089090:
	CMP #$04					;C - - - - - 0x0110A0 04:9090: C9 04
	BNE CODE_0890B9				;C - - - - - 0x0110A2 04:9092: D0 25
		LDA #$80					;C - - - - - 0x0110A4 04:9094: A9 80
		STA ram_00C0,X				;C - - - - - 0x0110A6 04:9096: 95 C0
		LDA objY+OSLOT_ENEMY				;C - - - - - 0x0110A8 04:9098: AD 94 05
		CMP #$F0					;C - - - - - 0x0110AB 04:909B: C9 F0
		BCC CODE_0890B6				;C - - - - - 0x0110AD 04:909D: 90 17
			LDA #$00					;C - - - - - 0x0110AF 04:909F: A9 00
			STA openingCycle				;C - - - - - 0x0110B1 04:90A1: 8D CD 04
			STA bgAnimValue				;C - - - - - 0x0110B4 04:90A4: 8D CE 04
			INC enemyHits+8				;C - - - - - 0x0110B7 04:90A7: EE C6 04
			LDA enemyHits+8				;C - - - - - 0x0110BA 04:90AA: AD C6 04
			CMP #$D2					;C - - - - - 0x0110BD 04:90AD: C9 D2
			BCC CODE_0890B6				;C - - - - - 0x0110BF 04:90AF: 90 05
				LDA #$01					;C - - - - - 0x0110C1 04:90B1: A9 01
				STA roundFlags				;C - - - - - 0x0110C3 04:90B3: 8D 71 04
	CODE_0890B6:
		JMP CODE_0890E2				;C - - - - - 0x0110C6 04:90B6: 4C E2 90
CODE_0890B9:
	CMP #$05					;C - - - - - 0x0110C9 04:90B9: C9 05
	BNE CODE_0890C3				;C - - - - - 0x0110CB 04:90BB: D0 06
		JSR CODE_089934				;C - - - - - 0x0110CD 04:90BD: 20 34 99
		JMP CODE_088FC0				;C - - - - - 0x0110D0 04:90C0: 4C C0 8F
CODE_0890C3:
	CMP #$06					;C - - - - - 0x0110D3 04:90C3: C9 06
	BNE CODE_0890E2				;C - - - - - 0x0110D5 04:90C5: D0 1B
		LDA #$02					;C - - - - - 0x0110D7 04:90C7: A9 02
		STA objAttr+OSLOT_ENEMY				;C - - - - - 0x0110D9 04:90C9: 8D FC 06
		LDA #$01					;C - - - - - 0x0110DC 04:90CC: A9 01
		STA bgAnimValue				;C - - - - - 0x0110DE 04:90CE: 8D CE 04
		LDA #$00					;C - - - - - 0x0110E1 04:90D1: A9 00
		STA openingCycle				;C - - - - - 0x0110E3 04:90D3: 8D CD 04
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0110E6 04:90D6: BD 94 05
		CMP #$80					;C - - - - - 0x0110E9 04:90D9: C9 80
		BCC CODE_0890E2				;C - - - - - 0x0110EB 04:90DB: 90 05
			LDA #$01					;C - - - - - 0x0110ED 04:90DD: A9 01
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0110EF 04:90DF: 9D 6C 05
CODE_0890E2:
	LDA objX+OSLOT_ENEMY				;C - - - - - 0x0110F2 04:90E2: AD BC 05
	CLC							;C - - - - - 0x0110F5 04:90E5: 18
	ADC openingCycle				;C - - - - - 0x0110F6 04:90E6: 6D CD 04
	STA objX+OSLOT_ENEMY				;C - - - - - 0x0110F9 04:90E9: 8D BC 05
	LDA objY+OSLOT_ENEMY				;C - - - - - 0x0110FC 04:90EC: AD 94 05
	CLC							;C - - - - - 0x0110FF 04:90EF: 18
	ADC bgAnimValue				;C - - - - - 0x011100 04:90F0: 6D CE 04
	STA objY+OSLOT_ENEMY				;C - - - - - 0x011103 04:90F3: 8D 94 05
	RTS							;C - - - - - 0x011106 04:90F6: 60

BlueSkullUpdate:
	JSR CODE_089101				;C - - - - - 0x011107 04:90F7: 20 01 91
	LDA currentRound				;C - - - - - 0x01110A 04:90FA: A5 D8
	CMP #70					;C - - - - - 0x01110C 04:90FC: C9 46
	BNE CODE_089100				;C - - - - - 0x01110E 04:90FE: D0 00
CODE_089100:
	RTS							;C - - - - - 0x011110 04:9100: 60

CODE_089101:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x011111 04:9101: BD 6C 05
	STA scratch8				;C - - - - - 0x011114 04:9104: 85 08
	AND #$3F					;C - - - - - 0x011116 04:9106: 29 3F
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011118 04:9108: 9D 6C 05
	CMP #$01					;C - - - - - 0x01111B 04:910B: C9 01
	BNE CODE_089135				;C - - - - - 0x01111D 04:910D: D0 26
		LDA currentRound				;C - - - - - 0x01111F 04:910F: A5 D8
		CMP #$4F					;C - - - - - 0x011121 04:9111: C9 4F
		BNE CODE_08911A				;C - - - - - 0x011123 04:9113: D0 05
			LDA #$06					;C - - - - - 0x011125 04:9115: A9 06
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011127 04:9117: 9D 6C 05
	CODE_08911A:
		INC objState+OSLOT_ENEMY,X				;C - - - - - 0x01112A 04:911A: FE 6C 05
		LDA #$00					;C - - - - - 0x01112D 04:911D: A9 00
		STA enemyReward,X				;C - - - - - 0x01112F 04:911F: 95 8E
		STA ram_00AC,X				;C - - - - - 0x011131 04:9121: 95 AC
		LDA #$02					;C - - - - - 0x011133 04:9123: A9 02
		STA enemyDir				;C - - - - - 0x011135 04:9125: 85 A2
		LDA #$1A					;C - - - - - 0x011137 04:9127: A9 1A
		STA ram_04AF,X				;C - - - - - 0x011139 04:9129: 9D AF 04
		LDA #$01					;C - - - - - 0x01113C 04:912C: A9 01
		STA ram_00B6				;C - - - - - 0x01113E 04:912E: 85 B6
		STA ram_00B9				;C - - - - - 0x011140 04:9130: 85 B9
		JMP CODE_0892CD				;C - - - - - 0x011142 04:9132: 4C CD 92
CODE_089135:
	CMP #$02					;C - - - - - 0x011145 04:9135: C9 02
	BEQ CODE_08913C				;C - - - - - 0x011147 04:9137: F0 03
		JMP CODE_0891DB				;C - - - - - 0x011149 04:9139: 4C DB 91
CODE_08913C:
	LDA #$01					;C - - - - - 0x01114C 04:913C: A9 01
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x01114E 04:913E: 9D FC 06
CODE_089141:
	LDA ram_00CD				;C - - - - - 0x011151 04:9141: A5 CD
	BEQ CODE_089154				;C - - - - - 0x011153 04:9143: F0 0F
		LDA #$00					;C - - - - - 0x011155 04:9145: A9 00
		SEC							;C - - - - - 0x011157 04:9147: 38
		SBC ram_00B9				;C - - - - - 0x011158 04:9148: E5 B9
		STA ram_00B9				;C - - - - - 0x01115A 04:914A: 85 B9
		LDA #$19					;C - - - - - 0x01115C 04:914C: A9 19
		STA ram_04AF,X				;C - - - - - 0x01115E 04:914E: 9D AF 04
		JMP CODE_089164				;C - - - - - 0x011161 04:9151: 4C 64 91
CODE_089154:
	LDA ram_00CF				;C - - - - - 0x011164 04:9154: A5 CF
	BEQ CODE_089164				;C - - - - - 0x011166 04:9156: F0 0C
		LDA #$00					;C - - - - - 0x011168 04:9158: A9 00
		SEC							;C - - - - - 0x01116A 04:915A: 38
		SBC ram_00B9				;C - - - - - 0x01116B 04:915B: E5 B9
		STA ram_00B9				;C - - - - - 0x01116D 04:915D: 85 B9
		LDA #$1A					;C - - - - - 0x01116F 04:915F: A9 1A
		STA ram_04AF,X				;C - - - - - 0x011171 04:9161: 9D AF 04
CODE_089164:
	LDA projTouchingPlayer				;C - - - - - 0x011174 04:9164: A5 CE
	BEQ CODE_08917F				;C - - - - - 0x011176 04:9166: F0 17
	LDA #$00					;C - - - - - 0x011178 04:9168: A9 00
	SEC							;C - - - - - 0x01117A 04:916A: 38
	SBC ram_00B6				;C - - - - - 0x01117B 04:916B: E5 B6
	STA ram_00B6				;C - - - - - 0x01117D 04:916D: 85 B6
	LDA enemyDir,X				;C - - - - - 0x01117F 04:916F: B5 A2
	EOR #$03					;C - - - - - 0x011181 04:9171: 49 03
	STA enemyDir,X				;C - - - - - 0x011183 04:9173: 95 A2
	TAY							;C - - - - - 0x011185 04:9175: A8
	LDA SkullAnims,Y			;C - - - - - 0x011186 04:9176: B9 D8 91
	JSR StartEnemyAnim				;C - - - - - 0x011189 04:9179: 20 58 99
	STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x01118C 04:917C: 9D 24 07
CODE_08917F:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x01118F 04:917F: BD 6C 05
	CMP #$05					;C - - - - - 0x011192 04:9182: C9 05
	BNE CODE_089189				;C - - - - - 0x011194 04:9184: D0 03
		JMP CODE_0892CD				;C - - - - - 0x011196 04:9186: 4C CD 92
CODE_089189:
	LDA scratch8				;C - - - - - 0x011199 04:9189: A5 08
	AND #$C0					;C - - - - - 0x01119B 04:918B: 29 C0
	CMP #$C0					;C - - - - - 0x01119D 04:918D: C9 C0
	BNE CODE_0891C4				;C - - - - - 0x01119F 04:918F: D0 33
		LDA #$05					;C - - - - - 0x0111A1 04:9191: A9 05
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0111A3 04:9193: 9D 6C 05
		LDA #snEnemyHurt_ID					;C - - - - - 0x0111A6 04:9196: A9 2B
		STA a:soundTrigger				;C - - - - - 0x0111A8 04:9198: 8D E1 00
		INC enemyHits				;C - - - - - 0x0111AB 04:919B: EE BE 04
		LDA enemyHits				;C - - - - - 0x0111AE 04:919E: AD BE 04
		CMP #$05					;C - - - - - 0x0111B1 04:91A1: C9 05
		BCC CODE_0891D5				;C - - - - - 0x0111B3 04:91A3: 90 30
			LDA #snBomb_ID					;C - - - - - 0x0111B5 04:91A5: A9 29
			STA a:soundTrigger				;C - - - - - 0x0111B7 04:91A7: 8D E1 00
			LDA #$04					;C - - - - - 0x0111BA 04:91AA: A9 04
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0111BC 04:91AC: 9D 6C 05
			LDA #$00					;C - - - - - 0x0111BF 04:91AF: A9 00
			STA enemyHits+7				;C - - - - - 0x0111C1 04:91B1: 8D C5 04
			STA openingCounter				;C - - - - - 0x0111C4 04:91B4: 8D CC 04
			STA ram_00B6				;C - - - - - 0x0111C7 04:91B7: 85 B6
			STA ram_00B9				;C - - - - - 0x0111C9 04:91B9: 85 B9
			LDA objY+OSLOT_ENEMY				;C - - - - - 0x0111CB 04:91BB: AD 94 05
			STA enemyHits				;C - - - - - 0x0111CE 04:91BE: 8D BE 04
			JMP CODE_0892CD				;C - - - - - 0x0111D1 04:91C1: 4C CD 92
CODE_0891C4:
	INC enemyHits+7				;C - - - - - 0x0111D4 04:91C4: EE C5 04
	LDA enemyHits+7				;C - - - - - 0x0111D7 04:91C7: AD C5 04
	AND #$7F					;C - - - - - 0x0111DA 04:91CA: 29 7F
	BNE CODE_0891D5				;C - - - - - 0x0111DC 04:91CC: D0 07
		LDA #$00					;C - - - - - 0x0111DE 04:91CE: A9 00
		STA ram_00BE				;C - - - - - 0x0111E0 04:91D0: 85 BE
		INC objState+OSLOT_ENEMY,X				;C - - - - - 0x0111E2 04:91D2: FE 6C 05
CODE_0891D5:
	JMP CODE_0892CD				;C - - - - - 0x0111E5 04:91D5: 4C CD 92

SkullAnims:
	.byte $00					;- - - - - - 0x0111E8 04:91D8: 00
	.byte anSkullL_ID					;- D 0 - - - 0x0111E9 04:91D9: E9
	.byte anSkullR_ID					;- D 0 - - - 0x0111EA 04:91DA: D9

CODE_0891DB:
	CMP #$03					;C - - - - - 0x0111EB 04:91DB: C9 03
	BNE CODE_089207				;C - - - - - 0x0111ED 04:91DD: D0 28

	INC ram_00BE				;C - - - - - 0x0111EF 04:91DF: E6 BE
	LDA ram_00BE				;C - - - - - 0x0111F1 04:91E1: A5 BE
	CMP #$08					;C - - - - - 0x0111F3 04:91E3: C9 08
	BCC CODE_089206				;C - - - - - 0x0111F5 04:91E5: 90 1F
	BEQ CODE_0891F0				;C - - - - - 0x0111F7 04:91E7: F0 07
		LDA #$02					;C - - - - - 0x0111F9 04:91E9: A9 02
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0111FB 04:91EB: 9D 6C 05
		BNE CODE_089206				;C - - - - - 0x0111FE 04:91EE: D0 16
CODE_0891F0:
	LDA #snEnemyThrow_ID					;C - - - - - 0x011200 04:91F0: A9 26
	STA a:soundTrigger				;C - - - - - 0x011202 04:91F2: 8D E1 00
	LDA #$04					;C - - - - - 0x011205 04:91F5: A9 04
	STA scratch4				;C - - - - - 0x011207 04:91F7: 85 04
	LDA #$03					;C - - - - - 0x011209 04:91F9: A9 03
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x01120B 04:91FB: 9D FC 06
	JSR CODE_0898F6				;C - - - - - 0x01120E 04:91FE: 20 F6 98
	LDA #$03					;C - - - - - 0x011211 04:9201: A9 03
	STA objAttr+OSLOT_PROJ,Y				;C - - - - - 0x011213 04:9203: 99 F4 06
CODE_089206:
	RTS							;C - - - - - 0x011216 04:9206: 60

CODE_089207:
	CMP #$04					;C - - - - - 0x011217 04:9207: C9 04
	BNE CODE_089258				;C - - - - - 0x011219 04:9209: D0 4D

	LDA currentRound				;C - - - - - 0x01121B 04:920B: A5 D8
	CMP #$46					;C - - - - - 0x01121D 04:920D: C9 46
	BNE CODE_089219				;C - - - - - 0x01121F 04:920F: D0 08
		LDA #$06					;C - - - - - 0x011221 04:9211: A9 06
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011223 04:9213: 9D 6C 05
		JMP CODE_0892CD				;C - - - - - 0x011226 04:9216: 4C CD 92
CODE_089219:
	LDA #$80					;C - - - - - 0x011229 04:9219: A9 80
	STA ram_00C0,X				;C - - - - - 0x01122B 04:921B: 95 C0
	LDA enemyHits				;C - - - - - 0x01122D 04:921D: AD BE 04
	STA objY+OSLOT_ENEMY				;C - - - - - 0x011230 04:9220: 8D 94 05
	INC enemyHits+7				;C - - - - - 0x011233 04:9223: EE C5 04
	LDA enemyHits+7				;C - - - - - 0x011236 04:9226: AD C5 04
	CMP #$02					;C - - - - - 0x011239 04:9229: C9 02
	BCC CODE_08923E				;C - - - - - 0x01123B 04:922B: 90 11
		LDA #$F8					;C - - - - - 0x01123D 04:922D: A9 F8
		STA objY+OSLOT_ENEMY				;C - - - - - 0x01123F 04:922F: 8D 94 05
		LDA enemyHits+7				;C - - - - - 0x011242 04:9232: AD C5 04
		CMP #$04					;C - - - - - 0x011245 04:9235: C9 04
		BCC CODE_08923E				;C - - - - - 0x011247 04:9237: 90 05
			LDA #$00					;C - - - - - 0x011249 04:9239: A9 00
			STA enemyHits+7				;C - - - - - 0x01124B 04:923B: 8D C5 04
CODE_08923E:
	INC openingCounter				;C - - - - - 0x01124E 04:923E: EE CC 04
	LDA openingCounter				;C - - - - - 0x011251 04:9241: AD CC 04
	CMP #$28					;C - - - - - 0x011254 04:9244: C9 28
	BCS CODE_08924B				;C - - - - - 0x011256 04:9246: B0 03
		JMP CODE_0892CD				;C - - - - - 0x011258 04:9248: 4C CD 92
CODE_08924B:
	LDA #$00					;C - - - - - 0x01125B 04:924B: A9 00
	STA enemyType				;C - - - - - 0x01125D 04:924D: 85 98
	STA objState+OSLOT_ENEMY				;C - - - - - 0x01125F 04:924F: 8D 6C 05
	STA enemyHits				;C - - - - - 0x011262 04:9252: 8D BE 04
	JMP CODE_0892CD				;C - - - - - 0x011265 04:9255: 4C CD 92
CODE_089258:
	CMP #$05					;C - - - - - 0x011268 04:9258: C9 05
	BNE CODE_089262				;C - - - - - 0x01126A 04:925A: D0 06
	JSR CODE_089934				;C - - - - - 0x01126C 04:925C: 20 34 99
	JMP CODE_089141				;C - - - - - 0x01126F 04:925F: 4C 41 91
CODE_089262:
	CMP #$06					;C - - - - - 0x011272 04:9262: C9 06
	BNE CODE_0892A8				;C - - - - - 0x011274 04:9264: D0 42

	LDA ram_00C0				;C - - - - - 0x011276 04:9266: A5 C0
	ORA #$80					;C - - - - - 0x011278 04:9268: 09 80
	STA ram_00C0				;C - - - - - 0x01127A 04:926A: 85 C0
	LDA #$FC					;C - - - - - 0x01127C 04:926C: A9 FC
	STA ram_00B9				;C - - - - - 0x01127E 04:926E: 85 B9
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x011280 04:9270: BD 94 05
	BPL CODE_0892CD				;C - - - - - 0x011283 04:9273: 10 58
	CMP #$F8					;C - - - - - 0x011285 04:9275: C9 F8
	BCC CODE_0892CD				;C - - - - - 0x011287 04:9277: 90 54
		LDA #$01					;C - - - - - 0x011289 04:9279: A9 01
		STA roundFlags				;C - - - - - 0x01128B 04:927B: 8D 71 04
		LDA #$00					;C - - - - - 0x01128E 04:927E: A9 00
		STA enemyType,X				;C - - - - - 0x011290 04:9280: 95 98
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011292 04:9282: 9D 6C 05

		LDA #trVictory_ID					;C - - - - - 0x011295 04:9285: A9 0A
		STA a:musicTrigger				;C - - - - - 0x011297 04:9287: 8D E0 00

		LDY #$00					;C - - - - - 0x01129A 04:928A: A0 00
		LDA #$00					;C - - - - - 0x01129C 04:928C: A9 00
CODE_08928E:
	STA objState+OSLOT_BUBBLE,Y				;C - - - - - 0x01129E 04:928E: 99 77 05
	STA objAnimHI+OSLOT_BUBBLE,Y				;C - - - - - 0x0112A1 04:9291: 99 2F 07
	INY							;C - - - - - 0x0112A4 04:9294: C8
	CPY #20					;C - - - - - 0x0112A5 04:9295: C0 14
	BCC CODE_08928E				;C - - - - - 0x0112A7 04:9297: 90 F5

	LDA #$05					;C - - - - - 0x0112A9 04:9299: A9 05
	STA scoreAdditionDigits+3				;C - - - - - 0x0112AB 04:929B: 8D A4 04
	TXA							;C - - - - - 0x0112AE 04:929E: 8A
	PHA							;C - - - - - 0x0112AF 04:929F: 48
	JSR AddScore				;C - - - - - 0x0112B0 04:92A0: 20 C7 FE
	PLA							;C - - - - - 0x0112B3 04:92A3: 68
	TAX							;C - - - - - 0x0112B4 04:92A4: AA
	JMP CODE_0892CD				;C - - - - - 0x0112B5 04:92A5: 4C CD 92
CODE_0892A8:
	CMP #$07					;C - - - - - 0x0112B8 04:92A8: C9 07
	BNE CODE_0892CD				;C - - - - - 0x0112BA 04:92AA: D0 21

	JSR CODE_089570				;C - - - - - 0x0112BC 04:92AC: 20 70 95
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x0112BF 04:92AF: BD 6C 05
	BNE CODE_0892CD				;C - - - - - 0x0112C2 04:92B2: D0 19

	LDA #$1C					;C - - - - - 0x0112C4 04:92B4: A9 1C
	STA enemyType,X				;C - - - - - 0x0112C6 04:92B6: 95 98
	LDA #$06					;C - - - - - 0x0112C8 04:92B8: A9 06
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0112CA 04:92BA: 9D 6C 05
	LDA #$80					;C - - - - - 0x0112CD 04:92BD: A9 80
	STA objX+OSLOT_ENEMY,X				;C - - - - - 0x0112CF 04:92BF: 9D BC 05
	LDA #anSuperDrunkL_ID					;C - - - - - 0x0112D2 04:92C2: A9 EE
	JSR StartEnemyAnim				;C - - - - - 0x0112D4 04:92C4: 20 58 99
	STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x0112D7 04:92C7: 9D 24 07
	INC objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x0112DA 04:92CA: FE 34 06
CODE_0892CD:
	JMP CODE_0898E3				;C - - - - - 0x0112DD 04:92CD: 4C E3 98

PurpleSkullUpdate:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x0112E0 04:92D0: BD 6C 05
	STA scratch8				;C - - - - - 0x0112E3 04:92D3: 85 08
	AND #$3F					;C - - - - - 0x0112E5 04:92D5: 29 3F
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0112E7 04:92D7: 9D 6C 05
	CMP #$01					;C - - - - - 0x0112EA 04:92DA: C9 01
	BNE CODE_089304				;C - - - - - 0x0112EC 04:92DC: D0 26
		LDA currentRound				;C - - - - - 0x0112EE 04:92DE: A5 D8
		CMP #$4F					;C - - - - - 0x0112F0 04:92E0: C9 4F
		BNE CODE_0892E9				;C - - - - - 0x0112F2 04:92E2: D0 05
			LDA #$05					;C - - - - - 0x0112F4 04:92E4: A9 05
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0112F6 04:92E6: 9D 6C 05
	CODE_0892E9:
		INC objState+OSLOT_ENEMY,X				;C - - - - - 0x0112F9 04:92E9: FE 6C 05
		LDA #$00					;C - - - - - 0x0112FC 04:92EC: A9 00
		STA enemyReward,X				;C - - - - - 0x0112FE 04:92EE: 95 8E
		STA ram_00AC,X				;C - - - - - 0x011300 04:92F0: 95 AC
		LDA #$01					;C - - - - - 0x011302 04:92F2: A9 01
		STA enemyDir,X				;C - - - - - 0x011304 04:92F4: 95 A2
		LDA #$19					;C - - - - - 0x011306 04:92F6: A9 19
		STA ram_04AF,X				;C - - - - - 0x011308 04:92F8: 9D AF 04
		LDA #$FF					;C - - - - - 0x01130B 04:92FB: A9 FF
		STA ram_00B7				;C - - - - - 0x01130D 04:92FD: 85 B7
		STA ram_00BA				;C - - - - - 0x01130F 04:92FF: 85 BA
		JMP CODE_0892CD				;C - - - - - 0x011311 04:9301: 4C CD 92
CODE_089304:
	CMP #$02					;C - - - - - 0x011314 04:9304: C9 02
	BEQ CODE_08930B				;C - - - - - 0x011316 04:9306: F0 03
		JMP CODE_0893D4				;C - - - - - 0x011318 04:9308: 4C D4 93
CODE_08930B:
	LDA #$02					;C - - - - - 0x01131B 04:930B: A9 02
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x01131D 04:930D: 9D FC 06
CODE_089310:
	LDA ram_00CD				;C - - - - - 0x011320 04:9310: A5 CD
	BEQ CODE_089327				;C - - - - - 0x011322 04:9312: F0 13
		LDA #$00					;C - - - - - 0x011324 04:9314: A9 00
		SEC							;C - - - - - 0x011326 04:9316: 38
		SBC ram_00BA				;C - - - - - 0x011327 04:9317: E5 BA
		STA ram_00BA				;C - - - - - 0x011329 04:9319: 85 BA
		LDA #$19					;C - - - - - 0x01132B 04:931B: A9 19
		STA ram_04AF,X				;C - - - - - 0x01132D 04:931D: 9D AF 04
		LDA #$08					;C - - - - - 0x011330 04:9320: A9 08
		STA ram_00BD				;C - - - - - 0x011332 04:9322: 85 BD
		JMP CODE_08933B				;C - - - - - 0x011334 04:9324: 4C 3B 93
CODE_089327:
	LDA ram_00CF				;C - - - - - 0x011337 04:9327: A5 CF
	BEQ CODE_08933B				;C - - - - - 0x011339 04:9329: F0 10
		LDA #$00					;C - - - - - 0x01133B 04:932B: A9 00
		SEC							;C - - - - - 0x01133D 04:932D: 38
		SBC ram_00BA				;C - - - - - 0x01133E 04:932E: E5 BA
		STA ram_00BA				;C - - - - - 0x011340 04:9330: 85 BA
		LDA #$1A					;C - - - - - 0x011342 04:9332: A9 1A
		LDA #$08					;C - - - - - 0x011344 04:9334: A9 08
		STA ram_00BD				;C - - - - - 0x011346 04:9336: 85 BD
		STA ram_04AF,X				;C - - - - - 0x011348 04:9338: 9D AF 04
CODE_08933B:
	LDA projTouchingPlayer				;C - - - - - 0x01134B 04:933B: A5 CE
	BEQ CODE_08935A				;C - - - - - 0x01134D 04:933D: F0 1B
		LDA #$00					;C - - - - - 0x01134F 04:933F: A9 00
		SEC							;C - - - - - 0x011351 04:9341: 38
		SBC ram_00B7				;C - - - - - 0x011352 04:9342: E5 B7
		STA ram_00B7				;C - - - - - 0x011354 04:9344: 85 B7
		LDA #$08					;C - - - - - 0x011356 04:9346: A9 08
		STA ram_00BC				;C - - - - - 0x011358 04:9348: 85 BC
		LDA enemyDir,X				;C - - - - - 0x01135A 04:934A: B5 A2
		EOR #$03					;C - - - - - 0x01135C 04:934C: 49 03
		STA enemyDir,X				;C - - - - - 0x01135E 04:934E: 95 A2
		TAY							;C - - - - - 0x011360 04:9350: A8
		LDA SkullAnims,Y			;C - - - - - 0x011361 04:9351: B9 D8 91
		JSR StartEnemyAnim				;C - - - - - 0x011364 04:9354: 20 58 99
		STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x011367 04:9357: 9D 24 07
CODE_08935A:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x01136A 04:935A: BD 6C 05
	CMP #$05					;C - - - - - 0x01136D 04:935D: C9 05
	BNE CODE_089364				;C - - - - - 0x01136F 04:935F: D0 03
		JMP CODE_089438				;C - - - - - 0x011371 04:9361: 4C 38 94
CODE_089364:
	INC enemyHits+8				;C - - - - - 0x011374 04:9364: EE C6 04
	LDA enemyHits+8				;C - - - - - 0x011377 04:9367: AD C6 04
	CMP #$FA					;C - - - - - 0x01137A 04:936A: C9 FA
	BCC CODE_089376				;C - - - - - 0x01137C 04:936C: 90 08
		LDA #$00					;C - - - - - 0x01137E 04:936E: A9 00
		STA enemyHits+8				;C - - - - - 0x011380 04:9370: 8D C6 04
		INC objState+OSLOT_ENEMY,X				;C - - - - - 0x011383 04:9373: FE 6C 05
CODE_089376:
	LDA ram_00BC				;C - - - - - 0x011386 04:9376: A5 BC
	BEQ CODE_089385				;C - - - - - 0x011388 04:9378: F0 0B
		DEC ram_00BC				;C - - - - - 0x01138A 04:937A: C6 BC
		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01138C 04:937C: BD BC 05
		SEC							;C - - - - - 0x01138F 04:937F: 38
		SBC ram_00B7				;C - - - - - 0x011390 04:9380: E5 B7
		STA objX+OSLOT_ENEMY,X				;C - - - - - 0x011392 04:9382: 9D BC 05
CODE_089385:
	LDA ram_00BD				;C - - - - - 0x011395 04:9385: A5 BD
	BEQ CODE_089394				;C - - - - - 0x011397 04:9387: F0 0B
		DEC ram_00BD				;C - - - - - 0x011399 04:9389: C6 BD
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01139B 04:938B: BD 94 05
		SEC							;C - - - - - 0x01139E 04:938E: 38
		SBC ram_00BA				;C - - - - - 0x01139F 04:938F: E5 BA
		STA objY+OSLOT_ENEMY,X				;C - - - - - 0x0113A1 04:9391: 9D 94 05
CODE_089394:
	LDA scratch8				;C - - - - - 0x0113A4 04:9394: A5 08
	AND #$C0					;C - - - - - 0x0113A6 04:9396: 29 C0
	CMP #$C0					;C - - - - - 0x0113A8 04:9398: C9 C0
	BNE CODE_0893D1				;C - - - - - 0x0113AA 04:939A: D0 35
		LDA #$01					;C - - - - - 0x0113AC 04:939C: A9 01
		STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x0113AE 04:939E: 9D FC 06
		LDA #$05					;C - - - - - 0x0113B1 04:93A1: A9 05
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0113B3 04:93A3: 9D 6C 05
		LDA #snEnemyHurt_ID					;C - - - - - 0x0113B6 04:93A6: A9 2B
		STA a:soundTrigger				;C - - - - - 0x0113B8 04:93A8: 8D E1 00
		INC enemyHits+1				;C - - - - - 0x0113BB 04:93AB: EE BF 04
		LDA enemyHits+1				;C - - - - - 0x0113BE 04:93AE: AD BF 04
		CMP #$06					;C - - - - - 0x0113C1 04:93B1: C9 06
		BNE CODE_0893D1				;C - - - - - 0x0113C3 04:93B3: D0 1C
			LDA #snBomb_ID					;C - - - - - 0x0113C5 04:93B5: A9 29
			STA a:soundTrigger				;C - - - - - 0x0113C7 04:93B7: 8D E1 00
			LDA #$04					;C - - - - - 0x0113CA 04:93BA: A9 04
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0113CC 04:93BC: 9D 6C 05
			LDA #$00					;C - - - - - 0x0113CF 04:93BF: A9 00
			STA enemyHits+8				;C - - - - - 0x0113D1 04:93C1: 8D C6 04
			STA openingCycle				;C - - - - - 0x0113D4 04:93C4: 8D CD 04
			STA ram_00B7				;C - - - - - 0x0113D7 04:93C7: 85 B7
			STA ram_00BA				;C - - - - - 0x0113D9 04:93C9: 85 BA
			LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0113DB 04:93CB: BD 94 05
			STA enemyHits+1				;C - - - - - 0x0113DE 04:93CE: 8D BF 04
CODE_0893D1:
	JMP CODE_089438				;C - - - - - 0x0113E1 04:93D1: 4C 38 94
CODE_0893D4:
	CMP #$03					;C - - - - - 0x0113E4 04:93D4: C9 03
	BNE CODE_0893E7				;C - - - - - 0x0113E6 04:93D6: D0 0F

	LDA #$02					;C - - - - - 0x0113E8 04:93D8: A9 02
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0113EA 04:93DA: 9D 6C 05
	LDA #$05					;C - - - - - 0x0113ED 04:93DD: A9 05
	STA scratch4				;C - - - - - 0x0113EF 04:93DF: 85 04
	JSR CODE_0898F6				;C - - - - - 0x0113F1 04:93E1: 20 F6 98
	JMP CODE_089438				;C - - - - - 0x0113F4 04:93E4: 4C 38 94
CODE_0893E7:
	CMP #$04					;C - - - - - 0x0113F7 04:93E7: C9 04
	BNE CODE_089427				;C - - - - - 0x0113F9 04:93E9: D0 3C

	LDA #$80					;C - - - - - 0x0113FB 04:93EB: A9 80
	STA ram_00C0,X				;C - - - - - 0x0113FD 04:93ED: 95 C0
	LDA enemyHits+1				;C - - - - - 0x0113FF 04:93EF: AD BF 04
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x011402 04:93F2: 9D 94 05
	INC enemyHits+8				;C - - - - - 0x011405 04:93F5: EE C6 04
	LDA enemyHits+8				;C - - - - - 0x011408 04:93F8: AD C6 04
	CMP #$02					;C - - - - - 0x01140B 04:93FB: C9 02
	BCC CODE_089410				;C - - - - - 0x01140D 04:93FD: 90 11
		LDA #$F8					;C - - - - - 0x01140F 04:93FF: A9 F8
		STA objY+OSLOT_ENEMY,X				;C - - - - - 0x011411 04:9401: 9D 94 05
		LDA enemyHits+8				;C - - - - - 0x011414 04:9404: AD C6 04
		CMP #$04					;C - - - - - 0x011417 04:9407: C9 04
		BCC CODE_089410				;C - - - - - 0x011419 04:9409: 90 05
			LDA #$00					;C - - - - - 0x01141B 04:940B: A9 00
			STA enemyHits+8				;C - - - - - 0x01141D 04:940D: 8D C6 04
CODE_089410:
	INC openingCycle				;C - - - - - 0x011420 04:9410: EE CD 04
	LDA openingCycle				;C - - - - - 0x011423 04:9413: AD CD 04
	CMP #$28					;C - - - - - 0x011426 04:9416: C9 28
	BCC CODE_089438				;C - - - - - 0x011428 04:9418: 90 1E
		LDA #$00					;C - - - - - 0x01142A 04:941A: A9 00
		STA enemyType,X				;C - - - - - 0x01142C 04:941C: 95 98
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x01142E 04:941E: 9D 6C 05
		STA enemyHits+1				;C - - - - - 0x011431 04:9421: 8D BF 04
		JMP CODE_089438				;C - - - - - 0x011434 04:9424: 4C 38 94
	CODE_089427:
		CMP #$05					;C - - - - - 0x011437 04:9427: C9 05
		BNE CODE_089431				;C - - - - - 0x011439 04:9429: D0 06
			JSR CODE_089934				;C - - - - - 0x01143B 04:942B: 20 34 99
			JMP CODE_089310				;C - - - - - 0x01143E 04:942E: 4C 10 93
	CODE_089431:
		CMP #$06					;C - - - - - 0x011441 04:9431: C9 06
		BNE CODE_089438				;C - - - - - 0x011443 04:9433: D0 03
			JSR CODE_089570				;C - - - - - 0x011445 04:9435: 20 70 95
CODE_089438:
	JMP CODE_0898E3				;C - - - - - 0x011448 04:9438: 4C E3 98

RedSkullUpdate:
	LDA #$00					;C - - - - - 0x01144B 04:943B: A9 00
	STA ram_04AD				;C - - - - - 0x01144D 04:943D: 8D AD 04
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x011450 04:9440: BD 6C 05
	AND #$3F					;C - - - - - 0x011453 04:9443: 29 3F
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011455 04:9445: 9D 6C 05
	CMP #$01					;C - - - - - 0x011458 04:9448: C9 01
	BNE CODE_089465				;C - - - - - 0x01145A 04:944A: D0 19
		LDA currentRound				;C - - - - - 0x01145C 04:944C: A5 D8
		CMP #79					;C - - - - - 0x01145E 04:944E: C9 4F
		BNE CODE_089457				;C - - - - - 0x011460 04:9450: D0 05
			LDA #$05					;C - - - - - 0x011462 04:9452: A9 05
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011464 04:9454: 9D 6C 05
	CODE_089457:
		INC objState+OSLOT_ENEMY,X				;C - - - - - 0x011467 04:9457: FE 6C 05
		LDA #$00					;C - - - - - 0x01146A 04:945A: A9 00
		STA enemyReward,X				;C - - - - - 0x01146C 04:945C: 95 8E
		STA ram_00BF				;C - - - - - 0x01146E 04:945E: 85 BF
		STA ram_00AC,X				;C - - - - - 0x011470 04:9460: 95 AC
		JMP CODE_08956D				;C - - - - - 0x011472 04:9462: 4C 6D 95
CODE_089465:
	CMP #$02					;C - - - - - 0x011475 04:9465: C9 02
	BEQ CODE_08946C				;C - - - - - 0x011477 04:9467: F0 03
		JMP CODE_089504				;C - - - - - 0x011479 04:9469: 4C 04 95
CODE_08946C:
	LDA #$03					;C - - - - - 0x01147C 04:946C: A9 03
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x01147E 04:946E: 9D FC 06
	LDA objX				;C - - - - - 0x011481 04:9471: AD B3 05
	STA scratch0				;C - - - - - 0x011484 04:9474: 85 00
	LDA objY				;C - - - - - 0x011486 04:9476: AD 8B 05
	STA scratch1				;C - - - - - 0x011489 04:9479: 85 01
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x01148B 04:947B: AD 6C 05
	ORA objState+OSLOT_ENEMY+1				;C - - - - - 0x01148E 04:947E: 0D 6D 05
	BNE CODE_08949B				;C - - - - - 0x011491 04:9481: D0 18
		LDA #$80					;C - - - - - 0x011493 04:9483: A9 80
		STA scratch0				;C - - - - - 0x011495 04:9485: 85 00
		STA scratch1				;C - - - - - 0x011497 04:9487: 85 01
		INC enemyHits+3				;C - - - - - 0x011499 04:9489: EE C1 04
		LDA enemyHits+3				;C - - - - - 0x01149C 04:948C: AD C1 04
		CMP #$3C					;C - - - - - 0x01149F 04:948F: C9 3C
		BCC CODE_0894AF				;C - - - - - 0x0114A1 04:9491: 90 1C
			LDA #$04					;C - - - - - 0x0114A3 04:9493: A9 04
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0114A5 04:9495: 9D 6C 05
			JMP CODE_0894F8				;C - - - - - 0x0114A8 04:9498: 4C F8 94
CODE_08949B:
	INC ram_00BF				;C - - - - - 0x0114AB 04:949B: E6 BF
	LDA ram_00BF				;C - - - - - 0x0114AD 04:949D: A5 BF
	CMP #$3C					;C - - - - - 0x0114AF 04:949F: C9 3C
	BCC CODE_0894AF				;C - - - - - 0x0114B1 04:94A1: 90 0C
		LDA #$05					;C - - - - - 0x0114B3 04:94A3: A9 05
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0114B5 04:94A5: 9D 6C 05
		LDA #$00					;C - - - - - 0x0114B8 04:94A8: A9 00
		STA ram_00BF				;C - - - - - 0x0114BA 04:94AA: 85 BF
		JMP CODE_0894F8				;C - - - - - 0x0114BC 04:94AC: 4C F8 94
CODE_0894AF:
	LDA globalTimer				;C - - - - - 0x0114BF 04:94AF: A5 14
	AND #$1F					;C - - - - - 0x0114C1 04:94B1: 29 1F
	BNE CODE_0894DD				;C - - - - - 0x0114C3 04:94B3: D0 28
		LDA #anBurningSkullR_ID					;C - - - - - 0x0114C5 04:94B5: A9 DA
		STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0114C7 04:94B7: 9D 84 06
		LDA #$01					;C - - - - - 0x0114CA 04:94BA: A9 01
		STA ram_00B8				;C - - - - - 0x0114CC 04:94BC: 85 B8
		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x0114CE 04:94BE: BD BC 05
		CMP scratch0				;C - - - - - 0x0114D1 04:94C1: C5 00
		BCC CODE_0894CE				;C - - - - - 0x0114D3 04:94C3: 90 09
			LDA #$FF					;C - - - - - 0x0114D5 04:94C5: A9 FF
			STA ram_00B8				;C - - - - - 0x0114D7 04:94C7: 85 B8
			LDA #anBurningSkullL_ID					;C - - - - - 0x0114D9 04:94C9: A9 EA
			STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0114DB 04:94CB: 9D 84 06
	CODE_0894CE:
		LDA #$01					;C - - - - - 0x0114DE 04:94CE: A9 01
		STA ram_00BB				;C - - - - - 0x0114E0 04:94D0: 85 BB
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0114E2 04:94D2: BD 94 05
		CMP scratch1				;C - - - - - 0x0114E5 04:94D5: C5 01
		BCC CODE_0894DD				;C - - - - - 0x0114E7 04:94D7: 90 04
			LDA #$FF					;C - - - - - 0x0114E9 04:94D9: A9 FF
			STA ram_00BB				;C - - - - - 0x0114EB 04:94DB: 85 BB
CODE_0894DD:
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x0114ED 04:94DD: AD 6C 05
	ORA objState+OSLOT_ENEMY+1				;C - - - - - 0x0114F0 04:94E0: 0D 6D 05
	BEQ CODE_0894F8				;C - - - - - 0x0114F3 04:94E3: F0 13

	LDA enemyHits				;C - - - - - 0x0114F5 04:94E5: AD BE 04
	ORA enemyHits+1				;C - - - - - 0x0114F8 04:94E8: 0D BF 04
	BEQ CODE_0894F8				;C - - - - - 0x0114FB 04:94EB: F0 0B

	INC enemyHits+9				;C - - - - - 0x0114FD 04:94ED: EE C7 04
	LDA enemyHits+9				;C - - - - - 0x011500 04:94F0: AD C7 04
	BNE CODE_0894F8				;C - - - - - 0x011503 04:94F3: D0 03

	INC objState+OSLOT_ENEMY,X				;C - - - - - 0x011505 04:94F5: FE 6C 05
CODE_0894F8:
	LDA globalTimer				;C - - - - - 0x011508 04:94F8: A5 14
	AND #$02					;C - - - - - 0x01150A 04:94FA: 29 02
	BNE CODE_089501				;C - - - - - 0x01150C 04:94FC: D0 03
		JMP CODE_08956D				;C - - - - - 0x01150E 04:94FE: 4C 6D 95
CODE_089501:
	JMP CODE_0898F5				;C - - - - - 0x011511 04:9501: 4C F5 98
CODE_089504:
	CMP #$03					;C - - - - - 0x011514 04:9504: C9 03
	BNE CODE_08952D				;C - - - - - 0x011516 04:9506: D0 25
		LDA #$02					;C - - - - - 0x011518 04:9508: A9 02
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x01151A 04:950A: 9D 6C 05
		LDA #$06					;C - - - - - 0x01151D 04:950D: A9 06
		STA scratch4				;C - - - - - 0x01151F 04:950F: 85 04
		JSR CODE_0898F6				;C - - - - - 0x011521 04:9511: 20 F6 98
		LDA #$03					;C - - - - - 0x011524 04:9514: A9 03
		STA objAttr+OSLOT_PROJ,Y				;C - - - - - 0x011526 04:9516: 99 F4 06
		LDA enemyHits				;C - - - - - 0x011529 04:9519: AD BE 04
		CMP enemyHits+1				;C - - - - - 0x01152C 04:951C: CD BF 04
		BCS CODE_089525				;C - - - - - 0x01152F 04:951F: B0 04
			LDA #$01					;C - - - - - 0x011531 04:9521: A9 01
			BNE CODE_089527				;C - - - - - 0x011533 04:9523: D0 02
	CODE_089525:
		LDA #$00					;C - - - - - 0x011535 04:9525: A9 00
	CODE_089527:
		STA projCounter,Y				;C - - - - - 0x011537 04:9527: 99 1D 05
		JMP CODE_08956D				;C - - - - - 0x01153A 04:952A: 4C 6D 95
CODE_08952D:
	CMP #$04					;C - - - - - 0x01153D 04:952D: C9 04
	BNE CODE_08954E				;C - - - - - 0x01153F 04:952F: D0 1D

	LDA #$20					;C - - - - - 0x011541 04:9531: A9 20
	STA enemyType,X				;C - - - - - 0x011543 04:9533: 95 98
	LDA #$01					;C - - - - - 0x011545 04:9535: A9 01
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011547 04:9537: 9D 6C 05
	LDA #$00					;C - - - - - 0x01154A 04:953A: A9 00
	LDY #$00					;C - - - - - 0x01154C 04:953C: A0 00
CODE_08953E:
	STA objState+OSLOT_PROJ,Y				;C - - - - - 0x01154E 04:953E: 99 64 05
	INY							;C - - - - - 0x011551 04:9541: C8
	CPY #$08					;C - - - - - 0x011552 04:9542: C0 08
	BCC CODE_08953E				;C - - - - - 0x011554 04:9544: 90 F8

	LDA #trFinalBoss_ID					;C - - - - - 0x011556 04:9546: A9 0B
	STA a:musicTrigger				;C - - - - - 0x011558 04:9548: 8D E0 00
	JMP CODE_08956D				;C - - - - - 0x01155B 04:954B: 4C 6D 95
CODE_08954E:
	CMP #$05					;C - - - - - 0x01155E 04:954E: C9 05
	BNE CODE_089566				;C - - - - - 0x011560 04:9550: D0 14
		INC ram_00BF				;C - - - - - 0x011562 04:9552: E6 BF
		LDA ram_00BF				;C - - - - - 0x011564 04:9554: A5 BF
		CMP #$0C					;C - - - - - 0x011566 04:9556: C9 0C
		BCC CODE_089563				;C - - - - - 0x011568 04:9558: 90 09
			LDA #$00					;C - - - - - 0x01156A 04:955A: A9 00
			STA ram_00BF				;C - - - - - 0x01156C 04:955C: 85 BF
			LDA #$02					;C - - - - - 0x01156E 04:955E: A9 02
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011570 04:9560: 9D 6C 05
	CODE_089563:
		JMP CODE_0898F5				;C - - - - - 0x011573 04:9563: 4C F5 98
CODE_089566:
	CMP #$06					;C - - - - - 0x011576 04:9566: C9 06
	BNE CODE_08956D				;C - - - - - 0x011578 04:9568: D0 03
		JSR CODE_089570				;C - - - - - 0x01157A 04:956A: 20 70 95
CODE_08956D:
	JMP CODE_0898E3				;C - - - - - 0x01157D 04:956D: 4C E3 98
CODE_089570:
	INC ram_00AC,X				;C - - - - - 0x011580 04:9570: F6 AC
	LDA ram_00AC,X				;C - - - - - 0x011582 04:9572: B5 AC
	CMP DATA_0895A1,X			;C - - - - - 0x011584 04:9574: DD A1 95
	BCS CODE_089590				;C - - - - - 0x011587 04:9577: B0 17
		LDA globalTimer				;C - - - - - 0x011589 04:9579: A5 14
		AND #$03					;C - - - - - 0x01158B 04:957B: 29 03
		BNE CODE_0895A0				;C - - - - - 0x01158D 04:957D: D0 21
			LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01158F 04:957F: BD 94 05
			EOR #$02					;C - - - - - 0x011592 04:9582: 49 02
			STA objY+OSLOT_ENEMY,X				;C - - - - - 0x011594 04:9584: 9D 94 05
			LDA #$00					;C - - - - - 0x011597 04:9587: A9 00
			STA ram_00B6,X				;C - - - - - 0x011599 04:9589: 95 B6
			STA ram_00B9,X				;C - - - - - 0x01159B 04:958B: 95 B9
			JMP CODE_0895A0				;C - - - - - 0x01159D 04:958D: 4C A0 95
CODE_089590:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0115A0 04:9590: BD 94 05
	CMP #$0A					;C - - - - - 0x0115A3 04:9593: C9 0A
	BCS CODE_08959C				;C - - - - - 0x0115A5 04:9595: B0 05
		LDA #$00					;C - - - - - 0x0115A7 04:9597: A9 00
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0115A9 04:9599: 9D 6C 05
CODE_08959C:
	LDA #$FC					;C - - - - - 0x0115AC 04:959C: A9 FC
	STA ram_00B9,X				;C - - - - - 0x0115AE 04:959E: 95 B9
CODE_0895A0:
	RTS							;C - - - - - 0x0115B0 04:95A0: 60

DATA_0895A1:
	.byte $3C					;- D 0 - - - 0x0115B1 04:95A1: 3C
	.byte $44					;- D 0 - - - 0x0115B2 04:95A2: 44
	.byte $4C					;- D 0 - - - 0x0115B3 04:95A3: 4C

SuperRedSkullUpdate:
	LDA #$00					;C - - - - - 0x0115B4 04:95A4: A9 00
	STA ram_04AD				;C - - - - - 0x0115B6 04:95A6: 8D AD 04
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x0115B9 04:95A9: BD 6C 05
	STA scratch8				;C - - - - - 0x0115BC 04:95AC: 85 08
	AND #$3F					;C - - - - - 0x0115BE 04:95AE: 29 3F
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0115C0 04:95B0: 9D 6C 05
	CMP #$01					;C - - - - - 0x0115C3 04:95B3: C9 01
	BNE CODE_0895EC				;C - - - - - 0x0115C5 04:95B5: D0 35
		LDA #$09					;C - - - - - 0x0115C7 04:95B7: A9 09
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0115C9 04:95B9: 9D 6C 05
		LDA #$C8					;C - - - - - 0x0115CC 04:95BC: A9 C8
		STA enemyReward+9				;C - - - - - 0x0115CE 04:95BE: 85 97
		LDA #$00					;C - - - - - 0x0115D0 04:95C0: A9 00
		STA enemyReward+8				;C - - - - - 0x0115D2 04:95C2: 85 96
		STA enemyReward,X				;C - - - - - 0x0115D4 04:95C4: 95 8E
		STA enemyReward+8				;C - - - - - 0x0115D6 04:95C6: 85 96
		STA enemyHits+9				;C - - - - - 0x0115D8 04:95C8: 8D C7 04
		STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x0115DB 04:95CB: 9D AC 06
		STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x0115DE 04:95CE: 9D D4 06
		STA enemyHits,X				;C - - - - - 0x0115E1 04:95D1: 9D BE 04
		STA ram_00B8				;C - - - - - 0x0115E4 04:95D4: 85 B8
		STA ram_00BB				;C - - - - - 0x0115E6 04:95D6: 85 BB
		LDA #$01					;C - - - - - 0x0115E8 04:95D8: A9 01
		STA openingCycle				;C - - - - - 0x0115EA 04:95DA: 8D CD 04
		ASL							;C - - - - - 0x0115ED 04:95DD: 0A
		STA enemyDir,X				;C - - - - - 0x0115EE 04:95DE: 95 A2
		ASL							;C - - - - - 0x0115F0 04:95E0: 0A
		STA ram_04AF,X				;C - - - - - 0x0115F1 04:95E1: 9D AF 04
		LDA #anFinalSkullR_ID					;C - - - - - 0x0115F4 04:95E4: A9 F5
		STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0115F6 04:95E6: 9D 84 06
		JMP CODE_0898C9				;C - - - - - 0x0115F9 04:95E9: 4C C9 98
CODE_0895EC:
	CMP #$02					;C - - - - - 0x0115FC 04:95EC: C9 02
	BEQ CODE_0895F3				;C - - - - - 0x0115FE 04:95EE: F0 03
		JMP CODE_089686				;C - - - - - 0x011600 04:95F0: 4C 86 96
CODE_0895F3:
	LDA #$03					;C - - - - - 0x011603 04:95F3: A9 03
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x011605 04:95F5: 9D FC 06
	JSR CODE_0898CD				;C - - - - - 0x011608 04:95F8: 20 CD 98
	INC enemyHits+9				;C - - - - - 0x01160B 04:95FB: EE C7 04
	LDA enemyHits+9				;C - - - - - 0x01160E 04:95FE: AD C7 04
	CMP #$08					;C - - - - - 0x011611 04:9601: C9 08
	BCC CODE_089657				;C - - - - - 0x011613 04:9603: 90 52

	LDA #$00					;C - - - - - 0x011615 04:9605: A9 00
	STA enemyHits+9				;C - - - - - 0x011617 04:9607: 8D C7 04
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01161A 04:960A: BD 94 05
	CMP #$90					;C - - - - - 0x01161D 04:960D: C9 90
	BCC CODE_089641				;C - - - - - 0x01161F 04:960F: 90 30
		LDA playerState				;C - - - - - 0x011621 04:9611: A5 75
		CMP #$0A					;C - - - - - 0x011623 04:9613: C9 0A
		BEQ CODE_089641				;C - - - - - 0x011625 04:9615: F0 2A
			LDA globalTimer				;C - - - - - 0x011627 04:9617: A5 14
			CMP #$78					;C - - - - - 0x011629 04:9619: C9 78
			BCC CODE_089641				;C - - - - - 0x01162B 04:961B: 90 24
				CMP #$96					;C - - - - - 0x01162D 04:961D: C9 96
				BCS CODE_089641				;C - - - - - 0x01162F 04:961F: B0 20
					LDA #$F0					;C - - - - - 0x011631 04:9621: A9 F0
					STA ram_00BB				;C - - - - - 0x011633 04:9623: 85 BB
					LDA #$08					;C - - - - - 0x011635 04:9625: A9 08
					STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011637 04:9627: 9D 6C 05
					LDA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x01163A 04:962A: BD 84 06
					CLC							;C - - - - - 0x01163D 04:962D: 18
					ADC #2					;C - - - - - 0x01163E 04:962E: 69 02
					JSR StartEnemyAnim				;C - - - - - 0x011640 04:9630: 20 58 99
					STA enemyReward+7				;C - - - - - 0x011643 04:9633: 85 95
					LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x011645 04:9635: BD 94 05
					CLC							;C - - - - - 0x011648 04:9638: 18
					ADC #$12					;C - - - - - 0x011649 04:9639: 69 12
					STA objY+OSLOT_ENEMY,X				;C - - - - - 0x01164B 04:963B: 9D 94 05
					JMP CODE_089683				;C - - - - - 0x01164E 04:963E: 4C 83 96
CODE_089641:
	LDA #$09					;C - - - - - 0x011651 04:9641: A9 09
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011653 04:9643: 9D 6C 05
	LDY #$FB					;C - - - - - 0x011656 04:9646: A0 FB
	LDA globalTimer				;C - - - - - 0x011658 04:9648: A5 14
	CMP #$80					;C - - - - - 0x01165A 04:964A: C9 80
	BCS CODE_089650				;C - - - - - 0x01165C 04:964C: B0 02
		LDY #$F9					;C - - - - - 0x01165E 04:964E: A0 F9
CODE_089650:
	STY ram_00BB				;C - - - - - 0x011660 04:9650: 84 BB
	LDA openingCycle				;C - - - - - 0x011662 04:9652: AD CD 04
	STA ram_00B8				;C - - - - - 0x011665 04:9655: 85 B8
CODE_089657:
	LDA enemyReward+8				;C - - - - - 0x011667 04:9657: A5 96
	CMP #$03					;C - - - - - 0x011669 04:9659: C9 03
	BCS CODE_089683				;C - - - - - 0x01166B 04:965B: B0 26
			INC enemyReward+9				;C - - - - - 0x01166D 04:965D: E6 97
			LDA enemyReward+9				;C - - - - - 0x01166F 04:965F: A5 97
			CMP #$F0					;C - - - - - 0x011671 04:9661: C9 F0
		BCC CODE_089683				;C - - - - - 0x011673 04:9663: 90 1E
		LDA #$00					;C - - - - - 0x011675 04:9665: A9 00
		STA enemyReward+9				;C - - - - - 0x011677 04:9667: 85 97
		LDA #$03					;C - - - - - 0x011679 04:9669: A9 03
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x01167B 04:966B: 9D 6C 05
		LDA #$07					;C - - - - - 0x01167E 04:966E: A9 07
		STA scratch4				;C - - - - - 0x011680 04:9670: 85 04
		JSR CODE_0898F6				;C - - - - - 0x011682 04:9672: 20 F6 98
		INC enemyReward+8				;C - - - - - 0x011685 04:9675: E6 96
		LDA #$03					;C - - - - - 0x011687 04:9677: A9 03
		STA objChrSlot+OSLOT_PROJ,Y				;C - - - - - 0x011689 04:9679: 99 2C 06
		LDA #$00					;C - - - - - 0x01168C 04:967C: A9 00
		STA objAttr+OSLOT_PROJ,Y				;C - - - - - 0x01168E 04:967E: 99 F4 06
		STA ram_00BF				;C - - - - - 0x011691 04:9681: 85 BF
CODE_089683:
	JMP CODE_0898C9				;C - - - - - 0x011693 04:9683: 4C C9 98
CODE_089686:
	CMP #$03					;C - - - - - 0x011696 04:9686: C9 03
	BNE CODE_0896A0				;C - - - - - 0x011698 04:9688: D0 16
		LDA #$00					;C - - - - - 0x01169A 04:968A: A9 00
		STA ram_00B8				;C - - - - - 0x01169C 04:968C: 85 B8
		STA ram_00BB				;C - - - - - 0x01169E 04:968E: 85 BB
		INC ram_00BF				;C - - - - - 0x0116A0 04:9690: E6 BF
		LDA ram_00BF				;C - - - - - 0x0116A2 04:9692: A5 BF
		CMP #$0F					;C - - - - - 0x0116A4 04:9694: C9 0F
		BCC CODE_08969D				;C - - - - - 0x0116A6 04:9696: 90 05
		LDA #$02					;C - - - - - 0x0116A8 04:9698: A9 02
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0116AA 04:969A: 9D 6C 05
	CODE_08969D:
		JMP CODE_0898CC				;C - - - - - 0x0116AD 04:969D: 4C CC 98
CODE_0896A0:
	CMP #$04					;C - - - - - 0x0116B0 04:96A0: C9 04
	BEQ CODE_0896A7				;C - - - - - 0x0116B2 04:96A2: F0 03
		JMP CODE_089732				;C - - - - - 0x0116B4 04:96A4: 4C 32 97
CODE_0896A7:
	LDA #$80					;C - - - - - 0x0116B7 04:96A7: A9 80
	STA ram_00C0,X				;C - - - - - 0x0116B9 04:96A9: 95 C0
	LDA objAnim+OSLOT_ENEMY				;C - - - - - 0x0116BB 04:96AB: AD 84 06
	JSR StartEnemyAnim				;C - - - - - 0x0116BE 04:96AE: 20 58 99
	STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x0116C1 04:96B1: 9D 24 07
	LDA objY+OSLOT_ENEMY				;C - - - - - 0x0116C4 04:96B4: AD 94 05
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x0116C7 04:96B7: 9D 94 05
	LDA #$02					;C - - - - - 0x0116CA 04:96BA: A9 02
	STA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x0116CC 04:96BC: 9D 34 06
	INC ram_00BF				;C - - - - - 0x0116CF 04:96BF: E6 BF
	LDA ram_00BF				;C - - - - - 0x0116D1 04:96C1: A5 BF
	CMP #$02					;C - - - - - 0x0116D3 04:96C3: C9 02
	BCC CODE_089710				;C - - - - - 0x0116D5 04:96C5: 90 49

	CMP #$04					;C - - - - - 0x0116D7 04:96C7: C9 04
	BCC CODE_0896FC				;C - - - - - 0x0116D9 04:96C9: 90 31
		LDA #$00					;C - - - - - 0x0116DB 04:96CB: A9 00
		STA ram_00BF				;C - - - - - 0x0116DD 04:96CD: 85 BF
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0116DF 04:96CF: BD 94 05
		CMP #$38					;C - - - - - 0x0116E2 04:96D2: C9 38
		BCS CODE_089710				;C - - - - - 0x0116E4 04:96D4: B0 3A

		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x0116E6 04:96D6: BD BC 05
		CMP #$80					;C - - - - - 0x0116E9 04:96D9: C9 80
		BNE CODE_089710				;C - - - - - 0x0116EB 04:96DB: D0 33

		LDA #snBomb_ID					;C - - - - - 0x0116ED 04:96DD: A9 29
		STA a:soundTrigger				;C - - - - - 0x0116EF 04:96DF: 8D E1 00
		LDA #$06					;C - - - - - 0x0116F2 04:96E2: A9 06
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0116F4 04:96E4: 9D 6C 05
		LDA #.LOBYTE(anFinalSkullDie_ID)					;C - - - - - 0x0116F7 04:96E7: A9 F8
		STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0116F9 04:96E9: 9D 84 06
		LDA #.HIBYTE(anFinalSkullDie_ID)					;C - - - - - 0x0116FC 04:96EC: A9 00
		STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x0116FE 04:96EE: 9D 24 07
		STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x011701 04:96F1: 9D AC 06
		STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x011704 04:96F4: 9D D4 06
		STA ram_00BF				;C - - - - - 0x011707 04:96F7: 85 BF
		JMP CODE_08970B				;C - - - - - 0x011709 04:96F9: 4C 0B 97
CODE_0896FC:
	LDA #$F0					;C - - - - - 0x01170C 04:96FC: A9 F0
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x01170E 04:96FE: 9D 94 05
	LDA #.LOBYTE(anFinalSkelMonstaL_ID)					;C - - - - - 0x011711 04:9701: A9 67
	STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x011713 04:9703: 9D 84 06
	LDA #.HIBYTE(anFinalSkelMonstaL_ID)					;C - - - - - 0x011716 04:9706: A9 01
	STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x011718 04:9708: 9D 24 07
CODE_08970B:
	LDA #$03					;C - - - - - 0x01171B 04:970B: A9 03
	STA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x01171D 04:970D: 9D 34 06
CODE_089710:
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x011720 04:9710: BD BC 05
	CMP #$80					;C - - - - - 0x011723 04:9713: C9 80
	BEQ CODE_089722				;C - - - - - 0x011725 04:9715: F0 0B
	BCC CODE_08971F				;C - - - - - 0x011727 04:9717: 90 06
		DEC objX+OSLOT_ENEMY,X				;C - - - - - 0x011729 04:9719: DE BC 05
		JMP CODE_089722				;C - - - - - 0x01172C 04:971C: 4C 22 97
CODE_08971F:
	INC objX+OSLOT_ENEMY,X				;C - - - - - 0x01172F 04:971F: FE BC 05
CODE_089722:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x011732 04:9722: BD 94 05
	CMP #$38					;C - - - - - 0x011735 04:9725: C9 38
	BCC CODE_08972F				;C - - - - - 0x011737 04:9727: 90 06
		DEC objY+OSLOT_ENEMY				;C - - - - - 0x011739 04:9729: CE 94 05
		DEC objY+OSLOT_ENEMY,X				;C - - - - - 0x01173C 04:972C: DE 94 05
CODE_08972F:
	JMP CODE_0898C9				;C - - - - - 0x01173F 04:972F: 4C C9 98
CODE_089732:
	CMP #$05					;C - - - - - 0x011742 04:9732: C9 05
	BNE CODE_0897A6				;C - - - - - 0x011744 04:9734: D0 70

	JSR CODE_089934				;C - - - - - 0x011746 04:9736: 20 34 99
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x011749 04:9739: BD 6C 05
	CMP #$05					;C - - - - - 0x01174C 04:973C: C9 05
	BEQ CODE_0897A5				;C - - - - - 0x01174E 04:973E: F0 65

	LDA ram_00B5				;C - - - - - 0x011750 04:9740: A5 B5
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011752 04:9742: 9D 6C 05
	LDA #snEnemyHurt_ID					;C - - - - - 0x011755 04:9745: A9 2B
	STA a:soundTrigger				;C - - - - - 0x011757 04:9747: 8D E1 00
	INC enemyHits,X				;C - - - - - 0x01175A 04:974A: FE BE 04
	LDA enemyHits,X				;C - - - - - 0x01175D 04:974D: BD BE 04
	CMP #$14					;C - - - - - 0x011760 04:9750: C9 14
	BCC CODE_0897A5				;C - - - - - 0x011762 04:9752: 90 51

	LDA #trVictory_ID					;C - - - - - 0x011764 04:9754: A9 0A
	STA a:musicTrigger				;C - - - - - 0x011766 04:9756: 8D E0 00

	LDA #$04					;C - - - - - 0x011769 04:9759: A9 04
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x01176B 04:975B: 9D 6C 05
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01176E 04:975E: BD 94 05
	STA objY+OSLOT_ENEMY				;C - - - - - 0x011771 04:9761: 8D 94 05
	LDA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x011774 04:9764: BD 84 06
	STA objAnim+OSLOT_ENEMY				;C - - - - - 0x011777 04:9767: 8D 84 06
	LDA #$00					;C - - - - - 0x01177A 04:976A: A9 00
	STA enemyReward+9				;C - - - - - 0x01177C 04:976C: 85 97
	LDA #$00					;C - - - - - 0x01177E 04:976E: A9 00
	STA ram_00B8				;C - - - - - 0x011780 04:9770: 85 B8
	STA ram_00BB				;C - - - - - 0x011782 04:9772: 85 BB
	STA ram_00BF				;C - - - - - 0x011784 04:9774: 85 BF
	LDA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x011786 04:9776: BD FC 06
	AND #$FC					;C - - - - - 0x011789 04:9779: 29 FC
	ORA #$01					;C - - - - - 0x01178B 04:977B: 09 01
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x01178D 04:977D: 9D FC 06
	LDA #$00					;C - - - - - 0x011790 04:9780: A9 00
	STA projCounter				;C - - - - - 0x011792 04:9782: 8D 1D 05
	STA projCounter+1				;C - - - - - 0x011795 04:9785: 8D 1E 05
	STA projCounter+2				;C - - - - - 0x011798 04:9788: 8D 1F 05
	LDY #$2D					;C - - - - - 0x01179B 04:978B: A0 2D
	LDA objState+OSLOT_PROJ				;C - - - - - 0x01179D 04:978D: AD 64 05
	BEQ CODE_089795				;C - - - - - 0x0117A0 04:9790: F0 03
		STY objState+OSLOT_PROJ				;C - - - - - 0x0117A2 04:9792: 8C 64 05
CODE_089795:
	LDA objState+2				;C - - - - - 0x0117A5 04:9795: AD 65 05
	BEQ CODE_08979D				;C - - - - - 0x0117A8 04:9798: F0 03
		;Unreached
		STY objState+2				;- - - - - - 0x0117AA 04:979A: 8C
CODE_08979D:
	LDA objState+3				;C - - - - - 0x0117AD 04:979D: AD 66 05
	BEQ CODE_0897A5				;C - - - - - 0x0117B0 04:97A0: F0 03
		;Unreached
		STY objState+3				;- - - - - - 0x0117B2 04:97A2: 8C
CODE_0897A5:
	RTS							;C - - - - - 0x0117B5 04:97A5: 60

CODE_0897A6:
	CMP #$06					;C - - - - - 0x0117B6 04:97A6: C9 06
	BNE CODE_0897BF				;C - - - - - 0x0117B8 04:97A8: D0 15
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0117BA 04:97AA: BD 94 05
		CLC							;C - - - - - 0x0117BD 04:97AD: 18
		ADC #$02					;C - - - - - 0x0117BE 04:97AE: 69 02
		STA objY+OSLOT_ENEMY,X				;C - - - - - 0x0117C0 04:97B0: 9D 94 05
		CMP #$E8					;C - - - - - 0x0117C3 04:97B3: C9 E8
		BCC CODE_0897BC				;C - - - - - 0x0117C5 04:97B5: 90 05
			LDA #$07					;C - - - - - 0x0117C7 04:97B7: A9 07
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0117C9 04:97B9: 9D 6C 05
	CODE_0897BC:
		JMP CODE_0898C9				;C - - - - - 0x0117CC 04:97BC: 4C C9 98
CODE_0897BF:
	CMP #$07					;C - - - - - 0x0117CF 04:97BF: C9 07
	BNE CODE_0897F1				;C - - - - - 0x0117D1 04:97C1: D0 2E

	LDA #$F0					;C - - - - - 0x0117D3 04:97C3: A9 F0
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x0117D5 04:97C5: 9D 94 05
	LDA #.LOBYTE(anFinalSkelMonstaL_ID)					;C - - - - - 0x0117D8 04:97C8: A9 67
	STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0117DA 04:97CA: 9D 84 06
	LDA #.HIBYTE(anFinalSkelMonstaL_ID)					;C - - - - - 0x0117DD 04:97CD: A9 01
	STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x0117DF 04:97CF: 9D 24 07
	LDA #$03					;C - - - - - 0x0117E2 04:97D2: A9 03
	STA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x0117E4 04:97D4: 9D 34 06
	LDA objState+1				;C - - - - - 0x0117E7 04:97D7: AD 64 05
	ORA objState+2				;C - - - - - 0x0117EA 04:97DA: 0D 65 05
	ORA objState+3				;C - - - - - 0x0117ED 04:97DD: 0D 66 05
	BNE CODE_0897EE				;C - - - - - 0x0117F0 04:97E0: D0 0C
		LDA #$00					;C - - - - - 0x0117F2 04:97E2: A9 00
		STA enemyType,X				;C - - - - - 0x0117F4 04:97E4: 95 98
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0117F6 04:97E6: 9D 6C 05
		LDA #$01					;C - - - - - 0x0117F9 04:97E9: A9 01
		STA roundFlags				;C - - - - - 0x0117FB 04:97EB: 8D 71 04
CODE_0897EE:
	JMP CODE_0898C9				;C - - - - - 0x0117FE 04:97EE: 4C C9 98
CODE_0897F1:
	CMP #$08					;C - - - - - 0x011801 04:97F1: C9 08
	BNE CODE_08984B				;C - - - - - 0x011803 04:97F3: D0 56

	JSR CODE_0898CD				;C - - - - - 0x011805 04:97F5: 20 CD 98
	INC enemyReward+7				;C - - - - - 0x011808 04:97F8: E6 95
	LDA enemyReward+7				;C - - - - - 0x01180A 04:97FA: A5 95
	CMP #$0C					;C - - - - - 0x01180C 04:97FC: C9 0C
	BEQ CODE_089805				;C - - - - - 0x01180E 04:97FE: F0 05
	BCS CODE_08981A				;C - - - - - 0x011810 04:9800: B0 18
		JMP CODE_0898F5				;C - - - - - 0x011812 04:9802: 4C F5 98
CODE_089805:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x011815 04:9805: BD 94 05
	SEC							;C - - - - - 0x011818 04:9808: 38
	SBC #$02					;C - - - - - 0x011819 04:9809: E9 02
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x01181B 04:980B: 9D 94 05
	LDA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x01181E 04:980E: BD 84 06
	SEC							;C - - - - - 0x011821 04:9811: 38
	SBC #2					;C - - - - - 0x011822 04:9812: E9 02
	JSR StartEnemyAnim				;C - - - - - 0x011824 04:9814: 20 58 99
	JMP CODE_0898F5				;C - - - - - 0x011827 04:9817: 4C F5 98
CODE_08981A:
	INC ram_00BB				;C - - - - - 0x01182A 04:981A: E6 BB
	LDA ram_00BB				;C - - - - - 0x01182C 04:981C: A5 BB
	CMP #$10					;C - - - - - 0x01182E 04:981E: C9 10
	BNE CODE_089848				;C - - - - - 0x011830 04:9820: D0 26
		LDA #$02					;C - - - - - 0x011832 04:9822: A9 02
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011834 04:9824: 9D 6C 05
		LDA #OPENING_ADVENTURE_MOVE	;C - - - - - 0x011837 04:9827: A9 08
		STA openingStage			;C - - - - - 0x011839 04:9829: 8D CF 04
		LDA #$00					;C - - - - - 0x01183C 04:982C: A9 00
		STA ram_00BB				;C - - - - - 0x01183E 04:982E: 85 BB
		LDA #snBasketFail_ID					;C - - - - - 0x011840 04:9830: A9 1C
		STA a:soundTrigger				;C - - - - - 0x011842 04:9832: 8D E1 00
		LDA playerInvFrames				;C - - - - - 0x011845 04:9835: AD 77 04
		BNE CODE_089848				;C - - - - - 0x011848 04:9838: D0 0E
			LDA ram_0078				;C - - - - - 0x01184A 04:983A: A5 78
			CMP #$80					;C - - - - - 0x01184C 04:983C: C9 80
			BCC CODE_089848				;C - - - - - 0x01184E 04:983E: 90 08
				LDA #$0A					;C - - - - - 0x011850 04:9840: A9 0A
				STA playerState				;C - - - - - 0x011852 04:9842: 85 75
				LDA #$00					;C - - - - - 0x011854 04:9844: A9 00
				STA ram_0076				;C - - - - - 0x011856 04:9846: 85 76
CODE_089848:
	JMP CODE_0898C9				;C - - - - - 0x011858 04:9848: 4C C9 98
CODE_08984B:
	CMP #$09					;C - - - - - 0x01185B 04:984B: C9 09
	BEQ CODE_089852				;C - - - - - 0x01185D 04:984D: F0 03
		;Unreached
		JMP CODE_0898C9				;- - - - - - 0x01185F 04:984F: 4C
CODE_089852:
	JSR CODE_0898CD				;C - - - - - 0x011862 04:9852: 20 CD 98
	LDA ram_00BB				;C - - - - - 0x011865 04:9855: A5 BB
	BMI CODE_089883				;C - - - - - 0x011867 04:9857: 30 2A
	BEQ CODE_089883				;C - - - - - 0x011869 04:9859: F0 28
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01186B 04:985B: BD 94 05
		CMP #$30					;C - - - - - 0x01186E 04:985E: C9 30
		BCC CODE_089883				;C - - - - - 0x011870 04:9860: 90 21
		LDA ram_00CD				;C - - - - - 0x011872 04:9862: A5 CD
		BEQ CODE_089883				;C - - - - - 0x011874 04:9864: F0 1D
			LDA #$02					;C - - - - - 0x011876 04:9866: A9 02
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x011878 04:9868: 9D 6C 05
			LDA ram_00CD				;C - - - - - 0x01187B 04:986B: A5 CD
			AND #$07					;C - - - - - 0x01187D 04:986D: 29 07
			STA scratch0				;C - - - - - 0x01187F 04:986F: 85 00
			LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x011881 04:9871: BD 94 05
			SEC							;C - - - - - 0x011884 04:9874: 38
			SBC scratch0				;C - - - - - 0x011885 04:9875: E5 00
			STA objY+OSLOT_ENEMY,X				;C - - - - - 0x011887 04:9877: 9D 94 05
			LDA #$00					;C - - - - - 0x01188A 04:987A: A9 00
			STA ram_00B8				;C - - - - - 0x01188C 04:987C: 85 B8
			STA ram_00BB				;C - - - - - 0x01188E 04:987E: 85 BB
			JMP CODE_0898C6				;C - - - - - 0x011890 04:9880: 4C C6 98
CODE_089883:
	LDA globalTimer				;C - - - - - 0x011893 04:9883: A5 14
	AND #$02					;C - - - - - 0x011895 04:9885: 29 02
	BEQ CODE_089895				;C - - - - - 0x011897 04:9887: F0 0C
		INC ram_00BB				;C - - - - - 0x011899 04:9889: E6 BB
		BMI CODE_089895				;C - - - - - 0x01189B 04:988B: 30 08
			LDA #$07					;C - - - - - 0x01189D 04:988D: A9 07
			CMP ram_00BB				;C - - - - - 0x01189F 04:988F: C5 BB
			BCS CODE_089895				;C - - - - - 0x0118A1 04:9891: B0 02
				STA ram_00BB				;C - - - - - 0x0118A3 04:9893: 85 BB
CODE_089895:
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x0118A5 04:9895: BD BC 05
	CMP #224					;C - - - - - 0x0118A8 04:9898: C9 E0
	BCC CODE_0898AF				;C - - - - - 0x0118AA 04:989A: 90 13
		LDA #$01					;C - - - - - 0x0118AC 04:989C: A9 01
		STA enemyDir,X				;C - - - - - 0x0118AE 04:989E: 95 A2
		LDA #$FF					;C - - - - - 0x0118B0 04:98A0: A9 FF
		STA ram_00B8				;C - - - - - 0x0118B2 04:98A2: 85 B8
		STA openingCycle				;C - - - - - 0x0118B4 04:98A4: 8D CD 04
		LDA #anFinalSkullL_ID					;C - - - - - 0x0118B7 04:98A7: A9 F4
		STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0118B9 04:98A9: 9D 84 06
		JMP CODE_089683				;C - - - - - 0x0118BC 04:98AC: 4C 83 96
CODE_0898AF:
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x0118BF 04:98AF: BD BC 05
	CMP #32					;C - - - - - 0x0118C2 04:98B2: C9 20
	BCS CODE_0898C6				;C - - - - - 0x0118C4 04:98B4: B0 10
		LDA #$02					;C - - - - - 0x0118C6 04:98B6: A9 02
		STA enemyDir,X				;C - - - - - 0x0118C8 04:98B8: 95 A2
		LDA #$01					;C - - - - - 0x0118CA 04:98BA: A9 01
		STA ram_00B8				;C - - - - - 0x0118CC 04:98BC: 85 B8
		STA openingCycle				;C - - - - - 0x0118CE 04:98BE: 8D CD 04
		LDA #anFinalSkullR_ID					;C - - - - - 0x0118D1 04:98C1: A9 F5
		STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0118D3 04:98C3: 9D 84 06
CODE_0898C6:
	JMP CODE_0898C9				;C - - - - - 0x0118D6 04:98C6: 4C C9 98
CODE_0898C9:
	JMP CODE_0898E3				;C - - - - - 0x0118D9 04:98C9: 4C E3 98
CODE_0898CC:
	RTS							;C - - - - - 0x0118DC 04:98CC: 60

CODE_0898CD:
	LDA scratch8				;C - - - - - 0x0118DD 04:98CD: A5 08
	CMP #$C0					;C - - - - - 0x0118DF 04:98CF: C9 C0
	BCC CODE_0898E2				;C - - - - - 0x0118E1 04:98D1: 90 0F
		LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x0118E3 04:98D3: BD 6C 05
		STA ram_00B5				;C - - - - - 0x0118E6 04:98D6: 85 B5
		LDA #$01					;C - - - - - 0x0118E8 04:98D8: A9 01
		STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x0118EA 04:98DA: 9D FC 06
		LDA #$05					;C - - - - - 0x0118ED 04:98DD: A9 05
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0118EF 04:98DF: 9D 6C 05
CODE_0898E2:
	RTS							;C - - - - - 0x0118F2 04:98E2: 60

CODE_0898E3:
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x0118F3 04:98E3: BD BC 05
	CLC							;C - - - - - 0x0118F6 04:98E6: 18
	ADC ram_00B6,X				;C - - - - - 0x0118F7 04:98E7: 75 B6
	STA objX+OSLOT_ENEMY,X				;C - - - - - 0x0118F9 04:98E9: 9D BC 05
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0118FC 04:98EC: BD 94 05
	CLC							;C - - - - - 0x0118FF 04:98EF: 18
	ADC ram_00B9,X				;C - - - - - 0x011900 04:98F0: 75 B9
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x011902 04:98F2: 9D 94 05
CODE_0898F5:
	RTS							;C - - - - - 0x011905 04:98F5: 60

CODE_0898F6:
	LDA #.BANK(DATA_06BE6E)					;C - - - - - 0x011906 04:98F6: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x011908 04:98F8: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x01190A 04:98FA: 20 56 FF
.endif

	LDA scratch4				;C - - - - - 0x01190D 04:98FD: A5 04
	ASL							;C - - - - - 0x01190F 04:98FF: 0A
	ASL							;C - - - - - 0x011910 04:9900: 0A
	TAY							;C - - - - - 0x011911 04:9901: A8
	LDA DATA_06BE6E,Y			;C - - - - - 0x011912 04:9902: B9 6E BE
	STA scratch5				;C - - - - - 0x011915 04:9905: 85 05
	LDA DATA_06BE6E+1,Y			;C - - - - - 0x011917 04:9907: B9 6F BE
	STA scratch6				;C - - - - - 0x01191A 04:990A: 85 06
	LDA DATA_06BE6E+2,Y			;C - - - - - 0x01191C 04:990C: B9 70 BE
	STA scratch7				;C - - - - - 0x01191F 04:990F: 85 07
	LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x011921 04:9911: BD 34 06
	STA scratch2				;C - - - - - 0x011924 04:9914: 85 02
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x011926 04:9916: BD BC 05
	STA scratch0				;C - - - - - 0x011929 04:9919: 85 00
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01192B 04:991B: BD 94 05
	STA scratch1				;C - - - - - 0x01192E 04:991E: 85 01
	LDA DATA_06BE6E+3,Y			;C - - - - - 0x011930 04:9920: B9 71 BE
	STA scratch4				;C - - - - - 0x011933 04:9923: 85 04
	JSR SpawnProj				;C - - - - - 0x011935 04:9925: 20 82 FE
	LDA scratch4				;C - - - - - 0x011938 04:9928: A5 04
	BEQ CODE_089933				;C - - - - - 0x01193A 04:992A: F0 07
		LDA scratch0				;C - - - - - 0x01193C 04:992C: A5 00
		BEQ CODE_089933				;C - - - - - 0x01193E 04:992E: F0 03
			JSR DespawnProj_Direct				;C - - - - - 0x011940 04:9930: 20 73 FE
CODE_089933:
	RTS							;C - - - - - 0x011943 04:9933: 60

CODE_089934:
	LDA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x011944 04:9934: BD FC 06
	EOR #$02					;C - - - - - 0x011947 04:9937: 49 02
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x011949 04:9939: 9D FC 06
	INC enemyReward,X				;C - - - - - 0x01194C 04:993C: F6 8E
	LDA enemyReward,X				;C - - - - - 0x01194E 04:993E: B5 8E
	CMP #$0A					;C - - - - - 0x011950 04:9940: C9 0A
	BCC CODE_089957				;C - - - - - 0x011952 04:9942: 90 13
		LDA #$00					;C - - - - - 0x011954 04:9944: A9 00
		STA enemyReward,X				;C - - - - - 0x011956 04:9946: 95 8E
		LDA #$02					;C - - - - - 0x011958 04:9948: A9 02
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x01195A 04:994A: 9D 6C 05
		LDA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x01195D 04:994D: BD FC 06
		AND #$FC					;C - - - - - 0x011960 04:9950: 29 FC
		ORA #$01					;C - - - - - 0x011962 04:9952: 09 01
		STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x011964 04:9954: 9D FC 06
CODE_089957:
	RTS							;C - - - - - 0x011967 04:9957: 60

StartEnemyAnim:
	;A: Anim LO
	;X: Enemy index
	;Leaves AnimHI as is , unlike StartEnemyAnim2 (assumed to be zero anyway)
	STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x011968 04:9958: 9D 84 06
	LDA #$00					;C - - - - - 0x01196B 04:995B: A9 00
	STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x01196D 04:995D: 9D AC 06
	STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x011970 04:9960: 9D D4 06
	RTS							;C - - - - - 0x011973 04:9963: 60

CODE_089964:
	;Unreached
	LDA openingStage				;- - - - - - 0x011974 04:9964: AD
	BEQ CODE_089974				;- - - - - - 0x011977 04:9967: F0
		DEC openingStage				;- - - - - - 0x011979 04:9969: CE
		BEQ CODE_089974				;- - - - - - 0x01197C 04:996C: F0
			LDA vScroll				;- - - - - - 0x01197E 04:996E: A5
			CMP #$04					;- - - - - - 0x011980 04:9970: C9
			BNE CODE_089979				;- - - - - - 0x011982 04:9972: D0
CODE_089974:
	LDA #$00					;- - - - - - 0x011984 04:9974: A9
	JMP CODE_08997C				;- - - - - - 0x011986 04:9976: 4C
CODE_089979:
	CLC							;- - - - - - 0x011989 04:9979: 18
	ADC #$04					;- - - - - - 0x01198A 04:997A: 69
CODE_08997C:
	STA vScroll				;- - - - - - 0x01198C 04:997C: 85
	RTS							;- - - - - - 0x01198E 04:997E: 60

CODE_08997F:
	INC openingCycle				;C - - - - - 0x01198F 04:997F: EE CD 04
	LDA untrappedEnemies				;C - - - - - 0x011992 04:9982: A5 CC
	CMP #$01					;C - - - - - 0x011994 04:9984: C9 01
	BNE CODE_08998A				;C - - - - - 0x011996 04:9986: D0 02
		INC ram_00BB				;C - - - - - 0x011998 04:9988: E6 BB
CODE_08998A:
	LDA ram_00CA				;C - - - - - 0x01199A 04:998A: A5 CA
	CMP #$01					;C - - - - - 0x01199C 04:998C: C9 01
	BNE CODE_0899A6				;C - - - - - 0x01199E 04:998E: D0 16
		LDA untrappedEnemies				;C - - - - - 0x0119A0 04:9990: A5 CC
		CMP #$01					;C - - - - - 0x0119A2 04:9992: C9 01
		BNE CODE_0899A3				;C - - - - - 0x0119A4 04:9994: D0 0D
			LDA ram_00BB				;C - - - - - 0x0119A6 04:9996: A5 BB
			CMP #$80					;C - - - - - 0x0119A8 04:9998: C9 80
			BCC CODE_0899A3				;C - - - - - 0x0119AA 04:999A: 90 07
				LDA #$02					;C - - - - - 0x0119AC 04:999C: A9 02
				STA scratch3				;C - - - - - 0x0119AE 04:999E: 85 03
				JSR CODE_089C58				;C - - - - - 0x0119B0 04:99A0: 20 58 9C
	CODE_0899A3:
		JMP CODE_089B59				;C - - - - - 0x0119B3 04:99A3: 4C 59 9B
CODE_0899A6:
	CMP #$02					;C - - - - - 0x0119B6 04:99A6: C9 02
	BNE CODE_089A20				;C - - - - - 0x0119B8 04:99A8: D0 76

	CPX #$01					;C - - - - - 0x0119BA 04:99AA: E0 01
	BNE CODE_0899D6				;C - - - - - 0x0119BC 04:99AC: D0 28
		LDA ram_00BB				;C - - - - - 0x0119BE 04:99AE: A5 BB
		CMP #$31					;C - - - - - 0x0119C0 04:99B0: C9 31
		BCS CODE_0899D6				;C - - - - - 0x0119C2 04:99B2: B0 22
			AND #$0F					;C - - - - - 0x0119C4 04:99B4: 29 0F
			BNE CODE_089A1D				;C - - - - - 0x0119C6 04:99B6: D0 65
				LDA #psDOHBrickBegin_ID					;C - - - - - 0x0119C8 04:99B8: A9 06
				STA scratch5				;C - - - - - 0x0119CA 04:99BA: 85 05
				LDA #.LOBYTE(anDOHProjSpin_ID)					;C - - - - - 0x0119CC 04:99BC: A9 68
				STA scratch6				;C - - - - - 0x0119CE 04:99BE: 85 06
				LDA #.HIBYTE(anDOHProjSpin_ID)					;C - - - - - 0x0119D0 04:99C0: A9 00
				STA scratch7				;C - - - - - 0x0119D2 04:99C2: 85 07
				LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x0119D4 04:99C4: BD 34 06
				STA scratch2				;C - - - - - 0x0119D7 04:99C7: 85 02
				LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x0119D9 04:99C9: BD BC 05
				STA scratch0				;C - - - - - 0x0119DC 04:99CC: 85 00
				LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0119DE 04:99CE: BD 94 05
				STA scratch1				;C - - - - - 0x0119E1 04:99D1: 85 01
				JSR SpawnProj				;C - - - - - 0x0119E3 04:99D3: 20 82 FE
CODE_0899D6:
	LDA untrappedEnemies				;C - - - - - 0x0119E6 04:99D6: A5 CC
	CMP #$01					;C - - - - - 0x0119E8 04:99D8: C9 01
	BNE CODE_089A1D				;C - - - - - 0x0119EA 04:99DA: D0 41

	LDA ram_00BB				;C - - - - - 0x0119EC 04:99DC: A5 BB
	CMP #$38					;C - - - - - 0x0119EE 04:99DE: C9 38
	BEQ CODE_0899F1				;C - - - - - 0x0119F0 04:99E0: F0 0F
		CMP #$48					;C - - - - - 0x0119F2 04:99E2: C9 48
		BEQ CODE_0899F9				;C - - - - - 0x0119F4 04:99E4: F0 13
			CMP #$58					;C - - - - - 0x0119F6 04:99E6: C9 58
			BEQ CODE_089A01				;C - - - - - 0x0119F8 04:99E8: F0 17
				CMP #$68					;C - - - - - 0x0119FA 04:99EA: C9 68
				BCS CODE_089A07				;C - - - - - 0x0119FC 04:99EC: B0 19
					JMP CODE_089A1D				;C - - - - - 0x0119FE 04:99EE: 4C 1D 9A
CODE_0899F1:
	LDY #$03					;C - - - - - 0x011A01 04:99F1: A0 03
	CPX #$03					;C - - - - - 0x011A03 04:99F3: E0 03
	BEQ CODE_089A07				;C - - - - - 0x011A05 04:99F5: F0 10
	BNE CODE_089A0F				;C - - - - - 0x011A07 04:99F7: D0 16
CODE_0899F9:
	LDY #$02					;C - - - - - 0x011A09 04:99F9: A0 02
	CPX #$02					;C - - - - - 0x011A0B 04:99FB: E0 02
	BEQ CODE_089A07				;C - - - - - 0x011A0D 04:99FD: F0 08
	BNE CODE_089A0F				;C - - - - - 0x011A0F 04:99FF: D0 0E
CODE_089A01:
	LDY #$01					;C - - - - - 0x011A11 04:9A01: A0 01
	CPX #$01					;C - - - - - 0x011A13 04:9A03: E0 01
	BNE CODE_089A0F				;C - - - - - 0x011A15 04:9A05: D0 08
CODE_089A07:
	LDA #$03					;C - - - - - 0x011A17 04:9A07: A9 03
	STA ram_00CA				;C - - - - - 0x011A19 04:9A09: 85 CA
	LDA #$00					;C - - - - - 0x011A1B 04:9A0B: A9 00
	STA ram_00BB				;C - - - - - 0x011A1D 04:9A0D: 85 BB
CODE_089A0F:
	LDA objState+OSLOT_ENEMY,Y				;C - - - - - 0x011A1F 04:9A0F: B9 6C 05
	BEQ CODE_089A1D				;C - - - - - 0x011A22 04:9A12: F0 09
		CMP #$0B					;C - - - - - 0x011A24 04:9A14: C9 0B
		BCS CODE_089A1D				;C - - - - - 0x011A26 04:9A16: B0 05
			LDA #$03					;C - - - - - 0x011A28 04:9A18: A9 03
			STA objState+OSLOT_ENEMY,Y				;C - - - - - 0x011A2A 04:9A1A: 99 6C 05
CODE_089A1D:
	JMP CODE_089B59				;C - - - - - 0x011A2D 04:9A1D: 4C 59 9B
CODE_089A20:
	CMP #$03					;C - - - - - 0x011A30 04:9A20: C9 03
	BNE CODE_089A3D				;C - - - - - 0x011A32 04:9A22: D0 19
		JSR CODE_089BC3				;C - - - - - 0x011A34 04:9A24: 20 C3 9B
		JSR CODE_089C03				;C - - - - - 0x011A37 04:9A27: 20 03 9C
		LDA untrappedEnemies				;C - - - - - 0x011A3A 04:9A2A: A5 CC
		CMP #$01					;C - - - - - 0x011A3C 04:9A2C: C9 01
		BNE CODE_089A3A				;C - - - - - 0x011A3E 04:9A2E: D0 0A
			LDA ram_00BB				;C - - - - - 0x011A40 04:9A30: A5 BB
			CMP #$80					;C - - - - - 0x011A42 04:9A32: C9 80
			BCC CODE_089A3A				;C - - - - - 0x011A44 04:9A34: 90 04
				LDA #$04					;C - - - - - 0x011A46 04:9A36: A9 04
				STA ram_00CA				;C - - - - - 0x011A48 04:9A38: 85 CA
	CODE_089A3A:
		JMP CODE_089B59				;C - - - - - 0x011A4A 04:9A3A: 4C 59 9B
CODE_089A3D:
	CMP #$04					;C - - - - - 0x011A4D 04:9A3D: C9 04
	BEQ CODE_089A44				;C - - - - - 0x011A4F 04:9A3F: F0 03
		JMP CODE_089B13				;C - - - - - 0x011A51 04:9A41: 4C 13 9B
CODE_089A44:
	LDY #$00					;C - - - - - 0x011A54 04:9A44: A0 00
CODE_089A46:
	LDA objState+OSLOT_ENEMY,Y				;C - - - - - 0x011A56 04:9A46: B9 6C 05
	BEQ CODE_089A4F				;C - - - - - 0x011A59 04:9A49: F0 04
		CMP #$0B					;C - - - - - 0x011A5B 04:9A4B: C9 0B
		BCC CODE_089A54				;C - - - - - 0x011A5D 04:9A4D: 90 05
CODE_089A4F:
	INY							;C - - - - - 0x011A5F 04:9A4F: C8
	CPY #$04					;C - - - - - 0x011A60 04:9A50: C0 04
	BNE CODE_089A46				;C - - - - - 0x011A62 04:9A52: D0 F2
CODE_089A54:
	LDA objX+OSLOT_ENEMY,Y				;C - - - - - 0x011A64 04:9A54: B9 BC 05
	STA scratch8				;C - - - - - 0x011A67 04:9A57: 85 08
	TXA							;C - - - - - 0x011A69 04:9A59: 8A
	PHA							;C - - - - - 0x011A6A 04:9A5A: 48
	LDA objY+OSLOT_ENEMY,Y				;C - - - - - 0x011A6B 04:9A5B: B9 94 05
	LDX untrappedEnemies				;C - - - - - 0x011A6E 04:9A5E: A6 CC
	SEC							;C - - - - - 0x011A70 04:9A60: 38
	SBC DATA_0CBE2E,X			;C - - - - - 0x011A71 04:9A61: FD 2E BE
	STA scratch9				;C - - - - - 0x011A74 04:9A64: 85 09
	PLA							;C - - - - - 0x011A76 04:9A66: 68
	TAX							;C - - - - - 0x011A77 04:9A67: AA
	LDA untrappedEnemies				;C - - - - - 0x011A78 04:9A68: A5 CC
	CMP #$01					;C - - - - - 0x011A7A 04:9A6A: C9 01
	BNE CODE_089A86				;C - - - - - 0x011A7C 04:9A6C: D0 18
		LDA ram_00CD				;C - - - - - 0x011A7E 04:9A6E: A5 CD
		CMP #$80					;C - - - - - 0x011A80 04:9A70: C9 80
		BCS CODE_089A7B				;C - - - - - 0x011A82 04:9A72: B0 07
			LDA #$02					;C - - - - - 0x011A84 04:9A74: A9 02
			STA ram_00D5				;C - - - - - 0x011A86 04:9A76: 85 D5
			JMP CODE_089B10				;C - - - - - 0x011A88 04:9A78: 4C 10 9B
	CODE_089A7B:
		AND #$0F					;C - - - - - 0x011A8B 04:9A7B: 29 0F
		EOR #$FF					;C - - - - - 0x011A8D 04:9A7D: 49 FF
		STA ram_00D5				;C - - - - - 0x011A8F 04:9A7F: 85 D5
		INC ram_00D5				;C - - - - - 0x011A91 04:9A81: E6 D5
		JMP CODE_089B03				;C - - - - - 0x011A93 04:9A83: 4C 03 9B
CODE_089A86:
	LDA scratch8				;C - - - - - 0x011A96 04:9A86: A5 08
	CMP objX+OSLOT_ENEMY,X				;C - - - - - 0x011A98 04:9A88: DD BC 05
	BEQ CODE_089AC1				;C - - - - - 0x011A9B 04:9A8B: F0 34
	BCS CODE_089AA8				;C - - - - - 0x011A9D 04:9A8D: B0 19
		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x011A9F 04:9A8F: BD BC 05
		SEC							;C - - - - - 0x011AA2 04:9A92: 38
		SBC scratch8				;C - - - - - 0x011AA3 04:9A93: E5 08
		CMP #$04					;C - - - - - 0x011AA5 04:9A95: C9 04
		BCS CODE_089AA1				;C - - - - - 0x011AA7 04:9A97: B0 08
			LDA scratch8				;C - - - - - 0x011AA9 04:9A99: A5 08
			STA objX+OSLOT_ENEMY,X				;C - - - - - 0x011AAB 04:9A9B: 9D BC 05
			JMP CODE_089B10				;C - - - - - 0x011AAE 04:9A9E: 4C 10 9B
	CODE_089AA1:
		LDA #$FC					;C - - - - - 0x011AB1 04:9AA1: A9 FC
		STA ram_00D4				;C - - - - - 0x011AB3 04:9AA3: 85 D4
		JMP CODE_089B10				;C - - - - - 0x011AB5 04:9AA5: 4C 10 9B
CODE_089AA8:
	LDA scratch8				;C - - - - - 0x011AB8 04:9AA8: A5 08
	SEC							;C - - - - - 0x011ABA 04:9AAA: 38
	SBC objX+OSLOT_ENEMY,X				;C - - - - - 0x011ABB 04:9AAB: FD BC 05
	CMP #$04					;C - - - - - 0x011ABE 04:9AAE: C9 04
	BCS CODE_089ABA				;C - - - - - 0x011AC0 04:9AB0: B0 08
		LDA scratch8				;C - - - - - 0x011AC2 04:9AB2: A5 08
		STA objX+OSLOT_ENEMY,X				;C - - - - - 0x011AC4 04:9AB4: 9D BC 05
		JMP CODE_089B10				;C - - - - - 0x011AC7 04:9AB7: 4C 10 9B
CODE_089ABA:
	LDA #$04					;C - - - - - 0x011ACA 04:9ABA: A9 04
	STA ram_00D4				;C - - - - - 0x011ACC 04:9ABC: 85 D4
	JMP CODE_089B10				;C - - - - - 0x011ACE 04:9ABE: 4C 10 9B
CODE_089AC1:
	LDA scratch9				;C - - - - - 0x011AD1 04:9AC1: A5 09
	CMP objY+OSLOT_ENEMY,X				;C - - - - - 0x011AD3 04:9AC3: DD 94 05
	BEQ CODE_089AFC				;C - - - - - 0x011AD6 04:9AC6: F0 34
	BCS CODE_089AE3				;C - - - - - 0x011AD8 04:9AC8: B0 19
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x011ADA 04:9ACA: BD 94 05
		SEC							;C - - - - - 0x011ADD 04:9ACD: 38
		SBC scratch9				;C - - - - - 0x011ADE 04:9ACE: E5 09
		CMP #$04					;C - - - - - 0x011AE0 04:9AD0: C9 04
		BCS CODE_089ADC				;C - - - - - 0x011AE2 04:9AD2: B0 08
			LDA scratch9				;C - - - - - 0x011AE4 04:9AD4: A5 09
			STA objY+OSLOT_ENEMY,X				;C - - - - - 0x011AE6 04:9AD6: 9D 94 05
			JMP CODE_089B10				;C - - - - - 0x011AE9 04:9AD9: 4C 10 9B
	CODE_089ADC:
		LDA #$FE					;C - - - - - 0x011AEC 04:9ADC: A9 FE
		STA ram_00D5				;C - - - - - 0x011AEE 04:9ADE: 85 D5
		JMP CODE_089B10				;C - - - - - 0x011AF0 04:9AE0: 4C 10 9B
CODE_089AE3:
	LDA scratch9				;C - - - - - 0x011AF3 04:9AE3: A5 09
	SEC							;C - - - - - 0x011AF5 04:9AE5: 38
	SBC objY+OSLOT_ENEMY,X				;C - - - - - 0x011AF6 04:9AE6: FD 94 05
	CMP #$04					;C - - - - - 0x011AF9 04:9AE9: C9 04
	BCS CODE_089AF5				;C - - - - - 0x011AFB 04:9AEB: B0 08
		LDA scratch9				;C - - - - - 0x011AFD 04:9AED: A5 09
		STA objY+OSLOT_ENEMY,X				;C - - - - - 0x011AFF 04:9AEF: 9D 94 05
		JMP CODE_089B10				;C - - - - - 0x011B02 04:9AF2: 4C 10 9B
CODE_089AF5:
	LDA #$02					;C - - - - - 0x011B05 04:9AF5: A9 02
	STA ram_00D5				;C - - - - - 0x011B07 04:9AF7: 85 D5
	JMP CODE_089B10				;C - - - - - 0x011B09 04:9AF9: 4C 10 9B
CODE_089AFC:
	LDA objState+OSLOT_ENEMY,Y				;C - - - - - 0x011B0C 04:9AFC: B9 6C 05
	CMP #$05					;C - - - - - 0x011B0F 04:9AFF: C9 05
	BNE CODE_089B10				;C - - - - - 0x011B11 04:9B01: D0 0D
CODE_089B03:
	LDA #$05					;C - - - - - 0x011B13 04:9B03: A9 05
	STA ram_00CA				;C - - - - - 0x011B15 04:9B05: 85 CA
	LDA #snBall_ID					;C - - - - - 0x011B17 04:9B07: A9 25
	STA a:soundTrigger				;C - - - - - 0x011B19 04:9B09: 8D E1 00
	LDA #$00					;C - - - - - 0x011B1C 04:9B0C: A9 00
	STA ram_00BB				;C - - - - - 0x011B1E 04:9B0E: 85 BB
CODE_089B10:
	JMP CODE_089B59				;C - - - - - 0x011B20 04:9B10: 4C 59 9B
CODE_089B13:
	CMP #$05					;C - - - - - 0x011B23 04:9B13: C9 05
	BEQ CODE_089B1A				;C - - - - - 0x011B25 04:9B15: F0 03
		;Unreached
		JMP CODE_089B59				;- - - - - - 0x011B27 04:9B17: 4C
CODE_089B1A:
	LDA untrappedEnemies				;C - - - - - 0x011B2A 04:9B1A: A5 CC
	CMP #$01					;C - - - - - 0x011B2C 04:9B1C: C9 01
	BNE CODE_089B3C				;C - - - - - 0x011B2E 04:9B1E: D0 1C

	TXA							;C - - - - - 0x011B30 04:9B20: 8A
	TAY							;C - - - - - 0x011B31 04:9B21: A8
CODE_089B22:
	INY							;C - - - - - 0x011B32 04:9B22: C8
	LDA objState+OSLOT_ENEMY,Y				;C - - - - - 0x011B33 04:9B23: B9 6C 05
	BEQ CODE_089B30				;C - - - - - 0x011B36 04:9B26: F0 08
		CMP #$0B					;C - - - - - 0x011B38 04:9B28: C9 0B
		BCS CODE_089B30				;C - - - - - 0x011B3A 04:9B2A: B0 04
			CMP #$05					;C - - - - - 0x011B3C 04:9B2C: C9 05
			BNE CODE_089B37				;C - - - - - 0x011B3E 04:9B2E: D0 07
CODE_089B30:
	CPY #$03					;C - - - - - 0x011B40 04:9B30: C0 03
	BNE CODE_089B22				;C - - - - - 0x011B42 04:9B32: D0 EE
		JMP CODE_089B3C				;C - - - - - 0x011B44 04:9B34: 4C 3C 9B
CODE_089B37:
	LDA #$04					;C - - - - - 0x011B47 04:9B37: A9 04
	STA objState+OSLOT_ENEMY,Y				;C - - - - - 0x011B49 04:9B39: 99 6C 05
CODE_089B3C:
	LDY #$00					;C - - - - - 0x011B4C 04:9B3C: A0 00
CODE_089B3E:
	LDA objState+OSLOT_ENEMY,Y				;C - - - - - 0x011B4E 04:9B3E: B9 6C 05
	BEQ CODE_089B47				;C - - - - - 0x011B51 04:9B41: F0 04
		CMP #$05					;C - - - - - 0x011B53 04:9B43: C9 05
		BNE CODE_089B59				;C - - - - - 0x011B55 04:9B45: D0 12
CODE_089B47:
	INY							;C - - - - - 0x011B57 04:9B47: C8
	CPY #$04					;C - - - - - 0x011B58 04:9B48: C0 04
	BNE CODE_089B3E				;C - - - - - 0x011B5A 04:9B4A: D0 F2

	LDA untrappedEnemies				;C - - - - - 0x011B5C 04:9B4C: A5 CC
	CMP #$01					;C - - - - - 0x011B5E 04:9B4E: C9 01
	BNE CODE_089B59				;C - - - - - 0x011B60 04:9B50: D0 07
		LDA #$01					;C - - - - - 0x011B62 04:9B52: A9 01
		STA scratch3				;C - - - - - 0x011B64 04:9B54: 85 03
		JSR CODE_089C58				;C - - - - - 0x011B66 04:9B56: 20 58 9C
CODE_089B59:
	JSR CODE_0FF9E8				;C - - - - - 0x011B69 04:9B59: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x011B6C 04:9B5C: A5 CA
	CMP #$7F					;C - - - - - 0x011B6E 04:9B5E: C9 7F
	BCC CODE_089B9B				;C - - - - - 0x011B70 04:9B60: 90 39

	LDA shootQueuedBubbles				;C - - - - - 0x011B72 04:9B62: AD 16 05
	STA scratch0				;C - - - - - 0x011B75 04:9B65: 85 00
	JSR CODE_0FFB0C				;C - - - - - 0x011B77 04:9B67: 20 0C FB
	LDA ram_00CA				;C - - - - - 0x011B7A 04:9B6A: A5 CA
	AND #$1F					;C - - - - - 0x011B7C 04:9B6C: 29 1F
	STA ram_00CA				;C - - - - - 0x011B7E 04:9B6E: 85 CA
	LDA #$06					;C - - - - - 0x011B80 04:9B70: A9 06
	STA ram_00C0,X				;C - - - - - 0x011B82 04:9B72: 95 C0
	LDY scratch0				;C - - - - - 0x011B84 04:9B74: A4 00
	LDA enemyHits,X				;C - - - - - 0x011B86 04:9B76: BD BE 04
	CLC							;C - - - - - 0x011B89 04:9B79: 18
	ADC DATA_089B98,Y			;C - - - - - 0x011B8A 04:9B7A: 79 98 9B
	STA enemyHits,X				;C - - - - - 0x011B8D 04:9B7D: 9D BE 04
	CMP #20					;C - - - - - 0x011B90 04:9B80: C9 14
	BCC CODE_089B9B				;C - - - - - 0x011B92 04:9B82: 90 17

	JSR CODE_0FFAA3				;C - - - - - 0x011B94 04:9B84: 20 A3 FA

.ifdef REGION_JP
	LDA #anDOHTrapped_ID					;- - - - - - 0x011BB0 04:9BA0: A9
	STA objAnim+OSLOT_BUBBLE,Y					;- - - - - - 0x011BB2 04:9BA2: 99
.endif

	LDA #$00					;C - - - - - 0x011B97 04:9B87: A9 00
	STA ram_00C0,X				;C - - - - - 0x011B99 04:9B89: 95 C0
	LDA enemyDir,X				;C - - - - - 0x011B9B 04:9B8B: B5 A2
	CMP #$03					;C - - - - - 0x011B9D 04:9B8D: C9 03
	BCC CODE_089B93				;C - - - - - 0x011B9F 04:9B8F: 90 02
		LDA #$01					;C - - - - - 0x011BA1 04:9B91: A9 01
CODE_089B93:
	STA enemyDir,X				;C - - - - - 0x011BA3 04:9B93: 95 A2
	JMP CODE_089BC2				;C - - - - - 0x011BA5 04:9B95: 4C C2 9B

DATA_089B98:
	.byte $01					;- D 0 - - - 0x011BA8 04:9B98: 01
	.byte $06					;- - - - - - 0x011BA9 04:9B99: 06
	.byte $09					;- - - - - - 0x011BAA 04:9B9A: 09

CODE_089B9B:
	STX scratch0				;C - - - - - 0x011BAB 04:9B9B: 86 00
	LDA ram_00CA				;C - - - - - 0x011BAD 04:9B9D: A5 CA
	CMP #$0B					;C - - - - - 0x011BAF 04:9B9F: C9 0B
	BCS CODE_089BC2				;C - - - - - 0x011BB1 04:9BA1: B0 1F
		CMP #$02					;C - - - - - 0x011BB3 04:9BA3: C9 02
		BEQ CODE_089BA9				;C - - - - - 0x011BB5 04:9BA5: F0 02
			LDA #$01					;C - - - - - 0x011BB7 04:9BA7: A9 01
	CODE_089BA9:
		ASL							;C - - - - - 0x011BB9 04:9BA9: 0A
		ASL							;C - - - - - 0x011BBA 04:9BAA: 0A
		CLC							;C - - - - - 0x011BBB 04:9BAB: 18
		ADC scratch0				;C - - - - - 0x011BBC 04:9BAC: 65 00
		TAY							;C - - - - - 0x011BBE 04:9BAE: A8
		LDA DOHAnims,Y			;C - - - - - 0x011BBF 04:9BAF: B9 4C 9C
		CMP objAnim+OSLOT_ENEMY,X				;C - - - - - 0x011BC2 04:9BB2: DD 84 06
		BEQ CODE_089BC2				;C - - - - - 0x011BC5 04:9BB5: F0 0B
			STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x011BC7 04:9BB7: 9D 84 06
			LDA #$00					;C - - - - - 0x011BCA 04:9BBA: A9 00
			STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x011BCC 04:9BBC: 9D D4 06
			STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x011BCF 04:9BBF: 9D AC 06
CODE_089BC2:
	RTS							;C - - - - - 0x011BD2 04:9BC2: 60

CODE_089BC3:
	LDA globalTimer				;C - - - - - 0x011BD3 04:9BC3: A5 14
	CMP #$2E					;C - - - - - 0x011BD5 04:9BC5: C9 2E
	BNE CODE_089BD1				;C - - - - - 0x011BD7 04:9BC7: D0 08
		LDA ram_00BB				;C - - - - - 0x011BD9 04:9BC9: A5 BB
		AND #$03					;C - - - - - 0x011BDB 04:9BCB: 29 03
		STA enemyDir,X				;C - - - - - 0x011BDD 04:9BCD: 95 A2
		INC enemyDir,X				;C - - - - - 0x011BDF 04:9BCF: F6 A2
CODE_089BD1:
	LDA enemyDir,X				;C - - - - - 0x011BE1 04:9BD1: B5 A2
	BNE CODE_089BD9				;C - - - - - 0x011BE3 04:9BD3: D0 04
		;Unreached
		LDA #$01					;- - - - - - 0x011BE5 04:9BD5: A9
		STA enemyDir,X				;- - - - - - 0x011BE7 04:9BD7: 95
CODE_089BD9:
	CMP #$01					;C - - - - - 0x011BE9 04:9BD9: C9 01
	BNE CODE_089BE4				;C - - - - - 0x011BEB 04:9BDB: D0 07
		LDA #$03					;C - - - - - 0x011BED 04:9BDD: A9 03
		STA ram_00D4				;C - - - - - 0x011BEF 04:9BDF: 85 D4
		JMP CODE_089C02				;C - - - - - 0x011BF1 04:9BE1: 4C 02 9C
CODE_089BE4:
	CMP #$02					;C - - - - - 0x011BF4 04:9BE4: C9 02
	BNE CODE_089BEF				;C - - - - - 0x011BF6 04:9BE6: D0 07
		LDA #$FD					;C - - - - - 0x011BF8 04:9BE8: A9 FD
		STA ram_00D4				;C - - - - - 0x011BFA 04:9BEA: 85 D4
		JMP CODE_089C02				;C - - - - - 0x011BFC 04:9BEC: 4C 02 9C
CODE_089BEF:
	CMP #$03					;C - - - - - 0x011BFF 04:9BEF: C9 03
	BNE CODE_089BFA				;C - - - - - 0x011C01 04:9BF1: D0 07
		LDA #$FD					;C - - - - - 0x011C03 04:9BF3: A9 FD
		STA ram_00D5				;C - - - - - 0x011C05 04:9BF5: 85 D5
		JMP CODE_089C02				;C - - - - - 0x011C07 04:9BF7: 4C 02 9C
CODE_089BFA:
	CMP #$04					;C - - - - - 0x011C0A 04:9BFA: C9 04
	BNE CODE_089C02				;C - - - - - 0x011C0C 04:9BFC: D0 04
		LDA #$03					;C - - - - - 0x011C0E 04:9BFE: A9 03
		STA ram_00D5				;C - - - - - 0x011C10 04:9C00: 85 D5
CODE_089C02:
	RTS							;C - - - - - 0x011C12 04:9C02: 60

CODE_089C03:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x011C13 04:9C03: BD 94 05
	CMP #$28					;C - - - - - 0x011C16 04:9C06: C9 28
	BCC CODE_089C1A				;C - - - - - 0x011C18 04:9C08: 90 10
	CMP #$C8					;C - - - - - 0x011C1A 04:9C0A: C9 C8
	BCC CODE_089C23				;C - - - - - 0x011C1C 04:9C0C: 90 15
	LDA #$C8					;C - - - - - 0x011C1E 04:9C0E: A9 C8
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x011C20 04:9C10: 9D 94 05
	LDA #$03					;C - - - - - 0x011C23 04:9C13: A9 03
	STA enemyDir,X				;C - - - - - 0x011C25 04:9C15: 95 A2
	JMP CODE_089C23				;C - - - - - 0x011C27 04:9C17: 4C 23 9C
CODE_089C1A:
	LDA #$28					;C - - - - - 0x011C2A 04:9C1A: A9 28
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x011C2C 04:9C1C: 9D 94 05
	LDA #$04					;C - - - - - 0x011C2F 04:9C1F: A9 04
	STA enemyDir,X				;C - - - - - 0x011C31 04:9C21: 95 A2
CODE_089C23:
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x011C33 04:9C23: BD BC 05
	CMP #$20					;C - - - - - 0x011C36 04:9C26: C9 20
	BCC CODE_089C3A				;C - - - - - 0x011C38 04:9C28: 90 10
	CMP #$E0					;C - - - - - 0x011C3A 04:9C2A: C9 E0
	BCC CODE_089C43				;C - - - - - 0x011C3C 04:9C2C: 90 15
	LDA #$E0					;C - - - - - 0x011C3E 04:9C2E: A9 E0
	STA objX+OSLOT_ENEMY,X				;C - - - - - 0x011C40 04:9C30: 9D BC 05
	LDA #$02					;C - - - - - 0x011C43 04:9C33: A9 02
	STA enemyDir,X				;C - - - - - 0x011C45 04:9C35: 95 A2
	JMP CODE_089C43				;C - - - - - 0x011C47 04:9C37: 4C 43 9C
CODE_089C3A:
	LDA #$20					;C - - - - - 0x011C4A 04:9C3A: A9 20
	STA objX+OSLOT_ENEMY,X				;C - - - - - 0x011C4C 04:9C3C: 9D BC 05
	LDA #$01					;C - - - - - 0x011C4F 04:9C3F: A9 01
	STA enemyDir,X				;C - - - - - 0x011C51 04:9C41: 95 A2
CODE_089C43:
	RTS							;C - - - - - 0x011C53 04:9C43: 60

DATA_089C44:
	;Unreached
	.byte $80					;- - - - - - 0x011C54 04:9C44: 80
	.byte $A0					;- - - - - - 0x011C55 04:9C45: A0
	.byte $C0					;- - - - - - 0x011C56 04:9C46: C0
	.byte $E0					;- - - - - - 0x011C57 04:9C47: E0
	.byte $60					;- - - - - - 0x011C58 04:9C48: 60
	.byte $50					;- - - - - - 0x011C59 04:9C49: 50
	.byte $40					;- - - - - - 0x011C5A 04:9C4A: 40
	.byte $30					;- - - - - - 0x011C5B 04:9C4B: 30

DOHAnims:
	.byte $00					;- - - - - - 0x011C5C 04:9C4C: 00
	.byte $00					;- - - - - - 0x011C5D 04:9C4D: 00
	.byte $00					;- - - - - - 0x011C5E 04:9C4E: 00
	.byte $00					;- - - - - - 0x011C5F 04:9C4F: 00
	.byte anDOHBody_ID			;- D 0 - - - 0x011C60 04:9C50: C9
	.byte anDOHMouth_ID			;- D 0 - - - 0x011C61 04:9C51: C8
	.byte anDOHFace_ID			;- D 0 - - - 0x011C62 04:9C52: C7
	.byte anDOHTop_ID			;- D 0 - - - 0x011C63 04:9C53: C6
	.byte anDOHBodyShoot_ID		;- D 0 - - - 0x011C64 04:9C54: CD
	.byte anDOHMouthShoot_ID	;- D 0 - - - 0x011C65 04:9C55: CC
	.byte anDOHFaceShoot_ID		;- D 0 - - - 0x011C66 04:9C56: CB
	.byte anDOHTopShoot_ID		;- D 0 - - - 0x011C67 04:9C57: CA

CODE_089C58:
	LDY #$00					;C - - - - - 0x011C68 04:9C58: A0 00
CODE_089C5A:
	LDA objState+OSLOT_ENEMY,Y				;C - - - - - 0x011C6A 04:9C5A: B9 6C 05
	BEQ CODE_089C68				;C - - - - - 0x011C6D 04:9C5D: F0 09
		CMP #$0B					;C - - - - - 0x011C6F 04:9C5F: C9 0B
		BCS CODE_089C68				;C - - - - - 0x011C71 04:9C61: B0 05
			LDA scratch3				;C - - - - - 0x011C73 04:9C63: A5 03
			STA objState+OSLOT_ENEMY,Y				;C - - - - - 0x011C75 04:9C65: 99 6C 05
CODE_089C68:
	INY							;C - - - - - 0x011C78 04:9C68: C8
	CPY #$04					;C - - - - - 0x011C79 04:9C69: C0 04
	BCC CODE_089C5A				;C - - - - - 0x011C7B 04:9C6B: 90 ED

	LDA scratch3				;C - - - - - 0x011C7D 04:9C6D: A5 03
	STA ram_00CA				;C - - - - - 0x011C7F 04:9C6F: 85 CA
	LDA #$00					;C - - - - - 0x011C81 04:9C71: A9 00
	STA ram_00BB				;C - - - - - 0x011C83 04:9C73: 85 BB
	RTS							;C - - - - - 0x011C85 04:9C75: 60

SpawnAnnounceObj:
	;00: Announcement index
	;04: Obj slot
	LDA #.BANK(DATA_0AA000)					;C - - - - - 0x011C86 04:9C76: A9 0A
	STA sprPrgBank				;C - - - - - 0x011C88 04:9C78: 8D 61 05
	LDX #$00					;C - - - - - 0x011C8B 04:9C7B: A2 00
@setcolor:
	LDA AnnounceColors,X			;C - - - - - 0x011C8D 04:9C7D: BD DA 9C
	STA colorBuffer+COL_SPR+13,X				;C - - - - - 0x011C90 04:9C80: 9D 1D 03
	INX							;C - - - - - 0x011C93 04:9C83: E8
	CPX #$03					;C - - - - - 0x011C94 04:9C84: E0 03
	BCC @setcolor				;C - - - - - 0x011C96 04:9C86: 90 F5

	LDX scratch4				;C - - - - - 0x011C98 04:9C88: A6 04
	LDA scratch0				;C - - - - - 0x011C9A 04:9C8A: A5 00
	ASL							;C - - - - - 0x011C9C 04:9C8C: 0A
	ASL							;C - - - - - 0x011C9D 04:9C8D: 0A
	CLC							;C - - - - - 0x011C9E 04:9C8E: 18
	ADC #.LOBYTE(AnnounceTable)					;C - - - - - 0x011C9F 04:9C8F: 69 CA
	STA scratch6				;C - - - - - 0x011CA1 04:9C91: 85 06
	LDA #.HIBYTE(AnnounceTable)					;C - - - - - 0x011CA3 04:9C93: A9 9C
	ADC #$00					;C - - - - - 0x011CA5 04:9C95: 69 00
	STA scratch7				;C - - - - - 0x011CA7 04:9C97: 85 07
	LDY #$00					;C - - - - - 0x011CA9 04:9C99: A0 00
	LDA #$17					;C - - - - - 0x011CAB 04:9C9B: A9 17
	STA objState,X				;C - - - - - 0x011CAD 04:9C9D: 9D 63 05
	LDA #120					;C - - - - - 0x011CB0 04:9CA0: A9 78
	STA objX,X				;C - - - - - 0x011CB2 04:9CA2: 9D B3 05
	LDA #120					;C - - - - - 0x011CB5 04:9CA5: A9 78
	STA objY,X				;C - - - - - 0x011CB7 04:9CA7: 9D 8B 05
	LDA (scratch6),Y			;C - - - - - 0x011CBA 04:9CAA: B1 06
	STA objAnim,X				;C - - - - - 0x011CBC 04:9CAC: 9D 7B 06
	INY							;C - - - - - 0x011CBF 04:9CAF: C8
	LDA (scratch6),Y			;C - - - - - 0x011CC0 04:9CB0: B1 06
	STA objAnimHI,X				;C - - - - - 0x011CC2 04:9CB2: 9D 1B 07
	INY							;C - - - - - 0x011CC5 04:9CB5: C8
	LDA (scratch6),Y			;C - - - - - 0x011CC6 04:9CB6: B1 06
	STA objChrSlot,X				;C - - - - - 0x011CC8 04:9CB8: 9D 2B 06
	INY							;C - - - - - 0x011CCB 04:9CBB: C8
	LDA (scratch6),Y			;C - - - - - 0x011CCC 04:9CBC: B1 06
	STA objAttr,X				;C - - - - - 0x011CCE 04:9CBE: 9D F3 06
	LDA #$00					;C - - - - - 0x011CD1 04:9CC1: A9 00
	STA objAnimProgress,X				;C - - - - - 0x011CD3 04:9CC3: 9D CB 06
	STA objAnimTimer,X				;C - - - - - 0x011CD6 04:9CC6: 9D A3 06
	RTS							;C - - - - - 0x011CD9 04:9CC9: 60

AnnounceTable:
	;- D 0 - - - 0x011CDA 04:9CCA: 42
	;Anim, ChrSlot, Attr

	;ROUND
	.word anAnnounceRound_ID
	.byte $02,$03

	;CLEAR
	.word anAnnounceClear_ID
	.byte $02,$03					;- D 0 - - - 0x011CE1 04:9CD1: 03

	;PAUSE
	.word anAnnouncePause_ID
	.byte $02,$03					;- D 0 - - - 0x011CE5 04:9CD5: 03

	;PLAYER
	.word anAnnouncePlayer_ID
	.byte $02,$03					;- D 0 - - - 0x011CE9 04:9CD9: 03

AnnounceColors:
	.byte $0F					;- D 0 - - - 0x011CEA 04:9CDA: 0F
	.byte $30					;- D 0 - - - 0x011CEB 04:9CDB: 30
	.byte $38					;- D 0 - - - 0x011CEC 04:9CDC: 38

CODE_089CDD:
	LDA #.BANK(CODE_058729)					;C - - - - - 0x011CED 04:9CDD: A9 05
	STA nmiPrgBankA				;C - - - - - 0x011CEF 04:9CDF: 85 51
	LDA #.LOBYTE(CODE_058729)	;C - - - - - 0x011CF1 04:9CE1: A9 29
	STA nmiBankedSub			;C - - - - - 0x011CF3 04:9CE3: 85 16
	LDA #.HIBYTE(CODE_058729)	;C - - - - - 0x011CF5 04:9CE5: A9 87
	STA nmiBankedSub+1			;C - - - - - 0x011CF7 04:9CE7: 85 17
	RTS							;C - - - - - 0x011CF9 04:9CE9: 60

CODE_089CEA:
	LDA roundNumberDuration				;C - - - - - 0x011CFA 04:9CEA: AD 73 04
	BNE CODE_089D0E				;C - - - - - 0x011CFD 04:9CED: D0 1F
		LDA enemyType				;C - - - - - 0x011CFF 04:9CEF: A5 98
		CMP #$23					;C - - - - - 0x011D01 04:9CF1: C9 23
		BEQ CODE_089D18				;C - - - - - 0x011D03 04:9CF3: F0 23
			LDA #$01					;C - - - - - 0x011D05 04:9CF5: A9 01
			STA scratch0				;C - - - - - 0x011D07 04:9CF7: 85 00
			LDA #$01					;C - - - - - 0x011D09 04:9CF9: A9 01
			STA scratch4				;C - - - - - 0x011D0B 04:9CFB: 85 04
			LDA #$02					;C - - - - - 0x011D0D 04:9CFD: A9 02
			STA ram_0475				;C - - - - - 0x011D0F 04:9CFF: 8D 75 04
			JSR SpawnAnnounceObj				;C - - - - - 0x011D12 04:9D02: 20 76 9C
			JSR AnimateNonBubbles				;C - - - - - 0x011D15 04:9D05: 20 5C EE
			JSR DrawObjects				;C - - - - - 0x011D18 04:9D08: 20 E2 EE
			JMP CODE_089D18				;C - - - - - 0x011D1B 04:9D0B: 4C 18 9D
CODE_089D0E:
	LDA roundNumberDuration				;C - - - - - 0x011D1E 04:9D0E: AD 73 04
	CMP #$28					;C - - - - - 0x011D21 04:9D11: C9 28
	BCC CODE_089D18				;C - - - - - 0x011D23 04:9D13: 90 03
		JSR CODE_089D1C				;C - - - - - 0x011D25 04:9D15: 20 1C 9D
CODE_089D18:
	INC roundNumberDuration				;C - - - - - 0x011D28 04:9D18: EE 73 04
	RTS							;C - - - - - 0x011D2B 04:9D1B: 60

CODE_089D1C:
	LDA bonusGameProgress				;C - - - - - 0x011D2C 04:9D1C: A5 D6
	CMP #$01					;C - - - - - 0x011D2E 04:9D1E: C9 01
	BEQ CODE_089D4C				;C - - - - - 0x011D30 04:9D20: F0 2A
	CMP #$04					;C - - - - - 0x011D32 04:9D22: C9 04
	BEQ CODE_089D4C				;C - - - - - 0x011D34 04:9D24: F0 26
		LDX #$00					;C - - - - - 0x011D36 04:9D26: A2 00
CODE_089D28:
	LDA currentRound				;C - - - - - 0x011D38 04:9D28: A5 D8
	CMP DATA_089D55,X			;C - - - - - 0x011D3A 04:9D2A: DD 55 9D
	BEQ CODE_089D37				;C - - - - - 0x011D3D 04:9D2D: F0 08
		INX							;C - - - - - 0x011D3F 04:9D2F: E8
		CPX #$08					;C - - - - - 0x011D40 04:9D30: E0 08
		BCC CODE_089D28				;C - - - - - 0x011D42 04:9D32: 90 F4
		JMP CODE_089D4C				;C - - - - - 0x011D44 04:9D34: 4C 4C 9D
CODE_089D37:
	LDA roundsToSkip				;C - - - - - 0x011D47 04:9D37: AD 7F 07
	CMP #1					;C - - - - - 0x011D4A 04:9D3A: C9 01
	BEQ CODE_089D4C				;C - - - - - 0x011D4C 04:9D3C: F0 0E
		JSR CODE_089D6A				;C - - - - - 0x011D4E 04:9D3E: 20 6A 9D

		LDA #.LOBYTE(CODE_089D5D)	;C - - - - - 0x011D51 04:9D41: A9 5D
		STA updateSub				;C - - - - - 0x011D53 04:9D43: 85 19
		LDA #.HIBYTE(CODE_089D5D)	;C - - - - - 0x011D55 04:9D45: A9 9D
		STA updateSub+1				;C - - - - - 0x011D57 04:9D47: 85 1A
		JMP CODE_089D54				;C - - - - - 0x011D59 04:9D49: 4C 54 9D
CODE_089D4C:
	LDA #.LOBYTE(CODE_089D5D)	;C - - - - - 0x011D5C 04:9D4C: A9 5D
	STA nmiBankedSub			;C - - - - - 0x011D5E 04:9D4E: 85 16
	LDA #.HIBYTE(CODE_089D5D)	;C - - - - - 0x011D60 04:9D50: A9 9D
	STA nmiBankedSub+1			;C - - - - - 0x011D62 04:9D52: 85 17
CODE_089D54:
	RTS							;C - - - - - 0x011D64 04:9D54: 60

DATA_089D55:
	.byte 30					;- D 0 - - - 0x011D65 04:9D55: 1E
	.byte 32					;- D 0 - - - 0x011D66 04:9D56: 20
	.byte 33					;- D 0 - - - 0x011D67 04:9D57: 21
	.byte 34					;- D 0 - - - 0x011D68 04:9D58: 22
	.byte 36					;- D 0 - - - 0x011D69 04:9D59: 24
	.byte 37					;- D 0 - - - 0x011D6A 04:9D5A: 25
	.byte 38					;- D 0 - - - 0x011D6B 04:9D5B: 26
	.byte 50					;- D 0 - - - 0x011D6C 04:9D5C: 32

CODE_089D5D:
	LDA #$00					;C - - - - - 0x011D6D 04:9D5D: A9 00
	STA enteringRound				;C - - - - - 0x011D6F 04:9D5F: 85 37
	INC currentRound				;C - - - - - 0x011D71 04:9D61: E6 D8
	INC ram_0542				;C - - - - - 0x011D73 04:9D63: EE 42 05
	JSR CODE_089DBC				;C - - - - - 0x011D76 04:9D66: 20 BC 9D
	RTS							;C - - - - - 0x011D79 04:9D69: 60

CODE_089D6A:
.ifdef REGION_JP
	LDA #.BANK(RoundMaps)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x011D7A 04:9D6A: A9 00
	ORA #$07					;C - - - - - 0x011D7C 04:9D6C: 09 07
	STA $8000				;C - - - - - 0x011D7E 04:9D6E: 8D 00 80
	LDA #.BANK(RoundMaps)					;C - - - - - 0x011D81 04:9D71: A9 04
	STA $8001				;C - - - - - 0x011D83 04:9D73: 8D 01 80
	STA prgBankB				;C - - - - - 0x011D86 04:9D76: 85 53

	LDA #$00					;C - - - - - 0x011D88 04:9D78: A9 00
	ORA #$07					;C - - - - - 0x011D8A 04:9D7A: 09 07
	STA $8000				;C - - - - - 0x011D8C 04:9D7C: 8D 00 80
	LDA #.BANK(RoundMaps)					;C - - - - - 0x011D8F 04:9D7F: A9 04
	STA $8001				;C - - - - - 0x011D91 04:9D81: 8D 01 80
	STA prgBankB				;C - - - - - 0x011D94 04:9D84: 85 53
.endif

	LDX currentRound				;C - - - - - 0x011D96 04:9D86: A6 D8
	LDA RoundMaps,X			;C - - - - - 0x011D98 04:9D88: BD AE BA
	STA mapID				;C - - - - - 0x011D9B 04:9D8B: 8D 60 03
	TXA							;C - - - - - 0x011D9E 04:9D8E: 8A
	TAY							;C - - - - - 0x011D9F 04:9D8F: A8
	LDA vNametable				;C - - - - - 0x011DA0 04:9D90: A5 2D
	EOR #$01					;C - - - - - 0x011DA2 04:9D92: 49 01
	TAX							;C - - - - - 0x011DA4 04:9D94: AA
	LDA DATA_089DB6,X			;C - - - - - 0x011DA5 04:9D95: BD B6 9D
	STA mapBaseTile				;C - - - - - 0x011DA8 04:9D98: 8D 63 03
	LDA #$00					;C - - - - - 0x011DAB 04:9D9B: A9 00
	STA mapTargetAdr				;C - - - - - 0x011DAD 04:9D9D: 85 49
	LDA DATA_089DB9,X			;C - - - - - 0x011DAF 04:9D9F: BD B9 9D
	STA mapTargetAdr+1				;C - - - - - 0x011DB2 04:9DA2: 85 4A
	LDA #$00					;C - - - - - 0x011DB4 04:9DA4: A9 00
	STA wideRound				;C - - - - - 0x011DB6 04:9DA6: 8D B0 03

.ifdef REGION_JP
	LDA #$40
	STA $E000
.else
	LDA #$01					;C - - - - - 0x011DB9 04:9DA9: A9 01
	STA $A000				;C - - - - - 0x011DBB 04:9DAB: 8D 00 A0
.endif
	JSR LoadMap				;C - - - - - 0x011DBE 04:9DAE: 20 23 E5
	LDA #$01					;C - - - - - 0x011DC1 04:9DB1: A9 01
	STA enteringRound				;C - - - - - 0x011DC3 04:9DB3: 85 37

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x011DC5 04:9DB5: 60

DATA_089DB6:
	.byte $00					;- D 0 - - - 0x011DC6 04:9DB6: 00
	.byte $80					;- D 0 - - - 0x011DC7 04:9DB7: 80
	.byte $00					;- - - - - - 0x011DC8 04:9DB8: 00
DATA_089DB9:
	.byte $28					;- D 0 - - - 0x011DC9 04:9DB9: 28
	.byte $20					;- D 0 - - - 0x011DCA 04:9DBA: 20
	.byte $28					;- - - - - - 0x011DCB 04:9DBB: 28

CODE_089DBC:
	LDY #$00					;C - - - - - 0x011DCC 04:9DBC: A0 00
CODE_089DBE:
	LDA DATA_089DFE,Y			;C - - - - - 0x011DCE 04:9DBE: B9 FE 9D
	CMP currentRound				;C - - - - - 0x011DD1 04:9DC1: C5 D8
	BEQ CODE_089DCA				;C - - - - - 0x011DD3 04:9DC3: F0 05
		INY							;C - - - - - 0x011DD5 04:9DC5: C8
		CPY #$09					;C - - - - - 0x011DD6 04:9DC6: C0 09
		BCC CODE_089DBE				;C - - - - - 0x011DD8 04:9DC8: 90 F4
CODE_089DCA:
	LDA DATA_089E07,Y			;C - - - - - 0x011DDA 04:9DCA: B9 07 9E
	STA scratch0				;C - - - - - 0x011DDD 04:9DCD: 85 00
	LDY roundsToSkip				;C - - - - - 0x011DDF 04:9DCF: AC 7F 07
	BEQ CODE_089DDE				;C - - - - - 0x011DE2 04:9DD2: F0 0A
		LDA DATA_089E11,Y			;C - - - - - 0x011DE4 04:9DD4: B9 11 9E
		STA scratch0				;C - - - - - 0x011DE7 04:9DD7: 85 00
		LDA #$00					;C - - - - - 0x011DE9 04:9DD9: A9 00
		STA roundsToSkip				;C - - - - - 0x011DEB 04:9DDB: 8D 7F 07
CODE_089DDE:
	JSR CODE_089E1A				;C - - - - - 0x011DEE 04:9DDE: 20 1A 9E
	LDY #$00					;C - - - - - 0x011DF1 04:9DE1: A0 00
CODE_089DE3:
	INY							;C - - - - - 0x011DF3 04:9DE3: C8
	LDA DATA_089E14,Y			;C - - - - - 0x011DF4 04:9DE4: B9 14 9E
	CMP currentRound				;C - - - - - 0x011DF7 04:9DE7: C5 D8
	BCC CODE_089DE3				;C - - - - - 0x011DF9 04:9DE9: 90 F8

	TYA							;C - - - - - 0x011DFB 04:9DEB: 98
	STA bonusGameProgress				;C - - - - - 0x011DFC 04:9DEC: 85 D6
	LDA #$0F					;C - - - - - 0x011DFE 04:9DEE: A9 0F
	STA colorBuffer+COL_SPR+13				;C - - - - - 0x011E00 04:9DF0: 8D 1D 03
	LDA #$30					;C - - - - - 0x011E03 04:9DF3: A9 30
	STA colorBuffer+COL_SPR+14				;C - - - - - 0x011E05 04:9DF5: 8D 1E 03
	LDA #$38					;C - - - - - 0x011E08 04:9DF8: A9 38
	STA colorBuffer+COL_SPR+15				;C - - - - - 0x011E0A 04:9DFA: 8D 1F 03
	RTS							;C - - - - - 0x011E0D 04:9DFD: 60

DATA_089DFE:
	.byte 20					;- D 0 - - - 0x011E0E 04:9DFE: 14
	.byte 21					;- D 0 - - - 0x011E0F 04:9DFF: 15
	.byte 40					;- D 0 - - - 0x011E10 04:9E00: 28
	.byte 41					;- D 0 - - - 0x011E11 04:9E01: 29
	.byte 60					;- D 0 - - - 0x011E12 04:9E02: 3C
	.byte 61					;- D 0 - - - 0x011E13 04:9E03: 3D
	.byte 71					;- D 0 - - - 0x011E14 04:9E04: 47
	.byte 79					;- D 0 - - - 0x011E15 04:9E05: 4F
	.byte 81					;- D 0 - - - 0x011E16 04:9E06: 51

DATA_089E07:
	.byte $06					;- D 0 - - - 0x011E17 04:9E07: 06
	.byte $03					;- D 0 - - - 0x011E18 04:9E08: 03
	.byte $06					;- D 0 - - - 0x011E19 04:9E09: 06
	.byte $03					;- D 0 - - - 0x011E1A 04:9E0A: 03
	.byte $06					;- D 0 - - - 0x011E1B 04:9E0B: 06
	.byte $03					;- D 0 - - - 0x011E1C 04:9E0C: 03
	.byte $09					;- D 0 - - - 0x011E1D 04:9E0D: 09
	.byte $06					;- D 0 - - - 0x011E1E 04:9E0E: 06
	.byte $0C					;- D 0 - - - 0x011E1F 04:9E0F: 0C
	.byte $00					;- D 0 - - - 0x011E20 04:9E10: 00

DATA_089E11:
	.byte $00					;- - - - - - 0x011E21 04:9E11: 00
	.byte $18					;- D 0 - - - 0x011E22 04:9E12: 18
	.byte $00					;- D 0 - - - 0x011E23 04:9E13: 00

DATA_089E14:
	.byte $00					;- - - - - - 0x011E24 04:9E14: 00
	.byte $14					;- D 0 - - - 0x011E25 04:9E15: 14
	.byte $28					;- D 0 - - - 0x011E26 04:9E16: 28
	.byte $3C					;- D 0 - - - 0x011E27 04:9E17: 3C
	.byte $50					;- D 0 - - - 0x011E28 04:9E18: 50
	.byte $51					;- D 0 - - - 0x011E29 04:9E19: 51

CODE_089E1A:
	JSR CODE_0FEC8C				;C - - - - - 0x011E2A 04:9E1A: 20 8C EC
	LDA #.BANK(CODE_059EAF)					;C - - - - - 0x011E2D 04:9E1D: A9 05
	STA nmiPrgBankA				;C - - - - - 0x011E2F 04:9E1F: 85 51
	LDA #.LOBYTE(CODE_059EAF)	;C - - - - - 0x011E31 04:9E21: A9 AF
	STA nmiBankedSub			;C - - - - - 0x011E33 04:9E23: 85 16
	LDA #.HIBYTE(CODE_059EAF)	;C - - - - - 0x011E35 04:9E25: A9 9E
	STA nmiBankedSub+1			;C - - - - - 0x011E37 04:9E27: 85 17
	JSR CODE_0FFE9A				;C - - - - - 0x011E39 04:9E29: 20 9A FE
	RTS							;C - - - - - 0x011E3C 04:9E2C: 60

StartBonusRound:
	LDA #$00					;C - - - - - 0x011E3D 04:9E2D: A9 00
	STA ram_0475				;C - - - - - 0x011E3F 04:9E2F: 8D 75 04
	JSR CODE_0FE36B				;C - - - - - 0x011E42 04:9E32: 20 6B E3
	JSR DespawnNonPlayerObjects				;C - - - - - 0x011E45 04:9E35: 20 E1 9E
	LDA #.BANK(DATA_0AA000)					;C - - - - - 0x011E48 04:9E38: A9 0A
	STA sprPrgBank				;C - - - - - 0x011E4A 04:9E3A: 8D 61 05

	LDA #chrThunder_ID					;C - - - - - 0x011E4D 04:9E3D: A9 50
	STA chrBankF				;C - - - - - 0x011E4F 04:9E3F: 85 50
	LDA #$00					;C - - - - - 0x011E51 04:9E41: A9 00
	STA bubbleSpawnSlot				;C - - - - - 0x011E53 04:9E43: 8D 43 07
	LDA #$01					;C - - - - - 0x011E56 04:9E46: A9 01
	STA bubbleSpawnState				;C - - - - - 0x011E58 04:9E48: 8D 44 07
	LDA objY				;C - - - - - 0x011E5B 04:9E4B: AD 8B 05
	STA bubbleSpawnY				;C - - - - - 0x011E5E 04:9E4E: 8D 45 07
	LDA objX				;C - - - - - 0x011E61 04:9E51: AD B3 05
	STA bubbleSpawnX				;C - - - - - 0x011E64 04:9E54: 8D 46 07
	LDA #$00					;C - - - - - 0x011E67 04:9E57: A9 00
	STA bubbleSpawnChrSlot				;C - - - - - 0x011E69 04:9E59: 8D 49 07
	LDA #.LOBYTE(anFlames4_ID)					;C - - - - - 0x011E6C 04:9E5C: A9 25
	STA bubbleSpawnAnim				;C - - - - - 0x011E6E 04:9E5E: 8D 4A 07
	JSR SpawnBubble				;C - - - - - 0x011E71 04:9E61: 20 2B EE
	LDA #$01					;C - - - - - 0x011E74 04:9E64: A9 01
	STA enteringRound				;C - - - - - 0x011E76 04:9E66: 85 37

	LDA #.LOBYTE(CODE_078F90)	;C - - - - - 0x011E78 04:9E68: A9 90
	STA updateSub				;C - - - - - 0x011E7A 04:9E6A: 85 19
	LDA #.HIBYTE(CODE_078F90)	;C - - - - - 0x011E7C 04:9E6C: A9 8F
	STA updateSub+1				;C - - - - - 0x011E7E 04:9E6E: 85 1A

	JSR CODE_089E8F				;C - - - - - 0x011E80 04:9E70: 20 8F 9E

.ifdef REGION_JP
	LDA #$40
	STA $E000
.else
	LDA #$01					;C - - - - - 0x011E83 04:9E73: A9 01
	STA $A000				;C - - - - - 0x011E85 04:9E75: 8D 00 A0
.endif

	LDA #$00					;C - - - - - 0x011E88 04:9E78: A9 00
	STA wideRound				;C - - - - - 0x011E8A 04:9E7A: 8D B0 03
	LDA #.BANK(CODE_078F90)					;C - - - - - 0x011E8D 04:9E7D: A9 07
	STA nmiPrgBankA				;C - - - - - 0x011E8F 04:9E7F: 85 51
	LDA #.LOBYTE(NoRoundAnimation)					;C - - - - - 0x011E91 04:9E81: A9 4F
	STA roundAnimSub				;C - - - - - 0x011E93 04:9E83: 85 59
	LDA #.HIBYTE(NoRoundAnimation)					;C - - - - - 0x011E95 04:9E85: A9 99
	STA roundAnimSub+1				;C - - - - - 0x011E97 04:9E87: 85 5A

	LDA #trBonusGame_ID					;C - - - - - 0x011E99 04:9E89: A9 08
	STA a:musicTrigger			;C - - - - - 0x011E9B 04:9E8B: 8D E0 00
	RTS							;C - - - - - 0x011E9E 04:9E8E: 60

CODE_089E8F:
	LDA #.BANK(BonusGameMaps)					;C - - - - - 0x011E9F 04:9E8F: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x011EA1 04:9E91: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x011EA3 04:9E93: 20 56 FF
.endif

	LDY bonusGameProgress				;C - - - - - 0x011EA6 04:9E96: A4 D6
	LDA BonusGameMaps,Y			;C - - - - - 0x011EA8 04:9E98: B9 A4 BD
	STA mapID				;C - - - - - 0x011EAB 04:9E9B: 8D 60 03
	LDX vNametable				;C - - - - - 0x011EAE 04:9E9E: A6 2D
	LDA #chrBonusRoom_A_ID					;C - - - - - 0x011EB0 04:9EA0: A9 3A
	STA chrBankA,X				;C - - - - - 0x011EB2 04:9EA2: 95 4B

	LDA DATA_06BDA9,X			;C - - - - - 0x011EB4 04:9EA4: BD A9 BD
	STA mapBaseTile				;C - - - - - 0x011EB7 04:9EA7: 8D 63 03

	LDA #$00					;C - - - - - 0x011EBA 04:9EAA: A9 00
	STA mapTargetAdr				;C - - - - - 0x011EBC 04:9EAC: 85 49
	LDA DATA_06BDAC,X			;C - - - - - 0x011EBE 04:9EAE: BD AC BD
	STA mapTargetAdr+1				;C - - - - - 0x011EC1 04:9EB1: 85 4A

	JSR LoadMap				;C - - - - - 0x011EC3 04:9EB3: 20 23 E5

	LDA nmiPrgBankB				;C - - - - - 0x011EC6 04:9EB6: A5 52
	STA terrainBank				;C - - - - - 0x011EC8 04:9EB8: 8D 5B 07
	LDA mapMacroDefs				;C - - - - - 0x011ECB 04:9EBB: A5 3E
	STA terrainTypeDefs				;C - - - - - 0x011ECD 04:9EBD: 85 40
	LDA mapMacroDefs+1				;C - - - - - 0x011ECF 04:9EBF: A5 3F
	STA terrainTypeDefs+1				;C - - - - - 0x011ED1 04:9EC1: 85 41
	LDA mapMacroList				;C - - - - - 0x011ED3 04:9EC3: A5 3C
	STA terrainAdr				;C - - - - - 0x011ED5 04:9EC5: 85 42
	LDA mapMacroList+1				;C - - - - - 0x011ED7 04:9EC7: A5 3D
	STA terrainAdr+1				;C - - - - - 0x011ED9 04:9EC9: 85 43
	LDA currentRound				;C - - - - - 0x011EDB 04:9ECB: A5 D8
	STA objImgOfs+OSLOT_BUBBLE				;C - - - - - 0x011EDD 04:9ECD: 8D EF 05
	LDY bonusGameProgress				;C - - - - - 0x011EE0 04:9ED0: A4 D6
	LDA BonusGameRounds,Y			;C - - - - - 0x011EE2 04:9ED2: B9 DB 9E
	STA currentRound				;C - - - - - 0x011EE5 04:9ED5: 85 D8
	JSR CODE_08816F				;C - - - - - 0x011EE7 04:9ED7: 20 6F 81
	RTS							;C - - - - - 0x011EEA 04:9EDA: 60

BonusGameRounds:
	.byte BONUS_ROUND_VOLLEYBALL			;- - - - - - 0x011EEB 04:9EDB: 51
	.byte BONUS_ROUND_VOLLEYBALL			;- D 0 - - - 0x011EEC 04:9EDC: 51
	.byte BONUS_ROUND_VOLLEYBALL			;- D 0 - - - 0x011EED 04:9EDD: 51
	.byte BONUS_ROUND_GEMS					;- D 0 - - - 0x011EEE 04:9EDE: 52
	.byte BONUS_ROUND_BASKETBALL			;- D 0 - - - 0x011EEF 04:9EDF: 53
	.byte BONUS_ROUND_BASKETBALL			;- - - - - - 0x011EF0 04:9EE0: 53

DespawnNonPlayerObjects:
	LDX #$00					;C - - - - - 0x011EF1 04:9EE1: A2 00
	TXA							;C - - - - - 0x011EF3 04:9EE3: 8A
CODE_089EE4:
	STA objState+1,X				;C - - - - - 0x011EF4 04:9EE4: 9D 64 05
	INX							;C - - - - - 0x011EF7 04:9EE7: E8
	CPX #39					;C - - - - - 0x011EF8 04:9EE8: E0 27
	BNE CODE_089EE4				;C - - - - - 0x011EFA 04:9EEA: D0 F8

	JSR DrawObjects				;C - - - - - 0x011EFC 04:9EEC: 20 E2 EE
	RTS							;C - - - - - 0x011EFF 04:9EEF: 60

CODE_089EF0:
	LDA objImgOfs+OSLOT_BUBBLE				;C - - - - - 0x011F00 04:9EF0: AD EF 05
	STA currentRound				;C - - - - - 0x011F03 04:9EF3: 85 D8

	LDA #$01					;C - - - - - 0x011F05 04:9EF5: A9 01
	STA objState+OSLOT_ICON				;C - - - - - 0x011F07 04:9EF7: 8D 76 05
	LDA #chrThunder_ID					;C - - - - - 0x011F0A 04:9EFA: A9 50
	STA chrBankF				;C - - - - - 0x011F0C 04:9EFC: 85 50
	LDA #$03					;C - - - - - 0x011F0E 04:9EFE: A9 03
	STA objChrSlot+OSLOT_ICON				;C - - - - - 0x011F10 04:9F00: 8D 3E 06

	LDA #.LOBYTE(CODE_099BE7)	;C - - - - - 0x011F13 04:9F03: A9 E7
	STA bankedSub				;C - - - - - 0x011F15 04:9F05: 85 55
	LDA #.HIBYTE(CODE_099BE7)	;C - - - - - 0x011F17 04:9F07: A9 9B
	STA bankedSub+1				;C - - - - - 0x011F19 04:9F09: 85 56
	LDA #.BANK(CODE_099BE7)					;C - - - - - 0x011F1B 04:9F0B: A9 09
	STA bankedSubBank				;C - - - - - 0x011F1D 04:9F0D: 85 57
	LDA #.BANK(*)					;C - - - - - 0x011F1F 04:9F0F: A9 08
	STA bankedSubRetBank				;C - - - - - 0x011F21 04:9F11: 85 58
	JSR RunBankedSub				;C - - - - - 0x011F23 04:9F13: 20 72 E7

	LDA #$00					;C - - - - - 0x011F26 04:9F16: A9 00
	STA objState+OSLOT_ICON				;C - - - - - 0x011F28 04:9F18: 8D 76 05
	INC objX+OSLOT_BUBBLE+2				;C - - - - - 0x011F2B 04:9F1B: EE C9 05
	LDA objX+OSLOT_BUBBLE+2				;C - - - - - 0x011F2E 04:9F1E: AD C9 05
	CMP #$78					;C - - - - - 0x011F31 04:9F21: C9 78
	BCC CODE_089F40				;C - - - - - 0x011F33 04:9F23: 90 1B
		LDA #$00					;C - - - - - 0x011F35 04:9F25: A9 00
		STA objX+OSLOT_BUBBLE+2				;C - - - - - 0x011F37 04:9F27: 8D C9 05
		LDA #.BANK(CODE_0790A5)					;C - - - - - 0x011F3A 04:9F2A: A9 07
		STA nmiPrgBankA				;C - - - - - 0x011F3C 04:9F2C: 85 51

		LDA #.LOBYTE(CODE_0790A5)	;C - - - - - 0x011F3E 04:9F2E: A9 A5
		STA nmiBankedSub			;C - - - - - 0x011F40 04:9F30: 85 16
		LDA #.HIBYTE(CODE_0790A5)	;C - - - - - 0x011F42 04:9F32: A9 90
		STA nmiBankedSub+1			;C - - - - - 0x011F44 04:9F34: 85 17
		LDY #$00					;C - - - - - 0x011F46 04:9F36: A0 00
		JSR DespawnProj_Direct				;C - - - - - 0x011F48 04:9F38: 20 73 FE
		LDY #$01					;C - - - - - 0x011F4B 04:9F3B: A0 01
		JSR DespawnProj_Direct				;C - - - - - 0x011F4D 04:9F3D: 20 73 FE
CODE_089F40:
	JSR AnimateNonBubbles				;C - - - - - 0x011F50 04:9F40: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x011F53 04:9F43: 20 E2 EE
	RTS							;C - - - - - 0x011F56 04:9F46: 60

CODE_089F47:
.ifndef REGION_JP
	LDA #$00					;C - - - - - 0x011F57 04:9F47: A9 00
	STA shooting				;C - - - - - 0x011F59 04:9F49: 8D 17 05
.endif

	LDA #.LOBYTE(RoundUpdate)	;C - - - - - 0x011F5C 04:9F4C: A9 10
	STA nmiBankedSub			;C - - - - - 0x011F5E 04:9F4E: 85 16
	LDA #.HIBYTE(RoundUpdate)	;C - - - - - 0x011F60 04:9F50: A9 97
	STA nmiBankedSub+1			;C - - - - - 0x011F62 04:9F52: 85 17
	LDA #.BANK(RoundUpdate)					;C - - - - - 0x011F64 04:9F54: A9 09
	STA nmiPrgBankA				;C - - - - - 0x011F66 04:9F56: 85 51

	LDA #.LOBYTE(CODE_089F61)	;C - - - - - 0x011F68 04:9F58: A9 61
	STA nmiUnbankedSub				;C - - - - - 0x011F6A 04:9F5A: 85 35
	LDA #.HIBYTE(CODE_089F61)	;C - - - - - 0x011F6C 04:9F5C: A9 9F
	STA nmiUnbankedSub+1				;C - - - - - 0x011F6E 04:9F5E: 85 36
	RTS							;C - - - - - 0x011F70 04:9F60: 60

CODE_089F61:
	LDA #.BANK(DATA_06BDEF)					;C - - - - - 0x011F71 04:9F61: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x011F73 04:9F63: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x011F75 04:9F65: 20 56 FF
.endif

	LDX vNametable				;C - - - - - 0x011F78 04:9F68: A6 2D
	LDA DATA_089FAE,X			;C - - - - - 0x011F7A 04:9F6A: BD AE 9F
	STA scratch1				;C - - - - - 0x011F7D 04:9F6D: 85 01
	LDA DATA_089FAC,X			;C - - - - - 0x011F7F 04:9F6F: BD AC 9F
	STA projScriptOfs				;C - - - - - 0x011F82 04:9F72: 85 5D
	LDA PPUSTATUS					;C - - - - - 0x011F84 04:9F74: AD 02 20
	LDX #$00					;C - - - - - 0x011F87 04:9F77: A2 00
CODE_089F79:
	LDA scratch1				;C - - - - - 0x011F89 04:9F79: A5 01
	STA PPUADDR				;C - - - - - 0x011F8B 04:9F7B: 8D 06 20
	LDA DATA_06BDEF,X			;C - - - - - 0x011F8E 04:9F7E: BD EF BD
	STA PPUADDR				;C - - - - - 0x011F91 04:9F81: 8D 06 20
	LDA projScriptOfs				;C - - - - - 0x011F94 04:9F84: A5 5D
	STA PPUDATA				;C - - - - - 0x011F96 04:9F86: 8D 07 20
	LDA scratch1				;C - - - - - 0x011F99 04:9F89: A5 01
	STA PPUADDR				;C - - - - - 0x011F9B 04:9F8B: 8D 06 20
	LDA DATA_06BDEF,X			;C - - - - - 0x011F9E 04:9F8E: BD EF BD
	CLC							;C - - - - - 0x011FA1 04:9F91: 18
	ADC #$20					;C - - - - - 0x011FA2 04:9F92: 69 20
	STA PPUADDR				;C - - - - - 0x011FA4 04:9F94: 8D 06 20
	LDA projScriptOfs				;C - - - - - 0x011FA7 04:9F97: A5 5D
	STA PPUDATA				;C - - - - - 0x011FA9 04:9F99: 8D 07 20
	INX							;C - - - - - 0x011FAC 04:9F9C: E8
	CPX #$07					;C - - - - - 0x011FAD 04:9F9D: E0 07
	BCC CODE_089F79				;C - - - - - 0x011FAF 04:9F9F: 90 D8

	LDA #.LOBYTE(ColorBufferToVRAM)	;C - - - - - 0x011FB1 04:9FA1: A9 8A
	STA nmiUnbankedSub				;C - - - - - 0x011FB3 04:9FA3: 85 35
	LDA #.HIBYTE(ColorBufferToVRAM)	;C - - - - - 0x011FB5 04:9FA5: A9 E3
	STA nmiUnbankedSub+1				;C - - - - - 0x011FB7 04:9FA7: 85 36
	JMP NMISubRet				;C - - - - - 0x011FB9 04:9FA9: 4C 9D E1

DATA_089FAC:
	.byte $FF					;- D 0 - - - 0x011FBC 04:9FAC: FF
	.byte $7F					;- D 0 - - - 0x011FBD 04:9FAD: 7F
DATA_089FAE:
	.byte $23					;- D 0 - - - 0x011FBE 04:9FAE: 23
	.byte $2B					;- D 0 - - - 0x011FBF 04:9FAF: 2B

;Filler data
.ifdef REGION_JP
	;- - - - - - 0x011FCB 04:9FBB: 00
	.incbin "filler/fill08_JP.bin"
.else
	;- - - - - - 0x011FC0 04:9FB0: 83
	.incbin "filler/fill08.bin"
.endif