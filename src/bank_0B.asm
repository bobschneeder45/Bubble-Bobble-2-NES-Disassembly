.segment "PRG_BANK_B"
; 0x016010-0x01800F

;Contents: Enemy behavior

CODE_0B8000:
	LDX #$00					;C - - - - - 0x016010 05:8000: A2 00
	TXA							;C - - - - - 0x016012 05:8002: 8A
	STA ram_04C8				;C - - - - - 0x016013 05:8003: 8D C8 04
	STA ram_04C8				;C - - - - - 0x016016 05:8006: 8D C8 04
	STA ram_04AD				;C - - - - - 0x016019 05:8009: 8D AD 04
	STA ram_04AE				;C - - - - - 0x01601C 05:800C: 8D AE 04
	STA ram_04AC				;C - - - - - 0x01601F 05:800F: 8D AC 04
CODE_0B8012:
	STA enemyType,X				;C - - - - - 0x016022 05:8012: 95 98
	STA ram_00AC,X				;C - - - - - 0x016024 05:8014: 95 AC
	STA enemyReward,X				;C - - - - - 0x016026 05:8016: 95 8E
	STA ram_00B6,X				;C - - - - - 0x016028 05:8018: 95 B6
	STA enemyHits,X				;C - - - - - 0x01602A 05:801A: 9D BE 04
	STA enemyMad,X				;C - - - - - 0x01602D 05:801D: 95 63
	STA ram_00C0,X				;C - - - - - 0x01602F 05:801F: 95 C0
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x016031 05:8021: 9D 6C 05
	STA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x016034 05:8024: 9D 34 06
	STA objChrBank+OSLOT_ENEMY,X				;C - - - - - 0x016037 05:8027: 9D 5C 06
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x01603A 05:802A: 9D FC 06
	STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x01603D 05:802D: 9D 84 06
	STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x016040 05:8030: 9D 24 07
	STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x016043 05:8033: 9D D4 06
	STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x016046 05:8036: 9D AC 06
	INX							;C - - - - - 0x016049 05:8039: E8
	CPX #$0A					;C - - - - - 0x01604A 05:803A: E0 0A
	BNE CODE_0B8012				;C - - - - - 0x01604C 05:803C: D0 D4

	LDA #.BANK(CODE_059DB8)					;C - - - - - 0x01604E 05:803E: A9 05
	STA nmiPrgBankA				;C - - - - - 0x016050 05:8040: 85 51
	LDA #.BANK(CODE_0B8057)					;C - - - - - 0x016052 05:8042: A9 0B
	STA updateSubBankA			;C - - - - - 0x016054 05:8044: 85 18
	LDA #.LOBYTE(CODE_0B8057)	;C - - - - - 0x016056 05:8046: A9 57
	STA updateSub				;C - - - - - 0x016058 05:8048: 85 19
	LDA #.HIBYTE(CODE_0B8057)	;C - - - - - 0x01605A 05:804A: A9 80
	STA updateSub+1				;C - - - - - 0x01605C 05:804C: 85 1A

	LDA #.LOBYTE(CODE_059DB8)	;C - - - - - 0x01605E 05:804E: A9 B8
	STA nmiBankedSub				;C - - - - - 0x016060 05:8050: 85 16
	LDA #.HIBYTE(CODE_059DB8)	;C - - - - - 0x016062 05:8052: A9 9D
	STA nmiBankedSub+1				;C - - - - - 0x016064 05:8054: 85 17
	RTS							;C - - - - - 0x016066 05:8056: 60

CODE_0B8057:
	LDA #.BANK(RoundsEnemyTable)					;C - - - - - 0x016067 05:8057: A9 0C
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x016069 05:8059: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x01606B 05:805B: 20 56 FF
.endif

	LDA currentRound				;C - - - - - 0x01606E 05:805E: A5 D8
	ASL							;C - - - - - 0x016070 05:8060: 0A
	TAX							;C - - - - - 0x016071 05:8061: AA
	LDA RoundsEnemyTable,X			;C - - - - - 0x016072 05:8062: BD 4E B3
	STA scratch6				;C - - - - - 0x016075 05:8065: 85 06
	LDA RoundsEnemyTable+1,X			;C - - - - - 0x016077 05:8067: BD 4F B3
	STA scratch7				;C - - - - - 0x01607A 05:806A: 85 07
	LDY #$00					;C - - - - - 0x01607C 05:806C: A0 00
	LDA (scratch6),Y			;C - - - - - 0x01607E 05:806E: B1 06
	STA roundEnemies				;C - - - - - 0x016080 05:8070: 8D A8 04
	LDX #$00					;C - - - - - 0x016083 05:8073: A2 00
CODE_0B8075:
	LDA #$01					;C - - - - - 0x016085 05:8075: A9 01
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x016087 05:8077: 9D 6C 05
	INY							;C - - - - - 0x01608A 05:807A: C8

	;00: Y
	LDA (scratch6),Y			;C - - - - - 0x01608B 05:807B: B1 06
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x01608D 05:807D: 9D 94 05
	STA ram_0084,X				;C - - - - - 0x016090 05:8080: 95 84
	INY							;C - - - - - 0x016092 05:8082: C8
	;01: X
	LDA (scratch6),Y			;C - - - - - 0x016093 05:8083: B1 06
	STA objX+OSLOT_ENEMY,X				;C - - - - - 0x016095 05:8085: 9D BC 05
	INY							;C - - - - - 0x016098 05:8088: C8
	;02: CHR slot
	LDA (scratch6),Y			;C - - - - - 0x016099 05:8089: B1 06
	STA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x01609B 05:808B: 9D 34 06
	STA scratch0				;C - - - - - 0x01609E 05:808E: 85 00
	SEC							;C - - - - - 0x0160A0 05:8090: 38
	SBC #$01					;C - - - - - 0x0160A1 05:8091: E9 01
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x0160A3 05:8093: 9D FC 06
	INY							;C - - - - - 0x0160A6 05:8096: C8
	;03: Anim
	LDA (scratch6),Y			;C - - - - - 0x0160A7 05:8097: B1 06
	STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0160A9 05:8099: 9D 84 06
	INY							;C - - - - - 0x0160AC 05:809C: C8
	;04: Enemy ID
	LDA (scratch6),Y			;C - - - - - 0x0160AD 05:809D: B1 06
	STA enemyType,X				;C - - - - - 0x0160AF 05:809F: 95 98
	STA scratch1				;C - - - - - 0x0160B1 05:80A1: 85 01
	INY							;C - - - - - 0x0160B3 05:80A3: C8
	;05: Direction
	LDA (scratch6),Y			;C - - - - - 0x0160B4 05:80A4: B1 06
	STA enemyDir,X				;C - - - - - 0x0160B6 05:80A6: 95 A2

	LDA scratch0				;C - - - - - 0x0160B8 05:80A8: A5 00
	CMP #$03					;C - - - - - 0x0160BA 05:80AA: C9 03
	BNE CODE_0B80B3				;C - - - - - 0x0160BC 05:80AC: D0 05
		;Using 2nd enemy CHR slot (3)
		LDA scratch1				;C - - - - - 0x0160BE 05:80AE: A5 01
		STA bonusRewardEnemyType				;C - - - - - 0x0160C0 05:80B0: 8D 52 05
CODE_0B80B3:
	JSR CODE_0B9859				;C - - - - - 0x0160C3 05:80B3: 20 59 98
	JSR CODE_0B987E				;C - - - - - 0x0160C6 05:80B6: 20 7E 98
	JSR CODE_0B8104				;C - - - - - 0x0160C9 05:80B9: 20 04 81
	INX							;C - - - - - 0x0160CC 05:80BC: E8
	CPX roundEnemies				;C - - - - - 0x0160CD 05:80BD: EC A8 04
	BNE CODE_0B8075				;C - - - - - 0x0160D0 05:80C0: D0 B3

	JSR CODE_0B80F3				;C - - - - - 0x0160D2 05:80C2: 20 F3 80

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif

	LDA #$0F					;C - - - - - 0x0160D5 05:80C5: A9 0F
	STA colorBuffer+COL_SPR+13				;C - - - - - 0x0160D7 05:80C7: 8D 1D 03
	LDA #$26					;C - - - - - 0x0160DA 05:80CA: A9 26
	STA colorBuffer+COL_SPR+14				;C - - - - - 0x0160DC 05:80CC: 8D 1E 03
	LDA #$16					;C - - - - - 0x0160DF 05:80CF: A9 16
	STA colorBuffer+COL_SPR+15				;C - - - - - 0x0160E1 05:80D1: 8D 1F 03

	LDA #.LOBYTE(CODE_0B8150)	;C - - - - - 0x0160E4 05:80D4: A9 50
	STA nmiBankedSub			;C - - - - - 0x0160E6 05:80D6: 85 16
	LDA #.HIBYTE(CODE_0B8150)	;C - - - - - 0x0160E8 05:80D8: A9 81
	STA nmiBankedSub+1			;C - - - - - 0x0160EA 05:80DA: 85 17

	LDA currentRound				;C - - - - - 0x0160EC 05:80DC: A5 D8
	CMP #$4F					;C - - - - - 0x0160EE 05:80DE: C9 4F
	BCC CODE_0B80EC				;C - - - - - 0x0160F0 05:80E0: 90 0A
	LDA #$02					;C - - - - - 0x0160F2 05:80E2: A9 02
	STA objAttr+OSLOT_ENEMY+1				;C - - - - - 0x0160F4 05:80E4: 8D FD 06
	LDA #$03					;C - - - - - 0x0160F7 05:80E7: A9 03
	STA objAttr+OSLOT_ENEMY+2				;C - - - - - 0x0160F9 05:80E9: 8D FE 06
CODE_0B80EC:
.ifndef REGION_JP
	JSR AnimateNonBubbles				;C - - - - - 0x0160FC 05:80EC: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x0160FF 05:80EF: 20 E2 EE
.endif
	RTS							;C - - - - - 0x016102 05:80F2: 60

CODE_0B80F3:
	LDX #$00					;C - - - - - 0x016103 05:80F3: A2 00
CODE_0B80F5:
	LDY enemyType,X				;C - - - - - 0x016105 05:80F5: B4 98
	LDA DATA_0CBE01,Y			;C - - - - - 0x016107 05:80F7: B9 01 BE
	STA ram_04AF,X				;C - - - - - 0x01610A 05:80FA: 9D AF 04
	INX							;C - - - - - 0x01610D 05:80FD: E8
	CPX roundEnemies				;C - - - - - 0x01610E 05:80FE: EC A8 04
	BNE CODE_0B80F5				;C - - - - - 0x016111 05:8101: D0 F2
	RTS							;C - - - - - 0x016113 05:8103: 60

CODE_0B8104:
	LDA currentRound				;C - - - - - 0x016114 05:8104: A5 D8
	CMP #$0A					;C - - - - - 0x016116 05:8106: C9 0A
	BEQ CODE_0B8126				;C - - - - - 0x016118 05:8108: F0 1C
	CMP #$14					;C - - - - - 0x01611A 05:810A: C9 14
	BEQ CODE_0B812C				;C - - - - - 0x01611C 05:810C: F0 1E
	CMP #$1E					;C - - - - - 0x01611E 05:810E: C9 1E
	BEQ CODE_0B812F				;C - - - - - 0x016120 05:8110: F0 1D
	CMP #$28					;C - - - - - 0x016122 05:8112: C9 28
	BEQ CODE_0B8135				;C - - - - - 0x016124 05:8114: F0 1F
	CMP #$3C					;C - - - - - 0x016126 05:8116: C9 3C
	BEQ CODE_0B8138				;C - - - - - 0x016128 05:8118: F0 1E
	CMP #$46					;C - - - - - 0x01612A 05:811A: C9 46
	BEQ CODE_0B8138				;C - - - - - 0x01612C 05:811C: F0 1A
		LDA #$10					;C - - - - - 0x01612E 05:811E: A9 10
		STA objY+OSLOT_ENEMY,X				;C - - - - - 0x016130 05:8120: 9D 94 05
		JMP CODE_0B8146				;C - - - - - 0x016133 05:8123: 4C 46 81
CODE_0B8126:
	LDA DATA_0B8147,X			;C - - - - - 0x016136 05:8126: BD 47 81
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x016139 05:8129: 9D 94 05
.ifdef REGION_JP
	JMP CODE_0B8146					;- - - - - - 0x01613D 05:812D: 4C
.endif
CODE_0B812C:
	JMP CODE_0B8146				;C - - - - - 0x01613C 05:812C: 4C 46 81
CODE_0B812F:
	LDA DATA_0B8149,X			;C - - - - - 0x01613F 05:812F: BD 49 81
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x016142 05:8132: 9D 94 05
.ifdef REGION_JP
	JMP CODE_0B8146					;- - - - - - 0x01614C 05:813C: 4C
.endif
CODE_0B8135:
	JMP CODE_0B8146				;C - - - - - 0x016145 05:8135: 4C 46 81
CODE_0B8138:
	LDA #$80					;C - - - - - 0x016148 05:8138: A9 80
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x01614A 05:813A: 9D 94 05
	JMP CODE_0B8146				;C - - - - - 0x01614D 05:813D: 4C 46 81
		;Unreached
		LDA DATA_0B814D,X			;- - - - - - 0x016150 05:8140: BD
		STA objY+OSLOT_ENEMY,X				;- - - - - - 0x016153 05:8143: 9D
.ifdef REGION_JP
		JMP CODE_0B8146					;- - - - - - 0x01615D 05:814D: 4C
.endif
CODE_0B8146:
	RTS							;C - - - - - 0x016156 05:8146: 60

DATA_0B8147:
	.byte $10					;- D 0 - - - 0x016157 05:8147: 10
	.byte $30					;- D 0 - - - 0x016158 05:8148: 30
DATA_0B8149:
	.byte $40					;- D 0 - - - 0x016159 05:8149: 40
	.byte $30					;- D 0 - - - 0x01615A 05:814A: 30
	.byte $20					;- D 0 - - - 0x01615B 05:814B: 20
	.byte $10					;- D 0 - - - 0x01615C 05:814C: 10
DATA_0B814D:
	.byte $80					;- - - - - - 0x01615D 05:814D: 80
	.byte $80					;- - - - - - 0x01615E 05:814E: 80
	.byte $80					;- - - - - - 0x01615F 05:814F: 80

CODE_0B8150:
	LDX #$00					;C - - - - - 0x016160 05:8150: A2 00
CODE_0B8152:
	LDA enemyDir,X				;C - - - - - 0x016162 05:8152: B5 A2
	BPL CODE_0B8162				;C - - - - - 0x016164 05:8154: 10 0C
		AND #$7F					;C - - - - - 0x016166 05:8156: 29 7F
		STA enemyDir,X				;C - - - - - 0x016168 05:8158: 95 A2
		LDA ram_0084,X				;C - - - - - 0x01616A 05:815A: B5 84
		STA objY+OSLOT_ENEMY,X				;C - - - - - 0x01616C 05:815C: 9D 94 05
		JMP CODE_0B8175				;C - - - - - 0x01616F 05:815F: 4C 75 81
CODE_0B8162:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x016172 05:8162: BD 94 05
	CMP ram_0084,X				;C - - - - - 0x016175 05:8165: D5 84
	BEQ CODE_0B8175				;C - - - - - 0x016177 05:8167: F0 0C
		CLC							;C - - - - - 0x016179 05:8169: 18
		ADC #$02					;C - - - - - 0x01617A 05:816A: 69 02
		CMP ram_0084,X				;C - - - - - 0x01617C 05:816C: D5 84
		BCC CODE_0B8172				;C - - - - - 0x01617E 05:816E: 90 02
			LDA ram_0084,X				;C - - - - - 0x016180 05:8170: B5 84
	CODE_0B8172:
		STA objY+OSLOT_ENEMY,X				;C - - - - - 0x016182 05:8172: 9D 94 05
CODE_0B8175:
	INX							;C - - - - - 0x016185 05:8175: E8
	CPX roundEnemies				;C - - - - - 0x016186 05:8176: EC A8 04
	BNE CODE_0B8152				;C - - - - - 0x016189 05:8179: D0 D7

	LDX #$00					;C - - - - - 0x01618B 05:817B: A2 00
CODE_0B817D:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01618D 05:817D: BD 94 05
	CMP ram_0084,X				;C - - - - - 0x016190 05:8180: D5 84
	BNE CODE_0B8196				;C - - - - - 0x016192 05:8182: D0 12
		INX							;C - - - - - 0x016194 05:8184: E8
		CPX roundEnemies				;C - - - - - 0x016195 05:8185: EC A8 04
		BNE CODE_0B817D				;C - - - - - 0x016198 05:8188: D0 F3

		LDA #.BANK(RoundUpdate)					;C - - - - - 0x01619A 05:818A: A9 09
		STA nmiPrgBankA				;C - - - - - 0x01619C 05:818C: 85 51
		LDA #.LOBYTE(RoundUpdate)	;C - - - - - 0x01619E 05:818E: A9 10
		STA nmiBankedSub			;C - - - - - 0x0161A0 05:8190: 85 16
		LDA #.HIBYTE(RoundUpdate)	;C - - - - - 0x0161A2 05:8192: A9 97
		STA nmiBankedSub+1			;C - - - - - 0x0161A4 05:8194: 85 17
CODE_0B8196:
	LDA #.LOBYTE(CODE_058E83)					;C - - - - - 0x0161A6 05:8196: A9 83
	STA bankedSub				;C - - - - - 0x0161A8 05:8198: 85 55
	LDA #.HIBYTE(CODE_058E83)					;C - - - - - 0x0161AA 05:819A: A9 8E
	STA bankedSub+1				;C - - - - - 0x0161AC 05:819C: 85 56
	LDA #.BANK(CODE_058E83)					;C - - - - - 0x0161AE 05:819E: A9 05
	STA bankedSubBank				;C - - - - - 0x0161B0 05:81A0: 85 57
	LDA #.BANK(*)					;C - - - - - 0x0161B2 05:81A2: A9 0B
	STA bankedSubRetBank				;C - - - - - 0x0161B4 05:81A4: 85 58
	JSR RunBankedSub				;C - - - - - 0x0161B6 05:81A6: 20 72 E7
	LDA globalTimer				;C - - - - - 0x0161B9 05:81A9: A5 14
	AND #$01					;C - - - - - 0x0161BB 05:81AB: 29 01
	BNE CODE_0B81B2				;C - - - - - 0x0161BD 05:81AD: D0 03
		JSR AnimateNonBubbles				;C - - - - - 0x0161BF 05:81AF: 20 5C EE
CODE_0B81B2:
	JSR DrawObjects				;C - - - - - 0x0161C2 05:81B2: 20 E2 EE
	RTS							;C - - - - - 0x0161C5 05:81B5: 60

CODE_0B81B6:
	LDA roundFlags				;C - - - - - 0x0161C6 05:81B6: AD 71 04
	AND #$18					;C - - - - - 0x0161C9 05:81B9: 29 18
	BEQ CODE_0B81C0				;C - - - - - 0x0161CB 05:81BB: F0 03
		JMP CODE_JP_0B82C0				;C - - - - - 0x0161CD 05:81BD: 4C DC 82
CODE_0B81C0:
	LDA enemyFrozenCycles				;C - - - - - 0x0161D0 05:81C0: AD D4 04
	BEQ CODE_0B81E3				;C - - - - - 0x0161D3 05:81C3: F0 1E

	LDA globalTimer				;C - - - - - 0x0161D5 05:81C5: A5 14
	AND #$3F					;C - - - - - 0x0161D7 05:81C7: 29 3F
	BNE CODE_0B81E3				;C - - - - - 0x0161D9 05:81C9: D0 18

	DEC enemyFrozenCycles				;C - - - - - 0x0161DB 05:81CB: CE D4 04
	BNE CODE_0B81E3				;C - - - - - 0x0161DE 05:81CE: D0 13

	LDA #.LOBYTE(SetRoundPaletteAndMusic)					;C - - - - - 0x0161E0 05:81D0: A9 A4
	STA bankedSub				;C - - - - - 0x0161E2 05:81D2: 85 55
	LDA #.HIBYTE(SetRoundPaletteAndMusic)	;C - - - - - 0x0161E4 05:81D4: A9 84
	STA bankedSub+1				;C - - - - - 0x0161E6 05:81D6: 85 56
	LDA #.BANK(SetRoundPaletteAndMusic)					;C - - - - - 0x0161E8 05:81D8: A9 08
	STA bankedSubBank				;C - - - - - 0x0161EA 05:81DA: 85 57
	LDA #.BANK(*)					;C - - - - - 0x0161EC 05:81DC: A9 0B
	STA bankedSubRetBank				;C - - - - - 0x0161EE 05:81DE: 85 58
	JSR RunBankedSub				;C - - - - - 0x0161F0 05:81E0: 20 72 E7
CODE_0B81E3:
	LDX #$00					;C - - - - - 0x0161F3 05:81E3: A2 00
	STX ram_00CB				;C - - - - - 0x0161F5 05:81E5: 86 CB
	STX untrappedEnemies				;C - - - - - 0x0161F7 05:81E7: 86 CC

.ifdef REGION_JP
	;(Unsure of actual intended target)
	LDA #.BANK(AnimTable)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x0161F9 05:81E9: A9 00
	ORA #$07					;C - - - - - 0x0161FB 05:81EB: 09 07
	STA $8000				;C - - - - - 0x0161FD 05:81ED: 8D 00 80
	;(Unsure of actual intended target)
	LDA #.BANK(AnimTable)					;C - - - - - 0x016200 05:81F0: A9 0C
	STA $8001				;C - - - - - 0x016202 05:81F2: 8D 01 80
	STA prgBankB				;C - - - - - 0x016205 05:81F5: 85 53

	LDA #$00					;C - - - - - 0x016207 05:81F7: A9 00
	ORA #$07					;C - - - - - 0x016209 05:81F9: 09 07
	STA $8000				;C - - - - - 0x01620B 05:81FB: 8D 00 80
	LDA #.BANK(AnimTable)					;C - - - - - 0x01620E 05:81FE: A9 0C
	STA $8001				;C - - - - - 0x016210 05:8200: 8D 01 80
	STA prgBankB				;C - - - - - 0x016213 05:8203: 85 53
.endif
CODE_0B8205:
	LDA enemyType,X				;C - - - - - 0x016215 05:8205: B5 98
	BNE CODE_0B820C				;C - - - - - 0x016217 05:8207: D0 03
		JMP CODE_0B82AA				;C - - - - - 0x016219 05:8209: 4C AA 82
CODE_0B820C:
	INC ram_00CB				;C - - - - - 0x01621C 05:820C: E6 CB
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x01621E 05:820E: BD 6C 05

.ifdef REGION_JP
	BEQ CODE_0B82AA				;- - - - - - 0x016216 05:8206: F0
.else
	BNE CODE_0B8216				;C - - - - - 0x016221 05:8211: D0 03
		JMP CODE_0B82AA				;C - - - - - 0x016223 05:8213: 4C AA 82
.endif
CODE_0B8216:
	LDA #$00					;C - - - - - 0x016226 05:8216: A9 00
	STA ram_00CD				;C - - - - - 0x016228 05:8218: 85 CD
	STA ram_00CF				;C - - - - - 0x01622A 05:821A: 85 CF
	STA projTouchingPlayer				;C - - - - - 0x01622C 05:821C: 85 CE
	STA ram_00D4				;C - - - - - 0x01622E 05:821E: 85 D4
	STA ram_00D5				;C - - - - - 0x016230 05:8220: 85 D5
	JSR CODE_0FF088				;C - - - - - 0x016232 05:8222: 20 88 F0

.ifdef REGION_JP
	;(Unsure of actual intended target)
	LDA #.BANK(AnimTable)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x016235 05:8225: A9 00
	ORA #$07					;C - - - - - 0x016237 05:8227: 09 07
	STA $8000				;C - - - - - 0x016239 05:8229: 8D 00 80
	;(Unsure of actual intended target)
	LDA #.BANK(AnimTable)					;C - - - - - 0x01623C 05:822C: A9 0C
	STA $8001				;C - - - - - 0x01623E 05:822E: 8D 01 80
	STA prgBankB				;C - - - - - 0x016241 05:8231: 85 53

	LDA #$00					;C - - - - - 0x016243 05:8233: A9 00
	ORA #$07					;C - - - - - 0x016245 05:8235: 09 07
	STA $8000				;C - - - - - 0x016247 05:8237: 8D 00 80
	LDA #.BANK(AnimTable)					;C - - - - - 0x01624A 05:823A: A9 0C
	STA $8001				;C - - - - - 0x01624C 05:823C: 8D 01 80
	STA prgBankB				;C - - - - - 0x01624F 05:823F: 85 53
.endif

	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x016251 05:8241: BD 6C 05
	CMP #ENEMY_DYING					;C - - - - - 0x016254 05:8244: C9 0B
	BEQ CODE_0B82A1				;C - - - - - 0x016256 05:8246: F0 59

	CMP #$0C					;C - - - - - 0x016258 05:8248: C9 0C
	BEQ CODE_0B82A1				;C - - - - - 0x01625A 05:824A: F0 55

	LDA enemyType,X				;C - - - - - 0x01625C 05:824C: B5 98
	ASL							;C - - - - - 0x01625E 05:824E: 0A
	CMP #ENEMY_RUCKUS*2					;C - - - - - 0x01625F 05:824F: C9 32
	BCC CODE_0B8272				;C - - - - - 0x016261 05:8251: 90 1F
	CMP #$24*2					;C - - - - - 0x016263 05:8253: C9 48
	BEQ CODE_0B8272				;C - - - - - 0x016265 05:8255: F0 1B
		TAY							;C - - - - - 0x016267 05:8257: A8
		INC untrappedEnemies				;C - - - - - 0x016268 05:8258: E6 CC
		LDA EnemyUpdateTable,Y			;C - - - - - 0x01626A 05:825A: B9 DD 82
		STA bankedSub				;C - - - - - 0x01626D 05:825D: 85 55
		LDA EnemyUpdateTable+1,Y			;C - - - - - 0x01626F 05:825F: B9 DE 82
		STA bankedSub+1				;C - - - - - 0x016272 05:8262: 85 56
		LDA #.BANK(RemoteEnemyUpdateSubs)					;C - - - - - 0x016274 05:8264: A9 08
		STA bankedSubBank				;C - - - - - 0x016276 05:8266: 85 57
		LDA #.BANK(*)					;C - - - - - 0x016278 05:8268: A9 0B
		STA bankedSubRetBank				;C - - - - - 0x01627A 05:826A: 85 58
		JSR RunBankedSub				;C - - - - - 0x01627C 05:826C: 20 72 E7
		JMP CODE_0B82AA				;C - - - - - 0x01627F 05:826F: 4C AA 82
CODE_0B8272:
	TAY							;C - - - - - 0x016282 05:8272: A8
	LDA EnemyUpdateTable,Y			;C - - - - - 0x016283 05:8273: B9 DD 82
	STA scratch6				;C - - - - - 0x016286 05:8276: 85 06
	LDA EnemyUpdateTable+1,Y			;C - - - - - 0x016288 05:8278: B9 DE 82
	STA scratch7				;C - - - - - 0x01628B 05:827B: 85 07
	INC untrappedEnemies				;C - - - - - 0x01628D 05:827D: E6 CC
	LDA ram_00C0,X				;C - - - - - 0x01628F 05:827F: B5 C0
	AND #$7F					;C - - - - - 0x016291 05:8281: 29 7F
	BEQ CODE_0B8288				;C - - - - - 0x016293 05:8283: F0 03
		JSR CODE_0B9AFF				;C - - - - - 0x016295 05:8285: 20 FF 9A
CODE_0B8288:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x016298 05:8288: BD 6C 05
	STA ram_00CA				;C - - - - - 0x01629B 05:828B: 85 CA
	LDA #.HIBYTE(@updateret-1)					;C - - - - - 0x01629D 05:828D: A9 82
	PHA							;C - - - - - 0x01629F 05:828F: 48
	LDA #.LOBYTE(@updateret-1)					;C - - - - - 0x0162A0 05:8290: A9 95
	PHA							;C - - - - - 0x0162A2 05:8292: 48
	JMP (scratch6)				;C - - - - - 0x0162A3 05:8293: 6C 06 00

	@updateret:
	LDA ram_00CA				;C - - - - - 0x0162A6 05:8296: A5 CA
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0162A8 05:8298: 9D 6C 05
	JSR CODE_0B9CB3				;C - - - - - 0x0162AB 05:829B: 20 B3 9C
	JMP CODE_0B82AA				;C - - - - - 0x0162AE 05:829E: 4C AA 82
CODE_0B82A1:
	LDA enemyType,X				;C - - - - - 0x0162B1 05:82A1: B5 98
	CMP #$22					;C - - - - - 0x0162B3 05:82A3: C9 22
	BEQ CODE_0B82AA				;C - - - - - 0x0162B5 05:82A5: F0 03
CODE_0B82A7:
		JSR CODE_0B8350				;C - - - - - 0x0162B7 05:82A7: 20 50 83
CODE_0B82AA:
	JSR CODE_0B9F1E				;C - - - - - 0x0162BA 05:82AA: 20 1E 9F
CODE_0B82AD:
	INX							;C - - - - - 0x0162BD 05:82AD: E8
	CPX #$09					;C - - - - - 0x0162BE 05:82AE: E0 09
	BEQ CODE_0B82B5				;C - - - - - 0x0162C0 05:82B0: F0 03
		JMP CODE_0B8205				;C - - - - - 0x0162C2 05:82B2: 4C 05 82
CODE_0B82B5:
	JSR CODE_0B9CD0				;C - - - - - 0x0162C5 05:82B5: 20 D0 9C
	LDA ram_00CB				;C - - - - - 0x0162C8 05:82B8: A5 CB
	BNE CODE_0B82DC				;C - - - - - 0x0162CA 05:82BA: D0 20
		LDA roundFlags				;C - - - - - 0x0162CC 05:82BC: AD 71 04
		AND #$08					;C - - - - - 0x0162CF 05:82BF: 29 08
		BNE CODE_0B82DC				;C - - - - - 0x0162D1 05:82C1: D0 19
			LDA objState+OSLOT_ENEMY+9				;C - - - - - 0x0162D3 05:82C3: AD 75 05
			BNE CODE_0B82D0				;C - - - - - 0x0162D6 05:82C6: D0 08
				LDA roundFlags				;C - - - - - 0x0162D8 05:82C8: AD 71 04
				ORA #$10					;C - - - - - 0x0162DB 05:82CB: 09 10
				STA roundFlags				;C - - - - - 0x0162DD 05:82CD: 8D 71 04
		CODE_0B82D0:
			LDA roundSkelDelay				;C - - - - - 0x0162E0 05:82D0: A5 6D
			BNE CODE_0B82DC				;C - - - - - 0x0162E2 05:82D2: D0 08
				LDA #$01					;C - - - - - 0x0162E4 05:82D4: A9 01
				STA scoreAdditionDigits+2				;C - - - - - 0x0162E6 05:82D6: 8D A3 04
				JSR AddScore				;C - - - - - 0x0162E9 05:82D9: 20 C7 FE
CODE_0B82DC:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
CODE_JP_0B82C0:
	RTS							;C - - - - - 0x0162EC 05:82DC: 60

EnemyUpdateTable:
	;Some in this bank, some in bank 08
	.word ZenChanUpdate			;- - - - - - 0x0162ED 05:82DD: BD
	.word ZenChanUpdate			;- D 0 - - - 0x0162EF 05:82DF: BD
	.word BanebouUpdate			;- D 0 - - - 0x0162F1 05:82E1: DA
	.word BlobbyUpdate			;- D 0 - - - 0x0162F3 05:82E3: AF
	.word PulpulUpdate			;- D 0 - - - 0x0162F5 05:82E5: C4
	.word NeedlerUpdate			;- D 0 - - - 0x0162F7 05:82E7: E1
	.word InvaderUpdate			;- D 0 - - - 0x0162F9 05:82E9: F6
	.word MonstaUpdate			;- D 0 - - - 0x0162FB 05:82EB: 53
	.word HeitaiKunUpdate			;- D 0 - - - 0x0162FD 05:82ED: D4
	.word CarryHeliUpdate			;- D 0 - - - 0x0162FF 05:82EF: B5
	.word FlarionUpdate			;- D 0 - - - 0x016301 05:82F1: 90
	.word SnaggerUpdate			;- D 0 - - - 0x016303 05:82F3: EB
	.word ManticharUpdate			;- D 0 - - - 0x016305 05:82F5: 62
	.word RoboZenUpdate			;- D 0 - - - 0x016307 05:82F7: 3C
	.word KirikabunUpdate			;- D 0 - - - 0x016309 05:82F9: 73
	.word TwizzerUpdate			;- D 0 - - - 0x01630B 05:82FB: AC
	.word DrunkUpdate			;- D 0 - - - 0x01630D 05:82FD: 58
	.word FlutterflyUpdate			;- D 0 - - - 0x01630F 05:82FF: 63
	.word DOHUpdate			;- D 0 - - - 0x016311 05:8301: AB
	.word SpringitUpdate			;- D 0 - - - 0x016313 05:8303: BF
	.word SpringitBodyUpdate			;- D 0 - - - 0x016315 05:8305: 95
	.word TrashUpdate			;- D 0 - - - 0x016317 05:8307: 15
	.word SkelMonstaUpdate			;- D 0 - - - 0x016319 05:8309: 5F
	.word ChuckerUpdate			;- D 0 - - - 0x01631B 05:830B: BF
	.word RounderUpdate			;- D 0 - - - 0x01631D 05:830D: AD
	.word RuckusUpdate			;- D 0 - - - 0x01631F 05:830F: F4 - Index $19 ($32)
	.word MadMonkeyUpdate			;- D 0 - - - 0x016321 05:8311: B7
	.word RocUpdate			;- D 0 - - - 0x016323 05:8313: 9A
	.word SuperDrunkUpdate			;- D 0 - - - 0x016325 05:8315: 77
	.word BlueSkullUpdate			;- D 0 - - - 0x016327 05:8317: F7
	.word PurpleSkullUpdate			;- D 0 - - - 0x016329 05:8319: D0
	.word RedSkullUpdate			;- D 0 - - - 0x01632B 05:831B: 3B
	.word SuperRedSkullUpdate			;- D 0 - - - 0x01632D 05:831D: A4
	.word SpikeBallUpdate			;- D 0 - - - 0x01632F 05:831F: A7
	.word RewardUpdate			;- D 0 - - - 0x016331 05:8321: D0
	.word GhostMonstaUpdate			;- - - - - - 0x016333 05:8323: 31 - Index $23 ($46)
	.word GhostMonstaUpdate			;- D 0 - - - 0x016335 05:8325: 31 - Index $24 ($48)

CODE_0B8327:
	LDA ram_00CD				;C - - - - - 0x016337 05:8327: A5 CD
	CMP #$80					;C - - - - - 0x016339 05:8329: C9 80
	BCC CODE_0B8347				;C - - - - - 0x01633B 05:832B: 90 1A
		AND #$0F					;C - - - - - 0x01633D 05:832D: 29 0F
		EOR #$FF					;C - - - - - 0x01633F 05:832F: 49 FF
		STA ram_00D5				;C - - - - - 0x016341 05:8331: 85 D5
		INC ram_00D5				;C - - - - - 0x016343 05:8333: E6 D5
		LDA ram_00CA				;C - - - - - 0x016345 05:8335: A5 CA
		CMP #$0C					;C - - - - - 0x016347 05:8337: C9 0C
		BNE CODE_0B8340				;C - - - - - 0x016349 05:8339: D0 05
			;Unreached
			LDA #$0D					;- - - - - - 0x01634B 05:833B: A9
			JMP CODE_0B8342				;- - - - - - 0x01634D 05:833D: 4C
	CODE_0B8340:
		LDA #$01					;C - - - - - 0x016350 05:8340: A9 01
	CODE_0B8342:
		STA ram_00CA				;C - - - - - 0x016352 05:8342: 85 CA
		JMP CODE_0B834B				;C - - - - - 0x016354 05:8344: 4C 4B 83
CODE_0B8347:
	LDA #$02					;C - - - - - 0x016357 05:8347: A9 02
	STA ram_00D5				;C - - - - - 0x016359 05:8349: 85 D5
CODE_0B834B:
	LDA #$00					;C - - - - - 0x01635B 05:834B: A9 00
	STA ram_00D4				;C - - - - - 0x01635D 05:834D: 85 D4
	RTS							;C - - - - - 0x01635F 05:834F: 60

CODE_0B8350:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x016360 05:8350: BD 6C 05
	STA ram_00CA				;C - - - - - 0x016363 05:8353: 85 CA
	LDA ram_00AC,X				;C - - - - - 0x016365 05:8355: B5 AC
	CMP #$2C					;C - - - - - 0x016367 05:8357: C9 2C
	BNE CODE_0B83AA				;C - - - - - 0x016369 05:8359: D0 4F

	DEC ram_00AC,X				;C - - - - - 0x01636B 05:835B: D6 AC
	LDA #$34					;C - - - - - 0x01636D 05:835D: A9 34
	STA ram_04AF,X				;C - - - - - 0x01636F 05:835F: 9D AF 04
	LDA #$0C					;C - - - - - 0x016372 05:8362: A9 0C
	STA ram_00CA				;C - - - - - 0x016374 05:8364: 85 CA
	INC ram_00B6,X				;C - - - - - 0x016376 05:8366: F6 B6
	LDA ram_00B6,X				;C - - - - - 0x016378 05:8368: B5 B6
	CMP #$80					;C - - - - - 0x01637A 05:836A: C9 80
	BNE CODE_0B8372				;C - - - - - 0x01637C 05:836C: D0 04
		LDA #$80					;C - - - - - 0x01637E 05:836E: A9 80
		STA ram_00CD				;C - - - - - 0x016380 05:8370: 85 CD
CODE_0B8372:
	LDA ram_00CD				;C - - - - - 0x016382 05:8372: A5 CD
	CMP #$80					;C - - - - - 0x016384 05:8374: C9 80
	BCC CODE_0B83AA				;C - - - - - 0x016386 05:8376: 90 32

	AND #$0F					;C - - - - - 0x016388 05:8378: 29 0F
	EOR #$FF					;C - - - - - 0x01638A 05:837A: 49 FF
	STA ram_00D5				;C - - - - - 0x01638C 05:837C: 85 D5
	INC ram_00D5				;C - - - - - 0x01638E 05:837E: E6 D5
	LDA #$00					;C - - - - - 0x016390 05:8380: A9 00
	STA ram_00AC,X				;C - - - - - 0x016392 05:8382: 95 AC
	STA ram_00B6,X				;C - - - - - 0x016394 05:8384: 95 B6
	LDA #$0D					;C - - - - - 0x016396 05:8386: A9 0D
	STA ram_00CA				;C - - - - - 0x016398 05:8388: 85 CA
	LDY enemyType,X				;C - - - - - 0x01639A 05:838A: B4 98
	STY enemyReward,X				;C - - - - - 0x01639C 05:838C: 94 8E
	LDA DATA_0B8416,Y			;C - - - - - 0x01639E 05:838E: B9 16 84
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x0163A1 05:8391: 9D FC 06
	LDA EnemyRewardAnims,Y			;C - - - - - 0x0163A4 05:8394: B9 92 BC
	JSR StartEnemyAnim2				;C - - - - - 0x0163A7 05:8397: 20 C2 9E
	LDA #$22					;C - - - - - 0x0163AA 05:839A: A9 22
	STA enemyType,X				;C - - - - - 0x0163AC 05:839C: 95 98
	LDA #$F0					;C - - - - - 0x0163AE 05:839E: A9 F0
	STA ram_00B6,X				;C - - - - - 0x0163B0 05:83A0: 95 B6
	LDA #$04					;C - - - - - 0x0163B2 05:83A2: A9 04
	STA ram_04AF,X				;C - - - - - 0x0163B4 05:83A4: 9D AF 04
	JMP CODE_0B83E4				;C - - - - - 0x0163B7 05:83A7: 4C E4 83
CODE_0B83AA:
	LDA ram_00AC,X				;C - - - - - 0x0163BA 05:83AA: B5 AC
	TAY							;C - - - - - 0x0163BC 05:83AC: A8
	LDA DATA_0B83EA,Y			;C - - - - - 0x0163BD 05:83AD: B9 EA 83
	STA ram_00D5				;C - - - - - 0x0163C0 05:83B0: 85 D5
	INC ram_00AC,X				;C - - - - - 0x0163C2 05:83B2: F6 AC
	LDA projTouchingPlayer				;C - - - - - 0x0163C4 05:83B4: A5 CE
	AND #$C0					;C - - - - - 0x0163C6 05:83B6: 29 C0
	BEQ CODE_0B83D7				;C - - - - - 0x0163C8 05:83B8: F0 1D
		CMP #$80					;C - - - - - 0x0163CA 05:83BA: C9 80
		BNE CODE_0B83CB				;C - - - - - 0x0163CC 05:83BC: D0 0D
			LDA projTouchingPlayer				;C - - - - - 0x0163CE 05:83BE: A5 CE
			AND #$0F					;C - - - - - 0x0163D0 05:83C0: 29 0F
			EOR #$FF					;C - - - - - 0x0163D2 05:83C2: 49 FF
			ADC #$01					;C - - - - - 0x0163D4 05:83C4: 69 01
			STA ram_00D4				;C - - - - - 0x0163D6 05:83C6: 85 D4
			JMP CODE_0B83D1				;C - - - - - 0x0163D8 05:83C8: 4C D1 83
	CODE_0B83CB:
		LDA projTouchingPlayer				;C - - - - - 0x0163DB 05:83CB: A5 CE
		AND #$0F					;C - - - - - 0x0163DD 05:83CD: 29 0F
		STA ram_00D4				;C - - - - - 0x0163DF 05:83CF: 85 D4
	CODE_0B83D1:
		LDA enemyDir,X				;C - - - - - 0x0163E1 05:83D1: B5 A2
		EOR #$03					;C - - - - - 0x0163E3 05:83D3: 49 03
		STA enemyDir,X				;C - - - - - 0x0163E5 05:83D5: 95 A2
CODE_0B83D7:
	LDA ram_00CA				;C - - - - - 0x0163E7 05:83D7: A5 CA
	CMP #$0C					;C - - - - - 0x0163E9 05:83D9: C9 0C
	BEQ CODE_0B83E4				;C - - - - - 0x0163EB 05:83DB: F0 07
		LDA #$08					;C - - - - - 0x0163ED 05:83DD: A9 08
		STA ram_00D4				;C - - - - - 0x0163EF 05:83DF: 85 D4
		JSR CODE_0B849D				;C - - - - - 0x0163F1 05:83E1: 20 9D 84
CODE_0B83E4:
	LDA ram_00CA				;C - - - - - 0x0163F4 05:83E4: A5 CA
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0163F6 05:83E6: 9D 6C 05
	RTS							;C - - - - - 0x0163F9 05:83E9: 60

DATA_0B83EA:
	.byte $FB					;- D 0 - - - 0x0163FA 05:83EA: FB
	.byte $FB					;- D 0 - - - 0x0163FB 05:83EB: FB
	.byte $FB					;- D 0 - - - 0x0163FC 05:83EC: FB
	.byte $FB					;- D 0 - - - 0x0163FD 05:83ED: FB
	.byte $FC					;- D 0 - - - 0x0163FE 05:83EE: FC
	.byte $FC					;- D 0 - - - 0x0163FF 05:83EF: FC
	.byte $FC					;- D 0 - - - 0x016400 05:83F0: FC
	.byte $FC					;- D 0 - - - 0x016401 05:83F1: FC
	.byte $FD					;- D 0 - - - 0x016402 05:83F2: FD
	.byte $FD					;- D 0 - - - 0x016403 05:83F3: FD
	.byte $FD					;- D 0 - - - 0x016404 05:83F4: FD
	.byte $FD					;- D 0 - - - 0x016405 05:83F5: FD
	.byte $FE					;- D 0 - - - 0x016406 05:83F6: FE
	.byte $FE					;- D 0 - - - 0x016407 05:83F7: FE
	.byte $FE					;- D 0 - - - 0x016408 05:83F8: FE
	.byte $FE					;- D 0 - - - 0x016409 05:83F9: FE
	.byte $FF					;- D 0 - - - 0x01640A 05:83FA: FF
	.byte $FF					;- D 0 - - - 0x01640B 05:83FB: FF
	.byte $FF					;- D 0 - - - 0x01640C 05:83FC: FF
	.byte $FF					;- D 0 - - - 0x01640D 05:83FD: FF
	.byte $00					;- D 0 - - - 0x01640E 05:83FE: 00
	.byte $00					;- D 0 - - - 0x01640F 05:83FF: 00
	.byte $00					;- D 0 - - - 0x016410 05:8400: 00
	.byte $00					;- D 0 - - - 0x016411 05:8401: 00
	.byte $01					;- D 0 - - - 0x016412 05:8402: 01
	.byte $01					;- D 0 - - - 0x016413 05:8403: 01
	.byte $01					;- D 0 - - - 0x016414 05:8404: 01
	.byte $01					;- D 0 - - - 0x016415 05:8405: 01
	.byte $02					;- D 0 - - - 0x016416 05:8406: 02
	.byte $02					;- D 0 - - - 0x016417 05:8407: 02
	.byte $02					;- D 0 - - - 0x016418 05:8408: 02
	.byte $02					;- D 0 - - - 0x016419 05:8409: 02
	.byte $03					;- D 0 - - - 0x01641A 05:840A: 03
	.byte $03					;- D 0 - - - 0x01641B 05:840B: 03
	.byte $03					;- D 0 - - - 0x01641C 05:840C: 03
	.byte $03					;- D 0 - - - 0x01641D 05:840D: 03
	.byte $04					;- D 0 - - - 0x01641E 05:840E: 04
	.byte $04					;- D 0 - - - 0x01641F 05:840F: 04
	.byte $04					;- D 0 - - - 0x016420 05:8410: 04
	.byte $04					;- D 0 - - - 0x016421 05:8411: 04
	.byte $05					;- D 0 - - - 0x016422 05:8412: 05
	.byte $05					;- D 0 - - - 0x016423 05:8413: 05
	.byte $05					;- D 0 - - - 0x016424 05:8414: 05
	.byte $05					;- D 0 - - - 0x016425 05:8415: 05
DATA_0B8416:
	.byte $00					;- - - - - - 0x016426 05:8416: 00
	.byte $02					;- D 0 - - - 0x016427 05:8417: 02
	.byte $03					;- D 0 - - - 0x016428 05:8418: 03
	.byte $03					;- D 0 - - - 0x016429 05:8419: 03
	.byte $00					;- D 0 - - - 0x01642A 05:841A: 00
	.byte $03					;- D 0 - - - 0x01642B 05:841B: 03
	.byte $02					;- D 0 - - - 0x01642C 05:841C: 02
	.byte $00					;- D 0 - - - 0x01642D 05:841D: 00
	.byte $03					;- D 0 - - - 0x01642E 05:841E: 03
	.byte $00					;- - - - - - 0x01642F 05:841F: 00
	.byte $00					;- - - - - - 0x016430 05:8420: 00
	.byte $00					;- - - - - - 0x016431 05:8421: 00
	.byte $00					;- - - - - - 0x016432 05:8422: 00
	.byte $00					;- - - - - - 0x016433 05:8423: 00
	.byte $00					;- - - - - - 0x016434 05:8424: 00
	.byte $00					;- - - - - - 0x016435 05:8425: 00
	.byte $03					;- D 0 - - - 0x016436 05:8426: 03
	.byte $03					;- D 0 - - - 0x016437 05:8427: 03
	.byte $00					;- D 0 - - - 0x016438 05:8428: 00
	.byte $00					;- - - - - - 0x016439 05:8429: 00
	.byte $00					;- - - - - - 0x01643A 05:842A: 00
	.byte $00					;- - - - - - 0x01643B 05:842B: 00
	.byte $00					;- - - - - - 0x01643C 05:842C: 00
	.byte $00					;- D 0 - - - 0x01643D 05:842D: 00
	.byte $00					;- D 0 - - - 0x01643E 05:842E: 00

CODE_0B842F:
	JSR CODE_0FF9E8				;C - - - - - 0x01643F 05:842F: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x016442 05:8432: A5 CA
	CMP #$80					;C - - - - - 0x016444 05:8434: C9 80
	BCC CODE_0B8445				;C - - - - - 0x016446 05:8436: 90 0D
		CMP #$C0					;C - - - - - 0x016448 05:8438: C9 C0
		BCC CODE_0B8442				;C - - - - - 0x01644A 05:843A: 90 06
			JSR CODE_0B8446				;C - - - - - 0x01644C 05:843C: 20 46 84
			JMP CODE_0B8445				;C - - - - - 0x01644F 05:843F: 4C 45 84
	CODE_0B8442:
		JSR CODE_0FFAA3				;C - - - - - 0x016452 05:8442: 20 A3 FA
CODE_0B8445:
	RTS							;C - - - - - 0x016455 05:8445: 60

CODE_0B8446:
	LDA #$05					;C - - - - - 0x016456 05:8446: A9 05
	STA scratch0				;C - - - - - 0x016458 05:8448: 85 00
	LDA ram_00CA				;C - - - - - 0x01645A 05:844A: A5 CA
	CMP #$E0					;C - - - - - 0x01645C 05:844C: C9 E0
	BCC CODE_0B8454				;C - - - - - 0x01645E 05:844E: 90 04
		LDA #$03					;C - - - - - 0x016460 05:8450: A9 03
		STA scratch0				;C - - - - - 0x016462 05:8452: 85 00
CODE_0B8454:
	LDA scratch0				;C - - - - - 0x016464 05:8454: A5 00
	STA scoreAdditionDigits+3				;C - - - - - 0x016466 05:8456: 8D A4 04
	TXA							;C - - - - - 0x016469 05:8459: 8A
	PHA							;C - - - - - 0x01646A 05:845A: 48
	JSR AddScore				;C - - - - - 0x01646B 05:845B: 20 C7 FE
	PLA							;C - - - - - 0x01646E 05:845E: 68
	TAX							;C - - - - - 0x01646F 05:845F: AA
	LDA #snEnemyPop_ID					;C - - - - - 0x016470 05:8460: A9 27
	STA a:soundTrigger				;C - - - - - 0x016472 05:8462: 8D E1 00
	LDA #$0B					;C - - - - - 0x016475 05:8465: A9 0B
	STA ram_00CA				;C - - - - - 0x016477 05:8467: 85 CA
	LDA #$33					;C - - - - - 0x016479 05:8469: A9 33
	STA ram_04AF,X				;C - - - - - 0x01647B 05:846B: 9D AF 04
	LDY enemyType,X				;C - - - - - 0x01647E 05:846E: B4 98
	LDA EnemyDeathAnims2,Y			;C - - - - - 0x016480 05:8470: B9 84 84
	JSR StartEnemyAnim2				;C - - - - - 0x016483 05:8473: 20 C2 9E
	LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x016486 05:8476: BD 34 06
	SEC							;C - - - - - 0x016489 05:8479: 38
	SBC #$01					;C - - - - - 0x01648A 05:847A: E9 01
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x01648C 05:847C: 9D FC 06
	LDA #$00					;C - - - - - 0x01648F 05:847F: A9 00
	STA ram_00AC,X				;C - - - - - 0x016491 05:8481: 95 AC
	RTS							;C - - - - - 0x016493 05:8483: 60

EnemyDeathAnims2:
	.byte $00					;- - - - - - 0x016494 05:8484: 00
	.byte anZenChanDie_ID					;- D 0 - - - 0x016495 05:8485: 9F
	.byte anBanebouDie_ID					;- D 0 - - - 0x016496 05:8486: A2
	.byte anBlobbyDie_ID					;- D 0 - - - 0x016497 05:8487: A3
	.byte anPulpulDie_ID					;- D 0 - - - 0x016498 05:8488: A4
	.byte anNeedlerDie_ID					;- D 0 - - - 0x016499 05:8489: A1
	.byte anInvaderDie_ID					;- D 0 - - - 0x01649A 05:848A: A5
	.byte anMonstaDie_ID					;- D 0 - - - 0x01649B 05:848B: A0
	.byte anHeitaiKunDie_ID					;- D 0 - - - 0x01649C 05:848C: A6
	.byte anZenChanDie_ID					;- - - - - - 0x01649D 05:848D: 9F
	.byte anBanebouDie_ID					;- - - - - - 0x01649E 05:848E: A2
	.byte anBlobbyDie_ID					;- - - - - - 0x01649F 05:848F: A3
	.byte anPulpulDie_ID					;- - - - - - 0x0164A0 05:8490: A4
	.byte anNeedlerDie_ID					;- - - - - - 0x0164A1 05:8491: A1
	.byte anInvaderDie_ID					;- - - - - - 0x0164A2 05:8492: A5
	.byte anMonstaDie_ID					;- - - - - - 0x0164A3 05:8493: A0
	.byte anDrunkDie_ID					;- - - - - - 0x0164A4 05:8494: AE
	.byte anFlutterflyDie_ID					;- D 0 - - - 0x0164A5 05:8495: AC
	.byte $00					;- - - - - - 0x0164A6 05:8496: 00
	.byte $00					;- - - - - - 0x0164A7 05:8497: 00
	.byte $00					;- - - - - - 0x0164A8 05:8498: 00
	.byte $00					;- - - - - - 0x0164A9 05:8499: 00
	.byte $00					;- - - - - - 0x0164AA 05:849A: 00
	.byte anChuckerDie_ID					;- D 0 - - - 0x0164AB 05:849B: D7
	.byte anRounderDie_ID					;- D 0 - - - 0x0164AC 05:849C: E3

CODE_0B849D:
	LDA ram_00D4				;C - - - - - 0x0164AD 05:849D: A5 D4
	BEQ CODE_0B84BC				;C - - - - - 0x0164AF 05:849F: F0 1B
		LDA ram_04AA				;C - - - - - 0x0164B1 05:84A1: AD AA 04
		ROL							;C - - - - - 0x0164B4 05:84A4: 2A
		AND #$03					;C - - - - - 0x0164B5 05:84A5: 29 03
		CLC							;C - - - - - 0x0164B7 05:84A7: 18
		ADC ram_00D4				;C - - - - - 0x0164B8 05:84A8: 65 D4
		LSR							;C - - - - - 0x0164BA 05:84AA: 4A
		LSR							;C - - - - - 0x0164BB 05:84AB: 4A
		STA ram_00D4				;C - - - - - 0x0164BC 05:84AC: 85 D4
		LDA enemyDir,X				;C - - - - - 0x0164BE 05:84AE: B5 A2
		CMP #$01					;C - - - - - 0x0164C0 05:84B0: C9 01
		BNE CODE_0B84BC				;C - - - - - 0x0164C2 05:84B2: D0 08
			LDA ram_00D4				;C - - - - - 0x0164C4 05:84B4: A5 D4
			EOR #$FF					;C - - - - - 0x0164C6 05:84B6: 49 FF
			STA ram_00D4				;C - - - - - 0x0164C8 05:84B8: 85 D4
			INC ram_00D4				;C - - - - - 0x0164CA 05:84BA: E6 D4
CODE_0B84BC:
	RTS							;C - - - - - 0x0164CC 05:84BC: 60

LocalEnemyUpdateSubs:

ZenChanUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x0164CD 05:84BD: AD D4 04
	BNE CODE_0B84FD				;C - - - - - 0x0164D0 05:84C0: D0 3B

	JSR CODE_0B8501				;C - - - - - 0x0164D2 05:84C2: 20 01 85
	LDA ram_00CA				;C - - - - - 0x0164D5 05:84C5: A5 CA
	CMP #$04					;C - - - - - 0x0164D7 05:84C7: C9 04
	BNE CODE_0B84DB				;C - - - - - 0x0164D9 05:84C9: D0 10
		LDY enemyDir,X				;C - - - - - 0x0164DB 05:84CB: B4 A2
		LDA DATA_0B86B5,Y			;C - - - - - 0x0164DD 05:84CD: B9 B5 86
		CMP objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0164E0 05:84D0: DD 84 06
		BEQ CODE_0B84D8				;C - - - - - 0x0164E3 05:84D3: F0 03
			JSR StartEnemyAnim2				;C - - - - - 0x0164E5 05:84D5: 20 C2 9E
	CODE_0B84D8:
		JMP CODE_0B84FD				;C - - - - - 0x0164E8 05:84D8: 4C FD 84
CODE_0B84DB:
	CMP #$07					;C - - - - - 0x0164EB 05:84DB: C9 07
	BNE CODE_0B84E5				;C - - - - - 0x0164ED 05:84DD: D0 06
		JSR CODE_0B8693				;C - - - - - 0x0164EF 05:84DF: 20 93 86
		JMP CODE_0B84FD				;C - - - - - 0x0164F2 05:84E2: 4C FD 84
CODE_0B84E5:
	CMP #$08					;C - - - - - 0x0164F5 05:84E5: C9 08
	BNE CODE_0B84EF				;C - - - - - 0x0164F7 05:84E7: D0 06
		JSR CODE_0B86B8				;C - - - - - 0x0164F9 05:84E9: 20 B8 86
		JMP CODE_0B84FD				;C - - - - - 0x0164FC 05:84EC: 4C FD 84
CODE_0B84EF:
	CMP #$05					;C - - - - - 0x0164FF 05:84EF: C9 05
	BNE CODE_0B84FA				;C - - - - - 0x016501 05:84F1: D0 07
		LDA #$00					;C - - - - - 0x016503 05:84F3: A9 00
		STA ram_00D4				;C - - - - - 0x016505 05:84F5: 85 D4
		JMP CODE_0B84FD				;C - - - - - 0x016507 05:84F7: 4C FD 84
CODE_0B84FA:
	JSR CODE_0B85EB				;C - - - - - 0x01650A 05:84FA: 20 EB 85
CODE_0B84FD:
	JSR CODE_0B842F				;C - - - - - 0x01650D 05:84FD: 20 2F 84
	RTS							;C - - - - - 0x016510 05:8500: 60

CODE_0B8501:
	LDA ram_00CA				;C - - - - - 0x016511 05:8501: A5 CA
	CMP #$80					;C - - - - - 0x016513 05:8503: C9 80
	BCS CODE_0B8513				;C - - - - - 0x016515 05:8505: B0 0C
		CMP #$01					;C - - - - - 0x016517 05:8507: C9 01
		BNE CODE_0B8516				;C - - - - - 0x016519 05:8509: D0 0B
			LDA #$01					;C - - - - - 0x01651B 05:850B: A9 01
			STA ram_04AF,X				;C - - - - - 0x01651D 05:850D: 9D AF 04
			JSR CODE_0B859D				;C - - - - - 0x016520 05:8510: 20 9D 85
CODE_0B8513:
	JMP CODE_0B859C				;C - - - - - 0x016523 05:8513: 4C 9C 85
CODE_0B8516:
	CMP #$02					;C - - - - - 0x016526 05:8516: C9 02
	BNE CODE_0B8528				;C - - - - - 0x016528 05:8518: D0 0E
		LDA #$01					;C - - - - - 0x01652A 05:851A: A9 01
		STA ram_04AF,X				;C - - - - - 0x01652C 05:851C: 9D AF 04
		JSR CODE_0B859D				;C - - - - - 0x01652F 05:851F: 20 9D 85
		JSR CODE_0B8611				;C - - - - - 0x016532 05:8522: 20 11 86
		JMP CODE_0B859C				;C - - - - - 0x016535 05:8525: 4C 9C 85
CODE_0B8528:
	CMP #$03					;C - - - - - 0x016538 05:8528: C9 03
	BNE CODE_0B853A				;C - - - - - 0x01653A 05:852A: D0 0E
		LDA #$02					;C - - - - - 0x01653C 05:852C: A9 02
		STA ram_04AF,X				;C - - - - - 0x01653E 05:852E: 9D AF 04
		JSR CODE_0B859D				;C - - - - - 0x016541 05:8531: 20 9D 85
		JSR CODE_0B8644				;C - - - - - 0x016544 05:8534: 20 44 86
		JMP CODE_0B859C				;C - - - - - 0x016547 05:8537: 4C 9C 85
CODE_0B853A:
	CMP #$04					;C - - - - - 0x01654A 05:853A: C9 04
	BNE CODE_0B8547				;C - - - - - 0x01654C 05:853C: D0 09
		STA ram_04AF,X				;C - - - - - 0x01654E 05:853E: 9D AF 04
		JSR CODE_0B8327				;C - - - - - 0x016551 05:8541: 20 27 83
		JMP CODE_0B859C				;C - - - - - 0x016554 05:8544: 4C 9C 85
CODE_0B8547:
	CMP #$05					;C - - - - - 0x016557 05:8547: C9 05
	BNE CODE_0B856E				;C - - - - - 0x016559 05:8549: D0 23

	LDY ram_00AC,X				;C - - - - - 0x01655B 05:854B: B4 AC
	LDA enemyMad,X				;C - - - - - 0x01655D 05:854D: B5 63
	BEQ CODE_0B855D				;C - - - - - 0x01655F 05:854F: F0 0C
		LDA #$0E					;C - - - - - 0x016561 05:8551: A9 0E
		STA scratch0				;C - - - - - 0x016563 05:8553: 85 00
		STA scratch1				;C - - - - - 0x016565 05:8555: 85 01
		LDA DATA_0CBCD2,Y			;C - - - - - 0x016567 05:8557: B9 D2 BC
		JMP CODE_0B8566				;C - - - - - 0x01656A 05:855A: 4C 66 85
CODE_0B855D:
	LDA #$1C					;C - - - - - 0x01656D 05:855D: A9 1C
	STA scratch0				;C - - - - - 0x01656F 05:855F: 85 00
	STA scratch1				;C - - - - - 0x016571 05:8561: 85 01
	LDA DATA_0CBCB6,Y			;C - - - - - 0x016573 05:8563: B9 B6 BC
CODE_0B8566:
	STA scratch2				;C - - - - - 0x016576 05:8566: 85 02
	JSR CODE_0B8660				;C - - - - - 0x016578 05:8568: 20 60 86
	JMP CODE_0B859C				;C - - - - - 0x01657B 05:856B: 4C 9C 85
CODE_0B856E:
	CMP #$06					;C - - - - - 0x01657E 05:856E: C9 06
	BNE CODE_0B8599				;C - - - - - 0x016580 05:8570: D0 27

	LDY ram_00AC,X				;C - - - - - 0x016582 05:8572: B4 AC
	LDA enemyMad,X				;C - - - - - 0x016584 05:8574: B5 63
	BEQ CODE_0B8586				;C - - - - - 0x016586 05:8576: F0 0E
		LDA #$0E					;C - - - - - 0x016588 05:8578: A9 0E
		STA scratch0				;C - - - - - 0x01658A 05:857A: 85 00
		LDA #$07					;C - - - - - 0x01658C 05:857C: A9 07
		STA scratch1				;C - - - - - 0x01658E 05:857E: 85 01
		LDA DATA_0CBCFA,Y			;C - - - - - 0x016590 05:8580: B9 FA BC
		JMP CODE_0B8591				;C - - - - - 0x016593 05:8583: 4C 91 85
CODE_0B8586:
	LDA #$1A					;C - - - - - 0x016596 05:8586: A9 1A
	STA scratch0				;C - - - - - 0x016598 05:8588: 85 00
	LDA #$0D					;C - - - - - 0x01659A 05:858A: A9 0D
	STA scratch1				;C - - - - - 0x01659C 05:858C: 85 01
	LDA DATA_0CBCE0,Y			;C - - - - - 0x01659E 05:858E: B9 E0 BC
CODE_0B8591:
	STA scratch2				;C - - - - - 0x0165A1 05:8591: 85 02
	JSR CODE_0B8660				;C - - - - - 0x0165A3 05:8593: 20 60 86
	JMP CODE_0B859C				;C - - - - - 0x0165A6 05:8596: 4C 9C 85
CODE_0B8599:
	JSR CODE_0B85C6				;C - - - - - 0x0165A9 05:8599: 20 C6 85
CODE_0B859C:
	RTS							;C - - - - - 0x0165AC 05:859C: 60

CODE_0B859D:
	JSR CODE_0B85C6				;C - - - - - 0x0165AD 05:859D: 20 C6 85
	LDA ram_00CA				;C - - - - - 0x0165B0 05:85A0: A5 CA
	CMP #$04					;C - - - - - 0x0165B2 05:85A2: C9 04
	BCS CODE_0B85C5				;C - - - - - 0x0165B4 05:85A4: B0 1F
		LDY enemyType,X				;C - - - - - 0x0165B6 05:85A6: B4 98
		LDA objY				;C - - - - - 0x0165B8 05:85A8: AD 8B 05
		CLC							;C - - - - - 0x0165BB 05:85AB: 18
		ADC DATA_0CBD08,Y			;C - - - - - 0x0165BC 05:85AC: 79 08 BD
		STA scratch0				;C - - - - - 0x0165BF 05:85AF: 85 00
		LDA scratch0				;C - - - - - 0x0165C1 05:85B1: A5 00
		CMP objY+OSLOT_ENEMY,X				;C - - - - - 0x0165C3 05:85B3: DD 94 05
		BCS CODE_0B85C1				;C - - - - - 0x0165C6 05:85B6: B0 09
			LDA enemyReward,X				;C - - - - - 0x0165C8 05:85B8: B5 8E
			STA ram_00CA				;C - - - - - 0x0165CA 05:85BA: 85 CA
			INC ram_00CA				;C - - - - - 0x0165CC 05:85BC: E6 CA
			JMP CODE_0B85C5				;C - - - - - 0x0165CE 05:85BE: 4C C5 85
	CODE_0B85C1:
		LDA #$01					;C - - - - - 0x0165D1 05:85C1: A9 01
		STA ram_00CA				;C - - - - - 0x0165D3 05:85C3: 85 CA
CODE_0B85C5:
	RTS							;C - - - - - 0x0165D5 05:85C5: 60

CODE_0B85C6:
	LDA ram_00CD				;C - - - - - 0x0165D6 05:85C6: A5 CD
	CMP #$80					;C - - - - - 0x0165D8 05:85C8: C9 80
	BCC CODE_0B85D5				;C - - - - - 0x0165DA 05:85CA: 90 09
		AND #$07					;C - - - - - 0x0165DC 05:85CC: 29 07
		CMP #$03					;C - - - - - 0x0165DE 05:85CE: C9 03
		BCS CODE_0B85E6				;C - - - - - 0x0165E0 05:85D0: B0 14
		JMP CODE_0B85EA				;C - - - - - 0x0165E2 05:85D2: 4C EA 85
CODE_0B85D5:
	LDA ram_00CA				;C - - - - - 0x0165E5 05:85D5: A5 CA
	CMP #$02					;C - - - - - 0x0165E7 05:85D7: C9 02
	BNE CODE_0B85E6				;C - - - - - 0x0165E9 05:85D9: D0 0B
		LDA #$06					;C - - - - - 0x0165EB 05:85DB: A9 06
		STA ram_00CA				;C - - - - - 0x0165ED 05:85DD: 85 CA
		LDA #$00					;C - - - - - 0x0165EF 05:85DF: A9 00
		STA ram_00AC,X				;C - - - - - 0x0165F1 05:85E1: 95 AC
		JMP CODE_0B85EA				;C - - - - - 0x0165F3 05:85E3: 4C EA 85
CODE_0B85E6:
	LDA #$04					;C - - - - - 0x0165F6 05:85E6: A9 04
	STA ram_00CA				;C - - - - - 0x0165F8 05:85E8: 85 CA
CODE_0B85EA:
	RTS							;C - - - - - 0x0165FA 05:85EA: 60

CODE_0B85EB:
	LDA ram_00CA				;C - - - - - 0x0165FB 05:85EB: A5 CA
	CMP #$80					;C - - - - - 0x0165FD 05:85ED: C9 80
	BCS CODE_0B860E				;C - - - - - 0x0165FF 05:85EF: B0 1D
		LDA projTouchingPlayer				;C - - - - - 0x016601 05:85F1: A5 CE
		AND #$C0					;C - - - - - 0x016603 05:85F3: 29 C0
		BEQ CODE_0B8604				;C - - - - - 0x016605 05:85F5: F0 0D
			LDA enemyDir,X				;C - - - - - 0x016607 05:85F7: B5 A2
			EOR #$03					;C - - - - - 0x016609 05:85F9: 49 03
			STA enemyDir,X				;C - - - - - 0x01660B 05:85FB: 95 A2
			LDA #$07					;C - - - - - 0x01660D 05:85FD: A9 07
			STA ram_00CA				;C - - - - - 0x01660F 05:85FF: 85 CA
			JMP CODE_0B860E				;C - - - - - 0x016611 05:8601: 4C 0E 86
	CODE_0B8604:
		LDY enemyMad,X				;C - - - - - 0x016614 05:8604: B4 63
		LDA DATA_0B860F,Y			;C - - - - - 0x016616 05:8606: B9 0F 86
		STA ram_00D4				;C - - - - - 0x016619 05:8609: 85 D4
		JSR CODE_0B849D				;C - - - - - 0x01661B 05:860B: 20 9D 84
CODE_0B860E:
	RTS							;C - - - - - 0x01661E 05:860E: 60

DATA_0B860F:
	.byte $06					;- D 0 - - - 0x01661F 05:860F: 06
	.byte $0C					;- D 0 - - - 0x016620 05:8610: 0C

CODE_0B8611:
	LDA ram_00B6,X				;C - - - - - 0x016621 05:8611: B5 B6
	CMP DATA_0B9874,X			;C - - - - - 0x016623 05:8613: DD 74 98
	BNE CODE_0B8632				;C - - - - - 0x016626 05:8616: D0 1A
		LDY #$02					;C - - - - - 0x016628 05:8618: A0 02
		LDA objX				;C - - - - - 0x01662A 05:861A: AD B3 05
		CMP objX+OSLOT_ENEMY,X				;C - - - - - 0x01662D 05:861D: DD BC 05
		BCS CODE_0B8624				;C - - - - - 0x016630 05:8620: B0 02
			LDY #$01					;C - - - - - 0x016632 05:8622: A0 01
	CODE_0B8624:
		TYA							;C - - - - - 0x016634 05:8624: 98
		CMP enemyDir,X				;C - - - - - 0x016635 05:8625: D5 A2
		BEQ CODE_0B8632				;C - - - - - 0x016637 05:8627: F0 09
			STA enemyDir,X				;C - - - - - 0x016639 05:8629: 95 A2
			LDA #$07					;C - - - - - 0x01663B 05:862B: A9 07
			STA ram_00CA				;C - - - - - 0x01663D 05:862D: 85 CA
			JMP CODE_0B8632				;C - - - - - 0x01663F 05:862F: 4C 32 86
CODE_0B8632:
	DEC ram_00B6,X				;C - - - - - 0x016642 05:8632: D6 B6
	LDA ram_00B6,X				;C - - - - - 0x016644 05:8634: B5 B6
	BNE CODE_0B8643				;C - - - - - 0x016646 05:8636: D0 0B
		LDA #$02					;C - - - - - 0x016648 05:8638: A9 02
		STA enemyReward,X				;C - - - - - 0x01664A 05:863A: 95 8E
		JSR CODE_0B9859				;C - - - - - 0x01664C 05:863C: 20 59 98
		LDA #$00					;C - - - - - 0x01664F 05:863F: A9 00
		STA ram_00AC,X				;C - - - - - 0x016651 05:8641: 95 AC
CODE_0B8643:
	RTS							;C - - - - - 0x016653 05:8643: 60

CODE_0B8644:
	LDA ram_00CF				;C - - - - - 0x016654 05:8644: A5 CF
	CMP #$80					;C - - - - - 0x016656 05:8646: C9 80
	BCC CODE_0B864E				;C - - - - - 0x016658 05:8648: 90 04
		LDA #$08					;C - - - - - 0x01665A 05:864A: A9 08
		STA ram_00CA				;C - - - - - 0x01665C 05:864C: 85 CA
CODE_0B864E:
	DEC ram_00B6,X				;C - - - - - 0x01665E 05:864E: D6 B6
	LDA ram_00B6,X				;C - - - - - 0x016660 05:8650: B5 B6
	BNE CODE_0B865F				;C - - - - - 0x016662 05:8652: D0 0B
		LDA #$01					;C - - - - - 0x016664 05:8654: A9 01
		STA enemyReward,X				;C - - - - - 0x016666 05:8656: 95 8E
		JSR CODE_0B9859				;C - - - - - 0x016668 05:8658: 20 59 98
		LDA #$00					;C - - - - - 0x01666B 05:865B: A9 00
		STA ram_00AC,X				;C - - - - - 0x01666D 05:865D: 95 AC
CODE_0B865F:
	RTS							;C - - - - - 0x01666F 05:865F: 60

CODE_0B8660:
	LDA ram_04AA				;C - - - - - 0x016670 05:8660: AD AA 04
	LSR							;C - - - - - 0x016673 05:8663: 4A
	LSR							;C - - - - - 0x016674 05:8664: 4A
	LDA ram_04AA				;C - - - - - 0x016675 05:8665: AD AA 04
	ROL							;C - - - - - 0x016678 05:8668: 2A
	AND #$03					;C - - - - - 0x016679 05:8669: 29 03
	CLC							;C - - - - - 0x01667B 05:866B: 18
	ADC scratch2				;C - - - - - 0x01667C 05:866C: 65 02
	LSR							;C - - - - - 0x01667E 05:866E: 4A
	LSR							;C - - - - - 0x01667F 05:866F: 4A
	STA ram_00D5				;C - - - - - 0x016680 05:8670: 85 D5
	LDA ram_00AC,X				;C - - - - - 0x016682 05:8672: B5 AC
	CMP scratch1				;C - - - - - 0x016684 05:8674: C5 01
	BCS CODE_0B8680				;C - - - - - 0x016686 05:8676: B0 08
		LDA ram_00D5				;C - - - - - 0x016688 05:8678: A5 D5
		EOR #$FF					;C - - - - - 0x01668A 05:867A: 49 FF
		STA ram_00D5				;C - - - - - 0x01668C 05:867C: 85 D5
		INC ram_00D5				;C - - - - - 0x01668E 05:867E: E6 D5
CODE_0B8680:
	INC ram_00AC,X				;C - - - - - 0x016690 05:8680: F6 AC
	LDA ram_00AC,X				;C - - - - - 0x016692 05:8682: B5 AC
	CMP scratch0				;C - - - - - 0x016694 05:8684: C5 00
	BCC CODE_0B8690				;C - - - - - 0x016696 05:8686: 90 08
		LDA #$01					;C - - - - - 0x016698 05:8688: A9 01
		STA ram_00CA				;C - - - - - 0x01669A 05:868A: 85 CA
		LDA #$00					;C - - - - - 0x01669C 05:868C: A9 00
		STA ram_00AC,X				;C - - - - - 0x01669E 05:868E: 95 AC
CODE_0B8690:
	RTS							;C - - - - - 0x0166A0 05:8690: 60

DATA_0B8691:
	.byte $0D					;- D 0 - - - 0x0166A1 05:8691: 0D
	.byte $07					;- D 0 - - - 0x0166A2 05:8692: 07

CODE_0B8693:
	LDY enemyDir,X				;C - - - - - 0x0166A3 05:8693: B4 A2
	LDA DATA_0B86B2,Y			;C - - - - - 0x0166A5 05:8695: B9 B2 86
	CMP objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0166A8 05:8698: DD 84 06
	BEQ CODE_0B86A0				;C - - - - - 0x0166AB 05:869B: F0 03
		JSR StartEnemyAnim2				;C - - - - - 0x0166AD 05:869D: 20 C2 9E
CODE_0B86A0:
	LDA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x0166B0 05:86A0: BD D4 06
	CMP #$03					;C - - - - - 0x0166B3 05:86A3: C9 03
	BNE CODE_0B86B1				;C - - - - - 0x0166B5 05:86A5: D0 0A
		LDA DATA_0B86B5,Y			;C - - - - - 0x0166B7 05:86A7: B9 B5 86
		JSR StartEnemyAnim2				;C - - - - - 0x0166BA 05:86AA: 20 C2 9E
		LDA #$01					;C - - - - - 0x0166BD 05:86AD: A9 01
		STA ram_00CA				;C - - - - - 0x0166BF 05:86AF: 85 CA
CODE_0B86B1:
	RTS							;C - - - - - 0x0166C1 05:86B1: 60

DATA_0B86B2:
	.byte $00					;- - - - - - 0x0166C2 05:86B2: 00
	.byte anZenChanTurnL_ID					;- D 0 - - - 0x0166C3 05:86B3: 69
	.byte anZenChanTurnR_ID					;- D 0 - - - 0x0166C4 05:86B4: 6D

DATA_0B86B5:
	.byte $00					;- - - - - - 0x0166C5 05:86B5: 00
	.byte anZenChanL_ID					;- D 0 - - - 0x0166C6 05:86B6: 3C
	.byte anZenChanR_ID					;- D 0 - - - 0x0166C7 05:86B7: 3D

CODE_0B86B8:
	LDY enemyDir,X				;C - - - - - 0x0166C8 05:86B8: B4 A2
	LDA DATA_0B86D7,Y			;C - - - - - 0x0166CA 05:86BA: B9 D7 86
	CMP objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0166CD 05:86BD: DD 84 06
	BEQ CODE_0B86C5				;C - - - - - 0x0166D0 05:86C0: F0 03
		JSR StartEnemyAnim2				;C - - - - - 0x0166D2 05:86C2: 20 C2 9E
CODE_0B86C5:
	LDA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x0166D5 05:86C5: BD D4 06
	CMP #$07					;C - - - - - 0x0166D8 05:86C8: C9 07
	BNE CODE_0B86D6				;C - - - - - 0x0166DA 05:86CA: D0 0A
		LDA DATA_0B86B5,Y			;C - - - - - 0x0166DC 05:86CC: B9 B5 86
		JSR StartEnemyAnim2				;C - - - - - 0x0166DF 05:86CF: 20 C2 9E
		LDA #$05					;C - - - - - 0x0166E2 05:86D2: A9 05
		STA ram_00CA				;C - - - - - 0x0166E4 05:86D4: 85 CA
CODE_0B86D6:
	RTS							;C - - - - - 0x0166E6 05:86D6: 60

DATA_0B86D7:
	.byte $00					;- - - - - - 0x0166E7 05:86D7: 00
	.byte anZenChanLookAroundL_ID					;- D 0 - - - 0x0166E8 05:86D8: FC
	.byte anZenChanLookAroundR_ID					;- D 0 - - - 0x0166E9 05:86D9: FD

BanebouUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x0166EA 05:86DA: AD D4 04
	BEQ CODE_0B86E2				;C - - - - - 0x0166ED 05:86DD: F0 03
		;Unreached
		JMP CODE_0B8799				;- - - - - - 0x0166EF 05:86DF: 4C
CODE_0B86E2:
	LDA projTouchingPlayer				;C - - - - - 0x0166F2 05:86E2: A5 CE
	AND #$C0					;C - - - - - 0x0166F4 05:86E4: 29 C0
	BEQ CODE_0B86EE				;C - - - - - 0x0166F6 05:86E6: F0 06
		LDA enemyDir,X				;C - - - - - 0x0166F8 05:86E8: B5 A2
		EOR #$03					;C - - - - - 0x0166FA 05:86EA: 49 03
		STA enemyDir,X				;C - - - - - 0x0166FC 05:86EC: 95 A2
CODE_0B86EE:
	JSR CODE_0B879D				;C - - - - - 0x0166FE 05:86EE: 20 9D 87
	LDY ram_00AC,X				;C - - - - - 0x016701 05:86F1: B4 AC
	LDA ram_00CA				;C - - - - - 0x016703 05:86F3: A5 CA
	CMP #$01					;C - - - - - 0x016705 05:86F5: C9 01
	BEQ CODE_0B8708				;C - - - - - 0x016707 05:86F7: F0 0F

	CMP #$02					;C - - - - - 0x016709 05:86F9: C9 02
	BEQ CODE_0B8730				;C - - - - - 0x01670B 05:86FB: F0 33

	CMP #$03					;C - - - - - 0x01670D 05:86FD: C9 03
	BEQ CODE_0B874D				;C - - - - - 0x01670F 05:86FF: F0 4C

	CMP #$04					;C - - - - - 0x016711 05:8701: C9 04
	BEQ CODE_0B8775				;C - - - - - 0x016713 05:8703: F0 70
		JMP CODE_0B8799				;C - - - - - 0x016715 05:8705: 4C 99 87
CODE_0B8708:
	LDA enemyReward,X				;C - - - - - 0x016718 05:8708: B5 8E
	BEQ CODE_0B871A				;C - - - - - 0x01671A 05:870A: F0 0E
		LDA #$0E					;C - - - - - 0x01671C 05:870C: A9 0E
		STA scratch0				;C - - - - - 0x01671E 05:870E: 85 00
		LDA #$08					;C - - - - - 0x016720 05:8710: A9 08
		STA ram_00D4				;C - - - - - 0x016722 05:8712: 85 D4
		LDA DATA_0CBCFA,Y			;C - - - - - 0x016724 05:8714: B9 FA BC
		JMP CODE_0B8725				;C - - - - - 0x016727 05:8717: 4C 25 87
CODE_0B871A:
	LDA #$1A					;C - - - - - 0x01672A 05:871A: A9 1A
	STA scratch0				;C - - - - - 0x01672C 05:871C: 85 00
	LDA #$04					;C - - - - - 0x01672E 05:871E: A9 04
	STA ram_00D4				;C - - - - - 0x016730 05:8720: 85 D4
	LDA DATA_0CBCE0,Y			;C - - - - - 0x016732 05:8722: B9 E0 BC
CODE_0B8725:
	STA scratch2				;C - - - - - 0x016735 05:8725: 85 02
	JSR CODE_0B8836				;C - - - - - 0x016737 05:8727: 20 36 88
	JSR CODE_0B849D				;C - - - - - 0x01673A 05:872A: 20 9D 84
	JMP CODE_0B8799				;C - - - - - 0x01673D 05:872D: 4C 99 87
CODE_0B8730:
	LDA enemyReward,X				;C - - - - - 0x016740 05:8730: B5 8E
	BEQ CODE_0B873E				;C - - - - - 0x016742 05:8732: F0 0A
		LDA #$0E					;C - - - - - 0x016744 05:8734: A9 0E
		STA scratch0				;C - - - - - 0x016746 05:8736: 85 00
		LDA DATA_0CBCD2,Y			;C - - - - - 0x016748 05:8738: B9 D2 BC
		JMP CODE_0B8745				;C - - - - - 0x01674B 05:873B: 4C 45 87
CODE_0B873E:
	LDA #$1C					;C - - - - - 0x01674E 05:873E: A9 1C
	STA scratch0				;C - - - - - 0x016750 05:8740: 85 00
	LDA DATA_0CBCB6,Y			;C - - - - - 0x016752 05:8742: B9 B6 BC
CODE_0B8745:
	STA scratch2				;C - - - - - 0x016755 05:8745: 85 02
	JSR CODE_0B8836				;C - - - - - 0x016757 05:8747: 20 36 88
	JMP CODE_0B8799				;C - - - - - 0x01675A 05:874A: 4C 99 87

CODE_0B874D:
	;Unreached
	LDA enemyReward,X				;- - - - - - 0x01675D 05:874D: B5
	BEQ CODE_0B875F				;- - - - - - 0x01675F 05:874F: F0
		LDA #$0E					;- - - - - - 0x016761 05:8751: A9
		STA scratch0				;- - - - - - 0x016763 05:8753: 85
		LDA #$08					;- - - - - - 0x016765 05:8755: A9
		STA ram_00D4				;- - - - - - 0x016767 05:8757: 85
		LDA DATA_0CBCFA,Y			;- - - - - - 0x016769 05:8759: B9
		JMP CODE_0B8766				;- - - - - - 0x01676C 05:875C: 4C
CODE_0B875F:
	;Unreached
	LDA #$34					;- - - - - - 0x01676F 05:875F: A9
	STA scratch0				;- - - - - - 0x016771 05:8761: 85
	LDA DATA_0CBCE0,Y			;- - - - - - 0x016773 05:8763: B9
CODE_0B8766:
	STA scratch2				;- - - - - - 0x016776 05:8766: 85
	JSR CODE_0B8836				;- - - - - - 0x016778 05:8768: 20
	LDA #$08					;- - - - - - 0x01677B 05:876B: A9
	STA ram_00D4				;- - - - - - 0x01677D 05:876D: 85
	JSR CODE_0B849D				;- - - - - - 0x01677F 05:876F: 20
	JMP CODE_0B8799				;- - - - - - 0x016782 05:8772: 4C

CODE_0B8775:
	LDA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x016785 05:8775: BD D4 06
	CMP #$06					;C - - - - - 0x016788 05:8778: C9 06
	BEQ CODE_0B8788				;C - - - - - 0x01678A 05:877A: F0 0C
	LDA ram_00AC,X				;C - - - - - 0x01678C 05:877C: B5 AC
	CMP #$02					;C - - - - - 0x01678E 05:877E: C9 02
	BNE CODE_0B8791				;C - - - - - 0x016790 05:8780: D0 0F
		;Unreached
		INC objAnimProgress+OSLOT_ENEMY,X				;- - - - - - 0x016792 05:8782: FE
		JMP CODE_0B8791				;- - - - - - 0x016795 05:8785: 4C
CODE_0B8788:
	LDA #$05					;C - - - - - 0x016798 05:8788: A9 05
	STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x01679A 05:878A: 9D D4 06
	LDA #$00					;C - - - - - 0x01679D 05:878D: A9 00
	STA ram_00AC,X				;C - - - - - 0x01679F 05:878F: 95 AC
CODE_0B8791:
	LDA #$00					;C - - - - - 0x0167A1 05:8791: A9 00
	STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x0167A3 05:8793: 9D AC 06
	JSR CODE_0B8327				;C - - - - - 0x0167A6 05:8796: 20 27 83
CODE_0B8799:
	JSR CODE_0B842F				;C - - - - - 0x0167A9 05:8799: 20 2F 84
	RTS							;C - - - - - 0x0167AC 05:879C: 60

CODE_0B879D:
	LDA ram_00CA				;C - - - - - 0x0167AD 05:879D: A5 CA
	CMP #$0B					;C - - - - - 0x0167AF 05:879F: C9 0B
	BCC CODE_0B87A6				;C - - - - - 0x0167B1 05:87A1: 90 03
		JMP CODE_0B8822				;C - - - - - 0x0167B3 05:87A3: 4C 22 88
CODE_0B87A6:
	LDA ram_00AC,X				;C - - - - - 0x0167B6 05:87A6: B5 AC
	BEQ CODE_0B87B3				;C - - - - - 0x0167B8 05:87A8: F0 09
		LDA ram_00CD				;C - - - - - 0x0167BA 05:87AA: A5 CD
		CMP #$80					;C - - - - - 0x0167BC 05:87AC: C9 80
		BCS CODE_0B87CE				;C - - - - - 0x0167BE 05:87AE: B0 1E
			JMP CODE_0B8822				;C - - - - - 0x0167C0 05:87B0: 4C 22 88
CODE_0B87B3:
	LDA #$06					;C - - - - - 0x0167C3 05:87B3: A9 06
	STA ram_04AF,X				;C - - - - - 0x0167C5 05:87B5: 9D AF 04
	LDA ram_00CD				;C - - - - - 0x0167C8 05:87B8: A5 CD
	CMP #$80					;C - - - - - 0x0167CA 05:87BA: C9 80
	BCS CODE_0B87CE				;C - - - - - 0x0167CC 05:87BC: B0 10
		LDA #$04					;C - - - - - 0x0167CE 05:87BE: A9 04
		STA ram_00CA				;C - - - - - 0x0167D0 05:87C0: 85 CA
		LDA #$09					;C - - - - - 0x0167D2 05:87C2: A9 09
		STA ram_04AF,X				;C - - - - - 0x0167D4 05:87C4: 9D AF 04
		LDA #$00					;C - - - - - 0x0167D7 05:87C7: A9 00
		STA ram_00AC,X				;C - - - - - 0x0167D9 05:87C9: 95 AC
		JMP CODE_0B8822				;C - - - - - 0x0167DB 05:87CB: 4C 22 88
CODE_0B87CE:
	AND #$0F					;C - - - - - 0x0167DE 05:87CE: 29 0F
	EOR #$FF					;C - - - - - 0x0167E0 05:87D0: 49 FF
	STA ram_00D5				;C - - - - - 0x0167E2 05:87D2: 85 D5
	INC ram_00D5				;C - - - - - 0x0167E4 05:87D4: E6 D5
	LDA objY				;C - - - - - 0x0167E6 05:87D6: AD 8B 05
	CLC							;C - - - - - 0x0167E9 05:87D9: 18
	ADC #$03					;C - - - - - 0x0167EA 05:87DA: 69 03
	CMP objY+OSLOT_ENEMY,X				;C - - - - - 0x0167EC 05:87DC: DD 94 05
	BCS CODE_0B87FA				;C - - - - - 0x0167EF 05:87DF: B0 19
		LDA #$07					;C - - - - - 0x0167F1 05:87E1: A9 07
		STA ram_04AF,X				;C - - - - - 0x0167F3 05:87E3: 9D AF 04
		LDA ram_00CF				;C - - - - - 0x0167F6 05:87E6: A5 CF
		CMP #$80					;C - - - - - 0x0167F8 05:87E8: C9 80
		BCC CODE_0B87F3				;C - - - - - 0x0167FA 05:87EA: 90 07
			LDA #$02					;C - - - - - 0x0167FC 05:87EC: A9 02
			STA ram_00CA				;C - - - - - 0x0167FE 05:87EE: 85 CA
			JMP CODE_0B8822				;C - - - - - 0x016800 05:87F0: 4C 22 88
	CODE_0B87F3:
		LDA #$01					;C - - - - - 0x016803 05:87F3: A9 01
		STA ram_00CA				;C - - - - - 0x016805 05:87F5: 85 CA
		JMP CODE_0B8822				;C - - - - - 0x016807 05:87F7: 4C 22 88
CODE_0B87FA:
	LDA objY				;C - - - - - 0x01680A 05:87FA: AD 8B 05
	CMP objY+OSLOT_ENEMY,X				;C - - - - - 0x01680D 05:87FD: DD 94 05
	BNE CODE_0B881E				;C - - - - - 0x016810 05:8800: D0 1C
		;Unreached
		LDA ram_00AC,X				;- - - - - - 0x016812 05:8802: B5
		BNE CODE_0B8822				;- - - - - - 0x016814 05:8804: D0
			LDA objX				;- - - - - - 0x016816 05:8806: AD
			CMP objX+OSLOT_ENEMY,X				;- - - - - - 0x016819 05:8809: DD
			BCS CODE_0B8813				;- - - - - - 0x01681C 05:880C: B0
				LDA #$01					;- - - - - - 0x01681E 05:880E: A9
				JMP CODE_0B8815				;- - - - - - 0x016820 05:8810: 4C
		CODE_0B8813:
			LDA #$02					;- - - - - - 0x016823 05:8813: A9
		CODE_0B8815:
			STA enemyDir,X				;- - - - - - 0x016825 05:8815: 95
			LDA #$03					;- - - - - - 0x016827 05:8817: A9
			STA ram_00CA				;- - - - - - 0x016829 05:8819: 85
			JMP CODE_0B8822				;- - - - - - 0x01682B 05:881B: 4C
CODE_0B881E:
	LDA #$01					;C - - - - - 0x01682E 05:881E: A9 01
	STA ram_00CA				;C - - - - - 0x016830 05:8820: 85 CA
CODE_0B8822:
	LDA enemyMad,X				;C - - - - - 0x016832 05:8822: B5 63
	BEQ CODE_0B8831				;C - - - - - 0x016834 05:8824: F0 0B
		LDA ram_00AC,X				;C - - - - - 0x016836 05:8826: B5 AC
		BNE CODE_0B8835				;C - - - - - 0x016838 05:8828: D0 0B
			LDA #$01					;C - - - - - 0x01683A 05:882A: A9 01
			STA enemyReward,X				;C - - - - - 0x01683C 05:882C: 95 8E
			JMP CODE_0B8835				;C - - - - - 0x01683E 05:882E: 4C 35 88
CODE_0B8831:
	LDA #$00					;C - - - - - 0x016841 05:8831: A9 00
	STA enemyReward,X				;C - - - - - 0x016843 05:8833: 95 8E
CODE_0B8835:
	RTS							;C - - - - - 0x016845 05:8835: 60

CODE_0B8836:
	LDA ram_04AA				;C - - - - - 0x016846 05:8836: AD AA 04
	LSR							;C - - - - - 0x016849 05:8839: 4A
	LSR							;C - - - - - 0x01684A 05:883A: 4A
	LDA ram_04AA				;C - - - - - 0x01684B 05:883B: AD AA 04
	ROL							;C - - - - - 0x01684E 05:883E: 2A
	AND #$03					;C - - - - - 0x01684F 05:883F: 29 03
	CLC							;C - - - - - 0x016851 05:8841: 18
	ADC scratch2				;C - - - - - 0x016852 05:8842: 65 02
	LSR							;C - - - - - 0x016854 05:8844: 4A
	LSR							;C - - - - - 0x016855 05:8845: 4A
	STA scratch4				;C - - - - - 0x016856 05:8846: 85 04
	LDA ram_00CA				;C - - - - - 0x016858 05:8848: A5 CA
	CMP #$02					;C - - - - - 0x01685A 05:884A: C9 02
	BEQ CODE_0B885F				;C - - - - - 0x01685C 05:884C: F0 11
		LDY enemyMad,X				;C - - - - - 0x01685E 05:884E: B4 63
		LDA ram_00AC,X				;C - - - - - 0x016860 05:8850: B5 AC
		CMP DATA_0B8691,Y			;C - - - - - 0x016862 05:8852: D9 91 86
		BCC CODE_0B885F				;C - - - - - 0x016865 05:8855: 90 08
			LDA scratch4				;C - - - - - 0x016867 05:8857: A5 04
			EOR #$FF					;C - - - - - 0x016869 05:8859: 49 FF
			STA scratch4				;C - - - - - 0x01686B 05:885B: 85 04
			INC scratch4				;C - - - - - 0x01686D 05:885D: E6 04
CODE_0B885F:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01686F 05:885F: BD 94 05
	SEC							;C - - - - - 0x016872 05:8862: 38
	SBC scratch4				;C - - - - - 0x016873 05:8863: E5 04
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x016875 05:8865: 9D 94 05
	INC ram_00AC,X				;C - - - - - 0x016878 05:8868: F6 AC
	LDA ram_00AC,X				;C - - - - - 0x01687A 05:886A: B5 AC
	CMP scratch0				;C - - - - - 0x01687C 05:886C: C5 00
	BCC CODE_0B8885				;C - - - - - 0x01687E 05:886E: 90 15
		LDA #$00					;C - - - - - 0x016880 05:8870: A9 00
		STA ram_00AC,X				;C - - - - - 0x016882 05:8872: 95 AC
		LDA ram_00CD				;C - - - - - 0x016884 05:8874: A5 CD
		AND #$0F					;C - - - - - 0x016886 05:8876: 29 0F
		BEQ CODE_0B8885				;C - - - - - 0x016888 05:8878: F0 0B
			STA scratch4				;C - - - - - 0x01688A 05:887A: 85 04
			LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01688C 05:887C: BD 94 05
			SEC							;C - - - - - 0x01688F 05:887F: 38
			SBC scratch4				;C - - - - - 0x016890 05:8880: E5 04
			STA objY+OSLOT_ENEMY,X				;C - - - - - 0x016892 05:8882: 9D 94 05
CODE_0B8885:
	LDY ram_00AC,X				;C - - - - - 0x016895 05:8885: B4 AC
	LDA enemyReward,X				;C - - - - - 0x016897 05:8887: B5 8E
	BNE CODE_0B889D				;C - - - - - 0x016899 05:8889: D0 12
		LDA ram_00CA				;C - - - - - 0x01689B 05:888B: A5 CA
		CMP #$02					;C - - - - - 0x01689D 05:888D: C9 02
		BNE CODE_0B8897				;C - - - - - 0x01689F 05:888F: D0 06
			LDA DATA_0CBD20,Y			;C - - - - - 0x0168A1 05:8891: B9 20 BD
			JMP CODE_0B88A0				;C - - - - - 0x0168A4 05:8894: 4C A0 88
	CODE_0B8897:
		LDA DATA_0CBD54,Y			;C - - - - - 0x0168A7 05:8897: B9 54 BD
		JMP CODE_0B88A0				;C - - - - - 0x0168AA 05:889A: 4C A0 88
CODE_0B889D:
	LDA DATA_0CBD6E,Y			;C - - - - - 0x0168AD 05:889D: B9 6E BD
CODE_0B88A0:
	CMP #$0A					;C - - - - - 0x0168B0 05:88A0: C9 0A
	BCC CODE_0B88A6				;C - - - - - 0x0168B2 05:88A2: 90 02
		;Unreached
		AND #$07					;- - - - - - 0x0168B4 05:88A4: 29
CODE_0B88A6:
	STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x0168B6 05:88A6: 9D D4 06
	LDA #$00					;C - - - - - 0x0168B9 05:88A9: A9 00
	STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x0168BB 05:88AB: 9D AC 06
	RTS							;C - - - - - 0x0168BE 05:88AE: 60

BlobbyUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x0168BF 05:88AF: AD D4 04
	BNE CODE_0B88E5				;C - - - - - 0x0168C2 05:88B2: D0 31

	LDA ram_00CA				;C - - - - - 0x0168C4 05:88B4: A5 CA
	CMP #$80					;C - - - - - 0x0168C6 05:88B6: C9 80
	BCS CODE_0B88E5				;C - - - - - 0x0168C8 05:88B8: B0 2B

	LDA enemyReward,X				;C - - - - - 0x0168CA 05:88BA: B5 8E
	BNE CODE_0B88C2				;C - - - - - 0x0168CC 05:88BC: D0 04
		LDA #$01					;C - - - - - 0x0168CE 05:88BE: A9 01
		STA enemyReward,X				;C - - - - - 0x0168D0 05:88C0: 95 8E
CODE_0B88C2:
	ASL							;C - - - - - 0x0168D2 05:88C2: 0A
	TAY							;C - - - - - 0x0168D3 05:88C3: A8
	LDA DATA_0B88F7,Y			;C - - - - - 0x0168D4 05:88C4: B9 F7 88
	STA scratch6				;C - - - - - 0x0168D7 05:88C7: 85 06
	LDA DATA_0B88F7+1,Y			;C - - - - - 0x0168D9 05:88C9: B9 F8 88
	STA scratch7				;C - - - - - 0x0168DC 05:88CC: 85 07
	LDA #.HIBYTE(@ret-1)					;C - - - - - 0x0168DE 05:88CE: A9 88
	PHA							;C - - - - - 0x0168E0 05:88D0: 48
	LDA #.LOBYTE(@ret-1)					;C - - - - - 0x0168E1 05:88D1: A9 D6
	PHA							;C - - - - - 0x0168E3 05:88D3: 48
	JMP (scratch6)				;C - - - - - 0x0168E4 05:88D4: 6C 06 00
@ret:
	LDY enemyReward,X				;C - - - - - 0x0168E7 05:88D7: B4 8E
	LDA DATA_0B88E9,Y			;C - - - - - 0x0168E9 05:88D9: B9 E9 88
	STA ram_04AF,X				;C - - - - - 0x0168EC 05:88DC: 9D AF 04
	JSR CODE_0B8A82				;C - - - - - 0x0168EF 05:88DF: 20 82 8A
	JSR CODE_0B8AA1				;C - - - - - 0x0168F2 05:88E2: 20 A1 8A
CODE_0B88E5:
	JSR CODE_0B842F				;C - - - - - 0x0168F5 05:88E5: 20 2F 84
	RTS							;C - - - - - 0x0168F8 05:88E8: 60

DATA_0B88E9:
	.byte $00					;- - - - - - 0x0168F9 05:88E9: 00
	.byte $0B					;- D 0 - - - 0x0168FA 05:88EA: 0B
	.byte $0C					;- D 0 - - - 0x0168FB 05:88EB: 0C
	.byte $0E					;- D 0 - - - 0x0168FC 05:88EC: 0E
	.byte $0D					;- D 0 - - - 0x0168FD 05:88ED: 0D
	.byte $0E					;- D 0 - - - 0x0168FE 05:88EE: 0E
	.byte $0E					;- D 0 - - - 0x0168FF 05:88EF: 0E
	.byte $0D					;- D 0 - - - 0x016900 05:88F0: 0D
	.byte $0D					;- D 0 - - - 0x016901 05:88F1: 0D
	.byte $0D					;- D 0 - - - 0x016902 05:88F2: 0D
	.byte $0D					;- D 0 - - - 0x016903 05:88F3: 0D
	.byte $0E					;- D 0 - - - 0x016904 05:88F4: 0E
	.byte $0E					;- D 0 - - - 0x016905 05:88F5: 0E
	.byte $0F					;- D 0 - - - 0x016906 05:88F6: 0F
DATA_0B88F7:
	;- - - - - - 0x016907 05:88F7: 13
	.word CODE_0B8913
	.word CODE_0B8913
	.word CODE_0B8955
	.word CODE_0B8993
	.word CODE_0B89E1
	.word CODE_0B8A33
	.word CODE_0B8A33
	.word CODE_0B8A33
	.word CODE_0B8A33
	.word CODE_0B8A33
	.word CODE_0B8A33
	.word CODE_0B8A33
	.word CODE_0B8A33
	.word CODE_0B8A6A

CODE_0B8913:
	LDY enemyDir,X				;C - - - - - 0x016923 05:8913: B4 A2
	LDA projTouchingPlayer				;C - - - - - 0x016925 05:8915: A5 CE
	AND #$C0					;C - - - - - 0x016927 05:8917: 29 C0
	BEQ CODE_0B8927				;C - - - - - 0x016929 05:8919: F0 0C
		LDA DATA_0B894F,Y			;C - - - - - 0x01692B 05:891B: B9 4F 89
		STA enemyReward,X				;C - - - - - 0x01692E 05:891E: 95 8E
		LDA #$01					;C - - - - - 0x016930 05:8920: A9 01
		STA ram_00CA				;C - - - - - 0x016932 05:8922: 85 CA
		JMP CODE_0B894E				;C - - - - - 0x016934 05:8924: 4C 4E 89
CODE_0B8927:
	LDA ram_00CD				;C - - - - - 0x016937 05:8927: A5 CD
	AND #$C0					;C - - - - - 0x016939 05:8929: 29 C0
	BNE CODE_0B8934				;C - - - - - 0x01693B 05:892B: D0 07
		LDA #$0D					;C - - - - - 0x01693D 05:892D: A9 0D
		STA enemyReward,X				;C - - - - - 0x01693F 05:892F: 95 8E
		JMP CODE_0B894E				;C - - - - - 0x016941 05:8931: 4C 4E 89
CODE_0B8934:
	AND #$40					;C - - - - - 0x016944 05:8934: 29 40
	BNE CODE_0B8944				;C - - - - - 0x016946 05:8936: D0 0C
		LDA DATA_0B8952,Y			;C - - - - - 0x016948 05:8938: B9 52 89
		STA enemyReward,X				;C - - - - - 0x01694B 05:893B: 95 8E
		LDA #$02					;C - - - - - 0x01694D 05:893D: A9 02
		STA ram_00CA				;C - - - - - 0x01694F 05:893F: 85 CA
		JMP CODE_0B894E				;C - - - - - 0x016951 05:8941: 4C 4E 89
CODE_0B8944:
	LDA ram_00CD				;C - - - - - 0x016954 05:8944: A5 CD
	AND #$07					;C - - - - - 0x016956 05:8946: 29 07
	EOR #$FF					;C - - - - - 0x016958 05:8948: 49 FF
	STA ram_00D5				;C - - - - - 0x01695A 05:894A: 85 D5
	INC ram_00D5				;C - - - - - 0x01695C 05:894C: E6 D5
CODE_0B894E:
	RTS							;C - - - - - 0x01695E 05:894E: 60

DATA_0B894F:
	.byte $00					;- - - - - - 0x01695F 05:894F: 00
	.byte $05					;- D 0 - - - 0x016960 05:8950: 05
	.byte $08					;- D 0 - - - 0x016961 05:8951: 08
DATA_0B8952:
	.byte $00					;- - - - - - 0x016962 05:8952: 00
	.byte $0A					;- D 0 - - - 0x016963 05:8953: 0A
	.byte $0B					;- D 0 - - - 0x016964 05:8954: 0B

CODE_0B8955:
	LDY enemyDir,X				;C - - - - - 0x016965 05:8955: B4 A2
	LDA projTouchingPlayer				;C - - - - - 0x016967 05:8957: A5 CE
	AND #$C0					;C - - - - - 0x016969 05:8959: 29 C0
	BEQ CODE_0B8969				;C - - - - - 0x01696B 05:895B: F0 0C
		LDA DATA_0B898D,Y			;C - - - - - 0x01696D 05:895D: B9 8D 89
		STA enemyReward,X				;C - - - - - 0x016970 05:8960: 95 8E
		LDA #$02					;C - - - - - 0x016972 05:8962: A9 02
		STA ram_00CA				;C - - - - - 0x016974 05:8964: 85 CA
		JMP CODE_0B894E				;C - - - - - 0x016976 05:8966: 4C 4E 89
CODE_0B8969:
	LDA ram_00CF				;C - - - - - 0x016979 05:8969: A5 CF
	AND #$C0					;C - - - - - 0x01697B 05:896B: 29 C0
	BNE CODE_0B8976				;C - - - - - 0x01697D 05:896D: D0 07
		LDA #$0D					;C - - - - - 0x01697F 05:896F: A9 0D
		STA enemyReward,X				;C - - - - - 0x016981 05:8971: 95 8E
		JMP CODE_0B898C				;C - - - - - 0x016983 05:8973: 4C 8C 89
CODE_0B8976:
	AND #$40					;C - - - - - 0x016986 05:8976: 29 40
	BNE CODE_0B8986				;C - - - - - 0x016988 05:8978: D0 0C
		LDA DATA_0B8990,Y			;C - - - - - 0x01698A 05:897A: B9 90 89
		STA enemyReward,X				;C - - - - - 0x01698D 05:897D: 95 8E
		LDA #$01					;C - - - - - 0x01698F 05:897F: A9 01
		STA ram_00CA				;C - - - - - 0x016991 05:8981: 85 CA
		JMP CODE_0B898C				;C - - - - - 0x016993 05:8983: 4C 8C 89
CODE_0B8986:
	LDA ram_00CF				;C - - - - - 0x016996 05:8986: A5 CF
	AND #$07					;C - - - - - 0x016998 05:8988: 29 07
	STA ram_00D5				;C - - - - - 0x01699A 05:898A: 85 D5
CODE_0B898C:
	RTS							;C - - - - - 0x01699C 05:898C: 60

DATA_0B898D:
	.byte $00					;- - - - - - 0x01699D 05:898D: 00
	.byte $06					;- D 0 - - - 0x01699E 05:898E: 06
	.byte $07					;- D 0 - - - 0x01699F 05:898F: 07
DATA_0B8990:
	.byte $00					;- - - - - - 0x0169A0 05:8990: 00
	.byte $09					;- D 0 - - - 0x0169A1 05:8991: 09
	.byte $0C					;- D 0 - - - 0x0169A2 05:8992: 0C

CODE_0B8993:
	LDA ram_00CA				;C - - - - - 0x0169A3 05:8993: A5 CA
	CMP #$01					;C - - - - - 0x0169A5 05:8995: C9 01
	BNE CODE_0B89BB				;C - - - - - 0x0169A7 05:8997: D0 22
		LDA ram_00CF				;C - - - - - 0x0169A9 05:8999: A5 CF
		AND #$C0					;C - - - - - 0x0169AB 05:899B: 29 C0
		BEQ CODE_0B89AA				;C - - - - - 0x0169AD 05:899D: F0 0B
			LDA #$06					;C - - - - - 0x0169AF 05:899F: A9 06
			STA enemyReward,X				;C - - - - - 0x0169B1 05:89A1: 95 8E
			LDA #$02					;C - - - - - 0x0169B3 05:89A3: A9 02
			STA enemyDir,X				;C - - - - - 0x0169B5 05:89A5: 95 A2
			JMP CODE_0B89DA				;C - - - - - 0x0169B7 05:89A7: 4C DA 89
	CODE_0B89AA:
		LDA projTouchingPlayer				;C - - - - - 0x0169BA 05:89AA: A5 CE
		AND #$C0					;C - - - - - 0x0169BC 05:89AC: 29 C0
		BNE CODE_0B89DA				;C - - - - - 0x0169BE 05:89AE: D0 2A

		LDA #$0B					;C - - - - - 0x0169C0 05:89B0: A9 0B
		STA enemyReward,X				;C - - - - - 0x0169C2 05:89B2: 95 8E
		LDA #$01					;C - - - - - 0x0169C4 05:89B4: A9 01
		STA enemyDir,X				;C - - - - - 0x0169C6 05:89B6: 95 A2
		JMP CODE_0B89DA				;C - - - - - 0x0169C8 05:89B8: 4C DA 89
CODE_0B89BB:
	LDA ram_00CD				;C - - - - - 0x0169CB 05:89BB: A5 CD
	AND #$C0					;C - - - - - 0x0169CD 05:89BD: 29 C0
	BEQ CODE_0B89CC				;C - - - - - 0x0169CF 05:89BF: F0 0B
		LDA #$05					;C - - - - - 0x0169D1 05:89C1: A9 05
		STA enemyReward,X				;C - - - - - 0x0169D3 05:89C3: 95 8E
		LDA #$02					;C - - - - - 0x0169D5 05:89C5: A9 02
		STA enemyDir,X				;C - - - - - 0x0169D7 05:89C7: 95 A2
		JMP CODE_0B89DA				;C - - - - - 0x0169D9 05:89C9: 4C DA 89
CODE_0B89CC:
	LDA projTouchingPlayer				;C - - - - - 0x0169DC 05:89CC: A5 CE
	AND #$C0					;C - - - - - 0x0169DE 05:89CE: 29 C0
	BNE CODE_0B89DA				;C - - - - - 0x0169E0 05:89D0: D0 08
		LDA #$0C					;C - - - - - 0x0169E2 05:89D2: A9 0C
		STA enemyReward,X				;C - - - - - 0x0169E4 05:89D4: 95 8E
		LDA #$01					;C - - - - - 0x0169E6 05:89D6: A9 01
		STA enemyDir,X				;C - - - - - 0x0169E8 05:89D8: 95 A2
CODE_0B89DA:
	LDA projTouchingPlayer				;C - - - - - 0x0169EA 05:89DA: A5 CE
	AND #$07					;C - - - - - 0x0169EC 05:89DC: 29 07
	STA ram_00D4				;C - - - - - 0x0169EE 05:89DE: 85 D4
	RTS							;C - - - - - 0x0169F0 05:89E0: 60

CODE_0B89E1:
	LDA ram_00CA				;C - - - - - 0x0169F1 05:89E1: A5 CA
	CMP #$01					;C - - - - - 0x0169F3 05:89E3: C9 01
	BNE CODE_0B8A09				;C - - - - - 0x0169F5 05:89E5: D0 22
		LDA ram_00CF				;C - - - - - 0x0169F7 05:89E7: A5 CF
		AND #$C0					;C - - - - - 0x0169F9 05:89E9: 29 C0
		BEQ CODE_0B89F8				;C - - - - - 0x0169FB 05:89EB: F0 0B
			LDA #$07					;C - - - - - 0x0169FD 05:89ED: A9 07
			STA enemyReward,X				;C - - - - - 0x0169FF 05:89EF: 95 8E
			LDA #$01					;C - - - - - 0x016A01 05:89F1: A9 01
			STA enemyDir,X				;C - - - - - 0x016A03 05:89F3: 95 A2
			JMP CODE_0B8A28				;C - - - - - 0x016A05 05:89F5: 4C 28 8A
	CODE_0B89F8:
		LDA projTouchingPlayer				;C - - - - - 0x016A08 05:89F8: A5 CE
		AND #$C0					;C - - - - - 0x016A0A 05:89FA: 29 C0
		BNE CODE_0B8A28				;C - - - - - 0x016A0C 05:89FC: D0 2A
			LDA #$0A					;C - - - - - 0x016A0E 05:89FE: A9 0A
			STA enemyReward,X				;C - - - - - 0x016A10 05:8A00: 95 8E
			LDA #$02					;C - - - - - 0x016A12 05:8A02: A9 02
			STA enemyDir,X				;C - - - - - 0x016A14 05:8A04: 95 A2
			JMP CODE_0B8A28				;C - - - - - 0x016A16 05:8A06: 4C 28 8A
CODE_0B8A09:
	LDA ram_00CD				;C - - - - - 0x016A19 05:8A09: A5 CD
	AND #$C0					;C - - - - - 0x016A1B 05:8A0B: 29 C0
	BEQ CODE_0B8A1A				;C - - - - - 0x016A1D 05:8A0D: F0 0B
		LDA #$08					;C - - - - - 0x016A1F 05:8A0F: A9 08
		STA enemyReward,X				;C - - - - - 0x016A21 05:8A11: 95 8E
		LDA #$01					;C - - - - - 0x016A23 05:8A13: A9 01
		STA enemyDir,X				;C - - - - - 0x016A25 05:8A15: 95 A2
		JMP CODE_0B8A28				;C - - - - - 0x016A27 05:8A17: 4C 28 8A
CODE_0B8A1A:
	LDA projTouchingPlayer				;C - - - - - 0x016A2A 05:8A1A: A5 CE
	AND #$C0					;C - - - - - 0x016A2C 05:8A1C: 29 C0
	BNE CODE_0B8A28				;C - - - - - 0x016A2E 05:8A1E: D0 08
		LDA #$09					;C - - - - - 0x016A30 05:8A20: A9 09
		STA enemyReward,X				;C - - - - - 0x016A32 05:8A22: 95 8E
		LDA #$02					;C - - - - - 0x016A34 05:8A24: A9 02
		STA enemyDir,X				;C - - - - - 0x016A36 05:8A26: 95 A2
CODE_0B8A28:
	LDA projTouchingPlayer				;C - - - - - 0x016A38 05:8A28: A5 CE
	AND #$07					;C - - - - - 0x016A3A 05:8A2A: 29 07
	EOR #$FF					;C - - - - - 0x016A3C 05:8A2C: 49 FF
	STA ram_00D4				;C - - - - - 0x016A3E 05:8A2E: 85 D4
	INC ram_00D4				;C - - - - - 0x016A40 05:8A30: E6 D4
	RTS							;C - - - - - 0x016A42 05:8A32: 60

CODE_0B8A33:
	LDA enemyReward,X				;C - - - - - 0x016A43 05:8A33: B5 8E
	SEC							;C - - - - - 0x016A45 05:8A35: 38
	SBC #$05					;C - - - - - 0x016A46 05:8A36: E9 05
	ASL							;C - - - - - 0x016A48 05:8A38: 0A
	CLC							;C - - - - - 0x016A49 05:8A39: 18
	ADC ram_00CA				;C - - - - - 0x016A4A 05:8A3A: 65 CA
	TAY							;C - - - - - 0x016A4C 05:8A3C: A8
	LDA DATA_0B8A48,Y			;C - - - - - 0x016A4D 05:8A3D: B9 48 8A
	STA enemyReward,X				;C - - - - - 0x016A50 05:8A40: 95 8E
	LDA DATA_0B8A59,Y			;C - - - - - 0x016A52 05:8A42: B9 59 8A
	STA enemyDir,X				;C - - - - - 0x016A55 05:8A45: 95 A2
	RTS							;C - - - - - 0x016A57 05:8A47: 60

DATA_0B8A48:
	.byte $00					;- - - - - - 0x016A58 05:8A48: 00
	.byte $03					;- D 0 - - - 0x016A59 05:8A49: 03
	.byte $01					;- D 0 - - - 0x016A5A 05:8A4A: 01
	.byte $02					;- D 0 - - - 0x016A5B 05:8A4B: 02
	.byte $03					;- D 0 - - - 0x016A5C 05:8A4C: 03
	.byte $02					;- D 0 - - - 0x016A5D 05:8A4D: 02
	.byte $04					;- D 0 - - - 0x016A5E 05:8A4E: 04
	.byte $04					;- D 0 - - - 0x016A5F 05:8A4F: 04
	.byte $01					;- D 0 - - - 0x016A60 05:8A50: 01
	.byte $04					;- D 0 - - - 0x016A61 05:8A51: 04
	.byte $02					;- D 0 - - - 0x016A62 05:8A52: 02
	.byte $01					;- D 0 - - - 0x016A63 05:8A53: 01
	.byte $04					;- D 0 - - - 0x016A64 05:8A54: 04
	.byte $01					;- D 0 - - - 0x016A65 05:8A55: 01
	.byte $03					;- D 0 - - - 0x016A66 05:8A56: 03
	.byte $03					;- D 0 - - - 0x016A67 05:8A57: 03
	.byte $02					;- D 0 - - - 0x016A68 05:8A58: 02

DATA_0B8A59:
	.byte DIR_NONE					;- - - - - - 0x016A69 05:8A59: 00
	.byte DIR_LEFT					;- D 0 - - - 0x016A6A 05:8A5A: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x016A6B 05:8A5B: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x016A6C 05:8A5C: 02
	.byte DIR_LEFT					;- D 0 - - - 0x016A6D 05:8A5D: 01
	.byte DIR_LEFT					;- D 0 - - - 0x016A6E 05:8A5E: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x016A6F 05:8A5F: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x016A70 05:8A60: 02
	.byte DIR_LEFT					;- D 0 - - - 0x016A71 05:8A61: 01
	.byte DIR_LEFT					;- D 0 - - - 0x016A72 05:8A62: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x016A73 05:8A63: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x016A74 05:8A64: 02
	.byte DIR_LEFT					;- D 0 - - - 0x016A75 05:8A65: 01
	.byte DIR_LEFT					;- D 0 - - - 0x016A76 05:8A66: 01
	.byte DIR_RIGHT					;- D 0 - - - 0x016A77 05:8A67: 02
	.byte DIR_RIGHT					;- D 0 - - - 0x016A78 05:8A68: 02
	.byte DIR_LEFT					;- D 0 - - - 0x016A79 05:8A69: 01

CODE_0B8A6A:
	LDA ram_00CD				;C - - - - - 0x016A7A 05:8A6A: A5 CD
	CMP #$80					;C - - - - - 0x016A7C 05:8A6C: C9 80
	BCC CODE_0B8A81				;C - - - - - 0x016A7E 05:8A6E: 90 11
		AND #$0F					;C - - - - - 0x016A80 05:8A70: 29 0F
		EOR #$FF					;C - - - - - 0x016A82 05:8A72: 49 FF
		STA ram_00D5				;C - - - - - 0x016A84 05:8A74: 85 D5
		INC ram_00D5				;C - - - - - 0x016A86 05:8A76: E6 D5
		LDA #$01					;C - - - - - 0x016A88 05:8A78: A9 01
		STA enemyReward,X				;C - - - - - 0x016A8A 05:8A7A: 95 8E
		LDA #$0B					;C - - - - - 0x016A8C 05:8A7C: A9 0B
		STA ram_04AF,X				;C - - - - - 0x016A8E 05:8A7E: 9D AF 04
CODE_0B8A81:
	RTS							;C - - - - - 0x016A91 05:8A81: 60

CODE_0B8A82:
	LDA enemyReward,X				;C - - - - - 0x016A92 05:8A82: B5 8E
	ASL							;C - - - - - 0x016A94 05:8A84: 0A
	CLC							;C - - - - - 0x016A95 05:8A85: 18
	ADC enemyDir,X				;C - - - - - 0x016A96 05:8A86: 75 A2
	TAY							;C - - - - - 0x016A98 05:8A88: A8
	LDA DATA_0CBD99,Y			;C - - - - - 0x016A99 05:8A89: B9 99 BD
	CLC							;C - - - - - 0x016A9C 05:8A8C: 18
	ADC ram_00D4				;C - - - - - 0x016A9D 05:8A8D: 65 D4
	STA ram_00D4				;C - - - - - 0x016A9F 05:8A8F: 85 D4
	LDA enemyReward,X				;C - - - - - 0x016AA1 05:8A91: B5 8E
	ASL							;C - - - - - 0x016AA3 05:8A93: 0A
	CLC							;C - - - - - 0x016AA4 05:8A94: 18
	ADC ram_00CA				;C - - - - - 0x016AA5 05:8A95: 65 CA
	TAY							;C - - - - - 0x016AA7 05:8A97: A8
	LDA DATA_0CBD7C,Y			;C - - - - - 0x016AA8 05:8A98: B9 7C BD
	CLC							;C - - - - - 0x016AAB 05:8A9B: 18
	ADC ram_00D5				;C - - - - - 0x016AAC 05:8A9C: 65 D5
	STA ram_00D5				;C - - - - - 0x016AAE 05:8A9E: 85 D5
	RTS							;C - - - - - 0x016AB0 05:8AA0: 60

CODE_0B8AA1:
	LDA enemyReward,X				;C - - - - - 0x016AB1 05:8AA1: B5 8E
	CMP #$03					;C - - - - - 0x016AB3 05:8AA3: C9 03
	BEQ CODE_0B8AB3				;C - - - - - 0x016AB5 05:8AA5: F0 0C
		CMP #$04					;C - - - - - 0x016AB7 05:8AA7: C9 04
		BEQ CODE_0B8AB3				;C - - - - - 0x016AB9 05:8AA9: F0 08
			ASL							;C - - - - - 0x016ABB 05:8AAB: 0A
			CLC							;C - - - - - 0x016ABC 05:8AAC: 18
			ADC enemyDir,X				;C - - - - - 0x016ABD 05:8AAD: 75 A2
			TAY							;C - - - - - 0x016ABF 05:8AAF: A8
			JMP CODE_0B8AB8				;C - - - - - 0x016AC0 05:8AB0: 4C B8 8A
CODE_0B8AB3:
	ASL							;C - - - - - 0x016AC3 05:8AB3: 0A
	CLC							;C - - - - - 0x016AC4 05:8AB4: 18
	ADC ram_00CA				;C - - - - - 0x016AC5 05:8AB5: 65 CA
	TAY							;C - - - - - 0x016AC7 05:8AB7: A8
CODE_0B8AB8:
	LDA DATA_0CBE33,Y			;C - - - - - 0x016AC8 05:8AB8: B9 33 BE
	CMP objAnim+OSLOT_ENEMY,X				;C - - - - - 0x016ACB 05:8ABB: DD 84 06
	BEQ CODE_0B8AC3				;C - - - - - 0x016ACE 05:8ABE: F0 03
		JSR StartEnemyAnim2				;C - - - - - 0x016AD0 05:8AC0: 20 C2 9E
CODE_0B8AC3:
	RTS							;C - - - - - 0x016AD3 05:8AC3: 60

PulpulUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x016AD4 05:8AC4: AD D4 04
	BNE CODE_0B8B3E				;C - - - - - 0x016AD7 05:8AC7: D0 75

	LDA ram_00CA				;C - - - - - 0x016AD9 05:8AC9: A5 CA
	CMP #$01					;C - - - - - 0x016ADB 05:8ACB: C9 01
	BEQ CODE_0B8AD7				;C - - - - - 0x016ADD 05:8ACD: F0 08
		LDA #$11					;C - - - - - 0x016ADF 05:8ACF: A9 11
		STA ram_04AF,X				;C - - - - - 0x016AE1 05:8AD1: 9D AF 04
		JMP CODE_0B8ADC				;C - - - - - 0x016AE4 05:8AD4: 4C DC 8A
CODE_0B8AD7:
	LDA #$10					;C - - - - - 0x016AE7 05:8AD7: A9 10
	STA ram_04AF,X				;C - - - - - 0x016AE9 05:8AD9: 9D AF 04
CODE_0B8ADC:
	LDY enemyMad,X				;C - - - - - 0x016AEC 05:8ADC: B4 63
	LDA DATA_0B8B45,Y			;C - - - - - 0x016AEE 05:8ADE: B9 45 8B
	STA scratch2				;C - - - - - 0x016AF1 05:8AE1: 85 02
	LDA DATA_0B8B47,Y			;C - - - - - 0x016AF3 05:8AE3: B9 47 8B
	STA ram_00D4				;C - - - - - 0x016AF6 05:8AE6: 85 D4
	LDA enemyReward,X				;C - - - - - 0x016AF8 05:8AE8: B5 8E
	CMP #$01					;C - - - - - 0x016AFA 05:8AEA: C9 01
	BEQ CODE_0B8B05				;C - - - - - 0x016AFC 05:8AEC: F0 17

	CMP #$02					;C - - - - - 0x016AFE 05:8AEE: C9 02
	BEQ CODE_0B8B18				;C - - - - - 0x016B00 05:8AF0: F0 26

	LDA ram_00CF				;C - - - - - 0x016B02 05:8AF2: A5 CF
	CMP #$80					;C - - - - - 0x016B04 05:8AF4: C9 80
	BCS CODE_0B8AFE				;C - - - - - 0x016B06 05:8AF6: B0 06

	LDA ram_00CD				;C - - - - - 0x016B08 05:8AF8: A5 CD
	CMP #$80					;C - - - - - 0x016B0A 05:8AFA: C9 80
	BCC CODE_0B8B0B				;C - - - - - 0x016B0C 05:8AFC: 90 0D
CODE_0B8AFE:
	JSR CODE_0B8BB2				;C - - - - - 0x016B0E 05:8AFE: 20 B2 8B
	LDA #$01					;C - - - - - 0x016B11 05:8B01: A9 01
	STA enemyReward,X				;C - - - - - 0x016B13 05:8B03: 95 8E
CODE_0B8B05:
	JSR CODE_0B8B49				;C - - - - - 0x016B15 05:8B05: 20 49 8B
	JMP CODE_0B8B1B				;C - - - - - 0x016B18 05:8B08: 4C 1B 8B
CODE_0B8B0B:
	LDA projTouchingPlayer				;C - - - - - 0x016B1B 05:8B0B: A5 CE
	AND #$C0					;C - - - - - 0x016B1D 05:8B0D: 29 C0
	BEQ CODE_0B8B1B				;C - - - - - 0x016B1F 05:8B0F: F0 0A
		JSR CODE_0B8BCA				;C - - - - - 0x016B21 05:8B11: 20 CA 8B
		LDA #$02					;C - - - - - 0x016B24 05:8B14: A9 02
		STA enemyReward,X				;C - - - - - 0x016B26 05:8B16: 95 8E
	CODE_0B8B18:
		JSR CODE_0B8B78				;C - - - - - 0x016B28 05:8B18: 20 78 8B
CODE_0B8B1B:
	JSR CODE_0B849D				;C - - - - - 0x016B2B 05:8B1B: 20 9D 84
	LDA ram_04AA				;C - - - - - 0x016B2E 05:8B1E: AD AA 04
	LSR							;C - - - - - 0x016B31 05:8B21: 4A
	LSR							;C - - - - - 0x016B32 05:8B22: 4A
	LDA ram_04AA				;C - - - - - 0x016B33 05:8B23: AD AA 04
	ROL							;C - - - - - 0x016B36 05:8B26: 2A
	AND #$03					;C - - - - - 0x016B37 05:8B27: 29 03
	CLC							;C - - - - - 0x016B39 05:8B29: 18
	ADC scratch2				;C - - - - - 0x016B3A 05:8B2A: 65 02
	LSR							;C - - - - - 0x016B3C 05:8B2C: 4A
	LSR							;C - - - - - 0x016B3D 05:8B2D: 4A
	STA ram_00D5				;C - - - - - 0x016B3E 05:8B2E: 85 D5
	LDA ram_00CA				;C - - - - - 0x016B40 05:8B30: A5 CA
	CMP #$02					;C - - - - - 0x016B42 05:8B32: C9 02
	BEQ CODE_0B8B3E				;C - - - - - 0x016B44 05:8B34: F0 08
		LDA ram_00D5				;C - - - - - 0x016B46 05:8B36: A5 D5
		EOR #$FF					;C - - - - - 0x016B48 05:8B38: 49 FF
		STA ram_00D5				;C - - - - - 0x016B4A 05:8B3A: 85 D5
		INC ram_00D5				;C - - - - - 0x016B4C 05:8B3C: E6 D5
CODE_0B8B3E:
	JSR CODE_0B9846				;C - - - - - 0x016B4E 05:8B3E: 20 46 98
	JSR CODE_0B842F				;C - - - - - 0x016B51 05:8B41: 20 2F 84
	RTS							;C - - - - - 0x016B54 05:8B44: 60

DATA_0B8B45:
	.byte $04					;- D 0 - - - 0x016B55 05:8B45: 04
	.byte $08					;- D 0 - - - 0x016B56 05:8B46: 08
DATA_0B8B47:
	.byte $06					;- D 0 - - - 0x016B57 05:8B47: 06
	.byte $0C					;- D 0 - - - 0x016B58 05:8B48: 0C

CODE_0B8B49:
	LDA #$00					;C - - - - - 0x016B59 05:8B49: A9 00
	STA scratch2				;C - - - - - 0x016B5B 05:8B4B: 85 02
	LDA projTouchingPlayer				;C - - - - - 0x016B5D 05:8B4D: A5 CE
	AND #$C0					;C - - - - - 0x016B5F 05:8B4F: 29 C0
	BEQ CODE_0B8B5C				;C - - - - - 0x016B61 05:8B51: F0 09
		LDA enemyDir,X				;C - - - - - 0x016B63 05:8B53: B5 A2
		EOR #$03					;C - - - - - 0x016B65 05:8B55: 49 03
		STA enemyDir,X				;C - - - - - 0x016B67 05:8B57: 95 A2
		JMP CODE_0B8B64				;C - - - - - 0x016B69 05:8B59: 4C 64 8B
CODE_0B8B5C:
	INC ram_00AC,X				;C - - - - - 0x016B6C 05:8B5C: F6 AC
	LDA ram_00AC,X				;C - - - - - 0x016B6E 05:8B5E: B5 AC
	CMP #$08					;C - - - - - 0x016B70 05:8B60: C9 08
	BNE CODE_0B8B77				;C - - - - - 0x016B72 05:8B62: D0 13
CODE_0B8B64:
	LDA ram_00CA				;C - - - - - 0x016B74 05:8B64: A5 CA
	EOR #$03					;C - - - - - 0x016B76 05:8B66: 49 03
	STA ram_00CA				;C - - - - - 0x016B78 05:8B68: 85 CA
	LDA DATA_0B8DD2,Y			;C - - - - - 0x016B7A 05:8B6A: B9 D2 8D
	STA scratch2				;C - - - - - 0x016B7D 05:8B6D: 85 02
	STA ram_00D4				;C - - - - - 0x016B7F 05:8B6F: 85 D4
	LDA #$00					;C - - - - - 0x016B81 05:8B71: A9 00
	STA ram_00AC,X				;C - - - - - 0x016B83 05:8B73: 95 AC
	STA enemyReward,X				;C - - - - - 0x016B85 05:8B75: 95 8E
CODE_0B8B77:
	RTS							;C - - - - - 0x016B87 05:8B77: 60

CODE_0B8B78:
	LDA DATA_0B8B47,Y			;C - - - - - 0x016B88 05:8B78: B9 47 8B
	STA scratch2				;C - - - - - 0x016B8B 05:8B7B: 85 02
	LDA #$00					;C - - - - - 0x016B8D 05:8B7D: A9 00
	STA ram_00D4				;C - - - - - 0x016B8F 05:8B7F: 85 D4
	LDA ram_00CF				;C - - - - - 0x016B91 05:8B81: A5 CF
	CMP #$80					;C - - - - - 0x016B93 05:8B83: C9 80
	BCS CODE_0B8B8D				;C - - - - - 0x016B95 05:8B85: B0 06
		LDA ram_00CD				;C - - - - - 0x016B97 05:8B87: A5 CD
		CMP #$80					;C - - - - - 0x016B99 05:8B89: C9 80
		BCC CODE_0B8B96				;C - - - - - 0x016B9B 05:8B8B: 90 09
CODE_0B8B8D:
	LDA ram_00CA				;C - - - - - 0x016B9D 05:8B8D: A5 CA
	EOR #$03					;C - - - - - 0x016B9F 05:8B8F: 49 03
	STA ram_00CA				;C - - - - - 0x016BA1 05:8B91: 85 CA
	JMP CODE_0B8B9E				;C - - - - - 0x016BA3 05:8B93: 4C 9E 8B
CODE_0B8B96:
	INC ram_00AC,X				;C - - - - - 0x016BA6 05:8B96: F6 AC
	LDA ram_00AC,X				;C - - - - - 0x016BA8 05:8B98: B5 AC
	CMP #$08					;C - - - - - 0x016BAA 05:8B9A: C9 08
	BNE CODE_0B8BB1				;C - - - - - 0x016BAC 05:8B9C: D0 13
CODE_0B8B9E:
	LDA enemyDir,X				;C - - - - - 0x016BAE 05:8B9E: B5 A2
	EOR #$03					;C - - - - - 0x016BB0 05:8BA0: 49 03
	STA enemyDir,X				;C - - - - - 0x016BB2 05:8BA2: 95 A2
	LDA DATA_0B8DD2,Y			;C - - - - - 0x016BB4 05:8BA4: B9 D2 8D
	STA scratch2				;C - - - - - 0x016BB7 05:8BA7: 85 02
	STA ram_00D4				;C - - - - - 0x016BB9 05:8BA9: 85 D4
	LDA #$00					;C - - - - - 0x016BBB 05:8BAB: A9 00
	STA ram_00AC,X				;C - - - - - 0x016BBD 05:8BAD: 95 AC
	STA enemyReward,X				;C - - - - - 0x016BBF 05:8BAF: 95 8E
CODE_0B8BB1:
	RTS							;C - - - - - 0x016BC1 05:8BB1: 60

CODE_0B8BB2:
	LDA ram_00CF				;C - - - - - 0x016BC2 05:8BB2: A5 CF
	AND #$0F					;C - - - - - 0x016BC4 05:8BB4: 29 0F
	BEQ CODE_0B8BBD				;C - - - - - 0x016BC6 05:8BB6: F0 05
		STA ram_00D5				;C - - - - - 0x016BC8 05:8BB8: 85 D5
		JMP CODE_0B8BC9				;C - - - - - 0x016BCA 05:8BBA: 4C C9 8B
CODE_0B8BBD:
	LDA ram_00CD				;C - - - - - 0x016BCD 05:8BBD: A5 CD
	AND #$0F					;C - - - - - 0x016BCF 05:8BBF: 29 0F
	BEQ CODE_0B8BC9				;C - - - - - 0x016BD1 05:8BC1: F0 06
		EOR #$FF					;C - - - - - 0x016BD3 05:8BC3: 49 FF
		STA ram_00D5				;C - - - - - 0x016BD5 05:8BC5: 85 D5
		INC ram_00D5				;C - - - - - 0x016BD7 05:8BC7: E6 D5
CODE_0B8BC9:
	RTS							;C - - - - - 0x016BD9 05:8BC9: 60

CODE_0B8BCA:
	LDA projTouchingPlayer				;C - - - - - 0x016BDA 05:8BCA: A5 CE
	AND #$0F					;C - - - - - 0x016BDC 05:8BCC: 29 0F
	BEQ CODE_0B8BE0				;C - - - - - 0x016BDE 05:8BCE: F0 10
		STA ram_00D4				;C - - - - - 0x016BE0 05:8BD0: 85 D4
		LDA enemyDir,X				;C - - - - - 0x016BE2 05:8BD2: B5 A2
		CMP #$01					;C - - - - - 0x016BE4 05:8BD4: C9 01
		BEQ CODE_0B8BE0				;C - - - - - 0x016BE6 05:8BD6: F0 08
			LDA ram_00D4				;C - - - - - 0x016BE8 05:8BD8: A5 D4
			EOR #$FF					;C - - - - - 0x016BEA 05:8BDA: 49 FF
			STA ram_00D4				;C - - - - - 0x016BEC 05:8BDC: 85 D4
			INC ram_00D4				;C - - - - - 0x016BEE 05:8BDE: E6 D4
CODE_0B8BE0:
	RTS							;C - - - - - 0x016BF0 05:8BE0: 60

NeedlerUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x016BF1 05:8BE1: AD D4 04
	BEQ CODE_0B8BE9				;C - - - - - 0x016BF4 05:8BE4: F0 03
		JMP CODE_0B8CE2				;C - - - - - 0x016BF6 05:8BE6: 4C E2 8C
CODE_0B8BE9:
	LDA #$12					;C - - - - - 0x016BF9 05:8BE9: A9 12
	STA ram_04AF,X				;C - - - - - 0x016BFB 05:8BEB: 9D AF 04
	LDA ram_00CA				;C - - - - - 0x016BFE 05:8BEE: A5 CA
	CMP #$01					;C - - - - - 0x016C00 05:8BF0: C9 01
	BNE CODE_0B8C01				;C - - - - - 0x016C02 05:8BF2: D0 0D
		INC ram_00CA				;C - - - - - 0x016C04 05:8BF4: E6 CA
		LDA #$00					;C - - - - - 0x016C06 05:8BF6: A9 00
		STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x016C08 05:8BF8: 9D AC 06
		STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x016C0B 05:8BFB: 9D D4 06
		JMP CODE_0B8CDA				;C - - - - - 0x016C0E 05:8BFE: 4C DA 8C
CODE_0B8C01:
	CMP #$02					;C - - - - - 0x016C11 05:8C01: C9 02
	BNE CODE_0B8C37				;C - - - - - 0x016C13 05:8C03: D0 32

	LDA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x016C15 05:8C05: BD D4 06
	TAY							;C - - - - - 0x016C18 05:8C08: A8
	LDA DATA_0B8CEF,Y			;C - - - - - 0x016C19 05:8C09: B9 EF 8C
	STA ram_00D5				;C - - - - - 0x016C1C 05:8C0C: 85 D5
	CPY #$01					;C - - - - - 0x016C1E 05:8C0E: C0 01
	BEQ CODE_0B8C15				;C - - - - - 0x016C20 05:8C10: F0 03
		JMP CODE_0B8CE2				;C - - - - - 0x016C22 05:8C12: 4C E2 8C
CODE_0B8C15:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x016C25 05:8C15: BD 94 05
	CMP objY				;C - - - - - 0x016C28 05:8C18: CD 8B 05
	BCS CODE_0B8C20				;C - - - - - 0x016C2B 05:8C1B: B0 03
		JMP CODE_0B8CDA				;C - - - - - 0x016C2D 05:8C1D: 4C DA 8C
CODE_0B8C20:
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x016C30 05:8C20: BD BC 05
	SEC							;C - - - - - 0x016C33 05:8C23: 38
	SBC objX				;C - - - - - 0x016C34 05:8C24: ED B3 05
	BCS CODE_0B8C2E				;C - - - - - 0x016C37 05:8C27: B0 05
		EOR #$FF					;C - - - - - 0x016C39 05:8C29: 49 FF
		CLC							;C - - - - - 0x016C3B 05:8C2B: 18
		ADC #$01					;C - - - - - 0x016C3C 05:8C2C: 69 01
CODE_0B8C2E:
	CMP #$10					;C - - - - - 0x016C3E 05:8C2E: C9 10
	BCS CODE_0B8C34				;C - - - - - 0x016C40 05:8C30: B0 02
		INC ram_00CA				;C - - - - - 0x016C42 05:8C32: E6 CA
CODE_0B8C34:
	JMP CODE_0B8CDA				;C - - - - - 0x016C44 05:8C34: 4C DA 8C
CODE_0B8C37:
	CMP #$03					;C - - - - - 0x016C47 05:8C37: C9 03
	BNE CODE_0B8C53				;C - - - - - 0x016C49 05:8C39: D0 18
		LDA #$12					;C - - - - - 0x016C4B 05:8C3B: A9 12
		STA ram_04AF,X				;C - - - - - 0x016C4D 05:8C3D: 9D AF 04
		LDA #$00					;C - - - - - 0x016C50 05:8C40: A9 00
		JSR CODE_0B9ED1				;C - - - - - 0x016C52 05:8C42: 20 D1 9E
		INC ram_00CA				;C - - - - - 0x016C55 05:8C45: E6 CA
		LDA #$38					;C - - - - - 0x016C57 05:8C47: A9 38
		STA ram_00B6,X				;C - - - - - 0x016C59 05:8C49: 95 B6
		LDA #anNeedlerExposed_ID					;C - - - - - 0x016C5B 05:8C4B: A9 D5
		JSR StartEnemyAnim2				;C - - - - - 0x016C5D 05:8C4D: 20 C2 9E
		JMP CODE_0B8CDA				;C - - - - - 0x016C60 05:8C50: 4C DA 8C
CODE_0B8C53:
	CMP #$04					;C - - - - - 0x016C63 05:8C53: C9 04
	BNE CODE_0B8C6A				;C - - - - - 0x016C65 05:8C55: D0 13
	DEC ram_00B6,X				;C - - - - - 0x016C67 05:8C57: D6 B6
	BEQ CODE_0B8C5E				;C - - - - - 0x016C69 05:8C59: F0 03
	JMP CODE_0B8CDA				;C - - - - - 0x016C6B 05:8C5B: 4C DA 8C

CODE_0B8C5E:
	;Unreached
	LDA #$02					;- - - - - - 0x016C6E 05:8C5E: A9
	STA ram_00CA				;- - - - - - 0x016C70 05:8C60: 85
	LDA #anNeedler_ID					;- - - - - - 0x016C72 05:8C62: A9
	JSR StartEnemyAnim2				;- - - - - - 0x016C74 05:8C64: 20
	JMP CODE_0B8CDA				;- - - - - - 0x016C77 05:8C67: 4C

CODE_0B8C6A:
	CMP #$05					;C - - - - - 0x016C7A 05:8C6A: C9 05
	BNE CODE_0B8C74				;C - - - - - 0x016C7C 05:8C6C: D0 06
		JSR CODE_0B8327				;C - - - - - 0x016C7E 05:8C6E: 20 27 83
		JMP CODE_0B8CDA				;C - - - - - 0x016C81 05:8C71: 4C DA 8C
CODE_0B8C74:
	CMP #$06					;C - - - - - 0x016C84 05:8C74: C9 06
	BNE CODE_0B8CB6				;C - - - - - 0x016C86 05:8C76: D0 3E

.ifndef REGION_JP
	LDA objY				;C - - - - - 0x016C88 05:8C78: AD 8B 05
	CMP #224					;C - - - - - 0x016C8B 05:8C7B: C9 E0
	BCC CODE_0B8C84				;C - - - - - 0x016C8D 05:8C7D: 90 05
		;Unreached
		LDA #0					;- - - - - - 0x016C8F 05:8C7F: A9
		STA objY				;- - - - - - 0x016C91 05:8C81: 8D
.endif
CODE_0B8C84:
	LDA #$00					;C - - - - - 0x016C94 05:8C84: A9 00
	STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x016C96 05:8C86: 9D D4 06
	STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x016C99 05:8C89: 9D AC 06
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x016C9C 05:8C8C: BD 94 05
	CMP objY				;C - - - - - 0x016C9F 05:8C8F: CD 8B 05
	BCC CODE_0B8CA1				;C - - - - - 0x016CA2 05:8C92: 90 0D
		SBC #$06					;C - - - - - 0x016CA4 05:8C94: E9 06
		STA objY+OSLOT_ENEMY,X				;C - - - - - 0x016CA6 05:8C96: 9D 94 05
		SEC							;C - - - - - 0x016CA9 05:8C99: 38
		SBC objY				;C - - - - - 0x016CAA 05:8C9A: ED 8B 05
		CMP #$10					;C - - - - - 0x016CAD 05:8C9D: C9 10
		BCS CODE_0B8CB3				;C - - - - - 0x016CAF 05:8C9F: B0 12
CODE_0B8CA1:
	LDA #$28					;C - - - - - 0x016CB1 05:8CA1: A9 28
	STA ram_00B6,X				;C - - - - - 0x016CB3 05:8CA3: 95 B6
	LDA #$07					;C - - - - - 0x016CB5 05:8CA5: A9 07
	STA ram_00CA				;C - - - - - 0x016CB7 05:8CA7: 85 CA
	LDA #anNeedler_ID					;C - - - - - 0x016CB9 05:8CA9: A9 40
	JSR StartEnemyAnim2				;C - - - - - 0x016CBB 05:8CAB: 20 C2 9E
	LDA #snNeedlerHit_ID					;C - - - - - 0x016CBE 05:8CAE: A9 1E
	STA a:soundTrigger			;C - - - - - 0x016CC0 05:8CB0: 8D E1 00
CODE_0B8CB3:
	JMP CODE_0B8CE2				;C - - - - - 0x016CC3 05:8CB3: 4C E2 8C
CODE_0B8CB6:
	CMP #$07					;C - - - - - 0x016CC6 05:8CB6: C9 07
	BNE CODE_0B8CCB				;C - - - - - 0x016CC8 05:8CB8: D0 11
		DEC ram_00B6,X				;C - - - - - 0x016CCA 05:8CBA: D6 B6
		BNE CODE_0B8CCE				;C - - - - - 0x016CCC 05:8CBC: D0 10
			LDA #$05					;C - - - - - 0x016CCE 05:8CBE: A9 05
			STA ram_00CA				;C - - - - - 0x016CD0 05:8CC0: 85 CA
			LDA #anNeedler_ID					;C - - - - - 0x016CD2 05:8CC2: A9 40
			JSR StartEnemyAnim2				;C - - - - - 0x016CD4 05:8CC4: 20 C2 9E
			LDA #$00					;C - - - - - 0x016CD7 05:8CC7: A9 00
			STA ram_00B6,X				;C - - - - - 0x016CD9 05:8CC9: 95 B6
CODE_0B8CCB:
	JMP CODE_0B8CE2				;C - - - - - 0x016CDB 05:8CCB: 4C E2 8C
CODE_0B8CCE:
	LDA ram_00B6,X				;C - - - - - 0x016CDE 05:8CCE: B5 B6
	CMP #$0C					;C - - - - - 0x016CE0 05:8CD0: C9 0C
	BCS CODE_0B8CD7				;C - - - - - 0x016CE2 05:8CD2: B0 03
		DEC objY+OSLOT_ENEMY,X				;C - - - - - 0x016CE4 05:8CD4: DE 94 05
CODE_0B8CD7:
	JMP CODE_0B8CE2				;C - - - - - 0x016CE7 05:8CD7: 4C E2 8C
CODE_0B8CDA:
	LDA ram_00CD				;C - - - - - 0x016CEA 05:8CDA: A5 CD
	BNE CODE_0B8CE2				;C - - - - - 0x016CEC 05:8CDC: D0 04
		LDA #$05					;C - - - - - 0x016CEE 05:8CDE: A9 05
		STA ram_00CA				;C - - - - - 0x016CF0 05:8CE0: 85 CA
CODE_0B8CE2:
	JSR CODE_0B842F				;C - - - - - 0x016CF2 05:8CE2: 20 2F 84
	LDA ram_00CA				;C - - - - - 0x016CF5 05:8CE5: A5 CA
	BNE CODE_0B8CEE				;C - - - - - 0x016CF7 05:8CE7: D0 05
		LDA #anNeedler_ID					;C - - - - - 0x016CF9 05:8CE9: A9 40
		JSR StartEnemyAnim2				;C - - - - - 0x016CFB 05:8CEB: 20 C2 9E
CODE_0B8CEE:
	RTS							;C - - - - - 0x016CFE 05:8CEE: 60

DATA_0B8CEF:
	.byte $00					;- - - - - - 0x016CFF 05:8CEF: 00
	.byte $00					;- D 0 - - - 0x016D00 05:8CF0: 00
	.byte $FE					;- D 0 - - - 0x016D01 05:8CF1: FE
	.byte $FF					;- D 0 - - - 0x016D02 05:8CF2: FF
	.byte $00					;- D 0 - - - 0x016D03 05:8CF3: 00
	.byte $01					;- D 0 - - - 0x016D04 05:8CF4: 01
	.byte $02					;- D 0 - - - 0x016D05 05:8CF5: 02

InvaderUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x016D06 05:8CF6: AD D4 04
	BNE CODE_0B8D4A				;C - - - - - 0x016D09 05:8CF9: D0 4F

	LDA ram_00CA				;C - - - - - 0x016D0B 05:8CFB: A5 CA
	CMP #$80					;C - - - - - 0x016D0D 05:8CFD: C9 80
	BCC CODE_0B8D04				;C - - - - - 0x016D0F 05:8CFF: 90 03
		JMP CODE_0B8D4D				;C - - - - - 0x016D11 05:8D01: 4C 4D 8D
CODE_0B8D04:
	LDA #$14					;C - - - - - 0x016D14 05:8D04: A9 14
	STA ram_04AF,X				;C - - - - - 0x016D16 05:8D06: 9D AF 04
	LDA projTouchingPlayer				;C - - - - - 0x016D19 05:8D09: A5 CE
	AND #$C0					;C - - - - - 0x016D1B 05:8D0B: 29 C0
	BEQ CODE_0B8D15				;C - - - - - 0x016D1D 05:8D0D: F0 06
		LDA enemyDir,X				;C - - - - - 0x016D1F 05:8D0F: B5 A2
		EOR #$03					;C - - - - - 0x016D21 05:8D11: 49 03
		STA enemyDir,X				;C - - - - - 0x016D23 05:8D13: 95 A2
CODE_0B8D15:
	LDA ram_00CD				;C - - - - - 0x016D25 05:8D15: A5 CD
	CMP #$80					;C - - - - - 0x016D27 05:8D17: C9 80
	BCS CODE_0B8D27				;C - - - - - 0x016D29 05:8D19: B0 0C
		LDA #$04					;C - - - - - 0x016D2B 05:8D1B: A9 04
		STA ram_00CA				;C - - - - - 0x016D2D 05:8D1D: 85 CA
		LDA #$17					;C - - - - - 0x016D2F 05:8D1F: A9 17
		STA ram_04AF,X				;C - - - - - 0x016D31 05:8D21: 9D AF 04
		JMP CODE_0B8D41				;C - - - - - 0x016D34 05:8D24: 4C 41 8D
CODE_0B8D27:
	LDA #$01					;C - - - - - 0x016D37 05:8D27: A9 01
	STA ram_00CA				;C - - - - - 0x016D39 05:8D29: 85 CA
	LDY enemyMad,X				;C - - - - - 0x016D3B 05:8D2B: B4 63
	LDA DATA_0B8D51,Y			;C - - - - - 0x016D3D 05:8D2D: B9 51 8D
	STA ram_00D4				;C - - - - - 0x016D40 05:8D30: 85 D4
	JSR CODE_0B849D				;C - - - - - 0x016D42 05:8D32: 20 9D 84
	LDA #$01					;C - - - - - 0x016D45 05:8D35: A9 01
	JSR CODE_0B9ED1				;C - - - - - 0x016D47 05:8D37: 20 D1 9E
	BCC CODE_0B8D41				;C - - - - - 0x016D4A 05:8D3A: 90 05
		LDA #snInvader_ID					;C - - - - - 0x016D4C 05:8D3C: A9 1F
		STA a:soundTrigger			;C - - - - - 0x016D4E 05:8D3E: 8D E1 00
CODE_0B8D41:
	LDA ram_00CA				;C - - - - - 0x016D51 05:8D41: A5 CA
	CMP #$04					;C - - - - - 0x016D53 05:8D43: C9 04
	BNE CODE_0B8D4A				;C - - - - - 0x016D55 05:8D45: D0 03
		JSR CODE_0B8327				;C - - - - - 0x016D57 05:8D47: 20 27 83
CODE_0B8D4A:
	JSR CODE_0B9846				;C - - - - - 0x016D5A 05:8D4A: 20 46 98
CODE_0B8D4D:
	JSR CODE_0B842F				;C - - - - - 0x016D5D 05:8D4D: 20 2F 84
	RTS							;C - - - - - 0x016D60 05:8D50: 60

DATA_0B8D51:
	.byte $08					;- D 0 - - - 0x016D61 05:8D51: 08
	.byte $10					;- D 0 - - - 0x016D62 05:8D52: 10

MonstaUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x016D63 05:8D53: AD D4 04
	BEQ CODE_0B8D5B				;C - - - - - 0x016D66 05:8D56: F0 03
		;Unreached
		JMP CODE_0B8DC9				;- - - - - - 0x016D68 05:8D58: 4C

CODE_0B8D5B:
	LDA ram_00CA				;C - - - - - 0x016D6B 05:8D5B: A5 CA
	CMP #$0B					;C - - - - - 0x016D6D 05:8D5D: C9 0B
	BCC CODE_0B8D64				;C - - - - - 0x016D6F 05:8D5F: 90 03
		JMP CODE_0B8DCC				;C - - - - - 0x016D71 05:8D61: 4C CC 8D
CODE_0B8D64:
	CMP #$01					;C - - - - - 0x016D74 05:8D64: C9 01
	BNE CODE_0B8D76				;C - - - - - 0x016D76 05:8D66: D0 0E
		LDA #$19					;C - - - - - 0x016D78 05:8D68: A9 19
		STA ram_04AF,X				;C - - - - - 0x016D7A 05:8D6A: 9D AF 04
		LDA ram_00CF				;C - - - - - 0x016D7D 05:8D6D: A5 CF
		CMP #$80					;C - - - - - 0x016D7F 05:8D6F: C9 80
		BCC CODE_0B8D96				;C - - - - - 0x016D81 05:8D71: 90 23
			JMP CODE_0B8D85				;C - - - - - 0x016D83 05:8D73: 4C 85 8D
CODE_0B8D76:
	CMP #$02					;C - - - - - 0x016D86 05:8D76: C9 02
	BNE CODE_0B8DA2				;C - - - - - 0x016D88 05:8D78: D0 28

	LDA #$1A					;C - - - - - 0x016D8A 05:8D7A: A9 1A
	STA ram_04AF,X				;C - - - - - 0x016D8C 05:8D7C: 9D AF 04
	LDA ram_00CD				;C - - - - - 0x016D8F 05:8D7F: A5 CD
	CMP #$80					;C - - - - - 0x016D91 05:8D81: C9 80
	BCC CODE_0B8D96				;C - - - - - 0x016D93 05:8D83: 90 11
CODE_0B8D85:
	LDA ram_00CA				;C - - - - - 0x016D95 05:8D85: A5 CA
	EOR #$03					;C - - - - - 0x016D97 05:8D87: 49 03
	STA ram_00CA				;C - - - - - 0x016D99 05:8D89: 85 CA
	LDA ram_04AF,X				;C - - - - - 0x016D9B 05:8D8B: BD AF 04
	EOR #$03					;C - - - - - 0x016D9E 05:8D8E: 49 03
	STA ram_04AF,X				;C - - - - - 0x016DA0 05:8D90: 9D AF 04
	JMP CODE_0B8DA2				;C - - - - - 0x016DA3 05:8D93: 4C A2 8D
CODE_0B8D96:
	LDA projTouchingPlayer				;C - - - - - 0x016DA6 05:8D96: A5 CE
	AND #$C0					;C - - - - - 0x016DA8 05:8D98: 29 C0
	BEQ CODE_0B8DA2				;C - - - - - 0x016DAA 05:8D9A: F0 06
		LDA enemyDir,X				;C - - - - - 0x016DAC 05:8D9C: B5 A2
		EOR #$03					;C - - - - - 0x016DAE 05:8D9E: 49 03
		STA enemyDir,X				;C - - - - - 0x016DB0 05:8DA0: 95 A2
CODE_0B8DA2:
	LDY enemyMad,X				;C - - - - - 0x016DB2 05:8DA2: B4 63
	LDA DATA_0B8DD0,Y			;C - - - - - 0x016DB4 05:8DA4: B9 D0 8D
	STA ram_00D4				;C - - - - - 0x016DB7 05:8DA7: 85 D4
	STA scratch2				;C - - - - - 0x016DB9 05:8DA9: 85 02
	JSR CODE_0B849D				;C - - - - - 0x016DBB 05:8DAB: 20 9D 84
	LDA ram_04AA				;C - - - - - 0x016DBE 05:8DAE: AD AA 04
	ROL							;C - - - - - 0x016DC1 05:8DB1: 2A
	AND #$03					;C - - - - - 0x016DC2 05:8DB2: 29 03
	CLC							;C - - - - - 0x016DC4 05:8DB4: 18
	ADC scratch2				;C - - - - - 0x016DC5 05:8DB5: 65 02
	LSR							;C - - - - - 0x016DC7 05:8DB7: 4A
	LSR							;C - - - - - 0x016DC8 05:8DB8: 4A
	STA ram_00D5				;C - - - - - 0x016DC9 05:8DB9: 85 D5
	LDA ram_00CA				;C - - - - - 0x016DCB 05:8DBB: A5 CA
	CMP #$02					;C - - - - - 0x016DCD 05:8DBD: C9 02
	BEQ CODE_0B8DC9				;C - - - - - 0x016DCF 05:8DBF: F0 08
		LDA ram_00D5				;C - - - - - 0x016DD1 05:8DC1: A5 D5
		EOR #$FF					;C - - - - - 0x016DD3 05:8DC3: 49 FF
		STA ram_00D5				;C - - - - - 0x016DD5 05:8DC5: 85 D5
		INC ram_00D5				;C - - - - - 0x016DD7 05:8DC7: E6 D5
CODE_0B8DC9:
	JSR CODE_0B9846				;C - - - - - 0x016DD9 05:8DC9: 20 46 98
CODE_0B8DCC:
	JSR CODE_0B842F				;C - - - - - 0x016DDC 05:8DCC: 20 2F 84
	RTS							;C - - - - - 0x016DDF 05:8DCF: 60

DATA_0B8DD0:
	.byte $07					;- D 0 - - - 0x016DE0 05:8DD0: 07
	.byte $0E					;- D 0 - - - 0x016DE1 05:8DD1: 0E
DATA_0B8DD2:
	.byte $08					;- D 0 - - - 0x016DE2 05:8DD2: 08
	.byte $10					;- D 0 - - - 0x016DE3 05:8DD3: 10

HeitaiKunUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x016DE4 05:8DD4: AD D4 04
	BEQ CODE_0B8DDC				;C - - - - - 0x016DE7 05:8DD7: F0 03
		;Unreached
		JMP CODE_0B8E38				;- - - - - - 0x016DE9 05:8DD9: 4C

CODE_0B8DDC:
	LDA ram_00CA				;C - - - - - 0x016DEC 05:8DDC: A5 CA
	CMP #$0F					;C - - - - - 0x016DEE 05:8DDE: C9 0F
	BNE CODE_0B8DF7				;C - - - - - 0x016DF0 05:8DE0: D0 15
	LDA #$04					;C - - - - - 0x016DF2 05:8DE2: A9 04
	STA ram_04AF,X				;C - - - - - 0x016DF4 05:8DE4: 9D AF 04
	JSR CODE_0B8E9B				;C - - - - - 0x016DF7 05:8DE7: 20 9B 8E
	LDA ram_00CD				;C - - - - - 0x016DFA 05:8DEA: A5 CD
	CMP #$80					;C - - - - - 0x016DFC 05:8DEC: C9 80
	BCC CODE_0B8E38				;C - - - - - 0x016DFE 05:8DEE: 90 48

	LDA #$10					;C - - - - - 0x016E00 05:8DF0: A9 10
	STA ram_00CA				;C - - - - - 0x016E02 05:8DF2: 85 CA
	JMP CODE_0B8E38				;C - - - - - 0x016E04 05:8DF4: 4C 38 8E
CODE_0B8DF7:
	CMP #$10					;C - - - - - 0x016E07 05:8DF7: C9 10
	BNE CODE_0B8E0B				;C - - - - - 0x016E09 05:8DF9: D0 10
		LDA #anHeitaiKunParaLand_ID					;C - - - - - 0x016E0B 05:8DFB: A9 B2
		JSR StartEnemyAnim2				;C - - - - - 0x016E0D 05:8DFD: 20 C2 9E
		INC ram_00B6,X				;C - - - - - 0x016E10 05:8E00: F6 B6
		LDA ram_00B6,X				;C - - - - - 0x016E12 05:8E02: B5 B6
		CMP #$06					;C - - - - - 0x016E14 05:8E04: C9 06
		BNE CODE_0B8E38				;C - - - - - 0x016E16 05:8E06: D0 30
			JMP CODE_0B8E31				;C - - - - - 0x016E18 05:8E08: 4C 31 8E
CODE_0B8E0B:
	JSR CODE_0B8501				;C - - - - - 0x016E1B 05:8E0B: 20 01 85
	LDA ram_00CA				;C - - - - - 0x016E1E 05:8E0E: A5 CA
	CMP #$04					;C - - - - - 0x016E20 05:8E10: C9 04
	BNE CODE_0B8E17				;C - - - - - 0x016E22 05:8E12: D0 03
		JMP CODE_0B8E38				;C - - - - - 0x016E24 05:8E14: 4C 38 8E
CODE_0B8E17:
	CMP #$05					;C - - - - - 0x016E27 05:8E17: C9 05
	BNE CODE_0B8E22				;C - - - - - 0x016E29 05:8E19: D0 07
		LDA #$00					;C - - - - - 0x016E2B 05:8E1B: A9 00
		STA ram_00D4				;C - - - - - 0x016E2D 05:8E1D: 85 D4
		JMP CODE_0B8E38				;C - - - - - 0x016E2F 05:8E1F: 4C 38 8E
CODE_0B8E22:
	CMP #$07					;C - - - - - 0x016E32 05:8E22: C9 07
	BEQ CODE_0B8E31				;C - - - - - 0x016E34 05:8E24: F0 0B
	CMP #$08					;C - - - - - 0x016E36 05:8E26: C9 08
	BNE CODE_0B8E35				;C - - - - - 0x016E38 05:8E28: D0 0B
	LDA #$05					;C - - - - - 0x016E3A 05:8E2A: A9 05
	STA ram_00CA				;C - - - - - 0x016E3C 05:8E2C: 85 CA
	JMP CODE_0B8E38				;C - - - - - 0x016E3E 05:8E2E: 4C 38 8E
CODE_0B8E31:
	LDA #$01					;C - - - - - 0x016E41 05:8E31: A9 01
	STA ram_00CA				;C - - - - - 0x016E43 05:8E33: 85 CA
CODE_0B8E35:
	JSR CODE_0B85EB				;C - - - - - 0x016E45 05:8E35: 20 EB 85
CODE_0B8E38:
	JSR CODE_0FF9E8				;C - - - - - 0x016E48 05:8E38: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x016E4B 05:8E3B: A5 CA
	CMP #$80					;C - - - - - 0x016E4D 05:8E3D: C9 80
	BCC CODE_0B8E72				;C - - - - - 0x016E4F 05:8E3F: 90 31

	LDY enemyDir,X				;C - - - - - 0x016E51 05:8E41: B4 A2
	LDA HeitaiKunExposedAnims,Y			;C - - - - - 0x016E53 05:8E43: B9 98 8E
	STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x016E56 05:8E46: 9D 84 06
	LDA enemyHits,X				;C - - - - - 0x016E59 05:8E49: BD BE 04
	BNE CODE_0B8E53				;C - - - - - 0x016E5C 05:8E4C: D0 05
		LDA #$07					;C - - - - - 0x016E5E 05:8E4E: A9 07
		JSR CODE_0B9ED1				;C - - - - - 0x016E60 05:8E50: 20 D1 9E
CODE_0B8E53:
	LDA ram_00CA				;C - - - - - 0x016E63 05:8E53: A5 CA
	CMP #$C0					;C - - - - - 0x016E65 05:8E55: C9 C0
	BCC CODE_0B8E5F				;C - - - - - 0x016E67 05:8E57: 90 06
		JSR CODE_0B8446				;C - - - - - 0x016E69 05:8E59: 20 46 84
		JMP CODE_0B8E97				;C - - - - - 0x016E6C 05:8E5C: 4C 97 8E
CODE_0B8E5F:
	JSR CODE_0B9AA9				;C - - - - - 0x016E6F 05:8E5F: 20 A9 9A
	CMP #$02					;C - - - - - 0x016E72 05:8E62: C9 02
	BCC CODE_0B8E6C				;C - - - - - 0x016E74 05:8E64: 90 06
		JSR CODE_0FFAA3				;C - - - - - 0x016E76 05:8E66: 20 A3 FA
		JMP CODE_0B8E97				;C - - - - - 0x016E79 05:8E69: 4C 97 8E
CODE_0B8E6C:
	LDA ram_00CA				;C - - - - - 0x016E7C 05:8E6C: A5 CA
	AND #$1F					;C - - - - - 0x016E7E 05:8E6E: 29 1F
	STA ram_00CA				;C - - - - - 0x016E80 05:8E70: 85 CA
CODE_0B8E72:
	LDA ram_00CA				;C - - - - - 0x016E82 05:8E72: A5 CA
	CMP #$0F					;C - - - - - 0x016E84 05:8E74: C9 0F
	BEQ CODE_0B8E97				;C - - - - - 0x016E86 05:8E76: F0 1F
	CMP #$10					;C - - - - - 0x016E88 05:8E78: C9 10
	BEQ CODE_0B8E97				;C - - - - - 0x016E8A 05:8E7A: F0 1B
	LDA enemyHits,X				;C - - - - - 0x016E8C 05:8E7C: BD BE 04
	BEQ CODE_0B8E94				;C - - - - - 0x016E8F 05:8E7F: F0 13
		LDY enemyDir,X				;C - - - - - 0x016E91 05:8E81: B4 A2
		LDA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x016E93 05:8E83: BD 84 06
		CMP HeitaiKunExposedAnims,Y			;C - - - - - 0x016E96 05:8E86: D9 98 8E
		BEQ CODE_0B8E97				;C - - - - - 0x016E99 05:8E89: F0 0C
		LDA HeitaiKunExposedAnims,Y			;C - - - - - 0x016E9B 05:8E8B: B9 98 8E
		STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x016E9E 05:8E8E: 9D 84 06
		JMP CODE_0B8E97				;C - - - - - 0x016EA1 05:8E91: 4C 97 8E
CODE_0B8E94:
	JSR CODE_0B9846				;C - - - - - 0x016EA4 05:8E94: 20 46 98
CODE_0B8E97:
	RTS							;C - - - - - 0x016EA7 05:8E97: 60

HeitaiKunExposedAnims:
	.byte $00					;- - - - - - 0x016EA8 05:8E98: 00
	.byte anHeitaiKunExposedL_ID					;- D 0 - - - 0x016EA9 05:8E99: 87
	.byte anHeitaiKunExposedR_ID					;- D 0 - - - 0x016EAA 05:8E9A: 88

CODE_0B8E9B:
	LDA ram_00CD				;C - - - - - 0x016EAB 05:8E9B: A5 CD
	CMP #$80					;C - - - - - 0x016EAD 05:8E9D: C9 80
	BCC CODE_0B8EAC				;C - - - - - 0x016EAF 05:8E9F: 90 0B
		AND #$0F					;C - - - - - 0x016EB1 05:8EA1: 29 0F
		EOR #$FF					;C - - - - - 0x016EB3 05:8EA3: 49 FF
		STA ram_00D5				;C - - - - - 0x016EB5 05:8EA5: 85 D5
		INC ram_00D5				;C - - - - - 0x016EB7 05:8EA7: E6 D5
		JMP CODE_0B8EB0				;C - - - - - 0x016EB9 05:8EA9: 4C B0 8E
CODE_0B8EAC:
	LDA #$02					;C - - - - - 0x016EBC 05:8EAC: A9 02
	STA ram_00D5				;C - - - - - 0x016EBE 05:8EAE: 85 D5
CODE_0B8EB0:
	LDA #$00					;C - - - - - 0x016EC0 05:8EB0: A9 00
	STA ram_00D4				;C - - - - - 0x016EC2 05:8EB2: 85 D4
	RTS							;C - - - - - 0x016EC4 05:8EB4: 60

CarryHeliUpdate:
	LDA ram_00CA				;C - - - - - 0x016EC5 05:8EB5: A5 CA
	AND #$0F					;C - - - - - 0x016EC7 05:8EB7: 29 0F
	CMP #$03					;C - - - - - 0x016EC9 05:8EB9: C9 03
	BEQ CODE_0B8ECD				;C - - - - - 0x016ECB 05:8EBB: F0 10
	CMP #$04					;C - - - - - 0x016ECD 05:8EBD: C9 04
	BEQ CODE_0B8ECD				;C - - - - - 0x016ECF 05:8EBF: F0 0C
		JSR CODE_0FF9E8				;C - - - - - 0x016ED1 05:8EC1: 20 E8 F9
		LDA ram_00CA				;C - - - - - 0x016ED4 05:8EC4: A5 CA
		CMP #$80					;C - - - - - 0x016ED6 05:8EC6: C9 80
		BCC CODE_0B8ECD				;C - - - - - 0x016ED8 05:8EC8: 90 03
			JMP CODE_0B9057				;C - - - - - 0x016EDA 05:8ECA: 4C 57 90
CODE_0B8ECD:
	LDA enemyFrozenCycles				;C - - - - - 0x016EDD 05:8ECD: AD D4 04
	BEQ CODE_0B8ED5				;C - - - - - 0x016EE0 05:8ED0: F0 03
		;Unreached
		JMP CODE_0B9080				;- - - - - - 0x016EE2 05:8ED2: 4C

CODE_0B8ED5:
	LDA ram_00CA				;C - - - - - 0x016EE5 05:8ED5: A5 CA
	CMP #$01					;C - - - - - 0x016EE7 05:8ED7: C9 01
	BNE CODE_0B8F39				;C - - - - - 0x016EE9 05:8ED9: D0 5E

	LDY enemyDir,X				;C - - - - - 0x016EEB 05:8EDB: B4 A2
	LDA DATA_0B9081,Y			;C - - - - - 0x016EED 05:8EDD: B9 81 90
	STA ram_00D4				;C - - - - - 0x016EF0 05:8EE0: 85 D4
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x016EF2 05:8EE2: BD BC 05
	CMP #$F0					;C - - - - - 0x016EF5 05:8EE5: C9 F0
	BCS CODE_0B8F0D				;C - - - - - 0x016EF7 05:8EE7: B0 24
	CMP #$10					;C - - - - - 0x016EF9 05:8EE9: C9 10
	BCC CODE_0B8F0D				;C - - - - - 0x016EFB 05:8EEB: 90 20
		INC ram_04C8				;C - - - - - 0x016EFD 05:8EED: EE C8 04
		LDA ram_04C8				;C - - - - - 0x016F00 05:8EF0: AD C8 04
		CMP #$60					;C - - - - - 0x016F03 05:8EF3: C9 60
		BNE CODE_0B8F0A				;C - - - - - 0x016F05 05:8EF5: D0 13
			LDA #$02					;C - - - - - 0x016F07 05:8EF7: A9 02
			STA ram_00CA				;C - - - - - 0x016F09 05:8EF9: 85 CA
			LDY enemyDir,X				;C - - - - - 0x016F0B 05:8EFB: B4 A2
			LDA DATA_0B908D,Y			;C - - - - - 0x016F0D 05:8EFD: B9 8D 90
			JSR StartEnemyAnim2				;C - - - - - 0x016F10 05:8F00: 20 C2 9E
			LDA #$00					;C - - - - - 0x016F13 05:8F03: A9 00
			STA ram_00B6,X				;C - - - - - 0x016F15 05:8F05: 95 B6
			STA ram_04C8				;C - - - - - 0x016F17 05:8F07: 8D C8 04
CODE_0B8F0A:
	JMP CODE_0B9080				;C - - - - - 0x016F1A 05:8F0A: 4C 80 90
CODE_0B8F0D:
	LDA enemyDir,X				;C - - - - - 0x016F1D 05:8F0D: B5 A2
	CMP #$01					;C - - - - - 0x016F1F 05:8F0F: C9 01
	BNE CODE_0B8F1B				;C - - - - - 0x016F21 05:8F11: D0 08
		LDA #anCarryHeliExitL_ID					;C - - - - - 0x016F23 05:8F13: A9 85
		STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x016F25 05:8F15: 9D 84 06
		JMP CODE_0B8F20				;C - - - - - 0x016F28 05:8F18: 4C 20 8F
CODE_0B8F1B:
	LDA #anCarryHeliExitR_ID					;C - - - - - 0x016F2B 05:8F1B: A9 86
	STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x016F2D 05:8F1D: 9D 84 06
CODE_0B8F20:
	LDA #$03					;C - - - - - 0x016F30 05:8F20: A9 03
	STA ram_00CA				;C - - - - - 0x016F32 05:8F22: 85 CA
	LDA #$00					;C - - - - - 0x016F34 05:8F24: A9 00
	STA ram_00B6,X				;C - - - - - 0x016F36 05:8F26: 95 B6
	STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x016F38 05:8F28: 9D D4 06
	STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x016F3B 05:8F2B: 9D AC 06
	LDA enemyDir,X				;C - - - - - 0x016F3E 05:8F2E: B5 A2
	EOR #$03					;C - - - - - 0x016F40 05:8F30: 49 03
	STA enemyDir,X				;C - - - - - 0x016F42 05:8F32: 95 A2
	LDY enemyDir,X				;C - - - - - 0x016F44 05:8F34: B4 A2
	JMP CODE_0B9080				;C - - - - - 0x016F46 05:8F36: 4C 80 90
CODE_0B8F39:
	CMP #$02					;C - - - - - 0x016F49 05:8F39: C9 02
	BEQ CODE_0B8F40				;C - - - - - 0x016F4B 05:8F3B: F0 03
		JMP CODE_0B8FF1				;C - - - - - 0x016F4D 05:8F3D: 4C F1 8F
CODE_0B8F40:
	INC ram_00B6,X				;C - - - - - 0x016F50 05:8F40: F6 B6
	LDA ram_00B6,X				;C - - - - - 0x016F52 05:8F42: B5 B6
	CMP #$0E					;C - - - - - 0x016F54 05:8F44: C9 0E
	BEQ CODE_0B8F6A				;C - - - - - 0x016F56 05:8F46: F0 22
	CMP #$14					;C - - - - - 0x016F58 05:8F48: C9 14
	BEQ CODE_0B8F6A				;C - - - - - 0x016F5A 05:8F4A: F0 1E
	CMP #$1A					;C - - - - - 0x016F5C 05:8F4C: C9 1A
	BEQ CODE_0B8F6A				;C - - - - - 0x016F5E 05:8F4E: F0 1A
	CMP #$1E					;C - - - - - 0x016F60 05:8F50: C9 1E
	BNE CODE_0B8F67				;C - - - - - 0x016F62 05:8F52: D0 13
		LDY enemyDir,X				;C - - - - - 0x016F64 05:8F54: B4 A2
		LDA DATA_0B908A,Y			;C - - - - - 0x016F66 05:8F56: B9 8A 90
		JSR StartEnemyAnim2				;C - - - - - 0x016F69 05:8F59: 20 C2 9E
		LDA #$00					;C - - - - - 0x016F6C 05:8F5C: A9 00
		STA ram_00B6,X				;C - - - - - 0x016F6E 05:8F5E: 95 B6
		STA ram_04C8				;C - - - - - 0x016F70 05:8F60: 8D C8 04
		LDA #$01					;C - - - - - 0x016F73 05:8F63: A9 01
		STA ram_00CA				;C - - - - - 0x016F75 05:8F65: 85 CA
CODE_0B8F67:
	JMP CODE_0B9080				;C - - - - - 0x016F77 05:8F67: 4C 80 90
CODE_0B8F6A:
	LDA roundEnemies				;C - - - - - 0x016F7A 05:8F6A: AD A8 04
	CMP #$08					;C - - - - - 0x016F7D 05:8F6D: C9 08
	BNE CODE_0B8F83				;C - - - - - 0x016F7F 05:8F6F: D0 12
		TXA							;C - - - - - 0x016F81 05:8F71: 8A
		PHA							;C - - - - - 0x016F82 05:8F72: 48
		LDX #$01					;C - - - - - 0x016F83 05:8F73: A2 01
	CODE_0B8F75:
		LDA enemyType,X				;C - - - - - 0x016F85 05:8F75: B5 98
		BEQ CODE_0B8F89				;C - - - - - 0x016F87 05:8F77: F0 10
			INX							;C - - - - - 0x016F89 05:8F79: E8
			CPX #$08					;C - - - - - 0x016F8A 05:8F7A: E0 08
			BNE CODE_0B8F75				;C - - - - - 0x016F8C 05:8F7C: D0 F7

			PLA							;C - - - - - 0x016F8E 05:8F7E: 68
			TAX							;C - - - - - 0x016F8F 05:8F7F: AA
		JMP CODE_0B8FEE				;C - - - - - 0x016F90 05:8F80: 4C EE 8F
CODE_0B8F83:
	LDY roundEnemies				;C - - - - - 0x016F93 05:8F83: AC A8 04
	JMP CODE_0B8F91				;C - - - - - 0x016F96 05:8F86: 4C 91 8F
CODE_0B8F89:
	LDA #$00					;C - - - - - 0x016F99 05:8F89: A9 00
	STA ram_00B6,X				;C - - - - - 0x016F9B 05:8F8B: 95 B6
	TXA							;C - - - - - 0x016F9D 05:8F8D: 8A
	TAY							;C - - - - - 0x016F9E 05:8F8E: A8
	PLA							;C - - - - - 0x016F9F 05:8F8F: 68
	TAX							;C - - - - - 0x016FA0 05:8F90: AA
CODE_0B8F91:
	STY ram_04C8				;C - - - - - 0x016FA1 05:8F91: 8C C8 04
	LDA #$0F					;C - - - - - 0x016FA4 05:8F94: A9 0F
	STA objState+OSLOT_ENEMY,Y				;C - - - - - 0x016FA6 05:8F96: 99 6C 05
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x016FA9 05:8F99: BD 94 05
	STA objY+OSLOT_ENEMY,Y				;C - - - - - 0x016FAC 05:8F9C: 99 94 05
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x016FAF 05:8F9F: BD BC 05
	STA objX+OSLOT_ENEMY,Y				;C - - - - - 0x016FB2 05:8FA2: 99 BC 05
	LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x016FB5 05:8FA5: BD 34 06
	EOR #$01					;C - - - - - 0x016FB8 05:8FA8: 49 01
	STA objChrSlot+OSLOT_ENEMY,Y				;C - - - - - 0x016FBA 05:8FAA: 99 34 06
	LDA #anHeitaiKunPara_ID					;C - - - - - 0x016FBD 05:8FAD: A9 B1
	STA objAnim+OSLOT_ENEMY,Y				;C - - - - - 0x016FBF 05:8FAF: 99 84 06
	LDA #$02					;C - - - - - 0x016FC2 05:8FB2: A9 02
	STA objAttr+OSLOT_ENEMY,Y				;C - - - - - 0x016FC4 05:8FB4: 99 FC 06
	LDA #$00					;C - - - - - 0x016FC7 05:8FB7: A9 00
	STA objAnimProgress+OSLOT_ENEMY,Y				;C - - - - - 0x016FC9 05:8FB9: 99 D4 06
	STA objAnimTimer+OSLOT_ENEMY,Y				;C - - - - - 0x016FCC 05:8FBC: 99 AC 06
	STA enemyHits,Y				;C - - - - - 0x016FCF 05:8FBF: 99 BE 04
	TXA							;C - - - - - 0x016FD2 05:8FC2: 8A
	PHA							;C - - - - - 0x016FD3 05:8FC3: 48
	TYA							;C - - - - - 0x016FD4 05:8FC4: 98
	TAX							;C - - - - - 0x016FD5 05:8FC5: AA
	LDA #$00					;C - - - - - 0x016FD6 05:8FC6: A9 00
	STA ram_00C0,X				;C - - - - - 0x016FD8 05:8FC8: 95 C0
	PLA							;C - - - - - 0x016FDA 05:8FCA: 68
	TAX							;C - - - - - 0x016FDB 05:8FCB: AA
	LDA enemyDir,X				;C - - - - - 0x016FDC 05:8FCC: B5 A2
	STA scratch1				;C - - - - - 0x016FDE 05:8FCE: 85 01
	STX scratch0				;C - - - - - 0x016FE0 05:8FD0: 86 00
	LDA ram_04C8				;C - - - - - 0x016FE2 05:8FD2: AD C8 04
	TAY							;C - - - - - 0x016FE5 05:8FD5: A8
	TAX							;C - - - - - 0x016FE6 05:8FD6: AA
	LDA #$08					;C - - - - - 0x016FE7 05:8FD7: A9 08
	STA enemyType,X				;C - - - - - 0x016FE9 05:8FD9: 95 98
	LDA scratch1				;C - - - - - 0x016FEB 05:8FDB: A5 01
	STA enemyDir,X				;C - - - - - 0x016FED 05:8FDD: 95 A2
	JSR CODE_0B987E				;C - - - - - 0x016FEF 05:8FDF: 20 7E 98
	LDX scratch0				;C - - - - - 0x016FF2 05:8FE2: A6 00
	LDA roundEnemies				;C - - - - - 0x016FF4 05:8FE4: AD A8 04
	CMP #$08					;C - - - - - 0x016FF7 05:8FE7: C9 08
	BEQ CODE_0B8FEE				;C - - - - - 0x016FF9 05:8FE9: F0 03
		INC roundEnemies				;C - - - - - 0x016FFB 05:8FEB: EE A8 04
CODE_0B8FEE:
	JMP CODE_0B9080				;C - - - - - 0x016FFE 05:8FEE: 4C 80 90
CODE_0B8FF1:
	CMP #$03					;C - - - - - 0x017001 05:8FF1: C9 03
	BNE CODE_0B902D				;C - - - - - 0x017003 05:8FF3: D0 38

	INC ram_00B6,X				;C - - - - - 0x017005 05:8FF5: F6 B6
	LDA ram_00B6,X				;C - - - - - 0x017007 05:8FF7: B5 B6
	CMP #$FF					;C - - - - - 0x017009 05:8FF9: C9 FF
	BNE CODE_0B902A				;C - - - - - 0x01700B 05:8FFB: D0 2D
		LDA #$01					;C - - - - - 0x01700D 05:8FFD: A9 01
		STA ram_00CA				;C - - - - - 0x01700F 05:8FFF: 85 CA
		LDA #snEnemyThrow_ID					;C - - - - - 0x017011 05:9001: A9 26
		STA a:soundTrigger				;C - - - - - 0x017013 05:9003: 8D E1 00
		LDA enemyDir,X				;C - - - - - 0x017016 05:9006: B5 A2
		CMP #$01					;C - - - - - 0x017018 05:9008: C9 01
		BNE CODE_0B9014				;C - - - - - 0x01701A 05:900A: D0 08
			LDA #anCarryHeliL_ID					;C - - - - - 0x01701C 05:900C: A9 4B
			STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x01701E 05:900E: 9D 84 06
			JMP CODE_0B9019				;C - - - - - 0x017021 05:9011: 4C 19 90
	CODE_0B9014:
		LDA #anCarryHeliR_ID					;C - - - - - 0x017024 05:9014: A9 4C
		STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x017026 05:9016: 9D 84 06
	CODE_0B9019:
		LDY enemyDir,X				;C - - - - - 0x017029 05:9019: B4 A2
		LDA DATA_0B9084,Y			;C - - - - - 0x01702B 05:901B: B9 84 90
		STA ram_00D4				;C - - - - - 0x01702E 05:901E: 85 D4
		LDA #$00					;C - - - - - 0x017030 05:9020: A9 00
		STA ram_00B6,X				;C - - - - - 0x017032 05:9022: 95 B6
		STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x017034 05:9024: 9D D4 06
		STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x017037 05:9027: 9D AC 06
CODE_0B902A:
	JMP CODE_0B9080				;C - - - - - 0x01703A 05:902A: 4C 80 90
CODE_0B902D:
	CMP #$04					;C - - - - - 0x01703D 05:902D: C9 04
.ifdef REGION_JP
	BNE CODE_0B9080				;- - - - - - 0x017017 05:9007: D0
.else
	BNE CODE_0B907A				;C - - - - - 0x01703F 05:902F: D0 49
.endif

	LDY enemyDir,X				;C - - - - - 0x017041 05:9031: B4 A2
	LDA DATA_0B9081,Y			;C - - - - - 0x017043 05:9033: B9 81 90
	STA ram_00D4				;C - - - - - 0x017046 05:9036: 85 D4
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x017048 05:9038: BD BC 05
	CMP #$F0					;C - - - - - 0x01704B 05:903B: C9 F0
	BCS CODE_0B9051				;C - - - - - 0x01704D 05:903D: B0 12
	CMP #$03					;C - - - - - 0x01704F 05:903F: C9 03
	BCC CODE_0B9051				;C - - - - - 0x017051 05:9041: 90 0E
	LDA #$04					;C - - - - - 0x017053 05:9043: A9 04
	STA ram_00D5				;C - - - - - 0x017055 05:9045: 85 D5
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x017057 05:9047: BD 94 05
	CMP #$F0					;C - - - - - 0x01705A 05:904A: C9 F0
	BCS CODE_0B9051				;C - - - - - 0x01705C 05:904C: B0 03
		JMP CODE_0B9080				;C - - - - - 0x01705E 05:904E: 4C 80 90
CODE_0B9051:
	JSR CODE_0B9B2F				;C - - - - - 0x017061 05:9051: 20 2F 9B
	JMP CODE_0B9080				;C - - - - - 0x017064 05:9054: 4C 80 90
CODE_0B9057:
	JSR CODE_0B9AA9				;C - - - - - 0x017067 05:9057: 20 A9 9A
	CMP #$14					;C - - - - - 0x01706A 05:905A: C9 14
	BCC CODE_0B907A				;C - - - - - 0x01706C 05:905C: 90 1C
		LDA #$04					;C - - - - - 0x01706E 05:905E: A9 04
		STA ram_00CA				;C - - - - - 0x017070 05:9060: 85 CA
		LDA ram_00C0,X				;C - - - - - 0x017072 05:9062: B5 C0
		ORA #$80					;C - - - - - 0x017074 05:9064: 09 80
		STA ram_00C0,X				;C - - - - - 0x017076 05:9066: 95 C0
		LDY enemyDir,X				;C - - - - - 0x017078 05:9068: B4 A2
		LDA DATA_0B9087,Y			;C - - - - - 0x01707A 05:906A: B9 87 90
		JSR StartEnemyAnim2				;C - - - - - 0x01707D 05:906D: 20 C2 9E
		LDA #$00					;C - - - - - 0x017080 05:9070: A9 00
		STA ram_00B6,X				;C - - - - - 0x017082 05:9072: 95 B6
		JSR CODE_0B9B50				;C - - - - - 0x017084 05:9074: 20 50 9B
		JMP CODE_0B9080				;C - - - - - 0x017087 05:9077: 4C 80 90
CODE_0B907A:
	LDA ram_00CA				;C - - - - - 0x01708A 05:907A: A5 CA
	AND #$1F					;C - - - - - 0x01708C 05:907C: 29 1F
	STA ram_00CA				;C - - - - - 0x01708E 05:907E: 85 CA
CODE_0B9080:
	RTS							;C - - - - - 0x017090 05:9080: 60

DATA_0B9081:
	.byte $00					;- - - - - - 0x017091 05:9081: 00
	.byte $FE					;- D 0 - - - 0x017092 05:9082: FE
	.byte $02					;- D 0 - - - 0x017093 05:9083: 02

DATA_0B9084:
	.byte $00					;- - - - - - 0x017094 05:9084: 00
	.byte $E8					;- D 0 - - - 0x017095 05:9085: E8
	.byte $18					;- D 0 - - - 0x017096 05:9086: 18

DATA_0B9087:
	.byte $00					;- - - - - - 0x017097 05:9087: 00
	.byte anCarryHeliDieL_ID					;- D 0 - - - 0x017098 05:9088: A7
	.byte anCarryHeliDieR_ID					;- D 0 - - - 0x017099 05:9089: A8

DATA_0B908A:
	.byte $00					;- - - - - - 0x01709A 05:908A: 00
	.byte anCarryHeliL_ID					;- D 0 - - - 0x01709B 05:908B: 4B
	.byte anCarryHeliR_ID					;- D 0 - - - 0x01709C 05:908C: 4C

DATA_0B908D:
	.byte $00					;- - - - - - 0x01709D 05:908D: 00
	.byte anCarryHeliOpenL_ID					;- D 0 - - - 0x01709E 05:908E: 8B
	.byte anCarryHeliOpenR_ID					;- D 0 - - - 0x01709F 05:908F: 8C

FlarionUpdate:
	LDA globalTimer				;C - - - - - 0x0170A0 05:9090: A5 14
	AND #$7E					;C - - - - - 0x0170A2 05:9092: 29 7E
	BNE CODE_0B90AF				;C - - - - - 0x0170A4 05:9094: D0 19
		LDA #$02					;C - - - - - 0x0170A6 05:9096: A9 02
		JSR CODE_0B9ED1				;C - - - - - 0x0170A8 05:9098: 20 D1 9E
		LDA scratch0				;C - - - - - 0x0170AB 05:909B: A5 00
		BEQ CODE_0B90A5				;C - - - - - 0x0170AD 05:909D: F0 06
			JSR DespawnProj_Direct				;C - - - - - 0x0170AF 05:909F: 20 73 FE
			JMP CODE_0B90AF				;C - - - - - 0x0170B2 05:90A2: 4C AF 90
	CODE_0B90A5:
		LDA enemyFrozenCycles				;C - - - - - 0x0170B5 05:90A5: AD D4 04
		BNE CODE_0B90AF				;C - - - - - 0x0170B8 05:90A8: D0 05
			LDA #$03					;C - - - - - 0x0170BA 05:90AA: A9 03
			JSR CODE_0B9ED1				;C - - - - - 0x0170BC 05:90AC: 20 D1 9E
CODE_0B90AF:
	JSR CODE_0FF9E8				;C - - - - - 0x0170BF 05:90AF: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x0170C2 05:90B2: A5 CA
	CMP #$80					;C - - - - - 0x0170C4 05:90B4: C9 80
	BCC CODE_0B90C5				;C - - - - - 0x0170C6 05:90B6: 90 0D
		JSR CODE_0B9AA9				;C - - - - - 0x0170C8 05:90B8: 20 A9 9A
		CMP #$0A					;C - - - - - 0x0170CB 05:90BB: C9 0A
		BCC CODE_0B90D5				;C - - - - - 0x0170CD 05:90BD: 90 16

		JSR CODE_0B9B2F				;C - - - - - 0x0170CF 05:90BF: 20 2F 9B
		JMP CODE_0B90E0				;C - - - - - 0x0170D2 05:90C2: 4C E0 90
CODE_0B90C5:
	INC ram_00B6,X				;C - - - - - 0x0170D5 05:90C5: F6 B6
	LDA ram_00B6,X				;C - - - - - 0x0170D7 05:90C7: B5 B6
	CMP #$0A					;C - - - - - 0x0170D9 05:90C9: C9 0A
	BCC CODE_0B90E0				;C - - - - - 0x0170DB 05:90CB: 90 13
	LDA enemyHits,X				;C - - - - - 0x0170DD 05:90CD: BD BE 04
	BEQ CODE_0B90E0				;C - - - - - 0x0170E0 05:90D0: F0 0E
	DEC enemyHits,X				;C - - - - - 0x0170E2 05:90D2: DE BE 04
CODE_0B90D5:
	LDY enemyHits,X				;C - - - - - 0x0170E5 05:90D5: BC BE 04
	LDA DATA_0B90E1,Y			;C - - - - - 0x0170E8 05:90D8: B9 E1 90
	JSR StartEnemyAnim2				;C - - - - - 0x0170EB 05:90DB: 20 C2 9E
	STA ram_00B6,X				;C - - - - - 0x0170EE 05:90DE: 95 B6
CODE_0B90E0:
	RTS							;C - - - - - 0x0170F0 05:90E0: 60

DATA_0B90E1:
	.byte anFlarion_ID					;- D 0 - - - 0x0170F1 05:90E1: 4D
	.byte anFlarion_ID					;- D 0 - - - 0x0170F2 05:90E2: 4D
	.byte anFlarionShrunk_ID					;- D 0 - - - 0x0170F3 05:90E3: 8D
	.byte anFlarionShrunk_ID					;- D 0 - - - 0x0170F4 05:90E4: 8D
	.byte anFlarionSmall_ID					;- D 0 - - - 0x0170F5 05:90E5: 8E
	.byte anFlarionSmall_ID					;- D 0 - - - 0x0170F6 05:90E6: 8E
	.byte anFlarionSmaller_ID					;- D 0 - - - 0x0170F7 05:90E7: 8F
	.byte anFlarionSmaller_ID					;- D 0 - - - 0x0170F8 05:90E8: 8F
	.byte anFlarionSmallest_ID					;- D 0 - - - 0x0170F9 05:90E9: 90
	.byte anFlarionSmallest_ID					;- D 0 - - - 0x0170FA 05:90EA: 90

SnaggerUpdate:
	LDA ram_00CA				;C - - - - - 0x0170FB 05:90EB: A5 CA
	AND #$03					;C - - - - - 0x0170FD 05:90ED: 29 03
	CMP #$03					;C - - - - - 0x0170FF 05:90EF: C9 03
	BEQ CODE_0B9151				;C - - - - - 0x017101 05:90F1: F0 5E

	LDA ram_00CA				;C - - - - - 0x017103 05:90F3: A5 CA
	JSR CODE_0FF9E8				;C - - - - - 0x017105 05:90F5: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x017108 05:90F8: A5 CA
	CMP #$80					;C - - - - - 0x01710A 05:90FA: C9 80
	BCC CODE_0B9127				;C - - - - - 0x01710C 05:90FC: 90 29
		JSR CODE_0B9AA9				;C - - - - - 0x01710E 05:90FE: 20 A9 9A
		CMP #$14					;C - - - - - 0x017111 05:9101: C9 14
		BCC CODE_0B911E				;C - - - - - 0x017113 05:9103: 90 19
			LDA #snSnaggerDie_ID					;C - - - - - 0x017115 05:9105: A9 2C
			STA a:soundTrigger				;C - - - - - 0x017117 05:9107: 8D E1 00
			LDA #$03					;C - - - - - 0x01711A 05:910A: A9 03
			STA ram_00CA				;C - - - - - 0x01711C 05:910C: 85 CA
			LDA #anFlutterflyTrapped_ID					;C - - - - - 0x01711E 05:910E: A9 6B
			JSR StartEnemyAnim2				;C - - - - - 0x017120 05:9110: 20 C2 9E
			LDA #$01					;C - - - - - 0x017123 05:9113: A9 01
			STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x017125 05:9115: 9D 24 07
			JSR CODE_0B9B50				;C - - - - - 0x017128 05:9118: 20 50 9B
			JMP CODE_0B9169				;C - - - - - 0x01712B 05:911B: 4C 69 91
	CODE_0B911E:
		LDA ram_00CA				;C - - - - - 0x01712E 05:911E: A5 CA
		AND #$1F					;C - - - - - 0x017130 05:9120: 29 1F
		STA ram_00CA				;C - - - - - 0x017132 05:9122: 85 CA
		JMP CODE_0B9169				;C - - - - - 0x017134 05:9124: 4C 69 91
CODE_0B9127:
	LDA enemyFrozenCycles				;C - - - - - 0x017137 05:9127: AD D4 04
	BEQ CODE_0B912F				;C - - - - - 0x01713A 05:912A: F0 03
		;Unreached
		JMP CODE_0B9169				;- - - - - - 0x01713C 05:912C: 4C

CODE_0B912F:
	JSR CODE_0B916A				;C - - - - - 0x01713F 05:912F: 20 6A 91
	LDA ram_00CA				;C - - - - - 0x017142 05:9132: A5 CA
	CMP #$01					;C - - - - - 0x017144 05:9134: C9 01
	BNE CODE_0B9147				;C - - - - - 0x017146 05:9136: D0 0F
		LDA #$03					;C - - - - - 0x017148 05:9138: A9 03
		STA ram_00D4				;C - - - - - 0x01714A 05:913A: 85 D4
		JSR CODE_0B849D				;C - - - - - 0x01714C 05:913C: 20 9D 84
		JSR CODE_0B91A1				;C - - - - - 0x01714F 05:913F: 20 A1 91
		INC ram_00AC,X				;C - - - - - 0x017152 05:9142: F6 AC
		JMP CODE_0B9169				;C - - - - - 0x017154 05:9144: 4C 69 91
CODE_0B9147:
	CMP #$02					;C - - - - - 0x017157 05:9147: C9 02
	BNE CODE_0B9151				;C - - - - - 0x017159 05:9149: D0 06
		JSR CODE_0B91EC				;C - - - - - 0x01715B 05:914B: 20 EC 91
		JMP CODE_0B9169				;C - - - - - 0x01715E 05:914E: 4C 69 91
CODE_0B9151:
	CMP #$03					;C - - - - - 0x017161 05:9151: C9 03
	BNE CODE_0B9162				;C - - - - - 0x017163 05:9153: D0 0D
		LDA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x017165 05:9155: BD D4 06
		CMP #$04					;C - - - - - 0x017168 05:9158: C9 04
		BCC CODE_0B9169				;C - - - - - 0x01716A 05:915A: 90 0D
			JSR CODE_0B9B2F				;C - - - - - 0x01716C 05:915C: 20 2F 9B
			JMP CODE_0B9169				;C - - - - - 0x01716F 05:915F: 4C 69 91
CODE_0B9162:
	CMP #$04					;- - - - - - 0x017172 05:9162: C9
	BNE CODE_0B9169				;- - - - - - 0x017174 05:9164: D0
		JSR CODE_0B8327				;- - - - - - 0x017176 05:9166: 20
CODE_0B9169:
	RTS							;C - - - - - 0x017179 05:9169: 60

CODE_0B916A:
	LDA #$20					;C - - - - - 0x01717A 05:916A: A9 20
	STA ram_04AF,X				;C - - - - - 0x01717C 05:916C: 9D AF 04
	LDA ram_00AC,X				;C - - - - - 0x01717F 05:916F: B5 AC
	CMP #$60					;C - - - - - 0x017181 05:9171: C9 60
	BCS CODE_0B917B				;C - - - - - 0x017183 05:9173: B0 06
		LDA projTouchingPlayer				;C - - - - - 0x017185 05:9175: A5 CE
		AND #$C0					;C - - - - - 0x017187 05:9177: 29 C0
		BEQ CODE_0B9191				;C - - - - - 0x017189 05:9179: F0 16
CODE_0B917B:
	LDA enemyDir,X				;C - - - - - 0x01718B 05:917B: B5 A2
	EOR #$03					;C - - - - - 0x01718D 05:917D: 49 03
	STA enemyDir,X				;C - - - - - 0x01718F 05:917F: 95 A2
	TAY							;C - - - - - 0x017191 05:9181: A8
	LDA DATA_0B9259,Y			;C - - - - - 0x017192 05:9182: B9 59 92
	JSR StartEnemyAnim2				;C - - - - - 0x017195 05:9185: 20 C2 9E
	STA ram_00AC,X				;C - - - - - 0x017198 05:9188: 95 AC
	LDA #$01					;C - - - - - 0x01719A 05:918A: A9 01
	STA ram_00CA				;C - - - - - 0x01719C 05:918C: 85 CA
	JMP CODE_0B91A0				;C - - - - - 0x01719E 05:918E: 4C A0 91
CODE_0B9191:
	LDA ram_00CD				;C - - - - - 0x0171A1 05:9191: A5 CD
	CMP #$80					;C - - - - - 0x0171A3 05:9193: C9 80
	BCS CODE_0B91A0				;C - - - - - 0x0171A5 05:9195: B0 09
		LDA #$04					;- - - - - - 0x0171A7 05:9197: A9
		STA ram_00CA				;- - - - - - 0x0171A9 05:9199: 85
		LDA #$22					;- - - - - - 0x0171AB 05:919B: A9
		STA ram_04AF,X				;- - - - - - 0x0171AD 05:919D: 9D
CODE_0B91A0:
	RTS							;C - - - - - 0x0171B0 05:91A0: 60

CODE_0B91A1:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0171B1 05:91A1: BD 94 05
	CLC							;C - - - - - 0x0171B4 05:91A4: 18
	ADC #$10					;C - - - - - 0x0171B5 05:91A5: 69 10
	SEC							;C - - - - - 0x0171B7 05:91A7: 38
	SBC objY				;C - - - - - 0x0171B8 05:91A8: ED 8B 05
	BCC CODE_0B91E5				;C - - - - - 0x0171BB 05:91AB: 90 38
	CMP #$18					;C - - - - - 0x0171BD 05:91AD: C9 18
	BCS CODE_0B91E5				;C - - - - - 0x0171BF 05:91AF: B0 34
		LDY enemyDir,X				;C - - - - - 0x0171C1 05:91B1: B4 A2
		CPY #$01					;C - - - - - 0x0171C3 05:91B3: C0 01
		BNE CODE_0B91C3				;C - - - - - 0x0171C5 05:91B5: D0 0C
			LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x0171C7 05:91B7: BD BC 05
			SEC							;C - - - - - 0x0171CA 05:91BA: 38
			SBC objX				;C - - - - - 0x0171CB 05:91BB: ED B3 05
			BCC CODE_0B91E5				;C - - - - - 0x0171CE 05:91BE: 90 25
			JMP CODE_0B91CC				;C - - - - - 0x0171D0 05:91C0: 4C CC 91
CODE_0B91C3:
	LDA objX				;C - - - - - 0x0171D3 05:91C3: AD B3 05
	SEC							;C - - - - - 0x0171D6 05:91C6: 38
	SBC objX+OSLOT_ENEMY,X				;C - - - - - 0x0171D7 05:91C7: FD BC 05
	BCC CODE_0B91E5				;C - - - - - 0x0171DA 05:91CA: 90 19
CODE_0B91CC:
	CMP DATA_0B91E6,Y			;C - - - - - 0x0171DC 05:91CC: D9 E6 91
	BCS CODE_0B91E5				;C - - - - - 0x0171DF 05:91CF: B0 14
		LDA DATA_0B91E9,Y			;C - - - - - 0x0171E1 05:91D1: B9 E9 91
		CMP objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0171E4 05:91D4: DD 84 06
		BEQ CODE_0B91CC				;C - - - - - 0x0171E7 05:91D7: F0 F3

		JSR StartEnemyAnim2				;C - - - - - 0x0171E9 05:91D9: 20 C2 9E
		LDA #$02					;C - - - - - 0x0171EC 05:91DC: A9 02
		STA ram_00CA				;C - - - - - 0x0171EE 05:91DE: 85 CA
		LDA #snSnagger_ID					;C - - - - - 0x0171F0 05:91E0: A9 1D
		STA a:soundTrigger			;C - - - - - 0x0171F2 05:91E2: 8D E1 00
	CODE_0B91E5:
	RTS							;C - - - - - 0x0171F5 05:91E5: 60

DATA_0B91E6:
	.byte $00					;- - - - - - 0x0171F6 05:91E6: 00
	.byte $3C					;- D 0 - - - 0x0171F7 05:91E7: 3C
	.byte $44					;- D 0 - - - 0x0171F8 05:91E8: 44

DATA_0B91E9:
	.byte $00					;- - - - - - 0x0171F9 05:91E9: 00
	.byte anSnaggerAttackL_ID					;- D 0 - - - 0x0171FA 05:91EA: 73
	.byte anSnaggerAttackR_ID					;- D 0 - - - 0x0171FB 05:91EB: 74

CODE_0B91EC:
	LDA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x0171FC 05:91EC: BD D4 06
	CMP #$04					;C - - - - - 0x0171FF 05:91EF: C9 04
	BNE CODE_0B9243				;C - - - - - 0x017201 05:91F1: D0 50

	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x017203 05:91F3: BD 94 05
	CLC							;C - - - - - 0x017206 05:91F6: 18
	ADC #$1C					;C - - - - - 0x017207 05:91F7: 69 1C
	SEC							;C - - - - - 0x017209 05:91F9: 38
	SBC objY				;C - - - - - 0x01720A 05:91FA: ED 8B 05
	BCS CODE_0B9203				;C - - - - - 0x01720D 05:91FD: B0 04
		EOR #$FF					;C - - - - - 0x01720F 05:91FF: 49 FF
		ADC #$01					;C - - - - - 0x017211 05:9201: 69 01
CODE_0B9203:
	CMP #$10					;C - - - - - 0x017213 05:9203: C9 10
	BCC CODE_0B9258				;C - - - - - 0x017215 05:9205: 90 51

	LDY enemyDir,X				;C - - - - - 0x017217 05:9207: B4 A2
	CPY #$01					;C - - - - - 0x017219 05:9209: C0 01
	BNE CODE_0B9228				;C - - - - - 0x01721B 05:920B: D0 1B
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01721D 05:920D: BD BC 05
	CLC							;C - - - - - 0x017220 05:9210: 18
	ADC DATA_0B925C,Y			;C - - - - - 0x017221 05:9211: 79 5C 92
	CMP objX				;C - - - - - 0x017224 05:9214: CD B3 05
	BCS CODE_0B9258				;C - - - - - 0x017227 05:9217: B0 3F

	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x017229 05:9219: BD BC 05
	CMP objX				;C - - - - - 0x01722C 05:921C: CD B3 05
	BCC CODE_0B9258				;C - - - - - 0x01722F 05:921F: 90 37

	LDA #$80					;C - - - - - 0x017231 05:9221: A9 80
	STA playerDmgType				;C - - - - - 0x017233 05:9223: 85 7C
	JMP CODE_0B9258				;C - - - - - 0x017235 05:9225: 4C 58 92
CODE_0B9228:
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x017238 05:9228: BD BC 05
	CLC							;C - - - - - 0x01723B 05:922B: 18
	ADC DATA_0B925C,Y			;C - - - - - 0x01723C 05:922C: 79 5C 92
	CMP objX				;C - - - - - 0x01723F 05:922F: CD B3 05
	BCC CODE_0B9258				;C - - - - - 0x017242 05:9232: 90 24

	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x017244 05:9234: BD BC 05
	CMP objX				;C - - - - - 0x017247 05:9237: CD B3 05
	BCS CODE_0B9258				;C - - - - - 0x01724A 05:923A: B0 1C

	LDA #DMG_ENEMY					;C - - - - - 0x01724C 05:923C: A9 80
	STA playerDmgType				;C - - - - - 0x01724E 05:923E: 85 7C
	JMP CODE_0B9258				;C - - - - - 0x017250 05:9240: 4C 58 92
CODE_0B9243:
	LDA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x017253 05:9243: BD D4 06
	CMP #$08					;C - - - - - 0x017256 05:9246: C9 08
	BNE CODE_0B9258				;C - - - - - 0x017258 05:9248: D0 0E
		LDA #$01					;C - - - - - 0x01725A 05:924A: A9 01
		STA ram_00CA				;C - - - - - 0x01725C 05:924C: 85 CA
		LDY enemyDir,X				;C - - - - - 0x01725E 05:924E: B4 A2
		LDA DATA_0B9259,Y			;C - - - - - 0x017260 05:9250: B9 59 92
		JSR StartEnemyAnim2				;C - - - - - 0x017263 05:9253: 20 C2 9E
		STA ram_00AC,X				;C - - - - - 0x017266 05:9256: 95 AC
CODE_0B9258:
	RTS							;C - - - - - 0x017268 05:9258: 60

DATA_0B9259:
	.byte $00					;- - - - - - 0x017269 05:9259: 00
	.byte anSnaggerL_ID					;- D 0 - - - 0x01726A 05:925A: 41
	.byte anSnaggerR_ID					;- D 0 - - - 0x01726B 05:925B: 42

DATA_0B925C:
	.byte $00					;- - - - - - 0x01726C 05:925C: 00
	.byte $CE					;- D 0 - - - 0x01726D 05:925D: CE
	.byte $34					;- D 0 - - - 0x01726E 05:925E: 34
	.byte $00					;- - - - - - 0x01726F 05:925F: 00
	.byte $D8					;- - - - - - 0x017270 05:9260: D8
	.byte $2A					;- - - - - - 0x017271 05:9261: 2A

ManticharUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x017272 05:9262: AD D4 04
	BEQ CODE_0B926A				;C - - - - - 0x017275 05:9265: F0 03
		;Unreached
		JMP CODE_0B92AA				;- - - - - - 0x017277 05:9267: 4C
CODE_0B926A:
	INC ram_00B6,X				;C - - - - - 0x01727A 05:926A: F6 B6
	LDA ram_00CA				;C - - - - - 0x01727C 05:926C: A5 CA
	CMP #$01					;C - - - - - 0x01727E 05:926E: C9 01
	BNE CODE_0B9283				;C - - - - - 0x017280 05:9270: D0 11
		LDA ram_00B6,X				;C - - - - - 0x017282 05:9272: B5 B6
		CMP #$1E					;C - - - - - 0x017284 05:9274: C9 1E
		BNE CODE_0B92C8				;C - - - - - 0x017286 05:9276: D0 50
			LDA #$00					;C - - - - - 0x017288 05:9278: A9 00
			STA ram_00B6,X				;C - - - - - 0x01728A 05:927A: 95 B6
			LDA #$02					;C - - - - - 0x01728C 05:927C: A9 02
			STA ram_00CA				;C - - - - - 0x01728E 05:927E: 85 CA
			JMP CODE_0B92C8				;C - - - - - 0x017290 05:9280: 4C C8 92
CODE_0B9283:
	CMP #$02					;C - - - - - 0x017293 05:9283: C9 02
	BNE CODE_0B92AA				;C - - - - - 0x017295 05:9285: D0 23

	JSR CODE_0B9846				;C - - - - - 0x017297 05:9287: 20 46 98
	LDA globalTimer				;C - - - - - 0x01729A 05:928A: A5 14
	AND #$02					;C - - - - - 0x01729C 05:928C: 29 02
	BNE CODE_0B9293				;C - - - - - 0x01729E 05:928E: D0 03
		JSR CODE_0B92F7				;C - - - - - 0x0172A0 05:9290: 20 F7 92
CODE_0B9293:
	LDA ram_00B6,X				;C - - - - - 0x0172A3 05:9293: B5 B6
	CMP #$78					;C - - - - - 0x0172A5 05:9295: C9 78
	BNE CODE_0B92C8				;C - - - - - 0x0172A7 05:9297: D0 2F

	LDY enemyDir,X				;C - - - - - 0x0172A9 05:9299: B4 A2
	LDA DATA_0B92F4,Y			;C - - - - - 0x0172AB 05:929B: B9 F4 92
	JSR StartEnemyAnim2				;C - - - - - 0x0172AE 05:929E: 20 C2 9E
	STA ram_00B6,X				;C - - - - - 0x0172B1 05:92A1: 95 B6
	LDA #$01					;C - - - - - 0x0172B3 05:92A3: A9 01
	STA ram_00CA				;C - - - - - 0x0172B5 05:92A5: 85 CA
	JMP CODE_0B92C8				;C - - - - - 0x0172B7 05:92A7: 4C C8 92
CODE_0B92AA:
	CMP #$C6					;C - - - - - 0x0172BA 05:92AA: C9 C6
	BNE CODE_0B92B4				;C - - - - - 0x0172BC 05:92AC: D0 06
		LDA ram_00CA				;C - - - - - 0x0172BE 05:92AE: A5 CA
		AND #$06					;C - - - - - 0x0172C0 05:92B0: 29 06
		STA ram_00CA				;C - - - - - 0x0172C2 05:92B2: 85 CA
CODE_0B92B4:
	CMP #$06					;C - - - - - 0x0172C4 05:92B4: C9 06
	BNE CODE_0B92C8				;C - - - - - 0x0172C6 05:92B6: D0 10
		JSR CODE_0B8327				;C - - - - - 0x0172C8 05:92B8: 20 27 83
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0172CB 05:92BB: BD 94 05
		CMP #$E0					;C - - - - - 0x0172CE 05:92BE: C9 E0
		BCC CODE_0B92F3				;C - - - - - 0x0172D0 05:92C0: 90 31
			JSR CODE_0B9B2F				;C - - - - - 0x0172D2 05:92C2: 20 2F 9B
			JMP CODE_0B92F3				;C - - - - - 0x0172D5 05:92C5: 4C F3 92
CODE_0B92C8:
	JSR CODE_0FF9E8				;C - - - - - 0x0172D8 05:92C8: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x0172DB 05:92CB: A5 CA
	CMP #$80					;C - - - - - 0x0172DD 05:92CD: C9 80
	BCC CODE_0B92F3				;C - - - - - 0x0172DF 05:92CF: 90 22
	JSR CODE_0B9AA9				;C - - - - - 0x0172E1 05:92D1: 20 A9 9A
	CMP #$0A					;C - - - - - 0x0172E4 05:92D4: C9 0A
	BCS CODE_0B92E1				;C - - - - - 0x0172E6 05:92D6: B0 09
		LDA ram_00CA				;C - - - - - 0x0172E8 05:92D8: A5 CA
		AND #$1F					;C - - - - - 0x0172EA 05:92DA: 29 1F
		STA ram_00CA				;C - - - - - 0x0172EC 05:92DC: 85 CA
		JMP CODE_0B92F3				;C - - - - - 0x0172EE 05:92DE: 4C F3 92
CODE_0B92E1:
	LDA #$06					;C - - - - - 0x0172F1 05:92E1: A9 06
	STA ram_00CA				;C - - - - - 0x0172F3 05:92E3: 85 CA
	LDA ram_00C0,X				;C - - - - - 0x0172F5 05:92E5: B5 C0
	ORA #$80					;C - - - - - 0x0172F7 05:92E7: 09 80
	STA ram_00C0,X				;C - - - - - 0x0172F9 05:92E9: 95 C0
	LDA #anManticharDie_ID					;C - - - - - 0x0172FB 05:92EB: A9 A9
	JSR StartEnemyAnim2				;C - - - - - 0x0172FD 05:92ED: 20 C2 9E
	JSR CODE_0B9B50				;C - - - - - 0x017300 05:92F0: 20 50 9B
CODE_0B92F3:
	RTS							;C - - - - - 0x017303 05:92F3: 60

DATA_0B92F4:
	.byte $00					;- - - - - - 0x017304 05:92F4: 00
	.byte anManticharAngryL_ID					;- D 0 - - - 0x017305 05:92F5: 91
	.byte anManticharAngryR_ID					;- D 0 - - - 0x017306 05:92F6: 92

CODE_0B92F7:
	LDY enemyMad,X				;C - - - - - 0x017307 05:92F7: B4 63
	LDA #$00					;C - - - - - 0x017309 05:92F9: A9 00
	STA scratch0				;C - - - - - 0x01730B 05:92FB: 85 00
	LDA objY				;C - - - - - 0x01730D 05:92FD: AD 8B 05
	CMP objY+OSLOT_ENEMY,X				;C - - - - - 0x017310 05:9300: DD 94 05
	BEQ CODE_0B9314				;C - - - - - 0x017313 05:9303: F0 0F
	BCC CODE_0B930F				;C - - - - - 0x017315 05:9305: 90 08
		LDA DATA_0B9338,Y			;C - - - - - 0x017317 05:9307: B9 38 93
		STA ram_00D5				;C - - - - - 0x01731A 05:930A: 85 D5
		JMP CODE_0B9314				;C - - - - - 0x01731C 05:930C: 4C 14 93
CODE_0B930F:
	LDA DATA_0B933A,Y			;C - - - - - 0x01731F 05:930F: B9 3A 93
	STA ram_00D5				;C - - - - - 0x017322 05:9312: 85 D5
CODE_0B9314:
	LDA #$00					;C - - - - - 0x017324 05:9314: A9 00
	STA ram_00D4				;C - - - - - 0x017326 05:9316: 85 D4
	LDA objX				;C - - - - - 0x017328 05:9318: AD B3 05
	CMP objX+OSLOT_ENEMY,X				;C - - - - - 0x01732B 05:931B: DD BC 05
	BEQ CODE_0B9337				;C - - - - - 0x01732E 05:931E: F0 17
	BCC CODE_0B932E				;C - - - - - 0x017330 05:9320: 90 0C
		LDA DATA_0B9338,Y			;C - - - - - 0x017332 05:9322: B9 38 93
		STA ram_00D4				;C - - - - - 0x017335 05:9325: 85 D4
		LDA #$02					;C - - - - - 0x017337 05:9327: A9 02
		STA enemyDir,X				;C - - - - - 0x017339 05:9329: 95 A2
		JMP CODE_0B9337				;C - - - - - 0x01733B 05:932B: 4C 37 93
CODE_0B932E:
	LDA DATA_0B933A,Y			;C - - - - - 0x01733E 05:932E: B9 3A 93
	STA ram_00D4				;C - - - - - 0x017341 05:9331: 85 D4
	LDA #$01					;C - - - - - 0x017343 05:9333: A9 01
	STA enemyDir,X				;C - - - - - 0x017345 05:9335: 95 A2
CODE_0B9337:
	RTS							;C - - - - - 0x017347 05:9337: 60

DATA_0B9338:
	.byte $01					;- D 0 - - - 0x017348 05:9338: 01
	.byte $02					;- - - - - - 0x017349 05:9339: 02
DATA_0B933A:
	.byte $FF					;- D 0 - - - 0x01734A 05:933A: FF
	.byte $FE					;- - - - - - 0x01734B 05:933B: FE

RoboZenUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x01734C 05:933C: AD D4 04
	BEQ CODE_0B9344				;C - - - - - 0x01734F 05:933F: F0 03
		;Unreached
		JMP CODE_0B9442				;- - - - - - 0x017351 05:9341: 4C
CODE_0B9344:
	LDA ram_00CA				;C - - - - - 0x017354 05:9344: A5 CA
	CMP #$04					;C - - - - - 0x017356 05:9346: C9 04
	BCS CODE_0B938C				;C - - - - - 0x017358 05:9348: B0 42
		LDA objAnim+OSLOT_ENEMY+7,X				;C - - - - - 0x01735A 05:934A: BD 8B 06
		CMP #$FF					;C - - - - - 0x01735D 05:934D: C9 FF
		BEQ CODE_0B9357				;C - - - - - 0x01735F 05:934F: F0 06
		INC objAnim+OSLOT_ENEMY+7,X				;C - - - - - 0x017361 05:9351: FE 8B 06
		JMP CODE_0B938C				;C - - - - - 0x017364 05:9354: 4C 8C 93
CODE_0B9357:
	INC objY+OSLOT_ENEMY+7,X				;C - - - - - 0x017367 05:9357: FE 9B 05
	INC objY+OSLOT_ENEMY+7,X				;C - - - - - 0x01736A 05:935A: FE 9B 05
	LDA objY+OSLOT_ENEMY+7,X				;C - - - - - 0x01736D 05:935D: BD 9B 05
	CMP #$3C					;C - - - - - 0x017370 05:9360: C9 3C
	BCC CODE_0B937F				;C - - - - - 0x017372 05:9362: 90 1B
		LDA #$00					;C - - - - - 0x017374 05:9364: A9 00
		STA objY+OSLOT_ENEMY+7,X				;C - - - - - 0x017376 05:9366: 9D 9B 05
		ASL objX+OSLOT_ENEMY+7,X				;C - - - - - 0x017379 05:9369: 1E C3 05
		BCC CODE_0B937F				;C - - - - - 0x01737C 05:936C: 90 11
			LDA #$09					;C - - - - - 0x01737E 05:936E: A9 09
			STA ram_00CA				;C - - - - - 0x017380 05:9370: 85 CA
			LDA #$00					;C - - - - - 0x017382 05:9372: A9 00
			STA objY+OSLOT_ENEMY+7,X				;C - - - - - 0x017384 05:9374: 9D 9B 05
			STA objAnim+OSLOT_ENEMY+7,X				;C - - - - - 0x017387 05:9377: 9D 8B 06
			LDA #$01					;C - - - - - 0x01738A 05:937A: A9 01
			STA objX+OSLOT_ENEMY+7,X				;C - - - - - 0x01738C 05:937C: 9D C3 05
CODE_0B937F:
	LDA globalTimer				;C - - - - - 0x01738F 05:937F: A5 14
	AND objX+OSLOT_ENEMY+7,X				;C - - - - - 0x017391 05:9381: 3D C3 05
	BEQ CODE_0B938C				;C - - - - - 0x017394 05:9384: F0 06
		INC objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x017396 05:9386: FE AC 06
		JMP CODE_0B9442				;C - - - - - 0x017399 05:9389: 4C 42 94
CODE_0B938C:
	JSR CODE_0B8501				;C - - - - - 0x01739C 05:938C: 20 01 85
	LDA ram_00CA				;C - - - - - 0x01739F 05:938F: A5 CA
	CMP #$04					;C - - - - - 0x0173A1 05:9391: C9 04
	BNE CODE_0B9398				;C - - - - - 0x0173A3 05:9393: D0 03
		JMP CODE_0B9442				;C - - - - - 0x0173A5 05:9395: 4C 42 94
CODE_0B9398:
	CMP #$05					;C - - - - - 0x0173A8 05:9398: C9 05
	BNE CODE_0B93A3				;C - - - - - 0x0173AA 05:939A: D0 07
		;Unreached
		LDA #$00					;- - - - - - 0x0173AC 05:939C: A9
		STA ram_00D4				;- - - - - - 0x0173AE 05:939E: 85
		JMP CODE_0B9442				;- - - - - - 0x0173B0 05:93A0: 4C
CODE_0B93A3:
	CMP #$07					;C - - - - - 0x0173B3 05:93A3: C9 07
	BNE CODE_0B93B2				;C - - - - - 0x0173B5 05:93A5: D0 0B
		LDA #$08					;C - - - - - 0x0173B7 05:93A7: A9 08
		STA ram_00CA				;C - - - - - 0x0173B9 05:93A9: 85 CA
		LDA #$00					;C - - - - - 0x0173BB 05:93AB: A9 00
		STA ram_00B6,X				;C - - - - - 0x0173BD 05:93AD: 95 B6
		JMP CODE_0B9442				;C - - - - - 0x0173BF 05:93AF: 4C 42 94
CODE_0B93B2:
	CMP #$08					;C - - - - - 0x0173C2 05:93B2: C9 08
	BNE CODE_0B93FA				;C - - - - - 0x0173C4 05:93B4: D0 44

	INC ram_00B6,X				;C - - - - - 0x0173C6 05:93B6: F6 B6
	LDA ram_00B6,X				;C - - - - - 0x0173C8 05:93B8: B5 B6
	CMP #$01					;C - - - - - 0x0173CA 05:93BA: C9 01
	BNE CODE_0B93C9				;C - - - - - 0x0173CC 05:93BC: D0 0B
		LDA enemyDir,X				;C - - - - - 0x0173CE 05:93BE: B5 A2
		CLC							;C - - - - - 0x0173D0 05:93C0: 18
		ADC #anRoboZenShootL_ID-1					;C - - - - - 0x0173D1 05:93C1: 69 92
		JSR StartEnemyAnim2				;C - - - - - 0x0173D3 05:93C3: 20 C2 9E
		JMP CODE_0B93ED				;C - - - - - 0x0173D6 05:93C6: 4C ED 93
CODE_0B93C9:
	CMP #$08					;C - - - - - 0x0173D9 05:93C9: C9 08
	BNE CODE_0B93ED				;C - - - - - 0x0173DB 05:93CB: D0 20

	LDA #$04					;C - - - - - 0x0173DD 05:93CD: A9 04
	JSR CODE_0B9ED1				;C - - - - - 0x0173DF 05:93CF: 20 D1 9E
	STY scratch1				;C - - - - - 0x0173E2 05:93D2: 84 01
	LDY enemyDir,X				;C - - - - - 0x0173E4 05:93D4: B4 A2
	LDA DATA_0B946D,Y			;C - - - - - 0x0173E6 05:93D6: B9 6D 94
	LDY scratch1				;C - - - - - 0x0173E9 05:93D9: A4 01
	STA objAnim+OSLOT_PROJ,Y				;C - - - - - 0x0173EB 05:93DB: 99 7C 06
	LDA scratch0				;C - - - - - 0x0173EE 05:93DE: A5 00
	BEQ CODE_0B93E8				;C - - - - - 0x0173F0 05:93E0: F0 06
		JSR DespawnProj_Direct				;C - - - - - 0x0173F2 05:93E2: 20 73 FE
		JMP CODE_0B93ED				;C - - - - - 0x0173F5 05:93E5: 4C ED 93
CODE_0B93E8:
	LDA #snEnemyThrow_ID					;C - - - - - 0x0173F8 05:93E8: A9 26
	STA a:soundTrigger			;C - - - - - 0x0173FA 05:93EA: 8D E1 00
CODE_0B93ED:
	LDA ram_00B6,X				;C - - - - - 0x0173FD 05:93ED: B5 B6
	CMP #$10					;C - - - - - 0x0173FF 05:93EF: C9 10
	BCC CODE_0B93F7				;C - - - - - 0x017401 05:93F1: 90 04
		LDA #$01					;C - - - - - 0x017403 05:93F3: A9 01
		STA ram_00CA				;C - - - - - 0x017405 05:93F5: 85 CA
CODE_0B93F7:
	JMP CODE_0B9442				;C - - - - - 0x017407 05:93F7: 4C 42 94
CODE_0B93FA:
	CMP #$09					;C - - - - - 0x01740A 05:93FA: C9 09
	BNE CODE_0B941F				;C - - - - - 0x01740C 05:93FC: D0 21

	LDA #$01					;C - - - - - 0x01740E 05:93FE: A9 01
	STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x017410 05:9400: 9D AC 06
	INC objY+OSLOT_ENEMY+7,X				;C - - - - - 0x017413 05:9403: FE 9B 05
	LDA objY+OSLOT_ENEMY+7,X				;C - - - - - 0x017416 05:9406: BD 9B 05
	CMP #$30					;C - - - - - 0x017419 05:9409: C9 30
	BNE CODE_0B941C				;C - - - - - 0x01741B 05:940B: D0 0F
		LDA #$09					;C - - - - - 0x01741D 05:940D: A9 09
		JSR CODE_0B9ED1				;C - - - - - 0x01741F 05:940F: 20 D1 9E
		LDA #$F8					;C - - - - - 0x017422 05:9412: A9 F8
		STA objX+OSLOT_PROJ,Y				;C - - - - - 0x017424 05:9414: 99 B4 05
		LDA #$80					;C - - - - - 0x017427 05:9417: A9 80
		STA objY+OSLOT_PROJ,Y				;C - - - - - 0x017429 05:9419: 99 8C 05
CODE_0B941C:
	JMP CODE_0B9442				;C - - - - - 0x01742C 05:941C: 4C 42 94
CODE_0B941F:
	CMP #$0E					;C - - - - - 0x01742F 05:941F: C9 0E
	BNE CODE_0B942B				;C - - - - - 0x017431 05:9421: D0 08
		LDA #$00					;C - - - - - 0x017433 05:9423: A9 00
		STA objY+OSLOT_ENEMY+7,X				;C - - - - - 0x017435 05:9425: 9D 9B 05
		JMP CODE_0B9442				;C - - - - - 0x017438 05:9428: 4C 42 94
CODE_0B942B:
	CMP #$0F					;C - - - - - 0x01743B 05:942B: C9 0F
	BNE CODE_0B943F				;C - - - - - 0x01743D 05:942D: D0 10
		LDA #$0A					;C - - - - - 0x01743F 05:942F: A9 0A
		JSR CODE_0B9ED1				;C - - - - - 0x017441 05:9431: 20 D1 9E
		LDA #$0B					;C - - - - - 0x017444 05:9434: A9 0B
		JSR CODE_0B9ED1				;C - - - - - 0x017446 05:9436: 20 D1 9E
		JSR CODE_0B9B2F				;C - - - - - 0x017449 05:9439: 20 2F 9B
CODE_0B943C:
		JMP CODE_0B9442				;C - - - - - 0x01744C 05:943C: 4C 42 94
CODE_0B943F:
	JSR CODE_0B85EB				;C - - - - - 0x01744F 05:943F: 20 EB 85
CODE_0B9442:
	JSR CODE_0FF9E8				;C - - - - - 0x017452 05:9442: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x017455 05:9445: A5 CA
	CMP #$80					;C - - - - - 0x017457 05:9447: C9 80
	BCC CODE_0B945F				;C - - - - - 0x017459 05:9449: 90 14
		JSR CODE_0B9AA9				;C - - - - - 0x01745B 05:944B: 20 A9 9A
		CMP #$0F					;C - - - - - 0x01745E 05:944E: C9 0F
		BCC CODE_0B945C				;C - - - - - 0x017460 05:9450: 90 0A
			LDA #$0F					;C - - - - - 0x017462 05:9452: A9 0F
			STA ram_00CA				;C - - - - - 0x017464 05:9454: 85 CA
			JSR CODE_0B9B50				;C - - - - - 0x017466 05:9456: 20 50 9B
			JMP CODE_0B946C				;C - - - - - 0x017469 05:9459: 4C 6C 94
	CODE_0B945C:
		JMP CODE_0B946C				;C - - - - - 0x01746C 05:945C: 4C 6C 94
CODE_0B945F:
	LDA ram_00CA				;C - - - - - 0x01746F 05:945F: A5 CA
	CMP #$08					;C - - - - - 0x017471 05:9461: C9 08
	BEQ CODE_0B946C				;C - - - - - 0x017473 05:9463: F0 07

	CMP #$0E					;C - - - - - 0x017475 05:9465: C9 0E
	BEQ CODE_0B946C				;C - - - - - 0x017477 05:9467: F0 03
		JSR CODE_0B9846				;C - - - - - 0x017479 05:9469: 20 46 98
CODE_0B946C:
	RTS							;C - - - - - 0x01747C 05:946C: 60

DATA_0B946D:
	.byte $00					;- - - - - - 0x01747D 05:946D: 00
	.byte anRoboZenMissileLeft_ID					;- D 0 - - - 0x01747E 05:946E: B4
	.byte anRoboZenMissileRight_ID					;- D 0 - - - 0x01747F 05:946F: B7
	.byte $00					;- - - - - - 0x017480 05:9470: 00
	.byte anRoboZenShootL_ID					;- - - - - - 0x017481 05:9471: 93
	.byte anRoboZenShootR_ID					;- - - - - - 0x017482 05:9472: 94

KirikabunUpdate:
	LDA ram_00CA				;C - - - - - 0x017483 05:9473: A5 CA
	BNE CODE_0B947A				;C - - - - - 0x017485 05:9475: D0 03
		;Unreached
		JMP CODE_0B94EF				;- - - - - - 0x017487 05:9477: 4C
CODE_0B947A:
	CMP #$06					;C - - - - - 0x01748A 05:947A: C9 06
	BNE CODE_0B9492				;C - - - - - 0x01748C 05:947C: D0 14
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01748E 05:947E: BD 94 05
		CLC							;C - - - - - 0x017491 05:9481: 18
		ADC #$04					;C - - - - - 0x017492 05:9482: 69 04
		BCS CODE_0B948C				;C - - - - - 0x017494 05:9484: B0 06
			STA objY+OSLOT_ENEMY,X				;C - - - - - 0x017496 05:9486: 9D 94 05
			JMP CODE_0B94EF				;C - - - - - 0x017499 05:9489: 4C EF 94
	CODE_0B948C:
		JSR CODE_0B9B2F				;C - - - - - 0x01749C 05:948C: 20 2F 9B
		JMP CODE_0B94EF				;C - - - - - 0x01749F 05:948F: 4C EF 94
CODE_0B9492:
	JSR CODE_0FF9E8				;C - - - - - 0x0174A2 05:9492: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x0174A5 05:9495: A5 CA
	CMP #$01					;C - - - - - 0x0174A7 05:9497: C9 01
	BNE CODE_0B94B3				;C - - - - - 0x0174A9 05:9499: D0 18
		INC ram_00B6,X				;C - - - - - 0x0174AB 05:949B: F6 B6
		LDA ram_00B6,X				;C - - - - - 0x0174AD 05:949D: B5 B6
		CMP #$FF					;C - - - - - 0x0174AF 05:949F: C9 FF
		BNE CODE_0B94EF				;C - - - - - 0x0174B1 05:94A1: D0 4C
			LDA #anKirikabunBlink_ID					;C - - - - - 0x0174B3 05:94A3: A9 99
			JSR StartEnemyAnim2				;C - - - - - 0x0174B5 05:94A5: 20 C2 9E
			LDA #$00					;C - - - - - 0x0174B8 05:94A8: A9 00
			STA ram_00B6,X				;C - - - - - 0x0174BA 05:94AA: 95 B6
			LDA #$02					;C - - - - - 0x0174BC 05:94AC: A9 02
			STA ram_00CA				;C - - - - - 0x0174BE 05:94AE: 85 CA
			JMP CODE_0B94EF				;C - - - - - 0x0174C0 05:94B0: 4C EF 94
CODE_0B94B3:
	CMP #$02					;C - - - - - 0x0174C3 05:94B3: C9 02
	BNE CODE_0B94CF				;C - - - - - 0x0174C5 05:94B5: D0 18
		INC ram_00B6,X				;C - - - - - 0x0174C7 05:94B7: F6 B6
		LDA ram_00B6,X				;C - - - - - 0x0174C9 05:94B9: B5 B6
		CMP #$0F					;C - - - - - 0x0174CB 05:94BB: C9 0F
		BNE CODE_0B94EF				;C - - - - - 0x0174CD 05:94BD: D0 30
			JSR CODE_0B94F0				;C - - - - - 0x0174CF 05:94BF: 20 F0 94
			LDA #anKirikabun_ID					;C - - - - - 0x0174D2 05:94C2: A9 54
			JSR StartEnemyAnim2				;C - - - - - 0x0174D4 05:94C4: 20 C2 9E
			LDA #$00					;C - - - - - 0x0174D7 05:94C7: A9 00
			STA ram_00B6,X				;C - - - - - 0x0174D9 05:94C9: 95 B6
			LDA #$01					;C - - - - - 0x0174DB 05:94CB: A9 01
			STA ram_00CA				;C - - - - - 0x0174DD 05:94CD: 85 CA
CODE_0B94CF:
	LDA ram_00CA				;C - - - - - 0x0174DF 05:94CF: A5 CA
	CMP #$80					;C - - - - - 0x0174E1 05:94D1: C9 80
	BCC CODE_0B94EF				;C - - - - - 0x0174E3 05:94D3: 90 1A
		JSR CODE_0B9AA9				;C - - - - - 0x0174E5 05:94D5: 20 A9 9A
		CMP #$14					;C - - - - - 0x0174E8 05:94D8: C9 14
		BCC CODE_0B94EF				;C - - - - - 0x0174EA 05:94DA: 90 13
			LDA #anKirikabunDie_ID					;C - - - - - 0x0174EC 05:94DC: A9 AB
			JSR StartEnemyAnim2				;C - - - - - 0x0174EE 05:94DE: 20 C2 9E
			JSR CODE_0B9B50				;C - - - - - 0x0174F1 05:94E1: 20 50 9B
			LDA #$00					;C - - - - - 0x0174F4 05:94E4: A9 00
			STA ram_00B6,X				;C - - - - - 0x0174F6 05:94E6: 95 B6
			LDA #$06					;C - - - - - 0x0174F8 05:94E8: A9 06
			STA ram_00CA				;C - - - - - 0x0174FA 05:94EA: 85 CA
			JMP CODE_0B94EF				;C - - - - - 0x0174FC 05:94EC: 4C EF 94
CODE_0B94EF:
	RTS							;C - - - - - 0x0174FF 05:94EF: 60

CODE_0B94F0:
	LDA roundEnemies				;C - - - - - 0x017500 05:94F0: AD A8 04
	CMP #$08					;C - - - - - 0x017503 05:94F3: C9 08
	BNE CODE_0B9514				;C - - - - - 0x017505 05:94F5: D0 1D
		;Unreached
		TXA							;- - - - - - 0x017507 05:94F7: 8A
		PHA							;- - - - - - 0x017508 05:94F8: 48
		LDX #$01					;- - - - - - 0x017509 05:94F9: A2

	CODE_0B94FB:
		LDA enemyType,X				;- - - - - - 0x01750B 05:94FB: B5
		BEQ CODE_0B9509				;- - - - - - 0x01750D 05:94FD: F0
			INX							;- - - - - - 0x01750F 05:94FF: E8
			CPX #$08					;- - - - - - 0x017510 05:9500: E0
			BNE CODE_0B94FB				;- - - - - - 0x017512 05:9502: D0
				PLA							;- - - - - - 0x017514 05:9504: 68
				TAX							;- - - - - - 0x017515 05:9505: AA
				JMP CODE_0B9562				;- - - - - - 0x017516 05:9506: 4C
	CODE_0B9509:
		LDA #$00					;- - - - - - 0x017519 05:9509: A9
		STA ram_00B6,X				;- - - - - - 0x01751B 05:950B: 95
		TXA							;- - - - - - 0x01751D 05:950D: 8A
		TAY							;- - - - - - 0x01751E 05:950E: A8
		PLA							;- - - - - - 0x01751F 05:950F: 68
		TAX							;- - - - - - 0x017520 05:9510: AA
		JMP CODE_0B9517				;- - - - - - 0x017521 05:9511: 4C
CODE_0B9514:
	LDY roundEnemies				;C - - - - - 0x017524 05:9514: AC A8 04
CODE_0B9517:
	STY ram_04C8				;C - - - - - 0x017527 05:9517: 8C C8 04
	LDA #$01					;C - - - - - 0x01752A 05:951A: A9 01
	STA objState+OSLOT_ENEMY,Y				;C - - - - - 0x01752C 05:951C: 99 6C 05
	STA enemyDir,X				;C - - - - - 0x01752F 05:951F: 95 A2
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x017531 05:9521: BD 94 05
	STA objY+OSLOT_ENEMY,Y				;C - - - - - 0x017534 05:9524: 99 94 05
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x017537 05:9527: BD BC 05
	STA objX+OSLOT_ENEMY,Y				;C - - - - - 0x01753A 05:952A: 99 BC 05
	LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x01753D 05:952D: BD 34 06
	STA objChrSlot+OSLOT_ENEMY,Y				;C - - - - - 0x017540 05:9530: 99 34 06
	LDA #anFlutterfly_ID					;C - - - - - 0x017543 05:9533: A9 55
	STA objAnim+OSLOT_ENEMY,Y				;C - - - - - 0x017545 05:9535: 99 84 06
	LDA #$00					;C - - - - - 0x017548 05:9538: A9 00
	STA objAnimProgress+OSLOT_ENEMY,Y				;C - - - - - 0x01754A 05:953A: 99 D4 06
	STA objAnimTimer+OSLOT_ENEMY,Y				;C - - - - - 0x01754D 05:953D: 99 AC 06
	TXA							;C - - - - - 0x017550 05:9540: 8A
	PHA							;C - - - - - 0x017551 05:9541: 48
	TYA							;C - - - - - 0x017552 05:9542: 98
	TAX							;C - - - - - 0x017553 05:9543: AA
	LDA #$00					;C - - - - - 0x017554 05:9544: A9 00
	STA ram_00C0,X				;C - - - - - 0x017556 05:9546: 95 C0
	PLA							;C - - - - - 0x017558 05:9548: 68
	TAX							;C - - - - - 0x017559 05:9549: AA
	STA objAttr+OSLOT_ENEMY,Y				;C - - - - - 0x01755A 05:954A: 99 FC 06
	STX scratch0				;C - - - - - 0x01755D 05:954D: 86 00
	LDX ram_04C8				;C - - - - - 0x01755F 05:954F: AE C8 04
	LDA #$11					;C - - - - - 0x017562 05:9552: A9 11
	STA enemyType,X				;C - - - - - 0x017564 05:9554: 95 98
	LDA roundEnemies				;C - - - - - 0x017566 05:9556: AD A8 04
	CMP #$08					;C - - - - - 0x017569 05:9559: C9 08
	BEQ CODE_0B9560				;C - - - - - 0x01756B 05:955B: F0 03
		INC roundEnemies				;C - - - - - 0x01756D 05:955D: EE A8 04
CODE_0B9560:
	LDX scratch0				;C - - - - - 0x017570 05:9560: A6 00
CODE_0B9562:
	RTS							;C - - - - - 0x017572 05:9562: 60

FlutterflyUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x017573 05:9563: AD D4 04
	BNE CODE_0B95A6				;C - - - - - 0x017576 05:9566: D0 3E

	LDA ram_00CA				;C - - - - - 0x017578 05:9568: A5 CA
	CMP #$01					;C - - - - - 0x01757A 05:956A: C9 01
	BEQ CODE_0B9571				;C - - - - - 0x01757C 05:956C: F0 03
		JMP CODE_0B959E				;C - - - - - 0x01757E 05:956E: 4C 9E 95
CODE_0B9571:
	LDA objX				;C - - - - - 0x017581 05:9571: AD B3 05
	CMP objX+OSLOT_ENEMY,X				;C - - - - - 0x017584 05:9574: DD BC 05
	BEQ CODE_0B9586				;C - - - - - 0x017587 05:9577: F0 0D
	BCC CODE_0B9582				;C - - - - - 0x017589 05:9579: 90 07
		LDA #$01					;C - - - - - 0x01758B 05:957B: A9 01
		STA ram_00D4				;C - - - - - 0x01758D 05:957D: 85 D4
		JMP CODE_0B9586				;C - - - - - 0x01758F 05:957F: 4C 86 95
CODE_0B9582:
	LDA #$FF					;C - - - - - 0x017592 05:9582: A9 FF
	STA ram_00D4				;C - - - - - 0x017594 05:9584: 85 D4
CODE_0B9586:
	LDA objY				;C - - - - - 0x017596 05:9586: AD 8B 05
	CMP objY+OSLOT_ENEMY,X				;C - - - - - 0x017599 05:9589: DD 94 05
	BEQ CODE_0B959B				;C - - - - - 0x01759C 05:958C: F0 0D
	BCC CODE_0B9597				;C - - - - - 0x01759E 05:958E: 90 07
		LDA #$01					;C - - - - - 0x0175A0 05:9590: A9 01
		STA ram_00D5				;C - - - - - 0x0175A2 05:9592: 85 D5
		JMP CODE_0B959B				;C - - - - - 0x0175A4 05:9594: 4C 9B 95
CODE_0B9597:
	LDA #$FF					;C - - - - - 0x0175A7 05:9597: A9 FF
	STA ram_00D5				;C - - - - - 0x0175A9 05:9599: 85 D5
CODE_0B959B:
	JMP CODE_0B95A6				;C - - - - - 0x0175AB 05:959B: 4C A6 95
CODE_0B959E:
	CMP #$02					;C - - - - - 0x0175AE 05:959E: C9 02
	BNE CODE_0B95A6				;C - - - - - 0x0175B0 05:95A0: D0 04

	;Unreached
	LDA #$01					;- - - - - - 0x0175B2 05:95A2: A9
	STA ram_00CA				;- - - - - - 0x0175B4 05:95A4: 85
CODE_0B95A6:
	JSR CODE_0B842F				;C - - - - - 0x0175B6 05:95A6: 20 2F 84
	LDA ram_00CA				;C - - - - - 0x0175B9 05:95A9: A5 CA
	RTS							;C - - - - - 0x0175BB 05:95AB: 60

TwizzerUpdate:
	JSR CODE_0FF9E8				;C - - - - - 0x0175BC 05:95AC: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x0175BF 05:95AF: A5 CA
	CMP #$01					;C - - - - - 0x0175C1 05:95B1: C9 01
	BNE CODE_0B95D0				;C - - - - - 0x0175C3 05:95B3: D0 1B
		INC ram_00B6,X				;C - - - - - 0x0175C5 05:95B5: F6 B6
		LDA ram_00B6,X				;C - - - - - 0x0175C7 05:95B7: B5 B6
		CMP #$3C					;C - - - - - 0x0175C9 05:95B9: C9 3C
		BEQ CODE_0B95C0				;C - - - - - 0x0175CB 05:95BB: F0 03
			JMP CODE_0B9657				;C - - - - - 0x0175CD 05:95BD: 4C 57 96
	CODE_0B95C0:
		LDA #$02					;C - - - - - 0x0175D0 05:95C0: A9 02
		STA ram_00CA				;C - - - - - 0x0175D2 05:95C2: 85 CA
		LDA #anTwizzerSpin_ID					;C - - - - - 0x0175D4 05:95C4: A9 57
		JSR StartEnemyAnim2				;C - - - - - 0x0175D6 05:95C6: 20 C2 9E
		LDA #$00					;C - - - - - 0x0175D9 05:95C9: A9 00
		STA ram_00B6,X				;C - - - - - 0x0175DB 05:95CB: 95 B6
		JMP CODE_0B9657				;C - - - - - 0x0175DD 05:95CD: 4C 57 96
CODE_0B95D0:
	CMP #$02					;C - - - - - 0x0175E0 05:95D0: C9 02
	BNE CODE_0B95ED				;C - - - - - 0x0175E2 05:95D2: D0 19
		INC ram_00B6,X				;C - - - - - 0x0175E4 05:95D4: F6 B6
		LDA ram_00B6,X				;C - - - - - 0x0175E6 05:95D6: B5 B6
		CMP #$96					;C - - - - - 0x0175E8 05:95D8: C9 96
		BEQ CODE_0B95DF				;C - - - - - 0x0175EA 05:95DA: F0 03
			JMP CODE_0B9657				;C - - - - - 0x0175EC 05:95DC: 4C 57 96
	CODE_0B95DF:
		LDA #$01					;C - - - - - 0x0175EF 05:95DF: A9 01
		STA ram_00CA				;C - - - - - 0x0175F1 05:95E1: 85 CA
		LDA #anTwizzer_ID					;C - - - - - 0x0175F3 05:95E3: A9 9C
		JSR StartEnemyAnim2				;C - - - - - 0x0175F5 05:95E5: 20 C2 9E
		STA ram_00B6,X				;C - - - - - 0x0175F8 05:95E8: 95 B6
		JMP CODE_0B9657				;C - - - - - 0x0175FA 05:95EA: 4C 57 96
CODE_0B95ED:
	CMP #$03					;C - - - - - 0x0175FD 05:95ED: C9 03
	BEQ CODE_0B95F7				;C - - - - - 0x0175FF 05:95EF: F0 06
		AND #$03					;C - - - - - 0x017601 05:95F1: 29 03
		CMP #$03					;C - - - - - 0x017603 05:95F3: C9 03
		BNE CODE_0B9607				;C - - - - - 0x017605 05:95F5: D0 10
CODE_0B95F7:
	LDA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x017607 05:95F7: BD D4 06
	CMP #$03					;C - - - - - 0x01760A 05:95FA: C9 03
	BEQ CODE_0B9601				;C - - - - - 0x01760C 05:95FC: F0 03
		JMP CODE_0B9657				;C - - - - - 0x01760E 05:95FE: 4C 57 96
CODE_0B9601:
	JSR CODE_0B9B2F				;C - - - - - 0x017611 05:9601: 20 2F 9B
	JMP CODE_0B9657				;C - - - - - 0x017614 05:9604: 4C 57 96
CODE_0B9607:
	LDA ram_00CA				;C - - - - - 0x017617 05:9607: A5 CA
	CMP #$C0					;C - - - - - 0x017619 05:9609: C9 C0
	BCS CODE_0B9617				;C - - - - - 0x01761B 05:960B: B0 0A
		CMP #$7F					;C - - - - - 0x01761D 05:960D: C9 7F
		BCC CODE_0B9657				;C - - - - - 0x01761F 05:960F: 90 46
			AND #$0F					;C - - - - - 0x017621 05:9611: 29 0F
			CMP #$02					;C - - - - - 0x017623 05:9613: C9 02
			BEQ CODE_0B9630				;C - - - - - 0x017625 05:9615: F0 19
CODE_0B9617:
	JSR CODE_0B9AA9				;C - - - - - 0x017627 05:9617: 20 A9 9A
	CMP #$14					;C - - - - - 0x01762A 05:961A: C9 14
	BCC CODE_0B962D				;C - - - - - 0x01762C 05:961C: 90 0F
		LDA #$03					;C - - - - - 0x01762E 05:961E: A9 03
		STA ram_00CA				;C - - - - - 0x017630 05:9620: 85 CA
		LDA #anTwizzerDie_ID					;C - - - - - 0x017632 05:9622: A9 AD
		JSR StartEnemyAnim2				;C - - - - - 0x017634 05:9624: 20 C2 9E
		JSR CODE_0B9B50				;C - - - - - 0x017637 05:9627: 20 50 9B
		JMP CODE_0B9657				;C - - - - - 0x01763A 05:962A: 4C 57 96
CODE_0B962D:
	JMP CODE_0B9657				;C - - - - - 0x01763D 05:962D: 4C 57 96
CODE_0B9630:
	AND #$1F					;C - - - - - 0x017640 05:9630: 29 1F
	STA ram_00CA				;C - - - - - 0x017642 05:9632: 85 CA
	LDA #$00					;C - - - - - 0x017644 05:9634: A9 00
	STA shootQueuedBubbles				;C - - - - - 0x017646 05:9636: 8D 16 05
	STA shootTrigger				;C - - - - - 0x017649 05:9639: 8D 15 05
	STA shooting				;C - - - - - 0x01764C 05:963C: 8D 17 05
	LDY shootInitialSlot				;C - - - - - 0x01764F 05:963F: AC 18 05
	LDA #$01					;C - - - - - 0x017652 05:9642: A9 01
	STA objState+OSLOT_BUBBLE,Y				;C - - - - - 0x017654 05:9644: 99 77 05
	LDA #anBubble_ID					;C - - - - - 0x017657 05:9647: A9 27
	STA objAnim+OSLOT_BUBBLE,Y				;C - - - - - 0x017659 05:9649: 99 8F 06
	LDA #$00					;C - - - - - 0x01765C 05:964C: A9 00
	STA objAnimProgress+OSLOT_BUBBLE,Y				;C - - - - - 0x01765E 05:964E: 99 DF 06
	STA objAnimTimer+OSLOT_BUBBLE,Y				;C - - - - - 0x017661 05:9651: 99 B7 06
	JMP CODE_0B95D0				;C - - - - - 0x017664 05:9654: 4C D0 95
CODE_0B9657:
	RTS							;C - - - - - 0x017667 05:9657: 60

DrunkUpdate:
	LDA enemyFrozenCycles				;C - - - - - 0x017668 05:9658: AD D4 04
	BEQ CODE_0B9660				;C - - - - - 0x01766B 05:965B: F0 03
		;Unreached
		JMP CODE_0B97F7				;- - - - - - 0x01766D 05:965D: 4C
CODE_0B9660:
	LDA #$00					;C - - - - - 0x017670 05:9660: A9 00
	STA projScriptOfs				;C - - - - - 0x017672 05:9662: 85 5D
	LDA enemyType,X				;C - - - - - 0x017674 05:9664: B5 98
	CMP #$10					;C - - - - - 0x017676 05:9666: C9 10
	BEQ CODE_0B966C				;C - - - - - 0x017678 05:9668: F0 02
		INC projScriptOfs				;C - - - - - 0x01767A 05:966A: E6 5D
CODE_0B966C:
	LDA ram_00CA				;C - - - - - 0x01767C 05:966C: A5 CA
	CMP #$01					;C - - - - - 0x01767E 05:966E: C9 01
	BNE CODE_0B968E				;C - - - - - 0x017680 05:9670: D0 1C
		INC ram_00CA				;C - - - - - 0x017682 05:9672: E6 CA
		LDA #$00					;C - - - - - 0x017684 05:9674: A9 00
		STA ram_00AC,X				;C - - - - - 0x017686 05:9676: 95 AC
		STA enemyReward,X				;C - - - - - 0x017688 05:9678: 95 8E
		LDA #$01					;C - - - - - 0x01768A 05:967A: A9 01
		STA ram_04AF,X				;C - - - - - 0x01768C 05:967C: 9D AF 04
		LDA globalTimer				;C - - - - - 0x01768F 05:967F: A5 14
		AND #$02					;C - - - - - 0x017691 05:9681: 29 02
		LSR							;C - - - - - 0x017693 05:9683: 4A
		STA enemyDir,X				;C - - - - - 0x017694 05:9684: 95 A2
		INC enemyDir,X				;C - - - - - 0x017696 05:9686: F6 A2
		JSR CODE_0B97FA				;C - - - - - 0x017698 05:9688: 20 FA 97
		JMP CODE_0B97C2				;C - - - - - 0x01769B 05:968B: 4C C2 97
CODE_0B968E:
	CMP #$02					;C - - - - - 0x01769E 05:968E: C9 02
	BEQ CODE_0B9695				;C - - - - - 0x0176A0 05:9690: F0 03
		JMP CODE_0B9715				;C - - - - - 0x0176A2 05:9692: 4C 15 97
CODE_0B9695:
	LDA ram_00CD				;C - - - - - 0x0176A5 05:9695: A5 CD
	BEQ CODE_0B96A9				;C - - - - - 0x0176A7 05:9697: F0 10
		AND #$07					;C - - - - - 0x0176A9 05:9699: 29 07
		STA scratch0				;C - - - - - 0x0176AB 05:969B: 85 00
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0176AD 05:969D: BD 94 05
		SEC							;C - - - - - 0x0176B0 05:96A0: 38
		SBC scratch0				;C - - - - - 0x0176B1 05:96A1: E5 00
		STA objY+OSLOT_ENEMY,X				;C - - - - - 0x0176B3 05:96A3: 9D 94 05
		JMP CODE_0B96AF				;C - - - - - 0x0176B6 05:96A6: 4C AF 96
CODE_0B96A9:
	LDA #$02					;C - - - - - 0x0176B9 05:96A9: A9 02
	STA ram_00D5				;C - - - - - 0x0176BB 05:96AB: 85 D5
	BNE CODE_0B9712				;C - - - - - 0x0176BD 05:96AD: D0 63
CODE_0B96AF:
	LDA projTouchingPlayer				;C - - - - - 0x0176BF 05:96AF: A5 CE
	BEQ CODE_0B96B9				;C - - - - - 0x0176C1 05:96B1: F0 06
		JSR CODE_0B97FA				;C - - - - - 0x0176C3 05:96B3: 20 FA 97
		JMP CODE_0B9712				;C - - - - - 0x0176C6 05:96B6: 4C 12 97
CODE_0B96B9:
	LDA enemyDir,X				;C - - - - - 0x0176C9 05:96B9: B5 A2
	STA scratch0				;C - - - - - 0x0176CB 05:96BB: 85 00
	DEC scratch0				;C - - - - - 0x0176CD 05:96BD: C6 00
	LDA enemyMad,X				;C - - - - - 0x0176CF 05:96BF: B5 63
	ASL							;C - - - - - 0x0176D1 05:96C1: 0A
	CLC							;C - - - - - 0x0176D2 05:96C2: 18
	ADC scratch0				;C - - - - - 0x0176D3 05:96C3: 65 00
	TAY							;C - - - - - 0x0176D5 05:96C5: A8
	LDA DATA_0B982E,Y			;C - - - - - 0x0176D6 05:96C6: B9 2E 98
	STA ram_00D4				;C - - - - - 0x0176D9 05:96C9: 85 D4
	LDA currentRound				;C - - - - - 0x0176DB 05:96CB: A5 D8
	CMP #$1C					;C - - - - - 0x0176DD 05:96CD: C9 1C
	BNE CODE_0B96DB				;C - - - - - 0x0176DF 05:96CF: D0 0A
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x0176E1 05:96D1: BD 94 05
		CMP #$70					;C - - - - - 0x0176E4 05:96D4: C9 70
		BNE CODE_0B96DB				;C - - - - - 0x0176E6 05:96D6: D0 03
			JMP CODE_0B97C2				;C - - - - - 0x0176E8 05:96D8: 4C C2 97
CODE_0B96DB:
	LDA ram_00CD				;C - - - - - 0x0176EB 05:96DB: A5 CD
	CMP #$C0					;C - - - - - 0x0176ED 05:96DD: C9 C0
	BCS CODE_0B96F3				;C - - - - - 0x0176EF 05:96DF: B0 12

	LDA ram_00B6,X				;C - - - - - 0x0176F1 05:96E1: B5 B6
	BNE CODE_0B96F3				;C - - - - - 0x0176F3 05:96E3: D0 0E

	JSR CODE_0B981F				;C - - - - - 0x0176F5 05:96E5: 20 1F 98
	CMP #$08					;C - - - - - 0x0176F8 05:96E8: C9 08
	BCS CODE_0B96F3				;C - - - - - 0x0176FA 05:96EA: B0 07
		LDA #$04					;C - - - - - 0x0176FC 05:96EC: A9 04
		STA ram_00CA				;C - - - - - 0x0176FE 05:96EE: 85 CA
		JMP CODE_0B9712				;C - - - - - 0x017700 05:96F0: 4C 12 97
CODE_0B96F3:
	INC ram_00B6,X				;C - - - - - 0x017703 05:96F3: F6 B6
	LDA ram_00B6,X				;C - - - - - 0x017705 05:96F5: B5 B6
	CMP #$1E					;C - - - - - 0x017707 05:96F7: C9 1E
		BCC CODE_0B9712				;C - - - - - 0x017709 05:96F9: 90 17
		LDA #$00					;C - - - - - 0x01770B 05:96FB: A9 00
		STA ram_00B6,X				;C - - - - - 0x01770D 05:96FD: 95 B6
		LDA objY				;C - - - - - 0x01770F 05:96FF: AD 8B 05
		CMP objY+OSLOT_ENEMY,X				;C - - - - - 0x017712 05:9702: DD 94 05
		BCS CODE_0B9712				;C - - - - - 0x017715 05:9705: B0 0B
			JSR CODE_0B981F				;C - - - - - 0x017717 05:9707: 20 1F 98
			CMP #$10					;C - - - - - 0x01771A 05:970A: C9 10
			BCC CODE_0B9712				;C - - - - - 0x01771C 05:970C: 90 04
				LDA #$03					;C - - - - - 0x01771E 05:970E: A9 03
				STA ram_00CA				;C - - - - - 0x017720 05:9710: 85 CA
CODE_0B9712:
	JMP CODE_0B97C2				;C - - - - - 0x017722 05:9712: 4C C2 97
CODE_0B9715:
	CMP #$03					;C - - - - - 0x017725 05:9715: C9 03
	BNE CODE_0B9759				;C - - - - - 0x017727 05:9717: D0 40

	INC ram_00B6,X				;C - - - - - 0x017729 05:9719: F6 B6
	LDA ram_00B6,X				;C - - - - - 0x01772B 05:971B: B5 B6
	CMP #$1F					;C - - - - - 0x01772D 05:971D: C9 1F
	BCC CODE_0B9749				;C - - - - - 0x01772F 05:971F: 90 28
	BNE CODE_0B972A				;C - - - - - 0x017731 05:9721: D0 07
		JSR CODE_0B9832				;C - - - - - 0x017733 05:9723: 20 32 98
		LDA #$F5					;C - - - - - 0x017736 05:9726: A9 F5
		STA ram_00AC,X				;C - - - - - 0x017738 05:9728: 95 AC
CODE_0B972A:
	INC ram_00AC,X				;C - - - - - 0x01773A 05:972A: F6 AC
	LDA ram_00AC,X				;C - - - - - 0x01773C 05:972C: B5 AC
	BMI CODE_0B9752				;C - - - - - 0x01773E 05:972E: 30 22
		CMP #$03					;C - - - - - 0x017740 05:9730: C9 03
		BCC CODE_0B9738				;C - - - - - 0x017742 05:9732: 90 04
		LDA #$03					;C - - - - - 0x017744 05:9734: A9 03
		STA ram_00AC,X				;C - - - - - 0x017746 05:9736: 95 AC
CODE_0B9738:
	LDA ram_00CD				;C - - - - - 0x017748 05:9738: A5 CD
	BEQ CODE_0B9752				;C - - - - - 0x01774A 05:973A: F0 16
		LDA #$00					;C - - - - - 0x01774C 05:973C: A9 00
		STA ram_00AC,X				;C - - - - - 0x01774E 05:973E: 95 AC
		STA ram_00B6,X				;C - - - - - 0x017750 05:9740: 95 B6
		LDA #$02					;C - - - - - 0x017752 05:9742: A9 02
		STA ram_00CA				;C - - - - - 0x017754 05:9744: 85 CA
		JMP CODE_0B9752				;C - - - - - 0x017756 05:9746: 4C 52 97
CODE_0B9749:
	LDA globalTimer				;C - - - - - 0x017759 05:9749: A5 14
	AND #$0F					;C - - - - - 0x01775B 05:974B: 29 0F
	BNE CODE_0B9752				;C - - - - - 0x01775D 05:974D: D0 03
		JSR CODE_0B97FA				;C - - - - - 0x01775F 05:974F: 20 FA 97
CODE_0B9752:
	LDA ram_00AC,X				;C - - - - - 0x017762 05:9752: B5 AC
	STA ram_00D5				;C - - - - - 0x017764 05:9754: 85 D5
	JMP CODE_0B97C2				;C - - - - - 0x017766 05:9756: 4C C2 97
CODE_0B9759:
	CMP #$04					;C - - - - - 0x017769 05:9759: C9 04
	BNE CODE_0B9777				;C - - - - - 0x01776B 05:975B: D0 1A
		INC ram_00CA				;C - - - - - 0x01776D 05:975D: E6 CA
		JSR CODE_0B9832				;C - - - - - 0x01776F 05:975F: 20 32 98
		LDA #$00					;C - - - - - 0x017772 05:9762: A9 00
		STA ram_00B6,X				;C - - - - - 0x017774 05:9764: 95 B6
		LDA projScriptOfs				;C - - - - - 0x017776 05:9766: A5 5D
		TAY							;C - - - - - 0x017778 05:9768: A8
		LDA enemyDir,X				;C - - - - - 0x017779 05:9769: B5 A2
		CLC							;C - - - - - 0x01777B 05:976B: 18
		ADC DATA_0B9775,Y			;C - - - - - 0x01777C 05:976C: 79 75 97
		JSR StartEnemyAnim2				;C - - - - - 0x01777F 05:976F: 20 C2 9E
		JMP CODE_0B97C2				;C - - - - - 0x017782 05:9772: 4C C2 97

DATA_0B9775:
	.byte anDrunkThrowL_ID-1					;- D 0 - - - 0x017785 05:9775: 9C
	.byte anChuckerShootL_ID-1					;- D 0 - - - 0x017786 05:9776: C2

CODE_0B9777:
	CMP #$05					;C - - - - - 0x017787 05:9777: C9 05
	BNE CODE_0B97AC				;C - - - - - 0x017789 05:9779: D0 31

	INC ram_00B6,X				;C - - - - - 0x01778B 05:977B: F6 B6
	LDA ram_00B6,X				;C - - - - - 0x01778D 05:977D: B5 B6
	CMP #$06					;C - - - - - 0x01778F 05:977F: C9 06
	BNE CODE_0B979F				;C - - - - - 0x017791 05:9781: D0 1C
		LDA projScriptOfs				;C - - - - - 0x017793 05:9783: A5 5D
		BNE CODE_0B978E				;C - - - - - 0x017795 05:9785: D0 07
			LDA #snDrunkThrow_ID					;C - - - - - 0x017797 05:9787: A9 20
			STA a:soundTrigger			;C - - - - - 0x017799 05:9789: 8D E1 00
			BNE CODE_0B9793				;C - - - - - 0x01779C 05:978C: D0 05
CODE_0B978E:
	LDA #snEnemyThrow_ID					;C - - - - - 0x01779E 05:978E: A9 26
	STA a:soundTrigger				;C - - - - - 0x0177A0 05:9790: 8D E1 00
CODE_0B9793:
	LDA #$05					;C - - - - - 0x0177A3 05:9793: A9 05
	CLC							;C - - - - - 0x0177A5 05:9795: 18
	ADC projScriptOfs				;C - - - - - 0x0177A6 05:9796: 65 5D
	JSR CODE_0B9ED1				;C - - - - - 0x0177A8 05:9798: 20 D1 9E
	LDA projScriptOfs				;C - - - - - 0x0177AB 05:979B: A5 5D
	BNE CODE_0B97A5				;C - - - - - 0x0177AD 05:979D: D0 06
CODE_0B979F:
	LDA ram_00B6,X				;C - - - - - 0x0177AF 05:979F: B5 B6
	CMP #$0A					;C - - - - - 0x0177B1 05:97A1: C9 0A
	BCC CODE_0B97A9				;C - - - - - 0x0177B3 05:97A3: 90 04
CODE_0B97A5:
	LDA #$06					;C - - - - - 0x0177B5 05:97A5: A9 06
	STA ram_00CA				;C - - - - - 0x0177B7 05:97A7: 85 CA
CODE_0B97A9:
	JMP CODE_0B97C2				;C - - - - - 0x0177B9 05:97A9: 4C C2 97
CODE_0B97AC:
	CMP #$06					;C - - - - - 0x0177BC 05:97AC: C9 06
	BNE CODE_0B97C2				;C - - - - - 0x0177BE 05:97AE: D0 12

	LDA projScriptOfs				;C - - - - - 0x0177C0 05:97B0: A5 5D
	BEQ CODE_0B97BC				;C - - - - - 0x0177C2 05:97B2: F0 08
		LDA #$02					;C - - - - - 0x0177C4 05:97B4: A9 02
		STA ram_00CA				;C - - - - - 0x0177C6 05:97B6: 85 CA
		LDA #$1E					;C - - - - - 0x0177C8 05:97B8: A9 1E
		STA enemyReward,X				;C - - - - - 0x0177CA 05:97BA: 95 8E
CODE_0B97BC:
	JSR CODE_0B9800				;C - - - - - 0x0177CC 05:97BC: 20 00 98
	JMP CODE_0B97C2				;C - - - - - 0x0177CF 05:97BF: 4C C2 97
CODE_0B97C2:
	LDA enemyReward,X				;C - - - - - 0x0177D2 05:97C2: B5 8E
	BEQ CODE_0B97CD				;C - - - - - 0x0177D4 05:97C4: F0 07
		DEC enemyReward,X				;C - - - - - 0x0177D6 05:97C6: D6 8E
		BNE CODE_0B97CD				;C - - - - - 0x0177D8 05:97C8: D0 03
			JSR CODE_0B9800				;C - - - - - 0x0177DA 05:97CA: 20 00 98
CODE_0B97CD:
	JSR CODE_0FF9E8				;C - - - - - 0x0177DD 05:97CD: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x0177E0 05:97D0: A5 CA
	CMP #$80					;C - - - - - 0x0177E2 05:97D2: C9 80
	BCC CODE_0B97F7				;C - - - - - 0x0177E4 05:97D4: 90 21
		CMP #$C0					;C - - - - - 0x0177E6 05:97D6: C9 C0
		BCC CODE_0B97E0				;C - - - - - 0x0177E8 05:97D8: 90 06
			JSR CODE_0B8446				;C - - - - - 0x0177EA 05:97DA: 20 46 84
			JMP CODE_0B97F7				;C - - - - - 0x0177ED 05:97DD: 4C F7 97
CODE_0B97E0:
	JSR CODE_0B9AA9				;C - - - - - 0x0177F0 05:97E0: 20 A9 9A
	LDY projScriptOfs				;C - - - - - 0x0177F3 05:97E3: A4 5D
	CMP DATA_0B97F8,Y			;C - - - - - 0x0177F5 05:97E5: D9 F8 97
	BCC CODE_0B97F1				;C - - - - - 0x0177F8 05:97E8: 90 07
		JSR CODE_0FFAA3				;C - - - - - 0x0177FA 05:97EA: 20 A3 FA
		LDA #$00					;C - - - - - 0x0177FD 05:97ED: A9 00
		STA ram_00C0,X				;C - - - - - 0x0177FF 05:97EF: 95 C0
CODE_0B97F1:
.ifndef REGION_JP
	LDA ram_00CA				;C - - - - - 0x017801 05:97F1: A5 CA
	AND #$1F					;C - - - - - 0x017803 05:97F3: 29 1F
	STA ram_00CA				;C - - - - - 0x017805 05:97F5: 85 CA
.endif
CODE_0B97F7:
	RTS							;C - - - - - 0x017807 05:97F7: 60

DATA_0B97F8:
	.byte $0A					;- D 0 - - - 0x017808 05:97F8: 0A
	.byte $01					;- D 0 - - - 0x017809 05:97F9: 01

CODE_0B97FA:
	LDA enemyDir,X				;C - - - - - 0x01780A 05:97FA: B5 A2
	EOR #$03					;C - - - - - 0x01780C 05:97FC: 49 03
	STA enemyDir,X				;C - - - - - 0x01780E 05:97FE: 95 A2
CODE_0B9800:
	LDA projScriptOfs				;C - - - - - 0x017810 05:9800: A5 5D
	TAY							;C - - - - - 0x017812 05:9802: A8
	LDA enemyDir,X				;C - - - - - 0x017813 05:9803: B5 A2
	CLC							;C - - - - - 0x017815 05:9805: 18
	ADC DATA_0B981D,Y			;C - - - - - 0x017816 05:9806: 79 1D 98
	STA scratch0				;C - - - - - 0x017819 05:9809: 85 00
	LDA projScriptOfs				;C - - - - - 0x01781B 05:980B: A5 5D
	BEQ CODE_0B9817				;C - - - - - 0x01781D 05:980D: F0 08
		LDA enemyReward,X				;C - - - - - 0x01781F 05:980F: B5 8E
		BEQ CODE_0B9817				;C - - - - - 0x017821 05:9811: F0 04
			INC scratch0				;C - - - - - 0x017823 05:9813: E6 00
			INC scratch0				;C - - - - - 0x017825 05:9815: E6 00
CODE_0B9817:
	LDA scratch0				;C - - - - - 0x017827 05:9817: A5 00
	JSR StartEnemyAnim2				;C - - - - - 0x017829 05:9819: 20 C2 9E
	RTS							;C - - - - - 0x01782C 05:981C: 60

DATA_0B981D:
	.byte anDrunkL_ID-1					;- D 0 - - - 0x01782D 05:981D: 57
	.byte anChuckerL_ID-1					;- D 0 - - - 0x01782E 05:981E: BE

CODE_0B981F:
	LDA objY				;C - - - - - 0x01782F 05:981F: AD 8B 05
	SEC							;C - - - - - 0x017832 05:9822: 38
	SBC objY+OSLOT_ENEMY,X				;C - - - - - 0x017833 05:9823: FD 94 05
	BPL CODE_0B982D				;C - - - - - 0x017836 05:9826: 10 05
		EOR #$FF					;C - - - - - 0x017838 05:9828: 49 FF
		CLC							;C - - - - - 0x01783A 05:982A: 18
		ADC #$01					;C - - - - - 0x01783B 05:982B: 69 01
CODE_0B982D:
	RTS							;C - - - - - 0x01783D 05:982D: 60

DATA_0B982E:
	.byte -2					;- D 0 - - - 0x01783E 05:982E: FE
	.byte 2					;- D 0 - - - 0x01783F 05:982F: 02
	.byte -4					;- D 0 - - - 0x017840 05:9830: FC
	.byte 4					;- D 0 - - - 0x017841 05:9831: 04

CODE_0B9832:
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x017842 05:9832: BD BC 05
	CMP objX				;C - - - - - 0x017845 05:9835: CD B3 05
	BCC CODE_0B983E				;C - - - - - 0x017848 05:9838: 90 04
		LDA #$01					;C - - - - - 0x01784A 05:983A: A9 01
		BNE CODE_0B9840				;C - - - - - 0x01784C 05:983C: D0 02
CODE_0B983E:
	LDA #$02					;C - - - - - 0x01784E 05:983E: A9 02
CODE_0B9840:
	STA enemyDir,X				;C - - - - - 0x017850 05:9840: 95 A2
	JSR CODE_0B9800				;C - - - - - 0x017852 05:9842: 20 00 98
	RTS							;C - - - - - 0x017855 05:9845: 60

CODE_0B9846:
	LDA enemyType,X				;C - - - - - 0x017856 05:9846: B5 98
	ASL							;C - - - - - 0x017858 05:9848: 0A
	CLC							;C - - - - - 0x017859 05:9849: 18
	ADC enemyDir,X				;C - - - - - 0x01785A 05:984A: 75 A2
	TAY							;C - - - - - 0x01785C 05:984C: A8
	LDA EnemyDefaultAnims,Y			;C - - - - - 0x01785D 05:984D: B9 B6 BD
	CMP objAnim+OSLOT_ENEMY,X				;C - - - - - 0x017860 05:9850: DD 84 06
	BEQ CODE_0B9858				;C - - - - - 0x017863 05:9853: F0 03
		JSR StartEnemyAnim2				;C - - - - - 0x017865 05:9855: 20 C2 9E
CODE_0B9858:
	RTS							;C - - - - - 0x017868 05:9858: 60

CODE_0B9859:
	LDA enemyType,X				;C - - - - - 0x017869 05:9859: B5 98
	CMP #$01					;C - - - - - 0x01786B 05:985B: C9 01
	BEQ CODE_0B986E				;C - - - - - 0x01786D 05:985D: F0 0F
	CMP #$08					;C - - - - - 0x01786F 05:985F: C9 08
	BEQ CODE_0B986E				;C - - - - - 0x017871 05:9861: F0 0B
	CMP #$0D					;C - - - - - 0x017873 05:9863: C9 0D
	BEQ CODE_0B986E				;C - - - - - 0x017875 05:9865: F0 07
	CMP #$10					;C - - - - - 0x017877 05:9867: C9 10
	BEQ CODE_0B986E				;C - - - - - 0x017879 05:9869: F0 03
		JMP CODE_0B9873				;C - - - - - 0x01787B 05:986B: 4C 73 98
CODE_0B986E:
	LDA DATA_0B9874,X			;C - - - - - 0x01787E 05:986E: BD 74 98
	STA ram_00B6,X				;C - - - - - 0x017881 05:9871: 95 B6
CODE_0B9873:
	RTS							;C - - - - - 0x017883 05:9873: 60

DATA_0B9874:
	.byte $78					;- D 0 - - - 0x017884 05:9874: 78
	.byte $82					;- D 0 - - - 0x017885 05:9875: 82
	.byte $8C					;- D 0 - - - 0x017886 05:9876: 8C
	.byte $96					;- D 0 - - - 0x017887 05:9877: 96
	.byte $A0					;- D 0 - - - 0x017888 05:9878: A0
	.byte $AA					;- D 0 - - - 0x017889 05:9879: AA
	.byte $B4					;- D 0 - - - 0x01788A 05:987A: B4
	.byte $BE					;- D 0 - - - 0x01788B 05:987B: BE
	.byte $C8					;- - - - - - 0x01788C 05:987C: C8
	.byte $D2					;- - - - - - 0x01788D 05:987D: D2

CODE_0B987E:
	LDA enemyType,X				;C - - - - - 0x01788E 05:987E: B5 98
	CMP #$01					;C - - - - - 0x017890 05:9880: C9 01
	BEQ CODE_0B989B				;C - - - - - 0x017892 05:9882: F0 17
	CMP #$08					;C - - - - - 0x017894 05:9884: C9 08
	BEQ CODE_0B989B				;C - - - - - 0x017896 05:9886: F0 13
	CMP #$0D					;C - - - - - 0x017898 05:9888: C9 0D
	BEQ CODE_0B989B				;C - - - - - 0x01789A 05:988A: F0 0F
	CMP #$10					;C - - - - - 0x01789C 05:988C: C9 10
	BEQ CODE_0B989B				;C - - - - - 0x01789E 05:988E: F0 0B
	CMP #$13					;C - - - - - 0x0178A0 05:9890: C9 13
	BEQ CODE_0B989B				;C - - - - - 0x0178A2 05:9892: F0 07
	CMP #$17					;C - - - - - 0x0178A4 05:9894: C9 17
	BEQ CODE_0B989B				;C - - - - - 0x0178A6 05:9896: F0 03
		JMP CODE_0B98A0				;C - - - - - 0x0178A8 05:9898: 4C A0 98
CODE_0B989B:
	LDA DATA_0B98A1,X			;C - - - - - 0x0178AB 05:989B: BD A1 98
	STA enemyReward,X				;C - - - - - 0x0178AE 05:989E: 95 8E
CODE_0B98A0:
	RTS							;C - - - - - 0x0178B0 05:98A0: 60

DATA_0B98A1:
	.byte $02					;- D 0 - - - 0x0178B1 05:98A1: 02
	.byte $01					;- D 0 - - - 0x0178B2 05:98A2: 01
	.byte $02					;- D 0 - - - 0x0178B3 05:98A3: 02
	.byte $01					;- D 0 - - - 0x0178B4 05:98A4: 01
	.byte $02					;- D 0 - - - 0x0178B5 05:98A5: 02
	.byte $01					;- D 0 - - - 0x0178B6 05:98A6: 01
	.byte $02					;- D 0 - - - 0x0178B7 05:98A7: 02
	.byte $01					;- D 0 - - - 0x0178B8 05:98A8: 01
	.byte $02					;- - - - - - 0x0178B9 05:98A9: 02
	.byte $01					;- - - - - - 0x0178BA 05:98AA: 01

DOHUpdate:
	LDA #.LOBYTE(CODE_08997F)					;C - - - - - 0x0178BB 05:98AB: A9 7F
	STA bankedSub				;C - - - - - 0x0178BD 05:98AD: 85 55
	LDA #.HIBYTE(CODE_08997F)					;C - - - - - 0x0178BF 05:98AF: A9 99
	STA bankedSub+1				;C - - - - - 0x0178C1 05:98B1: 85 56
	LDA #.BANK(CODE_08997F)					;C - - - - - 0x0178C3 05:98B3: A9 08
	STA bankedSubBank				;C - - - - - 0x0178C5 05:98B5: 85 57
	LDA #.BANK(*)					;C - - - - - 0x0178C7 05:98B7: A9 0B
	STA bankedSubRetBank				;C - - - - - 0x0178C9 05:98B9: 85 58
	JSR RunBankedSub				;C - - - - - 0x0178CB 05:98BB: 20 72 E7
	RTS							;C - - - - - 0x0178CE 05:98BE: 60

SpringitUpdate:
	LDA ram_00CA				;C - - - - - 0x0178CF 05:98BF: A5 CA
	CMP #$0F					;C - - - - - 0x0178D1 05:98C1: C9 0F
	BCS CODE_0B98F4				;C - - - - - 0x0178D3 05:98C3: B0 2F
		JSR CODE_0B8501				;C - - - - - 0x0178D5 05:98C5: 20 01 85
		LDA ram_00CA				;C - - - - - 0x0178D8 05:98C8: A5 CA
		CMP #$04					;C - - - - - 0x0178DA 05:98CA: C9 04
		BNE CODE_0B98D1				;C - - - - - 0x0178DC 05:98CC: D0 03
			JMP CODE_0B995E				;C - - - - - 0x0178DE 05:98CE: 4C 5E 99
CODE_0B98D1:
	CMP #$05					;C - - - - - 0x0178E1 05:98D1: C9 05
	BNE CODE_0B98DC				;C - - - - - 0x0178E3 05:98D3: D0 07
		LDA #$00					;C - - - - - 0x0178E5 05:98D5: A9 00
		STA ram_00D4				;C - - - - - 0x0178E7 05:98D7: 85 D4
		JMP CODE_0B995E				;C - - - - - 0x0178E9 05:98D9: 4C 5E 99
CODE_0B98DC:
	LDA ram_00CA				;C - - - - - 0x0178EC 05:98DC: A5 CA
	CMP #$07					;C - - - - - 0x0178EE 05:98DE: C9 07
	BEQ CODE_0B98ED				;C - - - - - 0x0178F0 05:98E0: F0 0B
		CMP #$08					;C - - - - - 0x0178F2 05:98E2: C9 08
		BNE CODE_0B98F4				;C - - - - - 0x0178F4 05:98E4: D0 0E
			LDA #$05					;C - - - - - 0x0178F6 05:98E6: A9 05
			STA ram_00CA				;C - - - - - 0x0178F8 05:98E8: 85 CA
			JMP CODE_0B995E				;C - - - - - 0x0178FA 05:98EA: 4C 5E 99
CODE_0B98ED:
	LDA #$01					;C - - - - - 0x0178FD 05:98ED: A9 01
	STA ram_00CA				;C - - - - - 0x0178FF 05:98EF: 85 CA
	JMP CODE_0B995B				;C - - - - - 0x017901 05:98F1: 4C 5B 99
CODE_0B98F4:
	CMP #$0F					;C - - - - - 0x017904 05:98F4: C9 0F
	BNE CODE_0B990F				;C - - - - - 0x017906 05:98F6: D0 17
		DEC ram_00B6				;C - - - - - 0x017908 05:98F8: C6 B6
		BNE CODE_0B990C				;C - - - - - 0x01790A 05:98FA: D0 10
			LDA #$10					;C - - - - - 0x01790C 05:98FC: A9 10
			STA ram_00CA				;C - - - - - 0x01790E 05:98FE: 85 CA
			LDY enemyDir,X				;C - - - - - 0x017910 05:9900: B4 A2
			LDA SpringitDieAnims,Y			;C - - - - - 0x017912 05:9902: B9 90 99
			JSR StartEnemyAnim2				;C - - - - - 0x017915 05:9905: 20 C2 9E
			LDA #$14					;C - - - - - 0x017918 05:9908: A9 14
			STA ram_00B6				;C - - - - - 0x01791A 05:990A: 85 B6
	CODE_0B990C:
		JMP CODE_0B998F				;C - - - - - 0x01791C 05:990C: 4C 8F 99
CODE_0B990F:
	CMP #$10					;C - - - - - 0x01791F 05:990F: C9 10
	BNE CODE_0B995B				;C - - - - - 0x017921 05:9911: D0 48

	DEC ram_00B6				;C - - - - - 0x017923 05:9913: C6 B6
	BNE CODE_0B9958				;C - - - - - 0x017925 05:9915: D0 41
		LDA #$00					;C - - - - - 0x017927 05:9917: A9 00
		STA enemyType,X				;C - - - - - 0x017929 05:9919: 95 98
		STA ram_00CA				;C - - - - - 0x01792B 05:991B: 85 CA
		INC roundEnemies				;C - - - - - 0x01792D 05:991D: EE A8 04
		LDA #$01					;C - - - - - 0x017930 05:9920: A9 01
		STA objState+OSLOT_ENEMY+2,X				;C - - - - - 0x017932 05:9922: 9D 6E 05
		STA enemyType+2,X				;C - - - - - 0x017935 05:9925: 95 9A
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x017937 05:9927: BD 94 05
		CLC							;C - - - - - 0x01793A 05:992A: 18
		ADC #$10					;C - - - - - 0x01793B 05:992B: 69 10
		STA objY+OSLOT_ENEMY+2,X				;C - - - - - 0x01793D 05:992D: 9D 96 05
		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x017940 05:9930: BD BC 05
		STA objX+OSLOT_ENEMY+2,X				;C - - - - - 0x017943 05:9933: 9D BE 05
		LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x017946 05:9936: BD 34 06
		STA objChrSlot+OSLOT_ENEMY+2,X				;C - - - - - 0x017949 05:9939: 9D 36 06
		LDA objAttr+OSLOT_ENEMY+1,X				;C - - - - - 0x01794C 05:993C: BD FD 06
		STA objAttr+OSLOT_ENEMY+2,X				;C - - - - - 0x01794F 05:993F: 9D FE 06
		LDA #anZenChanL_ID					;C - - - - - 0x017952 05:9942: A9 3C
		STA objAnim+OSLOT_ENEMY+2,X				;C - - - - - 0x017954 05:9944: 9D 86 06
		LDA #$02					;C - - - - - 0x017957 05:9947: A9 02
		STA enemyReward+2,X				;C - - - - - 0x017959 05:9949: 95 90
		LDA enemyDir,X				;C - - - - - 0x01795B 05:994B: B5 A2
		STA enemyDir+2,X				;C - - - - - 0x01795D 05:994D: 95 A4
		LDA #$01					;C - - - - - 0x01795F 05:994F: A9 01
		STA enemyMad+2,X				;C - - - - - 0x017961 05:9951: 95 65
		LDA #$03					;C - - - - - 0x017963 05:9953: A9 03
		STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x017965 05:9955: 9D FC 06
CODE_0B9958:
	JMP CODE_0B998F				;C - - - - - 0x017968 05:9958: 4C 8F 99
CODE_0B995B:
	JSR CODE_0B85EB				;C - - - - - 0x01796B 05:995B: 20 EB 85
CODE_0B995E:
	JSR CODE_0FF9E8				;C - - - - - 0x01796E 05:995E: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x017971 05:9961: A5 CA
	CMP #$80					;C - - - - - 0x017973 05:9963: C9 80
	BCC CODE_0B998C				;C - - - - - 0x017975 05:9965: 90 25
		JSR CODE_0B9AA9				;C - - - - - 0x017977 05:9967: 20 A9 9A
		CMP #$32					;C - - - - - 0x01797A 05:996A: C9 32
		BCC CODE_0B9989				;C - - - - - 0x01797C 05:996C: 90 1B
			LDA #$80					;C - - - - - 0x01797E 05:996E: A9 80
			STA ram_00C0,X				;C - - - - - 0x017980 05:9970: 95 C0
			LDA #$0F					;C - - - - - 0x017982 05:9972: A9 0F
			STA ram_00CA				;C - - - - - 0x017984 05:9974: 85 CA
			LDA #snBomb_ID					;C - - - - - 0x017986 05:9976: A9 29
			STA a:soundTrigger				;C - - - - - 0x017988 05:9978: 8D E1 00
			LDA #anSpringitBlast_ID					;C - - - - - 0x01798B 05:997B: A9 5A
			JSR StartEnemyAnim2				;C - - - - - 0x01798D 05:997D: 20 C2 9E
			LDA #$14					;C - - - - - 0x017990 05:9980: A9 14
			STA ram_00B6				;C - - - - - 0x017992 05:9982: 85 B6
			STA ram_00B7				;C - - - - - 0x017994 05:9984: 85 B7
			JMP CODE_0B998F				;C - - - - - 0x017996 05:9986: 4C 8F 99
	CODE_0B9989:
		JMP CODE_0B998F				;C - - - - - 0x017999 05:9989: 4C 8F 99
CODE_0B998C:
	JSR CODE_0B9846				;C - - - - - 0x01799C 05:998C: 20 46 98
CODE_0B998F:
	RTS							;C - - - - - 0x01799F 05:998F: 60

SpringitDieAnims:
	.byte $00					;- - - - - - 0x0179A0 05:9990: 00
	.byte anSpringitDieL_ID					;- D 0 - - - 0x0179A1 05:9991: 66
	.byte anSpringitDieR_ID					;- - - - - - 0x0179A2 05:9992: 64
	.byte anSpringitBodyDieL_ID					;- D 0 - - - 0x0179A3 05:9993: 65
	.byte anSpringitBodyDieR_ID					;- - - - - - 0x0179A4 05:9994: 63

SpringitBodyUpdate:
	LDA objState+8,X				;C - - - - - 0x0179A5 05:9995: BD 6B 05
	BNE CODE_0B99B7				;C - - - - - 0x0179A8 05:9998: D0 1D
		LDA ram_00B6,X				;C - - - - - 0x0179AA 05:999A: B5 B6
		CMP #$14					;C - - - - - 0x0179AC 05:999C: C9 14
		BNE CODE_0B99AA				;C - - - - - 0x0179AE 05:999E: D0 0A
			LDA #snBomb_ID					;C - - - - - 0x0179B0 05:99A0: A9 29
			STA a:soundTrigger				;C - - - - - 0x0179B2 05:99A2: 8D E1 00
			LDA #anSpringitBlast_ID					;C - - - - - 0x0179B5 05:99A5: A9 5A
			JSR StartEnemyAnim2				;C - - - - - 0x0179B7 05:99A7: 20 C2 9E
	CODE_0B99AA:
		DEC ram_00B6,X				;C - - - - - 0x0179BA 05:99AA: D6 B6
		BNE CODE_0B99B4				;C - - - - - 0x0179BC 05:99AC: D0 06
			LDA #$00					;C - - - - - 0x0179BE 05:99AE: A9 00
			STA enemyType,X				;C - - - - - 0x0179C0 05:99B0: 95 98
			STA ram_00CA				;C - - - - - 0x0179C2 05:99B2: 85 CA
	CODE_0B99B4:
		JMP CODE_0B9A14				;C - - - - - 0x0179C4 05:99B4: 4C 14 9A
CODE_0B99B7:
	STA ram_00CA				;C - - - - - 0x0179C7 05:99B7: 85 CA
	LDA enemyType+9,X				;C - - - - - 0x0179C9 05:99B9: B5 A1
	STA enemyDir,X				;C - - - - - 0x0179CB 05:99BB: 95 A2
	LDA objX+8,X				;C - - - - - 0x0179CD 05:99BD: BD BB 05
	STA objX+OSLOT_ENEMY,X				;C - - - - - 0x0179D0 05:99C0: 9D BC 05
	LDA objY+8,X				;C - - - - - 0x0179D3 05:99C3: BD 93 05
	CLC							;C - - - - - 0x0179D6 05:99C6: 18
	ADC #$20					;C - - - - - 0x0179D7 05:99C7: 69 20
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x0179D9 05:99C9: 9D 94 05
	LDA objAnimProgress+8,X				;C - - - - - 0x0179DC 05:99CC: BD D3 06
	STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x0179DF 05:99CF: 9D D4 06
	LDA objAttr+8,X				;C - - - - - 0x0179E2 05:99D2: BD FB 06
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x0179E5 05:99D5: 9D FC 06
	LDA ram_00CA				;C - - - - - 0x0179E8 05:99D8: A5 CA
	CMP #$0F					;C - - - - - 0x0179EA 05:99DA: C9 0F
	BNE CODE_0B99FB				;C - - - - - 0x0179EC 05:99DC: D0 1D
		LDA ram_00B6,X				;C - - - - - 0x0179EE 05:99DE: B5 B6
		CMP #$14					;C - - - - - 0x0179F0 05:99E0: C9 14
		BNE CODE_0B99F8				;C - - - - - 0x0179F2 05:99E2: D0 14
			LDA #$80					;C - - - - - 0x0179F4 05:99E4: A9 80
			STA ram_00C0,X				;C - - - - - 0x0179F6 05:99E6: 95 C0
			LDY enemyDir,X				;C - - - - - 0x0179F8 05:99E8: B4 A2
			LDA SpringitDieAnims+2,Y			;C - - - - - 0x0179FA 05:99EA: B9 92 99
			STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x0179FD 05:99ED: 9D 84 06
			LDA #$00					;C - - - - - 0x017A00 05:99F0: A9 00
			STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x017A02 05:99F2: 9D D4 06
			STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x017A05 05:99F5: 9D AC 06
	CODE_0B99F8:
		JMP CODE_0B9A14				;C - - - - - 0x017A08 05:99F8: 4C 14 9A
CODE_0B99FB:
	CMP #$10					;C - - - - - 0x017A0B 05:99FB: C9 10
	BEQ CODE_0B9A14				;C - - - - - 0x017A0D 05:99FD: F0 15
		JSR CODE_0FF9E8				;C - - - - - 0x017A0F 05:99FF: 20 E8 F9
		LDA ram_00CA				;C - - - - - 0x017A12 05:9A02: A5 CA
		AND #$C0					;C - - - - - 0x017A14 05:9A04: 29 C0
		BEQ CODE_0B9A11				;C - - - - - 0x017A16 05:9A06: F0 09
			JSR CODE_0FFB0C				;C - - - - - 0x017A18 05:9A08: 20 0C FB
			LDA ram_00CA				;C - - - - - 0x017A1B 05:9A0B: A5 CA
			AND #$3F					;C - - - - - 0x017A1D 05:9A0D: 29 3F
			STA ram_00CA				;C - - - - - 0x017A1F 05:9A0F: 85 CA
	CODE_0B9A11:
		JSR CODE_0B9846				;C - - - - - 0x017A21 05:9A11: 20 46 98
CODE_0B9A14:
	RTS							;C - - - - - 0x017A24 05:9A14: 60

TrashUpdate:
.ifdef REGION_JP
	DEC ram_00CB				;- - - - - - 0x0179F7 05:99E7: C6
.ENDIF
	DEC untrappedEnemies				;C - - - - - 0x017A25 05:9A15: C6 CC
	JSR CODE_0FF9E8				;C - - - - - 0x017A27 05:9A17: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x017A2A 05:9A1A: A5 CA
	CMP #$80					;C - - - - - 0x017A2C 05:9A1C: C9 80
	BCC CODE_0B9A27				;C - - - - - 0x017A2E 05:9A1E: 90 07
		CMP #$C0					;C - - - - - 0x017A30 05:9A20: C9 C0
		BCS CODE_0B9A27				;C - - - - - 0x017A32 05:9A22: B0 03
			JSR CODE_0FFB0C				;C - - - - - 0x017A34 05:9A24: 20 0C FB
CODE_0B9A27:
	LDA ram_00CA				;C - - - - - 0x017A37 05:9A27: A5 CA
	AND #$0F					;C - - - - - 0x017A39 05:9A29: 29 0F
	STA ram_00CA				;C - - - - - 0x017A3B 05:9A2B: 85 CA
	LDA ram_00CA				;C - - - - - 0x017A3D 05:9A2D: A5 CA
	CMP #$01					;C - - - - - 0x017A3F 05:9A2F: C9 01
	BNE CODE_0B9A38				;C - - - - - 0x017A41 05:9A31: D0 05
.ifndef REGION_JP
		DEC ram_00CB				;C - - - - - 0x017A43 05:9A33: C6 CB
.endif
		JMP CODE_0B9A75				;C - - - - - 0x017A45 05:9A35: 4C 75 9A
CODE_0B9A38:
	CMP #$02					;C - - - - - 0x017A48 05:9A38: C9 02
	BNE CODE_0B9A4D				;C - - - - - 0x017A4A 05:9A3A: D0 11
		LDA #anTrashFall_ID					;C - - - - - 0x017A4C 05:9A3C: A9 FF
		JSR StartEnemyAnim2				;C - - - - - 0x017A4E 05:9A3E: 20 C2 9E
		LDA #$03					;C - - - - - 0x017A51 05:9A41: A9 03
		STA ram_00CA				;C - - - - - 0x017A53 05:9A43: 85 CA
		LDA #snTrashFall_ID					;C - - - - - 0x017A55 05:9A45: A9 22
		STA a:soundTrigger			;C - - - - - 0x017A57 05:9A47: 8D E1 00
		JMP CODE_0B9A75				;C - - - - - 0x017A5A 05:9A4A: 4C 75 9A
CODE_0B9A4D:
	CMP #$03					;C - - - - - 0x017A5D 05:9A4D: C9 03
	BNE CODE_0B9A75				;C - - - - - 0x017A5F 05:9A4F: D0 24
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x017A61 05:9A51: BD 94 05
		CLC							;C - - - - - 0x017A64 05:9A54: 18
		ADC #$04					;C - - - - - 0x017A65 05:9A55: 69 04
		STA objY+OSLOT_ENEMY,X				;C - - - - - 0x017A67 05:9A57: 9D 94 05
		INC ram_00B6,X				;C - - - - - 0x017A6A 05:9A5A: F6 B6
		LDA ram_00B6,X				;C - - - - - 0x017A6C 05:9A5C: B5 B6
		CMP #$10					;C - - - - - 0x017A6E 05:9A5E: C9 10
		BNE CODE_0B9A65				;C - - - - - 0x017A70 05:9A60: D0 03
			JSR CODE_0B9A76				;C - - - - - 0x017A72 05:9A62: 20 76 9A
	CODE_0B9A65:
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x017A75 05:9A65: BD 94 05
		CMP #$E0					;C - - - - - 0x017A78 05:9A68: C9 E0
		BCC CODE_0B9A75				;C - - - - - 0x017A7A 05:9A6A: 90 09
			LDA #$00					;C - - - - - 0x017A7C 05:9A6C: A9 00
			STA enemyType,X				;C - - - - - 0x017A7E 05:9A6E: 95 98
			STA ram_00CA				;C - - - - - 0x017A80 05:9A70: 85 CA
			JMP CODE_0B9A75				;C - - - - - 0x017A82 05:9A72: 4C 75 9A
CODE_0B9A75:
	RTS							;C - - - - - 0x017A85 05:9A75: 60

CODE_0B9A76:
.ifdef REGION_JP
	LDY currentRound			;- - - - - - 0x017A58 05:9A48: A4
	CPY #40						;- - - - - - 0x017A5A 05:9A4A: C0
	BCS	@end					;- - - - - - 0x017A5C 05:9A4C: B0

	LDA DATA_0B9AA5,Y					;- - - - - - 0x017A5E 05:9A4E: B9
	BEQ @end					;- - - - - - 0x017A61 05:9A51: F0

	STA enemyType+1					;- - - - - - 0x017A63 05:9A53: 85
	STA enemyType+2					;- - - - - - 0x017A65 05:9A55: 85
	STA enemyType+3					;- - - - - - 0x017A67 05:9A57: 85
	STA enemyType+4					;- - - - - - 0x017A69 05:9A59: 85
	LDA #144					;- - - - - - 0x017A6B 05:9A5B: A9
	STA objY+OSLOT_ENEMY+1					;- - - - - - 0x017A6D 05:9A5D: 8D
	STA objX+OSLOT_ENEMY+2					;- - - - - - 0x017A70 05:9A60: 8D
	LDA #128					;- - - - - - 0x017A73 05:9A63: A9
	STA objX+OSLOT_ENEMY+1					;- - - - - - 0x017A75 05:9A65: 8D
	STA objY+OSLOT_ENEMY+2					;- - - - - - 0x017A78 05:9A68: 8D
	STA objX+OSLOT_ENEMY+3					;- - - - - - 0x017A7B 05:9A6B: 8D
	STA objY+OSLOT_ENEMY+4					;- - - - - - 0x017A7E 05:9A6E: 8D
	LDA #112					;- - - - - - 0x017A81 05:9A71: A9
	STA objY+OSLOT_ENEMY+3					;- - - - - - 0x017A83 05:9A73: 8D
	STA objX+OSLOT_ENEMY+4					;- - - - - - 0x017A86 05:9A76: 8D

	LDA DATA_0B9AA5,Y					;- - - - - - 0x017A89 05:9A79: B9
	CMP #$04					;- - - - - - 0x017A8C 05:9A7C: C9
	BNE	@end				;- - - - - - 0x017A8E 05:9A7E: D0

	LDA DATA_0B9AA5,Y					;- - - - - - 0x017A90 05:9A80: B9
	STA enemyType+5					;- - - - - - 0x017A93 05:9A83: 85
	STA enemyType+6					;- - - - - - 0x017A95 05:9A85: 85
	LDA #144					;- - - - - - 0x017A97 05:9A87: A9
	STA objY+OSLOT_ENEMY+5					;- - - - - - 0x017A99 05:9A89: 8D
	STA objX+OSLOT_ENEMY+5					;- - - - - - 0x017A9C 05:9A8C: 8D
	LDA #112					;- - - - - - 0x017A9F 05:9A8F: A9
	STA objY+OSLOT_ENEMY+6					;- - - - - - 0x017AA1 05:9A91: 8D
	STA objX+OSLOT_ENEMY+6					;- - - - - - 0x017AA4 05:9A94: 8D
@end:
	RTS					;- - - - - - 0x017AA7 05:9A97: 60
.else
	LDA currentRound				;C - - - - - 0x017A86 05:9A76: A5 D8
	AND #$07					;C - - - - - 0x017A88 05:9A78: 29 07
	TAY							;C - - - - - 0x017A8A 05:9A7A: A8
	LDA DATA_0B9AA5,Y			;C - - - - - 0x017A8B 05:9A7B: B9 A5 9A
	STA enemyType+1				;C - - - - - 0x017A8E 05:9A7E: 85 99
	STA enemyType+2				;C - - - - - 0x017A90 05:9A80: 85 9A
	STA enemyType+3				;C - - - - - 0x017A92 05:9A82: 85 9B
	STA enemyType+4				;C - - - - - 0x017A94 05:9A84: 85 9C
	LDA #144					;C - - - - - 0x017A96 05:9A86: A9 90
	STA objY+OSLOT_ENEMY+1				;C - - - - - 0x017A98 05:9A88: 8D 95 05
	STA objX+OSLOT_ENEMY+2				;C - - - - - 0x017A9B 05:9A8B: 8D BE 05
	LDA #128					;C - - - - - 0x017A9E 05:9A8E: A9 80
	STA objX+OSLOT_ENEMY+1				;C - - - - - 0x017AA0 05:9A90: 8D BD 05
	STA objY+OSLOT_ENEMY+2				;C - - - - - 0x017AA3 05:9A93: 8D 96 05
	STA objX+OSLOT_ENEMY+3				;C - - - - - 0x017AA6 05:9A96: 8D BF 05
	STA objY+OSLOT_ENEMY+4				;C - - - - - 0x017AA9 05:9A99: 8D 98 05
	LDA #112					;C - - - - - 0x017AAC 05:9A9C: A9 70
	STA objY+OSLOT_ENEMY+3				;C - - - - - 0x017AAE 05:9A9E: 8D 97 05
	STA objX+OSLOT_ENEMY+4				;C - - - - - 0x017AB1 05:9AA1: 8D C0 05
	RTS							;C - - - - - 0x017AB4 05:9AA4: 60
.endif

DATA_0B9AA5:
.ifdef REGION_JP
	;- - - - - - 0x017AA8 05:9A98: 00
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
	.byte $00					;Round 21
	.byte $00					;Round 22
	.byte $00					;Round 23
	.byte $07					;Round 24
	.byte $00					;Round 25
	.byte $00					;Round 26
	.byte $00					;Round 27
	.byte $00					;Round 28
	.byte $00					;Round 29
	.byte $00					;Round 30
	.byte $00					;Round 31
	.byte $00					;Round 32
	.byte $04					;Round 33
	.byte $00					;Round 34
	.byte $06					;Round 35
	.byte $00					;Round 36
	.byte $00					;Round 37
	.byte $00					;Round 38
	.byte $00					;Round 39
.else
	.byte $07					;- D 0 - - - 0x017AB5 05:9AA5: 07
	.byte $04					;- D 0 - - - 0x017AB6 05:9AA6: 04
	.byte $00					;- - - - - - 0x017AB7 05:9AA7: 00
	.byte $06					;- D 0 - - - 0x017AB8 05:9AA8: 06
.endif

CODE_0B9AA9:
	LDA ram_00C0,X				;C - - - - - 0x017AB9 05:9AA9: B5 C0
	BNE CODE_0B9AF0				;C - - - - - 0x017ABB 05:9AAB: D0 43

	ORA #$06					;C - - - - - 0x017ABD 05:9AAD: 09 06
	STA ram_00C0,X				;C - - - - - 0x017ABF 05:9AAF: 95 C0
	LDA #snEnemyHurt_ID					;C - - - - - 0x017AC1 05:9AB1: A9 2B
	STA a:soundTrigger				;C - - - - - 0x017AC3 05:9AB3: 8D E1 00
	LDA ram_00CA				;C - - - - - 0x017AC6 05:9AB6: A5 CA
	CMP #$E0					;C - - - - - 0x017AC8 05:9AB8: C9 E0
	BCS CODE_0B9AD3				;C - - - - - 0x017ACA 05:9ABA: B0 17
		CMP #$C0					;C - - - - - 0x017ACC 05:9ABC: C9 C0
		BCS CODE_0B9ADB				;C - - - - - 0x017ACE 05:9ABE: B0 1B
			LDY shootQueuedBubbles				;C - - - - - 0x017AD0 05:9AC0: AC 16 05
			LDA enemyHits,X				;C - - - - - 0x017AD3 05:9AC3: BD BE 04
			CLC							;C - - - - - 0x017AD6 05:9AC6: 18
			ADC DATA_0B9AF4,Y			;C - - - - - 0x017AD7 05:9AC7: 79 F4 9A
			STA enemyHits,X				;C - - - - - 0x017ADA 05:9ACA: 9D BE 04
			JSR CODE_0FFB0C				;C - - - - - 0x017ADD 05:9ACD: 20 0C FB
			JMP CODE_0B9AEA				;C - - - - - 0x017AE0 05:9AD0: 4C EA 9A
CODE_0B9AD3:
	;Unreached
	LDA #$F0					;- - - - - - 0x017AE3 05:9AD3: A9
	STA enemyHits,X				;- - - - - - 0x017AE5 05:9AD5: 9D
	JMP CODE_0B9AEA				;- - - - - - 0x017AE8 05:9AD8: 4C
CODE_0B9ADB:
	LDA roundBubbleVariant				;C - - - - - 0x017AEB 05:9ADB: A5 82
	AND #$7F					;C - - - - - 0x017AED 05:9ADD: 29 7F
	TAY							;C - - - - - 0x017AEF 05:9ADF: A8
	LDA enemyHits,X				;C - - - - - 0x017AF0 05:9AE0: BD BE 04
	CLC							;C - - - - - 0x017AF3 05:9AE3: 18
	ADC BubbleVariantDamage,Y			;C - - - - - 0x017AF4 05:9AE4: 79 F7 9A
	STA enemyHits,X				;C - - - - - 0x017AF7 05:9AE7: 9D BE 04
CODE_0B9AEA:
	LDA ram_00CA				;C - - - - - 0x017AFA 05:9AEA: A5 CA
	AND #$1F					;C - - - - - 0x017AFC 05:9AEC: 29 1F
	STA ram_00CA				;C - - - - - 0x017AFE 05:9AEE: 85 CA
CODE_0B9AF0:
	LDA enemyHits,X				;C - - - - - 0x017B00 05:9AF0: BD BE 04
	RTS							;C - - - - - 0x017B03 05:9AF3: 60

DATA_0B9AF4:
	.byte $01					;- D 0 - - - 0x017B04 05:9AF4: 01
	.byte $06					;- - - - - - 0x017B05 05:9AF5: 06
	.byte $09					;- D 0 - - - 0x017B06 05:9AF6: 09

BubbleVariantDamage:
	;- - - - - - 0x017B07 05:9AF7: 00
	.byte 0							;Regular
	.byte 5							;Thunder
	.byte 10						;Fire
	.byte 5							;Water
	.byte 10						;Snow
	.byte 5							;Wind
	.byte 5							;Star
	.byte 5							;Bomb

CODE_0B9AFF:
	LDA globalTimer				;C - - - - - 0x017B0F 05:9AFF: A5 14
	AND #$02					;C - - - - - 0x017B11 05:9B01: 29 02
	BEQ CODE_0B9B0C				;C - - - - - 0x017B13 05:9B03: F0 07
		LDA #$03					;C - - - - - 0x017B15 05:9B05: A9 03
		STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x017B17 05:9B07: 9D FC 06
		BNE CODE_0B9B15				;C - - - - - 0x017B1A 05:9B0A: D0 09
CODE_0B9B0C:
	LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x017B1C 05:9B0C: BD 34 06
	SEC							;C - - - - - 0x017B1F 05:9B0F: 38
	SBC #$01					;C - - - - - 0x017B20 05:9B10: E9 01
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x017B22 05:9B12: 9D FC 06
CODE_0B9B15:
	DEC ram_00C0,X				;C - - - - - 0x017B25 05:9B15: D6 C0
	LDA ram_00C0,X				;C - - - - - 0x017B27 05:9B17: B5 C0
	AND #$7F					;C - - - - - 0x017B29 05:9B19: 29 7F
	BNE CODE_0B9B2E				;C - - - - - 0x017B2B 05:9B1B: D0 11
		LDA enemyMad,X				;C - - - - - 0x017B2D 05:9B1D: B5 63
		BEQ CODE_0B9B25				;C - - - - - 0x017B2F 05:9B1F: F0 04
			LDA #$03					;C - - - - - 0x017B31 05:9B21: A9 03
			BNE CODE_0B9B2B				;C - - - - - 0x017B33 05:9B23: D0 06
	CODE_0B9B25:
		LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x017B35 05:9B25: BD 34 06
		SEC							;C - - - - - 0x017B38 05:9B28: 38
		SBC #$01					;C - - - - - 0x017B39 05:9B29: E9 01
	CODE_0B9B2B:
		STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x017B3B 05:9B2B: 9D FC 06
CODE_0B9B2E:
	RTS							;C - - - - - 0x017B3E 05:9B2E: 60

CODE_0B9B2F:
	LDA #$00					;C - - - - - 0x017B3F 05:9B2F: A9 00
	STA ram_00CA				;C - - - - - 0x017B41 05:9B31: 85 CA
	STA enemyType,X				;C - - - - - 0x017B43 05:9B33: 95 98
	STA enemyHits,X				;C - - - - - 0x017B45 05:9B35: 9D BE 04
	STA ram_00B6,X				;C - - - - - 0x017B48 05:9B38: 95 B6
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x017B4A 05:9B3A: 9D 6C 05
	STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x017B4D 05:9B3D: 9D D4 06
	STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x017B50 05:9B40: 9D AC 06
	LDA #$05					;C - - - - - 0x017B53 05:9B43: A9 05
	STA scoreAdditionDigits+3				;C - - - - - 0x017B55 05:9B45: 8D A4 04
	TXA							;C - - - - - 0x017B58 05:9B48: 8A
	PHA							;C - - - - - 0x017B59 05:9B49: 48
	JSR AddScore				;C - - - - - 0x017B5A 05:9B4A: 20 C7 FE
	PLA							;C - - - - - 0x017B5D 05:9B4D: 68
	TAX							;C - - - - - 0x017B5E 05:9B4E: AA
	RTS							;C - - - - - 0x017B5F 05:9B4F: 60

CODE_0B9B50:
	LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x017B60 05:9B50: BD 34 06
	SEC							;C - - - - - 0x017B63 05:9B53: 38
	SBC #$01					;C - - - - - 0x017B64 05:9B54: E9 01
	STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x017B66 05:9B56: 9D FC 06
	LDA #$00					;C - - - - - 0x017B69 05:9B59: A9 00
	STA enemyHits,X				;C - - - - - 0x017B6B 05:9B5B: 9D BE 04
	RTS							;C - - - - - 0x017B6E 05:9B5E: 60

SkelMonstaUpdate:
	INC ram_00BE				;C - - - - - 0x017B6F 05:9B5F: E6 BE
	LDA ram_00CA				;C - - - - - 0x017B71 05:9B61: A5 CA
	CMP #$06					;C - - - - - 0x017B73 05:9B63: C9 06
	BNE CODE_0B9B82				;C - - - - - 0x017B75 05:9B65: D0 1B
		LDA ram_00BE				;C - - - - - 0x017B77 05:9B67: A5 BE
		BEQ CODE_0B9B6E				;C - - - - - 0x017B79 05:9B69: F0 03
			JMP CODE_0B9C30				;C - - - - - 0x017B7B 05:9B6B: 4C 30 9C
	CODE_0B9B6E:
		LDA #$01					;C - - - - - 0x017B7E 05:9B6E: A9 01
		STA ram_00CA				;C - - - - - 0x017B80 05:9B70: 85 CA
		LDA #128					;C - - - - - 0x017B82 05:9B72: A9 80
		STA objX+OSLOT_ENEMY+8				;C - - - - - 0x017B84 05:9B74: 8D C4 05
		STA objY+OSLOT_ENEMY+8				;C - - - - - 0x017B87 05:9B77: 8D 9C 05

		LDA #trSkelMonsta_ID					;C - - - - - 0x017B8A 05:9B7A: A9 0E
		STA a:musicTrigger			;C - - - - - 0x017B8C 05:9B7C: 8D E0 00
		JMP CODE_0B9C2D				;C - - - - - 0x017B8F 05:9B7F: 4C 2D 9C
CODE_0B9B82:
	CMP #$01					;C - - - - - 0x017B92 05:9B82: C9 01
	BNE CODE_0B9B98				;C - - - - - 0x017B94 05:9B84: D0 12
		LDA objAnimProgress+OSLOT_ENEMY+8				;C - - - - - 0x017B96 05:9B86: AD DC 06
		CMP #$03					;C - - - - - 0x017B99 05:9B89: C9 03
		BNE CODE_0B9B95				;C - - - - - 0x017B9B 05:9B8B: D0 08
			LDA #$03					;C - - - - - 0x017B9D 05:9B8D: A9 03
			STA ram_00CA				;C - - - - - 0x017B9F 05:9B8F: 85 CA
			LDA #$00					;C - - - - - 0x017BA1 05:9B91: A9 00
			STA ram_00BE				;C - - - - - 0x017BA3 05:9B93: 85 BE
	CODE_0B9B95:
		JMP CODE_0B9C2D				;C - - - - - 0x017BA5 05:9B95: 4C 2D 9C
CODE_0B9B98:
	CMP #$02					;C - - - - - 0x017BA8 05:9B98: C9 02
	BNE CODE_0B9BA2				;C - - - - - 0x017BAA 05:9B9A: D0 06
		JSR CODE_0B9C66				;C - - - - - 0x017BAC 05:9B9C: 20 66 9C
		JMP CODE_0B9C2D				;C - - - - - 0x017BAF 05:9B9F: 4C 2D 9C
CODE_0B9BA2:
	CMP #$03					;C - - - - - 0x017BB2 05:9BA2: C9 03
	BNE CODE_0B9C02				;C - - - - - 0x017BB4 05:9BA4: D0 5C

	LDA ram_00BE				;C - - - - - 0x017BB6 05:9BA6: A5 BE
	CMP #$0F					;C - - - - - 0x017BB8 05:9BA8: C9 0F
	BEQ CODE_0B9BAF				;C - - - - - 0x017BBA 05:9BAA: F0 03
		JMP CODE_0B9C2D				;C - - - - - 0x017BBC 05:9BAC: 4C 2D 9C
CODE_0B9BAF:
	LDA #$00					;C - - - - - 0x017BBF 05:9BAF: A9 00
	STA ram_00BE				;C - - - - - 0x017BC1 05:9BB1: 85 BE
	LDA #$02					;C - - - - - 0x017BC3 05:9BB3: A9 02
	STA ram_00CA				;C - - - - - 0x017BC5 05:9BB5: 85 CA
	LDA enemyReward+8				;C - - - - - 0x017BC7 05:9BB7: A5 96
	AND #$7F					;C - - - - - 0x017BC9 05:9BB9: 29 7F
	EOR #$01					;C - - - - - 0x017BCB 05:9BBB: 49 01
	STA enemyReward+8				;C - - - - - 0x017BCD 05:9BBD: 85 96
	BEQ CODE_0B9BE9				;C - - - - - 0x017BCF 05:9BBF: F0 28
		INC ram_04AB				;C - - - - - 0x017BD1 05:9BC1: EE AB 04
		LDA ram_04AB				;C - - - - - 0x017BD4 05:9BC4: AD AB 04
		CMP #$08					;C - - - - - 0x017BD7 05:9BC7: C9 08
		BCC CODE_0B9BCD				;C - - - - - 0x017BD9 05:9BC9: 90 02
			LDA #$08					;C - - - - - 0x017BDB 05:9BCB: A9 08
	CODE_0B9BCD:
		STA ram_04AB				;C - - - - - 0x017BDD 05:9BCD: 8D AB 04
		LDA #$00					;C - - - - - 0x017BE0 05:9BD0: A9 00
		STA scratch0				;C - - - - - 0x017BE2 05:9BD2: 85 00
		LDA objY+OSLOT_ENEMY+8				;C - - - - - 0x017BE4 05:9BD4: AD 9C 05
		CMP objY				;C - - - - - 0x017BE7 05:9BD7: CD 8B 05
		ROR scratch0				;C - - - - - 0x017BEA 05:9BDA: 66 00
		LDA scratch0				;C - - - - - 0x017BEC 05:9BDC: A5 00
		ORA #$01					;C - - - - - 0x017BEE 05:9BDE: 09 01
		STA enemyReward+8				;C - - - - - 0x017BF0 05:9BE0: 85 96
		LDA #$40					;C - - - - - 0x017BF2 05:9BE2: A9 40
		STA ram_00B4				;C - - - - - 0x017BF4 05:9BE4: 85 B4
		JMP CODE_0B9C2D				;C - - - - - 0x017BF6 05:9BE6: 4C 2D 9C
CODE_0B9BE9:
	LDY #$01					;C - - - - - 0x017BF9 05:9BE9: A0 01
	LDA #$60					;C - - - - - 0x017BFB 05:9BEB: A9 60
	STA ram_00B4				;C - - - - - 0x017BFD 05:9BED: 85 B4
	LDA objX+OSLOT_ENEMY+8				;C - - - - - 0x017BFF 05:9BEF: AD C4 05
	CMP objX				;C - - - - - 0x017C02 05:9BF2: CD B3 05
	BCS CODE_0B9BF8				;C - - - - - 0x017C05 05:9BF5: B0 01
		INY							;C - - - - - 0x017C07 05:9BF7: C8
CODE_0B9BF8:
	LDA DATA_0B9C31,Y			;C - - - - - 0x017C08 05:9BF8: B9 31 9C
	STA enemyReward+8				;C - - - - - 0x017C0B 05:9BFB: 85 96
	STY enemyDir+8				;C - - - - - 0x017C0D 05:9BFD: 84 AA
	JMP CODE_0B9C2D				;C - - - - - 0x017C0F 05:9BFF: 4C 2D 9C
CODE_0B9C02:
	LDA ram_00CA				;C - - - - - 0x017C12 05:9C02: A5 CA
	CMP #$04					;C - - - - - 0x017C14 05:9C04: C9 04
	BNE CODE_0B9C16				;C - - - - - 0x017C16 05:9C06: D0 0E
		LDA objAnimProgress+OSLOT_ENEMY+8				;C - - - - - 0x017C18 05:9C08: AD DC 06
		CMP #$03					;C - - - - - 0x017C1B 05:9C0B: C9 03
		BCC CODE_0B9C2D				;C - - - - - 0x017C1D 05:9C0D: 90 1E
			LDA #$05					;C - - - - - 0x017C1F 05:9C0F: A9 05
			STA ram_00CA				;C - - - - - 0x017C21 05:9C11: 85 CA
			JMP CODE_0B9C2D				;C - - - - - 0x017C23 05:9C13: 4C 2D 9C
CODE_0B9C16:
	CMP #$05					;C - - - - - 0x017C26 05:9C16: C9 05
	BNE CODE_0B9C2D				;C - - - - - 0x017C28 05:9C18: D0 13
		LDA #$00					;C - - - - - 0x017C2A 05:9C1A: A9 00
		STA enemyType+8				;C - - - - - 0x017C2C 05:9C1C: 85 A0
		STA ram_00CA				;C - - - - - 0x017C2E 05:9C1E: 85 CA
		STA objAnim+OSLOT_ENEMY+8				;C - - - - - 0x017C30 05:9C20: 8D 8C 06
		STA objAnimHI+OSLOT_ENEMY+8				;C - - - - - 0x017C33 05:9C23: 8D 2C 07
		STA ram_00B4				;C - - - - - 0x017C36 05:9C26: 85 B4
		STA ram_00BE				;C - - - - - 0x017C38 05:9C28: 85 BE
		JMP CODE_0B9C30				;C - - - - - 0x017C3A 05:9C2A: 4C 30 9C
CODE_0B9C2D:
	JSR CODE_0B9C34				;C - - - - - 0x017C3D 05:9C2D: 20 34 9C
CODE_0B9C30:
	RTS							;C - - - - - 0x017C40 05:9C30: 60

DATA_0B9C31:
	.byte $00					;- - - - - - 0x017C41 05:9C31: 00
	.byte $80					;- D 0 - - - 0x017C42 05:9C32: 80
	.byte $00					;- D 0 - - - 0x017C43 05:9C33: 00

CODE_0B9C34:
	LDA ram_00CA				;C - - - - - 0x017C44 05:9C34: A5 CA
	SEC							;C - - - - - 0x017C46 05:9C36: 38
	SBC #$01					;C - - - - - 0x017C47 05:9C37: E9 01
	ASL							;C - - - - - 0x017C49 05:9C39: 0A
	CLC							;C - - - - - 0x017C4A 05:9C3A: 18
	ADC enemyDir+8				;C - - - - - 0x017C4B 05:9C3B: 65 AA
	TAY							;C - - - - - 0x017C4D 05:9C3D: A8
	LDA DATA_0B9C57,Y			;C - - - - - 0x017C4E 05:9C3E: B9 57 9C
	CMP objAnim+OSLOT_ENEMY+8				;C - - - - - 0x017C51 05:9C41: CD 8C 06
	BEQ CODE_0B9C56				;C - - - - - 0x017C54 05:9C44: F0 10
		STA objAnim+OSLOT_ENEMY+8				;C - - - - - 0x017C56 05:9C46: 8D 8C 06
		LDA #.HIBYTE(anSkelMonstaL_ID)					;C - - - - - 0x017C59 05:9C49: A9 01
		STA objAnimHI+OSLOT_ENEMY+8				;C - - - - - 0x017C5B 05:9C4B: 8D 2C 07
		LDA #$00					;C - - - - - 0x017C5E 05:9C4E: A9 00
		STA objAnimProgress+OSLOT_ENEMY+8				;C - - - - - 0x017C60 05:9C50: 8D DC 06
		STA objAnimTimer+OSLOT_ENEMY+8				;C - - - - - 0x017C63 05:9C53: 8D B4 06
CODE_0B9C56:
	RTS							;C - - - - - 0x017C66 05:9C56: 60

DATA_0B9C57:
	.byte $00					;- - - - - - 0x017C67 05:9C57: 00
	.byte .LOBYTE(anSkelMonstaSpawn_ID)					;- - - - - - 0x017C68 05:9C58: 3A
	.byte .LOBYTE(anSkelMonstaSpawn_ID)					;- D 0 - - - 0x017C69 05:9C59: 3A
	.byte .LOBYTE(anSkelMonstaL_ID)					;- D 0 - - - 0x017C6A 05:9C5A: 38
	.byte .LOBYTE(anSkelMonstaR_ID)					;- D 0 - - - 0x017C6B 05:9C5B: 39
	.byte .LOBYTE(anSkelMonstaL_ID)					;- D 0 - - - 0x017C6C 05:9C5C: 38
	.byte .LOBYTE(anSkelMonstaR_ID)					;- D 0 - - - 0x017C6D 05:9C5D: 39
	.byte .LOBYTE(anSkelMonstaLeave_ID)					;- - - - - - 0x017C6E 05:9C5E: 3B
	.byte .LOBYTE(anSkelMonstaLeave_ID)					;- D 0 - - - 0x017C6F 05:9C5F: 3B
	.byte .LOBYTE(anSkelMonstaLeave_ID)					;- - - - - - 0x017C70 05:9C60: 3B
	.byte .LOBYTE(anSkelMonstaLeave_ID)					;- D 0 - - - 0x017C71 05:9C61: 3B
	.byte .LOBYTE(anSkelMonstaL_ID)					;- - - - - - 0x017C72 05:9C62: 38
	.byte .LOBYTE(anSkelMonstaR_ID)					;- D 0 - - - 0x017C73 05:9C63: 39
	.byte .LOBYTE(anSkelMonstaL_ID)					;- - - - - - 0x017C74 05:9C64: 38
	.byte .LOBYTE(anSkelMonstaR_ID)					;- - - - - - 0x017C75 05:9C65: 39

CODE_0B9C66:
	LDA ram_04AB				;C - - - - - 0x017C76 05:9C66: AD AB 04
	STA scratch0				;C - - - - - 0x017C79 05:9C69: 85 00
	LDA ram_00B4				;C - - - - - 0x017C7B 05:9C6B: A5 B4
	SEC							;C - - - - - 0x017C7D 05:9C6D: 38
	SBC ram_04AB				;C - - - - - 0x017C7E 05:9C6E: ED AB 04
	BCS CODE_0B9C81				;C - - - - - 0x017C81 05:9C71: B0 0E
		LDA ram_00B4				;C - - - - - 0x017C83 05:9C73: A5 B4
		STA scratch0				;C - - - - - 0x017C85 05:9C75: 85 00
		LDA #$03					;C - - - - - 0x017C87 05:9C77: A9 03
		STA ram_00CA				;C - - - - - 0x017C89 05:9C79: 85 CA
		LDA #$00					;C - - - - - 0x017C8B 05:9C7B: A9 00
		STA ram_00BE				;C - - - - - 0x017C8D 05:9C7D: 85 BE
		LDA #$00					;C - - - - - 0x017C8F 05:9C7F: A9 00
CODE_0B9C81:
	STA ram_00B4				;C - - - - - 0x017C91 05:9C81: 85 B4
	LDA enemyReward+8				;C - - - - - 0x017C93 05:9C83: A5 96
	AND #$7F					;C - - - - - 0x017C95 05:9C85: 29 7F
	BNE CODE_0B9C9F				;C - - - - - 0x017C97 05:9C87: D0 16
		LDA enemyReward+8				;C - - - - - 0x017C99 05:9C89: A5 96
		BPL CODE_0B9C94				;C - - - - - 0x017C9B 05:9C8B: 10 07
			LDA #$00					;C - - - - - 0x017C9D 05:9C8D: A9 00
			SEC							;C - - - - - 0x017C9F 05:9C8F: 38
			SBC scratch0				;C - - - - - 0x017CA0 05:9C90: E5 00
			STA scratch0				;C - - - - - 0x017CA2 05:9C92: 85 00
	CODE_0B9C94:
		LDA scratch0				;C - - - - - 0x017CA4 05:9C94: A5 00
		STA ram_00D4				;C - - - - - 0x017CA6 05:9C96: 85 D4
		LDA #$00					;C - - - - - 0x017CA8 05:9C98: A9 00
		STA ram_00D5				;C - - - - - 0x017CAA 05:9C9A: 85 D5
		JMP CODE_0B9CB2				;C - - - - - 0x017CAC 05:9C9C: 4C B2 9C
CODE_0B9C9F:
	LDA enemyReward+8				;C - - - - - 0x017CAF 05:9C9F: A5 96
	BPL CODE_0B9CAA				;C - - - - - 0x017CB1 05:9CA1: 10 07
		LDA #$00					;C - - - - - 0x017CB3 05:9CA3: A9 00
		SEC							;C - - - - - 0x017CB5 05:9CA5: 38
		SBC scratch0				;C - - - - - 0x017CB6 05:9CA6: E5 00
		STA scratch0				;C - - - - - 0x017CB8 05:9CA8: 85 00
CODE_0B9CAA:
	LDA #$00					;C - - - - - 0x017CBA 05:9CAA: A9 00
	STA ram_00D4				;C - - - - - 0x017CBC 05:9CAC: 85 D4
	LDA scratch0				;C - - - - - 0x017CBE 05:9CAE: A5 00
	STA ram_00D5				;C - - - - - 0x017CC0 05:9CB0: 85 D5
CODE_0B9CB2:
	RTS							;C - - - - - 0x017CC2 05:9CB2: 60

CODE_0B9CB3:
	LDA playerState				;C - - - - - 0x017CC3 05:9CB3: A5 75
	CMP #$03					;C - - - - - 0x017CC5 05:9CB5: C9 03
	BNE CODE_0B9CCF				;C - - - - - 0x017CC7 05:9CB7: D0 16
		LDA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x017CC9 05:9CB9: BD FC 06
		AND #$03					;C - - - - - 0x017CCC 05:9CBC: 29 03
		CMP #$03					;C - - - - - 0x017CCE 05:9CBE: C9 03
		BNE CODE_0B9CCF				;C - - - - - 0x017CD0 05:9CC0: D0 0D
			LDA #$00					;C - - - - - 0x017CD2 05:9CC2: A9 00
			STA enemyMad,X				;C - - - - - 0x017CD4 05:9CC4: 95 63
			LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x017CD6 05:9CC6: BD 34 06
			SEC							;C - - - - - 0x017CD9 05:9CC9: 38
			SBC #$01					;C - - - - - 0x017CDA 05:9CCA: E9 01
			STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x017CDC 05:9CCC: 9D FC 06
CODE_0B9CCF:
	RTS							;C - - - - - 0x017CDF 05:9CCF: 60

CODE_0B9CD0:
	LDA ram_04AC				;C - - - - - 0x017CE0 05:9CD0: AD AC 04
	BNE CODE_0B9CE7				;C - - - - - 0x017CE3 05:9CD3: D0 12
		LDA roundSkelDelay				;C - - - - - 0x017CE5 05:9CD5: A5 6D
		BEQ CODE_0B9CE4				;C - - - - - 0x017CE7 05:9CD7: F0 0B
			LDA objState+OSLOT_ENEMY+8				;C - - - - - 0x017CE9 05:9CD9: AD 74 05
			BNE CODE_0B9CE4				;C - - - - - 0x017CEC 05:9CDC: D0 06
				INC ram_04AC				;C - - - - - 0x017CEE 05:9CDE: EE AC 04
				JMP CODE_0B9D91				;C - - - - - 0x017CF1 05:9CE1: 4C 91 9D
	CODE_0B9CE4:
		JMP CODE_0B9D91				;C - - - - - 0x017CF4 05:9CE4: 4C 91 9D
CODE_0B9CE7:
	CMP #$01					;C - - - - - 0x017CF7 05:9CE7: C9 01
	BNE CODE_0B9D16				;C - - - - - 0x017CF9 05:9CE9: D0 2B
		LDA ram_04AE				;C - - - - - 0x017CFB 05:9CEB: AD AE 04
		CMP roundSkelDelay				;C - - - - - 0x017CFE 05:9CEE: C5 6D
		BEQ CODE_0B9D06				;C - - - - - 0x017D00 05:9CF0: F0 14
			LDA ram_04AD				;C - - - - - 0x017D02 05:9CF2: AD AD 04
			CLC							;C - - - - - 0x017D05 05:9CF5: 18
			ADC #$01					;C - - - - - 0x017D06 05:9CF6: 69 01
			STA ram_04AD				;C - - - - - 0x017D08 05:9CF8: 8D AD 04
			LDA ram_04AE				;C - - - - - 0x017D0B 05:9CFB: AD AE 04
			ADC #$00					;C - - - - - 0x017D0E 05:9CFE: 69 00
			STA ram_04AE				;C - - - - - 0x017D10 05:9D00: 8D AE 04
			JMP CODE_0B9D91				;C - - - - - 0x017D13 05:9D03: 4C 91 9D
	CODE_0B9D06:
		LDA #trSkelWarning_ID					;C - - - - - 0x017D16 05:9D06: A9 0D
		STA a:musicTrigger			;C - - - - - 0x017D18 05:9D08: 8D E0 00

		LDA #$02					;C - - - - - 0x017D1B 05:9D0B: A9 02
		STA ram_04AC				;C - - - - - 0x017D1D 05:9D0D: 8D AC 04

		INC skelMonstaWarnings				;C - - - - - 0x017D20 05:9D10: EE 40 05
		JMP CODE_0B9D91				;C - - - - - 0x017D23 05:9D13: 4C 91 9D
CODE_0B9D16:
	CMP #$02					;C - - - - - 0x017D26 05:9D16: C9 02
	BNE CODE_0B9D47				;C - - - - - 0x017D28 05:9D18: D0 2D
		LDA #$16					;C - - - - - 0x017D2A 05:9D1A: A9 16
		STA enemyType+8				;C - - - - - 0x017D2C 05:9D1C: 85 A0
		LDA #$00					;C - - - - - 0x017D2E 05:9D1E: A9 00
		STA ram_00BE				;C - - - - - 0x017D30 05:9D20: 85 BE
		LDA #$06					;C - - - - - 0x017D32 05:9D22: A9 06
		STA ram_00CA				;C - - - - - 0x017D34 05:9D24: 85 CA
		STA objState+OSLOT_ENEMY+8				;C - - - - - 0x017D36 05:9D26: 8D 74 05
		LDA #$03					;C - - - - - 0x017D39 05:9D29: A9 03
		STA objChrSlot+OSLOT_ENEMY+8				;C - - - - - 0x017D3B 05:9D2B: 8D 3C 06
		LDA #$00					;C - - - - - 0x017D3E 05:9D2E: A9 00
		STA objX+OSLOT_ENEMY+8				;C - - - - - 0x017D40 05:9D30: 8D C4 05
		LDA #$F0					;C - - - - - 0x017D43 05:9D33: A9 F0
		STA objY+OSLOT_ENEMY+8				;C - - - - - 0x017D45 05:9D35: 8D 9C 05
		LDA #$02					;C - - - - - 0x017D48 05:9D38: A9 02
		STA enemyDir+8				;C - - - - - 0x017D4A 05:9D3A: 85 AA
		STA ram_04AB				;C - - - - - 0x017D4C 05:9D3C: 8D AB 04
		LDA #$03					;C - - - - - 0x017D4F 05:9D3F: A9 03
		STA ram_04AC				;C - - - - - 0x017D51 05:9D41: 8D AC 04
		JMP CODE_0B9D8E				;C - - - - - 0x017D54 05:9D44: 4C 8E 9D
CODE_0B9D47:
	LDA ram_04AC				;C - - - - - 0x017D57 05:9D47: AD AC 04
	CMP #$03					;C - - - - - 0x017D5A 05:9D4A: C9 03
	BNE CODE_0B9D5A				;C - - - - - 0x017D5C 05:9D4C: D0 0C
		LDA objState+OSLOT_ENEMY+8				;C - - - - - 0x017D5E 05:9D4E: AD 74 05
		CMP #$02					;C - - - - - 0x017D61 05:9D51: C9 02
		BNE CODE_0B9D5A				;C - - - - - 0x017D63 05:9D53: D0 05
			LDA #$04					;C - - - - - 0x017D65 05:9D55: A9 04
			STA ram_04AC				;C - - - - - 0x017D67 05:9D57: 8D AC 04
CODE_0B9D5A:
	CMP #$04					;C - - - - - 0x017D6A 05:9D5A: C9 04
	BNE CODE_0B9D63				;C - - - - - 0x017D6C 05:9D5C: D0 05
		LDA #$A0					;C - - - - - 0x017D6E 05:9D5E: A9 A0
		STA ram_07F5				;C - - - - - 0x017D70 05:9D60: 8D F5 07
CODE_0B9D63:
	LDA playerState				;C - - - - - 0x017D73 05:9D63: A5 75
	CMP #$03					;C - - - - - 0x017D75 05:9D65: C9 03
	BEQ CODE_0B9D76				;C - - - - - 0x017D77 05:9D67: F0 0D
		LDA #$01					;C - - - - - 0x017D79 05:9D69: A9 01
		CMP untrappedEnemies				;C - - - - - 0x017D7B 05:9D6B: C5 CC
		BEQ CODE_0B9D76				;C - - - - - 0x017D7D 05:9D6D: F0 07
			CMP ram_00CB				;C - - - - - 0x017D7F 05:9D6F: C5 CB
			BEQ CODE_0B9D76				;C - - - - - 0x017D81 05:9D71: F0 03
				JMP CODE_0B9D91				;C - - - - - 0x017D83 05:9D73: 4C 91 9D
CODE_0B9D76:
	LDA objState+OSLOT_ENEMY+8				;C - - - - - 0x017D86 05:9D76: AD 74 05
	BEQ CODE_0B9D80				;C - - - - - 0x017D89 05:9D79: F0 05
		LDA #$04					;C - - - - - 0x017D8B 05:9D7B: A9 04
		STA objState+OSLOT_ENEMY+8				;C - - - - - 0x017D8D 05:9D7D: 8D 74 05
CODE_0B9D80:
	LDA #$00					;C - - - - - 0x017D90 05:9D80: A9 00
	STA ram_04AD				;C - - - - - 0x017D92 05:9D82: 8D AD 04
	STA ram_04AE				;C - - - - - 0x017D95 05:9D85: 8D AE 04
	STA ram_04AC				;C - - - - - 0x017D98 05:9D88: 8D AC 04
	JSR CODE_0B9D94				;C - - - - - 0x017D9B 05:9D8B: 20 94 9D
CODE_0B9D8E:
	JSR CODE_0B9C34				;C - - - - - 0x017D9E 05:9D8E: 20 34 9C
CODE_0B9D91:
	RTS							;C - - - - - 0x017DA1 05:9D91: 60

DATA_0B9D91:
	;Unreached
	.byte $01					;- - - - - - 0x017DA2 05:9D92: 01
	.byte $02					;- - - - - - 0x017DA3 05:9D93: 02

CODE_0B9D94:
	LDA #.BANK(RoundsMusicTracks)					;C - - - - - 0x017DA4 05:9D94: A9 04
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x017DA6 05:9D96: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x017DA8 05:9D98: 20 56 FF
.endif

	LDX currentRound				;C - - - - - 0x017DAB 05:9D9B: A6 D8
	LDA RoundsMusicTracks,X			;C - - - - - 0x017DAD 05:9D9D: BD 1E BC
	AND #~MUSIC_PLAYING					;C - - - - - 0x017DB0 05:9DA0: 29 7F
	STA a:musicTrigger				;C - - - - - 0x017DB2 05:9DA2: 8D E0 00

	;(Unsure of actual intended target)
	LDA #.BANK(AnimTable)					;C - - - - - 0x017DB5 05:9DA5: A9 0C
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x017DB7 05:9DA7: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x017DB9 05:9DA9: 20 56 FF
.endif
	RTS							;C - - - - - 0x017DBC 05:9DAC: 60

RounderUpdate:
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x017DBD 05:9DAD: AD 6C 05
	BNE CODE_0B9DB8				;C - - - - - 0x017DC0 05:9DB0: D0 06
		;Unreached
		JSR CODE_0B8446				;- - - - - - 0x017DC2 05:9DB2: 20
		JMP CODE_0B9EBE				;- - - - - - 0x017DC5 05:9DB5: 4C
CODE_0B9DB8:
	LDA ram_00B6				;C - - - - - 0x017DC8 05:9DB8: A5 B6
	ADC objX				;C - - - - - 0x017DCA 05:9DBA: 6D B3 05
	ADC objX+OSLOT_ENEMY+1				;C - - - - - 0x017DCD 05:9DBD: 6D BD 05
	ADC objY+OSLOT_BUBBLE				;C - - - - - 0x017DD0 05:9DC0: 6D 9F 05
	ADC objY+OSLOT_BUBBLE+2				;C - - - - - 0x017DD3 05:9DC3: 6D A1 05
	EOR globalTimer				;C - - - - - 0x017DD6 05:9DC6: 45 14
	STA ram_00B6				;C - - - - - 0x017DD8 05:9DC8: 85 B6
	INC ram_00B6				;C - - - - - 0x017DDA 05:9DCA: E6 B6
	LDA ram_00CA				;C - - - - - 0x017DDC 05:9DCC: A5 CA
	CMP #$01					;C - - - - - 0x017DDE 05:9DCE: C9 01
	BNE CODE_0B9DE8				;C - - - - - 0x017DE0 05:9DD0: D0 16
		LDA #$03					;C - - - - - 0x017DE2 05:9DD2: A9 03
		STA ram_00CA				;C - - - - - 0x017DE4 05:9DD4: 85 CA
		LDA #$01					;C - - - - - 0x017DE6 05:9DD6: A9 01
		STA enemyReward,X				;C - - - - - 0x017DE8 05:9DD8: 95 8E
		LDA #$02					;C - - - - - 0x017DEA 05:9DDA: A9 02
		STA ram_00AC,X				;C - - - - - 0x017DEC 05:9DDC: 95 AC
		STA enemyDir,X				;C - - - - - 0x017DEE 05:9DDE: 95 A2
		LDA #$04					;C - - - - - 0x017DF0 05:9DE0: A9 04
		STA ram_04AF,X				;C - - - - - 0x017DF2 05:9DE2: 9D AF 04
		JMP CODE_0B9E9C				;C - - - - - 0x017DF5 05:9DE5: 4C 9C 9E
CODE_0B9DE8:
	CMP #$02					;C - - - - - 0x017DF8 05:9DE8: C9 02
	BNE CODE_0B9E1E				;C - - - - - 0x017DFA 05:9DEA: D0 32

	LDA projTouchingPlayer				;C - - - - - 0x017DFC 05:9DEC: A5 CE
	AND #$40					;C - - - - - 0x017DFE 05:9DEE: 29 40
	BEQ CODE_0B9DFD				;C - - - - - 0x017E00 05:9DF0: F0 0B
		LDA #$01					;C - - - - - 0x017E02 05:9DF2: A9 01
		STA enemyReward,X				;C - - - - - 0x017E04 05:9DF4: 95 8E
		LDA #$02					;C - - - - - 0x017E06 05:9DF6: A9 02
		STA enemyDir,X				;C - - - - - 0x017E08 05:9DF8: 95 A2
		JMP CODE_0B9E1B				;C - - - - - 0x017E0A 05:9DFA: 4C 1B 9E
CODE_0B9DFD:
	LDA projTouchingPlayer				;C - - - - - 0x017E0D 05:9DFD: A5 CE
	AND #$80					;C - - - - - 0x017E0F 05:9DFF: 29 80
	BEQ CODE_0B9E0E				;C - - - - - 0x017E11 05:9E01: F0 0B
		LDA #$FF					;C - - - - - 0x017E13 05:9E03: A9 FF
		STA enemyReward,X				;C - - - - - 0x017E15 05:9E05: 95 8E
		LDA #$01					;C - - - - - 0x017E17 05:9E07: A9 01
		STA enemyDir,X				;C - - - - - 0x017E19 05:9E09: 95 A2
		JMP CODE_0B9E1B				;C - - - - - 0x017E1B 05:9E0B: 4C 1B 9E
CODE_0B9E0E:
	LDA ram_00CD				;C - - - - - 0x017E1E 05:9E0E: A5 CD
	BNE CODE_0B9E1B				;C - - - - - 0x017E20 05:9E10: D0 09
CODE_0B9E12:
	LDA #$06					;C - - - - - 0x017E22 05:9E12: A9 06
	STA ram_00CA				;C - - - - - 0x017E24 05:9E14: 85 CA
	LDA #anRounderFall_ID					;C - - - - - 0x017E26 05:9E16: A9 E0
	JSR StartEnemyAnim2				;C - - - - - 0x017E28 05:9E18: 20 C2 9E
CODE_0B9E1B:
	JMP CODE_0B9E9C				;C - - - - - 0x017E2B 05:9E1B: 4C 9C 9E
CODE_0B9E1E:
	CMP #$03					;C - - - - - 0x017E2E 05:9E1E: C9 03
	BNE CODE_0B9E31				;C - - - - - 0x017E30 05:9E20: D0 0F
		LDA ram_00CD				;C - - - - - 0x017E32 05:9E22: A5 CD
		BEQ CODE_0B9E2E				;C - - - - - 0x017E34 05:9E24: F0 08
			LDA #$04					;C - - - - - 0x017E36 05:9E26: A9 04
			STA ram_00CA				;C - - - - - 0x017E38 05:9E28: 85 CA
			LDA #$00					;C - - - - - 0x017E3A 05:9E2A: A9 00
			STA ram_00B6,X				;C - - - - - 0x017E3C 05:9E2C: 95 B6
	CODE_0B9E2E:
		JMP CODE_0B9EAD				;C - - - - - 0x017E3E 05:9E2E: 4C AD 9E
CODE_0B9E31:
	CMP #$04					;C - - - - - 0x017E41 05:9E31: C9 04
	BNE CODE_0B9E5A				;C - - - - - 0x017E43 05:9E33: D0 25
		INC ram_00B6,X				;C - - - - - 0x017E45 05:9E35: F6 B6
		LDA ram_00B6,X				;C - - - - - 0x017E47 05:9E37: B5 B6
		CMP #$0B					;C - - - - - 0x017E49 05:9E39: C9 0B
		BCS CODE_0B9E40				;C - - - - - 0x017E4B 05:9E3B: B0 03
			JMP CODE_0B9EAD				;C - - - - - 0x017E4D 05:9E3D: 4C AD 9E
	CODE_0B9E40:
		LDA ram_00B6				;C - - - - - 0x017E50 05:9E40: A5 B6
		AND #$01					;C - - - - - 0x017E52 05:9E42: 29 01
		BNE CODE_0B9E54				;C - - - - - 0x017E54 05:9E44: D0 0E
			LDA #$05					;C - - - - - 0x017E56 05:9E46: A9 05
			STA ram_00CA				;C - - - - - 0x017E58 05:9E48: 85 CA
			LDA #anRounderHang_ID					;C - - - - - 0x017E5A 05:9E4A: A9 E1
			JSR StartEnemyAnim2				;C - - - - - 0x017E5C 05:9E4C: 20 C2 9E
			STA ram_00B6,X				;C - - - - - 0x017E5F 05:9E4F: 95 B6
			JMP CODE_0B9EB1				;C - - - - - 0x017E61 05:9E51: 4C B1 9E
	CODE_0B9E54:
		JMP CODE_0B9E12				;C - - - - - 0x017E64 05:9E54: 4C 12 9E
CODE_0B9E57:
	;Unreached
	JMP CODE_0B9EB1				;- - - - - - 0x017E67 05:9E57: 4C
CODE_0B9E5A:
	CMP #$05					;C - - - - - 0x017E6A 05:9E5A: C9 05
	BNE CODE_0B9E7E				;C - - - - - 0x017E6C 05:9E5C: D0 20
		INC ram_00B6,X				;C - - - - - 0x017E6E 05:9E5E: F6 B6
		LDA ram_00B6,X				;C - - - - - 0x017E70 05:9E60: B5 B6
		CMP #$40					;C - - - - - 0x017E72 05:9E62: C9 40
		BCC CODE_0B9E7B				;C - - - - - 0x017E74 05:9E64: 90 15
			LDA ram_00B6				;C - - - - - 0x017E76 05:9E66: A5 B6
			AND #$01					;C - - - - - 0x017E78 05:9E68: 29 01
			BEQ CODE_0B9E6F				;C - - - - - 0x017E7A 05:9E6A: F0 03
				JMP CODE_0B9E12				;C - - - - - 0x017E7C 05:9E6C: 4C 12 9E
		CODE_0B9E6F:
			LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x017E7F 05:9E6F: BD 94 05
			SEC							;C - - - - - 0x017E82 05:9E72: 38
			SBC #$16					;C - - - - - 0x017E83 05:9E73: E9 16
			STA objY+OSLOT_ENEMY,X				;C - - - - - 0x017E85 05:9E75: 9D 94 05
			JMP CODE_0B9E89				;C - - - - - 0x017E88 05:9E78: 4C 89 9E
	CODE_0B9E7B:
		JMP CODE_0B9EB1				;C - - - - - 0x017E8B 05:9E7B: 4C B1 9E
CODE_0B9E7E:
	CMP #$06					;C - - - - - 0x017E8E 05:9E7E: C9 06
	BNE CODE_0B9EB1				;C - - - - - 0x017E90 05:9E80: D0 2F

	LDA ram_00CD				;C - - - - - 0x017E92 05:9E82: A5 CD
	BNE CODE_0B9E89				;C - - - - - 0x017E94 05:9E84: D0 03
	JMP CODE_0B9EAD				;C - - - - - 0x017E96 05:9E86: 4C AD 9E
CODE_0B9E89:
	LDA #$02					;C - - - - - 0x017E99 05:9E89: A9 02
	STA ram_00CA				;C - - - - - 0x017E9B 05:9E8B: 85 CA
	LDA #anRounder_ID					;C - - - - - 0x017E9D 05:9E8D: A9 DF
	JSR StartEnemyAnim2				;C - - - - - 0x017E9F 05:9E8F: 20 C2 9E
	STA ram_00B6,X				;C - - - - - 0x017EA2 05:9E92: 95 B6
	LDA #$01					;C - - - - - 0x017EA4 05:9E94: A9 01
	STA ram_04AF,X				;C - - - - - 0x017EA6 05:9E96: 9D AF 04
	JMP CODE_0B9EB1				;C - - - - - 0x017EA9 05:9E99: 4C B1 9E
CODE_0B9E9C:
	LDA enemyReward,X				;C - - - - - 0x017EAC 05:9E9C: B5 8E
	STA scratch0				;C - - - - - 0x017EAE 05:9E9E: 85 00
	LDA enemyMad,X				;C - - - - - 0x017EB0 05:9EA0: B5 63
	BEQ CODE_0B9EA6				;C - - - - - 0x017EB2 05:9EA2: F0 02
		ASL scratch0				;C - - - - - 0x017EB4 05:9EA4: 06 00
CODE_0B9EA6:
	LDA scratch0				;C - - - - - 0x017EB6 05:9EA6: A5 00
	STA ram_00D4				;C - - - - - 0x017EB8 05:9EA8: 85 D4
	JMP CODE_0B9EB1				;C - - - - - 0x017EBA 05:9EAA: 4C B1 9E
CODE_0B9EAD:
	LDA ram_00AC,X				;C - - - - - 0x017EBD 05:9EAD: B5 AC
	STA ram_00D5				;C - - - - - 0x017EBF 05:9EAF: 85 D5
CODE_0B9EB1:
	JSR CODE_0B842F				;C - - - - - 0x017EC1 05:9EB1: 20 2F 84
	LDA ram_00CA				;C - - - - - 0x017EC4 05:9EB4: A5 CA
	BNE CODE_0B9EBE				;C - - - - - 0x017EC6 05:9EB6: D0 06
		LDA #$80					;C - - - - - 0x017EC8 05:9EB8: A9 80
		STA enemyReward,X				;C - - - - - 0x017ECA 05:9EBA: 95 8E
		STA ram_00AC,X				;C - - - - - 0x017ECC 05:9EBC: 95 AC
CODE_0B9EBE:
	RTS							;C - - - - - 0x017ECE 05:9EBE: 60

ChuckerUpdate:
	JMP DrunkUpdate				;C - - - - - 0x017ECF 05:9EBF: 4C 58 96

StartEnemyAnim2:
	;A: Anim LO
	;X: Enemy index
	;Sets AnimHI to zero, unlike StartEnemyAnim
	STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x017ED2 05:9EC2: 9D 84 06
	LDA #$00					;C - - - - - 0x017ED5 05:9EC5: A9 00
	STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x017ED7 05:9EC7: 9D 24 07
	STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x017EDA 05:9ECA: 9D AC 06
	STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x017EDD 05:9ECD: 9D D4 06
	RTS							;C - - - - - 0x017EE0 05:9ED0: 60

CODE_0B9ED1:
	ASL							;C - - - - - 0x017EE1 05:9ED1: 0A
	ASL							;C - - - - - 0x017EE2 05:9ED2: 0A
	TAY							;C - - - - - 0x017EE3 05:9ED3: A8

	LDA #.BANK(DATA_06BE3E)					;C - - - - - 0x017EE4 05:9ED4: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x017EE6 05:9ED6: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x017EE8 05:9ED8: 20 56 FF
.endif
	;State/projectile ID
	LDA DATA_06BE3E,Y			;C - - - - - 0x017EEB 05:9EDB: B9 3E BE
	STA scratch5				;C - - - - - 0x017EEE 05:9EDE: 85 05
	;Anim
	LDA DATA_06BE3E+1,Y			;C - - - - - 0x017EF0 05:9EE0: B9 3F BE
	STA scratch6				;C - - - - - 0x017EF3 05:9EE3: 85 06
	LDA DATA_06BE3E+2,Y			;C - - - - - 0x017EF5 05:9EE5: B9 40 BE
	STA scratch7				;C - - - - - 0x017EF8 05:9EE8: 85 07
	;CHR slot
	LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x017EFA 05:9EEA: BD 34 06
	STA scratch2				;C - - - - - 0x017EFD 05:9EED: 85 02
	;X
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x017EFF 05:9EEF: BD BC 05
	STA scratch0				;C - - - - - 0x017F02 05:9EF2: 85 00
	;Y
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x017F04 05:9EF4: BD 94 05
	STA scratch1				;C - - - - - 0x017F07 05:9EF7: 85 01
	;Overwrite?
	LDA DATA_06BE3E+3,Y			;C - - - - - 0x017F09 05:9EF9: B9 41 BE
	STA scratch4				;C - - - - - 0x017F0C 05:9EFC: 85 04
	JSR SpawnProj				;C - - - - - 0x017F0E 05:9EFE: 20 82 FE

	LDA scratch4				;C - - - - - 0x017F11 05:9F01: A5 04
	BEQ CODE_0B9F15				;C - - - - - 0x017F13 05:9F03: F0 10
		LDA scratch0				;C - - - - - 0x017F15 05:9F05: A5 00
		BEQ CODE_0B9F15				;C - - - - - 0x017F17 05:9F07: F0 0C
			JSR DespawnProj_Direct				;C - - - - - 0x017F19 05:9F09: 20 73 FE

			LDA #.BANK(EnemyDefaultAnims)					;C - - - - - 0x017F1C 05:9F0C: A9 0C
.ifdef REGION_JP
			STA prgBankB
			STA $8001
.else
			STA newPrgBank				;C - - - - - 0x017F1E 05:9F0E: 85 3B
			JSR SwapPrgBankB				;C - - - - - 0x017F20 05:9F10: 20 56 FF
.endif

			CLC							;C - - - - - 0x017F23 05:9F13: 18
			RTS							;C - - - - - 0x017F24 05:9F14: 60
CODE_0B9F15:
	LDA #.BANK(EnemyDefaultAnims)					;C - - - - - 0x017F25 05:9F15: A9 0C
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x017F27 05:9F17: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x017F29 05:9F19: 20 56 FF
.endif

	SEC							;C - - - - - 0x017F2C 05:9F1C: 38
	RTS							;C - - - - - 0x017F2D 05:9F1D: 60

CODE_0B9F1E:
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x017F2E 05:9F1E: BD BC 05
	CLC							;C - - - - - 0x017F31 05:9F21: 18
	ADC ram_00D4				;C - - - - - 0x017F32 05:9F22: 65 D4
	STA objX+OSLOT_ENEMY,X				;C - - - - - 0x017F34 05:9F24: 9D BC 05
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x017F37 05:9F27: BD 94 05
	CLC							;C - - - - - 0x017F3A 05:9F2A: 18
	ADC ram_00D5				;C - - - - - 0x017F3B 05:9F2B: 65 D5
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x017F3D 05:9F2D: 9D 94 05
	RTS							;C - - - - - 0x017F40 05:9F30: 60

GhostMonstaUpdate:
	JSR CODE_0FF9E8				;C - - - - - 0x017F41 05:9F31: 20 E8 F9
	LDA ram_00CA				;C - - - - - 0x017F44 05:9F34: A5 CA
	CMP #$0B					;C - - - - - 0x017F46 05:9F36: C9 0B
	BCC CODE_0B9F3D				;C - - - - - 0x017F48 05:9F38: 90 03
		JMP CODE_0B9FAF				;C - - - - - 0x017F4A 05:9F3A: 4C AF 9F
CODE_0B9F3D:
	LDA enemyFrozenCycles				;C - - - - - 0x017F4D 05:9F3D: AD D4 04
	BEQ CODE_0B9F45				;C - - - - - 0x017F50 05:9F40: F0 03
		;Unreached
		JMP CODE_0B9FD9				;- - - - - - 0x017F52 05:9F42: 4C
CODE_0B9F45:
	LDA ram_00CA				;C - - - - - 0x017F55 05:9F45: A5 CA
	CMP #$01					;C - - - - - 0x017F57 05:9F47: C9 01
	BNE CODE_0B9F59				;C - - - - - 0x017F59 05:9F49: D0 0E
		LDA #$19					;C - - - - - 0x017F5B 05:9F4B: A9 19
		STA ram_04AF,X				;C - - - - - 0x017F5D 05:9F4D: 9D AF 04
		LDA ram_00CF				;C - - - - - 0x017F60 05:9F50: A5 CF
		CMP #$80					;C - - - - - 0x017F62 05:9F52: C9 80
		BCC CODE_0B9F79				;C - - - - - 0x017F64 05:9F54: 90 23
			JMP CODE_0B9F68				;C - - - - - 0x017F66 05:9F56: 4C 68 9F
CODE_0B9F59:
	CMP #$02					;C - - - - - 0x017F69 05:9F59: C9 02
	BNE CODE_0B9F85				;C - - - - - 0x017F6B 05:9F5B: D0 28

	LDA #$1A					;C - - - - - 0x017F6D 05:9F5D: A9 1A
	STA ram_04AF,X				;C - - - - - 0x017F6F 05:9F5F: 9D AF 04
	LDA ram_00CD				;C - - - - - 0x017F72 05:9F62: A5 CD
	CMP #$80					;C - - - - - 0x017F74 05:9F64: C9 80
	BCC CODE_0B9F79				;C - - - - - 0x017F76 05:9F66: 90 11
CODE_0B9F68:
	LDA ram_00CA				;C - - - - - 0x017F78 05:9F68: A5 CA
	EOR #$03					;C - - - - - 0x017F7A 05:9F6A: 49 03
	STA ram_00CA				;C - - - - - 0x017F7C 05:9F6C: 85 CA
	LDA ram_04AF,X				;C - - - - - 0x017F7E 05:9F6E: BD AF 04
	EOR #$03					;C - - - - - 0x017F81 05:9F71: 49 03
	STA ram_04AF,X				;C - - - - - 0x017F83 05:9F73: 9D AF 04
	JMP CODE_0B9F85				;C - - - - - 0x017F86 05:9F76: 4C 85 9F
CODE_0B9F79:
	LDA projTouchingPlayer				;C - - - - - 0x017F89 05:9F79: A5 CE
	AND #$C0					;C - - - - - 0x017F8B 05:9F7B: 29 C0
	BEQ CODE_0B9F85				;C - - - - - 0x017F8D 05:9F7D: F0 06
		LDA enemyDir,X				;C - - - - - 0x017F8F 05:9F7F: B5 A2
		EOR #$03					;C - - - - - 0x017F91 05:9F81: 49 03
		STA enemyDir,X				;C - - - - - 0x017F93 05:9F83: 95 A2
CODE_0B9F85:
	LDY enemyMad,X				;C - - - - - 0x017F95 05:9F85: B4 63
	LDA DATA_0B8DD0,Y			;C - - - - - 0x017F97 05:9F87: B9 D0 8D
	STA ram_00D4				;C - - - - - 0x017F9A 05:9F8A: 85 D4
	STA scratch2				;C - - - - - 0x017F9C 05:9F8C: 85 02
	JSR CODE_0B849D				;C - - - - - 0x017F9E 05:9F8E: 20 9D 84
	LDA ram_04AA				;C - - - - - 0x017FA1 05:9F91: AD AA 04
	ROL							;C - - - - - 0x017FA4 05:9F94: 2A
	AND #$03					;C - - - - - 0x017FA5 05:9F95: 29 03
	CLC							;C - - - - - 0x017FA7 05:9F97: 18
	ADC scratch2				;C - - - - - 0x017FA8 05:9F98: 65 02
	LSR							;C - - - - - 0x017FAA 05:9F9A: 4A
	LSR							;C - - - - - 0x017FAB 05:9F9B: 4A
	STA ram_00D5				;C - - - - - 0x017FAC 05:9F9C: 85 D5
	LDA ram_00CA				;C - - - - - 0x017FAE 05:9F9E: A5 CA
	CMP #$02					;C - - - - - 0x017FB0 05:9FA0: C9 02
	BEQ CODE_0B9FAC				;C - - - - - 0x017FB2 05:9FA2: F0 08
		LDA ram_00D5				;C - - - - - 0x017FB4 05:9FA4: A5 D5
		EOR #$FF					;C - - - - - 0x017FB6 05:9FA6: 49 FF
		STA ram_00D5				;C - - - - - 0x017FB8 05:9FA8: 85 D5
		INC ram_00D5				;C - - - - - 0x017FBA 05:9FAA: E6 D5
CODE_0B9FAC:
	JMP CODE_0B9FD9				;C - - - - - 0x017FBC 05:9FAC: 4C D9 9F
CODE_0B9FAF:
	LDA ram_00CA				;C - - - - - 0x017FBF 05:9FAF: A5 CA
	CMP #$E0					;C - - - - - 0x017FC1 05:9FB1: C9 E0
	BCC CODE_0B9FBC				;C - - - - - 0x017FC3 05:9FB3: 90 07
		;Unreached
		LDA #$E1					;- - - - - - 0x017FC5 05:9FB5: A9
		STA ram_00CA				;- - - - - - 0x017FC7 05:9FB7: 85
		JMP CODE_0B9FC3				;- - - - - - 0x017FC9 05:9FB9: 4C
CODE_0B9FBC:
	JSR CODE_0B9AA9				;C - - - - - 0x017FCC 05:9FBC: 20 A9 9A
	LDA #$01					;C - - - - - 0x017FCF 05:9FBF: A9 01
	STA ram_00CA				;C - - - - - 0x017FD1 05:9FC1: 85 CA
CODE_0B9FC3:
	LDA #$07					;C - - - - - 0x017FD3 05:9FC3: A9 07
	STA enemyType,X				;C - - - - - 0x017FD5 05:9FC5: 95 98
	LDA #anMonstaL_ID					;C - - - - - 0x017FD7 05:9FC7: A9 3E
	STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x017FD9 05:9FC9: 9D 84 06
	LDA #$00					;C - - - - - 0x017FDC 05:9FCC: A9 00
	STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x017FDE 05:9FCE: 9D AC 06
	STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x017FE1 05:9FD1: 9D D4 06
	LDA #$08					;C - - - - - 0x017FE4 05:9FD4: A9 08
	JSR CODE_0B9ED1				;C - - - - - 0x017FE6 05:9FD6: 20 D1 9E
CODE_0B9FD9:
	JSR CODE_0B9846				;C - - - - - 0x017FE9 05:9FD9: 20 46 98
	RTS							;C - - - - - 0x017FEC 05:9FDC: 60

.ifdef REGION_JP
;Filler data
	;- - - - - - 0x018004 05:9FF4: 40
	.incbin "filler/fill0B_JP.bin"
.endif