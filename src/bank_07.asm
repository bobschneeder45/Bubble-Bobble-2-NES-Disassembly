.segment "PRG_BANK_7"
; 0x00E010-0x01000F

CODE_078000:
	LDA globalTimer				;C - - - - - 0x00E010 03:8000: A5 14
	AND #$01					;C - - - - - 0x00E012 03:8002: 29 01
	BNE CODE_07805A				;C - - - - - 0x00E014 03:8004: D0 54
	JSR CODE_078061				;C - - - - - 0x00E016 03:8006: 20 61 80
	LDX openingCounter				;C - - - - - 0x00E019 03:8009: AE CC 04
	LDA vScroll				;C - - - - - 0x00E01C 03:800C: A5 29
	SEC							;C - - - - - 0x00E01E 03:800E: 38
	SBC DATA_07805B,X			;C - - - - - 0x00E01F 03:800F: FD 5B 80
	STA vScroll				;C - - - - - 0x00E022 03:8012: 85 29
	CMP #$F0					;C - - - - - 0x00E024 03:8014: C9 F0
	BCC CODE_078026				;C - - - - - 0x00E026 03:8016: 90 0E
		LDA DATA_07805D,X			;C - - - - - 0x00E028 03:8018: BD 5D 80
		STA vScroll				;C - - - - - 0x00E02B 03:801B: 85 29
		LDA vNametable				;C - - - - - 0x00E02D 03:801D: A5 2D
		SBC DATA_07805F,X			;C - - - - - 0x00E02F 03:801F: FD 5F 80
		AND #$01					;C - - - - - 0x00E032 03:8022: 29 01
		STA vNametable				;C - - - - - 0x00E034 03:8024: 85 2D
CODE_078026:
	LDA vScroll				;C - - - - - 0x00E036 03:8026: A5 29
	AND #$07					;C - - - - - 0x00E038 03:8028: 29 07
	BNE CODE_07805A				;C - - - - - 0x00E03A 03:802A: D0 2E
		INC openingCycle				;C - - - - - 0x00E03C 03:802C: EE CD 04
		JSR CODE_078093				;C - - - - - 0x00E03F 03:802F: 20 93 80
		LDX #$00					;C - - - - - 0x00E042 03:8032: A2 00
		LDA openingCycle				;C - - - - - 0x00E044 03:8034: AD CD 04
		CMP #$1F					;C - - - - - 0x00E047 03:8037: C9 1F
		BNE CODE_07804A				;C - - - - - 0x00E049 03:8039: D0 0F
			LDA chrBankA				;C - - - - - 0x00E04B 03:803B: A5 4B
			BNE CODE_078040				;C - - - - - 0x00E04D 03:803D: D0 01
				INX							;C - - - - - 0x00E04F 03:803F: E8
		CODE_078040:
			LDA #chrSmallFont_A_ID					;C - - - - - 0x00E050 03:8040: A9 0E
			STA chrBankA,X				;C - - - - - 0x00E052 03:8042: 95 4B
			INC openingCounter				;C - - - - - 0x00E054 03:8044: EE CC 04
			JMP CODE_07805A				;C - - - - - 0x00E057 03:8047: 4C 5A 80
	CODE_07804A:
		CMP #$72					;C - - - - - 0x00E05A 03:804A: C9 72
		BNE CODE_07805A				;C - - - - - 0x00E05C 03:804C: D0 0C
			LDA #.BANK(CODE_058E6A)					;C - - - - - 0x00E05E 03:804E: A9 05
			STA nmiPrgBankA				;C - - - - - 0x00E060 03:8050: 85 51
			LDA #.LOBYTE(CODE_058E6A)	;C - - - - - 0x00E062 03:8052: A9 6A
			STA nmiBankedSub			;C - - - - - 0x00E064 03:8054: 85 16
			LDA #.HIBYTE(CODE_058E6A)	;C - - - - - 0x00E066 03:8056: A9 8E
			STA nmiBankedSub+1			;C - - - - - 0x00E068 03:8058: 85 17
CODE_07805A:
	RTS							;C - - - - - 0x00E06A 03:805A: 60

DATA_07805B:
	.byte $01					;- D 0 - - - 0x00E06B 03:805B: 01
	.byte $FF					;- D 0 - - - 0x00E06C 03:805C: FF
DATA_07805D:
	.byte $EF					;- D 0 - - - 0x00E06D 03:805D: EF
	.byte $00					;- D 0 - - - 0x00E06E 03:805E: 00
DATA_07805F:
	.byte $01					;- D 0 - - - 0x00E06F 03:805F: 01
	.byte $FF					;- D 0 - - - 0x00E070 03:8060: FF

CODE_078061:
	LDA openingCycle				;C - - - - - 0x00E071 03:8061: AD CD 04
	CMP #$0B					;C - - - - - 0x00E074 03:8064: C9 0B
	BCS CODE_078092				;C - - - - - 0x00E076 03:8066: B0 2A
		CMP #$0A					;C - - - - - 0x00E078 03:8068: C9 0A
		BNE CODE_07807A				;C - - - - - 0x00E07A 03:806A: D0 0E
			LDA #$00					;C - - - - - 0x00E07C 03:806C: A9 00
			STA objState				;C - - - - - 0x00E07E 03:806E: 8D 63 05
			STA objState+1				;C - - - - - 0x00E081 03:8071: 8D 64 05
			STA objState+2				;C - - - - - 0x00E084 03:8074: 8D 65 05
			STA objState+3				;C - - - - - 0x00E087 03:8077: 8D 66 05
	CODE_07807A:
		INC objY				;C - - - - - 0x00E08A 03:807A: EE 8B 05
		INC objY+1				;C - - - - - 0x00E08D 03:807D: EE 8C 05
		INC objY+2				;C - - - - - 0x00E090 03:8080: EE 8D 05
		INC objY+3				;C - - - - - 0x00E093 03:8083: EE 8E 05
		LDA globalTimer				;C - - - - - 0x00E096 03:8086: A5 14
		AND #$01					;C - - - - - 0x00E098 03:8088: 29 01
		BNE CODE_07808F				;C - - - - - 0x00E09A 03:808A: D0 03
			JSR AnimateNonBubbles				;C - - - - - 0x00E09C 03:808C: 20 5C EE
	CODE_07808F:
		JSR DrawObjects				;C - - - - - 0x00E09F 03:808F: 20 E2 EE
CODE_078092:
	RTS							;C - - - - - 0x00E0A2 03:8092: 60

CODE_078093:
	LDA #.BANK(DATA_04BA3B)					;C - - - - - 0x00E0A3 03:8093: A9 04
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00E0A5 03:8095: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00E0A7 03:8097: 20 56 FF
.endif

	LDA vScroll				;C - - - - - 0x00E0AA 03:809A: A5 29
	AND #$F8					;C - - - - - 0x00E0AC 03:809C: 29 F8
	STA scratch6				;C - - - - - 0x00E0AE 03:809E: 85 06
	LDA #$00					;C - - - - - 0x00E0B0 03:80A0: A9 00
	STA scratch7				;C - - - - - 0x00E0B2 03:80A2: 85 07
	ASL scratch6				;C - - - - - 0x00E0B4 03:80A4: 06 06
	ROL scratch7				;C - - - - - 0x00E0B6 03:80A6: 26 07
	ASL scratch6				;C - - - - - 0x00E0B8 03:80A8: 06 06
	ROL scratch7				;C - - - - - 0x00E0BA 03:80AA: 26 07
	LDA #$00					;C - - - - - 0x00E0BC 03:80AC: A9 00
	STA scratch0				;C - - - - - 0x00E0BE 03:80AE: 85 00
	LDX openingCycle				;C - - - - - 0x00E0C0 03:80B0: AE CD 04
	LDA DATA_04BA3B,X			;C - - - - - 0x00E0C3 03:80B3: BD 3B BA
	CMP #$04					;C - - - - - 0x00E0C6 03:80B6: C9 04
	BCC CODE_0780CE				;C - - - - - 0x00E0C8 03:80B8: 90 14
	CMP #$0C					;C - - - - - 0x00E0CA 03:80BA: C9 0C
	BCC CODE_0780C6				;C - - - - - 0x00E0CC 03:80BC: 90 08
	CMP #$18					;C - - - - - 0x00E0CE 03:80BE: C9 18
	BEQ CODE_0780CA				;C - - - - - 0x00E0D0 03:80C0: F0 08
	LDA #$0C					;C - - - - - 0x00E0D2 03:80C2: A9 0C
	BNE CODE_0780CC				;C - - - - - 0x00E0D4 03:80C4: D0 06
CODE_0780C6:
	LDA #$04					;C - - - - - 0x00E0D6 03:80C6: A9 04
	BNE CODE_0780CC				;C - - - - - 0x00E0D8 03:80C8: D0 02
CODE_0780CA:
	LDA #$0A					;C - - - - - 0x00E0DA 03:80CA: A9 0A
CODE_0780CC:
	STA scratch0				;C - - - - - 0x00E0DC 03:80CC: 85 00
CODE_0780CE:
	LDA vNametable				;C - - - - - 0x00E0DE 03:80CE: A5 2D
	EOR openingCounter				;C - - - - - 0x00E0E0 03:80D0: 4D CC 04
	TAY							;C - - - - - 0x00E0E3 03:80D3: A8
	LDA scratch6				;C - - - - - 0x00E0E4 03:80D4: A5 06
	CLC							;C - - - - - 0x00E0E6 03:80D6: 18
	ADC scratch0				;C - - - - - 0x00E0E7 03:80D7: 65 00
	STA mapTargetAdr				;C - - - - - 0x00E0E9 03:80D9: 85 49
	LDA DATA_04BA39,Y			;C - - - - - 0x00E0EB 03:80DB: B9 39 BA
	CLC							;C - - - - - 0x00E0EE 03:80DE: 18
	ADC scratch7				;C - - - - - 0x00E0EF 03:80DF: 65 07
	STA mapTargetAdr+1				;C - - - - - 0x00E0F1 03:80E1: 85 4A
	LDA DATA_04BA3B,X			;C - - - - - 0x00E0F3 03:80E3: BD 3B BA
	ASL							;C - - - - - 0x00E0F6 03:80E6: 0A
	CLC							;C - - - - - 0x00E0F7 03:80E7: 18
	ADC #.LOBYTE(DATA_06B8B6)					;C - - - - - 0x00E0F8 03:80E8: 69 B6
	STA scratch8				;C - - - - - 0x00E0FA 03:80EA: 85 08
	LDA #$00					;C - - - - - 0x00E0FC 03:80EC: A9 00
	ADC #.HIBYTE(DATA_06B8B6)					;C - - - - - 0x00E0FE 03:80EE: 69 B8
	STA scratch9				;C - - - - - 0x00E100 03:80F0: 85 09

	LDA #.BANK(DATA_06B8B6)					;C - - - - - 0x00E102 03:80F2: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00E104 03:80F4: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00E106 03:80F6: 20 56 FF
.endif

	LDY #$00					;C - - - - - 0x00E109 03:80F9: A0 00
	LDA (scratch8),Y			;C - - - - - 0x00E10B 03:80FB: B1 08
	STA scratch6				;C - - - - - 0x00E10D 03:80FD: 85 06
	INY							;C - - - - - 0x00E10F 03:80FF: C8
	LDA (scratch8),Y			;C - - - - - 0x00E110 03:8100: B1 08
	STA scratch7				;C - - - - - 0x00E112 03:8102: 85 07
	LDA #$80					;C - - - - - 0x00E114 03:8104: A9 80
	STA scratch0				;C - - - - - 0x00E116 03:8106: 85 00
	JSR CODE_078152				;C - - - - - 0x00E118 03:8108: 20 52 81
	JSR CODE_078110				;C - - - - - 0x00E11B 03:810B: 20 10 81

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x00E11E 03:810E: 60

CODE_07810F:
	;Unreached
	RTS							;- - - - - - 0x00E11F 03:810F: 60

CODE_078110:
	LDA vScroll				;C - - - - - 0x00E120 03:8110: A5 29
	AND #$E0					;C - - - - - 0x00E122 03:8112: 29 E0
	LSR							;C - - - - - 0x00E124 03:8114: 4A
	LSR							;C - - - - - 0x00E125 03:8115: 4A
	CLC							;C - - - - - 0x00E126 03:8116: 18
	STA scratch6				;C - - - - - 0x00E127 03:8117: 85 06
	ADC #$C0					;C - - - - - 0x00E129 03:8119: 69 C0
	STA ram_03AA				;C - - - - - 0x00E12B 03:811B: 8D AA 03
	LDA vNametable				;C - - - - - 0x00E12E 03:811E: A5 2D
	EOR openingCounter				;C - - - - - 0x00E130 03:8120: 4D CC 04
	TAX							;C - - - - - 0x00E133 03:8123: AA
	LDA DATA_07814E,X			;C - - - - - 0x00E134 03:8124: BD 4E 81
	STA ram_03AB				;C - - - - - 0x00E137 03:8127: 8D AB 03
	LDA DATA_078150,X			;C - - - - - 0x00E13A 03:812A: BD 50 81
	CLC							;C - - - - - 0x00E13D 03:812D: 18
	ADC scratch6				;C - - - - - 0x00E13E 03:812E: 65 06
	STA scratch4				;C - - - - - 0x00E140 03:8130: 85 04
	CLC							;C - - - - - 0x00E142 03:8132: 18
	ADC #$08					;C - - - - - 0x00E143 03:8133: 69 08
	STA scratch5				;C - - - - - 0x00E145 03:8135: 85 05
	LDA #$00					;C - - - - - 0x00E147 03:8137: A9 00
	LDY scratch4				;C - - - - - 0x00E149 03:8139: A4 04
CODE_07813B:
	STA ram_03B1,Y				;C - - - - - 0x00E14B 03:813B: 99 B1 03
	INY							;C - - - - - 0x00E14E 03:813E: C8
	CPY scratch5				;C - - - - - 0x00E14F 03:813F: C4 05
	BCC CODE_07813B				;C - - - - - 0x00E151 03:8141: 90 F8

	LDA scratch4				;C - - - - - 0x00E153 03:8143: A5 04
	STA ram_03AF				;C - - - - - 0x00E155 03:8145: 8D AF 03
	LDA scratch5				;C - - - - - 0x00E158 03:8148: A5 05
	STA ram_03AE				;C - - - - - 0x00E15A 03:814A: 8D AE 03
	RTS							;C - - - - - 0x00E15D 03:814D: 60

DATA_07814E:
	.byte $23					;- D 0 - - - 0x00E15E 03:814E: 23
	.byte $2B					;- D 0 - - - 0x00E15F 03:814F: 2B
DATA_078150:
	.byte $00					;- D 0 - - - 0x00E160 03:8150: 00
	.byte $80					;- D 0 - - - 0x00E161 03:8151: 80

CODE_078152:
	LDY #$00					;C - - - - - 0x00E162 03:8152: A0 00
	LDX openingCounter				;C - - - - - 0x00E164 03:8154: AE CC 04
CODE_078157:
	LDA (scratch6),Y			;C - - - - - 0x00E167 03:8157: B1 06
	BEQ CODE_07818C				;C - - - - - 0x00E169 03:8159: F0 31
		SEC							;C - - - - - 0x00E16B 03:815B: 38
		SBC #$20					;C - - - - - 0x00E16C 03:815C: E9 20
		BNE CODE_078162				;C - - - - - 0x00E16E 03:815E: D0 02
			LDA #$7F					;C - - - - - 0x00E170 03:8160: A9 7F
	CODE_078162:
		CPX #$00					;C - - - - - 0x00E172 03:8162: E0 00
		BNE CODE_078177				;C - - - - - 0x00E174 03:8164: D0 11
			CLC							;C - - - - - 0x00E176 03:8166: 18
			ADC scratch0				;C - - - - - 0x00E177 03:8167: 65 00
			STA mapBuffer+32,Y				;C - - - - - 0x00E179 03:8169: 99 88 03
			LDA #$7F					;C - - - - - 0x00E17C 03:816C: A9 7F
			CLC							;C - - - - - 0x00E17E 03:816E: 18
			ADC scratch0				;C - - - - - 0x00E17F 03:816F: 65 00
			STA mapBuffer,Y				;C - - - - - 0x00E181 03:8171: 99 68 03
			JMP CODE_078185				;C - - - - - 0x00E184 03:8174: 4C 85 81
	CODE_078177:
		CLC							;C - - - - - 0x00E187 03:8177: 18
		ADC scratch0				;C - - - - - 0x00E188 03:8178: 65 00
		STA mapBuffer,Y				;C - - - - - 0x00E18A 03:817A: 99 68 03
		LDA #$7F					;C - - - - - 0x00E18D 03:817D: A9 7F
		CLC							;C - - - - - 0x00E18F 03:817F: 18
		ADC scratch0				;C - - - - - 0x00E190 03:8180: 65 00
		STA mapBuffer+32,Y				;C - - - - - 0x00E192 03:8182: 99 88 03
	CODE_078185:
		INY							;C - - - - - 0x00E195 03:8185: C8
		CPY #$20					;C - - - - - 0x00E196 03:8186: C0 20
		BCC CODE_078157				;C - - - - - 0x00E198 03:8188: 90 CD
		BCS CODE_078192				;C - - - - - 0x00E19A 03:818A: B0 06
CODE_07818C:
	STA mapBuffer,Y				;C - - - - - 0x00E19C 03:818C: 99 68 03
	STA mapBuffer+32,Y				;C - - - - - 0x00E19F 03:818F: 99 88 03
CODE_078192:
	LDA #.LOBYTE(CODE_0FE93B)	;C - - - - - 0x00E1A2 03:8192: A9 3B
	STA nmiUnbankedSub				;C - - - - - 0x00E1A4 03:8194: 85 35
	LDA #.HIBYTE(CODE_0FE93B)	;C - - - - - 0x00E1A6 03:8196: A9 E9
	STA nmiUnbankedSub+1				;C - - - - - 0x00E1A8 03:8198: 85 36
	RTS							;C - - - - - 0x00E1AA 03:819A: 60

CODE_07819B:
	LDA #$00					;C - - - - - 0x00E1AB 03:819B: A9 00
	STA ram_04D0				;C - - - - - 0x00E1AD 03:819D: 8D D0 04
	STA roundNumberDuration				;C - - - - - 0x00E1B0 03:81A0: 8D 73 04

	LDA #.BANK(CODE_08856D)					;C - - - - - 0x00E1B3 03:81A3: A9 08
	STA nmiPrgBankA				;C - - - - - 0x00E1B5 03:81A5: 85 51
	LDA #.LOBYTE(CODE_08856D)	;C - - - - - 0x00E1B7 03:81A7: A9 6D
	STA nmiBankedSub			;C - - - - - 0x00E1B9 03:81A9: 85 16
	LDA #.HIBYTE(CODE_08856D)	;C - - - - - 0x00E1BB 03:81AB: A9 85
	STA nmiBankedSub+1			;C - - - - - 0x00E1BD 03:81AD: 85 17
	RTS							;C - - - - - 0x00E1BF 03:81AF: 60

CODE_0781B0:
	LDA #.LOBYTE(CODE_07819B)	;C - - - - - 0x00E1C0 03:81B0: A9 9B
	STA updateSub				;C - - - - - 0x00E1C2 03:81B2: 85 19
	LDA #.HIBYTE(CODE_07819B)	;C - - - - - 0x00E1C4 03:81B4: A9 81
	STA updateSub+1				;C - - - - - 0x00E1C6 03:81B6: 85 1A
	RTS							;C - - - - - 0x00E1C8 03:81B8: 60

CODE_0781B9:
	LDA #.BANK(DATA_0ABF39)					;C - - - - - 0x00E1C9 03:81B9: A9 0A
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00E1CB 03:81BB: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00E1CD 03:81BD: 20 56 FF
.endif

	LDX currentRound				;C - - - - - 0x00E1D0 03:81C0: A6 D8
	LDA DATA_0ABF39,X			;C - - - - - 0x00E1D2 03:81C2: BD 39 BF
	STA ram_04D1				;C - - - - - 0x00E1D5 03:81C5: 8D D1 04
	ASL							;C - - - - - 0x00E1D8 03:81C8: 0A
	TAX							;C - - - - - 0x00E1D9 03:81C9: AA
	LDA DATA_0781DE,X			;C - - - - - 0x00E1DA 03:81CA: BD DE 81
	STA scratch8				;C - - - - - 0x00E1DD 03:81CD: 85 08
	LDA DATA_0781DE+1,X			;C - - - - - 0x00E1DF 03:81CF: BD DF 81
	STA scratch9				;C - - - - - 0x00E1E2 03:81D2: 85 09
	LDA #.HIBYTE(@ret-1)					;C - - - - - 0x00E1E4 03:81D4: A9 81
	PHA							;C - - - - - 0x00E1E6 03:81D6: 48
	LDA #.LOBYTE(@ret-1)					;C - - - - - 0x00E1E7 03:81D7: A9 DC
	PHA							;C - - - - - 0x00E1E9 03:81D9: 48
	JMP (scratch8)				;C - - - - - 0x00E1EA 03:81DA: 6C 08 00
@ret:

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x00E1ED 03:81DD: 60

DATA_0781DE:
	;- D 0 - - - 0x00E1EE 03:81DE: 9B
	.word CODE_07819B
	.word CODE_07822D
	.word CODE_07826D
	.word CODE_07833E
	.word CODE_078200
	.word CODE_078404
	.word CODE_07825F
	.word CODE_078251
	.word CODE_078251
	.word CODE_078251
	.word CODE_0786CD
	.word CODE_0785F3
	.word CODE_0785F4
	.word CODE_078216
	.word CODE_0785BB
	.word CODE_0785BB
	.word CODE_0785BB

CODE_078200:
	LDA #.BANK(ImageTable2)					;C - - - - - 0x00E210 03:8200: A9 0A
	STA sprPrgBank				;C - - - - - 0x00E212 03:8202: 8D 61 05
	LDA #$00					;C - - - - - 0x00E215 03:8205: A9 00
	STA ram_04D1				;C - - - - - 0x00E217 03:8207: 8D D1 04
	LDA vNametable				;C - - - - - 0x00E21A 03:820A: A5 2D
	EOR #$01					;C - - - - - 0x00E21C 03:820C: 49 01
	AND #$01					;C - - - - - 0x00E21E 03:820E: 29 01
	STA vNametable				;C - - - - - 0x00E220 03:8210: 85 2D
	JSR CODE_0FE626				;C - - - - - 0x00E222 03:8212: 20 26 E6
	RTS							;C - - - - - 0x00E225 03:8215: 60
CODE_078216:
	LDA #.BANK(ImageTable2)					;C - - - - - 0x00E226 03:8216: A9 0A
	STA sprPrgBank				;C - - - - - 0x00E228 03:8218: 8D 61 05
	JSR CODE_0FE5F0				;C - - - - - 0x00E22B 03:821B: 20 F0 E5
	LDA #$01					;C - - - - - 0x00E22E 03:821E: A9 01
	STA hNametable				;C - - - - - 0x00E230 03:8220: 85 2F
	STA vNametable				;C - - - - - 0x00E232 03:8222: 85 2D

	LDA #.LOBYTE(CODE_0788CC)					;C - - - - - 0x00E234 03:8224: A9 CC
	STA ram_005B				;C - - - - - 0x00E236 03:8226: 85 5B
	LDA #.HIBYTE(CODE_0788CC)					;C - - - - - 0x00E238 03:8228: A9 88
	STA ram_005C				;C - - - - - 0x00E23A 03:822A: 85 5C
	RTS							;C - - - - - 0x00E23C 03:822C: 60
CODE_07822D:
	LDA #$00					;C - - - - - 0x00E23D 03:822D: A9 00
	STA ram_00B6				;C - - - - - 0x00E23F 03:822F: 85 B6
	STA ram_00B7				;C - - - - - 0x00E241 03:8231: 85 B7
	STA ram_00B8				;C - - - - - 0x00E243 03:8233: 85 B8
	STA ram_00B9				;C - - - - - 0x00E245 03:8235: 85 B9
.ifdef REGION_JP
	STA ram_04CA				;- - - - - - 0x00E255 03:8245: 8D
.endif
	STA openingCycle				;C - - - - - 0x00E247 03:8237: 8D CD 04

	LDA #$01					;C - - - - - 0x00E24A 03:823A: A9 01
	STA enemyDir				;C - - - - - 0x00E24C 03:823C: 85 A2
	LDA #.BANK(ImageTable1)					;C - - - - - 0x00E24E 03:823E: A9 04
	STA sprPrgBank				;C - - - - - 0x00E250 03:8240: 8D 61 05
	JSR CODE_07826D				;C - - - - - 0x00E253 03:8243: 20 6D 82
	RTS							;C - - - - - 0x00E256 03:8246: 60
CODE_078247:
	LDA #.HIBYTE(@ret-1)					;C - - - - - 0x00E257 03:8247: A9 82
	PHA							;C - - - - - 0x00E259 03:8249: 48
	LDA #.LOBYTE(@ret-1)					;C - - - - - 0x00E25A 03:824A: A9 4F
	PHA							;C - - - - - 0x00E25C 03:824C: 48
	JMP (ram_005B)				;C - - - - - 0x00E25D 03:824D: 6C 5B 00
@ret:
	RTS							;C - - - - - 0x00E260 03:8250: 60
CODE_078251:
	LDA #.BANK(ImageTable2)					;C - - - - - 0x00E261 03:8251: A9 0A
	STA sprPrgBank				;C - - - - - 0x00E263 03:8253: 8D 61 05
	LDA #$00					;C - - - - - 0x00E266 03:8256: A9 00
	STA ram_04D1				;C - - - - - 0x00E268 03:8258: 8D D1 04
	JSR CODE_07819B				;C - - - - - 0x00E26B 03:825B: 20 9B 81
	RTS							;C - - - - - 0x00E26E 03:825E: 60
CODE_07825F:
	LDA #.BANK(ImageTable2)					;C - - - - - 0x00E26F 03:825F: A9 0A
	STA sprPrgBank				;C - - - - - 0x00E271 03:8261: 8D 61 05
	LDA #$0E					;C - - - - - 0x00E274 03:8264: A9 0E
	STA ram_04D1				;C - - - - - 0x00E276 03:8266: 8D D1 04
	JSR CODE_0785BB				;C - - - - - 0x00E279 03:8269: 20 BB 85
	RTS							;C - - - - - 0x00E27C 03:826C: 60

CODE_07826D:
	LDA #.BANK(DATA_0ABF9B)					;C - - - - - 0x00E27D 03:826D: A9 0A
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00E27F 03:826F: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00E281 03:8271: 20 56 FF
.endif

	LDA ram_04D0				;C - - - - - 0x00E284 03:8274: AD D0 04
	BNE CODE_07827F				;C - - - - - 0x00E287 03:8277: D0 06
		LDA ram_077C				;C - - - - - 0x00E289 03:8279: AD 7C 07
		STA ram_04D0				;C - - - - - 0x00E28C 03:827C: 8D D0 04
CODE_07827F:
	LDY vNametable				;C - - - - - 0x00E28F 03:827F: A4 2D
	LDA DATA_07845C,Y			;C - - - - - 0x00E291 03:8281: B9 5C 84
	STA mapBaseTile				;C - - - - - 0x00E294 03:8284: 8D 63 03
	LDA #chrFans_AA_ID					;C - - - - - 0x00E297 03:8287: A9 18
	STA bgAnimValue				;C - - - - - 0x00E299 03:8289: 8D CE 04
	LDX DATA_07845F,Y			;C - - - - - 0x00E29C 03:828C: BE 5F 84
	STA chrBankA,X				;C - - - - - 0x00E29F 03:828F: 95 4B
	LDA ram_04D0				;C - - - - - 0x00E2A1 03:8291: AD D0 04
	ASL							;C - - - - - 0x00E2A4 03:8294: 0A
	TAX							;C - - - - - 0x00E2A5 03:8295: AA
	LDA DATA_0ABF9B,X			;C - - - - - 0x00E2A6 03:8296: BD 9B BF
	STA mapTargetAdr				;C - - - - - 0x00E2A9 03:8299: 85 49
	LDA DATA_0ABF9B+1,X			;C - - - - - 0x00E2AB 03:829B: BD 9C BF
	CLC							;C - - - - - 0x00E2AE 03:829E: 18
	ADC DATA_078459,Y			;C - - - - - 0x00E2AF 03:829F: 79 59 84
	STA mapTargetAdr+1				;C - - - - - 0x00E2B2 03:82A2: 85 4A
	LDX ram_04D0				;C - - - - - 0x00E2B4 03:82A4: AE D0 04
	LDA DATA_0ABF8A,X			;C - - - - - 0x00E2B7 03:82A7: BD 8A BF
	STA mapID				;C - - - - - 0x00E2BA 03:82AA: 8D 60 03
	JSR LoadMap				;C - - - - - 0x00E2BD 03:82AD: 20 23 E5
	INC ram_04D0				;C - - - - - 0x00E2C0 03:82B0: EE D0 04
	LDA ram_04D0				;C - - - - - 0x00E2C3 03:82B3: AD D0 04
	CMP ram_077D				;C - - - - - 0x00E2C6 03:82B6: CD 7D 07
	BEQ CODE_0782C6				;C - - - - - 0x00E2C9 03:82B9: F0 0B
		LDA #.LOBYTE(CODE_07826D)	;C - - - - - 0x00E2CB 03:82BB: A9 6D
		STA updateSub				;C - - - - - 0x00E2CD 03:82BD: 85 19
		LDA #.HIBYTE(CODE_07826D)	;C - - - - - 0x00E2CF 03:82BF: A9 82
		STA updateSub+1				;C - - - - - 0x00E2D1 03:82C1: 85 1A

		JMP CODE_0782CE				;C - - - - - 0x00E2D3 03:82C3: 4C CE 82
CODE_0782C6:
	JSR CODE_0781B0				;C - - - - - 0x00E2D6 03:82C6: 20 B0 81
	LDA #$00					;C - - - - - 0x00E2D9 03:82C9: A9 00
	STA ram_04D1				;C - - - - - 0x00E2DB 03:82CB: 8D D1 04
CODE_0782CE:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x00E2DE 03:82CE: 60

CODE_0782CF:
	LDA ram_04D0				;C - - - - - 0x00E2DF 03:82CF: AD D0 04
	CMP #$04					;C - - - - - 0x00E2E2 03:82D2: C9 04
	BEQ CODE_078315				;C - - - - - 0x00E2E4 03:82D4: F0 3F
		LDY vNametable				;C - - - - - 0x00E2E6 03:82D6: A4 2D
		LDA DATA_07845C,Y			;C - - - - - 0x00E2E8 03:82D8: B9 5C 84
		STA mapBaseTile				;C - - - - - 0x00E2EB 03:82DB: 8D 63 03
		LDA #$18					;C - - - - - 0x00E2EE 03:82DE: A9 18
		LDX DATA_07845F,Y			;C - - - - - 0x00E2F0 03:82E0: BE 5F 84
		STA chrBankA,X				;C - - - - - 0x00E2F3 03:82E3: 95 4B
		LDA ram_04D0				;C - - - - - 0x00E2F5 03:82E5: AD D0 04
		ASL							;C - - - - - 0x00E2F8 03:82E8: 0A
		TAX							;C - - - - - 0x00E2F9 03:82E9: AA
		LDA DATA_07832F,X			;C - - - - - 0x00E2FA 03:82EA: BD 2F 83
		STA mapTargetAdr				;C - - - - - 0x00E2FD 03:82ED: 85 49
		LDA DATA_07832F+1,X			;C - - - - - 0x00E2FF 03:82EF: BD 30 83
		CLC							;C - - - - - 0x00E302 03:82F2: 18
		ADC DATA_07845A,Y			;C - - - - - 0x00E303 03:82F3: 79 5A 84
		STA mapTargetAdr+1				;C - - - - - 0x00E306 03:82F6: 85 4A
		LDX ram_04D0				;C - - - - - 0x00E308 03:82F8: AE D0 04
		LDA DATA_078339,X			;C - - - - - 0x00E30B 03:82FB: BD 39 83
		STA mapID				;C - - - - - 0x00E30E 03:82FE: 8D 60 03
		JSR LoadMap				;C - - - - - 0x00E311 03:8301: 20 23 E5
		INC ram_04D0				;C - - - - - 0x00E314 03:8304: EE D0 04

		LDA #.LOBYTE(CODE_0782CF)	;C - - - - - 0x00E317 03:8307: A9 CF
		STA updateSub				;C - - - - - 0x00E319 03:8309: 85 19
		LDA #.HIBYTE(CODE_0782CF)	;C - - - - - 0x00E31B 03:830B: A9 82
		STA updateSub+1				;C - - - - - 0x00E31D 03:830D: 85 1A

		LDA #$01					;C - - - - - 0x00E31F 03:830F: A9 01
		STA enteringRound			;C - - - - - 0x00E321 03:8311: 85 37
.ifdef REGION_JP
		JMP CODE_07832E				;- - - - - - 0x00E33B 03:832B: 4C
.else
		BNE CODE_07832E				;C - - - - - 0x00E323 03:8313: D0 19
.endif
CODE_078315:
	LDA #$30					;C - - - - - 0x00E325 03:8315: A9 30
	STA colorBuffer+5				;C - - - - - 0x00E327 03:8317: 8D 05 03
	LDA #$31					;C - - - - - 0x00E32A 03:831A: A9 31
	STA colorBuffer+6				;C - - - - - 0x00E32C 03:831C: 8D 06 03
	LDA #$22					;C - - - - - 0x00E32F 03:831F: A9 22
	STA colorBuffer+7				;C - - - - - 0x00E331 03:8321: 8D 07 03
	LDA #$00					;C - - - - - 0x00E334 03:8324: A9 00
	STA ram_04D0				;C - - - - - 0x00E336 03:8326: 8D D0 04
	STA enteringRound				;C - - - - - 0x00E339 03:8329: 85 37
	JSR CODE_07819B				;C - - - - - 0x00E33B 03:832B: 20 9B 81
CODE_07832E:
	RTS							;C - - - - - 0x00E33E 03:832E: 60

DATA_07832F:
	;- D 0 - - - 0x00E33F 03:832F: 00
	.word $2000
	.word $2040
	.word $2080
	.word $20C0
	.word $2100
DATA_078339:
	.byte mapFloodA_ID					;- D 0 - - - 0x00E349 03:8339: 62
	.byte mapFloodB_ID					;- D 0 - - - 0x00E34A 03:833A: 63
	.byte mapFloodC_ID					;- D 0 - - - 0x00E34B 03:833B: 64
	.byte mapFloodB_ID					;- D 0 - - - 0x00E34C 03:833C: 63
	.byte mapFloodC_ID					;- - - - - - 0x00E34D 03:833D: 64

CODE_07833E:
	LDA ram_04D0				;C - - - - - 0x00E34E 03:833E: AD D0 04
	BNE CODE_07834E				;C - - - - - 0x00E351 03:8341: D0 0B
		LDA currentRound				;C - - - - - 0x00E353 03:8343: A5 D8
		CMP #$21					;C - - - - - 0x00E355 03:8345: C9 21
		BEQ CODE_078351				;C - - - - - 0x00E357 03:8347: F0 08
			LDA #$03					;C - - - - - 0x00E359 03:8349: A9 03
			STA ram_04D0				;C - - - - - 0x00E35B 03:834B: 8D D0 04
CODE_07834E:
	DEC ram_04D0				;C - - - - - 0x00E35E 03:834E: CE D0 04
CODE_078351:
	LDY vNametable				;C - - - - - 0x00E361 03:8351: A4 2D
	LDA DATA_07845C,Y			;C - - - - - 0x00E363 03:8353: B9 5C 84
	STA mapBaseTile				;C - - - - - 0x00E366 03:8356: 8D 63 03
	LDA #chrShoeCar_A_ID					;C - - - - - 0x00E369 03:8359: A9 38
	STA bgAnimValue				;C - - - - - 0x00E36B 03:835B: 8D CE 04
	LDX DATA_07845F,Y			;C - - - - - 0x00E36E 03:835E: BE 5F 84
	STA chrBankA,X				;C - - - - - 0x00E371 03:8361: 95 4B
	LDA ram_04D0				;C - - - - - 0x00E373 03:8363: AD D0 04
	ASL							;C - - - - - 0x00E376 03:8366: 0A
	TAX							;C - - - - - 0x00E377 03:8367: AA
	LDA DATA_0783A6,X			;C - - - - - 0x00E378 03:8368: BD A6 83
	STA mapTargetAdr				;C - - - - - 0x00E37B 03:836B: 85 49
	LDA DATA_0783A6+1,X			;C - - - - - 0x00E37D 03:836D: BD A7 83
	CLC							;C - - - - - 0x00E380 03:8370: 18
	ADC DATA_078459,Y			;C - - - - - 0x00E381 03:8371: 79 59 84
	STA mapTargetAdr+1				;C - - - - - 0x00E384 03:8374: 85 4A
	LDX ram_04D0				;C - - - - - 0x00E386 03:8376: AE D0 04
	LDA DATA_0783A3,X			;C - - - - - 0x00E389 03:8379: BD A3 83
	STA mapID				;C - - - - - 0x00E38C 03:837C: 8D 60 03
	JSR LoadMap				;C - - - - - 0x00E38F 03:837F: 20 23 E5
	LDA ram_04D0				;C - - - - - 0x00E392 03:8382: AD D0 04
	BEQ CODE_078392				;C - - - - - 0x00E395 03:8385: F0 0B
		LDA #.LOBYTE(CODE_07833E)	;C - - - - - 0x00E397 03:8387: A9 3E
		STA updateSub				;C - - - - - 0x00E399 03:8389: 85 19
		LDA #.HIBYTE(CODE_07833E)	;C - - - - - 0x00E39B 03:838B: A9 83
		STA updateSub+1				;C - - - - - 0x00E39D 03:838D: 85 1A
		JMP CODE_0783A2				;C - - - - - 0x00E39F 03:838F: 4C A2 83
CODE_078392:
	JSR CODE_0781B0				;C - - - - - 0x00E3A2 03:8392: 20 B0 81
	LDA #$00					;C - - - - - 0x00E3A5 03:8395: A9 00
	STA ram_04D0				;C - - - - - 0x00E3A7 03:8397: 8D D0 04

	LDA #.LOBYTE(CODE_0783AC)					;C - - - - - 0x00E3AA 03:839A: A9 AC
	STA ram_005B				;C - - - - - 0x00E3AC 03:839C: 85 5B
	LDA #.HIBYTE(CODE_0783AC)					;C - - - - - 0x00E3AE 03:839E: A9 83
	STA ram_005C				;C - - - - - 0x00E3B0 03:83A0: 85 5C
CODE_0783A2:
	RTS							;C - - - - - 0x00E3B2 03:83A2: 60

DATA_0783A3:
	.byte mapShoeR_ID					;- D 0 - - - 0x00E3B3 03:83A3: 57
	.byte mapShoeR_ID					;- D 0 - - - 0x00E3B4 03:83A4: 57
	.byte mapShoeL_ID					;- D 0 - - - 0x00E3B5 03:83A5: 58
DATA_0783A6:
	;- D 0 - - - 0x00E3B6 03:83A6: C0
	.word $22C0
	.word $20C0
	.word $21DA

CODE_0783AC:
	LDA objX				;C - - - - - 0x00E3BC 03:83AC: AD B3 05
	STA scratch1				;C - - - - - 0x00E3BF 03:83AF: 85 01
	LDX #$01					;C - - - - - 0x00E3C1 03:83B1: A2 01
	LDY #$00					;C - - - - - 0x00E3C3 03:83B3: A0 00
	LDA objY				;C - - - - - 0x00E3C5 03:83B5: AD 8B 05
	AND #$F8					;C - - - - - 0x00E3C8 03:83B8: 29 F8
	CMP #$38					;C - - - - - 0x00E3CA 03:83BA: C9 38
	BEQ CODE_0783CC				;C - - - - - 0x00E3CC 03:83BC: F0 0E
		INY							;C - - - - - 0x00E3CE 03:83BE: C8
		LDX #$03					;C - - - - - 0x00E3CF 03:83BF: A2 03
		CMP #$78					;C - - - - - 0x00E3D1 03:83C1: C9 78
		BEQ CODE_0783CC				;C - - - - - 0x00E3D3 03:83C3: F0 07
			INY							;C - - - - - 0x00E3D5 03:83C5: C8
			LDX #$05					;C - - - - - 0x00E3D6 03:83C6: A2 05
			CMP #$B8					;C - - - - - 0x00E3D8 03:83C8: C9 B8
			BNE CODE_0783FA				;C - - - - - 0x00E3DA 03:83CA: D0 2E
CODE_0783CC:
	LDA ram_0760,X				;C - - - - - 0x00E3DC 03:83CC: BD 60 07
	CLC							;C - - - - - 0x00E3DF 03:83CF: 18
	ADC DATA_0783FE,X			;C - - - - - 0x00E3E0 03:83D0: 7D FE 83
	STA scratch3				;C - - - - - 0x00E3E3 03:83D3: 85 03

.ifndef REGION_JP
	LDA ram_04CA				;C - - - - - 0x00E3E5 03:83D5: AD CA 04
	BEQ CODE_0783E0				;C - - - - - 0x00E3E8 03:83D8: F0 06
		DEC ram_04CA				;C - - - - - 0x00E3EA 03:83DA: CE CA 04
		JMP CODE_0783FA				;C - - - - - 0x00E3ED 03:83DD: 4C FA 83
.endif
CODE_0783E0:
	LDA scratch3				;C - - - - - 0x00E3F0 03:83E0: A5 03
	CMP scratch1				;C - - - - - 0x00E3F2 03:83E2: C5 01
	BCC CODE_0783EC				;C - - - - - 0x00E3F4 03:83E4: 90 06
		CPY #$01					;C - - - - - 0x00E3F6 03:83E6: C0 01
		BNE CODE_0783FA				;C - - - - - 0x00E3F8 03:83E8: D0 10

.ifdef REGION_JP
		LDA #snShoeCar_ID					;- - - - - - 0x00E408 03:83F8: A9
		STA a:soundTrigger 					;- - - - - - 0x00E40A 03:83FA: 8D
		JMP CODE_0783FA						;- - - - - - 0x00E40D 03:83FD: 4C
.else
		BEQ CODE_0783F0				;C - - - - - 0x00E3FA 03:83EA: F0 04
.endif
CODE_0783EC:
	CPY #$01					;C - - - - - 0x00E3FC 03:83EC: C0 01
	BEQ CODE_0783FA				;C - - - - - 0x00E3FE 03:83EE: F0 0A
CODE_0783F0:
	LDA #snShoeCar_ID					;C - - - - - 0x00E400 03:83F0: A9 23
	STA a:soundTrigger				;C - - - - - 0x00E402 03:83F2: 8D E1 00

.ifndef REGION_JP
	LDA #$1E					;C - - - - - 0x00E405 03:83F5: A9 1E
	STA ram_04CA				;C - - - - - 0x00E407 03:83F7: 8D CA 04
.endif
CODE_0783FA:
	JSR CODE_07860F				;C - - - - - 0x00E40A 03:83FA: 20 0F 86
	RTS							;C - - - - - 0x00E40D 03:83FD: 60

DATA_0783FE:
	.byte $00					;- - - - - - 0x00E40E 03:83FE: 00
	.byte $18					;- D 0 - - - 0x00E40F 03:83FF: 18
	.byte $00					;- - - - - - 0x00E410 03:8400: 00
	.byte $E8					;- D 0 - - - 0x00E411 03:8401: E8
	.byte $00					;- - - - - - 0x00E412 03:8402: 00
	.byte $18					;- D 0 - - - 0x00E413 03:8403: 18

CODE_078404:
	LDA #$05					;C - - - - - 0x00E414 03:8404: A9 05
	STA openingCounter				;C - - - - - 0x00E416 03:8406: 8D CC 04
	LDA #mapTractor_ID					;C - - - - - 0x00E419 03:8409: A9 56
	STA mapID				;C - - - - - 0x00E41B 03:840B: 8D 60 03

	LDY vNametable				;C - - - - - 0x00E41E 03:840E: A4 2D
	LDA DATA_07845C,Y			;C - - - - - 0x00E420 03:8410: B9 5C 84
	STA mapBaseTile				;C - - - - - 0x00E423 03:8413: 8D 63 03
	LDA #chrMissileTractor_AA_ID					;C - - - - - 0x00E426 03:8416: A9 2E
	STA bgAnimValue				;C - - - - - 0x00E428 03:8418: 8D CE 04
	LDX DATA_07845F,Y			;C - - - - - 0x00E42B 03:841B: BE 5F 84
	STA chrBankA,X				;C - - - - - 0x00E42E 03:841E: 95 4B
	LDA #$4C					;C - - - - - 0x00E430 03:8420: A9 4C
	STA mapTargetAdr				;C - - - - - 0x00E432 03:8422: 85 49
	LDA #$22					;C - - - - - 0x00E434 03:8424: A9 22
	CLC							;C - - - - - 0x00E436 03:8426: 18
	ADC DATA_078459,Y			;C - - - - - 0x00E437 03:8427: 79 59 84
	STA mapTargetAdr+1				;C - - - - - 0x00E43A 03:842A: 85 4A
	JSR LoadMap				;C - - - - - 0x00E43C 03:842C: 20 23 E5

	JSR CODE_0781B0				;C - - - - - 0x00E43F 03:842F: 20 B0 81

	LDA #.LOBYTE(CODE_078462)					;C - - - - - 0x00E442 03:8432: A9 62
	STA ram_005B				;C - - - - - 0x00E444 03:8434: 85 5B
	LDA #.HIBYTE(CODE_078462)					;C - - - - - 0x00E446 03:8436: A9 84
	STA ram_005C				;C - - - - - 0x00E448 03:8438: 85 5C

	LDA #$11					;C - - - - - 0x00E44A 03:843A: A9 11
	STA colorBuffer+9				;C - - - - - 0x00E44C 03:843C: 8D 09 03
	LDA #$0C					;C - - - - - 0x00E44F 03:843F: A9 0C
	STA colorBuffer+10				;C - - - - - 0x00E451 03:8441: 8D 0A 03
	LDA #$22					;C - - - - - 0x00E454 03:8444: A9 22
	STA colorBuffer+11				;C - - - - - 0x00E456 03:8446: 8D 0B 03
	LDA #$38					;C - - - - - 0x00E459 03:8449: A9 38
	STA colorBuffer+13				;C - - - - - 0x00E45B 03:844B: 8D 0D 03
	LDA #$25					;C - - - - - 0x00E45E 03:844E: A9 25
	STA colorBuffer+14				;C - - - - - 0x00E460 03:8450: 8D 0E 03
	LDA #$22					;C - - - - - 0x00E463 03:8453: A9 22
	STA colorBuffer+15				;C - - - - - 0x00E465 03:8455: 8D 0F 03
	RTS							;C - - - - - 0x00E468 03:8458: 60

DATA_078459:
	.byte $00					;- D 0 - - - 0x00E469 03:8459: 00
DATA_07845A:
	.byte $08					;- D 0 - - - 0x00E46A 03:845A: 08
	.byte $00					;- - - - - - 0x00E46B 03:845B: 00
DATA_07845C:
	.byte $00					;- D 0 - - - 0x00E46C 03:845C: 00
	.byte $80					;- D 0 - - - 0x00E46D 03:845D: 80
	.byte $00					;- - - - - - 0x00E46E 03:845E: 00
DATA_07845F:
	.byte chrOldTitle_A_ID					;- D 0 - - - 0x00E46F 03:845F: 00
	.byte chrOldTitle_B_ID					;- D 0 - - - 0x00E470 03:8460: 01
	.byte chrOldTitle_A_ID					;- - - - - - 0x00E471 03:8461: 00

CODE_078462:
	LDX openingCounter				;C - - - - - 0x00E472 03:8462: AE CC 04
	JSR CODE_0784EA				;C - - - - - 0x00E475 03:8465: 20 EA 84
	LDA DATA_0784CE,X			;C - - - - - 0x00E478 03:8468: BD CE 84
	STA openingStage				;C - - - - - 0x00E47B 03:846B: 8D CF 04

	LDA openingCycle				;C - - - - - 0x00E47E 03:846E: AD CD 04
	BNE CODE_07847C				;C - - - - - 0x00E481 03:8471: D0 09
		LDA DATA_0784D5,X			;C - - - - - 0x00E483 03:8473: BD D5 84
		STA openingCounter				;C - - - - - 0x00E486 03:8476: 8D CC 04
		LDA DATA_0784DC,X			;C - - - - - 0x00E489 03:8479: BD DC 84
CODE_07847C:
	SEC							;C - - - - - 0x00E48C 03:847C: 38
	SBC #$01					;C - - - - - 0x00E48D 03:847D: E9 01
	STA openingCycle				;C - - - - - 0x00E48F 03:847F: 8D CD 04
	JSR AnimateMissileTractor				;C - - - - - 0x00E492 03:8482: 20 14 85
	LDX openingCounter				;C - - - - - 0x00E495 03:8485: AE CC 04
	LDA DATA_0784E3,X			;C - - - - - 0x00E498 03:8488: BD E3 84
	CLC							;C - - - - - 0x00E49B 03:848B: 18
	ADC wideHScroll				;C - - - - - 0x00E49C 03:848C: 6D 61 07
	STA scratch1				;C - - - - - 0x00E49F 03:848F: 85 01
	CLC							;C - - - - - 0x00E4A1 03:8491: 18
	ADC #$80					;C - - - - - 0x00E4A2 03:8492: 69 80
	STA scratch0				;C - - - - - 0x00E4A4 03:8494: 85 00
	TXA							;C - - - - - 0x00E4A6 03:8496: 8A
	AND #$01					;C - - - - - 0x00E4A7 03:8497: 29 01
	BEQ CODE_0784A4				;C - - - - - 0x00E4A9 03:8499: F0 09
		LDA scratch0				;C - - - - - 0x00E4AB 03:849B: A5 00
		CMP #$F0					;C - - - - - 0x00E4AD 03:849D: C9 F0
		BCC CODE_0784C5				;C - - - - - 0x00E4AF 03:849F: 90 24
		JMP CODE_0784AA				;C - - - - - 0x00E4B1 03:84A1: 4C AA 84
CODE_0784A4:
	LDA scratch0				;C - - - - - 0x00E4B4 03:84A4: A5 00
	CMP #$20					;C - - - - - 0x00E4B6 03:84A6: C9 20
	BCS CODE_0784C5				;C - - - - - 0x00E4B8 03:84A8: B0 1B
CODE_0784AA:
		LDA scratch1				;C - - - - - 0x00E4BA 03:84AA: A5 01
		STA wideHScroll				;C - - - - - 0x00E4BC 03:84AC: 8D 61 07
		LDA openingCounter				;C - - - - - 0x00E4BF 03:84AF: AD CC 04
		SEC							;C - - - - - 0x00E4C2 03:84B2: 38
		SBC #$01					;C - - - - - 0x00E4C3 03:84B3: E9 01
		EOR #$01					;C - - - - - 0x00E4C5 03:84B5: 49 01
		CLC							;C - - - - - 0x00E4C7 03:84B7: 18
		ADC #$01					;C - - - - - 0x00E4C8 03:84B8: 69 01
		STA openingCounter				;C - - - - - 0x00E4CA 03:84BA: 8D CC 04
		LDA #$20					;C - - - - - 0x00E4CD 03:84BD: A9 20
		STA openingCycle				;C - - - - - 0x00E4CF 03:84BF: 8D CD 04
		JMP CODE_0784CA				;C - - - - - 0x00E4D2 03:84C2: 4C CA 84
CODE_0784C5:
	LDA scratch1				;C - - - - - 0x00E4D5 03:84C5: A5 01
	STA wideHScroll				;C - - - - - 0x00E4D7 03:84C7: 8D 61 07
CODE_0784CA:
	JSR CODE_078549				;C - - - - - 0x00E4DA 03:84CA: 20 49 85
	RTS							;C - - - - - 0x00E4DD 03:84CD: 60

DATA_0784CE:
	.byte OPENING_START			;- - - - - - 0x00E4DE 03:84CE: 00
	.byte OPENING_TREE			;- D 0 - - - 0x00E4DF 03:84CF: 03
	.byte OPENING_TREE			;- D 0 - - - 0x00E4E0 03:84D0: 03
	.byte OPENING_SKULLS		;- D 0 - - - 0x00E4E1 03:84D1: 01
	.byte OPENING_SKULLS		;- D 0 - - - 0x00E4E2 03:84D2: 01
	.byte $FF					;- D 0 - - - 0x00E4E3 03:84D3: FF
	.byte $FF					;- D 0 - - - 0x00E4E4 03:84D4: FF
DATA_0784D5:
	.byte $00					;- - - - - - 0x00E4E5 03:84D5: 00
	.byte $02					;- D 0 - - - 0x00E4E6 03:84D6: 02
	.byte $05					;- D 0 - - - 0x00E4E7 03:84D7: 05
	.byte $05					;- D 0 - - - 0x00E4E8 03:84D8: 05
	.byte $05					;- D 0 - - - 0x00E4E9 03:84D9: 05
	.byte $01					;- D 0 - - - 0x00E4EA 03:84DA: 01
	.byte $05					;- D 0 - - - 0x00E4EB 03:84DB: 05
DATA_0784DC:
	.byte $00					;- - - - - - 0x00E4EC 03:84DC: 00
	.byte $28					;- D 0 - - - 0x00E4ED 03:84DD: 28
	.byte $0F					;- D 0 - - - 0x00E4EE 03:84DE: 0F
	.byte $05					;- D 0 - - - 0x00E4EF 03:84DF: 05
	.byte $05					;- D 0 - - - 0x00E4F0 03:84E0: 05
	.byte $28					;- D 0 - - - 0x00E4F1 03:84E1: 28
	.byte $14					;- D 0 - - - 0x00E4F2 03:84E2: 14
DATA_0784E3:
	.byte $00					;- - - - - - 0x00E4F3 03:84E3: 00
	.byte $01					;- D 0 - - - 0x00E4F4 03:84E4: 01
	.byte $FF					;- D 0 - - - 0x00E4F5 03:84E5: FF
	.byte $02					;- D 0 - - - 0x00E4F6 03:84E6: 02
	.byte $FE					;- D 0 - - - 0x00E4F7 03:84E7: FE
	.byte $00					;- D 0 - - - 0x00E4F8 03:84E8: 00
	.byte $00					;- D 0 - - - 0x00E4F9 03:84E9: 00

CODE_0784EA:
	CPX #$06					;C - - - - - 0x00E4FA 03:84EA: E0 06
	BNE CODE_078513				;C - - - - - 0x00E4FC 03:84EC: D0 25
		LDA openingCycle				;C - - - - - 0x00E4FE 03:84EE: AD CD 04
		BNE CODE_078513				;C - - - - - 0x00E501 03:84F1: D0 20
			LDA #psMissileTractor_ID					;C - - - - - 0x00E503 03:84F3: A9 10
			STA scratch5				;C - - - - - 0x00E505 03:84F5: 85 05
			LDA #$00					;C - - - - - 0x00E507 03:84F7: A9 00
			STA scratch6				;C - - - - - 0x00E509 03:84F9: 85 06
			STA scratch7				;C - - - - - 0x00E50B 03:84FB: 85 07
			LDA #$02					;C - - - - - 0x00E50D 03:84FD: A9 02
			STA scratch2				;C - - - - - 0x00E50F 03:84FF: 85 02
			LDA #$00					;C - - - - - 0x00E511 03:8501: A9 00
			SEC							;C - - - - - 0x00E513 03:8503: 38
			SBC wideHScroll				;C - - - - - 0x00E514 03:8504: ED 61 07
			CLC							;C - - - - - 0x00E517 03:8507: 18
			ADC #$80					;C - - - - - 0x00E518 03:8508: 69 80
			STA scratch0				;C - - - - - 0x00E51A 03:850A: 85 00
			LDA #$F0					;C - - - - - 0x00E51C 03:850C: A9 F0
			STA scratch1				;C - - - - - 0x00E51E 03:850E: 85 01
			JSR SpawnProj				;C - - - - - 0x00E520 03:8510: 20 82 FE
CODE_078513:
	RTS							;C - - - - - 0x00E523 03:8513: 60

AnimateMissileTractor:
	LDA globalTimer				;C - - - - - 0x00E524 03:8514: A5 14
	AND openingStage				;C - - - - - 0x00E526 03:8516: 2D CF 04
	BNE CODE_078548				;C - - - - - 0x00E529 03:8519: D0 2D
		CMP #$FF					;C - - - - - 0x00E52B 03:851B: C9 FF
		BEQ CODE_078548				;C - - - - - 0x00E52D 03:851D: F0 29
			LDA openingCounter				;C - - - - - 0x00E52F 03:851F: AD CC 04
			AND #$01					;C - - - - - 0x00E532 03:8522: 29 01
			BNE CODE_078535				;C - - - - - 0x00E534 03:8524: D0 0F

			LDA bgAnimValue				;C - - - - - 0x00E536 03:8526: AD CE 04
			SEC							;C - - - - - 0x00E539 03:8529: 38
			SBC #2					;C - - - - - 0x00E53A 03:852A: E9 02
			CMP #chrMissileTractor_AA_ID-2					;C - - - - - 0x00E53C 03:852C: C9 2C
			BNE CODE_078541				;C - - - - - 0x00E53E 03:852E: D0 11
				LDA #chrMissileTractor_CA_ID					;C - - - - - 0x00E540 03:8530: A9 32
				JMP CODE_078541				;C - - - - - 0x00E542 03:8532: 4C 41 85
			CODE_078535:
				LDA bgAnimValue				;C - - - - - 0x00E545 03:8535: AD CE 04
				CLC							;C - - - - - 0x00E548 03:8538: 18
				ADC #2					;C - - - - - 0x00E549 03:8539: 69 02
				CMP #chrMissileTractor_CA_ID+2					;C - - - - - 0x00E54B 03:853B: C9 34
				BNE CODE_078541				;C - - - - - 0x00E54D 03:853D: D0 02
					LDA #chrMissileTractor_AA_ID					;C - - - - - 0x00E54F 03:853F: A9 2E
		CODE_078541:
			STA bgAnimValue				;C - - - - - 0x00E551 03:8541: 8D CE 04
			LDX vNametable				;C - - - - - 0x00E554 03:8544: A6 2D
			STA chrBankA,X				;C - - - - - 0x00E556 03:8546: 95 4B
CODE_078548:
	RTS							;C - - - - - 0x00E558 03:8548: 60

CODE_078549:
	LDA #$00					;C - - - - - 0x00E559 03:8549: A9 00
	SEC							;C - - - - - 0x00E55B 03:854B: 38
	SBC wideHScroll				;C - - - - - 0x00E55C 03:854C: ED 61 07
	CLC							;C - - - - - 0x00E55F 03:854F: 18
	ADC #$80					;C - - - - - 0x00E560 03:8550: 69 80
	STA scratch3				;C - - - - - 0x00E562 03:8552: 85 03
	LDA openingCounter				;C - - - - - 0x00E564 03:8554: AD CC 04
	CMP #$03					;C - - - - - 0x00E567 03:8557: C9 03
	BEQ CODE_07859A				;C - - - - - 0x00E569 03:8559: F0 3F
		CMP #$04					;C - - - - - 0x00E56B 03:855B: C9 04
		BEQ CODE_07859A				;C - - - - - 0x00E56D 03:855D: F0 3B
			LDA objX				;C - - - - - 0x00E56F 03:855F: AD B3 05
			STA scratch1				;C - - - - - 0x00E572 03:8562: 85 01
			LDA objY				;C - - - - - 0x00E574 03:8564: AD 8B 05
			STA scratch0				;C - - - - - 0x00E577 03:8567: 85 00
			CMP #$C4					;C - - - - - 0x00E579 03:8569: C9 C4
			BNE CODE_07859A				;C - - - - - 0x00E57B 03:856B: D0 2D
				LDA scratch3				;C - - - - - 0x00E57D 03:856D: A5 03
				CMP scratch1				;C - - - - - 0x00E57F 03:856F: C5 01
				BCC CODE_07857D				;C - - - - - 0x00E581 03:8571: 90 0A
				LDA openingCounter				;C - - - - - 0x00E583 03:8573: AD CC 04
				CMP #$01					;C - - - - - 0x00E586 03:8576: C9 01
				BNE CODE_0785BA				;C - - - - - 0x00E588 03:8578: D0 40
				JMP CODE_078584				;C - - - - - 0x00E58A 03:857A: 4C 84 85
			CODE_07857D:
				LDA openingCounter				;C - - - - - 0x00E58D 03:857D: AD CC 04
				CMP #$02					;C - - - - - 0x00E590 03:8580: C9 02
				BNE CODE_0785BA				;C - - - - - 0x00E592 03:8582: D0 36
			CODE_078584:
				LDA openingCounter				;C - - - - - 0x00E594 03:8584: AD CC 04
				CLC							;C - - - - - 0x00E597 03:8587: 18
				ADC #$02					;C - - - - - 0x00E598 03:8588: 69 02
				STA openingCounter				;C - - - - - 0x00E59A 03:858A: 8D CC 04
				LDA #snMissileTractor_ID					;C - - - - - 0x00E59D 03:858D: A9 2E
				STA a:soundTrigger				;C - - - - - 0x00E59F 03:858F: 8D E1 00
				LDA #$20					;C - - - - - 0x00E5A2 03:8592: A9 20
				STA openingCycle				;C - - - - - 0x00E5A4 03:8594: 8D CD 04
				JMP CODE_0785BA				;C - - - - - 0x00E5A7 03:8597: 4C BA 85
CODE_07859A:
	LDA scratch0				;C - - - - - 0x00E5AA 03:859A: A5 00
	CMP #$60					;C - - - - - 0x00E5AC 03:859C: C9 60
	BCS CODE_0785BA				;C - - - - - 0x00E5AE 03:859E: B0 1A
		LDA scratch3				;C - - - - - 0x00E5B0 03:85A0: A5 03
		SEC							;C - - - - - 0x00E5B2 03:85A2: 38
		SBC scratch1				;C - - - - - 0x00E5B3 03:85A3: E5 01
		BCS CODE_0785AC				;C - - - - - 0x00E5B5 03:85A5: B0 05
			EOR #$FF					;C - - - - - 0x00E5B7 03:85A7: 49 FF
			CLC							;C - - - - - 0x00E5B9 03:85A9: 18
			ADC #$01					;C - - - - - 0x00E5BA 03:85AA: 69 01
	CODE_0785AC:
		CMP #$30					;C - - - - - 0x00E5BC 03:85AC: C9 30
		BCS CODE_0785BA				;C - - - - - 0x00E5BE 03:85AE: B0 0A
			LDA #$06					;C - - - - - 0x00E5C0 03:85B0: A9 06
			STA openingCounter				;C - - - - - 0x00E5C2 03:85B2: 8D CC 04
			LDA #$01					;C - - - - - 0x00E5C5 03:85B5: A9 01
			STA openingCycle				;C - - - - - 0x00E5C7 03:85B7: 8D CD 04
CODE_0785BA:
	RTS							;C - - - - - 0x00E5CA 03:85BA: 60

CODE_0785BB:
	LDA ram_04D1				;C - - - - - 0x00E5CB 03:85BB: AD D1 04
	SEC							;C - - - - - 0x00E5CE 03:85BE: 38
	SBC #$0E					;C - - - - - 0x00E5CF 03:85BF: E9 0E
	TAX							;C - - - - - 0x00E5D1 03:85C1: AA
	ASL							;C - - - - - 0x00E5D2 03:85C2: 0A
	TAY							;C - - - - - 0x00E5D3 03:85C3: A8
	LDA DATA_0785E4,X			;C - - - - - 0x00E5D4 03:85C4: BD E4 85
	STA ram_04D2				;C - - - - - 0x00E5D7 03:85C7: 8D D2 04
	LDA DATA_0785E7,X			;C - - - - - 0x00E5DA 03:85CA: BD E7 85
	STA ram_04D3				;C - - - - - 0x00E5DD 03:85CD: 8D D3 04
	LDA DATA_0785EA,X			;C - - - - - 0x00E5E0 03:85D0: BD EA 85
	STA ram_0779				;C - - - - - 0x00E5E3 03:85D3: 8D 79 07
	LDA DATA_0785ED,Y			;C - - - - - 0x00E5E6 03:85D6: B9 ED 85
	STA ram_005B				;C - - - - - 0x00E5E9 03:85D9: 85 5B
	LDA DATA_0785ED+1,Y			;C - - - - - 0x00E5EB 03:85DB: B9 EE 85
	STA ram_005C				;C - - - - - 0x00E5EE 03:85DE: 85 5C
	JSR CODE_07819B				;C - - - - - 0x00E5F0 03:85E0: 20 9B 81
	RTS							;C - - - - - 0x00E5F3 03:85E3: 60

DATA_0785E4:
	.byte $1F					;- D 0 - - - 0x00E5F4 03:85E4: 1F
	.byte $1F					;- D 0 - - - 0x00E5F5 03:85E5: 1F
	.byte $1F					;- - - - - - 0x00E5F6 03:85E6: 1F
DATA_0785E7:
	.byte $00					;- D 0 - - - 0x00E5F7 03:85E7: 00
	.byte $04					;- D 0 - - - 0x00E5F8 03:85E8: 04
	.byte $04					;- - - - - - 0x00E5F9 03:85E9: 04
DATA_0785EA:
	.byte $02					;- D 0 - - - 0x00E5FA 03:85EA: 02
	.byte $04					;- D 0 - - - 0x00E5FB 03:85EB: 04
	.byte $02					;- - - - - - 0x00E5FC 03:85EC: 02
DATA_0785ED:
	;- D 0 - - - 0x00E5FD 03:85ED: 0F
	.word CODE_07860F
	.word CODE_078628
	.word CODE_078628

CODE_0785F3:
	;Unreached
	RTS							;- - - - - - 0x00E603 03:85F3: 60

CODE_0785F4:
	LDA #$3F					;C - - - - - 0x00E604 03:85F4: A9 3F
	STA ram_04D2				;C - - - - - 0x00E606 03:85F6: 8D D2 04
	LDA #$02					;C - - - - - 0x00E609 03:85F9: A9 02
	STA ram_04D3				;C - - - - - 0x00E60B 03:85FB: 8D D3 04

	LDA #.LOBYTE(CODE_078682)					;C - - - - - 0x00E60E 03:85FE: A9 82
	STA ram_005B				;C - - - - - 0x00E610 03:8600: 85 5B
	LDA #.HIBYTE(CODE_078682)					;C - - - - - 0x00E612 03:8602: A9 86
	STA ram_005C				;C - - - - - 0x00E614 03:8604: 85 5C
	LDA #$00					;C - - - - - 0x00E616 03:8606: A9 00
	STA ram_04D0				;C - - - - - 0x00E618 03:8608: 8D D0 04
	JSR CODE_0782CF				;C - - - - - 0x00E61B 03:860B: 20 CF 82
	RTS							;C - - - - - 0x00E61E 03:860E: 60

CODE_07860F:
	LDX #$00					;C - - - - - 0x00E61F 03:860F: A2 00
	LDY #$00					;C - - - - - 0x00E621 03:8611: A0 00
CODE_078613:
	LDA wideHScroll,X				;C - - - - - 0x00E623 03:8613: BD 61 07
	CLC							;C - - - - - 0x00E626 03:8616: 18
	ADC ram_076A,Y				;C - - - - - 0x00E627 03:8617: 79 6A 07
	STA wideHScroll,X				;C - - - - - 0x00E62A 03:861A: 9D 61 07
	INY							;C - - - - - 0x00E62D 03:861D: C8
	INY							;C - - - - - 0x00E62E 03:861E: C8
	INX							;C - - - - - 0x00E62F 03:861F: E8
	CPX ram_0021				;C - - - - - 0x00E630 03:8620: E4 21
	BCC CODE_078613				;C - - - - - 0x00E632 03:8622: 90 EF

	RTS							;C - - - - - 0x00E634 03:8624: 60

DATA_078625:
.ifdef REGION_JP
	.byte $00					;- - - - - - 0x00E644 03:8634: 00
	.byte $01					;- - - - - - 0x00E645 03:8635: 01
	.byte $FF					;- - - - - - 0x00E646 03:8636: FF
.else
	.byte $00					;- D 0 - - - 0x00E635 03:8625: 00
	.byte $FF					;- D 0 - - - 0x00E636 03:8626: FF
	.byte $01					;- D 0 - - - 0x00E637 03:8627: 01
.endif

CODE_078628:
	DEC ram_04D2				;C - - - - - 0x00E638 03:8628: CE D2 04
	BNE CODE_078653				;C - - - - - 0x00E63B 03:862B: D0 26
		LDA ram_04D3				;C - - - - - 0x00E63D 03:862D: AD D3 04
		CMP #$04					;C - - - - - 0x00E640 03:8630: C9 04
		BNE CODE_078641				;C - - - - - 0x00E642 03:8632: D0 0D
			LDA #$01					;C - - - - - 0x00E644 03:8634: A9 01
			STA ram_04D3				;C - - - - - 0x00E646 03:8636: 8D D3 04
			LDA #$1F					;C - - - - - 0x00E649 03:8639: A9 1F
			STA ram_04D2				;C - - - - - 0x00E64B 03:863B: 8D D2 04
			JMP CODE_078653				;C - - - - - 0x00E64E 03:863E: 4C 53 86
	CODE_078641:
		INC ram_04D3				;C - - - - - 0x00E651 03:8641: EE D3 04
		LDA ram_04D3				;C - - - - - 0x00E654 03:8644: AD D3 04
		AND #$03					;C - - - - - 0x00E657 03:8647: 29 03
		STA ram_04D3				;C - - - - - 0x00E659 03:8649: 8D D3 04
		TAX							;C - - - - - 0x00E65C 03:864C: AA
		LDA DATA_078679,X			;C - - - - - 0x00E65D 03:864D: BD 79 86
		STA ram_04D2				;C - - - - - 0x00E660 03:8650: 8D D2 04
CODE_078653:
	JSR CODE_07860F				;C - - - - - 0x00E663 03:8653: 20 0F 86
	LDX ram_04D3				;C - - - - - 0x00E666 03:8656: AE D3 04
	LDA DATA_07867D,X			;C - - - - - 0x00E669 03:8659: BD 7D 86
	STA scratch2				;C - - - - - 0x00E66C 03:865C: 85 02
	LDY #$00					;C - - - - - 0x00E66E 03:865E: A0 00
	LDX #$01					;C - - - - - 0x00E670 03:8660: A2 01
CODE_078662:
	LDA scratch2				;C - - - - - 0x00E672 03:8662: A5 02
	STA ram_076A,Y				;C - - - - - 0x00E674 03:8664: 99 6A 07
	EOR #$FF					;C - - - - - 0x00E677 03:8667: 49 FF
	STA scratch2				;C - - - - - 0x00E679 03:8669: 85 02
	INC scratch2				;C - - - - - 0x00E67B 03:866B: E6 02
	TYA							;C - - - - - 0x00E67D 03:866D: 98
	CLC							;C - - - - - 0x00E67E 03:866E: 18
	ADC ram_0779				;C - - - - - 0x00E67F 03:866F: 6D 79 07
	TAY							;C - - - - - 0x00E682 03:8672: A8
	INX							;C - - - - - 0x00E683 03:8673: E8
	CPX ram_0021				;C - - - - - 0x00E684 03:8674: E4 21
	BCC CODE_078662				;C - - - - - 0x00E686 03:8676: 90 EA

	RTS							;C - - - - - 0x00E688 03:8678: 60

DATA_078679:
	.byte $02					;- D 0 - - - 0x00E689 03:8679: 02
	.byte $3F					;- D 0 - - - 0x00E68A 03:867A: 3F
	.byte $02					;- D 0 - - - 0x00E68B 03:867B: 02
	.byte $3F					;- D 0 - - - 0x00E68C 03:867C: 3F
DATA_07867D:
	.byte $00					;- D 0 - - - 0x00E68D 03:867D: 00
	.byte $01					;- D 0 - - - 0x00E68E 03:867E: 01
	.byte $00					;- D 0 - - - 0x00E68F 03:867F: 00
	.byte $FF					;- D 0 - - - 0x00E690 03:8680: FF
	.byte $00					;- D 0 - - - 0x00E691 03:8681: 00

CODE_078682:
	DEC ram_04D2				;C - - - - - 0x00E692 03:8682: CE D2 04
	BNE CODE_0786A5				;C - - - - - 0x00E695 03:8685: D0 1E
		INC ram_04D3				;C - - - - - 0x00E697 03:8687: EE D3 04
		LDA ram_04D3				;C - - - - - 0x00E69A 03:868A: AD D3 04
		CMP #$03					;C - - - - - 0x00E69D 03:868D: C9 03
		BCC CODE_078696				;C - - - - - 0x00E69F 03:868F: 90 05
			LDA #$00					;C - - - - - 0x00E6A1 03:8691: A9 00
			STA ram_04D3				;C - - - - - 0x00E6A3 03:8693: 8D D3 04
	CODE_078696:
		LDX ram_04D3				;C - - - - - 0x00E6A6 03:8696: AE D3 04
		LDA DATA_0786C7,X			;C - - - - - 0x00E6A9 03:8699: BD C7 86
		STA ram_04D2				;C - - - - - 0x00E6AC 03:869C: 8D D2 04
		LDA DATA_078625,X			;C - - - - - 0x00E6AF 03:869F: BD 25 86
		STA ram_076A				;C - - - - - 0x00E6B2 03:86A2: 8D 6A 07
CODE_0786A5:
	LDX ram_04D3				;C - - - - - 0x00E6B5 03:86A5: AE D3 04
	LDA ram_04D2				;C - - - - - 0x00E6B8 03:86A8: AD D2 04
	AND DATA_0786CA,X			;C - - - - - 0x00E6BB 03:86AB: 3D CA 86
	BNE CODE_0786B8				;C - - - - - 0x00E6BE 03:86AE: D0 08
		LDA irqLatch				;C - - - - - 0x00E6C0 03:86B0: A5 1E
		CLC							;C - - - - - 0x00E6C2 03:86B2: 18
		ADC ram_076A				;C - - - - - 0x00E6C3 03:86B3: 6D 6A 07
		STA irqLatch				;C - - - - - 0x00E6C6 03:86B6: 85 1E
CODE_0786B8:
	LDA irqLatch				;C - - - - - 0x00E6C8 03:86B8: A5 1E
	SEC							;C - - - - - 0x00E6CA 03:86BA: 38
.ifdef REGION_JP
	SBC #28					;- - - - - - 0x00E6DA 03:86CA: E9
	STA scratch0					;- - - - - - 0x00E6DC 03:86CC: 85
	LDA #216					;- - - - - - 0x00E6DE 03:86CE: A9
	SEC					;- - - - - - 0x00E6E0 03:86D0: 38
	SBC scratch0					;- - - - - - 0x00E6E1 03:86D1: E5
.else
	SBC #12					;C - - - - - 0x00E6CB 03:86BB: E9 0C
.endif
	CMP objY				;C - - - - - 0x00E6CD 03:86BD: CD 8B 05
	BCS CODE_0786C6				;C - - - - - 0x00E6D0 03:86C0: B0 04
		LDA #$F8					;C - - - - - 0x00E6D2 03:86C2: A9 F8
		STA playerHazardTrigger				;C - - - - - 0x00E6D4 03:86C4: 85 7E
CODE_0786C6:
	RTS							;C - - - - - 0x00E6D6 03:86C6: 60

DATA_0786C7:
	.byte $3F					;- D 0 - - - 0x00E6D7 03:86C7: 3F
	.byte $7F					;- D 0 - - - 0x00E6D8 03:86C8: 7F
	.byte $3F					;- D 0 - - - 0x00E6D9 03:86C9: 3F
DATA_0786CA:
	.byte $03					;- D 0 - - - 0x00E6DA 03:86CA: 03
	.byte $07					;- D 0 - - - 0x00E6DB 03:86CB: 07
	.byte $03					;- D 0 - - - 0x00E6DC 03:86CC: 03

CODE_0786CD:
	LDA currentRound				;C - - - - - 0x00E6DD 03:86CD: A5 D8
	CMP #$45					;C - - - - - 0x00E6DF 03:86CF: C9 45
	BNE CODE_0786E4				;C - - - - - 0x00E6E1 03:86D1: D0 11
		LDA #$00					;C - - - - - 0x00E6E3 03:86D3: A9 00
		STA ram_0776				;C - - - - - 0x00E6E5 03:86D5: 8D 76 07
		LDA #$03					;C - - - - - 0x00E6E8 03:86D8: A9 03
		STA ram_0777				;C - - - - - 0x00E6EA 03:86DA: 8D 77 07
		LDA #$00					;C - - - - - 0x00E6ED 03:86DD: A9 00
		STA scratch0				;C - - - - - 0x00E6EF 03:86DF: 85 00
		JMP CODE_07870B				;C - - - - - 0x00E6F1 03:86E1: 4C 0B 87
CODE_0786E4:
	CMP #$49					;C - - - - - 0x00E6F4 03:86E4: C9 49
	BNE CODE_0786F9				;C - - - - - 0x00E6F6 03:86E6: D0 11
		LDA #$03					;C - - - - - 0x00E6F8 03:86E8: A9 03
		STA ram_0776				;C - - - - - 0x00E6FA 03:86EA: 8D 76 07
		LDA #$04					;C - - - - - 0x00E6FD 03:86ED: A9 04
		STA ram_0777				;C - - - - - 0x00E6FF 03:86EF: 8D 77 07
		LDA #$01					;C - - - - - 0x00E702 03:86F2: A9 01
		STA scratch0				;C - - - - - 0x00E704 03:86F4: 85 00
		JMP CODE_07870B				;C - - - - - 0x00E706 03:86F6: 4C 0B 87
CODE_0786F9:
	CMP #$4E					;C - - - - - 0x00E709 03:86F9: C9 4E
	BNE CODE_078730				;C - - - - - 0x00E70B 03:86FB: D0 33
		LDA #$04					;C - - - - - 0x00E70D 03:86FD: A9 04
		STA ram_0776				;C - - - - - 0x00E70F 03:86FF: 8D 76 07
		LDA #$08					;C - - - - - 0x00E712 03:8702: A9 08
		STA ram_0777				;C - - - - - 0x00E714 03:8704: 8D 77 07
		LDA #$01					;C - - - - - 0x00E717 03:8707: A9 01
		STA scratch0				;C - - - - - 0x00E719 03:8709: 85 00
	CODE_07870B:
		LDX #$00					;C - - - - - 0x00E71B 03:870B: A2 00
	CODE_07870D:
		LDA #$00					;C - - - - - 0x00E71D 03:870D: A9 00
		STA ram_0769,X				;C - - - - - 0x00E71F 03:870F: 9D 69 07
		STA ram_0771,X				;C - - - - - 0x00E722 03:8712: 9D 71 07
		LDA scratch0				;C - - - - - 0x00E725 03:8715: A5 00
		STA ram_076D,X				;C - - - - - 0x00E727 03:8717: 9D 6D 07
		INX							;C - - - - - 0x00E72A 03:871A: E8
		CPX #$04					;C - - - - - 0x00E72B 03:871B: E0 04
		BCC CODE_07870D				;C - - - - - 0x00E72D 03:871D: 90 EE

		LDA ram_0776				;C - - - - - 0x00E72F 03:871F: AD 76 07
		STA ram_0775				;C - - - - - 0x00E732 03:8722: 8D 75 07

		LDA #.LOBYTE(CODE_078731)					;C - - - - - 0x00E735 03:8725: A9 31
		STA ram_005B				;C - - - - - 0x00E737 03:8727: 85 5B
		LDA #.HIBYTE(CODE_078731)					;C - - - - - 0x00E739 03:8729: A9 87
		STA ram_005C				;C - - - - - 0x00E73B 03:872B: 85 5C
		JSR CODE_07819B				;C - - - - - 0x00E73D 03:872D: 20 9B 81
CODE_078730:
	RTS							;C - - - - - 0x00E740 03:8730: 60

CODE_078731:
	LDA #.BANK(DATA_04BD27)					;C - - - - - 0x00E741 03:8731: A9 04
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00E743 03:8733: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00E745 03:8735: 20 56 FF
.endif

	LDA ram_0775				;C - - - - - 0x00E748 03:8738: AD 75 07
	SEC							;C - - - - - 0x00E74B 03:873B: 38
	SBC ram_0776				;C - - - - - 0x00E74C 03:873C: ED 76 07
	TAX							;C - - - - - 0x00E74F 03:873F: AA
	LDA ram_0771,X				;C - - - - - 0x00E750 03:8740: BD 71 07
	BEQ CODE_07874B				;C - - - - - 0x00E753 03:8743: F0 06
		DEC ram_0771,X				;C - - - - - 0x00E755 03:8745: DE 71 07
		JMP CODE_0787A9				;C - - - - - 0x00E758 03:8748: 4C A9 87
CODE_07874B:
	LDA livesCurrentPos				;C - - - - - 0x00E75B 03:874B: AD 98 04
	AND #$C0					;C - - - - - 0x00E75E 03:874E: 29 C0
	BNE CODE_07875C				;C - - - - - 0x00E760 03:8750: D0 0A
		LDA livesCurrentPos				;C - - - - - 0x00E762 03:8752: AD 98 04
		AND #$3F					;C - - - - - 0x00E765 03:8755: 29 3F
		BEQ CODE_07875C				;C - - - - - 0x00E767 03:8757: F0 03
			JMP CODE_0787A9				;C - - - - - 0x00E769 03:8759: 4C A9 87
CODE_07875C:
	BNE CODE_07877F				;C - - - - - 0x00E76C 03:875C: D0 21
		LDA livesCurrentPos				;C - - - - - 0x00E76E 03:875E: AD 98 04
		ORA #$80					;C - - - - - 0x00E771 03:8761: 09 80
		STA livesCurrentPos				;C - - - - - 0x00E773 03:8763: 8D 98 04
		JSR CODE_07885B				;C - - - - - 0x00E776 03:8766: 20 5B 88
		JSR CODE_078891				;C - - - - - 0x00E779 03:8769: 20 91 88
		JSR CODE_07885B				;C - - - - - 0x00E77C 03:876C: 20 5B 88
		JSR CODE_0787E3				;C - - - - - 0x00E77F 03:876F: 20 E3 87
		LDA #$00					;C - - - - - 0x00E782 03:8772: A9 00
		STA scratch5				;C - - - - - 0x00E784 03:8774: 85 05
		JSR CODE_078816				;C - - - - - 0x00E786 03:8776: 20 16 88
		JSR CODE_0787AA				;C - - - - - 0x00E789 03:8779: 20 AA 87
		JMP CODE_0787A9				;C - - - - - 0x00E78C 03:877C: 4C A9 87
CODE_07877F:
	AND #$40					;C - - - - - 0x00E78F 03:877F: 29 40
	BNE CODE_07879E				;C - - - - - 0x00E791 03:8781: D0 1B
		LDA livesCurrentPos				;C - - - - - 0x00E793 03:8783: AD 98 04
		ORA #$40					;C - - - - - 0x00E796 03:8786: 09 40
		STA livesCurrentPos				;C - - - - - 0x00E798 03:8788: 8D 98 04
		JSR CODE_078891				;C - - - - - 0x00E79B 03:878B: 20 91 88
		JSR CODE_078876				;C - - - - - 0x00E79E 03:878E: 20 76 88
		LDA #$40					;C - - - - - 0x00E7A1 03:8791: A9 40
		STA scratch5				;C - - - - - 0x00E7A3 03:8793: 85 05
		JSR CODE_078816				;C - - - - - 0x00E7A5 03:8795: 20 16 88
		JSR CODE_0787AA				;C - - - - - 0x00E7A8 03:8798: 20 AA 87
		JMP CODE_0787A9				;C - - - - - 0x00E7AB 03:879B: 4C A9 87
CODE_07879E:
	LDA livesCurrentPos				;C - - - - - 0x00E7AE 03:879E: AD 98 04
	AND #$3F					;C - - - - - 0x00E7B1 03:87A1: 29 3F
	STA livesCurrentPos				;C - - - - - 0x00E7B3 03:87A3: 8D 98 04
	JSR CODE_07883C				;C - - - - - 0x00E7B6 03:87A6: 20 3C 88
CODE_0787A9:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x00E7B9 03:87A9: 60

CODE_0787AA:
	LDX vNametable				;C - - - - - 0x00E7BA 03:87AA: A6 2D
	LDA DATA_0787E1,X			;C - - - - - 0x00E7BC 03:87AC: BD E1 87
	STA scratch0				;C - - - - - 0x00E7BF 03:87AF: 85 00
	LDY scratch3				;C - - - - - 0x00E7C1 03:87B1: A4 03
	LDX #$00					;C - - - - - 0x00E7C3 03:87B3: A2 00
CODE_0787B5:
	LDA (scratch6),Y			;C - - - - - 0x00E7C5 03:87B5: B1 06
	CLC							;C - - - - - 0x00E7C7 03:87B7: 18
	ADC scratch0				;C - - - - - 0x00E7C8 03:87B8: 65 00
	STA mapBuffer,X				;C - - - - - 0x00E7CA 03:87BA: 9D 68 03
	LDA (scratch8),Y			;C - - - - - 0x00E7CD 03:87BD: B1 08
	CLC							;C - - - - - 0x00E7CF 03:87BF: 18
	ADC scratch0				;C - - - - - 0x00E7D0 03:87C0: 65 00
	STA mapBuffer+32,X				;C - - - - - 0x00E7D2 03:87C2: 9D 88 03
	INX							;C - - - - - 0x00E7D5 03:87C5: E8
	INY							;C - - - - - 0x00E7D6 03:87C6: C8
	CPY #$0D					;C - - - - - 0x00E7D7 03:87C7: C0 0D
	BCC CODE_0787B5				;C - - - - - 0x00E7D9 03:87C9: 90 EA

	LDA #$00					;C - - - - - 0x00E7DB 03:87CB: A9 00
	STA mapBuffer,X				;C - - - - - 0x00E7DD 03:87CD: 9D 68 03
	STA mapBuffer+32,X				;C - - - - - 0x00E7E0 03:87D0: 9D 88 03
	LDA #$00					;C - - - - - 0x00E7E3 03:87D3: A9 00
	STA ram_03AE				;C - - - - - 0x00E7E5 03:87D5: 8D AE 03

	LDA #.LOBYTE(CODE_0FE93B)	;C - - - - - 0x00E7E8 03:87D8: A9 3B
	STA nmiUnbankedSub				;C - - - - - 0x00E7EA 03:87DA: 85 35
	LDA #.HIBYTE(CODE_0FE93B)	;C - - - - - 0x00E7EC 03:87DC: A9 E9
	STA nmiUnbankedSub+1				;C - - - - - 0x00E7EE 03:87DE: 85 36
	RTS							;C - - - - - 0x00E7F0 03:87E0: 60

DATA_0787E1:
	.byte $80					;- D 0 - - - 0x00E7F1 03:87E1: 80
	.byte $00					;- D 0 - - - 0x00E7F2 03:87E2: 00

CODE_0787E3:
	LDA ram_0775				;C - - - - - 0x00E7F3 03:87E3: AD 75 07
	SEC							;C - - - - - 0x00E7F6 03:87E6: 38
	SBC ram_0776				;C - - - - - 0x00E7F7 03:87E7: ED 76 07
	TAX							;C - - - - - 0x00E7FA 03:87EA: AA
	LDA ram_0769,X				;C - - - - - 0x00E7FB 03:87EB: BD 69 07
	CMP #$01					;C - - - - - 0x00E7FE 03:87EE: C9 01
	BEQ CODE_078806				;C - - - - - 0x00E800 03:87F0: F0 14
		INC ram_076D,X				;C - - - - - 0x00E802 03:87F2: FE 6D 07
		LDA ram_076D,X				;C - - - - - 0x00E805 03:87F5: BD 6D 07
		CMP scratch2				;C - - - - - 0x00E808 03:87F8: C5 02
		BCS CODE_078801				;C - - - - - 0x00E80A 03:87FA: B0 05
		ASL							;C - - - - - 0x00E80C 03:87FC: 0A
		TAY							;C - - - - - 0x00E80D 03:87FD: A8
		JMP CODE_078815				;C - - - - - 0x00E80E 03:87FE: 4C 15 88
	CODE_078801:
		LDA #$01					;C - - - - - 0x00E811 03:8801: A9 01
		STA ram_0769,X				;C - - - - - 0x00E813 03:8803: 9D 69 07
CODE_078806:
	DEC ram_076D,X				;C - - - - - 0x00E816 03:8806: DE 6D 07
	LDA ram_076D,X				;C - - - - - 0x00E819 03:8809: BD 6D 07
	CMP scratch1				;C - - - - - 0x00E81C 03:880C: C5 01
	BNE CODE_078815				;C - - - - - 0x00E81E 03:880E: D0 05
		LDA #$00					;C - - - - - 0x00E820 03:8810: A9 00
		STA ram_0769,X				;C - - - - - 0x00E822 03:8812: 9D 69 07
CODE_078815:
	RTS							;C - - - - - 0x00E825 03:8815: 60

CODE_078816:
	LDA vNametable				;C - - - - - 0x00E826 03:8816: A5 2D
	ASL							;C - - - - - 0x00E828 03:8818: 0A
	ASL							;C - - - - - 0x00E829 03:8819: 0A
	ASL							;C - - - - - 0x00E82A 03:881A: 0A
	STA scratch4				;C - - - - - 0x00E82B 03:881B: 85 04
	LDA ram_0775				;C - - - - - 0x00E82D 03:881D: AD 75 07
	SEC							;C - - - - - 0x00E830 03:8820: 38
	SBC ram_0776				;C - - - - - 0x00E831 03:8821: ED 76 07
	TAX							;C - - - - - 0x00E834 03:8824: AA
	LDA ram_076D,X				;C - - - - - 0x00E835 03:8825: BD 6D 07
	ASL							;C - - - - - 0x00E838 03:8828: 0A
	TAY							;C - - - - - 0x00E839 03:8829: A8
	LDA DATA_04BDA8,Y			;C - - - - - 0x00E83A 03:882A: B9 A8 BD
	CLC							;C - - - - - 0x00E83D 03:882D: 18
	ADC scratch0				;C - - - - - 0x00E83E 03:882E: 65 00
	ADC scratch5				;C - - - - - 0x00E840 03:8830: 65 05
	STA mapTargetAdr				;C - - - - - 0x00E842 03:8832: 85 49
	LDA DATA_04BDA8+1,Y			;C - - - - - 0x00E844 03:8834: B9 A9 BD
	ADC scratch4				;C - - - - - 0x00E847 03:8837: 65 04
	STA mapTargetAdr+1				;C - - - - - 0x00E849 03:8839: 85 4A
	RTS							;C - - - - - 0x00E84B 03:883B: 60

CODE_07883C:
	LDA ram_0775				;C - - - - - 0x00E84C 03:883C: AD 75 07
	SEC							;C - - - - - 0x00E84F 03:883F: 38
	SBC ram_0776				;C - - - - - 0x00E850 03:8840: ED 76 07
	TAX							;C - - - - - 0x00E853 03:8843: AA
	LDA #$1F					;C - - - - - 0x00E854 03:8844: A9 1F
	STA ram_0771,X				;C - - - - - 0x00E856 03:8846: 9D 71 07
	INC ram_0775				;C - - - - - 0x00E859 03:8849: EE 75 07
	LDA ram_0775				;C - - - - - 0x00E85C 03:884C: AD 75 07
	CMP ram_0777				;C - - - - - 0x00E85F 03:884F: CD 77 07
	BCC CODE_07885A				;C - - - - - 0x00E862 03:8852: 90 06
		LDA ram_0776				;C - - - - - 0x00E864 03:8854: AD 76 07
		STA ram_0775				;C - - - - - 0x00E867 03:8857: 8D 75 07
CODE_07885A:
	RTS							;C - - - - - 0x00E86A 03:885A: 60

CODE_07885B:
	LDA ram_0775				;C - - - - - 0x00E86B 03:885B: AD 75 07
	ASL							;C - - - - - 0x00E86E 03:885E: 0A
	ASL							;C - - - - - 0x00E86F 03:885F: 0A
	TAY							;C - - - - - 0x00E870 03:8860: A8
	LDA DATA_04BD27,Y			;C - - - - - 0x00E871 03:8861: B9 27 BD
	STA scratch6				;C - - - - - 0x00E874 03:8864: 85 06
	LDA DATA_04BD27+1,Y			;C - - - - - 0x00E876 03:8866: B9 28 BD
	STA scratch7				;C - - - - - 0x00E879 03:8869: 85 07
	LDA DATA_04BD27+2,Y			;C - - - - - 0x00E87B 03:886B: B9 29 BD
	STA scratch8				;C - - - - - 0x00E87E 03:886E: 85 08
	LDA DATA_04BD27+3,Y			;C - - - - - 0x00E880 03:8870: B9 2A BD
	STA scratch9				;C - - - - - 0x00E883 03:8873: 85 09
	RTS							;C - - - - - 0x00E885 03:8875: 60

CODE_078876:
	LDA ram_0775				;C - - - - - 0x00E886 03:8876: AD 75 07
	ASL							;C - - - - - 0x00E889 03:8879: 0A
	ASL							;C - - - - - 0x00E88A 03:887A: 0A
	TAY							;C - - - - - 0x00E88B 03:887B: A8
	LDA DATA_04BD47,Y			;C - - - - - 0x00E88C 03:887C: B9 47 BD
	STA scratch6				;C - - - - - 0x00E88F 03:887F: 85 06
	LDA DATA_04BD47+1,Y			;C - - - - - 0x00E891 03:8881: B9 48 BD
	STA scratch7				;C - - - - - 0x00E894 03:8884: 85 07
	LDA DATA_04BD47+2,Y			;C - - - - - 0x00E896 03:8886: B9 49 BD
	STA scratch8				;C - - - - - 0x00E899 03:8889: 85 08
	LDA DATA_04BD47+3,Y			;C - - - - - 0x00E89B 03:888B: B9 4A BD
	STA scratch9				;C - - - - - 0x00E89E 03:888E: 85 09
	RTS							;C - - - - - 0x00E8A0 03:8890: 60

CODE_078891:
	LDA ram_0775				;C - - - - - 0x00E8A1 03:8891: AD 75 07
	ASL							;C - - - - - 0x00E8A4 03:8894: 0A
	ASL							;C - - - - - 0x00E8A5 03:8895: 0A
	TAY							;C - - - - - 0x00E8A6 03:8896: A8
	LDA DATA_0788AC,Y			;C - - - - - 0x00E8A7 03:8897: B9 AC 88
	STA scratch0				;C - - - - - 0x00E8AA 03:889A: 85 00
	LDA DATA_0788AC+1,Y			;C - - - - - 0x00E8AC 03:889C: B9 AD 88
	STA scratch1				;C - - - - - 0x00E8AF 03:889F: 85 01
	LDA DATA_0788AC+2,Y			;C - - - - - 0x00E8B1 03:88A1: B9 AE 88
	STA scratch2				;C - - - - - 0x00E8B4 03:88A4: 85 02
	LDA DATA_0788AC+3,Y			;C - - - - - 0x00E8B6 03:88A6: B9 AF 88
	STA scratch3				;C - - - - - 0x00E8B9 03:88A9: 85 03
	RTS							;C - - - - - 0x00E8BB 03:88AB: 60

DATA_0788AC:
	.byte $05					;- D 0 - - - 0x00E8BC 03:88AC: 05
	.byte $00					;- D 0 - - - 0x00E8BD 03:88AD: 00
	.byte $11					;- D 0 - - - 0x00E8BE 03:88AE: 11
	.byte $08					;- D 0 - - - 0x00E8BF 03:88AF: 08
	.byte $0D					;- D 0 - - - 0x00E8C0 03:88B0: 0D
	.byte $00					;- D 0 - - - 0x00E8C1 03:88B1: 00
	.byte $11					;- D 0 - - - 0x00E8C2 03:88B2: 11
	.byte $06					;- D 0 - - - 0x00E8C3 03:88B3: 06
	.byte $17					;- D 0 - - - 0x00E8C4 03:88B4: 17
	.byte $00					;- D 0 - - - 0x00E8C5 03:88B5: 00
	.byte $11					;- D 0 - - - 0x00E8C6 03:88B6: 11
	.byte $08					;- D 0 - - - 0x00E8C7 03:88B7: 08
	.byte $0A					;- D 0 - - - 0x00E8C8 03:88B8: 0A
	.byte $01					;- D 0 - - - 0x00E8C9 03:88B9: 01
	.byte $08					;- D 0 - - - 0x00E8CA 03:88BA: 08
	.byte $00					;- D 0 - - - 0x00E8CB 03:88BB: 00
	.byte $03					;- D 0 - - - 0x00E8CC 03:88BC: 03
	.byte $02					;- D 0 - - - 0x00E8CD 03:88BD: 02
	.byte $0D					;- D 0 - - - 0x00E8CE 03:88BE: 0D
	.byte $09					;- D 0 - - - 0x00E8CF 03:88BF: 09
	.byte $0A					;- D 0 - - - 0x00E8D0 03:88C0: 0A
	.byte $02					;- D 0 - - - 0x00E8D1 03:88C1: 02
	.byte $0D					;- D 0 - - - 0x00E8D2 03:88C2: 0D
	.byte $08					;- D 0 - - - 0x00E8D3 03:88C3: 08
	.byte $12					;- D 0 - - - 0x00E8D4 03:88C4: 12
	.byte $02					;- D 0 - - - 0x00E8D5 03:88C5: 02
	.byte $0D					;- D 0 - - - 0x00E8D6 03:88C6: 0D
	.byte $08					;- D 0 - - - 0x00E8D7 03:88C7: 08
	.byte $1A					;- D 0 - - - 0x00E8D8 03:88C8: 1A
	.byte $02					;- D 0 - - - 0x00E8D9 03:88C9: 02
	.byte $0D					;- D 0 - - - 0x00E8DA 03:88CA: 0D
	.byte $09					;- D 0 - - - 0x00E8DB 03:88CB: 09

CODE_0788CC:
	LDA #$00					;C - - - - - 0x00E8DC 03:88CC: A9 00
	STA wideScrollDir				;C - - - - - 0x00E8DE 03:88CE: 85 31

	LDA playerHeld				;C - - - - - 0x00E8E0 03:88D0: A5 72
	AND #KEY_LEFT|KEY_RIGHT		;C - - - - - 0x00E8E2 03:88D2: 29 C0
	BEQ @end					;C - - - - - 0x00E8E4 03:88D4: F0 1B
		CMP #KEY_RIGHT				;C - - - - - 0x00E8E6 03:88D6: C9 80
		BEQ @right					;C - - - - - 0x00E8E8 03:88D8: F0 0D
			LDA objX				;C - - - - - 0x00E8EA 03:88DA: AD B3 05
			CMP #80						;C - - - - - 0x00E8ED 03:88DD: C9 50
			BCS @end					;C - - - - - 0x00E8EF 03:88DF: B0 10
				JSR WideScrollLeft				;C - - - - - 0x00E8F1 03:88E1: 20 F2 88
				JMP @end					;C - - - - - 0x00E8F4 03:88E4: 4C F1 88
	@right:
		LDA objX				;C - - - - - 0x00E8F7 03:88E7: AD B3 05
		CMP #176					;C - - - - - 0x00E8FA 03:88EA: C9 B0
		BCC @end					;C - - - - - 0x00E8FC 03:88EC: 90 03
			JSR WideScrollRight				;C - - - - - 0x00E8FE 03:88EE: 20 04 89
@end:
	RTS							;C - - - - - 0x00E901 03:88F1: 60

WideScrollLeft:
	LDA wideHScroll				;C - - - - - 0x00E902 03:88F2: AD 61 07
	CMP #1					;C - - - - - 0x00E905 03:88F5: C9 01
	BEQ @end				;C - - - - - 0x00E907 03:88F7: F0 0A
		DEC wideHScroll				;C - - - - - 0x00E909 03:88F9: CE 61 07
		DEC wideHScroll				;C - - - - - 0x00E90C 03:88FC: CE 61 07

		LDA #DIR_LEFT					;C - - - - - 0x00E90F 03:88FF: A9 01
		STA wideScrollDir				;C - - - - - 0x00E911 03:8901: 85 31
@end:
	RTS							;C - - - - - 0x00E913 03:8903: 60

WideScrollRight:
	LDA wideHScroll				;C - - - - - 0x00E914 03:8904: AD 61 07
	CMP #255					;C - - - - - 0x00E917 03:8907: C9 FF
	BEQ @end				;C - - - - - 0x00E919 03:8909: F0 0A
		INC wideHScroll				;C - - - - - 0x00E91B 03:890B: EE 61 07
		INC wideHScroll				;C - - - - - 0x00E91E 03:890E: EE 61 07

		LDA #DIR_RIGHT					;C - - - - - 0x00E921 03:8911: A9 02
		STA wideScrollDir				;C - - - - - 0x00E923 03:8913: 85 31
@end:
	RTS							;C - - - - - 0x00E925 03:8915: 60

CODE_078916:
.ifdef REGION_JP
	LDA #.BANK(DATA_04BE45)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x00E926 03:8916: A9 00
	ORA #$07					;C - - - - - 0x00E928 03:8918: 09 07
	STA $8000				;C - - - - - 0x00E92A 03:891A: 8D 00 80
	LDA #.BANK(DATA_04BE45)					;C - - - - - 0x00E92D 03:891D: A9 04
	STA $8001				;C - - - - - 0x00E92F 03:891F: 8D 01 80
	STA prgBankB				;C - - - - - 0x00E932 03:8922: 85 53

	LDA #$00					;C - - - - - 0x00E934 03:8924: A9 00
	ORA #$07					;C - - - - - 0x00E936 03:8926: 09 07
	STA $8000				;C - - - - - 0x00E938 03:8928: 8D 00 80
	LDA #.BANK(DATA_04BE45)					;C - - - - - 0x00E93B 03:892B: A9 04
	STA $8001				;C - - - - - 0x00E93D 03:892D: 8D 01 80
	STA prgBankB				;C - - - - - 0x00E940 03:8930: 85 53
.endif

	LDA roundFlags				;C - - - - - 0x00E942 03:8932: AD 71 04
	AND #$10					;C - - - - - 0x00E945 03:8935: 29 10
	BEQ CODE_078960				;C - - - - - 0x00E947 03:8937: F0 27
		LDA ram_054C				;C - - - - - 0x00E949 03:8939: AD 4C 05
		BNE CODE_078955				;C - - - - - 0x00E94C 03:893C: D0 17
			LDA roundFlags				;C - - - - - 0x00E94E 03:893E: AD 71 04
			AND #$C0					;C - - - - - 0x00E951 03:8941: 29 C0
			BEQ CODE_078955				;C - - - - - 0x00E953 03:8943: F0 10
				CMP #$40					;C - - - - - 0x00E955 03:8945: C9 40
				BEQ CODE_07894F				;C - - - - - 0x00E957 03:8947: F0 06
					JSR CODE_078C24				;C - - - - - 0x00E959 03:8949: 20 24 8C
					JMP CODE_078A67				;C - - - - - 0x00E95C 03:894C: 4C 67 8A
			CODE_07894F:
				JSR CODE_078D2D				;C - - - - - 0x00E95F 03:894F: 20 2D 8D
				JMP CODE_078A67				;C - - - - - 0x00E962 03:8952: 4C 67 8A
	CODE_078955:
		LDA objState+OSLOT_ENEMY+9				;C - - - - - 0x00E965 03:8955: AD 75 05
		BEQ CODE_07895D				;C - - - - - 0x00E968 03:8958: F0 03
			;Unreached
			JSR CODE_078A70				;- - - - - - 0x00E96A 03:895A: 20
	CODE_07895D:
		JMP CODE_078A67				;C - - - - - 0x00E96D 03:895D: 4C 67 8A
CODE_078960:
	LDA ram_053E				;C - - - - - 0x00E970 03:8960: AD 3E 05
	BEQ CODE_078973				;C - - - - - 0x00E973 03:8963: F0 0E
		CMP #$01					;C - - - - - 0x00E975 03:8965: C9 01
		BEQ CODE_0789C3				;C - - - - - 0x00E977 03:8967: F0 5A
		CMP #$02					;C - - - - - 0x00E979 03:8969: C9 02
		BNE CODE_078970				;C - - - - - 0x00E97B 03:896B: D0 03
			JMP CODE_0789F7				;C - - - - - 0x00E97D 03:896D: 4C F7 89
	CODE_078970:
		JMP CODE_078A67				;C - - - - - 0x00E980 03:8970: 4C 67 8A
CODE_078973:
	LDA roundFlags				;C - - - - - 0x00E983 03:8973: AD 71 04
	BEQ CODE_078982				;C - - - - - 0x00E986 03:8976: F0 0A
		LDA #$00					;C - - - - - 0x00E988 03:8978: A9 00
		STA objState+OSLOT_ENEMY+9				;C - - - - - 0x00E98A 03:897A: 8D 75 05
		STA ram_054C				;C - - - - - 0x00E98D 03:897D: 8D 4C 05
		BEQ CODE_0789C0				;C - - - - - 0x00E990 03:8980: F0 3E
CODE_078982:
	LDA roundBubbleVariant				;C - - - - - 0x00E992 03:8982: A5 82
	CMP #BUBV_DRINK					;C - - - - - 0x00E994 03:8984: C9 80
	BCC CODE_0789C0				;C - - - - - 0x00E996 03:8986: 90 38
		LDA bubbleVariant				;C - - - - - 0x00E998 03:8988: AD 19 05
		BNE CODE_0789C0				;C - - - - - 0x00E99B 03:898B: D0 33
			LDA playerLives				;C - - - - - 0x00E99D 03:898D: AD 79 04
			BEQ CODE_0789C0				;C - - - - - 0x00E9A0 03:8990: F0 2E
				LDA ram_054C				;C - - - - - 0x00E9A2 03:8992: AD 4C 05
				BNE CODE_07899A				;C - - - - - 0x00E9A5 03:8995: D0 03
					JSR CODE_078E8B				;C - - - - - 0x00E9A7 03:8997: 20 8B 8E
			CODE_07899A:
				LDA #$08					;C - - - - - 0x00E9AA 03:899A: A9 08
				STA scratch2				;C - - - - - 0x00E9AC 03:899C: 85 02
				STA scratch3				;C - - - - - 0x00E9AE 03:899E: 85 03
				LDA #$12					;C - - - - - 0x00E9B0 03:89A0: A9 12
				STA scratch4				;C - - - - - 0x00E9B2 03:89A2: 85 04
				JSR CODE_078BC5				;C - - - - - 0x00E9B4 03:89A4: 20 C5 8B
				LDA objState+OSLOT_ENEMY+9				;C - - - - - 0x00E9B7 03:89A7: AD 75 05
				CMP #$80					;C - - - - - 0x00E9BA 03:89AA: C9 80
				BCC CODE_0789C0				;C - - - - - 0x00E9BC 03:89AC: 90 12
					AND #$7F					;C - - - - - 0x00E9BE 03:89AE: 29 7F
					STA bubbleVariant				;C - - - - - 0x00E9C0 03:89B0: 8D 19 05
					LDA #$00					;C - - - - - 0x00E9C3 03:89B3: A9 00
					STA objState+OSLOT_ENEMY+9				;C - - - - - 0x00E9C5 03:89B5: 8D 75 05
					STA ram_054C				;C - - - - - 0x00E9C8 03:89B8: 8D 4C 05
					LDA #snRoundItem_ID					;C - - - - - 0x00E9CB 03:89BB: A9 0A
					STA a:soundTrigger				;C - - - - - 0x00E9CD 03:89BD: 8D E1 00
CODE_0789C0:
	JMP CODE_078A5E				;C - - - - - 0x00E9D0 03:89C0: 4C 5E 8A
CODE_0789C3:
	LDA bubblesLifespanLevel				;C - - - - - 0x00E9D3 03:89C3: A5 DA
	AND #$07					;C - - - - - 0x00E9D5 03:89C5: 29 07
	STA scratch0				;C - - - - - 0x00E9D7 03:89C7: 85 00
	LDA globalTimer				;C - - - - - 0x00E9D9 03:89C9: A5 14
	AND #$1F					;C - - - - - 0x00E9DB 03:89CB: 29 1F
	BNE CODE_0789F4				;C - - - - - 0x00E9DD 03:89CD: D0 25
		LDX #$00					;C - - - - - 0x00E9DF 03:89CF: A2 00
	CODE_0789D1:
		LDA DATA_078F12,X			;C - - - - - 0x00E9E1 03:89D1: BD 12 8F
		CMP rewardsEaten,X				;C - - - - - 0x00E9E4 03:89D4: DD 3F 05
		BCS CODE_0789E5				;C - - - - - 0x00E9E7 03:89D7: B0 0C
		CPX #$01					;C - - - - - 0x00E9E9 03:89D9: E0 01
		BNE CODE_0789EC				;C - - - - - 0x00E9EB 03:89DB: D0 0F
		CLC							;C - - - - - 0x00E9ED 03:89DD: 18
		ADC scratch0				;C - - - - - 0x00E9EE 03:89DE: 65 00
		CMP rewardsEaten,X				;C - - - - - 0x00E9F0 03:89E0: DD 3F 05
		BCC CODE_0789EC				;C - - - - - 0x00E9F3 03:89E3: 90 07
	CODE_0789E5:
		INX							;C - - - - - 0x00E9F5 03:89E5: E8
		CPX #$0D					;C - - - - - 0x00E9F6 03:89E6: E0 0D
		BNE CODE_0789D1				;C - - - - - 0x00E9F8 03:89E8: D0 E7
		BEQ CODE_0789F4				;C - - - - - 0x00E9FA 03:89EA: F0 08
	CODE_0789EC:
			INX							;C - - - - - 0x00E9FC 03:89EC: E8
			TXA							;C - - - - - 0x00E9FD 03:89ED: 8A
			STA objState+OSLOT_ENEMY+9				;C - - - - - 0x00E9FE 03:89EE: 8D 75 05
			JSR CODE_078E56				;C - - - - - 0x00EA01 03:89F1: 20 56 8E
CODE_0789F4:
	JMP CODE_078A5E				;C - - - - - 0x00EA04 03:89F4: 4C 5E 8A
CODE_0789F7:
	LDA #$10					;C - - - - - 0x00EA07 03:89F7: A9 10
	STA scratch2				;C - - - - - 0x00EA09 03:89F9: 85 02
	STA scratch3				;C - - - - - 0x00EA0B 03:89FB: 85 03
	LDA #$12					;C - - - - - 0x00EA0D 03:89FD: A9 12
	STA scratch4				;C - - - - - 0x00EA0F 03:89FF: 85 04
	JSR CODE_078BC5				;C - - - - - 0x00EA11 03:8A01: 20 C5 8B
	LDA objState+OSLOT_ENEMY+9				;C - - - - - 0x00EA14 03:8A04: AD 75 05
	CMP #$80					;C - - - - - 0x00EA17 03:8A07: C9 80
	BCC CODE_078A47				;C - - - - - 0x00EA19 03:8A09: 90 3C
		AND #$7F					;C - - - - - 0x00EA1B 03:8A0B: 29 7F
		STA objState+OSLOT_ENEMY+9				;C - - - - - 0x00EA1D 03:8A0D: 8D 75 05
		ASL							;C - - - - - 0x00EA20 03:8A10: 0A
		TAY							;C - - - - - 0x00EA21 03:8A11: A8
		LDA RoundItemCollectHandlers,Y			;C - - - - - 0x00EA22 03:8A12: B9 1F 8F
		STA scratch6				;C - - - - - 0x00EA25 03:8A15: 85 06
		LDA RoundItemCollectHandlers+1,Y			;C - - - - - 0x00EA27 03:8A17: B9 20 8F
		STA scratch7				;C - - - - - 0x00EA2A 03:8A1A: 85 07
		LDA #.HIBYTE(@itemret-1)					;C - - - - - 0x00EA2C 03:8A1C: A9 8A
		PHA							;C - - - - - 0x00EA2E 03:8A1E: 48
		LDA #.LOBYTE(@itemret-1)					;C - - - - - 0x00EA2F 03:8A1F: A9 24
		PHA							;C - - - - - 0x00EA31 03:8A21: 48
		JMP (scratch6)				;C - - - - - 0x00EA32 03:8A22: 6C 06 00

		@itemret:
		LDY objState+OSLOT_ENEMY+9				;C - - - - - 0x00EA35 03:8A25: AC 75 05
		LDX DATA_04BE45,Y			;C - - - - - 0x00EA38 03:8A28: BE 45 BE
		LDA DATA_04BE57,Y			;C - - - - - 0x00EA3B 03:8A2B: B9 57 BE
		STA scoreAdditionDigits,X				;C - - - - - 0x00EA3E 03:8A2E: 9D A1 04
		JSR AddScore				;C - - - - - 0x00EA41 03:8A31: 20 C7 FE

		LDY objState+OSLOT_ENEMY+9				;C - - - - - 0x00EA44 03:8A34: AC 75 05
		CPY #VALID_ITEMS					;C - - - - - 0x00EA47 03:8A37: C0 12
		BCS CODE_078A41				;C - - - - - 0x00EA49 03:8A39: B0 06
			LDA RoundItemSounds,Y			;C - - - - - 0x00EA4B 03:8A3B: B9 33 BE
			STA a:soundTrigger			;C - - - - - 0x00EA4E 03:8A3E: 8D E1 00
	CODE_078A41:
		JSR CODE_078A70				;C - - - - - 0x00EA51 03:8A41: 20 70 8A
		JMP CODE_078A5E				;C - - - - - 0x00EA54 03:8A44: 4C 5E 8A
CODE_078A47:
	INC ram_054C				;C - - - - - 0x00EA57 03:8A47: EE 4C 05
	LDA ram_054C				;C - - - - - 0x00EA5A 03:8A4A: AD 4C 05
	CMP #$FE					;C - - - - - 0x00EA5D 03:8A4D: C9 FE
	BCC CODE_078A5E				;C - - - - - 0x00EA5F 03:8A4F: 90 0D
		LDA objState+OSLOT_ENEMY+9				;C - - - - - 0x00EA61 03:8A51: AD 75 05
		CMP #$05					;C - - - - - 0x00EA64 03:8A54: C9 05
		BNE CODE_078A5B				;C - - - - - 0x00EA66 03:8A56: D0 03
			INC ram_0544				;C - - - - - 0x00EA68 03:8A58: EE 44 05
	CODE_078A5B:
		JSR CODE_078A70				;C - - - - - 0x00EA6B 03:8A5B: 20 70 8A
CODE_078A5E:
	LDA globalTimer				;C - - - - - 0x00EA6E 03:8A5E: A5 14
	CMP #$FE					;C - - - - - 0x00EA70 03:8A60: C9 FE
	BCC CODE_078A67				;C - - - - - 0x00EA72 03:8A62: 90 03
		INC ram_0543				;C - - - - - 0x00EA74 03:8A64: EE 43 05
CODE_078A67:
	LDA ram_0550				;C - - - - - 0x00EA77 03:8A67: AD 50 05
	BEQ CODE_078A6F				;C - - - - - 0x00EA7A 03:8A6A: F0 03
		JSR CODE_078EBE				;C - - - - - 0x00EA7C 03:8A6C: 20 BE 8E
CODE_078A6F:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x00EA7F 03:8A6F: 60

CODE_078A70:
	LDY objState+OSLOT_ENEMY+9				;C - - - - - 0x00EA80 03:8A70: AC 75 05
	DEY							;C - - - - - 0x00EA83 03:8A73: 88
	LDA #$00					;C - - - - - 0x00EA84 03:8A74: A9 00
	STA rewardsEaten,Y				;C - - - - - 0x00EA86 03:8A76: 99 3F 05
	STA ram_054C				;C - - - - - 0x00EA89 03:8A79: 8D 4C 05
	STA ram_054D				;C - - - - - 0x00EA8C 03:8A7C: 8D 4D 05
	STA objState+OSLOT_ENEMY+9				;C - - - - - 0x00EA8F 03:8A7F: 8D 75 05
	STA objAnimHI+OSLOT_ENEMY+9				;C - - - - - 0x00EA92 03:8A82: 8D 2D 07
	INC ram_053E				;C - - - - - 0x00EA95 03:8A85: EE 3E 05
	RTS							;C - - - - - 0x00EA98 03:8A88: 60

CollectPlaceholder:
	;Unreached
	RTS							;- - - - - - 0x00EA99 03:8A89: 60

CollectHeart:
	LDA playerHearts				;C - - - - - 0x00EA9A 03:8A8A: AD 78 04
	CMP #5					;C - - - - - 0x00EA9D 03:8A8D: C9 05
	BEQ CODE_078A9F				;C - - - - - 0x00EA9F 03:8A8F: F0 0E
		CLC							;C - - - - - 0x00EAA1 03:8A91: 18
		ADC #1					;C - - - - - 0x00EAA2 03:8A92: 69 01
		STA playerHearts				;C - - - - - 0x00EAA4 03:8A94: 8D 78 04

		LDA livesCurrentPos				;C - - - - - 0x00EAA7 03:8A97: AD 98 04
		ORA #3					;C - - - - - 0x00EAAA 03:8A9A: 09 03
		STA livesCurrentPos				;C - - - - - 0x00EAAC 03:8A9C: 8D 98 04
CODE_078A9F:
	RTS							;C - - - - - 0x00EAAF 03:8A9F: 60

CollectHolyCup:
	LDA roundEnemies				;C - - - - - 0x00EAB0 03:8AA0: AD A8 04
	TAX							;C - - - - - 0x00EAB3 03:8AA3: AA
@kill:
	DEX							;C - - - - - 0x00EAB4 03:8AA4: CA

.ifndef REGION_JP
	LDA enemyType,X				;C - - - - - 0x00EAB5 03:8AA5: B5 98
	BEQ @next				;C - - - - - 0x00EAB7 03:8AA7: F0 14
.endif

	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x00EAB9 03:8AA9: BD 6C 05
	BEQ @next				;C - - - - - 0x00EABC 03:8AAC: F0 0F

	CMP #ENEMY_DYING					;C - - - - - 0x00EABE 03:8AAE: C9 0B
	BCS @next				;C - - - - - 0x00EAC0 03:8AB0: B0 0B

	ASL							;C - - - - - 0x00EAC2 03:8AB2: 0A
	BCS @next				;C - - - - - 0x00EAC3 03:8AB3: B0 08

	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x00EAC5 03:8AB5: BD 6C 05
	ORA #$E0					;C - - - - - 0x00EAC8 03:8AB8: 09 E0
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x00EACA 03:8ABA: 9D 6C 05
@next:
	TXA							;C - - - - - 0x00EACD 03:8ABD: 8A
	BNE @kill				;C - - - - - 0x00EACE 03:8ABE: D0 E4

CODE_078AC0:
.ifdef REGION_JP
	LDX #$00					;- - - - - - 0x00EADB 03:8ACB: A2
.endif

	LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x00EAD0 03:8AC0: BD 77 05
	CMP #BUBBLE_ENEMY					;C - - - - - 0x00EAD3 03:8AC3: C9 03
	BEQ CODE_078ACB				;C - - - - - 0x00EAD5 03:8AC5: F0 04
	CMP #BUBBLE_ENEMY_EXPIRING					;C - - - - - 0x00EAD7 03:8AC7: C9 04
	BNE CODE_078AE3				;C - - - - - 0x00EAD9 03:8AC9: D0 18
CODE_078ACB:
	;Unreached
	TXA							;- - - - - - 0x00EADB 03:8ACB: 8A
	PHA							;- - - - - - 0x00EADC 03:8ACC: 48
	STA scratch1				;- - - - - - 0x00EADD 03:8ACD: 85
	JSR PopBubble				;- - - - - - 0x00EADF 03:8ACF: 20
	PLA							;- - - - - - 0x00EAE2 03:8AD2: 68
	TAX							;- - - - - - 0x00EAE3 03:8AD3: AA
	LDA #$03					;- - - - - - 0x00EAE4 03:8AD4: A9
	STA scoreAdditionDigits+3				;- - - - - - 0x00EAE6 03:8AD6: 8D
	TXA							;- - - - - - 0x00EAE9 03:8AD9: 8A
	PHA							;- - - - - - 0x00EAEA 03:8ADA: 48
	JSR AddScore				;- - - - - - 0x00EAEB 03:8ADB: 20
	STA ram_051A				;- - - - - - 0x00EAEE 03:8ADE: 8D
	PLA							;- - - - - - 0x00EAF1 03:8AE1: 68
	TAX							;- - - - - - 0x00EAF2 03:8AE2: AA
CODE_078AE3:
	INX							;C - - - - - 0x00EAF3 03:8AE3: E8
	CPX #20					;C - - - - - 0x00EAF4 03:8AE4: E0 14
.ifdef REGION_JP
	BCC CODE_078AC0+2			;- - - - - - 0x00EB03 03:8AF3: 90 Jump back to misaligned code? How even?
.else
	BCC CODE_078AC0				;C - - - - - 0x00EAF6 03:8AE6: 90 D8
.endif

	LDA #$0F					;C - - - - - 0x00EAF8 03:8AE8: A9 0F
	STA ram_0550				;C - - - - - 0x00EAFA 03:8AEA: 8D 50 05
	RTS							;C - - - - - 0x00EAFD 03:8AED: 60

CollectSecretDoor:
	LDA #RFLAG_BONUS_GAME					;C - - - - - 0x00EAFE 03:8AEE: A9 20
	STA roundFlags				;C - - - - - 0x00EB00 03:8AF0: 8D 71 04
	INC currentRound				;C - - - - - 0x00EB03 03:8AF3: E6 D8
	LDA #$00					;C - - - - - 0x00EB05 03:8AF5: A9 00
	STA ram_007B				;C - - - - - 0x00EB07 03:8AF7: 85 7B
	STA playerDmgType				;C - - - - - 0x00EB09 03:8AF9: 85 7C
	RTS							;C - - - - - 0x00EB0B 03:8AFB: 60

CollectPencil:
	LDA continues				;C - - - - - 0x00EB0C 03:8AFC: A5 DC
	CMP #255					;C - - - - - 0x00EB0E 03:8AFE: C9 FF
	BEQ CODE_078B07				;C - - - - - 0x00EB10 03:8B00: F0 05
		CLC							;C - - - - - 0x00EB12 03:8B02: 18
		ADC #1					;C - - - - - 0x00EB13 03:8B03: 69 01
		STA continues				;C - - - - - 0x00EB15 03:8B05: 85 DC
CODE_078B07:
	RTS							;C - - - - - 0x00EB17 03:8B07: 60

CollectCrystal:
	INC crystals				;C - - - - - 0x00EB18 03:8B08: EE 41 05
	RTS							;C - - - - - 0x00EB1B 03:8B0B: 60

CollectStarRod:
	;Unreached
	LDA #RFLAG_CLEAR					;- - - - - - 0x00EB1C 03:8B0C: A9
	STA roundFlags				;- - - - - - 0x00EB1E 03:8B0E: 8D

	LDA currentRound				;- - - - - - 0x00EB21 03:8B11: A5
	CMP #20					;- - - - - - 0x00EB23 03:8B13: C9
	BCS @notworld1				;- - - - - - 0x00EB25 03:8B15: B0
		LDA #20					;- - - - - - 0x00EB27 03:8B17: A9
		STA currentRound				;- - - - - - 0x00EB29 03:8B19: 85
		BNE @worldchecked				;- - - - - - 0x00EB2B 03:8B1B: D0
@notworld1:
	CMP #40					;- - - - - - 0x00EB2D 03:8B1D: C9
	BCS @notworld2				;- - - - - - 0x00EB2F 03:8B1F: B0
		LDA #40					;- - - - - - 0x00EB31 03:8B21: A9
		STA currentRound				;- - - - - - 0x00EB33 03:8B23: 85
		BNE @worldchecked				;- - - - - - 0x00EB35 03:8B25: D0
@notworld2:
	CMP #60					;- - - - - - 0x00EB37 03:8B27: C9
	BCS @notworld3				;- - - - - - 0x00EB39 03:8B29: B0
		LDA #60					;- - - - - - 0x00EB3B 03:8B2B: A9
		STA currentRound				;- - - - - - 0x00EB3D 03:8B2D: 85
		BNE @worldchecked				;- - - - - - 0x00EB3F 03:8B2F: D0
@notworld3:
	CMP #78					;- - - - - - 0x00EB41 03:8B31: C9
	BCS @worldchecked				;- - - - - - 0x00EB43 03:8B33: B0
		LDA #78					;- - - - - - 0x00EB45 03:8B35: A9
		STA currentRound				;- - - - - - 0x00EB47 03:8B37: 85
@worldchecked:
	LDA #1					;- - - - - - 0x00EB49 03:8B39: A9
	STA roundsToSkip				;- - - - - - 0x00EB4B 03:8B3B: 8D
	RTS							;- - - - - - 0x00EB4E 03:8B3E: 60

CollectShoe:
	INC shoes				;C - - - - - 0x00EB4F 03:8B3F: EE 4B 05
	LDA powerUps				;C - - - - - 0x00EB52 03:8B42: A5 DE
	ORA #POWERUP_SHOE					;C - - - - - 0x00EB54 03:8B44: 09 02
	STA powerUps				;C - - - - - 0x00EB56 03:8B46: 85 DE
	RTS							;C - - - - - 0x00EB58 03:8B48: 60

CollectCandy:
	LDA powerUps				;C - - - - - 0x00EB59 03:8B49: A5 DE
	ORA #POWERUP_CANDY					;C - - - - - 0x00EB5B 03:8B4B: 09 01
	STA powerUps				;C - - - - - 0x00EB5D 03:8B4D: 85 DE
	RTS							;C - - - - - 0x00EB5F 03:8B4F: 60

CollectLife:
	;Unreched
	LDA playerLives				;- - - - - - 0x00EB60 03:8B50: AD
	CMP #99					;- - - - - - 0x00EB63 03:8B53: C9
	BCS @livesinrange				;- - - - - - 0x00EB65 03:8B55: B0
		INC playerLives				;- - - - - - 0x00EB67 03:8B57: EE
@livesinrange:
	LDA livesCurrentPos				;- - - - - - 0x00EB6A 03:8B5A: AD
	ORA #3					;- - - - - - 0x00EB6D 03:8B5D: 09
	STA livesCurrentPos				;- - - - - - 0x00EB6F 03:8B5F: 8D

	LDA bubblesLifespanLevel				;- - - - - - 0x00EB72 03:8B62: A5
	CMP #15					;- - - - - - 0x00EB74 03:8B64: C9
	BCS @lifespaninrange				;- - - - - - 0x00EB76 03:8B66: B0
		INC bubblesLifespanLevel				;- - - - - - 0x00EB78 03:8B68: E6
@lifespaninrange:
	RTS							;- - - - - - 0x00EB7A 03:8B6A: 60

CollectClock:
	LDA #trSilence_ID					;C - - - - - 0x00EB7B 03:8B6B: A9 00
	STA a:musicTrigger			;C - - - - - 0x00EB7D 03:8B6D: 8D E0 00

	LDA #6					;C - - - - - 0x00EB80 03:8B70: A9 06
	STA enemyFrozenCycles				;C - - - - - 0x00EB82 03:8B72: 8D D4 04

	LDY #$00					;C - - - - - 0x00EB85 03:8B75: A0 00
CODE_078B77:
	LDA bonusGameProgress				;C - - - - - 0x00EB87 03:8B77: A5 D6
	CMP #$04					;C - - - - - 0x00EB89 03:8B79: C9 04
	BCS CODE_078B97				;C - - - - - 0x00EB8B 03:8B7B: B0 1A
	CMP #$03					;C - - - - - 0x00EB8D 03:8B7D: C9 03
	BEQ CODE_078B91				;C - - - - - 0x00EB8F 03:8B7F: F0 10
	CMP #$02					;C - - - - - 0x00EB91 03:8B81: C9 02
	BEQ CODE_078B8B				;C - - - - - 0x00EB93 03:8B83: F0 06
		LDA DATA_04BF24,Y			;C - - - - - 0x00EB95 03:8B85: B9 24 BF
		JMP CODE_078B9A				;C - - - - - 0x00EB98 03:8B88: 4C 9A 8B
CODE_078B8B:
	;Unreached
	LDA DATA_04BF34,Y			;- - - - - - 0x00EB9B 03:8B8B: B9
	JMP CODE_078B9A				;- - - - - - 0x00EB9E 03:8B8E: 4C
CODE_078B91:
	LDA DATA_04BF44,Y			;C - - - - - 0x00EBA1 03:8B91: B9 44 BF
	JMP CODE_078B9A				;C - - - - - 0x00EBA4 03:8B94: 4C 9A 8B
CODE_078B97:
	LDA DATA_04BF54,Y			;- - - - - - 0x00EBA7 03:8B97: B9
CODE_078B9A:
	STA colorBuffer,Y				;C - - - - - 0x00EBAA 03:8B9A: 99 00 03
	INY							;C - - - - - 0x00EBAD 03:8B9D: C8
	CPY #16					;C - - - - - 0x00EBAE 03:8B9E: C0 10
	BNE CODE_078B77				;C - - - - - 0x00EBB0 03:8BA0: D0 D5

	RTS							;C - - - - - 0x00EBB2 03:8BA2: 60

CollectStaff:
	;Unreached
	LDA #0					;- - - - - - 0x00EBB3 03:8BA3: A9
	STA objY+OSLOT_ENEMY+9				;- - - - - - 0x00EBB5 03:8BA5: 8D
	LDA #128					;- - - - - - 0x00EBB8 03:8BA8: A9
	STA objX+OSLOT_ENEMY+9				;- - - - - - 0x00EBBA 03:8BAA: 8D

	LDA #RFLAG_BIG_REWARD					;- - - - - - 0x00EBBD 03:8BAD: A9
	STA roundFlags				;- - - - - - 0x00EBBF 03:8BAF: 8D

	LDA #REWARDS_ROUND					;- - - - - - 0x00EBC2 03:8BB2: A9
	STA bigRewardCategory				;- - - - - - 0x00EBC4 03:8BB4: 8D
	RTS							;- - - - - - 0x00EBC7 03:8BB7: 60

CollectTree:
	LDA #RFLAG_MULTI_REWARD					;C - - - - - 0x00EBC8 03:8BB8: A9 40
	STA roundFlags				;C - - - - - 0x00EBCA 03:8BBA: 8D 71 04
	RTS							;C - - - - - 0x00EBCD 03:8BBD: 60

CollectParasol:
	LDA #RFLAG_CLEAR|RFLAG_PARASOL					;C - - - - - 0x00EBCE 03:8BBE: A9 03
	STA roundFlags				;C - - - - - 0x00EBD0 03:8BC0: 8D 71 04
	RTS							;C - - - - - 0x00EBD3 03:8BC3: 60

CODE_078BC4:
	;Unreached
	RTS							;- - - - - - 0x00EBD4 03:8BC4: 60

CODE_078BC5:
	LDA playerState				;C - - - - - 0x00EBD5 03:8BC5: A5 75
	CMP #PLAYER_STATE_DEAD		;C - - - - - 0x00EBD7 03:8BC7: C9 03
	BEQ CODE_078C23				;C - - - - - 0x00EBD9 03:8BC9: F0 58

	LDY scratch4				;C - - - - - 0x00EBDB 03:8BCB: A4 04
	LDA objX				;C - - - - - 0x00EBDD 03:8BCD: AD B3 05
	CMP objX,Y				;C - - - - - 0x00EBE0 03:8BD0: D9 B3 05
	BEQ CODE_078BF4				;C - - - - - 0x00EBE3 03:8BD3: F0 1F
		BCS CODE_078BE3				;C - - - - - 0x00EBE5 03:8BD5: B0 0C
			LDA objX,Y				;C - - - - - 0x00EBE7 03:8BD7: B9 B3 05
			SEC							;C - - - - - 0x00EBEA 03:8BDA: 38
			SBC objX				;C - - - - - 0x00EBEB 03:8BDB: ED B3 05
			STA scratch0				;C - - - - - 0x00EBEE 03:8BDE: 85 00
			JMP CODE_078BEC				;C - - - - - 0x00EBF0 03:8BE0: 4C EC 8B
	CODE_078BE3:
		LDA objX				;C - - - - - 0x00EBF3 03:8BE3: AD B3 05
		SEC							;C - - - - - 0x00EBF6 03:8BE6: 38
		SBC objX,Y				;C - - - - - 0x00EBF7 03:8BE7: F9 B3 05
		STA scratch0				;C - - - - - 0x00EBFA 03:8BEA: 85 00
	CODE_078BEC:
		LDA scratch2				;C - - - - - 0x00EBFC 03:8BEC: A5 02
		CMP scratch0				;C - - - - - 0x00EBFE 03:8BEE: C5 00
		BCS CODE_078BF4				;C - - - - - 0x00EC00 03:8BF0: B0 02
			BCC CODE_078C23				;C - - - - - 0x00EC02 03:8BF2: 90 2F
CODE_078BF4:
	LDA objY				;C - - - - - 0x00EC04 03:8BF4: AD 8B 05
	CMP objY,Y				;C - - - - - 0x00EC07 03:8BF7: D9 8B 05
	BEQ CODE_078C1B				;C - - - - - 0x00EC0A 03:8BFA: F0 1F
		BCS CODE_078C0A				;C - - - - - 0x00EC0C 03:8BFC: B0 0C
			LDA objY,Y				;C - - - - - 0x00EC0E 03:8BFE: B9 8B 05
			SEC							;C - - - - - 0x00EC11 03:8C01: 38
			SBC objY				;C - - - - - 0x00EC12 03:8C02: ED 8B 05
			STA scratch1				;C - - - - - 0x00EC15 03:8C05: 85 01
			JMP CODE_078C13				;C - - - - - 0x00EC17 03:8C07: 4C 13 8C
	CODE_078C0A:
		LDA objY				;C - - - - - 0x00EC1A 03:8C0A: AD 8B 05
		SEC							;C - - - - - 0x00EC1D 03:8C0D: 38
		SBC objY,Y				;C - - - - - 0x00EC1E 03:8C0E: F9 8B 05
		STA scratch1				;C - - - - - 0x00EC21 03:8C11: 85 01
	CODE_078C13:
		LDA scratch3				;C - - - - - 0x00EC23 03:8C13: A5 03
		CMP scratch1				;C - - - - - 0x00EC25 03:8C15: C5 01
		BCS CODE_078C1B				;C - - - - - 0x00EC27 03:8C17: B0 02
			BCC CODE_078C23				;C - - - - - 0x00EC29 03:8C19: 90 08
CODE_078C1B:
	LDA objState,Y				;C - - - - - 0x00EC2B 03:8C1B: B9 63 05
	ORA #$80					;C - - - - - 0x00EC2E 03:8C1E: 09 80
	STA objState,Y				;C - - - - - 0x00EC30 03:8C20: 99 63 05
CODE_078C23:
	RTS							;C - - - - - 0x00EC33 03:8C23: 60

CODE_078C24:
	LDA ram_054D				;C - - - - - 0x00EC34 03:8C24: AD 4D 05
	BNE CODE_078C99				;C - - - - - 0x00EC37 03:8C27: D0 70

	LDA #.BANK(ImageTable1)					;C - - - - - 0x00EC39 03:8C29: A9 04
	STA sprPrgBank				;C - - - - - 0x00EC3B 03:8C2B: 8D 61 05
	LDA #snBigReward_ID					;C - - - - - 0x00EC3E 03:8C2E: A9 0F
	STA a:soundTrigger				;C - - - - - 0x00EC40 03:8C30: 8D E1 00
	LDA bigRewardCategory				;C - - - - - 0x00EC43 03:8C33: AD 4F 05
	BEQ CODE_078C3A				;C - - - - - 0x00EC46 03:8C36: F0 02
		;Start from 16 if not in bonus game
		LDA #16					;C - - - - - 0x00EC48 03:8C38: A9 10
CODE_078C3A:
	STA scratch0				;C - - - - - 0x00EC4A 03:8C3A: 85 00
	LDA globalTimer				;C - - - - - 0x00EC4C 03:8C3C: A5 14
	AND #$1E					;C - - - - - 0x00EC4E 03:8C3E: 29 1E
	LSR							;C - - - - - 0x00EC50 03:8C40: 4A
	CLC							;C - - - - - 0x00EC51 03:8C41: 18
	ADC scratch0				;C - - - - - 0x00EC52 03:8C42: 65 00
	TAY							;C - - - - - 0x00EC54 03:8C44: A8
	LDA BigRewardTable,Y			;C - - - - - 0x00EC55 03:8C45: B9 49 8F
	STA objState+OSLOT_ENEMY+9				;C - - - - - 0x00EC58 03:8C48: 8D 75 05
	TAY							;C - - - - - 0x00EC5B 03:8C4B: A8
	LDA BigRewardAnim,Y			;C - - - - - 0x00EC5C 03:8C4C: B9 1F BE
	STA objAnim+OSLOT_ENEMY+9				;C - - - - - 0x00EC5F 03:8C4F: 8D 8D 06
	LDA BigRewardAnimHI,Y			;C - - - - - 0x00EC62 03:8C52: B9 29 BE
	STA objAnimHI+OSLOT_ENEMY+9				;C - - - - - 0x00EC65 03:8C55: 8D 2D 07
	LDA #$80					;C - - - - - 0x00EC68 03:8C58: A9 80
	STA objX+OSLOT_ENEMY+9				;C - - - - - 0x00EC6A 03:8C5A: 8D C5 05
	LDA #$02					;C - - - - - 0x00EC6D 03:8C5D: A9 02
	STA objChrSlot+OSLOT_ENEMY+9				;C - - - - - 0x00EC6F 03:8C5F: 8D 3D 06
	LDA #$00					;C - - - - - 0x00EC72 03:8C62: A9 00
	STA objY+OSLOT_ENEMY+9				;C - - - - - 0x00EC74 03:8C64: 8D 9D 05
	STA objAnimProgress+OSLOT_ENEMY+9				;C - - - - - 0x00EC77 03:8C67: 8D DD 06
	STA objAnimTimer+OSLOT_ENEMY+9				;C - - - - - 0x00EC7A 03:8C6A: 8D B5 06
	CPY #$05					;C - - - - - 0x00EC7D 03:8C6D: C0 05
	BCS CODE_078C76				;C - - - - - 0x00EC7F 03:8C6F: B0 05
		LDA #$01					;C - - - - - 0x00EC81 03:8C71: A9 01
		STA objAttr+OSLOT_ENEMY+9				;C - - - - - 0x00EC83 03:8C73: 8D 05 07
CODE_078C76:
	TYA							;C - - - - - 0x00EC86 03:8C76: 98
	ASL							;C - - - - - 0x00EC87 03:8C77: 0A
	TAX							;C - - - - - 0x00EC88 03:8C78: AA
	LDA BigRewardPalettes,X			;C - - - - - 0x00EC89 03:8C79: BD CE BD
	STA scratch8				;C - - - - - 0x00EC8C 03:8C7C: 85 08
	LDA BigRewardPalettes+1,X			;C - - - - - 0x00EC8E 03:8C7E: BD CF BD
	STA scratch9				;C - - - - - 0x00EC91 03:8C81: 85 09
	LDY #$00					;C - - - - - 0x00EC93 03:8C83: A0 00
	LDA (scratch8),Y			;C - - - - - 0x00EC95 03:8C85: B1 08
	STA scratch0				;C - - - - - 0x00EC97 03:8C87: 85 00
CODE_078C89:
	INY							;C - - - - - 0x00EC99 03:8C89: C8
	LDA (scratch8),Y			;C - - - - - 0x00EC9A 03:8C8A: B1 08
	STA colorBuffer+COL_SPR+3,Y				;C - - - - - 0x00EC9C 03:8C8C: 99 13 03
	CPY scratch0				;C - - - - - 0x00EC9F 03:8C8F: C4 00
	BCC CODE_078C89				;C - - - - - 0x00ECA1 03:8C91: 90 F6

	INC ram_054D				;C - - - - - 0x00ECA3 03:8C93: EE 4D 05
	JMP CODE_078D2C				;C - - - - - 0x00ECA6 03:8C96: 4C 2C 8D
CODE_078C99:
	CMP #$01					;C - - - - - 0x00ECA9 03:8C99: C9 01
	BEQ CODE_078CA4				;C - - - - - 0x00ECAB 03:8C9B: F0 07
		;Unreached
		LDA #$F4					;- - - - - - 0x00ECAD 03:8C9D: A9
		STA objY+OSLOT_ENEMY+9				;- - - - - - 0x00ECAF 03:8C9F: 8D
		BNE CODE_078CCE				;- - - - - - 0x00ECB2 03:8CA2: D0
CODE_078CA4:
	LDY objState+OSLOT_ENEMY+9				;C - - - - - 0x00ECB4 03:8CA4: AC 75 05
	LDA enemyType				;C - - - - - 0x00ECB7 03:8CA7: A5 98
	CMP #$23					;C - - - - - 0x00ECB9 03:8CA9: C9 23
	BEQ CODE_078CB7				;C - - - - - 0x00ECBB 03:8CAB: F0 0A
		LDA DATA_078F08,Y			;C - - - - - 0x00ECBD 03:8CAD: B9 08 8F
		ADC #$20					;C - - - - - 0x00ECC0 03:8CB0: 69 20
		STA scratch0				;C - - - - - 0x00ECC2 03:8CB2: 85 00
		JMP CODE_078CBC				;C - - - - - 0x00ECC4 03:8CB4: 4C BC 8C
CODE_078CB7:
	LDA DATA_078F08,Y			;C - - - - - 0x00ECC7 03:8CB7: B9 08 8F
	STA scratch0				;C - - - - - 0x00ECCA 03:8CBA: 85 00
CODE_078CBC:
	LDA objY+OSLOT_ENEMY+9				;C - - - - - 0x00ECCC 03:8CBC: AD 9D 05
	CLC							;C - - - - - 0x00ECCF 03:8CBF: 18
	ADC #$04					;C - - - - - 0x00ECD0 03:8CC0: 69 04
	STA objY+OSLOT_ENEMY+9				;C - - - - - 0x00ECD2 03:8CC2: 8D 9D 05
	CMP scratch0				;C - - - - - 0x00ECD5 03:8CC5: C5 00
	BCC CODE_078CCE				;C - - - - - 0x00ECD7 03:8CC7: 90 05
		LDA scratch0				;C - - - - - 0x00ECD9 03:8CC9: A5 00
		STA objY+OSLOT_ENEMY+9				;C - - - - - 0x00ECDB 03:8CCB: 8D 9D 05
CODE_078CCE:
	LDY objState+OSLOT_ENEMY+9				;C - - - - - 0x00ECDE 03:8CCE: AC 75 05
	LDA DATA_078EFE,Y			;C - - - - - 0x00ECE1 03:8CD1: B9 FE 8E
	STA scratch2				;C - - - - - 0x00ECE4 03:8CD4: 85 02
	LDA DATA_078EF4,Y			;C - - - - - 0x00ECE6 03:8CD6: B9 F4 8E
	STA scratch3				;C - - - - - 0x00ECE9 03:8CD9: 85 03
	LDA #$12					;C - - - - - 0x00ECEB 03:8CDB: A9 12
	STA scratch4				;C - - - - - 0x00ECED 03:8CDD: 85 04
	JSR CODE_078BC5				;C - - - - - 0x00ECEF 03:8CDF: 20 C5 8B

	LDA objState+OSLOT_ENEMY+9				;C - - - - - 0x00ECF2 03:8CE2: AD 75 05
	CMP #$80					;C - - - - - 0x00ECF5 03:8CE5: C9 80
	BCC CODE_078D2C				;C - - - - - 0x00ECF7 03:8CE7: 90 43

	AND #$7F					;C - - - - - 0x00ECF9 03:8CE9: 29 7F
	TAY							;C - - - - - 0x00ECFB 03:8CEB: A8
	CPY #5					;C - - - - - 0x00ECFC 03:8CEC: C0 05
	BCS CODE_078CF7				;C - - - - - 0x00ECFE 03:8CEE: B0 07
		LDA powerUps				;C - - - - - 0x00ED00 03:8CF0: A5 DE
		ORA BonusGamePowerups,Y			;C - - - - - 0x00ED02 03:8CF2: 19 69 8F
		STA powerUps				;C - - - - - 0x00ED05 03:8CF5: 85 DE
CODE_078CF7:
	LDA DATA_078F6E,Y			;C - - - - - 0x00ED07 03:8CF7: B9 6E 8F
	STA roundFlags				;C - - - - - 0x00ED0A 03:8CFA: 8D 71 04
	LDX DATA_04BE73,Y			;C - - - - - 0x00ED0D 03:8CFD: BE 73 BE
	LDA DATA_04BE69,Y			;C - - - - - 0x00ED10 03:8D00: B9 69 BE
	STA scoreAdditionDigits,X				;C - - - - - 0x00ED13 03:8D03: 9D A1 04
	TYA							;C - - - - - 0x00ED16 03:8D06: 98
	PHA							;C - - - - - 0x00ED17 03:8D07: 48
	JSR AddScore				;C - - - - - 0x00ED18 03:8D08: 20 C7 FE
	PLA							;C - - - - - 0x00ED1B 03:8D0B: 68
	TAY							;C - - - - - 0x00ED1C 03:8D0C: A8
	LDA #snRoundItem_ID					;C - - - - - 0x00ED1D 03:8D0D: A9 0A
	STA a:soundTrigger				;C - - - - - 0x00ED1F 03:8D0F: 8D E1 00
	LDA #$00					;C - - - - - 0x00ED22 03:8D12: A9 00
	STA objAnimHI+OSLOT_ENEMY+9				;C - - - - - 0x00ED24 03:8D14: 8D 2D 07
	STA objState+OSLOT_ENEMY+9				;C - - - - - 0x00ED27 03:8D17: 8D 75 05
	LDA roundSkelDelay				;C - - - - - 0x00ED2A 03:8D1A: A5 6D
	BEQ CODE_078D23				;C - - - - - 0x00ED2C 03:8D1C: F0 05
		LDA #$05					;C - - - - - 0x00ED2E 03:8D1E: A9 05
		STA roundNumberDuration				;C - - - - - 0x00ED30 03:8D20: 8D 73 04
CODE_078D23:
	CPY #$01					;C - - - - - 0x00ED33 03:8D23: C0 01
	BNE CODE_078D2C				;C - - - - - 0x00ED35 03:8D25: D0 05
		;Unreached
		LDA #$00					;- - - - - - 0x00ED37 03:8D27: A9
		STA ram_054D				;- - - - - - 0x00ED39 03:8D29: 8D
CODE_078D2C:
	RTS							;C - - - - - 0x00ED3C 03:8D2C: 60

CODE_078D2D:
	LDX #$00					;C - - - - - 0x00ED3D 03:8D2D: A2 00
CODE_078D2F:
	LDA ram_054D				;C - - - - - 0x00ED3F 03:8D2F: AD 4D 05
	BEQ CODE_078D3A				;C - - - - - 0x00ED42 03:8D32: F0 06
	CMP #$01					;C - - - - - 0x00ED44 03:8D34: C9 01
	BEQ CODE_078D40				;C - - - - - 0x00ED46 03:8D36: F0 08
		;Unreached
		BNE CODE_078D43				;- - - - - - 0x00ED48 03:8D38: D0
CODE_078D3A:
	JSR SpawnBonusReward				;C - - - - - 0x00ED4A 03:8D3A: 20 DF 8D
	JMP CODE_078D4D				;C - - - - - 0x00ED4D 03:8D3D: 4C 4D 8D
CODE_078D40:
	JSR CODE_078DB0				;C - - - - - 0x00ED50 03:8D40: 20 B0 8D
CODE_078D43:
	JSR CODE_078D5C				;C - - - - - 0x00ED53 03:8D43: 20 5C 8D
	LDA objState+OSLOT_ENEMY+4,X				;C - - - - - 0x00ED56 03:8D46: BD 70 05
	BEQ CODE_078D4D				;C - - - - - 0x00ED59 03:8D49: F0 02
		INC scratch0				;C - - - - - 0x00ED5B 03:8D4B: E6 00
CODE_078D4D:
	INX							;C - - - - - 0x00ED5D 03:8D4D: E8
	CPX #$05					;C - - - - - 0x00ED5E 03:8D4E: E0 05
	BCC CODE_078D2F				;C - - - - - 0x00ED60 03:8D50: 90 DD

	LDA scratch0				;C - - - - - 0x00ED62 03:8D52: A5 00
	BNE CODE_078D5B				;C - - - - - 0x00ED64 03:8D54: D0 05
		LDA #$05					;C - - - - - 0x00ED66 03:8D56: A9 05
		STA roundNumberDuration				;C - - - - - 0x00ED68 03:8D58: 8D 73 04
CODE_078D5B:
	RTS							;C - - - - - 0x00ED6B 03:8D5B: 60

CODE_078D5C:
	LDA objState+OSLOT_ENEMY+4,X				;C - - - - - 0x00ED6C 03:8D5C: BD 70 05
	BEQ CODE_078DAF				;C - - - - - 0x00ED6F 03:8D5F: F0 4E

	LDA #$16					;C - - - - - 0x00ED71 03:8D61: A9 16
	STA scratch2				;C - - - - - 0x00ED73 03:8D63: 85 02
	LDA #$16					;C - - - - - 0x00ED75 03:8D65: A9 16
	STA scratch3				;C - - - - - 0x00ED77 03:8D67: 85 03
	TXA							;C - - - - - 0x00ED79 03:8D69: 8A
	CLC							;C - - - - - 0x00ED7A 03:8D6A: 18
	ADC #$0D					;C - - - - - 0x00ED7B 03:8D6B: 69 0D
	STA scratch4				;C - - - - - 0x00ED7D 03:8D6D: 85 04
	JSR CODE_078BC5				;C - - - - - 0x00ED7F 03:8D6F: 20 C5 8B
	LDA objState+OSLOT_ENEMY+4,X				;C - - - - - 0x00ED82 03:8D72: BD 70 05
	CMP #$50					;C - - - - - 0x00ED85 03:8D75: C9 50
	BCC CODE_078DAF				;C - - - - - 0x00ED87 03:8D77: 90 36

	AND #$7F					;C - - - - - 0x00ED89 03:8D79: 29 7F
	STA objState+OSLOT_ENEMY+4,X				;C - - - - - 0x00ED8B 03:8D7B: 9D 70 05
	CMP #$02					;C - - - - - 0x00ED8E 03:8D7E: C9 02
	BEQ CODE_078D9F				;C - - - - - 0x00ED90 03:8D80: F0 1D
	LDA #$01					;C - - - - - 0x00ED92 03:8D82: A9 01
	STA scoreAdditionDigits+4				;C - - - - - 0x00ED94 03:8D84: 8D A5 04
	TXA							;C - - - - - 0x00ED97 03:8D87: 8A
	PHA							;C - - - - - 0x00ED98 03:8D88: 48
	JSR AddScore				;C - - - - - 0x00ED99 03:8D89: 20 C7 FE
	PLA							;C - - - - - 0x00ED9C 03:8D8C: 68
	TAX							;C - - - - - 0x00ED9D 03:8D8D: AA
	LDA objState+OSLOT_ENEMY+4,X				;C - - - - - 0x00ED9E 03:8D8E: BD 70 05
	CMP #$01					;C - - - - - 0x00EDA1 03:8D91: C9 01
	BNE CODE_078DA2				;C - - - - - 0x00EDA3 03:8D93: D0 0D
		;Unreached
		LDA #PLAYER_STATE_SLUGGISH		;- - - - - - 0x00EDA5 03:8D95: A9
		STA playerState				;- - - - - - 0x00EDA7 03:8D97: 85
		LDA #$00					;- - - - - - 0x00EDA9 03:8D99: A9
		STA ram_0076				;- - - - - - 0x00EDAB 03:8D9B: 85
		BEQ CODE_078DA2				;- - - - - - 0x00EDAD 03:8D9D: F0
CODE_078D9F:
	JSR CollectLife				;- - - - - - 0x00EDAF 03:8D9F: 20
CODE_078DA2:
	LDA #snReward_ID					;C - - - - - 0x00EDB2 03:8DA2: A9 28
	STA a:soundTrigger			;C - - - - - 0x00EDB4 03:8DA4: 8D E1 00
	LDA #$00					;C - - - - - 0x00EDB7 03:8DA7: A9 00
	STA objState+OSLOT_ENEMY+4,X				;C - - - - - 0x00EDB9 03:8DA9: 9D 70 05
	STA objAnimHI+OSLOT_ENEMY+4,X				;C - - - - - 0x00EDBC 03:8DAC: 9D 28 07
CODE_078DAF:
	RTS							;C - - - - - 0x00EDBF 03:8DAF: 60

CODE_078DB0:
	LDA objState+OSLOT_ENEMY+4,X				;C - - - - - 0x00EDC0 03:8DB0: BD 70 05
	BEQ CODE_078DDE				;C - - - - - 0x00EDC3 03:8DB3: F0 29

	LDA objY+OSLOT_ENEMY+4,X				;C - - - - - 0x00EDC5 03:8DB5: BD 98 05
	CLC							;C - - - - - 0x00EDC8 03:8DB8: 18
	ADC #$03					;C - - - - - 0x00EDC9 03:8DB9: 69 03
	STA objY+OSLOT_ENEMY+4,X				;C - - - - - 0x00EDCB 03:8DBB: 9D 98 05

	LDA powerUps				;C - - - - - 0x00EDCE 03:8DBE: A5 DE
	AND #POWERUP_BIG_COIN					;C - - - - - 0x00EDD0 03:8DC0: 29 10
	BNE CODE_078DD2				;C - - - - - 0x00EDD2 03:8DC2: D0 0E
		LDA objY+OSLOT_ENEMY+4,X				;C - - - - - 0x00EDD4 03:8DC4: BD 98 05
		CMP #200					;C - - - - - 0x00EDD7 03:8DC7: C9 C8
		BCC CODE_078DDE				;C - - - - - 0x00EDD9 03:8DC9: 90 13
			LDA #200					;C - - - - - 0x00EDDB 03:8DCB: A9 C8
			STA objY+OSLOT_ENEMY+4,X				;C - - - - - 0x00EDDD 03:8DCD: 9D 98 05
			BNE CODE_078DDE				;C - - - - - 0x00EDE0 03:8DD0: D0 0C
CODE_078DD2:
	;Unreached
	LDA objY+OSLOT_ENEMY+4,X				;- - - - - - 0x00EDE2 03:8DD2: BD
	CMP #$A8					;- - - - - - 0x00EDE5 03:8DD5: C9
	BCC CODE_078DDE				;- - - - - - 0x00EDE7 03:8DD7: 90
		LDA #$A8					;- - - - - - 0x00EDE9 03:8DD9: A9
		STA objY+OSLOT_ENEMY+4,X				;- - - - - - 0x00EDEB 03:8DDB: 9D
CODE_078DDE:
	RTS							;C - - - - - 0x00EDEE 03:8DDE: 60

SpawnBonusReward:
	;X: Reward index (occupy enemy slot 4+X)
	LDA bonusRewardEarned				;C - - - - - 0x00EDEF 03:8DDF: AD 51 05
	BNE CODE_078DEE				;C - - - - - 0x00EDF2 03:8DE2: D0 0A
		;Unreached
		LDA powerUps				;- - - - - - 0x00EDF4 03:8DE4: A5
		AND #POWERUP_BIG_COIN|POWERUP_BIG_DIAMOND					;- - - - - - 0x00EDF6 03:8DE6: 29
		BEQ CODE_078DF6				;- - - - - - 0x00EDF8 03:8DE8: F0
			AND #POWERUP_BIG_COIN					;- - - - - - 0x00EDFA 03:8DEA: 29
			BNE CODE_078DF2				;- - - - - - 0x00EDFC 03:8DEC: D0
CODE_078DEE:
	;Diamond or earned: ?
	LDA #$03					;C - - - - - 0x00EDFE 03:8DEE: A9 03
	BNE CODE_078DF8				;C - - - - - 0x00EE00 03:8DF0: D0 06
CODE_078DF2:
	;Unreached
	;Coin: Dolls
	LDA #$02					;- - - - - - 0x00EE02 03:8DF2: A9
	BNE CODE_078DF8				;- - - - - - 0x00EE04 03:8DF4: D0
CODE_078DF6:
	;Unreached
	;Not coin or diamond
	LDA #$01					;- - - - - - 0x00EE06 03:8DF6: A9
CODE_078DF8:
	;Runs when bonus fruit drops at end of a round
	;Y: Reward index
	STA objState+OSLOT_ENEMY+4,X				;C - - - - - 0x00EE08 03:8DF8: 9D 70 05
	TAY							;C - - - - - 0x00EE0B 03:8DFB: A8

	LDA BonusRewardsX,X			;C - - - - - 0x00EE0C 03:8DFC: BD 1F BF
	STA objX+OSLOT_ENEMY+4,X				;C - - - - - 0x00EE0F 03:8DFF: 9D C0 05

	LDA #$00					;C - - - - - 0x00EE12 03:8E02: A9 00
	STA objY+OSLOT_ENEMY+4,X				;C - - - - - 0x00EE14 03:8E04: 9D 98 05

	LDA BonusRewardsAnim,Y			;C - - - - - 0x00EE17 03:8E07: B9 78 8F
	STA objAnim+OSLOT_ENEMY+4,X				;C - - - - - 0x00EE1A 03:8E0A: 9D 88 06

	LDA BonusRewardsAnimHI,Y			;C - - - - - 0x00EE1D 03:8E0D: B9 7C 8F
	STA objAnimHI+OSLOT_ENEMY+4,X				;C - - - - - 0x00EE20 03:8E10: 9D 28 07

	LDA BonusRewardsChrSlot,Y			;C - - - - - 0x00EE23 03:8E13: B9 8C 8F
	STA objChrSlot+OSLOT_ENEMY+4,X				;C - - - - - 0x00EE26 03:8E16: 9D 38 06

	LDA #$00					;C - - - - - 0x00EE29 03:8E19: A9 00
	STA objAnimProgress+OSLOT_ENEMY+4,X				;C - - - - - 0x00EE2B 03:8E1B: 9D D8 06
	STA objAnimTimer+OSLOT_ENEMY+4,X				;C - - - - - 0x00EE2E 03:8E1E: 9D B0 06

	LDA #chrFlood_ID					;C - - - - - 0x00EE31 03:8E21: A9 53
	STA chrBankD				;C - - - - - 0x00EE33 03:8E23: 85 4E
	CPY #$03					;C - - - - - 0x00EE35 03:8E25: C0 03
	BCC CODE_078E36				;C - - - - - 0x00EE37 03:8E27: 90 0D
		LDA bonusRewardEnemyType				;C - - - - - 0x00EE39 03:8E29: AD 52 05
		CMP #ENEMY_GHOSTMONSTA					;C - - - - - 0x00EE3C 03:8E2C: C9 24
		BNE CODE_078E32				;C - - - - - 0x00EE3E 03:8E2E: D0 02
			LDA #ENEMY_MONSTA					;C - - - - - 0x00EE40 03:8E30: A9 07
	CODE_078E32:
		CLC							;C - - - - - 0x00EE42 03:8E32: 18
		ADC #$02					;C - - - - - 0x00EE43 03:8E33: 69 02
		TAY							;C - - - - - 0x00EE45 03:8E35: A8
CODE_078E36:
	CPY #$0C					;C - - - - - 0x00EE46 03:8E36: C0 0C
	BCC CODE_078E3C				;C - - - - - 0x00EE48 03:8E38: 90 02
		;Unreached
		LDY #$09					;- - - - - - 0x00EE4A 03:8E3A: A0
CODE_078E3C:
	LDA BonusRewardsAttr,Y			;C - - - - - 0x00EE4C 03:8E3C: B9 80 8F
	STA objAttr+OSLOT_ENEMY+4,X				;C - - - - - 0x00EE4F 03:8E3F: 9D 00 07

	LDA objState+OSLOT_ENEMY+4,X				;C - - - - - 0x00EE52 03:8E42: BD 70 05
	CMP #$03					;C - - - - - 0x00EE55 03:8E45: C9 03
	BNE CODE_078E4E				;C - - - - - 0x00EE57 03:8E47: D0 05
		LDA #$0D					;C - - - - - 0x00EE59 03:8E49: A9 0D
		STA objState+OSLOT_ENEMY+4,X				;C - - - - - 0x00EE5B 03:8E4B: 9D 70 05
CODE_078E4E:
	CPX #$04					;C - - - - - 0x00EE5E 03:8E4E: E0 04
	BNE CODE_078E55				;C - - - - - 0x00EE60 03:8E50: D0 03
		INC ram_054D				;C - - - - - 0x00EE62 03:8E52: EE 4D 05
CODE_078E55:
	RTS							;C - - - - - 0x00EE65 03:8E55: 60

CODE_078E56:
	LDA #$01					;C - - - - - 0x00EE66 03:8E56: A9 01
	STA objChrSlot+OSLOT_ENEMY+9				;C - - - - - 0x00EE68 03:8E58: 8D 3D 06
	LDX objState+OSLOT_ENEMY+9				;C - - - - - 0x00EE6B 03:8E5B: AE 75 05
	LDA DATA_078F3B,X			;C - - - - - 0x00EE6E 03:8E5E: BD 3B 8F
	STA objAnim+OSLOT_ENEMY+9				;C - - - - - 0x00EE71 03:8E61: 8D 8D 06
	LDA #.HIBYTE(anHeart_ID)					;C - - - - - 0x00EE74 03:8E64: A9 01
	STA objAnimHI+OSLOT_ENEMY+9				;C - - - - - 0x00EE76 03:8E66: 8D 2D 07
	LDA #$00					;C - - - - - 0x00EE79 03:8E69: A9 00
	STA objAnimProgress+OSLOT_ENEMY+9				;C - - - - - 0x00EE7B 03:8E6B: 8D DD 06
	STA objAnimTimer+OSLOT_ENEMY+9				;C - - - - - 0x00EE7E 03:8E6E: 8D B5 06
	LDY currentRound				;C - - - - - 0x00EE81 03:8E71: A4 D8
	LDA RoundsItemX,Y			;C - - - - - 0x00EE83 03:8E73: B9 7D BE
	STA objX+OSLOT_ENEMY+9				;C - - - - - 0x00EE86 03:8E76: 8D C5 05
	LDA RoundsItemY,Y			;C - - - - - 0x00EE89 03:8E79: B9 CE BE
	SEC							;C - - - - - 0x00EE8C 03:8E7C: 38
	SBC #$10					;C - - - - - 0x00EE8D 03:8E7D: E9 10
	STA objY+OSLOT_ENEMY+9				;C - - - - - 0x00EE8F 03:8E7F: 8D 9D 05
	LDA #$00					;C - - - - - 0x00EE92 03:8E82: A9 00
	STA objAttr+OSLOT_ENEMY+9				;C - - - - - 0x00EE94 03:8E84: 8D 05 07
	INC ram_053E				;C - - - - - 0x00EE97 03:8E87: EE 3E 05
	RTS							;C - - - - - 0x00EE9A 03:8E8A: 60

CODE_078E8B:
	LDA roundBubbleVariant				;C - - - - - 0x00EE9B 03:8E8B: A5 82
	AND #$0F					;C - - - - - 0x00EE9D 03:8E8D: 29 0F
	STA objState+OSLOT_ENEMY+9				;C - - - - - 0x00EE9F 03:8E8F: 8D 75 05
	TAY							;C - - - - - 0x00EEA2 03:8E92: A8
	LDA DrinkAnim,Y			;C - - - - - 0x00EEA3 03:8E93: B9 F0 BF
	STA objAnim+OSLOT_ENEMY+9				;C - - - - - 0x00EEA6 03:8E96: 8D 8D 06
	LDA DrinkAnimHI,Y			;C - - - - - 0x00EEA9 03:8E99: B9 F7 BF
	STA objAnimHI+OSLOT_ENEMY+9				;C - - - - - 0x00EEAC 03:8E9C: 8D 2D 07

	LDY currentRound				;C - - - - - 0x00EEAF 03:8E9F: A4 D8
	LDA RoundsItemY,Y			;C - - - - - 0x00EEB1 03:8EA1: B9 CE BE
	STA objY+OSLOT_ENEMY+9				;C - - - - - 0x00EEB4 03:8EA4: 8D 9D 05
	LDA RoundsItemX,Y			;C - - - - - 0x00EEB7 03:8EA7: B9 7D BE
	STA objX+OSLOT_ENEMY+9				;C - - - - - 0x00EEBA 03:8EAA: 8D C5 05
	LDA #$01					;C - - - - - 0x00EEBD 03:8EAD: A9 01
	STA objChrSlot+OSLOT_ENEMY+9				;C - - - - - 0x00EEBF 03:8EAF: 8D 3D 06
	LDA #$00					;C - - - - - 0x00EEC2 03:8EB2: A9 00
	STA objAnimProgress+OSLOT_ENEMY+9				;C - - - - - 0x00EEC4 03:8EB4: 8D DD 06
	STA objAnimTimer+OSLOT_ENEMY+9				;C - - - - - 0x00EEC7 03:8EB7: 8D B5 06
	INC ram_054C				;C - - - - - 0x00EECA 03:8EBA: EE 4C 05
	RTS							;C - - - - - 0x00EECD 03:8EBD: 60

CODE_078EBE:
	DEC ram_0550				;C - - - - - 0x00EECE 03:8EBE: CE 50 05
	LDA ram_0550				;C - - - - - 0x00EED1 03:8EC1: AD 50 05
	AND #$01					;C - - - - - 0x00EED4 03:8EC4: 29 01
	BNE CODE_078EDE				;C - - - - - 0x00EED6 03:8EC6: D0 16
		LDA #.LOBYTE(SetRoundPalette)					;C - - - - - 0x00EED8 03:8EC8: A9 7E
		STA bankedSub				;C - - - - - 0x00EEDA 03:8ECA: 85 55
		LDA #.HIBYTE(SetRoundPalette)					;C - - - - - 0x00EEDC 03:8ECC: A9 83
		STA bankedSub+1				;C - - - - - 0x00EEDE 03:8ECE: 85 56
		LDA #.BANK(SetRoundPalette)					;C - - - - - 0x00EEE0 03:8ED0: A9 08
		STA bankedSubBank				;C - - - - - 0x00EEE2 03:8ED2: 85 57
		LDA #.BANK(*)					;C - - - - - 0x00EEE4 03:8ED4: A9 07
		STA bankedSubRetBank				;C - - - - - 0x00EEE6 03:8ED6: 85 58
		JSR RunBankedSub				;C - - - - - 0x00EEE8 03:8ED8: 20 72 E7
		JMP CODE_078EEF				;C - - - - - 0x00EEEB 03:8EDB: 4C EF 8E
CODE_078EDE:
	LDX #$00					;C - - - - - 0x00EEEE 03:8EDE: A2 00
CODE_078EE0:
	TXA							;C - - - - - 0x00EEF0 03:8EE0: 8A
	AND #$03					;C - - - - - 0x00EEF1 03:8EE1: 29 03
	TAY							;C - - - - - 0x00EEF3 03:8EE3: A8
	LDA DATA_078EF0,Y			;C - - - - - 0x00EEF4 03:8EE4: B9 F0 8E
	STA colorBuffer,X				;C - - - - - 0x00EEF7 03:8EE7: 9D 00 03
	INX							;C - - - - - 0x00EEFA 03:8EEA: E8
	CPX #$10					;C - - - - - 0x00EEFB 03:8EEB: E0 10
	BNE CODE_078EE0				;C - - - - - 0x00EEFD 03:8EED: D0 F1

CODE_078EEF:
	RTS							;C - - - - - 0x00EEFF 03:8EEF: 60

DATA_078EF0:
	.byte $30					;- D 0 - - - 0x00EF00 03:8EF0: 30
	.byte $0F					;- D 0 - - - 0x00EF01 03:8EF1: 0F
	.byte $10					;- D 0 - - - 0x00EF02 03:8EF2: 10
	.byte $20					;- D 0 - - - 0x00EF03 03:8EF3: 20
DATA_078EF4:
	.byte $00					;- - - - - - 0x00EF04 03:8EF4: 00
	.byte $10					;- - - - - - 0x00EF05 03:8EF5: 10
	.byte $10					;- D 0 - - - 0x00EF06 03:8EF6: 10
	.byte $10					;- D 0 - - - 0x00EF07 03:8EF7: 10
	.byte $10					;- - - - - - 0x00EF08 03:8EF8: 10
	.byte $10					;- D 0 - - - 0x00EF09 03:8EF9: 10
	.byte $18					;- - - - - - 0x00EF0A 03:8EFA: 18
	.byte $18					;- - - - - - 0x00EF0B 03:8EFB: 18
	.byte $18					;- D 0 - - - 0x00EF0C 03:8EFC: 18
	.byte $10					;- - - - - - 0x00EF0D 03:8EFD: 10
DATA_078EFE:
	.byte $00					;- - - - - - 0x00EF0E 03:8EFE: 00
	.byte $10					;- - - - - - 0x00EF0F 03:8EFF: 10
	.byte $10					;- D 0 - - - 0x00EF10 03:8F00: 10
	.byte $10					;- D 0 - - - 0x00EF11 03:8F01: 10
	.byte $10					;- - - - - - 0x00EF12 03:8F02: 10
	.byte $10					;- D 0 - - - 0x00EF13 03:8F03: 10
	.byte $0C					;- - - - - - 0x00EF14 03:8F04: 0C
	.byte $0C					;- - - - - - 0x00EF15 03:8F05: 0C
	.byte $0C					;- D 0 - - - 0x00EF16 03:8F06: 0C
	.byte $0C					;- - - - - - 0x00EF17 03:8F07: 0C
DATA_078F08:
	.byte $00					;- - - - - - 0x00EF18 03:8F08: 00
	.byte $A8					;- - - - - - 0x00EF19 03:8F09: A8
	.byte $A8					;- D 0 - - - 0x00EF1A 03:8F0A: A8
	.byte $A8					;- D 0 - - - 0x00EF1B 03:8F0B: A8
	.byte $A8					;- - - - - - 0x00EF1C 03:8F0C: A8
	.byte $A0					;- D 0 - - - 0x00EF1D 03:8F0D: A0
	.byte $98					;- - - - - - 0x00EF1E 03:8F0E: 98
	.byte $A0					;- - - - - - 0x00EF1F 03:8F0F: A0
	.byte $9A					;- D 0 - - - 0x00EF20 03:8F10: 9A
	.byte $A0					;- - - - - - 0x00EF21 03:8F11: A0
DATA_078F12:
	.byte $09					;- D 0 - - - 0x00EF22 03:8F12: 09
	.byte $01					;- D 0 - - - 0x00EF23 03:8F13: 01
	.byte $01					;- D 0 - - - 0x00EF24 03:8F14: 01
	.byte $13					;- D 0 - - - 0x00EF25 03:8F15: 13
	.byte $0F					;- D 0 - - - 0x00EF26 03:8F16: 0F
	.byte $06					;- D 0 - - - 0x00EF27 03:8F17: 06
	.byte $09					;- D 0 - - - 0x00EF28 03:8F18: 09
	.byte $31					;- D 0 - - - 0x00EF29 03:8F19: 31
	.byte $01					;- D 0 - - - 0x00EF2A 03:8F1A: 01
	.byte $06					;- D 0 - - - 0x00EF2B 03:8F1B: 06
	.byte $03					;- D 0 - - - 0x00EF2C 03:8F1C: 03
	.byte $13					;- D 0 - - - 0x00EF2D 03:8F1D: 13
	.byte $01					;- D 0 - - - 0x00EF2E 03:8F1E: 01

RoundItemCollectHandlers:
	;- - - - - - 0x00EF2F 03:8F1F: 89
	.word CollectPlaceholder
	.word CollectHeart
	.word CollectHolyCup
	.word CollectSecretDoor
	.word CollectPencil
	.word CollectCrystal
	.word CollectStarRod
	.word CollectShoe
	.word CollectCandy
	.word CollectLife
	.word CollectClock
	.word CollectStaff
	.word CollectTree
	.word CollectParasol

DATA_078F3B:
	.byte $00									;- - - - - - 0x00EF4B 03:8F3B: 00
	.byte .LOBYTE(anHeart_ID)					;- D 0 - - - 0x00EF4C 03:8F3C: 11
	.byte .LOBYTE(anHolyCup_ID)					;- D 0 - - - 0x00EF4D 03:8F3D: 12
	.byte .LOBYTE(anSecretDoor_ID)					;- D 0 - - - 0x00EF4E 03:8F3E: 13
	.byte .LOBYTE(anPencil_ID)					;- D 0 - - - 0x00EF4F 03:8F3F: 14
	.byte .LOBYTE(anCrystal_ID)					;- D 0 - - - 0x00EF50 03:8F40: 15
	.byte .LOBYTE(anStarRod_ID)					;- - - - - - 0x00EF51 03:8F41: 16
	.byte .LOBYTE(anShoe_ID)					;- D 0 - - - 0x00EF52 03:8F42: 17
	.byte .LOBYTE(anCandy_ID)					;- D 0 - - - 0x00EF53 03:8F43: 18
	.byte .LOBYTE(anJrDoll_ID)					;- - - - - - 0x00EF54 03:8F44: 19
	.byte .LOBYTE(anClock_ID)					;- D 0 - - - 0x00EF55 03:8F45: 1A
	.byte .LOBYTE(anStaff_ID)					;- - - - - - 0x00EF56 03:8F46: 1B
	.byte .LOBYTE(anTree_ID)					;- D 0 - - - 0x00EF57 03:8F47: 1C
	.byte .LOBYTE(anParasol_ID)					;- D 0 - - - 0x00EF58 03:8F48: 1D

BigRewardTable:
	;Pick from these if in bonus game
	.byte $01					;- - - - - - 0x00EF59 03:8F49: 01
	.byte $02					;- - - - - - 0x00EF5A 03:8F4A: 02
	.byte $03					;- - - - - - 0x00EF5B 03:8F4B: 03
	.byte $04					;- - - - - - 0x00EF5C 03:8F4C: 04
	.byte $02					;- - - - - - 0x00EF5D 03:8F4D: 02
	.byte $03					;- D 0 - - - 0x00EF5E 03:8F4E: 03
	.byte $04					;- - - - - - 0x00EF5F 03:8F4F: 04
	.byte $01					;- - - - - - 0x00EF60 03:8F50: 01
	.byte $01					;- - - - - - 0x00EF61 03:8F51: 01
	.byte $04					;- - - - - - 0x00EF62 03:8F52: 04
	.byte $03					;- D 0 - - - 0x00EF63 03:8F53: 03
	.byte $02					;- - - - - - 0x00EF64 03:8F54: 02
	.byte $04					;- - - - - - 0x00EF65 03:8F55: 04
	.byte $03					;- - - - - - 0x00EF66 03:8F56: 03
	.byte $02					;- D 0 - - - 0x00EF67 03:8F57: 02
	.byte $01					;- - - - - - 0x00EF68 03:8F58: 01
	;Pick from these if regular round
	.byte $05					;- D 0 - - - 0x00EF69 03:8F59: 05
	.byte $06					;- - - - - - 0x00EF6A 03:8F5A: 06
	.byte $07					;- - - - - - 0x00EF6B 03:8F5B: 07
	.byte $08					;- - - - - - 0x00EF6C 03:8F5C: 08
	.byte $09					;- - - - - - 0x00EF6D 03:8F5D: 09
	.byte $05					;- D 0 - - - 0x00EF6E 03:8F5E: 05
	.byte $06					;- - - - - - 0x00EF6F 03:8F5F: 06
	.byte $07					;- - - - - - 0x00EF70 03:8F60: 07
	.byte $08					;- D 0 - - - 0x00EF71 03:8F61: 08
	.byte $09					;- - - - - - 0x00EF72 03:8F62: 09
	.byte $05					;- - - - - - 0x00EF73 03:8F63: 05
	.byte $06					;- - - - - - 0x00EF74 03:8F64: 06
	.byte $07					;- - - - - - 0x00EF75 03:8F65: 07
	.byte $08					;- - - - - - 0x00EF76 03:8F66: 08
	.byte $09					;- - - - - - 0x00EF77 03:8F67: 09
	.byte $05					;- D 0 - - - 0x00EF78 03:8F68: 05

BonusGamePowerups:
	;- - - - - - 0x00EF79 03:8F69: 00
	.byte POWERUP_NONE
	.byte POWERUP_BIG_COIN
	.byte POWERUP_BIG_BELL
	.byte POWERUP_BIG_TRIANGLE
	.byte POWERUP_BIG_DIAMOND

DATA_078F6E:
	.byte $00					;- - - - - - 0x00EF7E 03:8F6E: 00
	.byte $58					;- - - - - - 0x00EF7F 03:8F6F: 58
	.byte $18					;- D 0 - - - 0x00EF80 03:8F70: 18
	.byte $18					;- D 0 - - - 0x00EF81 03:8F71: 18
	.byte $18					;- - - - - - 0x00EF82 03:8F72: 18
	.byte $18					;- D 0 - - - 0x00EF83 03:8F73: 18
	.byte $18					;- - - - - - 0x00EF84 03:8F74: 18
	.byte $18					;- - - - - - 0x00EF85 03:8F75: 18
	.byte $18					;- D 0 - - - 0x00EF86 03:8F76: 18
	.byte $18					;- - - - - - 0x00EF87 03:8F77: 18

BonusRewardsAnim:
	.byte $00					;- - - - - - 0x00EF88 03:8F78: 00
	.byte .LOBYTE(anSpinyChestnut_ID)					;- - - - - - 0x00EF89 03:8F79: 1F
	.byte .LOBYTE(anJrDoll_ID)					;- - - - - - 0x00EF8A 03:8F7A: 19
	.byte .LOBYTE(anEnemySpecificReward_ID)					;- D 0 - - - 0x00EF8B 03:8F7B: BE
BonusRewardsAnimHI:
	.byte $00					;- - - - - - 0x00EF8C 03:8F7C: 00
	.byte .HIBYTE(anSpinyChestnut_ID)					;- - - - - - 0x00EF8D 03:8F7D: 01
	.byte .HIBYTE(anJrDoll_ID)					;- - - - - - 0x00EF8E 03:8F7E: 01
	.byte .HIBYTE(anEnemySpecificReward_ID)					;- D 0 - - - 0x00EF8F 03:8F7F: 00

BonusRewardsAttr:
	.byte $00					;- - - - - - 0x00EF90 03:8F80: 00
	.byte $03					;- - - - - - 0x00EF91 03:8F81: 03
	.byte $00					;- - - - - - 0x00EF92 03:8F82: 00
	.byte $02					;- D 0 - - - 0x00EF93 03:8F83: 02
	.byte $03					;- - - - - - 0x00EF94 03:8F84: 03
	.byte $03					;- - - - - - 0x00EF95 03:8F85: 03
	.byte $00					;- - - - - - 0x00EF96 03:8F86: 00
	.byte $03					;- - - - - - 0x00EF97 03:8F87: 03
	.byte $02					;- - - - - - 0x00EF98 03:8F88: 02
	.byte $00					;- D 0 - - - 0x00EF99 03:8F89: 00 ;Also use this for index $C and up
	.byte $03					;- - - - - - 0x00EF9A 03:8F8A: 03
	.byte $00					;- - - - - - 0x00EF9B 03:8F8B: 00

BonusRewardsChrSlot:
	.byte $00					;- - - - - - 0x00EF9C 03:8F8C: 00
	.byte $01					;- - - - - - 0x00EF9D 03:8F8D: 01
	.byte $01					;- - - - - - 0x00EF9E 03:8F8E: 01
	.byte $03					;- D 0 - - - 0x00EF9F 03:8F8F: 03

CODE_078F90:
	LDA vScroll				;C - - - - - 0x00EFA0 03:8F90: A5 29
	CLC							;C - - - - - 0x00EFA2 03:8F92: 18
	ADC #$04					;C - - - - - 0x00EFA3 03:8F93: 69 04
	STA vScroll				;C - - - - - 0x00EFA5 03:8F95: 85 29
	CMP #$F0					;C - - - - - 0x00EFA7 03:8F97: C9 F0
	BCC CODE_078FF4				;C - - - - - 0x00EFA9 03:8F99: 90 59
		LDA #$00					;C - - - - - 0x00EFAB 03:8F9B: A9 00
		STA vScroll				;C - - - - - 0x00EFAD 03:8F9D: 85 29
		LDA vNametable				;C - - - - - 0x00EFAF 03:8F9F: A5 2D
		ADC #$00					;C - - - - - 0x00EFB1 03:8FA1: 69 00
		AND #$01					;C - - - - - 0x00EFB3 03:8FA3: 29 01
		STA vNametable				;C - - - - - 0x00EFB5 03:8FA5: 85 2D

		LDA #.BANK(palBonusGameA)					;C - - - - - 0x00EFB7 03:8FA7: A9 06
.ifdef REGION_JP
		STA prgBankB
		STA $8001
.else
		STA newPrgBank				;C - - - - - 0x00EFB9 03:8FA9: 85 3B
		JSR SwapPrgBankB				;C - - - - - 0x00EFBB 03:8FAB: 20 56 FF
.endif

		LDA currentRound				;C - - - - - 0x00EFBE 03:8FAE: A5 D8
		CMP #$52					;C - - - - - 0x00EFC0 03:8FB0: C9 52
		BEQ CODE_078FC3				;C - - - - - 0x00EFC2 03:8FB2: F0 0F
			LDX #$00					;C - - - - - 0x00EFC4 03:8FB4: A2 00
		CODE_078FB6:
			LDA palBonusGameA,X			;C - - - - - 0x00EFC6 03:8FB6: BD AF BD
			STA colorBuffer,X				;C - - - - - 0x00EFC9 03:8FB9: 9D 00 03
			INX							;C - - - - - 0x00EFCC 03:8FBC: E8
			CPX #$20					;C - - - - - 0x00EFCD 03:8FBD: E0 20
			BCC CODE_078FB6				;C - - - - - 0x00EFCF 03:8FBF: 90 F5
			BCS CODE_078FD0				;C - - - - - 0x00EFD1 03:8FC1: B0 0D
	CODE_078FC3:
		LDX #$00					;C - - - - - 0x00EFD3 03:8FC3: A2 00
	CODE_078FC5:
		LDA palBonusGameB,X			;C - - - - - 0x00EFD5 03:8FC5: BD CF BD
		STA colorBuffer,X				;C - - - - - 0x00EFD8 03:8FC8: 9D 00 03
		INX							;C - - - - - 0x00EFDB 03:8FCB: E8
		CPX #$20					;C - - - - - 0x00EFDC 03:8FCC: E0 20
		BCC CODE_078FC5				;C - - - - - 0x00EFDE 03:8FCE: 90 F5
	CODE_078FD0:
		LDX currentPlayer				;C - - - - - 0x00EFE0 03:8FD0: AE 99 04
		LDA DATA_079001,X			;C - - - - - 0x00EFE3 03:8FD3: BD 01 90
		STA colorBuffer+COL_SPR+3				;C - - - - - 0x00EFE6 03:8FD6: 8D 13 03
		JSR CODE_079204				;C - - - - - 0x00EFE9 03:8FD9: 20 04 92
		JSR CODE_079790				;C - - - - - 0x00EFEC 03:8FDC: 20 90 97
		LDA enemyReward+1				;C - - - - - 0x00EFEF 03:8FDF: A5 8F
		CMP #$02					;C - - - - - 0x00EFF1 03:8FE1: C9 02
		BNE CODE_078FEC				;C - - - - - 0x00EFF3 03:8FE3: D0 07
			JSR CODE_079F52				;C - - - - - 0x00EFF5 03:8FE5: 20 52 9F
			LDA #$44					;C - - - - - 0x00EFF8 03:8FE8: A9 44
			STA enemyReward+9				;C - - - - - 0x00EFFA 03:8FEA: 85 97
	CODE_078FEC:
		LDA #.LOBYTE(CODE_079082)	;C - - - - - 0x00EFFC 03:8FEC: A9 82
		STA nmiBankedSub			;C - - - - - 0x00EFFE 03:8FEE: 85 16
		LDA #.HIBYTE(CODE_079082)	;C - - - - - 0x00F000 03:8FF0: A9 90
		STA nmiBankedSub+1			;C - - - - - 0x00F002 03:8FF2: 85 17
CODE_078FF4:
	LDA globalTimer				;C - - - - - 0x00F004 03:8FF4: A5 14
	AND #$01					;C - - - - - 0x00F006 03:8FF6: 29 01
	BEQ CODE_078FFD				;C - - - - - 0x00F008 03:8FF8: F0 03
		JSR AnimateNonBubbles				;C - - - - - 0x00F00A 03:8FFA: 20 5C EE
CODE_078FFD:
	JSR DrawObjects				;C - - - - - 0x00F00D 03:8FFD: 20 E2 EE
	RTS							;C - - - - - 0x00F010 03:9000: 60

DATA_079001:
	.byte $2A					;- D 0 - - - 0x00F011 03:9001: 2A
	.byte $21					;- - - - - - 0x00F012 03:9002: 21

CODE_079003:
	LDA #.BANK(DATA_06BDEF)					;C - - - - - 0x00F013 03:9003: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00F015 03:9005: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00F017 03:9007: 20 56 FF
.endif

	LDX vNametable				;C - - - - - 0x00F01A 03:900A: A6 2D
	LDA DATA_079048,X			;C - - - - - 0x00F01C 03:900C: BD 48 90
	STA scratch1				;C - - - - - 0x00F01F 03:900F: 85 01
	LDA PPUSTATUS					;C - - - - - 0x00F021 03:9011: AD 02 20
	LDX #$00					;C - - - - - 0x00F024 03:9014: A2 00
CODE_079016:
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x00F026 03:9016: BD 9F 05
	STA scratch0				;C - - - - - 0x00F029 03:9019: 85 00
	LDA scratch1				;C - - - - - 0x00F02B 03:901B: A5 01
	STA PPUADDR				;C - - - - - 0x00F02D 03:901D: 8D 06 20
	LDA DATA_06BDEF,X			;C - - - - - 0x00F030 03:9020: BD EF BD
	STA PPUADDR				;C - - - - - 0x00F033 03:9023: 8D 06 20
	LDA scratch0				;C - - - - - 0x00F036 03:9026: A5 00
	STA PPUDATA				;C - - - - - 0x00F038 03:9028: 8D 07 20
	LDA scratch1				;C - - - - - 0x00F03B 03:902B: A5 01
	STA PPUADDR				;C - - - - - 0x00F03D 03:902D: 8D 06 20
	LDA DATA_06BDEF,X			;C - - - - - 0x00F040 03:9030: BD EF BD
	CLC							;C - - - - - 0x00F043 03:9033: 18
	ADC #$20					;C - - - - - 0x00F044 03:9034: 69 20
	STA PPUADDR				;C - - - - - 0x00F046 03:9036: 8D 06 20
	INC scratch0				;C - - - - - 0x00F049 03:9039: E6 00
	LDA scratch0				;C - - - - - 0x00F04B 03:903B: A5 00
	STA PPUDATA				;C - - - - - 0x00F04D 03:903D: 8D 07 20
	INX							;C - - - - - 0x00F050 03:9040: E8
	CPX #$07					;C - - - - - 0x00F051 03:9041: E0 07
	BCC CODE_079016				;C - - - - - 0x00F053 03:9043: 90 D1

	JMP CODE_079077				;C - - - - - 0x00F055 03:9045: 4C 77 90

DATA_079048:
	.byte $23					;- D 0 - - - 0x00F058 03:9048: 23
	.byte $2B					;- D 0 - - - 0x00F059 03:9049: 2B

CODE_07904A:
	LDA PPUSTATUS					;C - - - - - 0x00F05A 03:904A: AD 02 20
	LDA mapTargetAdr+1				;C - - - - - 0x00F05D 03:904D: A5 4A
	STA PPUADDR					;C - - - - - 0x00F05F 03:904F: 8D 06 20
	LDA mapTargetAdr				;C - - - - - 0x00F062 03:9052: A5 49
	STA PPUADDR					;C - - - - - 0x00F064 03:9054: 8D 06 20
	LDA projScriptOfs				;C - - - - - 0x00F067 03:9057: A5 5D
	STA PPUDATA					;C - - - - - 0x00F069 03:9059: 8D 07 20
	STA PPUDATA					;C - - - - - 0x00F06C 03:905C: 8D 07 20
	LDA PPUSTATUS					;C - - - - - 0x00F06F 03:905F: AD 02 20
	LDA mapTargetAdr+1				;C - - - - - 0x00F072 03:9062: A5 4A
	STA PPUADDR					;C - - - - - 0x00F074 03:9064: 8D 06 20
	LDA mapTargetAdr				;C - - - - - 0x00F077 03:9067: A5 49
	CLC							;C - - - - - 0x00F079 03:9069: 18
	ADC #$20					;C - - - - - 0x00F07A 03:906A: 69 20
	STA PPUADDR					;C - - - - - 0x00F07C 03:906C: 8D 06 20
	LDA projScriptOfs				;C - - - - - 0x00F07F 03:906F: A5 5D
	STA PPUDATA					;C - - - - - 0x00F081 03:9071: 8D 07 20
	STA PPUDATA					;C - - - - - 0x00F084 03:9074: 8D 07 20
CODE_079077:
	LDA #.LOBYTE(ColorBufferToVRAM)	;C - - - - - 0x00F087 03:9077: A9 8A
	STA nmiUnbankedSub				;C - - - - - 0x00F089 03:9079: 85 35
	LDA #.HIBYTE(ColorBufferToVRAM)	;C - - - - - 0x00F08B 03:907B: A9 E3
	STA nmiUnbankedSub+1				;C - - - - - 0x00F08D 03:907D: 85 36
	JMP NMISubRet				;C - - - - - 0x00F08F 03:907F: 4C 9D E1

CODE_079082:
	LDA #.BANK(CODE_059DB8)					;C - - - - - 0x00F092 03:9082: A9 05
	STA nmiPrgBankA				;C - - - - - 0x00F094 03:9084: 85 51
	LDA #.BANK(CODE_089EF0)					;C - - - - - 0x00F096 03:9086: A9 08
	STA updateSubBankA			;C - - - - - 0x00F098 03:9088: 85 18
	LDA #.LOBYTE(CODE_089EF0)	;C - - - - - 0x00F09A 03:908A: A9 F0
	STA updateSub				;C - - - - - 0x00F09C 03:908C: 85 19
	LDA #.HIBYTE(CODE_089EF0)	;C - - - - - 0x00F09E 03:908E: A9 9E
	STA updateSub+1				;C - - - - - 0x00F0A0 03:9090: 85 1A

	LDA #.LOBYTE(CODE_059DB8)	;C - - - - - 0x00F0A2 03:9092: A9 B8
	STA nmiBankedSub			;C - - - - - 0x00F0A4 03:9094: 85 16
	LDA #.HIBYTE(CODE_059DB8)	;C - - - - - 0x00F0A6 03:9096: A9 9D
	STA nmiBankedSub+1			;C - - - - - 0x00F0A8 03:9098: 85 17

	LDX #BONUS_ANNOUNCE_GAME					;C - - - - - 0x00F0AA 03:909A: A2 06
	JSR DisplayBonusGameText				;C - - - - - 0x00F0AC 03:909C: 20 C4 9C
	LDA #$00					;C - - - - - 0x00F0AF 03:909F: A9 00
	STA objX+OSLOT_BUBBLE+2				;C - - - - - 0x00F0B1 03:90A1: 8D C9 05
	RTS							;C - - - - - 0x00F0B4 03:90A4: 60

CODE_0790A5:
	LDA #.LOBYTE(CODE_099BE7)					;C - - - - - 0x00F0B5 03:90A5: A9 E7
	STA bankedSub				;C - - - - - 0x00F0B7 03:90A7: 85 55
	LDA #.HIBYTE(CODE_099BE7)					;C - - - - - 0x00F0B9 03:90A9: A9 9B
	STA bankedSub+1				;C - - - - - 0x00F0BB 03:90AB: 85 56
	LDA #.BANK(CODE_099BE7)					;C - - - - - 0x00F0BD 03:90AD: A9 09
	STA bankedSubBank				;C - - - - - 0x00F0BF 03:90AF: 85 57
	LDA #.BANK(*)					;C - - - - - 0x00F0C1 03:90B1: A9 07
	STA bankedSubRetBank				;C - - - - - 0x00F0C3 03:90B3: 85 58
	JSR RunBankedSub				;C - - - - - 0x00F0C5 03:90B5: 20 72 E7
	LDA #$01					;C - - - - - 0x00F0C8 03:90B8: A9 01
	STA objState+OSLOT_ICON				;C - - - - - 0x00F0CA 03:90BA: 8D 76 05
	LDA #chrThunder_ID					;C - - - - - 0x00F0CD 03:90BD: A9 50
	STA chrBankF				;C - - - - - 0x00F0CF 03:90BF: 85 50

	LDA #.BANK(DATA_06BD75)					;C - - - - - 0x00F0D1 03:90C1: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00F0D3 03:90C3: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00F0D5 03:90C5: 20 56 FF
.endif

	JSR CODE_079B0F				;C - - - - - 0x00F0D8 03:90C8: 20 0F 9B
	JSR CODE_0792D2				;C - - - - - 0x00F0DB 03:90CB: 20 D2 92
	JSR CODE_07915A				;C - - - - - 0x00F0DE 03:90CE: 20 5A 91
	LDA globalTimer				;C - - - - - 0x00F0E1 03:90D1: A5 14
	AND #$01					;C - - - - - 0x00F0E3 03:90D3: 29 01
	BEQ CODE_0790DD				;C - - - - - 0x00F0E5 03:90D5: F0 06
		JSR CODE_0797A7				;C - - - - - 0x00F0E7 03:90D7: 20 A7 97
		JMP CODE_0790F3				;C - - - - - 0x00F0EA 03:90DA: 4C F3 90
CODE_0790DD:
	LDA #.LOBYTE(UpdateProjectiles)					;C - - - - - 0x00F0ED 03:90DD: A9 81
	STA bankedSub				;C - - - - - 0x00F0EF 03:90DF: 85 55
	LDA #.HIBYTE(UpdateProjectiles)					;C - - - - - 0x00F0F1 03:90E1: A9 8D
	STA bankedSub+1				;C - - - - - 0x00F0F3 03:90E3: 85 56
	LDA #.BANK(UpdateProjectiles)					;C - - - - - 0x00F0F5 03:90E5: A9 09
	STA bankedSubBank				;C - - - - - 0x00F0F7 03:90E7: 85 57
	LDA #.BANK(*)					;C - - - - - 0x00F0F9 03:90E9: A9 07
	STA bankedSubRetBank				;C - - - - - 0x00F0FB 03:90EB: 85 58
	JSR RunBankedSub				;C - - - - - 0x00F0FD 03:90ED: 20 72 E7
	JSR AnimateNonBubbles				;C - - - - - 0x00F100 03:90F0: 20 5C EE
CODE_0790F3:
	JSR DrawObjects				;C - - - - - 0x00F103 03:90F3: 20 E2 EE
	JSR CODE_079B5E				;C - - - - - 0x00F106 03:90F6: 20 5E 9B
	JSR CODE_079AD9				;C - - - - - 0x00F109 03:90F9: 20 D9 9A
	BCS CODE_079108				;C - - - - - 0x00F10C 03:90FC: B0 0A
		LDA enemyReward+1				;C - - - - - 0x00F10E 03:90FE: A5 8F
		CMP #$02					;C - - - - - 0x00F110 03:9100: C9 02
		BNE CODE_07910B				;C - - - - - 0x00F112 03:9102: D0 07
			LDA enemyReward+9				;C - - - - - 0x00F114 03:9104: A5 97
			BNE CODE_07910B				;C - - - - - 0x00F116 03:9106: D0 03
CODE_079108:
	JMP CODE_07910C				;C - - - - - 0x00F118 03:9108: 4C 0C 91
CODE_07910B:
	RTS							;C - - - - - 0x00F11B 03:910B: 60

CODE_07910C:
	LDA ram_00B5				;C - - - - - 0x00F11C 03:910C: A5 B5
	BNE CODE_079149				;C - - - - - 0x00F11E 03:910E: D0 39
		LDA #$00					;C - - - - - 0x00F120 03:9110: A9 00
		STA objAttr+OSLOT_ENEMY				;C - - - - - 0x00F122 03:9112: 8D FC 06
		STA objX+OSLOT_BUBBLE+2				;C - - - - - 0x00F125 03:9115: 8D C9 05
		LDA #$01					;C - - - - - 0x00F128 03:9118: A9 01
		STA ram_00B5				;C - - - - - 0x00F12A 03:911A: 85 B5
		STA ram_00B4				;C - - - - - 0x00F12C 03:911C: 85 B4
		STA objAttr+OSLOT_ENEMY+1				;C - - - - - 0x00F12E 03:911E: 8D FD 06
		LDA enemyDir				;C - - - - - 0x00F131 03:9121: A5 A2
		CMP enemyDir+1				;C - - - - - 0x00F133 03:9123: C5 A3
		BEQ CODE_079141				;C - - - - - 0x00F135 03:9125: F0 1A
			BCC CODE_079135				;C - - - - - 0x00F137 03:9127: 90 0C
				LDA #$07					;C - - - - - 0x00F139 03:9129: A9 07
				STA objState+OSLOT_ENEMY				;C - - - - - 0x00F13B 03:912B: 8D 6C 05
				LDA #$06					;C - - - - - 0x00F13E 03:912E: A9 06
				STA objState+OSLOT_ENEMY+1				;C - - - - - 0x00F140 03:9130: 8D 6D 05
				BNE CODE_079149				;C - - - - - 0x00F143 03:9133: D0 14
		CODE_079135:
			LDA #$06					;C - - - - - 0x00F145 03:9135: A9 06
			STA objState+OSLOT_ENEMY				;C - - - - - 0x00F147 03:9137: 8D 6C 05
			LDA #$07					;C - - - - - 0x00F14A 03:913A: A9 07
			STA objState+OSLOT_ENEMY+1				;C - - - - - 0x00F14C 03:913C: 8D 6D 05
			BNE CODE_079149				;C - - - - - 0x00F14F 03:913F: D0 08
	CODE_079141:
		LDA #$08					;C - - - - - 0x00F151 03:9141: A9 08
		STA objState+OSLOT_ENEMY				;C - - - - - 0x00F153 03:9143: 8D 6C 05
		STA objState+OSLOT_ENEMY+1				;C - - - - - 0x00F156 03:9146: 8D 6D 05
CODE_079149:
	LDA enemyReward+1				;C - - - - - 0x00F159 03:9149: A5 8F
	CMP #$03					;C - - - - - 0x00F15B 03:914B: C9 03
	BNE CODE_079159				;C - - - - - 0x00F15D 03:914D: D0 0A
		LDA #$05					;C - - - - - 0x00F15F 03:914F: A9 05
		STA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F161 03:9151: 8D 6E 05
		LDA #$00					;C - - - - - 0x00F164 03:9154: A9 00
		STA objState+OSLOT_ENEMY+3				;C - - - - - 0x00F166 03:9156: 8D 6F 05
CODE_079159:
	RTS							;C - - - - - 0x00F169 03:9159: 60

CODE_07915A:
	LDA ram_00B5				;C - - - - - 0x00F16A 03:915A: A5 B5
	BNE CODE_079189				;C - - - - - 0x00F16C 03:915C: D0 2B

	LDA enemyReward				;C - - - - - 0x00F16E 03:915E: A5 8E
	BEQ CODE_079189				;C - - - - - 0x00F170 03:9160: F0 27

	DEC enemyReward				;C - - - - - 0x00F172 03:9162: C6 8E
	BNE CODE_079189				;C - - - - - 0x00F174 03:9164: D0 23

	LDA enemyReward+1				;C - - - - - 0x00F176 03:9166: A5 8F
	CMP #$03					;C - - - - - 0x00F178 03:9168: C9 03
	BEQ CODE_079179				;C - - - - - 0x00F17A 03:916A: F0 0D
		LDY enemyReward+3				;C - - - - - 0x00F17C 03:916C: A4 91
		LDA DATA_07918A,Y			;C - - - - - 0x00F17E 03:916E: B9 8A 91
		STA scratch0				;C - - - - - 0x00F181 03:9171: 85 00
		JSR CODE_07918C				;C - - - - - 0x00F183 03:9173: 20 8C 91
		JMP CODE_07917C				;C - - - - - 0x00F186 03:9176: 4C 7C 91
CODE_079179:
	JSR CODE_0791AB				;C - - - - - 0x00F189 03:9179: 20 AB 91
CODE_07917C:
	LDA #$00					;C - - - - - 0x00F18C 03:917C: A9 00
	STA objAttr+OSLOT_ENEMY				;C - - - - - 0x00F18E 03:917E: 8D FC 06
	LDA #$01					;C - - - - - 0x00F191 03:9181: A9 01
	STA objAttr+OSLOT_ENEMY+1				;C - - - - - 0x00F193 03:9183: 8D FD 06
	JSR AnimateNonBubbles				;C - - - - - 0x00F196 03:9186: 20 5C EE
CODE_079189:
	RTS							;C - - - - - 0x00F199 03:9189: 60

DATA_07918A:
	.byte $40					;- D 0 - - - 0x00F19A 03:918A: 40
	.byte $C0					;- D 0 - - - 0x00F19B 03:918B: C0

CODE_07918C:
	LDA #psBonusBall_ID					;C - - - - - 0x00F19C 03:918C: A9 16
	STA scratch5				;C - - - - - 0x00F19E 03:918E: 85 05
	LDA #.LOBYTE(anBonusBall_ID)					;C - - - - - 0x00F1A0 03:9190: A9 6C
	STA scratch6				;C - - - - - 0x00F1A2 03:9192: 85 06
	LDA #.HIBYTE(anBonusBall_ID)					;C - - - - - 0x00F1A4 03:9194: A9 01
	STA scratch7				;C - - - - - 0x00F1A6 03:9196: 85 07
	LDA #$02					;C - - - - - 0x00F1A8 03:9198: A9 02
	STA scratch2				;C - - - - - 0x00F1AA 03:919A: 85 02
	LDA #$10					;C - - - - - 0x00F1AC 03:919C: A9 10
	STA scratch1				;C - - - - - 0x00F1AE 03:919E: 85 01
	JSR SpawnProj				;C - - - - - 0x00F1B0 03:91A0: 20 82 FE
	TYA							;C - - - - - 0x00F1B3 03:91A3: 98
	CLC							;C - - - - - 0x00F1B4 03:91A4: 18
	ADC #$02					;C - - - - - 0x00F1B5 03:91A5: 69 02
	STA objAttr+OSLOT_PROJ,Y				;C - - - - - 0x00F1B7 03:91A7: 99 F4 06
	RTS							;C - - - - - 0x00F1BA 03:91AA: 60

CODE_0791AB:
	LDA #psBonusBall_ID					;C - - - - - 0x00F1BB 03:91AB: A9 16
	STA scratch5				;C - - - - - 0x00F1BD 03:91AD: 85 05
	LDA #.LOBYTE(anBonusBall_ID)					;C - - - - - 0x00F1BF 03:91AF: A9 6C
	STA scratch6				;C - - - - - 0x00F1C1 03:91B1: 85 06
	LDA #.HIBYTE(anBonusBall_ID)					;C - - - - - 0x00F1C3 03:91B3: A9 01
	STA scratch7				;C - - - - - 0x00F1C5 03:91B5: 85 07
	LDA #$02					;C - - - - - 0x00F1C7 03:91B7: A9 02
	STA scratch2				;C - - - - - 0x00F1C9 03:91B9: 85 02
	LDA objX+OSLOT_ENEMY+2				;C - - - - - 0x00F1CB 03:91BB: AD BE 05
	STA scratch0				;C - - - - - 0x00F1CE 03:91BE: 85 00
	LDA objY+OSLOT_ENEMY+2				;C - - - - - 0x00F1D0 03:91C0: AD 96 05
	SEC							;C - - - - - 0x00F1D3 03:91C3: 38
	SBC #$0C					;C - - - - - 0x00F1D4 03:91C4: E9 0C
	STA scratch1				;C - - - - - 0x00F1D6 03:91C6: 85 01
	JSR SpawnProj				;C - - - - - 0x00F1D8 03:91C8: 20 82 FE
	CPY #$08					;C - - - - - 0x00F1DB 03:91CB: C0 08
	BEQ CODE_079203				;C - - - - - 0x00F1DD 03:91CD: F0 34
		TYA							;C - - - - - 0x00F1DF 03:91CF: 98
		CLC							;C - - - - - 0x00F1E0 03:91D0: 18
		ADC #$02					;C - - - - - 0x00F1E1 03:91D1: 69 02
		AND #$03					;C - - - - - 0x00F1E3 03:91D3: 29 03
		STA objAttr+OSLOT_PROJ,Y				;C - - - - - 0x00F1E5 03:91D5: 99 F4 06
		LDA globalTimer				;C - - - - - 0x00F1E8 03:91D8: A5 14
		AND #$03					;C - - - - - 0x00F1EA 03:91DA: 29 03
		EOR #$FF					;C - - - - - 0x00F1EC 03:91DC: 49 FF
		SBC #$02					;C - - - - - 0x00F1EE 03:91DE: E9 02
		STA projVSpeed,Y				;C - - - - - 0x00F1F0 03:91E0: 99 35 05
		LDA objX+OSLOT_ENEMY				;C - - - - - 0x00F1F3 03:91E3: AD BC 05
		ADC objX+OSLOT_ENEMY+1				;C - - - - - 0x00F1F6 03:91E6: 6D BD 05
		ADC globalTimer				;C - - - - - 0x00F1F9 03:91E9: 65 14
		AND #$03					;C - - - - - 0x00F1FB 03:91EB: 29 03
		ADC #$01					;C - - - - - 0x00F1FD 03:91ED: 69 01
		STA scratch0				;C - - - - - 0x00F1FF 03:91EF: 85 00
		LDA globalTimer				;C - - - - - 0x00F201 03:91F1: A5 14
		AND #$02					;C - - - - - 0x00F203 03:91F3: 29 02
		BEQ CODE_0791FE				;C - - - - - 0x00F205 03:91F5: F0 07
			LDA #$00					;C - - - - - 0x00F207 03:91F7: A9 00
			SEC							;C - - - - - 0x00F209 03:91F9: 38
			SBC scratch0				;C - - - - - 0x00F20A 03:91FA: E5 00
			STA scratch0				;C - - - - - 0x00F20C 03:91FC: 85 00
	CODE_0791FE:
		LDA scratch0				;C - - - - - 0x00F20E 03:91FE: A5 00
		STA projHSpeed,Y				;C - - - - - 0x00F210 03:9200: 99 2D 05
CODE_079203:
	RTS							;C - - - - - 0x00F213 03:9203: 60

CODE_079204:
	LDX #$00					;C - - - - - 0x00F214 03:9204: A2 00
	LDA #$00					;C - - - - - 0x00F216 03:9206: A9 00
CODE_079208:
	STA enemyReward,X				;C - - - - - 0x00F218 03:9208: 95 8E
	STA bubbleProgress,X				;C - - - - - 0x00F21A 03:920A: 9D D5 04
	STA ram_00AC,X				;C - - - - - 0x00F21D 03:920D: 95 AC
	STA enemyHits,X				;C - - - - - 0x00F21F 03:920F: 9D BE 04
	STA enemyDir,X				;C - - - - - 0x00F222 03:9212: 95 A2
	STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x00F224 03:9214: 9D C7 05
	STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x00F227 03:9217: 9D 9F 05
	STA objX+OSLOT_BUBBLE+10,X				;C - - - - - 0x00F22A 03:921A: 9D D1 05
	STA objY+OSLOT_BUBBLE+10,X				;C - - - - - 0x00F22D 03:921D: 9D A9 05
	STA objChrSlot+OSLOT_BUBBLE,X				;C - - - - - 0x00F230 03:9220: 9D 3F 06
	INX							;C - - - - - 0x00F233 03:9223: E8
	CPX #$0A					;C - - - - - 0x00F234 03:9224: E0 0A
	BCC CODE_079208				;C - - - - - 0x00F236 03:9226: 90 E0

	LDX #$00					;C - - - - - 0x00F238 03:9228: A2 00
CODE_07922A:
	LDA DATA_07927E,X			;C - - - - - 0x00F23A 03:922A: BD 7E 92
	STA scratch6				;C - - - - - 0x00F23D 03:922D: 85 06
	LDA DATA_07927E+1,X			;C - - - - - 0x00F23F 03:922F: BD 7F 92
	CMP #$FF					;C - - - - - 0x00F242 03:9232: C9 FF
	BEQ CODE_07924C				;C - - - - - 0x00F244 03:9234: F0 16
		STA scratch7				;C - - - - - 0x00F246 03:9236: 85 07
		LDY #$00					;C - - - - - 0x00F248 03:9238: A0 00
		LDA DATA_07927E+2,X			;C - - - - - 0x00F24A 03:923A: BD 80 92
		STA (scratch6),Y			;C - - - - - 0x00F24D 03:923D: 91 06
		INY							;C - - - - - 0x00F24F 03:923F: C8
		LDA DATA_07927E+3,X			;C - - - - - 0x00F250 03:9240: BD 81 92
		STA (scratch6),Y			;C - - - - - 0x00F253 03:9243: 91 06
		INX							;C - - - - - 0x00F255 03:9245: E8
		INX							;C - - - - - 0x00F256 03:9246: E8
		INX							;C - - - - - 0x00F257 03:9247: E8
		INX							;C - - - - - 0x00F258 03:9248: E8
		JMP CODE_07922A				;C - - - - - 0x00F259 03:9249: 4C 2A 92
CODE_07924C:
	LDA #$23					;C - - - - - 0x00F25C 03:924C: A9 23
	STA enemyType				;C - - - - - 0x00F25E 03:924E: 85 98
	STA enemyType+1				;C - - - - - 0x00F260 03:9250: 85 99
	LDA #$00					;C - - - - - 0x00F262 03:9252: A9 00
	STA objState				;C - - - - - 0x00F264 03:9254: 8D 63 05
	LDA #$01					;C - - - - - 0x00F267 03:9257: A9 01
	STA enemyHits+2				;C - - - - - 0x00F269 03:9259: 8D C0 04
	LDA #$50					;C - - - - - 0x00F26C 03:925C: A9 50
	STA enemyReward+6				;C - - - - - 0x00F26E 03:925E: 85 94
	LDY bonusGameProgress				;C - - - - - 0x00F270 03:9260: A4 D6
	LDA DATA_0792CC,Y			;C - - - - - 0x00F272 03:9262: B9 CC 92
	STA enemyReward+1				;C - - - - - 0x00F275 03:9265: 85 8F
	LDA #$00					;C - - - - - 0x00F277 03:9267: A9 00
	STA enemyDir+2				;C - - - - - 0x00F279 03:9269: 85 A4
	STA bubbleVariant				;C - - - - - 0x00F27B 03:926B: 8D 19 05
	LDA #$00					;C - - - - - 0x00F27E 03:926E: A9 00
	STA objY+OSLOT_BUBBLE+7				;C - - - - - 0x00F280 03:9270: 8D A6 05
	LDA #$06					;C - - - - - 0x00F283 03:9273: A9 06
	STA objY+OSLOT_BUBBLE+8				;C - - - - - 0x00F285 03:9275: 8D A7 05
	LDA #$00					;C - - - - - 0x00F288 03:9278: A9 00
	STA objY+OSLOT_BUBBLE+9				;C - - - - - 0x00F28A 03:927A: 8D A8 05
	RTS							;C - - - - - 0x00F28D 03:927D: 60

DATA_07927E:
	.byte $6C					;- D 0 - - - 0x00F28E 03:927E: 6C
	.byte $05					;- D 0 - - - 0x00F28F 03:927F: 05
	.byte $01					;- D 0 - - - 0x00F290 03:9280: 01
	.byte $01					;- D 0 - - - 0x00F291 03:9281: 01

	.byte $BC					;- D 0 - - - 0x00F292 03:9282: BC
	.byte $05					;- D 0 - - - 0x00F293 03:9283: 05
	.byte $40					;- D 0 - - - 0x00F294 03:9284: 40
	.byte $C0					;- D 0 - - - 0x00F295 03:9285: C0

	.byte $94					;- D 0 - - - 0x00F296 03:9286: 94
	.byte $05					;- D 0 - - - 0x00F297 03:9287: 05
	.byte $A4					;- D 0 - - - 0x00F298 03:9288: A4
	.byte $A4					;- D 0 - - - 0x00F299 03:9289: A4

	.byte $84					;- D 0 - - - 0x00F29A 03:928A: 84
	.byte $06					;- D 0 - - - 0x00F29B 03:928B: 06
	.byte $02					;- D 0 - - - 0x00F29C 03:928C: 02
	.byte $86					;- D 0 - - - 0x00F29D 03:928D: 86

	.byte $24					;- D 0 - - - 0x00F29E 03:928E: 24
	.byte $07					;- D 0 - - - 0x00F29F 03:928F: 07
	.byte $00					;- D 0 - - - 0x00F2A0 03:9290: 00
	.byte $01					;- D 0 - - - 0x00F2A1 03:9291: 01

	.byte $34					;- D 0 - - - 0x00F2A2 03:9292: 34
	.byte $06					;- D 0 - - - 0x00F2A3 03:9293: 06
	.byte $00					;- D 0 - - - 0x00F2A4 03:9294: 00
	.byte $01					;- D 0 - - - 0x00F2A5 03:9295: 01

	.byte $FC					;- D 0 - - - 0x00F2A6 03:9296: FC
	.byte $06					;- D 0 - - - 0x00F2A7 03:9297: 06
	.byte $00					;- D 0 - - - 0x00F2A8 03:9298: 00
	.byte $01					;- D 0 - - - 0x00F2A9 03:9299: 01

	.byte $AC					;- D 0 - - - 0x00F2AA 03:929A: AC
	.byte $06					;- D 0 - - - 0x00F2AB 03:929B: 06
	.byte $00					;- D 0 - - - 0x00F2AC 03:929C: 00
	.byte $00					;- D 0 - - - 0x00F2AD 03:929D: 00

	.byte $D4					;- D 0 - - - 0x00F2AE 03:929E: D4
	.byte $06					;- D 0 - - - 0x00F2AF 03:929F: 06
	.byte $00					;- D 0 - - - 0x00F2B0 03:92A0: 00
	.byte $00					;- D 0 - - - 0x00F2B1 03:92A1: 00

	.byte $AF					;- D 0 - - - 0x00F2B2 03:92A2: AF
	.byte $04					;- D 0 - - - 0x00F2B3 03:92A3: 04
	.byte $29					;- D 0 - - - 0x00F2B4 03:92A4: 29
	.byte $29					;- D 0 - - - 0x00F2B5 03:92A5: 29

	.byte $6E					;- D 0 - - - 0x00F2B6 03:92A6: 6E
	.byte $05					;- D 0 - - - 0x00F2B7 03:92A7: 05
	.byte $00					;- D 0 - - - 0x00F2B8 03:92A8: 00
	.byte $00					;- D 0 - - - 0x00F2B9 03:92A9: 00

	.byte $BE					;- D 0 - - - 0x00F2BA 03:92AA: BE
	.byte $05					;- D 0 - - - 0x00F2BB 03:92AB: 05
	.byte $80					;- D 0 - - - 0x00F2BC 03:92AC: 80
	.byte $F8					;- D 0 - - - 0x00F2BD 03:92AD: F8

	.byte $96					;- D 0 - - - 0x00F2BE 03:92AE: 96
	.byte $05					;- D 0 - - - 0x00F2BF 03:92AF: 05
	.byte $F8					;- D 0 - - - 0x00F2C0 03:92B0: F8
	.byte $78					;- D 0 - - - 0x00F2C1 03:92B1: 78

	.byte $86					;- D 0 - - - 0x00F2C2 03:92B2: 86
	.byte $06					;- D 0 - - - 0x00F2C3 03:92B3: 06
	.byte $6D					;- D 0 - - - 0x00F2C4 03:92B4: 6D
	.byte $78					;- D 0 - - - 0x00F2C5 03:92B5: 78

	.byte $26					;- D 0 - - - 0x00F2C6 03:92B6: 26
	.byte $07					;- D 0 - - - 0x00F2C7 03:92B7: 07
	.byte $01					;- D 0 - - - 0x00F2C8 03:92B8: 01
	.byte $01					;- D 0 - - - 0x00F2C9 03:92B9: 01

	.byte $36					;- D 0 - - - 0x00F2CA 03:92BA: 36
	.byte $06					;- D 0 - - - 0x00F2CB 03:92BB: 06
	.byte $02					;- D 0 - - - 0x00F2CC 03:92BC: 02
	.byte $02					;- D 0 - - - 0x00F2CD 03:92BD: 02

	.byte $FE					;- D 0 - - - 0x00F2CE 03:92BE: FE
	.byte $06					;- D 0 - - - 0x00F2CF 03:92BF: 06
	.byte $01					;- D 0 - - - 0x00F2D0 03:92C0: 01
	.byte $01					;- D 0 - - - 0x00F2D1 03:92C1: 01

	.byte $AE					;- D 0 - - - 0x00F2D2 03:92C2: AE
	.byte $06					;- D 0 - - - 0x00F2D3 03:92C3: 06
	.byte $00					;- D 0 - - - 0x00F2D4 03:92C4: 00
	.byte $00					;- D 0 - - - 0x00F2D5 03:92C5: 00

	.byte $D6					;- D 0 - - - 0x00F2D6 03:92C6: D6
	.byte $06					;- D 0 - - - 0x00F2D7 03:92C7: 06
	.byte $00					;- D 0 - - - 0x00F2D8 03:92C8: 00
	.byte $00					;- D 0 - - - 0x00F2D9 03:92C9: 00

	.byte $FF					;- D 0 - - - 0x00F2DA 03:92CA: FF
	.byte $FF					;- D 0 - - - 0x00F2DB 03:92CB: FF

DATA_0792CC:
	.byte $01					;- - - - - - 0x00F2DC 03:92CC: 01
	.byte $01					;- D 0 - - - 0x00F2DD 03:92CD: 01
	.byte $01					;- D 0 - - - 0x00F2DE 03:92CE: 01
	.byte $02					;- D 0 - - - 0x00F2DF 03:92CF: 02
	.byte $03					;- D 0 - - - 0x00F2E0 03:92D0: 03
	.byte $03					;- - - - - - 0x00F2E1 03:92D1: 03

CODE_0792D2:
	LDA #$00					;C - - - - - 0x00F2E2 03:92D2: A9 00
	STA ram_00B1				;C - - - - - 0x00F2E4 03:92D4: 85 B1
	LDX #$00					;C - - - - - 0x00F2E6 03:92D6: A2 00
CODE_0792D8:
	LDA enemyReward+1				;C - - - - - 0x00F2E8 03:92D8: A5 8F
	CMP #$02					;C - - - - - 0x00F2EA 03:92DA: C9 02
	BNE CODE_0792E8				;C - - - - - 0x00F2EC 03:92DC: D0 0A
		JSR CODE_0FF088				;C - - - - - 0x00F2EE 03:92DE: 20 88 F0

		LDA #.BANK(DATA_06BD75)					;C - - - - - 0x00F2F1 03:92E1: A9 06
.ifdef REGION_JP
		STA prgBankB
		STA $8001
.else
		STA newPrgBank				;C - - - - - 0x00F2F3 03:92E3: 85 3B
		JSR SwapPrgBankB				;C - - - - - 0x00F2F5 03:92E5: 20 56 FF
.endif
CODE_0792E8:
	CPX #$01					;C - - - - - 0x00F2F8 03:92E8: E0 01
	BEQ CODE_07930A				;C - - - - - 0x00F2FA 03:92EA: F0 1E

	LDY currentPlayer				;C - - - - - 0x00F2FC 03:92EC: AC 99 04
	LDA DATA_079308,Y			;C - - - - - 0x00F2FF 03:92EF: B9 08 93
	STA scratch8				;C - - - - - 0x00F302 03:92F2: 85 08
	LDA #$00					;C - - - - - 0x00F304 03:92F4: A9 00
	STA scratch9				;C - - - - - 0x00F306 03:92F6: 85 09
	TAY							;C - - - - - 0x00F308 03:92F8: A8
	LDA (scratch8),Y			;C - - - - - 0x00F309 03:92F9: B1 08
	STA bubbleProgress+8				;C - - - - - 0x00F30B 03:92FB: 8D DD 04
	LDY #$04					;C - - - - - 0x00F30E 03:92FE: A0 04
	LDA (scratch8),Y			;C - - - - - 0x00F310 03:9300: B1 08
	STA bubbleProgress+9				;C - - - - - 0x00F312 03:9302: 8D DE 04
	JMP CODE_07932F				;C - - - - - 0x00F315 03:9305: 4C 2F 93

DATA_079308:
	.byte heldP1					;- D 0 - - - 0x00F318 03:9308: 0A
	.byte heldP2					;- - - - - - 0x00F319 03:9309: 0F

CODE_07930A:
	LDA enemyDir+2				;C - - - - - 0x00F31A 03:930A: A5 A4
	BEQ CODE_07932C				;C - - - - - 0x00F31C 03:930C: F0 1E
		;Unreached
		LDY currentPlayer				;- - - - - - 0x00F31E 03:930E: AC
		LDA DATA_07932A,Y			;- - - - - - 0x00F321 03:9311: B9
		STA scratch8				;- - - - - - 0x00F324 03:9314: 85
		LDA #$00					;- - - - - - 0x00F326 03:9316: A9
		STA scratch9				;- - - - - - 0x00F328 03:9318: 85
		TAY							;- - - - - - 0x00F32A 03:931A: A8
		LDA (scratch8),Y			;- - - - - - 0x00F32B 03:931B: B1
		STA bubbleProgress+8				;- - - - - - 0x00F32D 03:931D: 8D
		LDY #$04					;- - - - - - 0x00F330 03:9320: A0
		LDA (scratch8),Y			;- - - - - - 0x00F332 03:9322: B1
		STA bubbleProgress+9				;- - - - - - 0x00F334 03:9324: 8D
		JMP CODE_07932F				;- - - - - - 0x00F337 03:9327: 4C

DATA_07932A:
	.byte heldP2					;- - - - - - 0x00F33A 03:932A: 0F
	.byte heldP1					;- - - - - - 0x00F33B 03:932B: 0A

CODE_07932C:
	JSR CODE_079D20				;C - - - - - 0x00F33C 03:932C: 20 20 9D
CODE_07932F:
	JSR CODE_0793A6				;C - - - - - 0x00F33F 03:932F: 20 A6 93
	LDA ram_00B5				;C - - - - - 0x00F342 03:9332: A5 B5
	BNE CODE_07939A				;C - - - - - 0x00F344 03:9334: D0 64

	JSR CODE_079A86				;C - - - - - 0x00F346 03:9336: 20 86 9A
	BCC CODE_07939A				;C - - - - - 0x00F349 03:9339: 90 5F

	TXA							;C - - - - - 0x00F34B 03:933B: 8A
	EOR #$01					;C - - - - - 0x00F34C 03:933C: 49 01
	TAY							;C - - - - - 0x00F34E 03:933E: A8
	LDA enemyHits+4,X				;C - - - - - 0x00F34F 03:933F: BD C2 04
	BEQ CODE_07936B				;C - - - - - 0x00F352 03:9342: F0 27
		LDA #$FC					;C - - - - - 0x00F354 03:9344: A9 FC
		STA bubbleProgress+2,Y				;C - - - - - 0x00F356 03:9346: 99 D7 04
		LDA #$05					;C - - - - - 0x00F359 03:9349: A9 05
		STA objState+OSLOT_ENEMY,Y				;C - - - - - 0x00F35B 03:934B: 99 6C 05
		LDA #snEnemyThrow_ID					;C - - - - - 0x00F35E 03:934E: A9 26
		STA a:soundTrigger						;C - - - - - 0x00F360 03:9350: 8D E1 00
		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F363 03:9353: BD BC 05
		CMP objX+OSLOT_ENEMY,Y				;C - - - - - 0x00F366 03:9356: D9 BC 05
		BNE CODE_07935D				;C - - - - - 0x00F369 03:9359: D0 02
			CMP #$80					;C - - - - - 0x00F36B 03:935B: C9 80
	CODE_07935D:
		BCC CODE_079363				;C - - - - - 0x00F36D 03:935D: 90 04
			LDA #$00					;C - - - - - 0x00F36F 03:935F: A9 00
			BEQ CODE_079365				;C - - - - - 0x00F371 03:9361: F0 02
	CODE_079363:
		LDA #$01					;C - - - - - 0x00F373 03:9363: A9 01
	CODE_079365:
		STA enemyHits+2,Y				;C - - - - - 0x00F375 03:9365: 99 C0 04
		JMP CODE_07939A				;C - - - - - 0x00F378 03:9368: 4C 9A 93
CODE_07936B:
	LDA objX+OSLOT_BUBBLE+18,X				;C - - - - - 0x00F37B 03:936B: BD D9 05
	STA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F37E 03:936E: 9D BC 05
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F381 03:9371: BD BC 05
	CMP objX+OSLOT_ENEMY,Y				;C - - - - - 0x00F384 03:9374: D9 BC 05
	BNE CODE_07937B				;C - - - - - 0x00F387 03:9377: D0 02
		CMP #$80					;C - - - - - 0x00F389 03:9379: C9 80
CODE_07937B:
	BCS CODE_07938D				;C - - - - - 0x00F38B 03:937B: B0 10
		LDA objX+OSLOT_ENEMY,Y				;C - - - - - 0x00F38D 03:937D: B9 BC 05
		CLC							;C - - - - - 0x00F390 03:9380: 18
		ADC #$01					;C - - - - - 0x00F391 03:9381: 69 01
		CMP #$E8					;C - - - - - 0x00F393 03:9383: C9 E8
		BCS CODE_07939A				;C - - - - - 0x00F395 03:9385: B0 13
		STA objX+OSLOT_ENEMY,Y				;C - - - - - 0x00F397 03:9387: 99 BC 05
		JMP CODE_07939A				;C - - - - - 0x00F39A 03:938A: 4C 9A 93
CODE_07938D:
	LDA objX+OSLOT_ENEMY,Y				;C - - - - - 0x00F39D 03:938D: B9 BC 05
	SEC							;C - - - - - 0x00F3A0 03:9390: 38
	SBC #$01					;C - - - - - 0x00F3A1 03:9391: E9 01
	CMP #$18					;C - - - - - 0x00F3A3 03:9393: C9 18
	BCC CODE_07939A				;C - - - - - 0x00F3A5 03:9395: 90 03
		STA objX+OSLOT_ENEMY,Y				;C - - - - - 0x00F3A7 03:9397: 99 BC 05
CODE_07939A:
	INX							;C - - - - - 0x00F3AA 03:939A: E8
	CPX #$02					;C - - - - - 0x00F3AB 03:939B: E0 02
	BCS CODE_0793A2				;C - - - - - 0x00F3AD 03:939D: B0 03
		JMP CODE_0792D8				;C - - - - - 0x00F3AF 03:939F: 4C D8 92
CODE_0793A2:
	JSR CODE_0799FB				;C - - - - - 0x00F3B2 03:93A2: 20 FB 99
	RTS							;C - - - - - 0x00F3B5 03:93A5: 60

CODE_0793A6:
	LDA enemyHits+4,X				;C - - - - - 0x00F3B6 03:93A6: BD C2 04
	BEQ CODE_0793B8				;C - - - - - 0x00F3B9 03:93A9: F0 0D
		DEC enemyHits+4,X				;C - - - - - 0x00F3BB 03:93AB: DE C2 04
		BNE CODE_0793B8				;C - - - - - 0x00F3BE 03:93AE: D0 08
			LDA #$00					;C - - - - - 0x00F3C0 03:93B0: A9 00
			STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x00F3C2 03:93B2: 9D C7 05
			STA enemyHits+6,X				;C - - - - - 0x00F3C5 03:93B5: 9D C4 04
CODE_0793B8:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x00F3C8 03:93B8: BD 6C 05
	CMP #$01					;C - - - - - 0x00F3CB 03:93BB: C9 01
	BEQ CODE_0793C2				;C - - - - - 0x00F3CD 03:93BD: F0 03
		JMP CODE_079443				;C - - - - - 0x00F3CF 03:93BF: 4C 43 94
CODE_0793C2:
	LDA enemyReward+1				;C - - - - - 0x00F3D2 03:93C2: A5 8F
	CMP #$01					;C - - - - - 0x00F3D4 03:93C4: C9 01
	BNE CODE_0793C8				;C - - - - - 0x00F3D6 03:93C6: D0 00
CODE_0793C8:
	LDA enemyReward+7,X				;C - - - - - 0x00F3D8 03:93C8: B5 95
	BNE CODE_0793E5				;C - - - - - 0x00F3DA 03:93CA: D0 19
		LDA bubbleProgress,X				;C - - - - - 0x00F3DC 03:93CC: BD D5 04
		BEQ CODE_0793D4				;C - - - - - 0x00F3DF 03:93CF: F0 03
			DEC bubbleProgress,X				;C - - - - - 0x00F3E1 03:93D1: DE D5 04
	CODE_0793D4:
		LDA #$03					;C - - - - - 0x00F3E4 03:93D4: A9 03
		STA bubbleProgress+2,X				;C - - - - - 0x00F3E6 03:93D6: 9D D7 04
		LDA enemyHits+2,X				;C - - - - - 0x00F3E9 03:93D9: BD C0 04
		CLC							;C - - - - - 0x00F3EC 03:93DC: 18
		ADC #$08					;C - - - - - 0x00F3ED 03:93DD: 69 08
		STA enemyHits,X				;C - - - - - 0x00F3EF 03:93DF: 9D BE 04
		JMP CODE_079440				;C - - - - - 0x00F3F2 03:93E2: 4C 40 94
CODE_0793E5:
	LDA enemyHits+2,X				;C - - - - - 0x00F3F5 03:93E5: BD C0 04
	STA enemyHits,X				;C - - - - - 0x00F3F8 03:93E8: 9D BE 04
	LDA #$00					;C - - - - - 0x00F3FB 03:93EB: A9 00
	STA bubbleProgress,X				;C - - - - - 0x00F3FD 03:93ED: 9D D5 04
	STA bubbleProgress+2,X				;C - - - - - 0x00F400 03:93F0: 9D D7 04
	LDA bubbleProgress+8				;C - - - - - 0x00F403 03:93F3: AD DD 04
	AND #$80					;C - - - - - 0x00F406 03:93F6: 29 80
	BEQ CODE_079406				;C - - - - - 0x00F408 03:93F8: F0 0C
		LDA #$01					;C - - - - - 0x00F40A 03:93FA: A9 01
		STA enemyHits+2,X				;C - - - - - 0x00F40C 03:93FC: 9D C0 04
		LDA #$03					;C - - - - - 0x00F40F 03:93FF: A9 03
		STA enemyHits,X				;C - - - - - 0x00F411 03:9401: 9D BE 04
		BNE CODE_079417				;C - - - - - 0x00F414 03:9404: D0 11
CODE_079406:
	LDA bubbleProgress+8				;C - - - - - 0x00F416 03:9406: AD DD 04
	AND #$40					;C - - - - - 0x00F419 03:9409: 29 40
	BEQ CODE_07941C				;C - - - - - 0x00F41B 03:940B: F0 0F
		LDA #$00					;C - - - - - 0x00F41D 03:940D: A9 00
		STA enemyHits+2,X				;C - - - - - 0x00F41F 03:940F: 9D C0 04
		LDA #$02					;C - - - - - 0x00F422 03:9412: A9 02
		STA enemyHits,X				;C - - - - - 0x00F424 03:9414: 9D BE 04
	CODE_079417:
		LDA #$05					;C - - - - - 0x00F427 03:9417: A9 05
		STA bubbleProgress,X				;C - - - - - 0x00F429 03:9419: 9D D5 04
CODE_07941C:
	LDA bubbleProgress+9				;C - - - - - 0x00F42C 03:941C: AD DE 04
	AND #$01					;C - - - - - 0x00F42F 03:941F: 29 01
	BEQ CODE_07942F				;C - - - - - 0x00F431 03:9421: F0 0C
		LDA #$02					;C - - - - - 0x00F433 03:9423: A9 02
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x00F435 03:9425: 9D 6C 05
		LDA #$00					;C - - - - - 0x00F438 03:9428: A9 00
		STA enemyHits+8,X				;C - - - - - 0x00F43A 03:942A: 9D C6 04
		BEQ CODE_079440				;C - - - - - 0x00F43D 03:942D: F0 11
CODE_07942F:
	LDA bubbleProgress+9				;C - - - - - 0x00F43F 03:942F: AD DE 04
	AND #$02					;C - - - - - 0x00F442 03:9432: 29 02
	BEQ CODE_079440				;C - - - - - 0x00F444 03:9434: F0 0A
		LDA #$04					;C - - - - - 0x00F446 03:9436: A9 04
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x00F448 03:9438: 9D 6C 05
		LDA #$08					;C - - - - - 0x00F44B 03:943B: A9 08
		STA enemyHits+4,X				;C - - - - - 0x00F44D 03:943D: 9D C2 04
CODE_079440:
	JMP CODE_079638				;C - - - - - 0x00F450 03:9440: 4C 38 96
CODE_079443:
	CMP #$02					;C - - - - - 0x00F453 03:9443: C9 02
	BNE CODE_079470				;C - - - - - 0x00F455 03:9445: D0 29
		LDA enemyHits+2,X				;C - - - - - 0x00F457 03:9447: BD C0 04
		CLC							;C - - - - - 0x00F45A 03:944A: 18
		ADC #$04					;C - - - - - 0x00F45B 03:944B: 69 04
		STA enemyHits,X				;C - - - - - 0x00F45D 03:944D: 9D BE 04
		LDA enemyHits+8,X				;C - - - - - 0x00F460 03:9450: BD C6 04
		TAY							;C - - - - - 0x00F463 03:9453: A8
		LDA DATA_06BD75,Y			;C - - - - - 0x00F464 03:9454: B9 75 BD
		STA bubbleProgress+2,X				;C - - - - - 0x00F467 03:9457: 9D D7 04
		JSR CODE_0795B2				;C - - - - - 0x00F46A 03:945A: 20 B2 95
		JSR CODE_0795E7				;C - - - - - 0x00F46D 03:945D: 20 E7 95
		INC enemyHits+8,X				;C - - - - - 0x00F470 03:9460: FE C6 04
		LDA enemyHits+8,X				;C - - - - - 0x00F473 03:9463: BD C6 04
		CMP #$18					;C - - - - - 0x00F476 03:9466: C9 18
		BCC CODE_07946D				;C - - - - - 0x00F478 03:9468: 90 03
			INC objState+OSLOT_ENEMY,X				;C - - - - - 0x00F47A 03:946A: FE 6C 05
	CODE_07946D:
		JMP CODE_079638				;C - - - - - 0x00F47D 03:946D: 4C 38 96
CODE_079470:
	CMP #$03					;C - - - - - 0x00F480 03:9470: C9 03
	BNE CODE_0794AE				;C - - - - - 0x00F482 03:9472: D0 3A
		LDA enemyHits+8,X				;C - - - - - 0x00F484 03:9474: BD C6 04
		TAY							;C - - - - - 0x00F487 03:9477: A8
		LDA DATA_06BD75,Y			;C - - - - - 0x00F488 03:9478: B9 75 BD
		STA bubbleProgress+2,X				;C - - - - - 0x00F48B 03:947B: 9D D7 04
		JSR CODE_0795B2				;C - - - - - 0x00F48E 03:947E: 20 B2 95
		JSR CODE_0795E7				;C - - - - - 0x00F491 03:9481: 20 E7 95
		LDA enemyHits+2,X				;C - - - - - 0x00F494 03:9484: BD C0 04
		CLC							;C - - - - - 0x00F497 03:9487: 18
		ADC #$06					;C - - - - - 0x00F498 03:9488: 69 06
		STA enemyHits,X				;C - - - - - 0x00F49A 03:948A: 9D BE 04
		LDA enemyReward+7,X				;C - - - - - 0x00F49D 03:948D: B5 95
		BNE CODE_07949B				;C - - - - - 0x00F49F 03:948F: D0 0A
			INC enemyHits+8,X				;C - - - - - 0x00F4A1 03:9491: FE C6 04
			LDA enemyHits+8,X				;C - - - - - 0x00F4A4 03:9494: BD C6 04
			CMP #$2F					;C - - - - - 0x00F4A7 03:9497: C9 2F
			BCC CODE_0794AB				;C - - - - - 0x00F4A9 03:9499: 90 10
	CODE_07949B:
		LDA #$00					;C - - - - - 0x00F4AB 03:949B: A9 00
		STA enemyHits+6,X				;C - - - - - 0x00F4AD 03:949D: 9D C4 04
		STA enemyHits+4,X				;C - - - - - 0x00F4B0 03:94A0: 9D C2 04
		STA enemyHits+8,X				;C - - - - - 0x00F4B3 03:94A3: 9D C6 04
		LDA #$01					;C - - - - - 0x00F4B6 03:94A6: A9 01
		STA objState+OSLOT_ENEMY,X				;C - - - - - 0x00F4B8 03:94A8: 9D 6C 05
	CODE_0794AB:
		JMP CODE_079638				;C - - - - - 0x00F4BB 03:94AB: 4C 38 96
CODE_0794AE:
	CMP #$04					;C - - - - - 0x00F4BE 03:94AE: C9 04
	BNE CODE_0794C8				;C - - - - - 0x00F4C0 03:94B0: D0 16
		LDA enemyHits+2,X				;C - - - - - 0x00F4C2 03:94B2: BD C0 04
		CLC							;C - - - - - 0x00F4C5 03:94B5: 18
		ADC #$0A					;C - - - - - 0x00F4C6 03:94B6: 69 0A
		STA enemyHits,X				;C - - - - - 0x00F4C8 03:94B8: 9D BE 04
		LDA enemyHits+4,X				;C - - - - - 0x00F4CB 03:94BB: BD C2 04
		BNE CODE_0794C5				;C - - - - - 0x00F4CE 03:94BE: D0 05
			LDA #$01					;C - - - - - 0x00F4D0 03:94C0: A9 01
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x00F4D2 03:94C2: 9D 6C 05
	CODE_0794C5:
		JMP CODE_079638				;C - - - - - 0x00F4D5 03:94C5: 4C 38 96
CODE_0794C8:
	CMP #$05					;C - - - - - 0x00F4D8 03:94C8: C9 05
	BNE CODE_0794EE				;C - - - - - 0x00F4DA 03:94CA: D0 22
		LDA enemyReward+7,X				;C - - - - - 0x00F4DC 03:94CC: B5 95
		BEQ CODE_0794D7				;C - - - - - 0x00F4DE 03:94CE: F0 07
			LDA #$01					;C - - - - - 0x00F4E0 03:94D0: A9 01
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x00F4E2 03:94D2: 9D 6C 05
			BNE CODE_0794EB				;C - - - - - 0x00F4E5 03:94D5: D0 14
	CODE_0794D7:
		LDA #$14					;C - - - - - 0x00F4E7 03:94D7: A9 14
		STA bubbleProgress,X				;C - - - - - 0x00F4E9 03:94D9: 9D D5 04
		INC bubbleProgress+2,X				;C - - - - - 0x00F4EC 03:94DC: FE D7 04
		BMI CODE_0794EB				;C - - - - - 0x00F4EF 03:94DF: 30 0A
			LDA #$07					;C - - - - - 0x00F4F1 03:94E1: A9 07
			CMP bubbleProgress+2,X				;C - - - - - 0x00F4F3 03:94E3: DD D7 04
			BCS CODE_0794EB				;C - - - - - 0x00F4F6 03:94E6: B0 03
				STA bubbleProgress+2,X				;C - - - - - 0x00F4F8 03:94E8: 9D D7 04
	CODE_0794EB:
		JMP CODE_079638				;C - - - - - 0x00F4FB 03:94EB: 4C 38 96
CODE_0794EE:
	CMP #$06					;C - - - - - 0x00F4FE 03:94EE: C9 06
	BNE CODE_07953E				;C - - - - - 0x00F500 03:94F0: D0 4C
		LDA #$02					;C - - - - - 0x00F502 03:94F2: A9 02
		STA enemyHits+4				;C - - - - - 0x00F504 03:94F4: 8D C2 04
		LDA #$03					;C - - - - - 0x00F507 03:94F7: A9 03
		STA bubbleProgress+2,X				;C - - - - - 0x00F509 03:94F9: 9D D7 04
		LDA #$0D					;C - - - - - 0x00F50C 03:94FC: A9 0D
		STA enemyHits,X				;C - - - - - 0x00F50E 03:94FE: 9D BE 04
		LDA #$01					;C - - - - - 0x00F511 03:9501: A9 01
		STA enemyHits+2,X				;C - - - - - 0x00F513 03:9503: 9D C0 04
		CPX #$00					;C - - - - - 0x00F516 03:9506: E0 00
		BEQ CODE_079521				;C - - - - - 0x00F518 03:9508: F0 17
			LDA #$03					;C - - - - - 0x00F51A 03:950A: A9 03
			STA bubbleProgress,X				;C - - - - - 0x00F51C 03:950C: 9D D5 04
			LDA objX+OSLOT_ENEMY+1				;C - - - - - 0x00F51F 03:950F: AD BD 05
			CMP #$F8					;C - - - - - 0x00F522 03:9512: C9 F8
			BCS CODE_07951A				;C - - - - - 0x00F524 03:9514: B0 04
				CMP #$08					;C - - - - - 0x00F526 03:9516: C9 08
				BCS CODE_07953B				;C - - - - - 0x00F528 03:9518: B0 21
		CODE_07951A:
			LDA #$00					;C - - - - - 0x00F52A 03:951A: A9 00
			STA objState+OSLOT_ENEMY+1				;C - - - - - 0x00F52C 03:951C: 8D 6D 05
			BEQ CODE_07953B				;C - - - - - 0x00F52F 03:951F: F0 1A
	CODE_079521:
		LDA #$00					;C - - - - - 0x00F531 03:9521: A9 00
		STA bubbleProgress,X				;C - - - - - 0x00F533 03:9523: 9D D5 04
		CPX #$00					;C - - - - - 0x00F536 03:9526: E0 00
		BNE CODE_07953B				;C - - - - - 0x00F538 03:9528: D0 11
			INC objX+OSLOT_BUBBLE+2				;C - - - - - 0x00F53A 03:952A: EE C9 05
			LDA objX+OSLOT_BUBBLE+2				;C - - - - - 0x00F53D 03:952D: AD C9 05
			CMP #$F0					;C - - - - - 0x00F540 03:9530: C9 F0
			BCC CODE_07953B				;C - - - - - 0x00F542 03:9532: 90 07
				LDA #$01					;C - - - - - 0x00F544 03:9534: A9 01
				STA enemyDir+9				;C - - - - - 0x00F546 03:9536: 85 AB
				JSR CODE_079BE2				;C - - - - - 0x00F548 03:9538: 20 E2 9B
	CODE_07953B:
		JMP CODE_079638				;C - - - - - 0x00F54B 03:953B: 4C 38 96
CODE_07953E:
	CMP #$07					;C - - - - - 0x00F54E 03:953E: C9 07
	BNE CODE_07957E				;C - - - - - 0x00F550 03:9540: D0 3C
		LDA #$02					;C - - - - - 0x00F552 03:9542: A9 02
		STA enemyHits+4				;C - - - - - 0x00F554 03:9544: 8D C2 04
		LDA #$0E					;C - - - - - 0x00F557 03:9547: A9 0E
		STA enemyHits,X				;C - - - - - 0x00F559 03:9549: 9D BE 04
		LDA #$00					;C - - - - - 0x00F55C 03:954C: A9 00
		STA bubbleProgress,X				;C - - - - - 0x00F55E 03:954E: 9D D5 04
		STA bubbleProgress+4,X				;C - - - - - 0x00F561 03:9551: 9D D9 04
		LDA #$03					;C - - - - - 0x00F564 03:9554: A9 03
		STA bubbleProgress+2,X				;C - - - - - 0x00F566 03:9556: 9D D7 04
		CPX #$00					;C - - - - - 0x00F569 03:9559: E0 00
		BNE CODE_07957B				;C - - - - - 0x00F56B 03:955B: D0 1E

		LDA objState+OSLOT_ENEMY+1				;C - - - - - 0x00F56D 03:955D: AD 6D 05
		BNE CODE_07957B				;C - - - - - 0x00F570 03:9560: D0 19

		INC objX+OSLOT_BUBBLE+2				;C - - - - - 0x00F572 03:9562: EE C9 05
		LDA objX+OSLOT_BUBBLE+2				;C - - - - - 0x00F575 03:9565: AD C9 05
		CMP #180					;C - - - - - 0x00F578 03:9568: C9 B4
		BCC CODE_07957B				;C - - - - - 0x00F57A 03:956A: 90 0F

		LDA powerUps				;C - - - - - 0x00F57C 03:956C: A5 DE
		BMI CODE_079574				;C - - - - - 0x00F57E 03:956E: 30 04
			LDA #$98					;C - - - - - 0x00F580 03:9570: A9 98
			BNE CODE_079576				;C - - - - - 0x00F582 03:9572: D0 02
	CODE_079574:
		;POWERUP_BOSS_BONUS
		LDA #$01					;C - - - - - 0x00F584 03:9574: A9 01
	CODE_079576:
		STA enemyDir+9				;C - - - - - 0x00F586 03:9576: 85 AB
		JSR CODE_079BE2				;C - - - - - 0x00F588 03:9578: 20 E2 9B
	CODE_07957B:
		JMP CODE_079638				;C - - - - - 0x00F58B 03:957B: 4C 38 96
CODE_07957E:
	CMP #$08					;C - - - - - 0x00F58E 03:957E: C9 08
	BNE CODE_0795AF				;C - - - - - 0x00F590 03:9580: D0 2D
		LDA #$02					;C - - - - - 0x00F592 03:9582: A9 02
		STA enemyHits+4				;C - - - - - 0x00F594 03:9584: 8D C2 04
		LDA #$03					;C - - - - - 0x00F597 03:9587: A9 03
		STA bubbleProgress+2,X				;C - - - - - 0x00F599 03:9589: 9D D7 04
		LDA #$00					;C - - - - - 0x00F59C 03:958C: A9 00
		STA enemyHits,X				;C - - - - - 0x00F59E 03:958E: 9D BE 04
		STA bubbleProgress,X				;C - - - - - 0x00F5A1 03:9591: 9D D5 04
		STA bubbleProgress+4,X				;C - - - - - 0x00F5A4 03:9594: 9D D9 04
		CPX #$00					;C - - - - - 0x00F5A7 03:9597: E0 00
		BNE CODE_0795AC				;C - - - - - 0x00F5A9 03:9599: D0 11
			INC objX+OSLOT_BUBBLE+2				;C - - - - - 0x00F5AB 03:959B: EE C9 05
			LDA objX+OSLOT_BUBBLE+2				;C - - - - - 0x00F5AE 03:959E: AD C9 05
			CMP #$F0					;C - - - - - 0x00F5B1 03:95A1: C9 F0
			BCC CODE_0795AC				;C - - - - - 0x00F5B3 03:95A3: 90 07
				LDA #$01					;C - - - - - 0x00F5B5 03:95A5: A9 01
				STA enemyDir+9				;C - - - - - 0x00F5B7 03:95A7: 85 AB
				JSR CODE_079BE2				;C - - - - - 0x00F5B9 03:95A9: 20 E2 9B
	CODE_0795AC:
		JMP CODE_079638				;C - - - - - 0x00F5BC 03:95AC: 4C 38 96
CODE_0795AF:
	JMP CODE_079638				;C - - - - - 0x00F5BF 03:95AF: 4C 38 96
CODE_0795B2:
	LDA #$07					;C - - - - - 0x00F5C2 03:95B2: A9 07
	STA scratch0				;C - - - - - 0x00F5C4 03:95B4: 85 00
	LDA bubbleProgress+8				;C - - - - - 0x00F5C6 03:95B6: AD DD 04
	AND #$40					;C - - - - - 0x00F5C9 03:95B9: 29 40
	BEQ CODE_0795C4				;C - - - - - 0x00F5CB 03:95BB: F0 07
		LDA enemyHits+2,X				;C - - - - - 0x00F5CD 03:95BD: BD C0 04
		BNE CODE_0795D0				;C - - - - - 0x00F5D0 03:95C0: D0 0E
		BEQ CODE_0795E6				;C - - - - - 0x00F5D2 03:95C2: F0 22
CODE_0795C4:
	LDA bubbleProgress+8				;C - - - - - 0x00F5D4 03:95C4: AD DD 04
	AND #$80					;C - - - - - 0x00F5D7 03:95C7: 29 80
	BEQ CODE_0795D4				;C - - - - - 0x00F5D9 03:95C9: F0 09
		LDA enemyHits+2,X				;C - - - - - 0x00F5DB 03:95CB: BD C0 04
		BNE CODE_0795E6				;C - - - - - 0x00F5DE 03:95CE: D0 16
	CODE_0795D0:
		LDA #$03					;C - - - - - 0x00F5E0 03:95D0: A9 03
		STA scratch0				;C - - - - - 0x00F5E2 03:95D2: 85 00
CODE_0795D4:
	LDA enemyHits+8,X				;C - - - - - 0x00F5E4 03:95D4: BD C6 04
	AND scratch0				;C - - - - - 0x00F5E7 03:95D7: 25 00
	BNE CODE_0795E6				;C - - - - - 0x00F5E9 03:95D9: D0 0B
		LDA bubbleProgress,X				;C - - - - - 0x00F5EB 03:95DB: BD D5 04
		SEC							;C - - - - - 0x00F5EE 03:95DE: 38
		SBC #$01					;C - - - - - 0x00F5EF 03:95DF: E9 01
		BCC CODE_0795E6				;C - - - - - 0x00F5F1 03:95E1: 90 03
			STA bubbleProgress,X				;C - - - - - 0x00F5F3 03:95E3: 9D D5 04
CODE_0795E6:
	RTS							;C - - - - - 0x00F5F6 03:95E6: 60

CODE_0795E7:
	LDA enemyHits+4,X				;C - - - - - 0x00F5F7 03:95E7: BD C2 04
	BEQ CODE_0795FE				;C - - - - - 0x00F5FA 03:95EA: F0 12
		LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x00F5FC 03:95EC: BD C7 05
		BEQ CODE_0795F5				;C - - - - - 0x00F5FF 03:95EF: F0 04
			LDA #$0C					;C - - - - - 0x00F601 03:95F1: A9 0C
			BNE CODE_0795FB				;C - - - - - 0x00F603 03:95F3: D0 06
	CODE_0795F5:
		LDA enemyHits+2,X				;C - - - - - 0x00F605 03:95F5: BD C0 04
		CLC							;C - - - - - 0x00F608 03:95F8: 18
		ADC #$0A					;C - - - - - 0x00F609 03:95F9: 69 0A
	CODE_0795FB:
		STA enemyHits,X				;C - - - - - 0x00F60B 03:95FB: 9D BE 04
CODE_0795FE:
	LDA enemyHits+6,X				;C - - - - - 0x00F60E 03:95FE: BD C4 04
	BNE CODE_079637				;C - - - - - 0x00F611 03:9601: D0 34

	LDA bubbleProgress+9				;C - - - - - 0x00F613 03:9603: AD DE 04
	AND #$02					;C - - - - - 0x00F616 03:9606: 29 02
	BEQ CODE_079637				;C - - - - - 0x00F618 03:9608: F0 2D

	INC enemyHits+6,X				;C - - - - - 0x00F61A 03:960A: FE C4 04
	LDA #$08					;C - - - - - 0x00F61D 03:960D: A9 08
	STA enemyHits+4,X				;C - - - - - 0x00F61F 03:960F: 9D C2 04
	LDA enemyReward+1				;C - - - - - 0x00F622 03:9612: A5 8F
	CMP #$01					;C - - - - - 0x00F624 03:9614: C9 01
	BNE CODE_079637				;C - - - - - 0x00F626 03:9616: D0 1F

	CPX enemyReward+3				;C - - - - - 0x00F628 03:9618: E4 91
	BNE CODE_079620				;C - - - - - 0x00F62A 03:961A: D0 04
		LDA enemyReward+4				;C - - - - - 0x00F62C 03:961C: A5 92
		BNE CODE_079637				;C - - - - - 0x00F62E 03:961E: D0 17
CODE_079620:
	TXA							;C - - - - - 0x00F630 03:9620: 8A
	CMP enemyHits+2,X				;C - - - - - 0x00F631 03:9621: DD C0 04
	BEQ CODE_079637				;C - - - - - 0x00F634 03:9624: F0 11

	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x00F636 03:9626: BD 94 05
	CMP #$88					;C - - - - - 0x00F639 03:9629: C9 88
	BCS CODE_079637				;C - - - - - 0x00F63B 03:962B: B0 0A

	LDA #$01					;C - - - - - 0x00F63D 03:962D: A9 01
	STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x00F63F 03:962F: 9D C7 05
	LDA #$0C					;C - - - - - 0x00F642 03:9632: A9 0C
	STA enemyHits,X				;C - - - - - 0x00F644 03:9634: 9D BE 04
CODE_079637:
	RTS							;C - - - - - 0x00F647 03:9637: 60

CODE_079638:
	LDA enemyReward+1				;C - - - - - 0x00F648 03:9638: A5 8F
	CMP #$02					;C - - - - - 0x00F64A 03:963A: C9 02
	BNE CODE_07965D				;C - - - - - 0x00F64C 03:963C: D0 1F
		LDA ram_00B5				;C - - - - - 0x00F64E 03:963E: A5 B5
		BNE CODE_07965D				;C - - - - - 0x00F650 03:9640: D0 1B
			TXA							;C - - - - - 0x00F652 03:9642: 8A
			PHA							;C - - - - - 0x00F653 03:9643: 48
			LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x00F654 03:9644: BD 94 05
			TAY							;C - - - - - 0x00F657 03:9647: A8
			LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F658 03:9648: BD BC 05
			TAX							;C - - - - - 0x00F65B 03:964B: AA
			JSR CODE_079F74				;C - - - - - 0x00F65C 03:964C: 20 74 9F
			PLA							;C - - - - - 0x00F65F 03:964F: 68
			TAX							;C - - - - - 0x00F660 03:9650: AA
			BCC CODE_07965D				;C - - - - - 0x00F661 03:9651: 90 0A
				JSR CODE_079ABC				;C - - - - - 0x00F663 03:9653: 20 BC 9A
				LDA #snInvader_ID					;C - - - - - 0x00F666 03:9656: A9 1F
				STA a:soundTrigger				;C - - - - - 0x00F668 03:9658: 8D E1 00
				DEC enemyReward+9				;C - - - - - 0x00F66B 03:965B: C6 97
CODE_07965D:
	JSR CODE_079693				;C - - - - - 0x00F66D 03:965D: 20 93 96
	JSR CODE_079711				;C - - - - - 0x00F670 03:9660: 20 11 97
	TXA							;C - - - - - 0x00F673 03:9663: 8A
	ASL							;C - - - - - 0x00F674 03:9664: 0A
	STA scratch0				;C - - - - - 0x00F675 03:9665: 85 00
	LDA enemyHits,X				;C - - - - - 0x00F677 03:9667: BD BE 04
	ASL							;C - - - - - 0x00F67A 03:966A: 0A
	ASL							;C - - - - - 0x00F67B 03:966B: 0A
	CLC							;C - - - - - 0x00F67C 03:966C: 18
	ADC scratch0				;C - - - - - 0x00F67D 03:966D: 65 00
	TAY							;C - - - - - 0x00F67F 03:966F: A8
	LDA BonusPlayerAnims,Y			;C - - - - - 0x00F680 03:9670: B9 54 97
	STA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x00F683 03:9673: 9D 84 06
	LDA BonusPlayerAnims+1,Y			;C - - - - - 0x00F686 03:9676: B9 55 97
	STA objAnimHI+OSLOT_ENEMY,X				;C - - - - - 0x00F689 03:9679: 9D 24 07
	LDA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x00F68C 03:967C: BD 84 06
	CMP bubbleProgress+6,X				;C - - - - - 0x00F68F 03:967F: DD DB 04
	BEQ CODE_07968C				;C - - - - - 0x00F692 03:9682: F0 08
		LDA #$00					;C - - - - - 0x00F694 03:9684: A9 00
		STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x00F696 03:9686: 9D AC 06
		STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x00F699 03:9689: 9D D4 06
CODE_07968C:
	LDA objAnim+OSLOT_ENEMY,X				;C - - - - - 0x00F69C 03:968C: BD 84 06
	STA bubbleProgress+6,X				;C - - - - - 0x00F69F 03:968F: 9D DB 04
	RTS							;C - - - - - 0x00F6A2 03:9692: 60

CODE_079693:
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F6A3 03:9693: BD BC 05
	STA objX+OSLOT_BUBBLE+18,X				;C - - - - - 0x00F6A6 03:9696: 9D D9 05
	LDA #$00					;C - - - - - 0x00F6A9 03:9699: A9 00
	STA scratch0				;C - - - - - 0x00F6AB 03:969B: 85 00
	LDA bubbleProgress,X				;C - - - - - 0x00F6AD 03:969D: BD D5 04
	LSR							;C - - - - - 0x00F6B0 03:96A0: 4A
	ROR scratch0				;C - - - - - 0x00F6B1 03:96A1: 66 00
	LSR							;C - - - - - 0x00F6B3 03:96A3: 4A
	ROR scratch0				;C - - - - - 0x00F6B4 03:96A4: 66 00
	STA scratch1				;C - - - - - 0x00F6B6 03:96A6: 85 01
	LDA enemyHits+2,X				;C - - - - - 0x00F6B8 03:96A8: BD C0 04
	BEQ CODE_0796C1				;C - - - - - 0x00F6BB 03:96AB: F0 14
		LDA bubbleProgress+4,X				;C - - - - - 0x00F6BD 03:96AD: BD D9 04
		CLC							;C - - - - - 0x00F6C0 03:96B0: 18
		ADC scratch0				;C - - - - - 0x00F6C1 03:96B1: 65 00
		STA bubbleProgress+4,X				;C - - - - - 0x00F6C3 03:96B3: 9D D9 04
		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F6C6 03:96B6: BD BC 05
		ADC scratch1				;C - - - - - 0x00F6C9 03:96B9: 65 01
		STA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F6CB 03:96BB: 9D BC 05
		JMP CODE_0796D2				;C - - - - - 0x00F6CE 03:96BE: 4C D2 96
CODE_0796C1:
	LDA bubbleProgress+4,X				;C - - - - - 0x00F6D1 03:96C1: BD D9 04
	SEC							;C - - - - - 0x00F6D4 03:96C4: 38
	SBC scratch0				;C - - - - - 0x00F6D5 03:96C5: E5 00
	STA bubbleProgress+4,X				;C - - - - - 0x00F6D7 03:96C7: 9D D9 04
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F6DA 03:96CA: BD BC 05
	SBC scratch1				;C - - - - - 0x00F6DD 03:96CD: E5 01
	STA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F6DF 03:96CF: 9D BC 05
CODE_0796D2:
	LDA enemyReward+1				;C - - - - - 0x00F6E2 03:96D2: A5 8F
	CMP #$02					;C - - - - - 0x00F6E4 03:96D4: C9 02
	BNE CODE_0796F2				;C - - - - - 0x00F6E6 03:96D6: D0 1A

	LDA bubbleProgress+2,X				;C - - - - - 0x00F6E8 03:96D8: BD D7 04
	BMI CODE_0796F2				;C - - - - - 0x00F6EB 03:96DB: 30 15

	LDA ram_00CD				;C - - - - - 0x00F6ED 03:96DD: A5 CD
	BEQ CODE_0796F2				;C - - - - - 0x00F6EF 03:96DF: F0 11

	AND #$07					;C - - - - - 0x00F6F1 03:96E1: 29 07
	STA scratch0				;C - - - - - 0x00F6F3 03:96E3: 85 00
	LDA #$01					;C - - - - - 0x00F6F5 03:96E5: A9 01
	STA enemyReward+7,X				;C - - - - - 0x00F6F7 03:96E7: 95 95
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x00F6F9 03:96E9: BD 94 05
	SEC							;C - - - - - 0x00F6FC 03:96EC: 38
	SBC scratch0				;C - - - - - 0x00F6FD 03:96ED: E5 00
	JMP CODE_07970D				;C - - - - - 0x00F6FF 03:96EF: 4C 0D 97
CODE_0796F2:
	LDA #$00					;C - - - - - 0x00F702 03:96F2: A9 00
	STA enemyReward+7,X				;C - - - - - 0x00F704 03:96F4: 95 95
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x00F706 03:96F6: BD 94 05
	CLC							;C - - - - - 0x00F709 03:96F9: 18
	ADC bubbleProgress+2,X				;C - - - - - 0x00F70A 03:96FA: 7D D7 04
	CMP #$A4					;C - - - - - 0x00F70D 03:96FD: C9 A4
	BCC CODE_079707				;C - - - - - 0x00F70F 03:96FF: 90 06
		LDA #$01					;C - - - - - 0x00F711 03:9701: A9 01
		STA enemyReward+7,X				;C - - - - - 0x00F713 03:9703: 95 95
		LDA #$A4					;C - - - - - 0x00F715 03:9705: A9 A4
CODE_079707:
	CMP #$10					;C - - - - - 0x00F717 03:9707: C9 10
	BCS CODE_07970D				;C - - - - - 0x00F719 03:9709: B0 02
		LDA #$10					;C - - - - - 0x00F71B 03:970B: A9 10
CODE_07970D:
	STA objY+OSLOT_ENEMY,X				;C - - - - - 0x00F71D 03:970D: 9D 94 05
	RTS							;C - - - - - 0x00F720 03:9710: 60

CODE_079711:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x00F721 03:9711: BD 6C 05
	CMP #$06					;C - - - - - 0x00F724 03:9714: C9 06
	BNE CODE_079719				;C - - - - - 0x00F726 03:9716: D0 01
		RTS							;C - - - - - 0x00F728 03:9718: 60
CODE_079719:
	STX scratch0				;C - - - - - 0x00F729 03:9719: 86 00
	LDA enemyReward+1				;C - - - - - 0x00F72B 03:971B: A5 8F
	ASL							;C - - - - - 0x00F72D 03:971D: 0A
	CLC							;C - - - - - 0x00F72E 03:971E: 18
	ADC scratch0				;C - - - - - 0x00F72F 03:971F: 65 00
	TAY							;C - - - - - 0x00F731 03:9721: A8
	DEY							;C - - - - - 0x00F732 03:9722: 88
	DEY							;C - - - - - 0x00F733 03:9723: 88
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F734 03:9724: BD BC 05
	CMP DATA_079748,Y			;C - - - - - 0x00F737 03:9727: D9 48 97
	LDA DATA_079748,Y			;C - - - - - 0x00F73A 03:972A: B9 48 97
	BCC CODE_07973A				;C - - - - - 0x00F73D 03:972D: 90 0B
		LDA DATA_07974E,Y			;C - - - - - 0x00F73F 03:972F: B9 4E 97
		CMP objX+OSLOT_ENEMY,X				;C - - - - - 0x00F742 03:9732: DD BC 05
		BCC CODE_07973A				;C - - - - - 0x00F745 03:9735: 90 03
			JMP CODE_07973D				;C - - - - - 0x00F747 03:9737: 4C 3D 97
CODE_07973A:
	STA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F74A 03:973A: 9D BC 05
CODE_07973D:
	LDA #$A4					;C - - - - - 0x00F74D 03:973D: A9 A4
	CMP objY+OSLOT_ENEMY,X				;C - - - - - 0x00F74F 03:973F: DD 94 05
	BCS CODE_079747				;C - - - - - 0x00F752 03:9742: B0 03
		;Unreached
		STA objY+OSLOT_ENEMY,X				;- - - - - - 0x00F754 03:9744: 9D
CODE_079747:
	RTS							;C - - - - - 0x00F757 03:9747: 60

DATA_079748:
	.byte $18					;- D 0 - - - 0x00F758 03:9748: 18
	.byte $90					;- D 0 - - - 0x00F759 03:9749: 90
	.byte $18					;- D 0 - - - 0x00F75A 03:974A: 18
	.byte $18					;- D 0 - - - 0x00F75B 03:974B: 18
	.byte $18					;- D 0 - - - 0x00F75C 03:974C: 18
	.byte $18					;- D 0 - - - 0x00F75D 03:974D: 18
DATA_07974E:
	.byte $74					;- D 0 - - - 0x00F75E 03:974E: 74
	.byte $E8					;- D 0 - - - 0x00F75F 03:974F: E8
	.byte $E8					;- D 0 - - - 0x00F760 03:9750: E8
	.byte $E8					;- D 0 - - - 0x00F761 03:9751: E8
	.byte $E8					;- D 0 - - - 0x00F762 03:9752: E8
	.byte $E8					;- D 0 - - - 0x00F763 03:9753: E8

BonusPlayerAnims:
	;- D 0 - - - 0x00F764 03:9754: 01
	.word anPlayerL_ID
	.word anBarcelonL_ID
	.word anPlayerR_ID
	.word anBarcelonR_ID
	.word anPlayerWalkL_ID
	.word anBarcelonL_ID
	.word anPlayerWalkR_ID
	.word anBarcelonR_ID
	.word anPlayerJumpL_ID
	.word anBarcelonL_ID
	.word anPlayerJumpR_ID
	.word anBarcelonR_ID
	.word anPlayerStartFallL_ID
	.word anBarcelonL_ID
	.word anPlayerStartFallR_ID
	.word anBarcelonR_ID
	.word anPlayerFallL_ID
	.word anBarcelonL_ID
	.word anPlayerStartFallR_ID
	.word anBarcelonR_ID
	.word anPlayerWeakenL_ID
	.word anBarcelonFallL_ID
	.word anPlayerWeakenR_ID
	.word anBarcelonFallR_ID
	.word anPlayerWeakenR_ID
	.word anBarcelonJumpL_ID
	.word anPlayerLoseR_ID
	.word anBarcelonLoseR_ID
	.word anPlayerWin_ID
	.word anBarcelonWin_ID

CODE_079790:
	LDA enemyReward+1				;C - - - - - 0x00F7A0 03:9790: A5 8F
	CMP #$03					;C - - - - - 0x00F7A2 03:9792: C9 03
	BNE CODE_0797A6				;C - - - - - 0x00F7A4 03:9794: D0 10
		LDA #$03					;C - - - - - 0x00F7A6 03:9796: A9 03
		STA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F7A8 03:9798: 8D 6E 05
		STA objState+OSLOT_ENEMY+3				;C - - - - - 0x00F7AB 03:979B: 8D 6F 05
		LDA #$00					;C - - - - - 0x00F7AE 03:979E: A9 00
		STA enemyDir+3				;C - - - - - 0x00F7B0 03:97A0: 85 A5
		STA enemyDir+4				;C - - - - - 0x00F7B2 03:97A2: 85 A6
		STA enemyDir+5				;C - - - - - 0x00F7B4 03:97A4: 85 A7
CODE_0797A6:
	RTS							;C - - - - - 0x00F7B6 03:97A6: 60

CODE_0797A7:
	LDA enemyReward+1				;C - - - - - 0x00F7B7 03:97A7: A5 8F
	CMP #$03					;C - - - - - 0x00F7B9 03:97A9: C9 03
	BEQ CODE_0797AE				;C - - - - - 0x00F7BB 03:97AB: F0 01
		RTS							;C - - - - - 0x00F7BD 03:97AD: 60
CODE_0797AE:
	JSR CODE_079900				;C - - - - - 0x00F7BE 03:97AE: 20 00 99
	LDA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F7C1 03:97B1: AD 6E 05
	CMP #$01					;C - - - - - 0x00F7C4 03:97B4: C9 01
	BNE CODE_0797C7				;C - - - - - 0x00F7C6 03:97B6: D0 0F
		LDA enemyDir+8				;C - - - - - 0x00F7C8 03:97B8: A5 AA
		BEQ CODE_0797C4				;C - - - - - 0x00F7CA 03:97BA: F0 08
			;Unreached
			LDA enemyReward				;- - - - - - 0x00F7CC 03:97BC: A5
			BNE CODE_0797C4				;- - - - - - 0x00F7CE 03:97BE: D0
				LDA #$0B					;- - - - - - 0x00F7D0 03:97C0: A9
				STA enemyReward				;- - - - - - 0x00F7D2 03:97C2: 85
	CODE_0797C4:
		JMP CODE_07984D				;C - - - - - 0x00F7D4 03:97C4: 4C 4D 98
CODE_0797C7:
	CMP #$02					;C - - - - - 0x00F7D7 03:97C7: C9 02
	BNE CODE_0797FF				;C - - - - - 0x00F7D9 03:97C9: D0 34
		LDA enemyDir+3				;C - - - - - 0x00F7DB 03:97CB: A5 A5
		AND #$01					;C - - - - - 0x00F7DD 03:97CD: 29 01
		BNE CODE_0797DD				;C - - - - - 0x00F7DF 03:97CF: D0 0C
			LDA objX+OSLOT_ENEMY+2				;C - - - - - 0x00F7E1 03:97D1: AD BE 05
			CLC							;C - - - - - 0x00F7E4 03:97D4: 18
			ADC #$02					;C - - - - - 0x00F7E5 03:97D5: 69 02
			STA objX+OSLOT_ENEMY+2				;C - - - - - 0x00F7E7 03:97D7: 8D BE 05
			JMP CODE_0797E6				;C - - - - - 0x00F7EA 03:97DA: 4C E6 97
	CODE_0797DD:
		LDA objX+OSLOT_ENEMY+2				;C - - - - - 0x00F7ED 03:97DD: AD BE 05
		SEC							;C - - - - - 0x00F7F0 03:97E0: 38
		SBC #$02					;C - - - - - 0x00F7F1 03:97E1: E9 02
		STA objX+OSLOT_ENEMY+2				;C - - - - - 0x00F7F3 03:97E3: 8D BE 05
	CODE_0797E6:
		INC enemyDir+3				;C - - - - - 0x00F7F6 03:97E6: E6 A5
		LDA enemyDir+3				;C - - - - - 0x00F7F8 03:97E8: A5 A5
		CMP #$10					;C - - - - - 0x00F7FA 03:97EA: C9 10
		BCC CODE_0797FC				;C - - - - - 0x00F7FC 03:97EC: 90 0E
			LDA #$00					;C - - - - - 0x00F7FE 03:97EE: A9 00
			STA enemyDir+3				;C - - - - - 0x00F800 03:97F0: 85 A5
			LDA #$01					;C - - - - - 0x00F802 03:97F2: A9 01
			STA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F804 03:97F4: 8D 6E 05
			LDA #$80					;C - - - - - 0x00F807 03:97F7: A9 80
			STA objX+OSLOT_ENEMY,X				;C - - - - - 0x00F809 03:97F9: 9D BC 05
	CODE_0797FC:
		JMP CODE_07984D				;C - - - - - 0x00F80C 03:97FC: 4C 4D 98
CODE_0797FF:
	CMP #$03					;C - - - - - 0x00F80F 03:97FF: C9 03
	BNE CODE_07981A				;C - - - - - 0x00F811 03:9801: D0 17
		LDA objY+OSLOT_ENEMY+2				;C - - - - - 0x00F813 03:9803: AD 96 05
		CLC							;C - - - - - 0x00F816 03:9806: 18
		ADC #$02					;C - - - - - 0x00F817 03:9807: 69 02
		AND #$FE					;C - - - - - 0x00F819 03:9809: 29 FE
		STA objY+OSLOT_ENEMY+2				;C - - - - - 0x00F81B 03:980B: 8D 96 05
		CMP #$60					;C - - - - - 0x00F81E 03:980E: C9 60
		BNE CODE_079817				;C - - - - - 0x00F820 03:9810: D0 05
			LDA #$01					;C - - - - - 0x00F822 03:9812: A9 01
			STA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F824 03:9814: 8D 6E 05
	CODE_079817:
		JMP CODE_07984D				;C - - - - - 0x00F827 03:9817: 4C 4D 98
CODE_07981A:
	CMP #$04					;C - - - - - 0x00F82A 03:981A: C9 04
	BNE CODE_07983C				;C - - - - - 0x00F82C 03:981C: D0 1E
		LDA #$62					;C - - - - - 0x00F82E 03:981E: A9 62
		STA objY+OSLOT_ENEMY+2				;C - - - - - 0x00F830 03:9820: 8D 96 05
		INC enemyDir+3				;C - - - - - 0x00F833 03:9823: E6 A5
		LDA enemyDir+3				;C - - - - - 0x00F835 03:9825: A5 A5
		CMP #$03					;C - - - - - 0x00F837 03:9827: C9 03
		BCC CODE_079839				;C - - - - - 0x00F839 03:9829: 90 0E
			LDA #$01					;C - - - - - 0x00F83B 03:982B: A9 01
			STA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F83D 03:982D: 8D 6E 05
			LDA #$00					;C - - - - - 0x00F840 03:9830: A9 00
			STA enemyDir+3				;C - - - - - 0x00F842 03:9832: 85 A5
			LDA #$68					;C - - - - - 0x00F844 03:9834: A9 68
			STA objY+OSLOT_ENEMY+2				;C - - - - - 0x00F846 03:9836: 8D 96 05
	CODE_079839:
		JMP CODE_07984D				;C - - - - - 0x00F849 03:9839: 4C 4D 98
CODE_07983C:
	CMP #$05					;C - - - - - 0x00F84C 03:983C: C9 05
	BNE CODE_07984D				;C - - - - - 0x00F84E 03:983E: D0 0D

	DEC objY+OSLOT_ENEMY+2				;C - - - - - 0x00F850 03:9840: CE 96 05
	DEC objY+OSLOT_ENEMY+2				;C - - - - - 0x00F853 03:9843: CE 96 05
	BPL CODE_07984D				;C - - - - - 0x00F856 03:9846: 10 05

	LDA #$00					;C - - - - - 0x00F858 03:9848: A9 00
	STA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F85A 03:984A: 8D 6E 05
CODE_07984D:
	LDA objState+OSLOT_ENEMY+3				;C - - - - - 0x00F85D 03:984D: AD 6F 05
	CMP #$01					;C - - - - - 0x00F860 03:9850: C9 01
	BNE CODE_079860				;C - - - - - 0x00F862 03:9852: D0 0C
		LDA globalTimer				;C - - - - - 0x00F864 03:9854: A5 14
		AND #$0E					;C - - - - - 0x00F866 03:9856: 29 0E
		BNE CODE_07985D				;C - - - - - 0x00F868 03:9858: D0 03
			JSR CODE_0798BE				;C - - - - - 0x00F86A 03:985A: 20 BE 98
	CODE_07985D:
		JMP CODE_0798BD				;C - - - - - 0x00F86D 03:985D: 4C BD 98
CODE_079860:
	CMP #$02					;C - - - - - 0x00F870 03:9860: C9 02
	BNE CODE_07989F				;C - - - - - 0x00F872 03:9862: D0 3B
		LDA globalTimer				;C - - - - - 0x00F874 03:9864: A5 14
		AND #$02					;C - - - - - 0x00F876 03:9866: 29 02
		BNE CODE_07986D				;C - - - - - 0x00F878 03:9868: D0 03
			JSR CODE_0798BE				;C - - - - - 0x00F87A 03:986A: 20 BE 98
	CODE_07986D:
		LDA objAttr+OSLOT_ENEMY+3				;C - - - - - 0x00F87D 03:986D: AD FF 06
		EOR #$02					;C - - - - - 0x00F880 03:9870: 49 02
		STA objAttr+OSLOT_ENEMY+3				;C - - - - - 0x00F882 03:9872: 8D FF 06
		LDA objAttr+OSLOT_ENEMY+2				;C - - - - - 0x00F885 03:9875: AD FE 06
		EOR #$03					;C - - - - - 0x00F888 03:9878: 49 03
		STA objAttr+OSLOT_ENEMY+2				;C - - - - - 0x00F88A 03:987A: 8D FE 06
		INC enemyDir+5				;C - - - - - 0x00F88D 03:987D: E6 A7
		LDA enemyDir+5				;C - - - - - 0x00F88F 03:987F: A5 A7
		CMP #$4E					;C - - - - - 0x00F891 03:9881: C9 4E
		BCC CODE_07989C				;C - - - - - 0x00F893 03:9883: 90 17
			LDA #$00					;C - - - - - 0x00F895 03:9885: A9 00
			STA enemyDir+5				;C - - - - - 0x00F897 03:9887: 85 A7
			LDA #$01					;C - - - - - 0x00F899 03:9889: A9 01
			STA objState+OSLOT_ENEMY+3				;C - - - - - 0x00F89B 03:988B: 8D 6F 05
			STA objAttr+OSLOT_ENEMY+3				;C - - - - - 0x00F89E 03:988E: 8D FF 06
			STA objAttr+OSLOT_ENEMY+2				;C - - - - - 0x00F8A1 03:9891: 8D FE 06
			LDA #$14					;C - - - - - 0x00F8A4 03:9894: A9 14
			STA enemyReward				;C - - - - - 0x00F8A6 03:9896: 85 8E
			LDA #$01					;C - - - - - 0x00F8A8 03:9898: A9 01
			STA enemyReward+4				;C - - - - - 0x00F8AA 03:989A: 85 92
	CODE_07989C:
		JMP CODE_0798BD				;C - - - - - 0x00F8AC 03:989C: 4C BD 98
CODE_07989F:
	CMP #$03					;C - - - - - 0x00F8AF 03:989F: C9 03
	BNE CODE_0798BD				;C - - - - - 0x00F8B1 03:98A1: D0 1A

	LDA objX+OSLOT_ENEMY+3				;C - - - - - 0x00F8B3 03:98A3: AD BF 05
	SEC							;C - - - - - 0x00F8B6 03:98A6: 38
	SBC #$02					;C - - - - - 0x00F8B7 03:98A7: E9 02
	STA objX+OSLOT_ENEMY+3				;C - - - - - 0x00F8B9 03:98A9: 8D BF 05
	CMP #$68					;C - - - - - 0x00F8BC 03:98AC: C9 68
	BCS CODE_JP_0798CA				;C - - - - - 0x00F8BE 03:98AE: B0 0D
		LDA #$01					;C - - - - - 0x00F8C0 03:98B0: A9 01
		STA objState+OSLOT_ENEMY+3				;C - - - - - 0x00F8C2 03:98B2: 8D 6F 05
		LDA #$14					;C - - - - - 0x00F8C5 03:98B5: A9 14
		STA enemyReward				;C - - - - - 0x00F8C7 03:98B7: 85 8E
		LDA #$01					;C - - - - - 0x00F8C9 03:98B9: A9 01
		STA enemyReward+4				;C - - - - - 0x00F8CB 03:98BB: 85 92
CODE_JP_0798CA:
.ifdef REGION_JP
		JMP CODE_0798BD					;- - - - - - 0x00F8DA 03:98CA: 4C
.endif
CODE_0798BD:
	RTS							;C - - - - - 0x00F8CD 03:98BD: 60

CODE_0798BE:
	INC enemyDir+4				;C - - - - - 0x00F8CE 03:98BE: E6 A6
	LDA enemyDir+4				;C - - - - - 0x00F8D0 03:98C0: A5 A6
	CMP #$04					;C - - - - - 0x00F8D2 03:98C2: C9 04
	BCC CODE_0798CA				;C - - - - - 0x00F8D4 03:98C4: 90 04
		LDA #$00					;C - - - - - 0x00F8D6 03:98C6: A9 00
		STA enemyDir+4				;C - - - - - 0x00F8D8 03:98C8: 85 A6
CODE_0798CA:
	LDA enemyDir+4				;C - - - - - 0x00F8DA 03:98CA: A5 A6
	ASL							;C - - - - - 0x00F8DC 03:98CC: 0A
	ASL							;C - - - - - 0x00F8DD 03:98CD: 0A
	TAY							;C - - - - - 0x00F8DE 03:98CE: A8
	LDA DATA_0798F0,Y			;C - - - - - 0x00F8DF 03:98CF: B9 F0 98
	STA objX+OSLOT_ENEMY+3				;C - - - - - 0x00F8E2 03:98D2: 8D BF 05
	LDA DATA_0798F0+1,Y			;C - - - - - 0x00F8E5 03:98D5: B9 F1 98
	STA objY+OSLOT_ENEMY+3				;C - - - - - 0x00F8E8 03:98D8: 8D 97 05
	LDA DATA_0798F0+2,Y			;C - - - - - 0x00F8EB 03:98DB: B9 F2 98
	STA objAnim+OSLOT_ENEMY+3				;C - - - - - 0x00F8EE 03:98DE: 8D 87 06
	LDA DATA_0798F0+3,Y			;C - - - - - 0x00F8F1 03:98E1: B9 F3 98
	STA objAnimHI+OSLOT_ENEMY+3				;C - - - - - 0x00F8F4 03:98E4: 8D 27 07
	LDA #$00					;C - - - - - 0x00F8F7 03:98E7: A9 00
	STA objAnimTimer+OSLOT_ENEMY+3				;C - - - - - 0x00F8F9 03:98E9: 8D AF 06
	STA objAnimProgress+OSLOT_ENEMY+3				;C - - - - - 0x00F8FC 03:98EC: 8D D7 06
	RTS							;C - - - - - 0x00F8FF 03:98EF: 60

DATA_0798F0:
	;- D 0 - - - 0x00F900 03:98F0: 68
	.byte 104,120
	.word anBonusHand_ID

	.byte 104,72
	.word anBonusHandUpRightAlt_ID

	.byte 152,72
	.word anBonusHandDownLeftAlt_ID

	.byte 152,120
	.word anBonusHandUpLeftAlt_ID

CODE_079900:
	LDY #$00					;C - - - - - 0x00F910 03:9900: A0 00
CODE_079902:
.ifndef REGION_JP
	LDA objY+OSLOT_BUBBLE+7				;C - - - - - 0x00F912 03:9902: AD A6 05
	ORA objY+OSLOT_BUBBLE+8				;C - - - - - 0x00F915 03:9905: 0D A7 05
	ORA objY+OSLOT_BUBBLE+9				;C - - - - - 0x00F918 03:9908: 0D A8 05
	BNE CODE_079910				;C - - - - - 0x00F91B 03:990B: D0 03
		JMP CODE_0799FA				;C - - - - - 0x00F91D 03:990D: 4C FA 99
.endif
CODE_079910:
	LDA objState+OSLOT_PROJ,Y				;C - - - - - 0x00F920 03:9910: B9 64 05
	BEQ CODE_079920				;C - - - - - 0x00F923 03:9913: F0 0B
		LDA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F925 03:9915: AD 6E 05
		CMP #$05					;C - - - - - 0x00F928 03:9918: C9 05
		BEQ CODE_079920				;C - - - - - 0x00F92A 03:991A: F0 04
			LDA enemyReward+4				;C - - - - - 0x00F92C 03:991C: A5 92
			BEQ CODE_079923				;C - - - - - 0x00F92E 03:991E: F0 03
CODE_079920:
	JMP CODE_0799F2				;C - - - - - 0x00F930 03:9920: 4C F2 99
CODE_079923:
	LDA objY+OSLOT_PROJ,Y				;C - - - - - 0x00F933 03:9923: B9 8C 05
	CMP #$70					;C - - - - - 0x00F936 03:9926: C9 70
	BCS CODE_079920				;C - - - - - 0x00F938 03:9928: B0 F6

	CMP #$3C					;C - - - - - 0x00F93A 03:992A: C9 3C
	BCC CODE_079920				;C - - - - - 0x00F93C 03:992C: 90 F2

	CMP #$50					;C - - - - - 0x00F93E 03:992E: C9 50
	BCS CODE_07994A				;C - - - - - 0x00F940 03:9930: B0 18
		LDA objX+OSLOT_PROJ,Y				;C - - - - - 0x00F942 03:9932: B9 B4 05
		CMP #$6C					;C - - - - - 0x00F945 03:9935: C9 6C
		BCC CODE_079920				;C - - - - - 0x00F947 03:9937: 90 E7

		CMP #$94					;C - - - - - 0x00F949 03:9939: C9 94
		BCS CODE_079920				;C - - - - - 0x00F94B 03:993B: B0 E3

		LDA projVSpeed,Y				;C - - - - - 0x00F94D 03:993D: B9 35 05
		BMI CODE_079920				;C - - - - - 0x00F950 03:9940: 30 DE

		LDA #$01					;C - - - - - 0x00F952 03:9942: A9 01
		STA projCounter,Y				;C - - - - - 0x00F954 03:9944: 99 1D 05
		JMP CODE_0799F2				;C - - - - - 0x00F957 03:9947: 4C F2 99
CODE_07994A:
	LDA objX+OSLOT_PROJ,Y				;C - - - - - 0x00F95A 03:994A: B9 B4 05
	CMP #$70					;C - - - - - 0x00F95D 03:994D: C9 70
	BCC CODE_079920				;C - - - - - 0x00F95F 03:994F: 90 CF

	CMP #$90					;C - - - - - 0x00F961 03:9951: C9 90
	BCS CODE_079920				;C - - - - - 0x00F963 03:9953: B0 CB

	LDA projCounter,Y				;C - - - - - 0x00F965 03:9955: B9 1D 05
	BNE CODE_0799C8				;C - - - - - 0x00F968 03:9958: D0 6E

	LDA objX+OSLOT_PROJ,Y				;C - - - - - 0x00F96A 03:995A: B9 B4 05
	CMP #$78					;C - - - - - 0x00F96D 03:995D: C9 78
	BCS CODE_079968				;C - - - - - 0x00F96F 03:995F: B0 07
		LDA projHSpeed,Y				;C - - - - - 0x00F971 03:9961: B9 2D 05
		BPL CODE_079971				;C - - - - - 0x00F974 03:9964: 10 0B
			BMI CODE_079997				;C - - - - - 0x00F976 03:9966: 30 2F
CODE_079968:
	CMP #$88					;C - - - - - 0x00F978 03:9968: C9 88
	BCC CODE_079997				;C - - - - - 0x00F97A 03:996A: 90 2B

	LDA projHSpeed,Y				;C - - - - - 0x00F97C 03:996C: B9 2D 05
	BPL CODE_079997				;C - - - - - 0x00F97F 03:996F: 10 26
CODE_079971:
	LDA projHSpeed,X				;C - - - - - 0x00F981 03:9971: BD 2D 05
	STA scratch0				;C - - - - - 0x00F984 03:9974: 85 00
	BPL CODE_07997E				;C - - - - - 0x00F986 03:9976: 10 06
		;Unreached
		EOR #$FF					;- - - - - - 0x00F988 03:9978: 49
		STA scratch0				;- - - - - - 0x00F98A 03:997A: 85
		INC scratch0				;- - - - - - 0x00F98C 03:997C: E6
CODE_07997E:
	LDA scratch0				;C - - - - - 0x00F98E 03:997E: A5 00
	CMP #$03					;C - - - - - 0x00F990 03:9980: C9 03
	BCC CODE_07998E				;C - - - - - 0x00F992 03:9982: 90 0A
		LDA #$02					;C - - - - - 0x00F994 03:9984: A9 02
		STA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F996 03:9986: 8D 6E 05
		LDA #snBasketFail_ID					;C - - - - - 0x00F999 03:9989: A9 1C
		STA a:soundTrigger			;C - - - - - 0x00F99B 03:998B: 8D E1 00
CODE_07998E:
	LDA #$00					;C - - - - - 0x00F99E 03:998E: A9 00
	SEC							;C - - - - - 0x00F9A0 03:9990: 38
	SBC projHSpeed,Y				;C - - - - - 0x00F9A1 03:9991: F9 2D 05
	STA projHSpeed,Y				;C - - - - - 0x00F9A4 03:9994: 99 2D 05
CODE_079997:
	LDA objY+OSLOT_PROJ,Y				;C - - - - - 0x00F9A7 03:9997: B9 8C 05
	CMP #$58					;C - - - - - 0x00F9AA 03:999A: C9 58
	BCC CODE_0799B7				;C - - - - - 0x00F9AC 03:999C: 90 19
		CMP #$68					;C - - - - - 0x00F9AE 03:999E: C9 68
		BCC CODE_0799F2				;C - - - - - 0x00F9B0 03:99A0: 90 50

		LDA projVSpeed,Y				;C - - - - - 0x00F9B2 03:99A2: B9 35 05
		BPL CODE_0799F2				;C - - - - - 0x00F9B5 03:99A5: 10 4B

		CMP #$FC					;C - - - - - 0x00F9B7 03:99A7: C9 FC
		BCS CODE_0799BC				;C - - - - - 0x00F9B9 03:99A9: B0 11

		LDA #$04					;C - - - - - 0x00F9BB 03:99AB: A9 04
		STA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F9BD 03:99AD: 8D 6E 05
		LDA #snBasketFail_ID					;C - - - - - 0x00F9C0 03:99B0: A9 1C
		STA a:soundTrigger			;C - - - - - 0x00F9C2 03:99B2: 8D E1 00
		BNE CODE_0799BC				;C - - - - - 0x00F9C5 03:99B5: D0 05
CODE_0799B7:
	LDA projVSpeed,Y				;C - - - - - 0x00F9C7 03:99B7: B9 35 05
	BMI CODE_0799F2				;C - - - - - 0x00F9CA 03:99BA: 30 36
CODE_0799BC:
	LDA #$00					;C - - - - - 0x00F9CC 03:99BC: A9 00
	SEC							;C - - - - - 0x00F9CE 03:99BE: 38
	SBC projVSpeed,Y				;C - - - - - 0x00F9CF 03:99BF: F9 35 05
	STA projVSpeed,Y				;C - - - - - 0x00F9D2 03:99C2: 99 35 05
	JMP CODE_0799F2				;C - - - - - 0x00F9D5 03:99C5: 4C F2 99
CODE_0799C8:
	LDA #$00					;C - - - - - 0x00F9D8 03:99C8: A9 00
	STA objState+OSLOT_PROJ,Y				;C - - - - - 0x00F9DA 03:99CA: 99 64 05
	LDA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F9DD 03:99CD: AD 6E 05
	CMP #$05					;C - - - - - 0x00F9E0 03:99D0: C9 05
	BEQ CODE_0799F2				;C - - - - - 0x00F9E2 03:99D2: F0 1E
		LDA objChrSlot+OSLOT_BUBBLE,Y				;C - - - - - 0x00F9E4 03:99D4: B9 3F 06
		EOR #$01					;C - - - - - 0x00F9E7 03:99D7: 49 01
		TAX							;C - - - - - 0x00F9E9 03:99D9: AA
		LDA #$03					;C - - - - - 0x00F9EA 03:99DA: A9 03
		STA objAttr+OSLOT_ENEMY,X				;C - - - - - 0x00F9EC 03:99DC: 9D FC 06
		LDA #$02					;C - - - - - 0x00F9EF 03:99DF: A9 02
		STA objState+OSLOT_ENEMY+2				;C - - - - - 0x00F9F1 03:99E1: 8D 6E 05
		STA objState+OSLOT_ENEMY+3				;C - - - - - 0x00F9F4 03:99E4: 8D 6F 05
		LDA #snBonusFail_ID					;C - - - - - 0x00F9F7 03:99E7: A9 18
		STA a:soundTrigger				;C - - - - - 0x00F9F9 03:99E9: 8D E1 00
		LDX objChrSlot+OSLOT_BUBBLE,Y				;C - - - - - 0x00F9FC 03:99EC: BE 3F 06
		JSR CODE_079ABC				;C - - - - - 0x00F9FF 03:99EF: 20 BC 9A
CODE_0799F2:
	INY							;C - - - - - 0x00FA02 03:99F2: C8
	CPY #$08					;C - - - - - 0x00FA03 03:99F3: C0 08
	BCS CODE_0799FA				;C - - - - - 0x00FA05 03:99F5: B0 03
		JMP CODE_079902				;C - - - - - 0x00FA07 03:99F7: 4C 02 99
CODE_0799FA:
	RTS							;C - - - - - 0x00FA0A 03:99FA: 60

CODE_0799FB:
	LDA ram_00B5				;C - - - - - 0x00FA0B 03:99FB: A5 B5
	BEQ CODE_079A00				;C - - - - - 0x00FA0D 03:99FD: F0 01
		RTS							;C - - - - - 0x00FA0F 03:99FF: 60
CODE_079A00:
	LDA enemyReward+1				;C - - - - - 0x00FA10 03:9A00: A5 8F
	CMP #$01					;C - - - - - 0x00FA12 03:9A02: C9 01
	BEQ CODE_079A07				;C - - - - - 0x00FA14 03:9A04: F0 01
		RTS							;C - - - - - 0x00FA16 03:9A06: 60
CODE_079A07:
	LDA enemyReward+6				;C - - - - - 0x00FA17 03:9A07: A5 94
	BNE CODE_079A3F				;C - - - - - 0x00FA19 03:9A09: D0 34
		LDA enemyReward+5				;C - - - - - 0x00FA1B 03:9A0B: A5 93
		BEQ CODE_079A85				;C - - - - - 0x00FA1D 03:9A0D: F0 76
			LDA #$01					;C - - - - - 0x00FA1F 03:9A0F: A9 01
			STA ram_00B4				;C - - - - - 0x00FA21 03:9A11: 85 B4
			LDA #snDie_ID					;C - - - - - 0x00FA23 03:9A13: A9 09
			STA a:soundTrigger			;C - - - - - 0x00FA25 03:9A15: 8D E1 00
			LDA enemyReward+5				;C - - - - - 0x00FA28 03:9A18: A5 93
			SEC							;C - - - - - 0x00FA2A 03:9A1A: 38
			SBC #$01					;C - - - - - 0x00FA2B 03:9A1B: E9 01
			TAY							;C - - - - - 0x00FA2D 03:9A1D: A8
			LDA #$03					;C - - - - - 0x00FA2E 03:9A1E: A9 03
			STA objAttr+OSLOT_ENEMY,Y				;C - - - - - 0x00FA30 03:9A20: 99 FC 06
			LDA enemyReward+5				;C - - - - - 0x00FA33 03:9A23: A5 93
			SEC							;C - - - - - 0x00FA35 03:9A25: 38
			SBC #$01					;C - - - - - 0x00FA36 03:9A26: E9 01
			EOR #$01					;C - - - - - 0x00FA38 03:9A28: 49 01
			TAX							;C - - - - - 0x00FA3A 03:9A2A: AA
			JSR CODE_079ABC				;C - - - - - 0x00FA3B 03:9A2B: 20 BC 9A
			LDA enemyReward+5				;C - - - - - 0x00FA3E 03:9A2E: A5 93
			SEC							;C - - - - - 0x00FA40 03:9A30: 38
			SBC #$01					;C - - - - - 0x00FA41 03:9A31: E9 01
			EOR #$01					;C - - - - - 0x00FA43 03:9A33: 49 01
			STA enemyReward+3				;C - - - - - 0x00FA45 03:9A35: 85 91
			LDA #$00					;C - - - - - 0x00FA47 03:9A37: A9 00
			STA enemyReward+4				;C - - - - - 0x00FA49 03:9A39: 85 92
			LDA #$B4					;C - - - - - 0x00FA4B 03:9A3B: A9 B4
			STA enemyReward+6				;C - - - - - 0x00FA4D 03:9A3D: 85 94
CODE_079A3F:
	DEC enemyReward+6				;C - - - - - 0x00FA4F 03:9A3F: C6 94
	BNE CODE_079A85				;C - - - - - 0x00FA51 03:9A41: D0 42
		LDA #$00					;C - - - - - 0x00FA53 03:9A43: A9 00
		STA objChrSlot+OSLOT_BUBBLE				;C - - - - - 0x00FA55 03:9A45: 8D 3F 06
		STA enemyReward+2				;C - - - - - 0x00FA58 03:9A48: 85 90
		STA enemyReward+5				;C - - - - - 0x00FA5A 03:9A4A: 85 93
		STA enemyReward+6				;C - - - - - 0x00FA5C 03:9A4C: 85 94
		LDA #$01					;C - - - - - 0x00FA5E 03:9A4E: A9 01
		STA objState+OSLOT_ENEMY				;C - - - - - 0x00FA60 03:9A50: 8D 6C 05
		STA objState+OSLOT_ENEMY+1				;C - - - - - 0x00FA63 03:9A53: 8D 6D 05
		LDA #$01					;C - - - - - 0x00FA66 03:9A56: A9 01
		STA enemyReward+4				;C - - - - - 0x00FA68 03:9A58: 85 92
		LDA #$14					;C - - - - - 0x00FA6A 03:9A5A: A9 14
		STA enemyReward				;C - - - - - 0x00FA6C 03:9A5C: 85 8E
		LDA #$40					;C - - - - - 0x00FA6E 03:9A5E: A9 40
		STA objX+OSLOT_ENEMY				;C - - - - - 0x00FA70 03:9A60: 8D BC 05
		LDA #$C0					;C - - - - - 0x00FA73 03:9A63: A9 C0
		STA objX+OSLOT_ENEMY+1				;C - - - - - 0x00FA75 03:9A65: 8D BD 05
		LDA #$A4					;C - - - - - 0x00FA78 03:9A68: A9 A4
		STA objY+OSLOT_ENEMY				;C - - - - - 0x00FA7A 03:9A6A: 8D 94 05
		STA objY+OSLOT_ENEMY+1				;C - - - - - 0x00FA7D 03:9A6D: 8D 95 05
		LDA #$01					;C - - - - - 0x00FA80 03:9A70: A9 01
		STA enemyHits+2				;C - - - - - 0x00FA82 03:9A72: 8D C0 04
		LDA #$00					;C - - - - - 0x00FA85 03:9A75: A9 00
		STA enemyHits+3				;C - - - - - 0x00FA87 03:9A77: 8D C1 04
		STA enemyHits+8				;C - - - - - 0x00FA8A 03:9A7A: 8D C6 04
		STA enemyHits+9				;C - - - - - 0x00FA8D 03:9A7D: 8D C7 04
		STA ram_00B4				;C - - - - - 0x00FA90 03:9A80: 85 B4
		STA objState+OSLOT_PROJ				;C - - - - - 0x00FA92 03:9A82: 8D 64 05
CODE_079A85:
	RTS							;C - - - - - 0x00FA95 03:9A85: 60

CODE_079A86:
	LDA objX+OSLOT_ENEMY				;C - - - - - 0x00FA96 03:9A86: AD BC 05
	SEC							;C - - - - - 0x00FA99 03:9A89: 38
	SBC objX+OSLOT_ENEMY+1				;C - - - - - 0x00FA9A 03:9A8A: ED BD 05
	BCS CODE_079A98				;C - - - - - 0x00FA9D 03:9A8D: B0 09
		EOR #$FF					;C - - - - - 0x00FA9F 03:9A8F: 49 FF
		STA scratch4				;C - - - - - 0x00FAA1 03:9A91: 85 04
		INC scratch4				;C - - - - - 0x00FAA3 03:9A93: E6 04
		JMP CODE_079A9A				;C - - - - - 0x00FAA5 03:9A95: 4C 9A 9A
CODE_079A98:
	STA scratch4				;C - - - - - 0x00FAA8 03:9A98: 85 04
CODE_079A9A:
	LDA #$0E					;C - - - - - 0x00FAAA 03:9A9A: A9 0E
	CMP scratch4				;C - - - - - 0x00FAAC 03:9A9C: C5 04
	BCC CODE_079ABB				;C - - - - - 0x00FAAE 03:9A9E: 90 1B
		LDA objY+OSLOT_ENEMY				;C - - - - - 0x00FAB0 03:9AA0: AD 94 05
		SEC							;C - - - - - 0x00FAB3 03:9AA3: 38
		SBC objY+OSLOT_ENEMY+1				;C - - - - - 0x00FAB4 03:9AA4: ED 95 05
		BCS CODE_079AB2				;C - - - - - 0x00FAB7 03:9AA7: B0 09
			EOR #$FF					;C - - - - - 0x00FAB9 03:9AA9: 49 FF
			STA scratch5				;C - - - - - 0x00FABB 03:9AAB: 85 05
			INC scratch5				;C - - - - - 0x00FABD 03:9AAD: E6 05
			JMP CODE_079AB4				;C - - - - - 0x00FABF 03:9AAF: 4C B4 9A
	CODE_079AB2:
		STA scratch5				;C - - - - - 0x00FAC2 03:9AB2: 85 05
	CODE_079AB4:
		LDA #$0E					;C - - - - - 0x00FAC4 03:9AB4: A9 0E
		CMP scratch5				;C - - - - - 0x00FAC6 03:9AB6: C5 05
		BCC CODE_079ABB				;C - - - - - 0x00FAC8 03:9AB8: 90 01
			SEC							;C - - - - - 0x00FACA 03:9ABA: 38
CODE_079ABB:
	RTS							;C - - - - - 0x00FACB 03:9ABB: 60

CODE_079ABC:
	LDA enemyDir,X				;C - - - - - 0x00FACC 03:9ABC: B5 A2
	STA scratch0				;C - - - - - 0x00FACE 03:9ABE: 85 00
	AND #$0F					;C - - - - - 0x00FAD0 03:9AC0: 29 0F
	CMP #$09					;C - - - - - 0x00FAD2 03:9AC2: C9 09
	BCC CODE_079AD2				;C - - - - - 0x00FAD4 03:9AC4: 90 0C
		LDA scratch0				;C - - - - - 0x00FAD6 03:9AC6: A5 00
		CLC							;C - - - - - 0x00FAD8 03:9AC8: 18
		ADC #$10					;C - - - - - 0x00FAD9 03:9AC9: 69 10
		AND #$F0					;C - - - - - 0x00FADB 03:9ACB: 29 F0
		STA scratch0				;C - - - - - 0x00FADD 03:9ACD: 85 00
		JMP CODE_079AD4				;C - - - - - 0x00FADF 03:9ACF: 4C D4 9A
CODE_079AD2:
	INC scratch0				;C - - - - - 0x00FAE2 03:9AD2: E6 00
CODE_079AD4:
	LDA scratch0				;C - - - - - 0x00FAE4 03:9AD4: A5 00
	STA enemyDir,X				;C - - - - - 0x00FAE6 03:9AD6: 95 A2
	RTS							;C - - - - - 0x00FAE8 03:9AD8: 60

CODE_079AD9:
	LDA ram_00B4				;C - - - - - 0x00FAE9 03:9AD9: A5 B4
	BNE CODE_079B0D				;C - - - - - 0x00FAEB 03:9ADB: D0 30
		INC ram_00B2				;C - - - - - 0x00FAED 03:9ADD: E6 B2
		LDA ram_00B2				;C - - - - - 0x00FAEF 03:9ADF: A5 B2
		CMP #$3C					;C - - - - - 0x00FAF1 03:9AE1: C9 3C
	BCC CODE_079B0D				;C - - - - - 0x00FAF3 03:9AE3: 90 28
	LDA #$00					;C - - - - - 0x00FAF5 03:9AE5: A9 00
	STA ram_00B2				;C - - - - - 0x00FAF7 03:9AE7: 85 B2
	DEC objY+OSLOT_BUBBLE+7				;C - - - - - 0x00FAF9 03:9AE9: CE A6 05
	BPL CODE_079B00				;C - - - - - 0x00FAFC 03:9AEC: 10 12
		LDA #$09					;C - - - - - 0x00FAFE 03:9AEE: A9 09
		STA objY+OSLOT_BUBBLE+7				;C - - - - - 0x00FB00 03:9AF0: 8D A6 05
		DEC objY+OSLOT_BUBBLE+8				;C - - - - - 0x00FB03 03:9AF3: CE A7 05
		BPL CODE_079B00				;C - - - - - 0x00FB06 03:9AF6: 10 08
			;Unreached
			LDA #$09					;- - - - - - 0x00FB08 03:9AF8: A9
			STA objY+OSLOT_BUBBLE+8				;- - - - - - 0x00FB0A 03:9AFA: 8D
			DEC objY+OSLOT_BUBBLE+9				;- - - - - - 0x00FB0D 03:9AFD: CE
CODE_079B00:
	LDA objY+OSLOT_BUBBLE+7				;C - - - - - 0x00FB10 03:9B00: AD A6 05
	ORA objY+OSLOT_BUBBLE+8				;C - - - - - 0x00FB13 03:9B03: 0D A7 05
	ORA objY+OSLOT_BUBBLE+9				;C - - - - - 0x00FB16 03:9B06: 0D A8 05
	BNE CODE_079B0D				;C - - - - - 0x00FB19 03:9B09: D0 02
		SEC							;C - - - - - 0x00FB1B 03:9B0B: 38
		RTS							;C - - - - - 0x00FB1C 03:9B0C: 60
CODE_079B0D:
	CLC							;C - - - - - 0x00FB1D 03:9B0D: 18
	RTS							;C - - - - - 0x00FB1E 03:9B0E: 60

CODE_079B0F:
	STY scratch5				;C - - - - - 0x00FB1F 03:9B0F: 84 05
	LDY #$00					;C - - - - - 0x00FB21 03:9B11: A0 00
	LDA vNametable				;C - - - - - 0x00FB23 03:9B13: A5 2D
	LSR							;C - - - - - 0x00FB25 03:9B15: 4A
	ROR							;C - - - - - 0x00FB26 03:9B16: 6A
	CLC							;C - - - - - 0x00FB27 03:9B17: 18
	ADC #$6A					;C - - - - - 0x00FB28 03:9B18: 69 6A
	STA scratch0				;C - - - - - 0x00FB2A 03:9B1A: 85 00

	LDA #.LOBYTE(CODE_079003)	;C - - - - - 0x00FB2C 03:9B1C: A9 03
	STA nmiUnbankedSub				;C - - - - - 0x00FB2E 03:9B1E: 85 35
	LDA #.HIBYTE(CODE_079003)	;C - - - - - 0x00FB30 03:9B20: A9 90
	STA nmiUnbankedSub+1				;C - - - - - 0x00FB32 03:9B22: 85 36
	LDA enemyDir				;C - - - - - 0x00FB34 03:9B24: A5 A2
	JSR CODE_079B51				;C - - - - - 0x00FB36 03:9B26: 20 51 9B
	LDA enemyDir				;C - - - - - 0x00FB39 03:9B29: A5 A2
	AND #$0F					;C - - - - - 0x00FB3B 03:9B2B: 29 0F
	JSR CODE_079B55				;C - - - - - 0x00FB3D 03:9B2D: 20 55 9B
	LDA enemyDir+1				;C - - - - - 0x00FB40 03:9B30: A5 A3
	JSR CODE_079B51				;C - - - - - 0x00FB42 03:9B32: 20 51 9B
	LDA enemyDir+1				;C - - - - - 0x00FB45 03:9B35: A5 A3
	AND #$0F					;C - - - - - 0x00FB47 03:9B37: 29 0F
	JSR CODE_079B55				;C - - - - - 0x00FB49 03:9B39: 20 55 9B
	LDA objY+OSLOT_BUBBLE+9				;C - - - - - 0x00FB4C 03:9B3C: AD A8 05
	JSR CODE_079B55				;C - - - - - 0x00FB4F 03:9B3F: 20 55 9B
	LDA objY+OSLOT_BUBBLE+8				;C - - - - - 0x00FB52 03:9B42: AD A7 05
	JSR CODE_079B55				;C - - - - - 0x00FB55 03:9B45: 20 55 9B
	LDA objY+OSLOT_BUBBLE+7				;C - - - - - 0x00FB58 03:9B48: AD A6 05
	JSR CODE_079B55				;C - - - - - 0x00FB5B 03:9B4B: 20 55 9B
	LDY scratch5				;C - - - - - 0x00FB5E 03:9B4E: A4 05
	RTS							;C - - - - - 0x00FB60 03:9B50: 60

CODE_079B51:
	LSR							;C - - - - - 0x00FB61 03:9B51: 4A
	LSR							;C - - - - - 0x00FB62 03:9B52: 4A
	LSR							;C - - - - - 0x00FB63 03:9B53: 4A
	LSR							;C - - - - - 0x00FB64 03:9B54: 4A
CODE_079B55:
	ASL							;C - - - - - 0x00FB65 03:9B55: 0A
	CLC							;C - - - - - 0x00FB66 03:9B56: 18
	ADC scratch0				;C - - - - - 0x00FB67 03:9B57: 65 00
	STA objY+OSLOT_BUBBLE,Y				;C - - - - - 0x00FB69 03:9B59: 99 9F 05
	INY							;C - - - - - 0x00FB6C 03:9B5C: C8
	RTS							;C - - - - - 0x00FB6D 03:9B5D: 60

CODE_079B5E:
	LDA roundPaused				;C - - - - - 0x00FB6E 03:9B5E: AD 74 04
	BEQ CODE_079B87				;C - - - - - 0x00FB71 03:9B61: F0 24
	LDA heldP1				;C - - - - - 0x00FB73 03:9B63: A5 0A
	AND #$10					;C - - - - - 0x00FB75 03:9B65: 29 10
	BEQ CODE_079B87				;C - - - - - 0x00FB77 03:9B67: F0 1E
		;Unreached
		LDA pressedP1				;- - - - - - 0x00FB79 03:9B69: A5
		AND #KEY_A					;- - - - - - 0x00FB7B 03:9B6B: 29
		BEQ CODE_079B75				;- - - - - - 0x00FB7D 03:9B6D: F0
			LDA enemyDir+2				;- - - - - - 0x00FB7F 03:9B6F: A5
			EOR #$01					;- - - - - - 0x00FB81 03:9B71: 49
			STA enemyDir+2				;- - - - - - 0x00FB83 03:9B73: 85
	CODE_079B75:
		LDA pressedP1				;- - - - - - 0x00FB85 03:9B75: A5
		AND #KEY_B					;- - - - - - 0x00FB87 03:9B77: 29
		BEQ CODE_079B87				;- - - - - - 0x00FB89 03:9B79: F0
			LDA enemyReward+1				;- - - - - - 0x00FB8B 03:9B7B: A5
			CMP #$03					;- - - - - - 0x00FB8D 03:9B7D: C9
			BNE CODE_079B87				;- - - - - - 0x00FB8F 03:9B7F: D0
				LDA enemyDir+8				;- - - - - - 0x00FB91 03:9B81: A5
				EOR #$01					;- - - - - - 0x00FB93 03:9B83: 49
				STA enemyDir+8				;- - - - - - 0x00FB95 03:9B85: 85
CODE_079B87:
	LDA pressedP1				;C - - - - - 0x00FB97 03:9B87: A5 0E
	AND #KEY_START				;C - - - - - 0x00FB99 03:9B89: 29 08
	BEQ CODE_079BE1				;C - - - - - 0x00FB9B 03:9B8B: F0 54

	LDA roundPaused				;C - - - - - 0x00FB9D 03:9B8D: AD 74 04
	EOR #$01					;C - - - - - 0x00FBA0 03:9B90: 49 01
	STA roundPaused				;C - - - - - 0x00FBA2 03:9B92: 8D 74 04
	BEQ CODE_079BBD				;C - - - - - 0x00FBA5 03:9B95: F0 26
		LDA #.LOBYTE(CODE_079B5E)	;C - - - - - 0x00FBA7 03:9B97: A9 5E
		STA nmiBankedSub			;C - - - - - 0x00FBA9 03:9B99: 85 16
		LDA #.HIBYTE(CODE_079B5E)	;C - - - - - 0x00FBAB 03:9B9B: A9 9B
		STA nmiBankedSub+1			;C - - - - - 0x00FBAD 03:9B9D: 85 17

		LDA #snPause_ID					;C - - - - - 0x00FBAF 03:9B9F: A9 01
		STA a:soundTrigger				;C - - - - - 0x00FBB1 03:9BA1: 8D E1 00

		LDA roundPaused				;C - - - - - 0x00FBB4 03:9BA4: AD 74 04
		STA a:jingleTrigger				;C - - - - - 0x00FBB7 03:9BA7: 8D E2 00
		;Cancelled out by pause sound

		LDX #BONUS_ANNOUNCE_PAUSE					;C - - - - - 0x00FBBA 03:9BAA: A2 08
		JSR DisplayBonusGameText				;C - - - - - 0x00FBBC 03:9BAC: 20 C4 9C

		LDA #$00					;C - - - - - 0x00FBBF 03:9BAF: A9 00
		STA objState+OSLOT_ICON				;C - - - - - 0x00FBC1 03:9BB1: 8D 76 05

		JSR AnimateNonBubbles				;C - - - - - 0x00FBC4 03:9BB4: 20 5C EE
		JSR DrawObjects				;C - - - - - 0x00FBC7 03:9BB7: 20 E2 EE
		JMP CODE_079BE1				;C - - - - - 0x00FBCA 03:9BBA: 4C E1 9B
CODE_079BBD:
	LDA #snPause_ID					;C - - - - - 0x00FBCD 03:9BBD: A9 01
	STA a:soundTrigger				;C - - - - - 0x00FBCF 03:9BBF: 8D E1 00
	LDA roundPaused				;C - - - - - 0x00FBD2 03:9BC2: AD 74 04
	STA a:jingleTrigger				;C - - - - - 0x00FBD5 03:9BC5: 8D E2 00

	LDA #.LOBYTE(CODE_0790A5)	;C - - - - - 0x00FBD8 03:9BC8: A9 A5
	STA nmiBankedSub			;C - - - - - 0x00FBDA 03:9BCA: 85 16
	LDA #.HIBYTE(CODE_0790A5)	;C - - - - - 0x00FBDC 03:9BCC: A9 90
	STA nmiBankedSub+1			;C - - - - - 0x00FBDE 03:9BCE: 85 17

	LDY objImgOfs+OSLOT_BUBBLE+1				;C - - - - - 0x00FBE0 03:9BD0: AC F0 05
	JSR DespawnProj_Direct				;C - - - - - 0x00FBE3 03:9BD3: 20 73 FE
	LDY objImgOfs+OSLOT_BUBBLE+2				;C - - - - - 0x00FBE6 03:9BD6: AC F1 05
	JSR DespawnProj_Direct				;C - - - - - 0x00FBE9 03:9BD9: 20 73 FE

	LDA #$01					;C - - - - - 0x00FBEC 03:9BDC: A9 01
	STA objState+OSLOT_ICON				;C - - - - - 0x00FBEE 03:9BDE: 8D 76 05
CODE_079BE1:
	RTS							;C - - - - - 0x00FBF1 03:9BE1: 60

CODE_079BE2:
	DEC currentRound				;C - - - - - 0x00FBF2 03:9BE2: C6 D8
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x00FBF4 03:9BE4: AD 6C 05
	PHA							;C - - - - - 0x00FBF7 03:9BE7: 48
	LDY #$00					;C - - - - - 0x00FBF8 03:9BE8: A0 00
	TYA							;C - - - - - 0x00FBFA 03:9BEA: 98
CODE_079BEB:
	STA objState,Y				;C - - - - - 0x00FBFB 03:9BEB: 99 63 05
	INY							;C - - - - - 0x00FBFE 03:9BEE: C8
	CPY #$28					;C - - - - - 0x00FBFF 03:9BEF: C0 28
	BCC CODE_079BEB				;C - - - - - 0x00FC01 03:9BF1: 90 F8

	PLA							;C - - - - - 0x00FC03 03:9BF3: 68
	STA objState+OSLOT_ENEMY				;C - - - - - 0x00FC04 03:9BF4: 8D 6C 05
	LDA powerUps				;C - - - - - 0x00FC07 03:9BF7: A5 DE
	AND #POWERUP_BOSS_BONUS					;C - - - - - 0x00FC09 03:9BF9: 29 80
	BNE CODE_079C05				;C - - - - - 0x00FC0B 03:9BFB: D0 08
		LDA #REWARDS_BONUS_GAME					;C - - - - - 0x00FC0D 03:9BFD: A9 00
		STA bigRewardCategory				;C - - - - - 0x00FC0F 03:9BFF: 8D 4F 05
		JMP CODE_079C23				;C - - - - - 0x00FC12 03:9C02: 4C 23 9C
CODE_079C05:
	LDA enemyDir+1				;C - - - - - 0x00FC15 03:9C05: A5 A3
	CMP enemyDir				;C - - - - - 0x00FC17 03:9C07: C5 A2
	BCC CODE_079C10				;C - - - - - 0x00FC19 03:9C09: 90 05
		LDX #BONUS_ANNOUNCE_NO_BONUS					;C - - - - - 0x00FC1B 03:9C0B: A2 04
		JMP CODE_079C1A				;C - - - - - 0x00FC1D 03:9C0D: 4C 1A 9C
CODE_079C10:
	LDA #$01					;C - - - - - 0x00FC20 03:9C10: A9 01
	STA scoreAdditionDigits+1				;C - - - - - 0x00FC22 03:9C12: 8D A2 04
	JSR AddScore				;C - - - - - 0x00FC25 03:9C15: 20 C7 FE
	LDX #BONUS_ANNOUNCE_100000					;C - - - - - 0x00FC28 03:9C18: A2 0A
CODE_079C1A:
	JSR DisplayBonusGameText				;C - - - - - 0x00FC2A 03:9C1A: 20 C4 9C
	LDA powerUps				;C - - - - - 0x00FC2D 03:9C1D: A5 DE
	AND #~POWERUP_BOSS_BONUS					;C - - - - - 0x00FC2F 03:9C1F: 29 7F
	STA powerUps				;C - - - - - 0x00FC31 03:9C21: 85 DE
CODE_079C23:
	LDA #$00					;C - - - - - 0x00FC33 03:9C23: A9 00
	STA objX+OSLOT_BUBBLE+2				;C - - - - - 0x00FC35 03:9C25: 8D C9 05

	LDA #.LOBYTE(ColorBufferToVRAM)	;C - - - - - 0x00FC38 03:9C28: A9 8A
	STA nmiUnbankedSub				;C - - - - - 0x00FC3A 03:9C2A: 85 35
	LDA #.HIBYTE(ColorBufferToVRAM)	;C - - - - - 0x00FC3C 03:9C2C: A9 E3
	STA nmiUnbankedSub+1				;C - - - - - 0x00FC3E 03:9C2E: 85 36

	LDA #.LOBYTE(CODE_079C44)	;C - - - - - 0x00FC40 03:9C30: A9 44
	STA nmiBankedSub			;C - - - - - 0x00FC42 03:9C32: 85 16
	LDA #.HIBYTE(CODE_079C44)	;C - - - - - 0x00FC44 03:9C34: A9 9C
	STA nmiBankedSub+1			;C - - - - - 0x00FC46 03:9C36: 85 17

	JSR AnimateNonBubbles				;C - - - - - 0x00FC48 03:9C38: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x00FC4B 03:9C3B: 20 E2 EE
	LDA #$01					;C - - - - - 0x00FC4E 03:9C3E: A9 01
	STA roundsToSkip				;C - - - - - 0x00FC50 03:9C40: 8D 7F 07
	RTS							;C - - - - - 0x00FC53 03:9C43: 60

CODE_079C44:
	INC objX+OSLOT_BUBBLE+2				;C - - - - - 0x00FC54 03:9C44: EE C9 05
	LDA objX+OSLOT_BUBBLE+2				;C - - - - - 0x00FC57 03:9C47: AD C9 05
	CMP #$B4					;C - - - - - 0x00FC5A 03:9C4A: C9 B4
	BCC CODE_079CBD				;C - - - - - 0x00FC5C 03:9C4C: 90 6F

	LDA #$00					;C - - - - - 0x00FC5E 03:9C4E: A9 00
	STA objState+OSLOT_ENEMY				;C - - - - - 0x00FC60 03:9C50: 8D 6C 05
	LDA objX+OSLOT_ENEMY				;C - - - - - 0x00FC63 03:9C53: AD BC 05
	STA objX				;C - - - - - 0x00FC66 03:9C56: 8D B3 05
	LDA objY+OSLOT_ENEMY				;C - - - - - 0x00FC69 03:9C59: AD 94 05
	STA objY				;C - - - - - 0x00FC6C 03:9C5C: 8D 8B 05
	LDA #$01					;C - - - - - 0x00FC6F 03:9C5F: A9 01
	STA objState				;C - - - - - 0x00FC71 03:9C61: 8D 63 05
	LDY #$00					;C - - - - - 0x00FC74 03:9C64: A0 00
	JSR DespawnProj_Direct				;C - - - - - 0x00FC76 03:9C66: 20 73 FE
	LDY #$01					;C - - - - - 0x00FC79 03:9C69: A0 01
	JSR DespawnProj_Direct				;C - - - - - 0x00FC7B 03:9C6B: 20 73 FE
	LDA enemyDir+9				;C - - - - - 0x00FC7E 03:9C6E: A5 AB
	STA roundFlags				;C - - - - - 0x00FC80 03:9C70: 8D 71 04
	CMP #$01					;C - - - - - 0x00FC83 03:9C73: C9 01
	BNE CODE_079C8A				;C - - - - - 0x00FC85 03:9C75: D0 13
		LDA #.LOBYTE(CODE_059EAF)					;C - - - - - 0x00FC87 03:9C77: A9 AF
		STA bankedSub				;C - - - - - 0x00FC89 03:9C79: 85 55
		LDA #.HIBYTE(CODE_059EAF)					;C - - - - - 0x00FC8B 03:9C7B: A9 9E
		STA bankedSub+1				;C - - - - - 0x00FC8D 03:9C7D: 85 56
		LDA #.BANK(CODE_059EAF)					;C - - - - - 0x00FC8F 03:9C7F: A9 05
		STA bankedSubBank				;C - - - - - 0x00FC91 03:9C81: 85 57
		LDA #.BANK(*)					;C - - - - - 0x00FC93 03:9C83: A9 07
		STA bankedSubRetBank				;C - - - - - 0x00FC95 03:9C85: 85 58
		JSR RunBankedSub				;C - - - - - 0x00FC97 03:9C87: 20 72 E7
CODE_079C8A:
	LDA #$00					;C - - - - - 0x00FC9A 03:9C8A: A9 00
	STA ram_054C				;C - - - - - 0x00FC9C 03:9C8C: 8D 4C 05
	LDA #$00					;C - - - - - 0x00FC9F 03:9C8F: A9 00
	STA playerState				;C - - - - - 0x00FCA1 03:9C91: 85 75
	STA ram_0076				;C - - - - - 0x00FCA3 03:9C93: 85 76
	STA objAnimProgress				;C - - - - - 0x00FCA5 03:9C95: 8D CB 06
	STA objAnimTimer				;C - - - - - 0x00FCA8 03:9C98: 8D A3 06
	LDA #anPlayerR_ID					;C - - - - - 0x00FCAB 03:9C9B: A9 02
	STA objAnim				;C - - - - - 0x00FCAD 03:9C9D: 8D 7B 06
	STA playerDir				;C - - - - - 0x00FCB0 03:9CA0: 85 77

	LDA #.LOBYTE(ColorBufferToVRAM)	;C - - - - - 0x00FCB2 03:9CA2: A9 8A
	STA nmiUnbankedSub			;C - - - - - 0x00FCB4 03:9CA4: 85 35
	LDA #.HIBYTE(ColorBufferToVRAM)	;C - - - - - 0x00FCB6 03:9CA6: A9 E3
	STA nmiUnbankedSub+1			;C - - - - - 0x00FCB8 03:9CA8: 85 36

	LDA #.LOBYTE(CODE_089F47)	;C - - - - - 0x00FCBA 03:9CAA: A9 47
	STA nmiBankedSub			;C - - - - - 0x00FCBC 03:9CAC: 85 16
	LDA #.HIBYTE(CODE_089F47)	;C - - - - - 0x00FCBE 03:9CAE: A9 9F
	STA nmiBankedSub+1			;C - - - - - 0x00FCC0 03:9CB0: 85 17
	LDA #.BANK(CODE_089F47)					;C - - - - - 0x00FCC2 03:9CB2: A9 08
	STA nmiPrgBankA				;C - - - - - 0x00FCC4 03:9CB4: 85 51

	LDA #$00					;C - - - - - 0x00FCC6 03:9CB6: A9 00
	STA ram_04D1				;C - - - - - 0x00FCC8 03:9CB8: 8D D1 04
	STA wideScrollDir				;C - - - - - 0x00FCCB 03:9CBB: 85 31
CODE_079CBD:
	JSR AnimateNonBubbles				;C - - - - - 0x00FCCD 03:9CBD: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x00FCD0 03:9CC0: 20 E2 EE
	RTS							;C - - - - - 0x00FCD3 03:9CC3: 60

DisplayBonusGameText:
	;X: Index doubled
	;02: BONUS 10000
	;04: NO BONUS
	;06: BONUS GAME
	;08: PAUSE
	;0A: BONUS 100000
	LDY #6					;C - - - - - 0x00FCD4 03:9CC4: A0 06
	JSR DespawnProj_Direct				;C - - - - - 0x00FCD6 03:9CC6: 20 73 FE
	INY							;C - - - - - 0x00FCD9 03:9CC9: C8
	JSR DespawnProj_Direct				;C - - - - - 0x00FCDA 03:9CCA: 20 73 FE

	CPX #BONUS_ANNOUNCE_GAME					;C - - - - - 0x00FCDD 03:9CCD: E0 06
	BEQ @spawn				;C - - - - - 0x00FCDF 03:9CCF: F0 08

	CPX #BONUS_ANNOUNCE_PAUSE					;C - - - - - 0x00FCE1 03:9CD1: E0 08
	BEQ @spawn				;C - - - - - 0x00FCE3 03:9CD3: F0 04

	LDA powerUps				;C - - - - - 0x00FCE5 03:9CD5: A5 DE
	BPL @end				;C - - - - - 0x00FCE7 03:9CD7: 10 21
	;Have POWERUP_BOSS_BONUS

@spawn:
	LDA #.BANK(BonusAnnounceTable)					;C - - - - - 0x00FCE9 03:9CD9: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00FCEB 03:9CDB: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00FCED 03:9CDD: 20 56 FF
.endif

	LDA BonusAnnounceTable,X			;C - - - - - 0x00FCF0 03:9CE0: BD F6 BD
	STA scratch8				;C - - - - - 0x00FCF3 03:9CE3: 85 08
	LDA BonusAnnounceTable+1,X			;C - - - - - 0x00FCF5 03:9CE5: BD F7 BD
	STA scratch9				;C - - - - - 0x00FCF8 03:9CE8: 85 09
	LDY #$00					;C - - - - - 0x00FCFA 03:9CEA: A0 00
	JSR SpawnBonusAnnounceObj				;C - - - - - 0x00FCFC 03:9CEC: 20 FB 9C

	STY objImgOfs+OSLOT_BUBBLE+1				;C - - - - - 0x00FCFF 03:9CEF: 8C F0 05
	LDY #$05					;C - - - - - 0x00FD02 03:9CF2: A0 05
	JSR SpawnBonusAnnounceObj				;C - - - - - 0x00FD04 03:9CF4: 20 FB 9C

	STY objImgOfs+OSLOT_BUBBLE+2				;C - - - - - 0x00FD07 03:9CF7: 8C F1 05
@end:
	RTS							;C - - - - - 0x00FD0A 03:9CFA: 60

SpawnBonusAnnounceObj:
	;08: Struct reading adr

	;ID
	LDA #psSplashText_ID					;C - - - - - 0x00FD0B 03:9CFB: A9 17
	STA scratch5				;C - - - - - 0x00FD0D 03:9CFD: 85 05

	;Anim
	LDA (scratch8),Y			;C - - - - - 0x00FD0F 03:9CFF: B1 08
	STA scratch6				;C - - - - - 0x00FD11 03:9D01: 85 06
	INY							;C - - - - - 0x00FD13 03:9D03: C8
	LDA (scratch8),Y			;C - - - - - 0x00FD14 03:9D04: B1 08
	STA scratch7				;C - - - - - 0x00FD16 03:9D06: 85 07
	INY							;C - - - - - 0x00FD18 03:9D08: C8
	;X
	LDA (scratch8),Y			;C - - - - - 0x00FD19 03:9D09: B1 08
	STA scratch0				;C - - - - - 0x00FD1B 03:9D0B: 85 00
	INY							;C - - - - - 0x00FD1D 03:9D0D: C8
	;Y
	LDA (scratch8),Y			;C - - - - - 0x00FD1E 03:9D0E: B1 08
	STA scratch1				;C - - - - - 0x00FD20 03:9D10: 85 01
	INY							;C - - - - - 0x00FD22 03:9D12: C8
	;CHR slot
	LDA (scratch8),Y			;C - - - - - 0x00FD23 03:9D13: B1 08
	STA scratch2				;C - - - - - 0x00FD25 03:9D15: 85 02

	JSR SpawnProj				;C - - - - - 0x00FD27 03:9D17: 20 82 FE
	LDA #$00					;C - - - - - 0x00FD2A 03:9D1A: A9 00
	STA objAttr+OSLOT_PROJ,Y				;C - - - - - 0x00FD2C 03:9D1C: 99 F4 06
	RTS							;C - - - - - 0x00FD2F 03:9D1F: 60

CODE_079D20:
	LDA enemyReward+1				;C - - - - - 0x00FD30 03:9D20: A5 8F
	CMP #$01					;C - - - - - 0x00FD32 03:9D22: C9 01
	BEQ CODE_079D30				;C - - - - - 0x00FD34 03:9D24: F0 0A
		CMP #$02					;C - - - - - 0x00FD36 03:9D26: C9 02
		BNE CODE_079D2D				;C - - - - - 0x00FD38 03:9D28: D0 03
			JMP CODE_079DF9				;C - - - - - 0x00FD3A 03:9D2A: 4C F9 9D
	CODE_079D2D:
		JMP CODE_079E71				;C - - - - - 0x00FD3D 03:9D2D: 4C 71 9E
CODE_079D30:
	JSR CODE_079F0F				;C - - - - - 0x00FD40 03:9D30: 20 0F 9F
	LDA objState+OSLOT_PROJ				;C - - - - - 0x00FD43 03:9D33: AD 64 05
	BEQ CODE_079D44				;C - - - - - 0x00FD46 03:9D36: F0 0C
	LDA enemyReward+5				;C - - - - - 0x00FD48 03:9D38: A5 93
	BNE CODE_079D44				;C - - - - - 0x00FD4A 03:9D3A: D0 08
		LDA enemyReward+4				;C - - - - - 0x00FD4C 03:9D3C: A5 92
		BEQ CODE_079D47				;C - - - - - 0x00FD4E 03:9D3E: F0 07
		LDA ram_00AF				;C - - - - - 0x00FD50 03:9D40: A5 AF
		BNE CODE_079D47				;C - - - - - 0x00FD52 03:9D42: D0 03
CODE_079D44:
	JMP CODE_079DE0				;C - - - - - 0x00FD54 03:9D44: 4C E0 9D
CODE_079D47:
	LDA ram_00AE				;C - - - - - 0x00FD57 03:9D47: A5 AE
	BEQ CODE_079D57				;C - - - - - 0x00FD59 03:9D49: F0 0C
		JSR CODE_079DE1				;C - - - - - 0x00FD5B 03:9D4B: 20 E1 9D
		LDA ram_00AC				;C - - - - - 0x00FD5E 03:9D4E: A5 AC
		CMP #$16					;C - - - - - 0x00FD60 03:9D50: C9 16
		BCC CODE_079DAA				;C - - - - - 0x00FD62 03:9D52: 90 56
			JMP CODE_079DE0				;C - - - - - 0x00FD64 03:9D54: 4C E0 9D
CODE_079D57:
	LDA ram_00AF				;C - - - - - 0x00FD67 03:9D57: A5 AF
	BNE CODE_079D7B				;C - - - - - 0x00FD69 03:9D59: D0 20

	LDA ram_00B0				;C - - - - - 0x00FD6B 03:9D5B: A5 B0
	CMP #$30					;C - - - - - 0x00FD6D 03:9D5D: C9 30
	BCS CODE_079D7B				;C - - - - - 0x00FD6F 03:9D5F: B0 1A

	LDA ram_00AD				;C - - - - - 0x00FD71 03:9D61: A5 AD
	CMP #$48					;C - - - - - 0x00FD73 03:9D63: C9 48
	BCS CODE_079D7B				;C - - - - - 0x00FD75 03:9D65: B0 14

	LDA projVSpeed				;C - - - - - 0x00FD77 03:9D67: AD 35 05
	BPL CODE_079D75				;C - - - - - 0x00FD7A 03:9D6A: 10 09
		EOR #$FF					;C - - - - - 0x00FD7C 03:9D6C: 49 FF
		CLC							;C - - - - - 0x00FD7E 03:9D6E: 18
		ADC #$01					;C - - - - - 0x00FD7F 03:9D6F: 69 01
		CMP #$03					;C - - - - - 0x00FD81 03:9D71: C9 03
		BCS CODE_079D7B				;C - - - - - 0x00FD83 03:9D73: B0 06
CODE_079D75:
	JSR CODE_079DED				;C - - - - - 0x00FD85 03:9D75: 20 ED 9D
	JMP CODE_079DE0				;C - - - - - 0x00FD88 03:9D78: 4C E0 9D
CODE_079D7B:
	LDA projHSpeed				;C - - - - - 0x00FD8B 03:9D7B: AD 2D 05
	BMI CODE_079D9E				;C - - - - - 0x00FD8E 03:9D7E: 30 1E
	CMP #$03					;C - - - - - 0x00FD90 03:9D80: C9 03
	BCC CODE_079D9E				;C - - - - - 0x00FD92 03:9D82: 90 1A
		CMP #$06					;C - - - - - 0x00FD94 03:9D84: C9 06
		BCS CODE_079D98				;C - - - - - 0x00FD96 03:9D86: B0 10
		LDA ram_00AD				;C - - - - - 0x00FD98 03:9D88: A5 AD
		CMP #$58					;C - - - - - 0x00FD9A 03:9D8A: C9 58
		BCS CODE_079D98				;C - - - - - 0x00FD9C 03:9D8C: B0 0A
			CMP #$28					;C - - - - - 0x00FD9E 03:9D8E: C9 28
			BCC CODE_079D9E				;C - - - - - 0x00FDA0 03:9D90: 90 0C
			LDA ram_00AC				;C - - - - - 0x00FDA2 03:9D92: A5 AC
			CMP #$20					;C - - - - - 0x00FDA4 03:9D94: C9 20
			BCS CODE_079D9E				;C - - - - - 0x00FDA6 03:9D96: B0 06
	CODE_079D98:
		JSR CODE_079DE1				;C - - - - - 0x00FDA8 03:9D98: 20 E1 9D
		JMP CODE_079DE0				;C - - - - - 0x00FDAB 03:9D9B: 4C E0 9D
CODE_079D9E:
	LDA ram_00AC				;C - - - - - 0x00FDAE 03:9D9E: A5 AC
	CMP #$06					;C - - - - - 0x00FDB0 03:9DA0: C9 06
	BCC CODE_079DAA				;C - - - - - 0x00FDB2 03:9DA2: 90 06
		JSR CODE_079DE7				;C - - - - - 0x00FDB4 03:9DA4: 20 E7 9D
		JMP CODE_079DE0				;C - - - - - 0x00FDB7 03:9DA7: 4C E0 9D
CODE_079DAA:
	LDA projHSpeed				;C - - - - - 0x00FDBA 03:9DAA: AD 2D 05
	BNE CODE_079DB2				;C - - - - - 0x00FDBD 03:9DAD: D0 03
		JSR CODE_079DED				;C - - - - - 0x00FDBF 03:9DAF: 20 ED 9D
CODE_079DB2:
	LDA ram_00AD				;C - - - - - 0x00FDC2 03:9DB2: A5 AD
	BMI CODE_079DBC				;C - - - - - 0x00FDC4 03:9DB4: 30 06
		LDA ram_00AD				;C - - - - - 0x00FDC6 03:9DB6: A5 AD
		CMP #$10					;C - - - - - 0x00FDC8 03:9DB8: C9 10
		BCS CODE_079DC2				;C - - - - - 0x00FDCA 03:9DBA: B0 06
CODE_079DBC:
	JSR CODE_079DF3				;C - - - - - 0x00FDCC 03:9DBC: 20 F3 9D
	JMP CODE_079DE0				;C - - - - - 0x00FDCF 03:9DBF: 4C E0 9D
CODE_079DC2:
	LDA enemyReward+4				;C - - - - - 0x00FDD2 03:9DC2: A5 92
	BNE CODE_079DD3				;C - - - - - 0x00FDD4 03:9DC4: D0 0D
		LDA projHSpeed				;C - - - - - 0x00FDD6 03:9DC6: AD 2D 05
		BMI CODE_079DE0				;C - - - - - 0x00FDD9 03:9DC9: 30 15
		CMP #$04					;C - - - - - 0x00FDDB 03:9DCB: C9 04
		BCC CODE_079DE0				;C - - - - - 0x00FDDD 03:9DCD: 90 11
		CMP #$06					;C - - - - - 0x00FDDF 03:9DCF: C9 06
		BCS CODE_079DDD				;C - - - - - 0x00FDE1 03:9DD1: B0 0A
CODE_079DD3:
	LDA ram_00AD				;C - - - - - 0x00FDE3 03:9DD3: A5 AD
	CMP #$30					;C - - - - - 0x00FDE5 03:9DD5: C9 30
	BCS CODE_079DE0				;C - - - - - 0x00FDE7 03:9DD7: B0 07
	CMP #$28					;C - - - - - 0x00FDE9 03:9DD9: C9 28
	BCC CODE_079DE0				;C - - - - - 0x00FDEB 03:9DDB: 90 03
CODE_079DDD:
	JSR CODE_079DED				;C - - - - - 0x00FDED 03:9DDD: 20 ED 9D
CODE_079DE0:
	RTS							;C - - - - - 0x00FDF0 03:9DE0: 60

CODE_079DE1:
	LDA #$80					;C - - - - - 0x00FDF1 03:9DE1: A9 80
	STA bubbleProgress+8				;C - - - - - 0x00FDF3 03:9DE3: 8D DD 04
	RTS							;C - - - - - 0x00FDF6 03:9DE6: 60

CODE_079DE7:
	LDA #$40					;C - - - - - 0x00FDF7 03:9DE7: A9 40
	STA bubbleProgress+8				;C - - - - - 0x00FDF9 03:9DE9: 8D DD 04
	RTS							;C - - - - - 0x00FDFC 03:9DEC: 60

CODE_079DED:
	LDA #$01					;C - - - - - 0x00FDFD 03:9DED: A9 01
	STA bubbleProgress+9				;C - - - - - 0x00FDFF 03:9DEF: 8D DE 04
	RTS							;C - - - - - 0x00FE02 03:9DF2: 60

CODE_079DF3:
	LDA #$02					;C - - - - - 0x00FE03 03:9DF3: A9 02
	STA bubbleProgress+9				;C - - - - - 0x00FE05 03:9DF5: 8D DE 04
	RTS							;C - - - - - 0x00FE08 03:9DF8: 60

CODE_079DF9:
	JSR CODE_079F0F				;C - - - - - 0x00FE09 03:9DF9: 20 0F 9F
	LDA objY+OSLOT_ENEMY				;C - - - - - 0x00FE0C 03:9DFC: AD 94 05
	STA scratch0				;C - - - - - 0x00FE0F 03:9DFF: 85 00
	LDA globalTimer				;C - - - - - 0x00FE11 03:9E01: A5 14
	AND #$3F					;C - - - - - 0x00FE13 03:9E03: 29 3F
	CLC							;C - - - - - 0x00FE15 03:9E05: 18
	ADC scratch0				;C - - - - - 0x00FE16 03:9E06: 65 00
	CMP objY+OSLOT_ENEMY+1				;C - - - - - 0x00FE18 03:9E08: CD 95 05
	BCS CODE_079E10				;C - - - - - 0x00FE1B 03:9E0B: B0 03
		JSR CODE_079DED				;C - - - - - 0x00FE1D 03:9E0D: 20 ED 9D
CODE_079E10:
	LDA objX+OSLOT_ENEMY				;C - - - - - 0x00FE20 03:9E10: AD BC 05
	CMP objX+OSLOT_ENEMY+1				;C - - - - - 0x00FE23 03:9E13: CD BD 05
	BCS CODE_079E2A				;C - - - - - 0x00FE26 03:9E16: B0 12
		LDA globalTimer				;C - - - - - 0x00FE28 03:9E18: A5 14
		AND #$3F					;C - - - - - 0x00FE2A 03:9E1A: 29 3F
		BNE CODE_079E24				;C - - - - - 0x00FE2C 03:9E1C: D0 06
			JSR CODE_079DED				;C - - - - - 0x00FE2E 03:9E1E: 20 ED 9D
			JMP CODE_079E39				;C - - - - - 0x00FE31 03:9E21: 4C 39 9E
	CODE_079E24:
		JSR CODE_079DE7				;C - - - - - 0x00FE34 03:9E24: 20 E7 9D
		JMP CODE_079E39				;C - - - - - 0x00FE37 03:9E27: 4C 39 9E
CODE_079E2A:
	LDA globalTimer				;C - - - - - 0x00FE3A 03:9E2A: A5 14
	AND #$3F					;C - - - - - 0x00FE3C 03:9E2C: 29 3F
	BNE CODE_079E36				;C - - - - - 0x00FE3E 03:9E2E: D0 06
		JSR CODE_079DED				;C - - - - - 0x00FE40 03:9E30: 20 ED 9D
		JMP CODE_079E39				;C - - - - - 0x00FE43 03:9E33: 4C 39 9E
CODE_079E36:
	JSR CODE_079DE1				;C - - - - - 0x00FE46 03:9E36: 20 E1 9D
CODE_079E39:
	LDA objY+OSLOT_ENEMY+1				;C - - - - - 0x00FE49 03:9E39: AD 95 05
	CLC							;C - - - - - 0x00FE4C 03:9E3C: 18
	ADC #$08					;C - - - - - 0x00FE4D 03:9E3D: 69 08
	SEC							;C - - - - - 0x00FE4F 03:9E3F: 38
	SBC objY+OSLOT_ENEMY				;C - - - - - 0x00FE50 03:9E40: ED 94 05
	BPL CODE_079E4A				;C - - - - - 0x00FE53 03:9E43: 10 05
		EOR #$FF					;C - - - - - 0x00FE55 03:9E45: 49 FF
		CLC							;C - - - - - 0x00FE57 03:9E47: 18
		ADC #$01					;C - - - - - 0x00FE58 03:9E48: 69 01
CODE_079E4A:
	CMP #$10					;C - - - - - 0x00FE5A 03:9E4A: C9 10
	BCC CODE_079E63				;C - - - - - 0x00FE5C 03:9E4C: 90 15
		CMP #$38					;C - - - - - 0x00FE5E 03:9E4E: C9 38
		BCC CODE_079E70				;C - - - - - 0x00FE60 03:9E50: 90 1E

		LDA objY+OSLOT_ENEMY				;C - - - - - 0x00FE62 03:9E52: AD 94 05
		CMP objY+OSLOT_ENEMY+1				;C - - - - - 0x00FE65 03:9E55: CD 95 05
		BCC CODE_079E70				;C - - - - - 0x00FE68 03:9E58: 90 16
			JSR CODE_079DE7				;C - - - - - 0x00FE6A 03:9E5A: 20 E7 9D
			JSR CODE_079DED				;C - - - - - 0x00FE6D 03:9E5D: 20 ED 9D
			JMP CODE_079E70				;C - - - - - 0x00FE70 03:9E60: 4C 70 9E
CODE_079E63:
	LDA ram_00B0				;C - - - - - 0x00FE73 03:9E63: A5 B0
	CMP #$10					;C - - - - - 0x00FE75 03:9E65: C9 10
	BCS CODE_079E70				;C - - - - - 0x00FE77 03:9E67: B0 07
	CMP #$08					;C - - - - - 0x00FE79 03:9E69: C9 08
	BCC CODE_079E70				;C - - - - - 0x00FE7B 03:9E6B: 90 03
		JSR CODE_079DF3				;C - - - - - 0x00FE7D 03:9E6D: 20 F3 9D
CODE_079E70:
	RTS							;C - - - - - 0x00FE80 03:9E70: 60

CODE_079E71:
	JSR CODE_079F0F				;C - - - - - 0x00FE81 03:9E71: 20 0F 9F
	LDA objState+OSLOT_PROJ				;C - - - - - 0x00FE84 03:9E74: AD 64 05
	BNE CODE_079E7C				;C - - - - - 0x00FE87 03:9E77: D0 03
		JMP CODE_079F0E				;C - - - - - 0x00FE89 03:9E79: 4C 0E 9F
CODE_079E7C:
	LDA ram_00AC				;C - - - - - 0x00FE8C 03:9E7C: A5 AC
	CMP #$38					;C - - - - - 0x00FE8E 03:9E7E: C9 38
	BCS CODE_079EB1				;C - - - - - 0x00FE90 03:9E80: B0 2F
		LDA projHSpeed				;C - - - - - 0x00FE92 03:9E82: AD 2D 05
		BEQ CODE_079EA8				;C - - - - - 0x00FE95 03:9E85: F0 21
		LDA ram_00B0				;C - - - - - 0x00FE97 03:9E87: A5 B0
		CMP #$10					;C - - - - - 0x00FE99 03:9E89: C9 10
		BCS CODE_079EB1				;C - - - - - 0x00FE9B 03:9E8B: B0 24
		CMP #$08					;C - - - - - 0x00FE9D 03:9E8D: C9 08
		BCC CODE_079EB1				;C - - - - - 0x00FE9F 03:9E8F: 90 20
			JSR CODE_079DF3				;C - - - - - 0x00FEA1 03:9E91: 20 F3 9D
			LDA objX+OSLOT_ENEMY				;C - - - - - 0x00FEA4 03:9E94: AD BC 05
			CMP objX+OSLOT_ENEMY+1				;C - - - - - 0x00FEA7 03:9E97: CD BD 05
			BCC CODE_079EA2				;C - - - - - 0x00FEAA 03:9E9A: 90 06
				JSR CODE_079DE1				;C - - - - - 0x00FEAC 03:9E9C: 20 E1 9D
				JMP CODE_079F0E				;C - - - - - 0x00FEAF 03:9E9F: 4C 0E 9F
		CODE_079EA2:
			JSR CODE_079DE7				;C - - - - - 0x00FEB2 03:9EA2: 20 E7 9D
			JMP CODE_079F0E				;C - - - - - 0x00FEB5 03:9EA5: 4C 0E 9F
	CODE_079EA8:
		LDA ram_00AC				;C - - - - - 0x00FEB8 03:9EA8: A5 AC
		CMP #$28					;C - - - - - 0x00FEBA 03:9EAA: C9 28
		BCS CODE_079EB1				;C - - - - - 0x00FEBC 03:9EAC: B0 03
			JSR CODE_079DED				;C - - - - - 0x00FEBE 03:9EAE: 20 ED 9D
CODE_079EB1:
	LDA ram_00AE				;C - - - - - 0x00FEC1 03:9EB1: A5 AE
	BEQ CODE_079EC3				;C - - - - - 0x00FEC3 03:9EB3: F0 0E
		LDA ram_00AC				;C - - - - - 0x00FEC5 03:9EB5: A5 AC
		CMP #$06					;C - - - - - 0x00FEC7 03:9EB7: C9 06
		BCC CODE_079ED1				;C - - - - - 0x00FEC9 03:9EB9: 90 16
		BEQ CODE_079ED1				;C - - - - - 0x00FECB 03:9EBB: F0 14
			JSR CODE_079DE1				;C - - - - - 0x00FECD 03:9EBD: 20 E1 9D
			JMP CODE_079F0E				;C - - - - - 0x00FED0 03:9EC0: 4C 0E 9F
CODE_079EC3:
	LDA ram_00AC				;C - - - - - 0x00FED3 03:9EC3: A5 AC
	CMP #$06					;C - - - - - 0x00FED5 03:9EC5: C9 06
	BCC CODE_079ED1				;C - - - - - 0x00FED7 03:9EC7: 90 08
	BEQ CODE_079ED1				;C - - - - - 0x00FED9 03:9EC9: F0 06
		JSR CODE_079DE7				;C - - - - - 0x00FEDB 03:9ECB: 20 E7 9D
		JMP CODE_079F0E				;C - - - - - 0x00FEDE 03:9ECE: 4C 0E 9F
CODE_079ED1:
	LDA projHSpeed				;C - - - - - 0x00FEE1 03:9ED1: AD 2D 05
	BNE CODE_079EF4				;C - - - - - 0x00FEE4 03:9ED4: D0 1E

	LDA ram_00AC				;C - - - - - 0x00FEE6 03:9ED6: A5 AC
	CMP #$06					;C - - - - - 0x00FEE8 03:9ED8: C9 06
	BEQ CODE_079EF4				;C - - - - - 0x00FEEA 03:9EDA: F0 18

	LDA objX+OSLOT_ENEMY+1				;C - - - - - 0x00FEEC 03:9EDC: AD BD 05
	BMI CODE_079EE7				;C - - - - - 0x00FEEF 03:9EDF: 30 06
		CMP #$1A					;C - - - - - 0x00FEF1 03:9EE1: C9 1A
		BCC CODE_079EF1				;C - - - - - 0x00FEF3 03:9EE3: 90 0C
		BCS CODE_079EEB				;C - - - - - 0x00FEF5 03:9EE5: B0 04
CODE_079EE7:
	CMP #$E2					;C - - - - - 0x00FEF7 03:9EE7: C9 E2
	BCC CODE_079EF1				;C - - - - - 0x00FEF9 03:9EE9: 90 06
CODE_079EEB:
	JSR CODE_079DE7				;C - - - - - 0x00FEFB 03:9EEB: 20 E7 9D
	JMP CODE_079EF4				;C - - - - - 0x00FEFE 03:9EEE: 4C F4 9E
CODE_079EF1:
	JSR CODE_079DE1				;C - - - - - 0x00FF01 03:9EF1: 20 E1 9D
CODE_079EF4:
	LDA ram_00AD				;C - - - - - 0x00FF04 03:9EF4: A5 AD
	CMP #$16					;C - - - - - 0x00FF06 03:9EF6: C9 16
	BCS CODE_079F0E				;C - - - - - 0x00FF08 03:9EF8: B0 14
		JSR CODE_079DED				;C - - - - - 0x00FF0A 03:9EFA: 20 ED 9D
		LDA projVSpeed				;C - - - - - 0x00FF0D 03:9EFD: AD 35 05
		BPL CODE_079F07				;C - - - - - 0x00FF10 03:9F00: 10 05
			EOR #$FF					;C - - - - - 0x00FF12 03:9F02: 49 FF
			CLC							;C - - - - - 0x00FF14 03:9F04: 18
			ADC #$01					;C - - - - - 0x00FF15 03:9F05: 69 01
	CODE_079F07:
		CMP #$03					;C - - - - - 0x00FF17 03:9F07: C9 03
		BCS CODE_079F0E				;C - - - - - 0x00FF19 03:9F09: B0 03
			JSR CODE_079DF3				;C - - - - - 0x00FF1B 03:9F0B: 20 F3 9D
CODE_079F0E:
	RTS							;C - - - - - 0x00FF1E 03:9F0E: 60

CODE_079F0F:
	LDA #$00					;C - - - - - 0x00FF1F 03:9F0F: A9 00
	STA bubbleProgress+8				;C - - - - - 0x00FF21 03:9F11: 8D DD 04
	STA bubbleProgress+9				;C - - - - - 0x00FF24 03:9F14: 8D DE 04
	LDA #$00					;C - - - - - 0x00FF27 03:9F17: A9 00
	STA ram_00AE				;C - - - - - 0x00FF29 03:9F19: 85 AE
	LDA objX+OSLOT_ENEMY+1				;C - - - - - 0x00FF2B 03:9F1B: AD BD 05
	SEC							;C - - - - - 0x00FF2E 03:9F1E: 38
	SBC objX+OSLOT_PROJ				;C - - - - - 0x00FF2F 03:9F1F: ED B4 05
	BCS CODE_079F2B				;C - - - - - 0x00FF32 03:9F22: B0 07
		EOR #$FF					;C - - - - - 0x00FF34 03:9F24: 49 FF
		CLC							;C - - - - - 0x00FF36 03:9F26: 18
		ADC #$01					;C - - - - - 0x00FF37 03:9F27: 69 01
		INC ram_00AE				;C - - - - - 0x00FF39 03:9F29: E6 AE
CODE_079F2B:
	STA ram_00AC				;C - - - - - 0x00FF3B 03:9F2B: 85 AC
	LDA objY+OSLOT_ENEMY+1				;C - - - - - 0x00FF3D 03:9F2D: AD 95 05
	SEC							;C - - - - - 0x00FF40 03:9F30: 38
	SBC objY+OSLOT_PROJ				;C - - - - - 0x00FF41 03:9F31: ED 8C 05
	STA ram_00AD				;C - - - - - 0x00FF44 03:9F34: 85 AD
	LDA #$00					;C - - - - - 0x00FF46 03:9F36: A9 00
	STA ram_00AF				;C - - - - - 0x00FF48 03:9F38: 85 AF
	LDA objX+OSLOT_PROJ				;C - - - - - 0x00FF4A 03:9F3A: AD B4 05
	CMP #$80					;C - - - - - 0x00FF4D 03:9F3D: C9 80
	ROL ram_00AF				;C - - - - - 0x00FF4F 03:9F3F: 26 AF
	LDA objX+OSLOT_ENEMY				;C - - - - - 0x00FF51 03:9F41: AD BC 05
	SEC							;C - - - - - 0x00FF54 03:9F44: 38
	SBC objX+OSLOT_ENEMY+1				;C - - - - - 0x00FF55 03:9F45: ED BD 05
	BPL CODE_079F4F				;C - - - - - 0x00FF58 03:9F48: 10 05
		EOR #$FF					;C - - - - - 0x00FF5A 03:9F4A: 49 FF
		CLC							;C - - - - - 0x00FF5C 03:9F4C: 18
		ADC #$01					;C - - - - - 0x00FF5D 03:9F4D: 69 01
CODE_079F4F:
	STA ram_00B0				;C - - - - - 0x00FF5F 03:9F4F: 85 B0
	RTS							;C - - - - - 0x00FF61 03:9F51: 60

CODE_079F52:
	LDX #$00					;C - - - - - 0x00FF62 03:9F52: A2 00
CODE_079F54:
	LDA DATA_079F60,X			;C - - - - - 0x00FF64 03:9F54: BD 60 9F
	STA objAttr+OSLOT_BUBBLE,X				;C - - - - - 0x00FF67 03:9F57: 9D 07 07
	INX							;C - - - - - 0x00FF6A 03:9F5A: E8
	CPX #20					;C - - - - - 0x00FF6B 03:9F5B: E0 14
	BCC CODE_079F54				;C - - - - - 0x00FF6D 03:9F5D: 90 F5

	RTS							;C - - - - - 0x00FF6F 03:9F5F: 60

DATA_079F60:
	.byte $00					;- D 0 - - - 0x00FF70 03:9F60: 00
	.byte $00					;- D 0 - - - 0x00FF71 03:9F61: 00
	.byte $3F					;- D 0 - - - 0x00FF72 03:9F62: 3F
	.byte $FC					;- D 0 - - - 0x00FF73 03:9F63: FC
	.byte $3F					;- D 0 - - - 0x00FF74 03:9F64: 3F
	.byte $FC					;- D 0 - - - 0x00FF75 03:9F65: FC
	.byte $04					;- D 0 - - - 0x00FF76 03:9F66: 04
	.byte $20					;- D 0 - - - 0x00FF77 03:9F67: 20
	.byte $3F					;- D 0 - - - 0x00FF78 03:9F68: 3F
	.byte $FC					;- D 0 - - - 0x00FF79 03:9F69: FC
	.byte $04					;- D 0 - - - 0x00FF7A 03:9F6A: 04
	.byte $20					;- D 0 - - - 0x00FF7B 03:9F6B: 20
	.byte $04					;- D 0 - - - 0x00FF7C 03:9F6C: 04
	.byte $20					;- D 0 - - - 0x00FF7D 03:9F6D: 20
	.byte $3F					;- D 0 - - - 0x00FF7E 03:9F6E: 3F
	.byte $FC					;- D 0 - - - 0x00FF7F 03:9F6F: FC
	.byte $04					;- D 0 - - - 0x00FF80 03:9F70: 04
	.byte $20					;- D 0 - - - 0x00FF81 03:9F71: 20
	.byte $3F					;- D 0 - - - 0x00FF82 03:9F72: 3F
	.byte $FC					;- D 0 - - - 0x00FF83 03:9F73: FC

CODE_079F74:
	TYA							;C - - - - - 0x00FF84 03:9F74: 98
	PHA							;C - - - - - 0x00FF85 03:9F75: 48
	TXA							;C - - - - - 0x00FF86 03:9F76: 8A
	PHA							;C - - - - - 0x00FF87 03:9F77: 48
	TYA							;C - - - - - 0x00FF88 03:9F78: 98
	SEC							;C - - - - - 0x00FF89 03:9F79: 38
	SBC #$10					;C - - - - - 0x00FF8A 03:9F7A: E9 10
	BCC CODE_079FE3				;C - - - - - 0x00FF8C 03:9F7C: 90 65

	TAY							;C - - - - - 0x00FF8E 03:9F7E: A8
	LDA ram_00B1				;C - - - - - 0x00FF8F 03:9F7F: A5 B1
	BNE CODE_079FE3				;C - - - - - 0x00FF91 03:9F81: D0 60

	TXA							;C - - - - - 0x00FF93 03:9F83: 8A
	ASL							;C - - - - - 0x00FF94 03:9F84: 0A
	LDA #$00					;C - - - - - 0x00FF95 03:9F85: A9 00
	ROL							;C - - - - - 0x00FF97 03:9F87: 2A
	STA scratch0				;C - - - - - 0x00FF98 03:9F88: 85 00
	TXA							;C - - - - - 0x00FF9A 03:9F8A: 8A
	LSR							;C - - - - - 0x00FF9B 03:9F8B: 4A
	LSR							;C - - - - - 0x00FF9C 03:9F8C: 4A
	LSR							;C - - - - - 0x00FF9D 03:9F8D: 4A
	LSR							;C - - - - - 0x00FF9E 03:9F8E: 4A
	AND #$07					;C - - - - - 0x00FF9F 03:9F8F: 29 07
	TAX							;C - - - - - 0x00FFA1 03:9F91: AA
	TYA							;C - - - - - 0x00FFA2 03:9F92: 98
	LSR							;C - - - - - 0x00FFA3 03:9F93: 4A
	LSR							;C - - - - - 0x00FFA4 03:9F94: 4A
	LSR							;C - - - - - 0x00FFA5 03:9F95: 4A
	LSR							;C - - - - - 0x00FFA6 03:9F96: 4A
	ASL							;C - - - - - 0x00FFA7 03:9F97: 0A
	CLC							;C - - - - - 0x00FFA8 03:9F98: 18
	ADC scratch0				;C - - - - - 0x00FFA9 03:9F99: 65 00
	TAY							;C - - - - - 0x00FFAB 03:9F9B: A8
	LDA objAttr+OSLOT_BUBBLE,Y				;C - - - - - 0x00FFAC 03:9F9C: B9 07 07
	AND DATA_079FE7,X			;C - - - - - 0x00FFAF 03:9F9F: 3D E7 9F
	BEQ CODE_079FE3				;C - - - - - 0x00FFB2 03:9FA2: F0 3F
		LDA objAttr+OSLOT_BUBBLE,Y				;C - - - - - 0x00FFB4 03:9FA4: B9 07 07
		EOR DATA_079FE7,X			;C - - - - - 0x00FFB7 03:9FA7: 5D E7 9F
		STA objAttr+OSLOT_BUBBLE,Y				;C - - - - - 0x00FFBA 03:9FAA: 99 07 07
		LDA #$01					;C - - - - - 0x00FFBD 03:9FAD: A9 01
		STA ram_00B1				;C - - - - - 0x00FFBF 03:9FAF: 85 B1
		LDY vNametable				;C - - - - - 0x00FFC1 03:9FB1: A4 2D
		LDA DATA_079FEF,Y			;C - - - - - 0x00FFC3 03:9FB3: B9 EF 9F
		STA projScriptOfs				;C - - - - - 0x00FFC6 03:9FB6: 85 5D
		LDA DATA_079FF1,Y			;C - - - - - 0x00FFC8 03:9FB8: B9 F1 9F
		STA scratch1				;C - - - - - 0x00FFCB 03:9FBB: 85 01
		PLA							;C - - - - - 0x00FFCD 03:9FBD: 68
		LSR							;C - - - - - 0x00FFCE 03:9FBE: 4A
		LSR							;C - - - - - 0x00FFCF 03:9FBF: 4A
		LSR							;C - - - - - 0x00FFD0 03:9FC0: 4A
		AND #$FE					;C - - - - - 0x00FFD1 03:9FC1: 29 FE
		STA scratch0				;C - - - - - 0x00FFD3 03:9FC3: 85 00
		PLA							;C - - - - - 0x00FFD5 03:9FC5: 68
		AND #$F0					;C - - - - - 0x00FFD6 03:9FC6: 29 F0
		ASL							;C - - - - - 0x00FFD8 03:9FC8: 0A
		ROL scratch1				;C - - - - - 0x00FFD9 03:9FC9: 26 01
		ASL							;C - - - - - 0x00FFDB 03:9FCB: 0A
		ROL scratch1				;C - - - - - 0x00FFDC 03:9FCC: 26 01
		CLC							;C - - - - - 0x00FFDE 03:9FCE: 18
		ADC scratch0				;C - - - - - 0x00FFDF 03:9FCF: 65 00
		STA mapTargetAdr				;C - - - - - 0x00FFE1 03:9FD1: 85 49
		LDA scratch1				;C - - - - - 0x00FFE3 03:9FD3: A5 01
		STA mapTargetAdr+1				;C - - - - - 0x00FFE5 03:9FD5: 85 4A

		LDA #.LOBYTE(CODE_07904A)	;C - - - - - 0x00FFE7 03:9FD7: A9 4A
		STA nmiUnbankedSub			;C - - - - - 0x00FFE9 03:9FD9: 85 35
		LDA #.HIBYTE(CODE_07904A)	;C - - - - - 0x00FFEB 03:9FDB: A9 90
		STA nmiUnbankedSub+1		;C - - - - - 0x00FFED 03:9FDD: 85 36
		SEC							;C - - - - - 0x00FFEF 03:9FDF: 38
		JMP CODE_079FE6				;C - - - - - 0x00FFF0 03:9FE0: 4C E6 9F
CODE_079FE3:
	CLC							;C - - - - - 0x00FFF3 03:9FE3: 18
	PLA							;C - - - - - 0x00FFF4 03:9FE4: 68
	PLA							;C - - - - - 0x00FFF5 03:9FE5: 68
CODE_079FE6:
	RTS							;C - - - - - 0x00FFF6 03:9FE6: 60

DATA_079FE7:
	.byte $80					;- D 0 - - - 0x00FFF7 03:9FE7: 80
	.byte $40					;- D 0 - - - 0x00FFF8 03:9FE8: 40
	.byte $20					;- D 0 - - - 0x00FFF9 03:9FE9: 20
	.byte $10					;- D 0 - - - 0x00FFFA 03:9FEA: 10
	.byte $08					;- D 0 - - - 0x00FFFB 03:9FEB: 08
	.byte $04					;- D 0 - - - 0x00FFFC 03:9FEC: 04
	.byte $02					;- D 0 - - - 0x00FFFD 03:9FED: 02
	.byte $01					;- D 0 - - - 0x00FFFE 03:9FEE: 01

DATA_079FEF:
	.byte $FF					;- D 0 - - - 0x00FFFF 03:9FEF: FF
	.byte $7F					;- D 0 - - - 0x010000 03:9FF0: 7F

DATA_079FF1:
	.byte $08					;- D 0 - - - 0x010001 03:9FF1: 08
	.byte $0A					;- D 0 - - - 0x010002 03:9FF2: 0A