.segment "PRG_BANK_5"
; 0x00A010-0x00C00F

;Contents: Startup screens code, Cutscene script handling

StartTaitoLogo:
	JSR ResetOAMBuffer				;C - - - - - 0x00A010 02:8000: 20 C2 88

	LDA #chrOldTitle_A_ID					;C - - - - - 0x00A013 02:8003: A9 00
	STA chrBankA				;C - - - - - 0x00A015 02:8005: 85 4B
	LDA #chrTaito_A_ID					;C - - - - - 0x00A017 02:8007: A9 04
	STA chrBankB				;C - - - - - 0x00A019 02:8009: 85 4C

.ifdef REGION_JP
	LDA #$40
	STA $E000
.else
	LDA #$01					;C - - - - - 0x00A01B 02:800B: A9 01
	STA $A000				;C - - - - - 0x00A01D 02:800D: 8D 00 A0
.endif

	LDA #$00					;C - - - - - 0x00A020 02:8010: A9 00
	STA wideRound				;C - - - - - 0x00A022 02:8012: 8D B0 03
	STA hScroll				;C - - - - - 0x00A025 02:8015: 85 2B
	STA vScroll				;C - - - - - 0x00A027 02:8017: 85 29
	STA vNametable				;C - - - - - 0x00A029 02:8019: 85 2D
	STA hNametable				;C - - - - - 0x00A02B 02:801B: 85 2F

.ifndef REGION_JP
	STA roundSkelDelay				;C - - - - - 0x00A02D 02:801D: 85 6D
.endif

	LDA #SPLASH_TAITO			;C - - - - - 0x00A02F 02:801F: A9 02
	STA scratch0				;C - - - - - 0x00A031 02:8021: 85 00
	JSR LoadSplashMap				;C - - - - - 0x00A033 02:8023: 20 DB 8B

	LDA #.LOBYTE(TaitoLogoUpdate)	;C - - - - - 0x00A036 02:8026: A9 2F
	STA updateSub				;C - - - - - 0x00A038 02:8028: 85 19
	LDA #.HIBYTE(TaitoLogoUpdate)	;C - - - - - 0x00A03A 02:802A: A9 80
	STA updateSub+1				;C - - - - - 0x00A03C 02:802C: 85 1A
	RTS							;C - - - - - 0x00A03E 02:802E: 60

TaitoLogoUpdate:
	LDA logoCycles				;C - - - - - 0x00A03F 02:802F: AD 7A 07
	BNE @wait					;C - - - - - 0x00A042 02:8032: D0 5C

	LDX #$00					;C - - - - - 0x00A044 02:8034: A2 00
@copy:
	LDA palTaito,X			;C - - - - - 0x00A046 02:8036: BD FF 80
	STA unfadedColorBuffer,X				;C - - - - - 0x00A049 02:8039: 9D 40 03
	INX							;C - - - - - 0x00A04C 02:803C: E8
	CPX #$04					;C - - - - - 0x00A04D 02:803D: E0 04
	BNE @copy				;C - - - - - 0x00A04F 02:803F: D0 F5

	LDA #$00					;C - - - - - 0x00A051 02:8041: A9 00
	STA hScroll				;C - - - - - 0x00A053 02:8043: 85 2B
	STA hNametable				;C - - - - - 0x00A055 02:8045: 85 2F
	STA vNametable				;C - - - - - 0x00A057 02:8047: 85 2D

	LDA #chrTaito_A_ID					;C - - - - - 0x00A059 02:8049: A9 04
	STA chrBankA				;C - - - - - 0x00A05B 02:804B: 85 4B

	LDA #FADE_IN					;C - - - - - 0x00A05D 02:804D: A9 01
	STA fadeMode				;C - - - - - 0x00A05F 02:804F: 8D 53 05
	LDA #$00					;C - - - - - 0x00A062 02:8052: A9 00
	STA fadeUnk0556				;C - - - - - 0x00A064 02:8054: 8D 56 05
	LDA #$03					;C - - - - - 0x00A067 02:8057: A9 03
	STA fadeSpeedMask				;C - - - - - 0x00A069 02:8059: 8D 57 05
	LDA #.LOBYTE(unfadedColorBuffer)					;C - - - - - 0x00A06C 02:805C: A9 40
	STA fadeMaxColorsAdr				;C - - - - - 0x00A06E 02:805E: 8D 58 05
	LDA #.HIBYTE(unfadedColorBuffer)					;C - - - - - 0x00A071 02:8061: A9 03
	STA fadeMaxColorsAdr+1				;C - - - - - 0x00A073 02:8063: 8D 59 05
	LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x00A076 02:8066: A9 00
	STA fadeColorsAdr				;C - - - - - 0x00A078 02:8068: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00A07B 02:806B: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x00A07D 02:806D: 8D 5B 05
	LDA #4					;C - - - - - 0x00A080 02:8070: A9 04
	STA fadePasses				;C - - - - - 0x00A082 02:8072: 8D 54 05
	LDA #4					;C - - - - - 0x00A085 02:8075: A9 04
	STA fadeColorsAmount				;C - - - - - 0x00A087 02:8077: 8D 55 05

	LDA #.LOBYTE(TaitoLogoUpdate)	;C - - - - - 0x00A08A 02:807A: A9 2F
	STA updateSub				;C - - - - - 0x00A08C 02:807C: 85 19
	LDA #.HIBYTE(TaitoLogoUpdate)	;C - - - - - 0x00A08E 02:807E: A9 80
	STA updateSub+1				;C - - - - - 0x00A090 02:8080: 85 1A

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00A092 02:8082: A9 50
	STA nmiBankedSub			;C - - - - - 0x00A094 02:8084: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00A096 02:8086: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x00A098 02:8088: 85 17

	INC logoCycles				;C - - - - - 0x00A09A 02:808A: EE 7A 07
	JMP @end				;C - - - - - 0x00A09D 02:808D: 4C FE 80
@wait:
	LDA #$00					;C - - - - - 0x00A0A0 02:8090: A9 00
	STA openingCounter				;C - - - - - 0x00A0A2 02:8092: 8D CC 04
	STA openingStage				;C - - - - - 0x00A0A5 02:8095: 8D CF 04

	LDA globalTimer				;C - - - - - 0x00A0A8 02:8098: A5 14
	BNE @checkinput				;C - - - - - 0x00A0AA 02:809A: D0 0A
		INC logoCycles				;C - - - - - 0x00A0AC 02:809C: EE 7A 07
		LDA logoCycles				;C - - - - - 0x00A0AF 02:809F: AD 7A 07
		CMP #$02					;C - - - - - 0x00A0B2 02:80A2: C9 02
		BEQ @advance				;C - - - - - 0x00A0B4 02:80A4: F0 15
@checkinput:
	LDA pressedP1				;C - - - - - 0x00A0B6 02:80A6: A5 0E
	AND #KEY_A|KEY_B|KEY_START	;C - - - - - 0x00A0B8 02:80A8: 29 0B
	BEQ @end				;C - - - - - 0x00A0BA 02:80AA: F0 52
		LDA #snMenuCont_ID					;C - - - - - 0x00A0BC 02:80AC: A9 03
		STA a:soundTrigger				;C - - - - - 0x00A0BE 02:80AE: 8D E1 00

		LDA #$03					;C - - - - - 0x00A0C1 02:80B1: A9 03
		STA openingCounter				;C - - - - - 0x00A0C3 02:80B3: 8D CC 04

		LDA #OPENING_TITLE_SCREEN		;C - - - - - 0x00A0C6 02:80B6: A9 05
		STA openingStage				;C - - - - - 0x00A0C8 02:80B8: 8D CF 04
@advance:
	LDA #$00					;C - - - - - 0x00A0CB 02:80BB: A9 00
	STA roundFlags				;C - - - - - 0x00A0CD 02:80BD: 8D 71 04
	STA logoCycles				;C - - - - - 0x00A0D0 02:80C0: 8D 7A 07
	STA playerInvFrames				;C - - - - - 0x00A0D3 02:80C3: 8D 77 04
	STA multiplayer				;C - - - - - 0x00A0D6 02:80C6: 85 74
	JSR SetupIntroCutscene				;C - - - - - 0x00A0D8 02:80C8: 20 44 83

	LDA #FADE_OUT					;C - - - - - 0x00A0DB 02:80CB: A9 00
	STA fadeMode				;C - - - - - 0x00A0DD 02:80CD: 8D 53 05
	LDA #$00					;C - - - - - 0x00A0E0 02:80D0: A9 00
	STA fadeUnk0556				;C - - - - - 0x00A0E2 02:80D2: 8D 56 05
	LDA #$03					;C - - - - - 0x00A0E5 02:80D5: A9 03
	STA fadeSpeedMask				;C - - - - - 0x00A0E7 02:80D7: 8D 57 05
	LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x00A0EA 02:80DA: A9 00
	STA fadeColorsAdr				;C - - - - - 0x00A0EC 02:80DC: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00A0EF 02:80DF: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x00A0F1 02:80E1: 8D 5B 05
	LDA #4					;C - - - - - 0x00A0F4 02:80E4: A9 04
	STA fadePasses				;C - - - - - 0x00A0F6 02:80E6: 8D 54 05
	LDA #17					;C - - - - - 0x00A0F9 02:80E9: A9 11
	STA fadeColorsAmount				;C - - - - - 0x00A0FB 02:80EB: 8D 55 05

	LDA #.LOBYTE(LoadOpeningScreen)	;C - - - - - 0x00A0FE 02:80EE: A9 5D
	STA updateSub				;C - - - - - 0x00A100 02:80F0: 85 19
	LDA #.HIBYTE(LoadOpeningScreen)	;C - - - - - 0x00A102 02:80F2: A9 83
	STA updateSub+1				;C - - - - - 0x00A104 02:80F4: 85 1A

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00A106 02:80F6: A9 50
	STA nmiBankedSub			;C - - - - - 0x00A108 02:80F8: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00A10A 02:80FA: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x00A10C 02:80FC: 85 17
@end:
	RTS							;C - - - - - 0x00A10E 02:80FE: 60

palTaito:
	.byte $0F					;- D 0 - - - 0x00A10F 02:80FF: 0F
	.byte $30					;- D 0 - - - 0x00A110 02:8100: 30
	.byte $22					;- D 0 - - - 0x00A111 02:8101: 22
	.byte $12					;- D 0 - - - 0x00A112 02:8102: 12

DATA_058103:
	.byte $0F					;- - - - - - 0x00A113 02:8103: 0F
	.byte $0F					;- - - - - - 0x00A114 02:8104: 0F
	.byte $0F					;- - - - - - 0x00A115 02:8105: 0F
	.byte $0F					;- - - - - - 0x00A116 02:8106: 0F
	.byte $0F					;- - - - - - 0x00A117 02:8107: 0F
	.byte $0F					;- - - - - - 0x00A118 02:8108: 0F
	.byte $0F					;- - - - - - 0x00A119 02:8109: 0F
	.byte $0F					;- - - - - - 0x00A11A 02:810A: 0F
	.byte $0F					;- - - - - - 0x00A11B 02:810B: 0F
	.byte $0F					;- - - - - - 0x00A11C 02:810C: 0F
	.byte $0F					;- - - - - - 0x00A11D 02:810D: 0F
	.byte $0F					;- - - - - - 0x00A11E 02:810E: 0F
	.byte $0F					;- - - - - - 0x00A11F 02:810F: 0F
	.byte $0F					;- - - - - - 0x00A120 02:8110: 0F
	.byte $30					;- - - - - - 0x00A121 02:8111: 30
	.byte $24					;- - - - - - 0x00A122 02:8112: 24
	.byte $22					;- - - - - - 0x00A123 02:8113: 22
	.byte $0F					;- - - - - - 0x00A124 02:8114: 0F
	.byte $37					;- - - - - - 0x00A125 02:8115: 37
	.byte $26					;- - - - - - 0x00A126 02:8116: 26
	.byte $22					;- - - - - - 0x00A127 02:8117: 22
	.byte $0F					;- - - - - - 0x00A128 02:8118: 0F
	.byte $37					;- - - - - - 0x00A129 02:8119: 37
	.byte $26					;- - - - - - 0x00A12A 02:811A: 26
	.byte $2A					;- - - - - - 0x00A12B 02:811B: 2A
	.byte $0F					;- - - - - - 0x00A12C 02:811C: 0F
	.byte $30					;- - - - - - 0x00A12D 02:811D: 30
	.byte $31					;- - - - - - 0x00A12E 02:811E: 31
	.byte $22					;- - - - - - 0x00A12F 02:811F: 22
	.byte $0F					;- - - - - - 0x00A130 02:8120: 0F

CODE_058121:
	LDA playerInvFrames				;C - - - - - 0x00A131 02:8121: AD 77 04
.ifdef REGION_JP
	CMP #120					;C - - - - - 0x00A132 02:8122: C9 78
	BCC CODE_058136				;C - - - - - 0x00A134 02:8124: 90 0A
.else
	CMP #90					;C - - - - - 0x00A134 02:8124: C9 5A
	BCC CODE_05813C				;C - - - - - 0x00A136 02:8126: 90 14
.endif
	BNE TitleScreenInitialWait				;C - - - - - 0x00A138 02:8128: D0 1D

.ifndef REGION_JP
	LDA #$01					;C - - - - - 0x00A13A 02:812A: A9 01
	STA roundSkelDelay				;C - - - - - 0x00A13C 02:812C: 85 6D
.endif

CODE_05A13E:
	LDA #$00					;C - - - - - 0x00A13E 02:812E: A9 00
	STA openingCycle				;C - - - - - 0x00A140 02:8130: 8D CD 04
	JSR PrintTitleScreenText				;C - - - - - 0x00A143 02:8133: 20 EC 81
CODE_058136:
	INC playerInvFrames				;C - - - - - 0x00A146 02:8136: EE 77 04
	JMP CODE_0581D0				;C - - - - - 0x00A149 02:8139: 4C D0 81
CODE_05813C:

.ifndef REGION_JP
	LDA roundSkelDelay				;C - - - - - 0x00A14C 02:813C: A5 6D
	BEQ CODE_058136				;C - - - - - 0x00A14E 02:813E: F0 F6
		;Unreached
		LDA #120					;- - - - - - 0x00A150 02:8140: A9
		STA playerInvFrames				;- - - - - - 0x00A152 02:8142: 8D
		BNE CODE_05A13E				;- - - - - - 0x00A155 02:8145: D0
.endif

TitleScreenInitialWait:
	LDA pressedP1				;C - - - - - 0x00A157 02:8147: A5 0E
	AND #KEY_START|KEY_SELECT	;C - - - - - 0x00A159 02:8149: 29 0C
	BEQ TitleScreenButtonWait				;C - - - - - 0x00A15B 02:814B: F0 2F
		CMP #KEY_START|KEY_SELECT	;C - - - - - 0x00A15D 02:814D: C9 0C
		BNE CODE_058151				;C - - - - - 0x00A15F 02:814F: D0 00
			;Removed debug functionality here when pressing START+SELECT on same frame?
	CODE_058151:
		JSR CODE_0FE36B				;C - - - - - 0x00A161 02:8151: 20 6B E3
		LDA #snMenuCont_ID					;C - - - - - 0x00A164 02:8154: A9 03
		STA a:soundTrigger			;C - - - - - 0x00A166 02:8156: 8D E1 00
		LDA #.BANK(ImageTable1)					;C - - - - - 0x00A169 02:8159: A9 04
		STA sprPrgBank				;C - - - - - 0x00A16B 02:815B: 8D 61 05
		LDA #$00					;C - - - - - 0x00A16E 02:815E: A9 00
		STA scratch0				;C - - - - - 0x00A170 02:8160: 85 00
		JSR SplashScreenSprSetup				;C - - - - - 0x00A172 02:8162: 20 62 82
		LDA #chrPlayer_A_ID					;C - - - - - 0x00A175 02:8165: A9 40
		STA objChrBank				;C - - - - - 0x00A177 02:8167: 8D 53 06
		STA chrBankC				;C - - - - - 0x00A17A 02:816A: 85 4D
		LDA #$00					;C - - - - - 0x00A17C 02:816C: A9 00
		STA openingCycle				;C - - - - - 0x00A17E 02:816E: 8D CD 04

		LDA #.LOBYTE(TitleScreenLoadMenu)	;C - - - - - 0x00A181 02:8171: A9 D1
		STA nmiBankedSub			;C - - - - - 0x00A183 02:8173: 85 16
		LDA #.HIBYTE(TitleScreenLoadMenu)	;C - - - - - 0x00A185 02:8175: A9 81
		STA nmiBankedSub+1			;C - - - - - 0x00A187 02:8177: 85 17

		JMP CODE_0581D0				;C - - - - - 0x00A189 02:8179: 4C D0 81

TitleScreenButtonWait:
	LDA globalTimer				;C - - - - - 0x00A18C 02:817C: A5 14
	AND #$3F					;C - - - - - 0x00A18E 02:817E: 29 3F
	BNE CODE_0581D0				;C - - - - - 0x00A190 02:8180: D0 4E

	INC openingCycle				;C - - - - - 0x00A192 02:8182: EE CD 04
	LDA openingCycle				;C - - - - - 0x00A195 02:8185: AD CD 04
	CMP #30					;C - - - - - 0x00A198 02:8188: C9 1E
	BNE CODE_0581D0				;C - - - - - 0x00A19A 02:818A: D0 44
CODE_05818C:
	LDA #$00					;- - - - - - 0x00A19C 02:818C: A9
	STA openingCounter				;- - - - - - 0x00A19E 02:818E: 8D
	STA openingStage				;- - - - - - 0x00A1A1 02:8191: 8D

	INC openingCycle				;- - - - - - 0x00A1A4 02:8194: EE
	JSR SetupIntroCutscene				;- - - - - - 0x00A1A7 02:8197: 20

	LDA #FADE_OUT					;- - - - - - 0x00A1AA 02:819A: A9
	STA fadeMode				;- - - - - - 0x00A1AC 02:819C: 8D
	LDA #$40					;- - - - - - 0x00A1AF 02:819F: A9
	STA fadeUnk0556				;- - - - - - 0x00A1B1 02:81A1: 8D
	LDA #$03					;- - - - - - 0x00A1B4 02:81A4: A9
	STA fadeSpeedMask				;- - - - - - 0x00A1B6 02:81A6: 8D
	LDA #.LOBYTE(colorBuffer)					;- - - - - - 0x00A1B9 02:81A9: A9
	STA fadeColorsAdr				;- - - - - - 0x00A1BB 02:81AB: 8D
	LDA #.HIBYTE(colorBuffer)					;- - - - - - 0x00A1BE 02:81AE: A9
	STA fadeColorsAdr+1				;- - - - - - 0x00A1C0 02:81B0: 8D
	LDA #4					;- - - - - - 0x00A1C3 02:81B3: A9
	STA fadePasses				;- - - - - - 0x00A1C5 02:81B5: 8D
	LDA #32					;- - - - - - 0x00A1C8 02:81B8: A9
	STA fadeColorsAmount				;- - - - - - 0x00A1CA 02:81BA: 8D

	LDA #.LOBYTE(LoadOpeningScreen)	;- - - - - - 0x00A1CD 02:81BD: A9
	STA updateSub				;- - - - - - 0x00A1CF 02:81BF: 85
	LDA #.HIBYTE(LoadOpeningScreen)	;- - - - - - 0x00A1D1 02:81C1: A9
	STA updateSub+1				;- - - - - - 0x00A1D3 02:81C3: 85

	LDA #.LOBYTE(RunColorFader)	;- - - - - - 0x00A1D5 02:81C5: A9
	STA nmiBankedSub			;- - - - - - 0x00A1D7 02:81C7: 85
	LDA #.HIBYTE(RunColorFader)	;- - - - - - 0x00A1D9 02:81C9: A9
	STA nmiBankedSub+1			;- - - - - - 0x00A1DB 02:81CB: 85

	JMP CODE_0581D0				;- - - - - - 0x00A1DD 02:81CD: 4C
CODE_0581D0:
	RTS							;C - - - - - 0x00A1E0 02:81D0: 60

TitleScreenLoadMenu:
	LDA openingCycle				;C - - - - - 0x00A1E1 02:81D1: AD CD 04
	CMP #$04					;C - - - - - 0x00A1E4 02:81D4: C9 04
	BEQ CODE_0581DE				;C - - - - - 0x00A1E6 02:81D6: F0 06
		JSR PrintTitleScreenText				;C - - - - - 0x00A1E8 02:81D8: 20 EC 81
		JMP CODE_0581EB				;C - - - - - 0x00A1EB 02:81DB: 4C EB 81
CODE_0581DE:
	LDA #.LOBYTE(TitleScreenMenu)	;C - - - - - 0x00A1EE 02:81DE: A9 A3
	STA nmiBankedSub			;C - - - - - 0x00A1F0 02:81E0: 85 16
	LDA #.HIBYTE(TitleScreenMenu)	;C - - - - - 0x00A1F2 02:81E2: A9 82
	STA nmiBankedSub+1			;C - - - - - 0x00A1F4 02:81E4: 85 17

	LDA #$00					;C - - - - - 0x00A1F6 02:81E6: A9 00
	STA openingCycle				;C - - - - - 0x00A1F8 02:81E8: 8D CD 04
CODE_0581EB:
	RTS							;C - - - - - 0x00A1FB 02:81EB: 60

PrintTitleScreenText:
	LDA #.LOBYTE(CODE_0FE93B)	;C - - - - - 0x00A1FC 02:81EC: A9 3B
	STA nmiUnbankedSub			;C - - - - - 0x00A1FE 02:81EE: 85 35
	LDA #.HIBYTE(CODE_0FE93B)	;C - - - - - 0x00A200 02:81F0: A9 E9
	STA nmiUnbankedSub+1		;C - - - - - 0x00A202 02:81F2: 85 36

	LDA #$00					;C - - - - - 0x00A204 02:81F4: A9 00
	STA ram_03AE				;C - - - - - 0x00A206 02:81F6: 8D AE 03
	LDX openingCycle				;C - - - - - 0x00A209 02:81F9: AE CD 04
	LDA TitleScreenTextLenghts,X			;C - - - - - 0x00A20C 02:81FC: BD 3E 82
	STA scratch0				;C - - - - - 0x00A20F 02:81FF: 85 00
	LDA TitleScreenFirstLetters,X			;C - - - - - 0x00A211 02:8201: BD 42 82
	STA mapBuffer+32				;C - - - - - 0x00A214 02:8204: 8D 88 03
	LDY #$00					;C - - - - - 0x00A217 02:8207: A0 00
CODE_058209:
	LDA #$FF					;C - - - - - 0x00A219 02:8209: A9 FF
	STA mapBuffer,Y				;C - - - - - 0x00A21B 02:820B: 99 68 03
	CPX #$01					;C - - - - - 0x00A21E 02:820E: E0 01
	BEQ CODE_05821E				;C - - - - - 0x00A220 02:8210: F0 0C
		CPX #$00					;C - - - - - 0x00A222 02:8212: E0 00
		BNE CODE_05821B				;C - - - - - 0x00A224 02:8214: D0 05
			LDA TitleScreenTextPush,Y			;C - - - - - 0x00A226 02:8216: B9 52 82
			BNE CODE_05821E				;C - - - - - 0x00A229 02:8219: D0 03
	CODE_05821B:
		LDA TitleScreenTextPlayers,Y			;C - - - - - 0x00A22B 02:821B: B9 4A 82
CODE_05821E:
	STA mapBuffer+32+1,Y				;C - - - - - 0x00A22E 02:821E: 99 89 03
	INY							;C - - - - - 0x00A231 02:8221: C8
	CPY scratch0				;C - - - - - 0x00A232 02:8222: C4 00
	BCC CODE_058209				;C - - - - - 0x00A234 02:8224: 90 E3
	LDA #$00					;C - - - - - 0x00A236 02:8226: A9 00
	STA mapBuffer,Y				;C - - - - - 0x00A238 02:8228: 99 68 03
	STA mapBuffer+32+1,Y				;C - - - - - 0x00A23B 02:822B: 99 89 03
	LDY openingCycle				;C - - - - - 0x00A23E 02:822E: AC CD 04
	LDA TitleScreenTextPos,Y			;C - - - - - 0x00A241 02:8231: B9 46 82
	STA mapTargetAdr				;C - - - - - 0x00A244 02:8234: 85 49
	LDA #$22					;C - - - - - 0x00A246 02:8236: A9 22
	STA mapTargetAdr+1				;C - - - - - 0x00A248 02:8238: 85 4A
	INC openingCycle				;C - - - - - 0x00A24A 02:823A: EE CD 04
	RTS							;C - - - - - 0x00A24D 02:823D: 60

TitleScreenTextLenghts:
	.byte $10					;- D 0 - - - 0x00A24E 02:823E: 10
	.byte $12					;- D 0 - - - 0x00A24F 02:823F: 12
	.byte $07					;- D 0 - - - 0x00A250 02:8240: 07
	.byte $08					;- D 0 - - - 0x00A251 02:8241: 08
TitleScreenFirstLetters:
	.byte $03					;- D 0 - - - 0x00A252 02:8242: 03
	.byte $FF					;- D 0 - - - 0x00A253 02:8243: FF
	.byte $E9					;- D 0 - - - 0x00A254 02:8244: E9
	.byte $EA					;- D 0 - - - 0x00A255 02:8245: EA
TitleScreenTextPos:
.ifdef REGION_JP
	.byte 40
	.byte 40
	.byte 45
	.byte (32*3) + 13
.else
	.byte 8						;- D 0 - - - 0x00A256 02:8246: 08
	.byte 8						;- D 0 - - - 0x00A257 02:8247: 08
	.byte 13					;- D 0 - - - 0x00A258 02:8248: 0D
	.byte (32*2) + 13				;- D 0 - - - 0x00A259 02:8249: 4D
.endif
TitleScreenTextPlayers:
	;Starting from space
	.byte $FF					;- D 0 - - - 0x00A25A 02:824A: FF
	.byte $03					;- D 0 - - - 0x00A25B 02:824B: 03
	.byte $70					;- D 0 - - - 0x00A25C 02:824C: 70
	.byte $51					;- D 0 - - - 0x00A25D 02:824D: 51
	.byte $7D					;- D 0 - - - 0x00A25E 02:824E: 7D
	.byte $0F					;- D 0 - - - 0x00A25F 02:824F: 0F
	.byte $0E					;- D 0 - - - 0x00A260 02:8250: 0E
	.byte $B6					;- D 0 - - - 0x00A261 02:8251: B6
TitleScreenTextPush:
	;Starting from U
	.byte $04					;- D 0 - - - 0x00A262 02:8252: 04
	.byte $0C					;- D 0 - - - 0x00A263 02:8253: 0C
	.byte $0D					;- D 0 - - - 0x00A264 02:8254: 0D
	.byte $FF					;- D 0 - - - 0x00A265 02:8255: FF
	.byte $0C					;- D 0 - - - 0x00A266 02:8256: 0C
	.byte $50					;- D 0 - - - 0x00A267 02:8257: 50
	.byte $51					;- D 0 - - - 0x00A268 02:8258: 51
	.byte $0E					;- D 0 - - - 0x00A269 02:8259: 0E
	.byte $50					;- D 0 - - - 0x00A26A 02:825A: 50
	.byte $FF					;- D 0 - - - 0x00A26B 02:825B: FF
	.byte $5E					;- D 0 - - - 0x00A26C 02:825C: 5E
	.byte $04					;- D 0 - - - 0x00A26D 02:825D: 04
	.byte $50					;- D 0 - - - 0x00A26E 02:825E: 50
	.byte $50					;- D 0 - - - 0x00A26F 02:825F: 50
	.byte $60					;- D 0 - - - 0x00A270 02:8260: 60
	.byte $6D					;- D 0 - - - 0x00A271 02:8261: 6D

SplashScreenSprSetup:
	;00: Title screen cursor (bubble)
	;01: Player during adventure start
	;02: Player during continue decision
	;03: Player continue reaction

	LDA scratch0				;C - - - - - 0x00A272 02:8262: A5 00
	ASL							;C - - - - - 0x00A274 02:8264: 0A
	ASL							;C - - - - - 0x00A275 02:8265: 0A
	TAY							;C - - - - - 0x00A276 02:8266: A8
	LDA #$01					;C - - - - - 0x00A277 02:8267: A9 01
	STA objState				;C - - - - - 0x00A279 02:8269: 8D 63 05

	LDA SplashSprParams,Y			;C - - - - - 0x00A27C 02:826C: B9 93 82
	STA objY				;C - - - - - 0x00A27F 02:826F: 8D 8B 05
	LDA SplashSprParams+1,Y			;C - - - - - 0x00A282 02:8272: B9 94 82
	STA objX				;C - - - - - 0x00A285 02:8275: 8D B3 05
	LDA SplashSprParams+2,Y			;C - - - - - 0x00A288 02:8278: B9 95 82
	STA objAnim				;C - - - - - 0x00A28B 02:827B: 8D 7B 06
	LDA SplashSprParams+3,Y			;C - - - - - 0x00A28E 02:827E: B9 96 82
	STA objAnimHI				;C - - - - - 0x00A291 02:8281: 8D 1B 07

	LDA #$00					;C - - - - - 0x00A294 02:8284: A9 00
	STA objChrSlot				;C - - - - - 0x00A296 02:8286: 8D 2B 06
	STA objAttr				;C - - - - - 0x00A299 02:8289: 8D F3 06
	STA objAnimProgress				;C - - - - - 0x00A29C 02:828C: 8D CB 06
	STA objAnimTimer				;C - - - - - 0x00A29F 02:828F: 8D A3 06
	RTS							;C - - - - - 0x00A2A2 02:8292: 60

SplashSprParams:
	;- D 0 - - - 0x00A2A3 02:8293: 8A

	;00: Y
	;01: X
	;02,03: Animation

.ifdef REGION_JP
	.byte $92,$5C
.else
	.byte $8A,$5C
.endif
	.word anBubble_ID

	.byte $80,$88
	.word anPlayerRoundStart_ID

	.byte $B2,$38
	.word anPlayerGameOver_ID

	.byte $B2,$3C
	.word anPlayerContinue_ID

TitleScreenMenu:
	LDA pressedP1				;C - - - - - 0x00A2B3 02:82A3: A5 0E
	AND #KEY_START|KEY_SELECT	;C - - - - - 0x00A2B5 02:82A5: 29 0C
	BEQ CODE_0582B8				;C - - - - - 0x00A2B7 02:82A7: F0 0F
		CMP #KEY_START				;C - - - - - 0x00A2B9 02:82A9: C9 08
		BEQ CODE_0582BE				;C - - - - - 0x00A2BB 02:82AB: F0 11
			LDA multiplayer				;C - - - - - 0x00A2BD 02:82AD: A5 74
			EOR #$01					;C - - - - - 0x00A2BF 02:82AF: 49 01
			STA multiplayer				;C - - - - - 0x00A2C1 02:82B1: 85 74
			LDA #snMenuBrowse_ID					;C - - - - - 0x00A2C3 02:82B3: A9 02
			STA a:soundTrigger				;C - - - - - 0x00A2C5 02:82B5: 8D E1 00
CODE_0582B8:
	JSR TitleScreenUpdateCursor				;C - - - - - 0x00A2C8 02:82B8: 20 33 83
	JMP CODE_058332				;C - - - - - 0x00A2CB 02:82BB: 4C 32 83

CODE_0582BE:
	LDA #$00					;C - - - - - 0x00A2CE 02:82BE: A9 00
	STA currentPlayer				;C - - - - - 0x00A2D0 02:82C0: 8D 99 04
	LDA #snMenuCont_ID					;C - - - - - 0x00A2D3 02:82C3: A9 03
	STA a:soundTrigger				;C - - - - - 0x00A2D5 02:82C5: 8D E1 00
	JSR CODE_0FE36B				;C - - - - - 0x00A2D8 02:82C8: 20 6B E3
	LDA #$01					;C - - - - - 0x00A2DB 02:82CB: A9 01
	STA currentRound				;C - - - - - 0x00A2DD 02:82CD: 85 D8
	STA ram_00D9				;C - - - - - 0x00A2DF 02:82CF: 85 D9
	STA bonusGameProgress				;C - - - - - 0x00A2E1 02:82D1: 85 D6
	STA ram_00D7				;C - - - - - 0x00A2E3 02:82D3: 85 D7
	LDA #$05					;C - - - - - 0x00A2E5 02:82D5: A9 05
	STA continues				;C - - - - - 0x00A2E7 02:82D7: 85 DC
	STA ram_00DD				;C - - - - - 0x00A2E9 02:82D9: 85 DD
	JSR ResetLivesAndScore				;C - - - - - 0x00A2EB 02:82DB: 20 8B 88
	LDA #$01					;C - - - - - 0x00A2EE 02:82DE: A9 01
	STA scratch0				;C - - - - - 0x00A2F0 02:82E0: 85 00
	JSR SplashScreenSprSetup				;C - - - - - 0x00A2F2 02:82E2: 20 62 82
	LDA #$03					;C - - - - - 0x00A2F5 02:82E5: A9 03
	STA livesDigits+1				;C - - - - - 0x00A2F7 02:82E7: 8D 80 04
	STA livesDigits+1+HUD_TOTAL_DIGITS				;C - - - - - 0x00A2FA 02:82EA: 8D 89 04
	LDA #$00					;C - - - - - 0x00A2FD 02:82ED: A9 00
	STA livesDigits				;C - - - - - 0x00A2FF 02:82EF: 8D 7F 04
	STA livesDigits+HUD_TOTAL_DIGITS				;C - - - - - 0x00A302 02:82F2: 8D 88 04
	LDA #$04					;C - - - - - 0x00A305 02:82F5: A9 04
	STA openingCounter				;C - - - - - 0x00A307 02:82F7: 8D CC 04

	LDA #FADE_OUT					;C - - - - - 0x00A30A 02:82FA: A9 00
	STA fadeMode				;C - - - - - 0x00A30C 02:82FC: 8D 53 05
	LDA #$40					;C - - - - - 0x00A30F 02:82FF: A9 40
	STA fadeUnk0556				;C - - - - - 0x00A311 02:8301: 8D 56 05
	LDA #$03					;C - - - - - 0x00A314 02:8304: A9 03
	STA fadeSpeedMask				;C - - - - - 0x00A316 02:8306: 8D 57 05
	LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x00A319 02:8309: A9 00
	STA fadeColorsAdr				;C - - - - - 0x00A31B 02:830B: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00A31E 02:830E: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x00A320 02:8310: 8D 5B 05
	LDA #4					;C - - - - - 0x00A323 02:8313: A9 04
	STA fadePasses				;C - - - - - 0x00A325 02:8315: 8D 54 05
	LDA #32					;C - - - - - 0x00A328 02:8318: A9 20
	STA fadeColorsAmount				;C - - - - - 0x00A32A 02:831A: 8D 55 05

	LDA #.LOBYTE(LoadOpeningScreen)	;C - - - - - 0x00A32D 02:831D: A9 5D
	STA updateSub				;C - - - - - 0x00A32F 02:831F: 85 19
	LDA #.HIBYTE(LoadOpeningScreen)	;C - - - - - 0x00A331 02:8321: A9 83
	STA updateSub+1				;C - - - - - 0x00A333 02:8323: 85 1A

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00A335 02:8325: A9 50
	STA nmiBankedSub			;C - - - - - 0x00A337 02:8327: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00A339 02:8329: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x00A33B 02:832B: 85 17

	LDA #trSilence_ID					;C - - - - - 0x00A33D 02:832D: A9 00
	STA a:musicTrigger			;C - - - - - 0x00A33F 02:832F: 8D E0 00
CODE_058332:
	RTS							;C - - - - - 0x00A342 02:8332: 60

TitleScreenUpdateCursor:
	LDX multiplayer				;C - - - - - 0x00A343 02:8333: A6 74
	LDA TitleScreenCursorPositions,X			;C - - - - - 0x00A345 02:8335: BD 42 83
	STA objY				;C - - - - - 0x00A348 02:8338: 8D 8B 05
	JSR AnimateNonBubbles				;C - - - - - 0x00A34B 02:833B: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x00A34E 02:833E: 20 E2 EE
	RTS							;C - - - - - 0x00A351 02:8341: 60

TitleScreenCursorPositions:
.ifdef REGION_JP
	.byte 146
	.byte 162
.else
	.byte 138					;- D 0 - - - 0x00A352 02:8342: 8A
	.byte 154					;- D 0 - - - 0x00A353 02:8343: 9A
.endif

SetupIntroCutscene:
	LDX #CS_INTRO					;C - - - - - 0x00A354 02:8344: A2 00
	JSR SetupCutscene				;C - - - - - 0x00A356 02:8346: 20 82 84

	LDA #$01					;C - - - - - 0x00A359 02:8349: A9 01
	STA cutsceneActorActive				;C - - - - - 0x00A35B 02:834B: 8D 53 07
	STA cutsceneActorActive+1				;C - - - - - 0x00A35E 02:834E: 8D 54 07
	STA cutsceneActorActive+2				;C - - - - - 0x00A361 02:8351: 8D 55 07
	STA cutsceneActorActive+3				;C - - - - - 0x00A364 02:8354: 8D 56 07

	LDA #$00					;C - - - - - 0x00A367 02:8357: A9 00
	STA currentCutsceneActor				;C - - - - - 0x00A369 02:8359: 8D 5B 07
	RTS							;C - - - - - 0x00A36C 02:835C: 60

LoadOpeningScreen:
	LDA #.BANK(OpeningChrA)					;C - - - - - 0x00A36D 02:835D: A9 04

.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00A36F 02:835F: 85 3B
	JSR SwapPrgBankB			;C - - - - - 0x00A371 02:8361: 20 56 FF
.endif

	LDY openingCounter			;C - - - - - 0x00A374 02:8364: AC CC 04
	LDA OpeningChrA,Y			;C - - - - - 0x00A377 02:8367: B9 50 BB
	STA chrBankA				;C - - - - - 0x00A37A 02:836A: 85 4B
	LDA OpeningChrB,Y			;C - - - - - 0x00A37C 02:836C: B9 56 BB
	STA chrBankB				;C - - - - - 0x00A37F 02:836F: 85 4C
	LDA OpeningTargetL,Y		;C - - - - - 0x00A381 02:8371: B9 68 BB
	STA mapTargetAdr			;C - - - - - 0x00A384 02:8374: 85 49
	LDA OpeningTargetH,Y		;C - - - - - 0x00A386 02:8376: B9 6E BB
	STA mapTargetAdr+1			;C - - - - - 0x00A389 02:8379: 85 4A
	LDA OpeningMaps,Y			;C - - - - - 0x00A38B 02:837B: B9 5C BB
	STA mapID					;C - - - - - 0x00A38E 02:837E: 8D 60 03

	LDA OpeningBaseTiles,Y		;C - - - - - 0x00A391 02:8381: B9 62 BB
	STA mapBaseTile				;C - - - - - 0x00A394 02:8384: 8D 63 03
	LDA OpeningHScroll,Y		;C - - - - - 0x00A397 02:8387: B9 74 BB
	STA hScroll					;C - - - - - 0x00A39A 02:838A: 85 2B

	JSR LoadMap					;C - - - - - 0x00A39C 02:838C: 20 23 E5

	LDA #.LOBYTE(LoadOpeningPalettes)	;C - - - - - 0x00A39F 02:838F: A9 98
	STA updateSub				;C - - - - - 0x00A3A1 02:8391: 85 19
	LDA #.HIBYTE(LoadOpeningPalettes)	;C - - - - - 0x00A3A3 02:8393: A9 83
	STA updateSub+1				;C - - - - - 0x00A3A5 02:8395: 85 1A

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif

	RTS							;C - - - - - 0x00A3A7 02:8397: 60

LoadOpeningPalettes:
	LDA #.BANK(OpeningPalTable)					;C - - - - - 0x00A3A8 02:8398: A9 04

.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00A3AA 02:839A: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00A3AC 02:839C: 20 56 FF
.endif

	LDY openingCounter				;C - - - - - 0x00A3AF 02:839F: AC CC 04
	LDA OpeningFadeColorAmounts,Y			;C - - - - - 0x00A3B2 02:83A2: B9 7A BB
	STA scratch1				;C - - - - - 0x00A3B5 02:83A5: 85 01
	TYA							;C - - - - - 0x00A3B7 02:83A7: 98
	ASL							;C - - - - - 0x00A3B8 02:83A8: 0A
	TAX							;C - - - - - 0x00A3B9 02:83A9: AA
	LDA OpeningPalTable,X			;C - - - - - 0x00A3BA 02:83AA: BD 86 BB
	STA scratch6				;C - - - - - 0x00A3BD 02:83AD: 85 06
	LDA OpeningPalTable+1,X			;C - - - - - 0x00A3BF 02:83AF: BD 87 BB
	STA scratch7				;C - - - - - 0x00A3C2 02:83B2: 85 07
	LDY #$00					;C - - - - - 0x00A3C4 02:83B4: A0 00
CODE_0583B6:
	LDA (scratch6),Y			;C - - - - - 0x00A3C6 02:83B6: B1 06
	STA unfadedColorBuffer,Y				;C - - - - - 0x00A3C8 02:83B8: 99 40 03
	INY							;C - - - - - 0x00A3CB 02:83BB: C8
	CPY scratch1				;C - - - - - 0x00A3CC 02:83BC: C4 01
	BNE CODE_0583B6				;C - - - - - 0x00A3CE 02:83BE: D0 F6

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif

	LDA #FADE_IN					;C - - - - - 0x00A3D0 02:83C0: A9 01
	STA fadeMode				;C - - - - - 0x00A3D2 02:83C2: 8D 53 05
	LDA #$00					;C - - - - - 0x00A3D5 02:83C5: A9 00
	STA fadeUnk0556				;C - - - - - 0x00A3D7 02:83C7: 8D 56 05
	LDA #$07					;C - - - - - 0x00A3DA 02:83CA: A9 07
	STA fadeSpeedMask				;C - - - - - 0x00A3DC 02:83CC: 8D 57 05
	LDA #.LOBYTE(unfadedColorBuffer)					;C - - - - - 0x00A3DF 02:83CF: A9 40
	STA fadeMaxColorsAdr				;C - - - - - 0x00A3E1 02:83D1: 8D 58 05
	LDA #.HIBYTE(unfadedColorBuffer)					;C - - - - - 0x00A3E4 02:83D4: A9 03
	STA fadeMaxColorsAdr+1				;C - - - - - 0x00A3E6 02:83D6: 8D 59 05
	LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x00A3E9 02:83D9: A9 00
	STA fadeColorsAdr				;C - - - - - 0x00A3EB 02:83DB: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00A3EE 02:83DE: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x00A3F0 02:83E0: 8D 5B 05
	LDA #4					;C - - - - - 0x00A3F3 02:83E3: A9 04
	STA fadePasses				;C - - - - - 0x00A3F5 02:83E5: 8D 54 05
	LDA scratch1				;C - - - - - 0x00A3F8 02:83E8: A5 01
	STA fadeColorsAmount				;C - - - - - 0x00A3FA 02:83EA: 8D 55 05

	LDA #.LOBYTE(CODE_0586BD)	;C - - - - - 0x00A3FD 02:83ED: A9 BD
	STA updateSub				;C - - - - - 0x00A3FF 02:83EF: 85 19
	LDA #.HIBYTE(CODE_0586BD)	;C - - - - - 0x00A401 02:83F1: A9 86
	STA updateSub+1				;C - - - - - 0x00A403 02:83F3: 85 1A

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00A405 02:83F5: A9 50
	STA nmiBankedSub			;C - - - - - 0x00A407 02:83F7: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00A409 02:83F9: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x00A40B 02:83FB: 85 17
	RTS							;C - - - - - 0x00A40D 02:83FD: 60

IntroUpdate:
	LDA pressedP1				;C - - - - - 0x00A40E 02:83FE: A5 0E
	AND #KEY_START				;C - - - - - 0x00A410 02:8400: 29 08
	BEQ CODE_05840E				;C - - - - - 0x00A412 02:8402: F0 0A
		LDA #OPENING_TREE_PLAY			;C - - - - - 0x00A414 02:8404: A9 04
		STA openingStage				;C - - - - - 0x00A416 02:8406: 8D CF 04
		STA openingCounter				;C - - - - - 0x00A419 02:8409: 8D CC 04

.ifdef REGION_JP
		JMP CODE_058436
.else
		BNE CODE_058436				;C - - - - - 0x00A41C 02:840C: D0 28
.endif
CODE_05840E:
	LDA globalTimer				;C - - - - - 0x00A41E 02:840E: A5 14
	AND #$3F					;C - - - - - 0x00A420 02:8410: 29 3F
	BNE CODE_058429				;C - - - - - 0x00A422 02:8412: D0 15
		INC openingCycle				;C - - - - - 0x00A424 02:8414: EE CD 04
		LDA openingCycle				;C - - - - - 0x00A427 02:8417: AD CD 04
		LDX openingStage				;C - - - - - 0x00A42A 02:841A: AE CF 04
		CMP DATA_058479,X			;C - - - - - 0x00A42D 02:841D: DD 79 84
		BCC CODE_058429				;C - - - - - 0x00A430 02:8420: 90 07
			LDA #$00					;C - - - - - 0x00A432 02:8422: A9 00
			STA openingCycle				;C - - - - - 0x00A434 02:8424: 8D CD 04
.ifdef REGION_JP
			JMP CODE_058436
.else
			BEQ CODE_058436				;C - - - - - 0x00A437 02:8427: F0 0D
.endif
CODE_058429:
	LDA openingStage				;C - - - - - 0x00A439 02:8429: AD CF 04
	CMP #OPENING_TREE_PLAY					;C - - - - - 0x00A43C 02:842C: C9 04
	BNE CODE_058478				;C - - - - - 0x00A43E 02:842E: D0 48
		JSR UpdateCutsceneActors				;C - - - - - 0x00A440 02:8430: 20 DC 84
		JMP CODE_058478				;C - - - - - 0x00A443 02:8433: 4C 78 84

CODE_058436:
	LDA #.BANK(DATA_04BB80)					;C - - - - - 0x00A446 02:8436: A9 04

.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00A448 02:8438: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00A44A 02:843A: 20 56 FF
.endif

	LDY openingCounter				;C - - - - - 0x00A44D 02:843D: AC CC 04
	LDA DATA_04BB80,Y			;C - - - - - 0x00A450 02:8440: B9 80 BB
	STA scratch1				;C - - - - - 0x00A453 02:8443: 85 01

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif

	LDA #FADE_OUT					;C - - - - - 0x00A455 02:8445: A9 00
	STA fadeMode				;C - - - - - 0x00A457 02:8447: 8D 53 05
	LDA #$00					;C - - - - - 0x00A45A 02:844A: A9 00
	STA fadeUnk0556				;C - - - - - 0x00A45C 02:844C: 8D 56 05
	LDA #$03					;C - - - - - 0x00A45F 02:844F: A9 03
	STA fadeSpeedMask				;C - - - - - 0x00A461 02:8451: 8D 57 05
	LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x00A464 02:8454: A9 00
	STA fadeColorsAdr				;C - - - - - 0x00A466 02:8456: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00A469 02:8459: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x00A46B 02:845B: 8D 5B 05
	LDA #4					;C - - - - - 0x00A46E 02:845E: A9 04
	STA fadePasses				;C - - - - - 0x00A470 02:8460: 8D 54 05
	LDA scratch1				;C - - - - - 0x00A473 02:8463: A5 01
	STA fadeColorsAmount				;C - - - - - 0x00A475 02:8465: 8D 55 05

	LDA #.LOBYTE(CODE_0586BD)	;C - - - - - 0x00A478 02:8468: A9 BD
	STA updateSub				;C - - - - - 0x00A47A 02:846A: 85 19
	LDA #.HIBYTE(CODE_0586BD)	;C - - - - - 0x00A47C 02:846C: A9 86
	STA updateSub+1				;C - - - - - 0x00A47E 02:846E: 85 1A

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00A480 02:8470: A9 50
	STA nmiBankedSub			;C - - - - - 0x00A482 02:8472: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00A484 02:8474: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x00A486 02:8476: 85 17
CODE_058478:
	RTS							;C - - - - - 0x00A488 02:8478: 60

DATA_058479:
	.byte $00					;- - - - - - 0x00A489 02:8479: 00
	.byte $00					;- - - - - - 0x00A48A 02:847A: 00
	.byte $03					;- D 0 - - - 0x00A48B 02:847B: 03
	.byte $00					;- - - - - - 0x00A48C 02:847C: 00
	.byte $14					;- D 0 - - - 0x00A48D 02:847D: 14
	.byte $00					;- - - - - - 0x00A48E 02:847E: 00
	.byte $00					;- - - - - - 0x00A48F 02:847F: 00
	.byte $00					;- - - - - - 0x00A490 02:8480: 00
	.byte $00					;- - - - - - 0x00A491 02:8481: 00

SetupCutscene:
	;Sets the script adr of each actor but does not mark them as active
	;X: ID times 3
	LDA CutsceneSetupTable,X			;C - - - - - 0x00A492 02:8482: BD AB 84
	STA scratch0				;C - - - - - 0x00A495 02:8485: 85 00
	LDA CutsceneSetupTable+1,X			;C - - - - - 0x00A497 02:8487: BD AC 84
	STA scratch1				;C - - - - - 0x00A49A 02:848A: 85 01
	LDA CutsceneSetupTable+2,X			;C - - - - - 0x00A49C 02:848C: BD AD 84
	TAY							;C - - - - - 0x00A49F 02:848F: A8
@copyadr:
	LDA scratch0				;C - - - - - 0x00A4A0 02:8490: A5 00
	ASL							;C - - - - - 0x00A4A2 02:8492: 0A
	TAX							;C - - - - - 0x00A4A3 02:8493: AA
	LDA CutsceneActorTable,X			;C - - - - - 0x00A4A4 02:8494: BD BA 84
	STA cutsceneScriptAdr,Y				;C - - - - - 0x00A4A7 02:8497: 99 4B 07
	LDA CutsceneActorTable+1,X			;C - - - - - 0x00A4AA 02:849A: BD BB 84
	STA cutsceneScriptAdr+1,Y				;C - - - - - 0x00A4AD 02:849D: 99 4C 07
	INY							;C - - - - - 0x00A4B0 02:84A0: C8
	INY							;C - - - - - 0x00A4B1 02:84A1: C8
	INC scratch0				;C - - - - - 0x00A4B2 02:84A2: E6 00
	LDA scratch0				;C - - - - - 0x00A4B4 02:84A4: A5 00
	CMP scratch1				;C - - - - - 0x00A4B6 02:84A6: C5 01
	BCC @copyadr				;C - - - - - 0x00A4B8 02:84A8: 90 E6

	RTS							;C - - - - - 0x00A4BA 02:84AA: 60

CutsceneSetupTable:
	;- D 0 - - - 0x00A4BB 02:84AB: 00
	;00: ID of first actor script
	;01: ID to stop at
	;02: Actor slot to start at
	.byte caIntroCubby_ID,caIntroCubby_ID+4,0
	.byte caREM04_ID,caREM04_ID+3,0
	.byte caRound70Judy_ID,caRound70Judy_ID+2,2
	.byte caRound70PlayerWon_ID,caRound70PlayerWon_ID+4,0
	.byte caEndingCubby_ID,caEndingCubby_ID+4,0

CutsceneActorTable:
	;- D 0 - - - 0x00A4CA 02:84BA: 50
	.word caIntroCubby
	.word caIntroJudy
	.word caIntroHeartSkull
	.word caIntroDrunk
	.word caREM04
	.word caREM05
	.word caREM06
	.word caRound70Judy
	.word caRound70Skull
	.word caRound70PlayerWon
	.word caRound70JudyFree
	.word caRound70HeartL
	.word caRound70HeartR
	.word caEndingCubby
	.word caEndingFairyHeartR
	.word caEndingMagicRJudy
	.word caEndingMagicLHeartL

UpdateCutsceneActors:
	LDA #.BANK(CutsceneActorScripts)					;C - - - - - 0x00A4EC 02:84DC: A9 06

.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00A4EE 02:84DE: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00A4F0 02:84E0: 20 56 FF
.endif

	LDX currentCutsceneActor				;C - - - - - 0x00A4F3 02:84E3: AE 5B 07
	LDA cutsceneActorActive,X				;C - - - - - 0x00A4F6 02:84E6: BD 53 07
	BNE UpdateCutsceneActors_Update				;C - - - - - 0x00A4F9 02:84E9: D0 03
		JMP UpdateCutsceneActors_NextActor				;C - - - - - 0x00A4FB 02:84EB: 4C A4 86
UpdateCutsceneActors_Update:
	LDA currentCutsceneActor				;C - - - - - 0x00A4FE 02:84EE: AD 5B 07
	ASL							;C - - - - - 0x00A501 02:84F1: 0A
	TAX							;C - - - - - 0x00A502 02:84F2: AA
	LDA cutsceneScriptAdr,X				;C - - - - - 0x00A503 02:84F3: BD 4B 07
	STA scratch8				;C - - - - - 0x00A506 02:84F6: 85 08
	LDA cutsceneScriptAdr+1,X				;C - - - - - 0x00A508 02:84F8: BD 4C 07
	STA scratch9				;C - - - - - 0x00A50B 02:84FB: 85 09
	LDY #$00					;C - - - - - 0x00A50D 02:84FD: A0 00

	;Read and execute cutscene opcode
	LDA (scratch8),Y			;C - - - - - 0x00A50F 02:84FF: B1 08
	ASL							;C - - - - - 0x00A511 02:8501: 0A
	STA scratch0				;C - - - - - 0x00A512 02:8502: 85 00
	LDA #.LOBYTE(CutsceneOpHandlers)					;C - - - - - 0x00A514 02:8504: A9 22
	CLC							;C - - - - - 0x00A516 02:8506: 18
	ADC scratch0				;C - - - - - 0x00A517 02:8507: 65 00
	STA scratch2				;C - - - - - 0x00A519 02:8509: 85 02
	LDA #.HIBYTE(CutsceneOpHandlers)					;C - - - - - 0x00A51B 02:850B: A9 85
	ADC #$00					;C - - - - - 0x00A51D 02:850D: 69 00
	STA scratch3				;C - - - - - 0x00A51F 02:850F: 85 03
	LDA (scratch2),Y			;C - - - - - 0x00A521 02:8511: B1 02
	STA scratch6				;C - - - - - 0x00A523 02:8513: 85 06
	INY							;C - - - - - 0x00A525 02:8515: C8
	LDA (scratch2),Y			;C - - - - - 0x00A526 02:8516: B1 02
	STA scratch7				;C - - - - - 0x00A528 02:8518: 85 07
	LDX currentCutsceneActor				;C - - - - - 0x00A52A 02:851A: AE 5B 07
	LDY #$01					;C - - - - - 0x00A52D 02:851D: A0 01
	JMP (scratch6)				;C - - - - - 0x00A52F 02:851F: 6C 06 00

CutsceneOpHandlers:
	;- D 0 - - - 0x00A532 02:8522: 44
	.word CutsceneOp_Stall			;00 Remain on current address (others will jump to this handler if not done yet)
	.word CutsceneOp_Anim			;01 xxxx Start animation
	.word CutsceneOp_Prg			;02 xx Set sprite PRG bank
	.word CutsceneOp_Pos			;03 xx yy Set X and Y pos
	.word CutsceneOp_Time			;04 xx Set timer (Only one actor updates per frame so this decreases every four frames)
	.word CutsceneOp_Move			;05 xy Adjust X and Y by 4-bit amounts (one's complement) until timer runs out (can only move once every four frames)
	.word CutsceneOp_Jump			;06 xxxx Jump
	.word CutsceneOp_Wait			;07 Wait for timer to run out
	.word CutsceneOp_Remove			;08 Despawn and mark as inactive
	.word CutsceneOp_Chr			;09 xx Set CHR slot
	.word CutsceneOp_BeginLoop		;0A xx Set number of loops
	.word CutsceneOp_Loop			;0B xxxx Decrease loop number and jump to xxxx if still non-zero (loop back)
	.word CutsceneOp_Show			;0C Show actor (Set obj state to 01)
	.word CutsceneOp_Hide			;0D Hide actor (Set obj state to 00)
	.word CutsceneOp_Pal			;0E oo cc cc cc cc (Write colors cc to offset oo in color buffer)
	.word CutsceneOp_Attr			;0F xx Set sprite attr
	.word CutsceneOp_Boss			;10 Activate boss (place and activate first enemy around center of screen)

CutsceneOp_Stall:
	LDA #$00					;C - - - - - 0x00A554 02:8544: A9 00
	JMP UpdateCutsceneActors_NextActor				;C - - - - - 0x00A556 02:8546: 4C A4 86

CutsceneOp_Anim:
	LDA (scratch8),Y			;C - - - - - 0x00A559 02:8549: B1 08
	STA objAnim,X				;C - - - - - 0x00A55B 02:854B: 9D 7B 06
	INY							;C - - - - - 0x00A55E 02:854E: C8
	LDA (scratch8),Y			;C - - - - - 0x00A55F 02:854F: B1 08
	STA objAnimHI,X				;C - - - - - 0x00A561 02:8551: 9D 1B 07
	LDA #$00					;C - - - - - 0x00A564 02:8554: A9 00
	STA objAnimProgress,X				;C - - - - - 0x00A566 02:8556: 9D CB 06
	STA objAnimTimer,X				;C - - - - - 0x00A569 02:8559: 9D A3 06
	LDA #$03					;C - - - - - 0x00A56C 02:855C: A9 03
	JMP UpdateCutsceneActors_RepeatActor				;C - - - - - 0x00A56E 02:855E: 4C 85 86

CutsceneOp_Prg:
	LDA (scratch8),Y			;C - - - - - 0x00A571 02:8561: B1 08
	STA sprPrgBank				;C - - - - - 0x00A573 02:8563: 8D 61 05
	LDA #$02					;C - - - - - 0x00A576 02:8566: A9 02
	JMP UpdateCutsceneActors_RepeatActor				;C - - - - - 0x00A578 02:8568: 4C 85 86

CutsceneOp_Pos:
	LDA (scratch8),Y			;C - - - - - 0x00A57B 02:856B: B1 08
	STA objX,X				;C - - - - - 0x00A57D 02:856D: 9D B3 05
	INY							;C - - - - - 0x00A580 02:8570: C8
	LDA (scratch8),Y			;C - - - - - 0x00A581 02:8571: B1 08
	STA objY,X				;C - - - - - 0x00A583 02:8573: 9D 8B 05
	LDA #$03					;C - - - - - 0x00A586 02:8576: A9 03
	JMP UpdateCutsceneActors_RepeatActor				;C - - - - - 0x00A588 02:8578: 4C 85 86

CutsceneOp_Time:
	LDA (scratch8),Y			;C - - - - - 0x00A58B 02:857B: B1 08
	STA cutsceneActorTimer,X				;C - - - - - 0x00A58D 02:857D: 9D 57 07
	LDA #$02					;C - - - - - 0x00A590 02:8580: A9 02
	JMP UpdateCutsceneActors_RepeatActor				;C - - - - - 0x00A592 02:8582: 4C 85 86

CutsceneOp_Move:
	LDA (scratch8),Y			;C - - - - - 0x00A595 02:8585: B1 08
	AND #$70					;C - - - - - 0x00A597 02:8587: 29 70
	LSR							;C - - - - - 0x00A599 02:8589: 4A
	LSR							;C - - - - - 0x00A59A 02:858A: 4A
	LSR							;C - - - - - 0x00A59B 02:858B: 4A
	LSR							;C - - - - - 0x00A59C 02:858C: 4A
	STA scratch0				;C - - - - - 0x00A59D 02:858D: 85 00
	LDA (scratch8),Y			;C - - - - - 0x00A59F 02:858F: B1 08
	AND #$80					;C - - - - - 0x00A5A1 02:8591: 29 80
	BEQ CODE_05859D				;C - - - - - 0x00A5A3 02:8593: F0 08
		LDA scratch0				;C - - - - - 0x00A5A5 02:8595: A5 00
		EOR #$FF					;C - - - - - 0x00A5A7 02:8597: 49 FF
		STA scratch0				;C - - - - - 0x00A5A9 02:8599: 85 00
		INC scratch0				;C - - - - - 0x00A5AB 02:859B: E6 00
CODE_05859D:
	LDA objX,X				;C - - - - - 0x00A5AD 02:859D: BD B3 05
	CLC							;C - - - - - 0x00A5B0 02:85A0: 18
	ADC scratch0				;C - - - - - 0x00A5B1 02:85A1: 65 00
	STA objX,X				;C - - - - - 0x00A5B3 02:85A3: 9D B3 05

	LDA (scratch8),Y			;C - - - - - 0x00A5B6 02:85A6: B1 08
	AND #$07					;C - - - - - 0x00A5B8 02:85A8: 29 07
	STA scratch0				;C - - - - - 0x00A5BA 02:85AA: 85 00
	LDA (scratch8),Y			;C - - - - - 0x00A5BC 02:85AC: B1 08
	AND #$08					;C - - - - - 0x00A5BE 02:85AE: 29 08
	BEQ CODE_0585BA				;C - - - - - 0x00A5C0 02:85B0: F0 08
		LDA scratch0				;C - - - - - 0x00A5C2 02:85B2: A5 00
		EOR #$FF					;C - - - - - 0x00A5C4 02:85B4: 49 FF
		STA scratch0				;C - - - - - 0x00A5C6 02:85B6: 85 00
		INC scratch0				;C - - - - - 0x00A5C8 02:85B8: E6 00
CODE_0585BA:
	LDA objY,X				;C - - - - - 0x00A5CA 02:85BA: BD 8B 05
	CLC							;C - - - - - 0x00A5CD 02:85BD: 18
	ADC scratch0				;C - - - - - 0x00A5CE 02:85BE: 65 00
	STA objY,X				;C - - - - - 0x00A5D0 02:85C0: 9D 8B 05

	DEC cutsceneActorTimer,X				;C - - - - - 0x00A5D3 02:85C3: DE 57 07
	BNE CODE_0585CD				;C - - - - - 0x00A5D6 02:85C6: D0 05
		LDA #$02					;C - - - - - 0x00A5D8 02:85C8: A9 02
		JMP UpdateCutsceneActors_NextActor				;C - - - - - 0x00A5DA 02:85CA: 4C A4 86
CODE_0585CD:
	JMP CutsceneOp_Stall				;C - - - - - 0x00A5DD 02:85CD: 4C 44 85

CutsceneOp_Jump:
	TXA							;C - - - - - 0x00A5E0 02:85D0: 8A
	ASL							;C - - - - - 0x00A5E1 02:85D1: 0A
	TAX							;C - - - - - 0x00A5E2 02:85D2: AA
	LDA (scratch8),Y			;C - - - - - 0x00A5E3 02:85D3: B1 08
	STA cutsceneScriptAdr,X				;C - - - - - 0x00A5E5 02:85D5: 9D 4B 07
	INY							;C - - - - - 0x00A5E8 02:85D8: C8
	LDA (scratch8),Y			;C - - - - - 0x00A5E9 02:85D9: B1 08
	STA cutsceneScriptAdr+1,X				;C - - - - - 0x00A5EB 02:85DB: 9D 4C 07
	LDA #$00					;C - - - - - 0x00A5EE 02:85DE: A9 00
	JMP UpdateCutsceneActors_RepeatActor				;C - - - - - 0x00A5F0 02:85E0: 4C 85 86

CutsceneOp_Wait:
	DEC cutsceneActorTimer,X				;C - - - - - 0x00A5F3 02:85E3: DE 57 07
	BNE CODE_0585ED				;C - - - - - 0x00A5F6 02:85E6: D0 05
		LDA #$01					;C - - - - - 0x00A5F8 02:85E8: A9 01
		JMP UpdateCutsceneActors_NextActor				;C - - - - - 0x00A5FA 02:85EA: 4C A4 86
CODE_0585ED:
	JMP CutsceneOp_Stall				;C - - - - - 0x00A5FD 02:85ED: 4C 44 85

CutsceneOp_Remove:
	LDA #$00					;C - - - - - 0x00A600 02:85F0: A9 00
	STA objState,X				;C - - - - - 0x00A602 02:85F2: 9D 63 05
	STA cutsceneActorActive,X				;C - - - - - 0x00A605 02:85F5: 9D 53 07
	STA objAnim,X				;C - - - - - 0x00A608 02:85F8: 9D 7B 06
	STA objAnimHI,X				;C - - - - - 0x00A60B 02:85FB: 9D 1B 07
	STA objAnimProgress,X				;C - - - - - 0x00A60E 02:85FE: 9D CB 06
	STA objAnimTimer,X				;C - - - - - 0x00A611 02:8601: 9D A3 06
	JMP UpdateCutsceneActors_NextActor				;C - - - - - 0x00A614 02:8604: 4C A4 86

CutsceneOp_Chr:
	LDA (scratch8),Y			;C - - - - - 0x00A617 02:8607: B1 08
	STA objChrSlot,X				;C - - - - - 0x00A619 02:8609: 9D 2B 06
	LDA #$02					;C - - - - - 0x00A61C 02:860C: A9 02
	JMP UpdateCutsceneActors_RepeatActor				;C - - - - - 0x00A61E 02:860E: 4C 85 86

CutsceneOp_BeginLoop:
	LDA (scratch8),Y			;C - - - - - 0x00A621 02:8611: B1 08
	STA cutsceneLoopsRemaining,X				;C - - - - - 0x00A623 02:8613: 9D 1D 05
	LDA #$02					;C - - - - - 0x00A626 02:8616: A9 02
	JMP UpdateCutsceneActors_RepeatActor				;C - - - - - 0x00A628 02:8618: 4C 85 86

CutsceneOp_Loop:
	DEC cutsceneLoopsRemaining,X				;C - - - - - 0x00A62B 02:861B: DE 1D 05
	BNE CODE_058625				;C - - - - - 0x00A62E 02:861E: D0 05
		LDA #$03					;C - - - - - 0x00A630 02:8620: A9 03
		JMP UpdateCutsceneActors_RepeatActor				;C - - - - - 0x00A632 02:8622: 4C 85 86
CODE_058625:
	JMP CutsceneOp_Jump				;C - - - - - 0x00A635 02:8625: 4C D0 85

CutsceneOp_Show:
	LDA #$01					;C - - - - - 0x00A638 02:8628: A9 01
	STA objState,X				;C - - - - - 0x00A63A 02:862A: 9D 63 05
	LDA #$01					;C - - - - - 0x00A63D 02:862D: A9 01
	JMP UpdateCutsceneActors_NextActor				;C - - - - - 0x00A63F 02:862F: 4C A4 86

CutsceneOp_Hide:
	LDA #$00					;C - - - - - 0x00A642 02:8632: A9 00
	STA objState,X				;C - - - - - 0x00A644 02:8634: 9D 63 05
	LDA #$01					;C - - - - - 0x00A647 02:8637: A9 01
	JMP UpdateCutsceneActors_NextActor				;C - - - - - 0x00A649 02:8639: 4C A4 86

CutsceneOp_Pal:
	LDA (scratch8),Y			;C - - - - - 0x00A64C 02:863C: B1 08
	TAX							;C - - - - - 0x00A64E 02:863E: AA
CODE_05863F:
	INY							;C - - - - - 0x00A64F 02:863F: C8
	LDA (scratch8),Y			;C - - - - - 0x00A650 02:8640: B1 08
	STA colorBuffer,X				;C - - - - - 0x00A652 02:8642: 9D 00 03
	INX							;C - - - - - 0x00A655 02:8645: E8
	CPY #$05					;C - - - - - 0x00A656 02:8646: C0 05
	BNE CODE_05863F				;C - - - - - 0x00A658 02:8648: D0 F5

	LDA #$06					;C - - - - - 0x00A65A 02:864A: A9 06
	JMP UpdateCutsceneActors_NextActor				;C - - - - - 0x00A65C 02:864C: 4C A4 86

CutsceneOp_Attr:
	LDA (scratch8),Y			;C - - - - - 0x00A65F 02:864F: B1 08
	STA objAttr,X				;C - - - - - 0x00A661 02:8651: 9D F3 06
	LDA #$02					;C - - - - - 0x00A664 02:8654: A9 02
	JMP UpdateCutsceneActors_RepeatActor				;C - - - - - 0x00A666 02:8656: 4C 85 86

CutsceneOp_Boss:
	LDA #$01					;C - - - - - 0x00A669 02:8659: A9 01
	STA objState+OSLOT_ENEMY				;C - - - - - 0x00A66B 02:865B: 8D 6C 05
	STA objAttr+OSLOT_ENEMY				;C - - - - - 0x00A66E 02:865E: 8D FC 06
	LDA #156					;C - - - - - 0x00A671 02:8661: A9 9C
	STA objX+OSLOT_ENEMY				;C - - - - - 0x00A673 02:8663: 8D BC 05
	LDA #151					;C - - - - - 0x00A676 02:8666: A9 97
	STA objY+OSLOT_ENEMY				;C - - - - - 0x00A678 02:8668: 8D 94 05
	LDA #$E9					;C - - - - - 0x00A67B 02:866B: A9 E9
	STA objAnim+OSLOT_ENEMY				;C - - - - - 0x00A67D 02:866D: 8D 84 06
	LDA #$00					;C - - - - - 0x00A680 02:8670: A9 00
	STA objAnimHI+OSLOT_ENEMY				;C - - - - - 0x00A682 02:8672: 8D 24 07
	STA objAnimProgress+OSLOT_ENEMY				;C - - - - - 0x00A685 02:8675: 8D D4 06
	STA objAnimTimer+OSLOT_ENEMY				;C - - - - - 0x00A688 02:8678: 8D AC 06
	LDA #$02					;C - - - - - 0x00A68B 02:867B: A9 02
	STA objChrSlot+OSLOT_ENEMY				;C - - - - - 0x00A68D 02:867D: 8D 34 06
	LDA #$01					;C - - - - - 0x00A690 02:8680: A9 01
	JMP UpdateCutsceneActors_NextActor				;C - - - - - 0x00A692 02:8682: 4C A4 86

UpdateCutsceneActors_RepeatActor:
	;A: Bump amount
	JSR BumpCutsceneAdr				;C - - - - - 0x00A695 02:8685: 20 8B 86
	JMP UpdateCutsceneActors_Update				;C - - - - - 0x00A698 02:8688: 4C EE 84

BumpCutsceneAdr:
	;A: Amount
	STA scratch0				;C - - - - - 0x00A69B 02:868B: 85 00

	LDA currentCutsceneActor				;C - - - - - 0x00A69D 02:868D: AD 5B 07
	ASL							;C - - - - - 0x00A6A0 02:8690: 0A
	TAX							;C - - - - - 0x00A6A1 02:8691: AA
	LDA cutsceneScriptAdr,X				;C - - - - - 0x00A6A2 02:8692: BD 4B 07
	CLC							;C - - - - - 0x00A6A5 02:8695: 18
	ADC scratch0				;C - - - - - 0x00A6A6 02:8696: 65 00
	STA cutsceneScriptAdr,X				;C - - - - - 0x00A6A8 02:8698: 9D 4B 07

	LDA cutsceneScriptAdr+1,X				;C - - - - - 0x00A6AB 02:869B: BD 4C 07
	ADC #$00					;C - - - - - 0x00A6AE 02:869E: 69 00
	STA cutsceneScriptAdr+1,X				;C - - - - - 0x00A6B0 02:86A0: 9D 4C 07
	RTS							;C - - - - - 0x00A6B3 02:86A3: 60

UpdateCutsceneActors_NextActor:
	;A: Jump distance
	JSR BumpCutsceneAdr				;C - - - - - 0x00A6B4 02:86A4: 20 8B 86
	INC currentCutsceneActor				;C - - - - - 0x00A6B7 02:86A7: EE 5B 07
	LDA currentCutsceneActor				;C - - - - - 0x00A6BA 02:86AA: AD 5B 07
	CMP #$04					;C - - - - - 0x00A6BD 02:86AD: C9 04
	BCC @loopchecked				;C - - - - - 0x00A6BF 02:86AF: 90 05
		LDA #$00					;C - - - - - 0x00A6C1 02:86B1: A9 00
		STA currentCutsceneActor				;C - - - - - 0x00A6C3 02:86B3: 8D 5B 07
@loopchecked:

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif

	JSR AnimateNonBubbles				;C - - - - - 0x00A6C6 02:86B6: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x00A6C9 02:86B9: 20 E2 EE
	RTS							;C - - - - - 0x00A6CC 02:86BC: 60

CODE_0586BD:
	LDA #$00					;C - - - - - 0x00A6CD 02:86BD: A9 00
	STA objState				;C - - - - - 0x00A6CF 02:86BF: 8D 63 05
	STA objState+1				;C - - - - - 0x00A6D2 02:86C2: 8D 64 05
	STA objState+2				;C - - - - - 0x00A6D5 02:86C5: 8D 65 05
	STA objState+3				;C - - - - - 0x00A6D8 02:86C8: 8D 66 05
	STA objChrBank+1				;C - - - - - 0x00A6DB 02:86CB: 8D 54 06
	STA objChrBank+2				;C - - - - - 0x00A6DE 02:86CE: 8D 55 06
	STA objChrBank+3				;C - - - - - 0x00A6E1 02:86D1: 8D 56 06
	JSR AnimateNonBubbles				;C - - - - - 0x00A6E4 02:86D4: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x00A6E7 02:86D7: 20 E2 EE

	LDY openingStage				;C - - - - - 0x00A6EA 02:86DA: AC CF 04
	LDA OpeningInitialCounters,Y			;C - - - - - 0x00A6ED 02:86DD: B9 15 87
	STA openingCounter				;C - - - - - 0x00A6F0 02:86E0: 8D CC 04

	LDA OpeningTracks,Y			;C - - - - - 0x00A6F3 02:86E3: B9 1F 87
	BEQ @musicchecked				;C - - - - - 0x00A6F6 02:86E6: F0 03
		STA a:musicTrigger			;C - - - - - 0x00A6F8 02:86E8: 8D E0 00
@musicchecked:
	LDA #$00					;C - - - - - 0x00A6FB 02:86EB: A9 00
	STA playerInvFrames				;C - - - - - 0x00A6FD 02:86ED: 8D 77 04

	LDA openingStage				;C - - - - - 0x00A700 02:86F0: AD CF 04
	ASL							;C - - - - - 0x00A703 02:86F3: 0A
	TAY							;C - - - - - 0x00A704 02:86F4: A8
	LDA OpeningRoutines,Y			;C - - - - - 0x00A705 02:86F5: B9 03 87
	STA nmiBankedSub				;C - - - - - 0x00A708 02:86F8: 85 16
	LDA OpeningRoutines+1,Y			;C - - - - - 0x00A70A 02:86FA: B9 04 87
	STA nmiBankedSub+1				;C - - - - - 0x00A70D 02:86FD: 85 17
	INC openingStage				;C - - - - - 0x00A70F 02:86FF: EE CF 04
	RTS							;C - - - - - 0x00A712 02:8702: 60

OpeningRoutines:
	;- D 0 - - - 0x00A713 02:8703: 5D
	.word LoadOpeningScreen				;OPENING_START
	.word IntroUpdate					;OPENING_SKULLS
	.word LoadOpeningScreen				;OPENING_SKULLS_HOLD
	.word IntroUpdate					;OPENING_TREE
	.word LoadOpeningScreen				;OPENING_TREE_PLAY
	.word CODE_058121					;OPENING_TITLE_SCREEN
	.word LoadOpeningScreen				;OPENING_TITLE_SCREEN_HOLD
	.word AdventureStartSetup			;OPENING_ADVENTURE
	.word CODE_058AFD					;OPENING_ADVENTURE_MOVE

OpeningInitialCounters:
	;- D 0 - - - 0x00A725 02:8715: 01
	.byte 1
	.byte 1
	.byte 2
	.byte 2
	.byte 3
	.byte 3
	.byte 4
	.byte 4
	.byte 4
	.byte 5

OpeningTracks:
	;- D 0 - - - 0x00A72F 02:871F: 09
	.byte trIntro_ID
	.byte trSilence_ID
	.byte trSilence_ID
	.byte trSilence_ID
	.byte trSilence_ID
	.byte trTitle_ID
	.byte trSilence_ID
	.byte trSilence_ID
	.byte trSilence_ID
	.byte trSilence_ID

CODE_058729:
	LDA currentRound				;C - - - - - 0x00A739 02:8729: A5 D8
	CMP #71					;C - - - - - 0x00A73B 02:872B: C9 47
	BNE CODE_05874C				;C - - - - - 0x00A73D 02:872D: D0 1D
		LDA #70					;C - - - - - 0x00A73F 02:872F: A9 46
		STA currentRound				;C - - - - - 0x00A741 02:8731: 85 D8
		LDA #.LOBYTE(PickRoundAnimSub)					;C - - - - - 0x00A743 02:8733: A9 9E
		STA bankedSub				;C - - - - - 0x00A745 02:8735: 85 55
		LDA #.HIBYTE(PickRoundAnimSub)					;C - - - - - 0x00A747 02:8737: A9 98
		STA bankedSub+1				;C - - - - - 0x00A749 02:8739: 85 56
		LDA #.BANK(PickRoundAnimSub)					;C - - - - - 0x00A74B 02:873B: A9 09
		STA bankedSubBank				;C - - - - - 0x00A74D 02:873D: 85 57
		LDA #.BANK(*)					;C - - - - - 0x00A74F 02:873F: A9 05
		STA bankedSubRetBank				;C - - - - - 0x00A751 02:8741: 85 58
		JSR RunBankedSub				;C - - - - - 0x00A753 02:8743: 20 72 E7
		JSR CODE_0587D4				;C - - - - - 0x00A756 02:8746: 20 D4 87
		JMP CODE_05874F				;C - - - - - 0x00A759 02:8749: 4C 4F 87
CODE_05874C:
	JSR CODE_058A56				;C - - - - - 0x00A75C 02:874C: 20 56 8A
CODE_05874F:
	RTS							;C - - - - - 0x00A75F 02:874F: 60

CODE_058750:
	LDA #.LOBYTE(PickRoundAnimSub)					;C - - - - - 0x00A760 02:8750: A9 9E
	STA bankedSub				;C - - - - - 0x00A762 02:8752: 85 55
	LDA #.HIBYTE(PickRoundAnimSub)					;C - - - - - 0x00A764 02:8754: A9 98
	STA bankedSub+1				;C - - - - - 0x00A766 02:8756: 85 56
	LDA #.BANK(PickRoundAnimSub)					;C - - - - - 0x00A768 02:8758: A9 09
	STA bankedSubBank				;C - - - - - 0x00A76A 02:875A: 85 57
	LDA #.BANK(*)					;C - - - - - 0x00A76C 02:875C: A9 05
	STA bankedSubRetBank				;C - - - - - 0x00A76E 02:875E: 85 58
	JSR RunBankedSub				;C - - - - - 0x00A770 02:8760: 20 72 E7
	LDA #$01					;C - - - - - 0x00A773 02:8763: A9 01
	STA cutsceneActorActive+1				;C - - - - - 0x00A775 02:8765: 8D 54 07
	STA cutsceneActorActive+2				;C - - - - - 0x00A778 02:8768: 8D 55 07
	LDX #CS_ROUND70					;C - - - - - 0x00A77B 02:876B: A2 06
	JSR SetupCutscene				;C - - - - - 0x00A77D 02:876D: 20 82 84
	LDA #$00					;C - - - - - 0x00A780 02:8770: A9 00
	STA cutsceneActorActive				;C - - - - - 0x00A782 02:8772: 8D 53 07
	STA cutsceneActorActive+3				;C - - - - - 0x00A785 02:8775: 8D 56 07
	STA currentCutsceneActor				;C - - - - - 0x00A788 02:8778: 8D 5B 07
	STA openingCycle				;C - - - - - 0x00A78B 02:877B: 8D CD 04
	LDA #$09					;C - - - - - 0x00A78E 02:877E: A9 09
	STA openingCounter				;C - - - - - 0x00A790 02:8780: 8D CC 04
	LDA #.BANK(CODE_05879C)					;C - - - - - 0x00A793 02:8783: A9 05
	STA updateSubBankA				;C - - - - - 0x00A795 02:8785: 85 18

	LDA #.BANK(CODE_059DB8)					;C - - - - - 0x00A797 02:8787: A9 05
	STA nmiPrgBankA				;C - - - - - 0x00A799 02:8789: 85 51
	LDA #.LOBYTE(CODE_059DB8)	;C - - - - - 0x00A79B 02:878B: A9 B8
	STA nmiBankedSub			;C - - - - - 0x00A79D 02:878D: 85 16
	LDA #.HIBYTE(CODE_059DB8)	;C - - - - - 0x00A79F 02:878F: A9 9D
	STA nmiBankedSub+1			;C - - - - - 0x00A7A1 02:8791: 85 17

	LDA #.LOBYTE(CODE_05879C)	;C - - - - - 0x00A7A3 02:8793: A9 9C
	STA updateSub				;C - - - - - 0x00A7A5 02:8795: 85 19
	LDA #.HIBYTE(CODE_05879C)	;C - - - - - 0x00A7A7 02:8797: A9 87
	STA updateSub+1				;C - - - - - 0x00A7A9 02:8799: 85 1A
	RTS							;C - - - - - 0x00A7AB 02:879B: 60

CODE_05879C:
	LDA #.LOBYTE(CODE_099D2E)					;C - - - - - 0x00A7AC 02:879C: A9 2E
	STA bankedSub				;C - - - - - 0x00A7AE 02:879E: 85 55
	LDA #.HIBYTE(CODE_099D2E)					;C - - - - - 0x00A7B0 02:87A0: A9 9D
	STA bankedSub+1				;C - - - - - 0x00A7B2 02:87A2: 85 56
	LDA #.BANK(CODE_099D2E)					;C - - - - - 0x00A7B4 02:87A4: A9 09
	STA bankedSubBank				;C - - - - - 0x00A7B6 02:87A6: 85 57
	LDA #.BANK(*)					;C - - - - - 0x00A7B8 02:87A8: A9 05
	STA bankedSubRetBank				;C - - - - - 0x00A7BA 02:87AA: 85 58
	JSR RunBankedSub				;C - - - - - 0x00A7BC 02:87AC: 20 72 E7
	JSR EndingUpdateCycle				;C - - - - - 0x00A7BF 02:87AF: 20 3D 88
	BEQ CODE_0587D3				;C - - - - - 0x00A7C2 02:87B2: F0 1F
		;Ending cutscene done
		LDA #.LOBYTE(CODE_0880F9)					;C - - - - - 0x00A7C4 02:87B4: A9 F9
		STA bankedSub				;C - - - - - 0x00A7C6 02:87B6: 85 55
		LDA #.HIBYTE(CODE_0880F9)					;C - - - - - 0x00A7C8 02:87B8: A9 80
		STA bankedSub+1				;C - - - - - 0x00A7CA 02:87BA: 85 56
		LDA #.BANK(CODE_0880F9)					;C - - - - - 0x00A7CC 02:87BC: A9 08
		STA bankedSubBank				;C - - - - - 0x00A7CE 02:87BE: 85 57
		LDA #.BANK(*)					;C - - - - - 0x00A7D0 02:87C0: A9 05
		STA bankedSubRetBank				;C - - - - - 0x00A7D2 02:87C2: 85 58
		JSR RunBankedSub				;C - - - - - 0x00A7D4 02:87C4: 20 72 E7

		LDA #.BANK(CODE_0781B9)					;C - - - - - 0x00A7D7 02:87C7: A9 07
		STA nmiPrgBankA				;C - - - - - 0x00A7D9 02:87C9: 85 51
		LDA #.LOBYTE(CODE_0781B9)	;C - - - - - 0x00A7DB 02:87CB: A9 B9
		STA nmiBankedSub			;C - - - - - 0x00A7DD 02:87CD: 85 16
		LDA #.HIBYTE(CODE_0781B9)	;C - - - - - 0x00A7DF 02:87CF: A9 81
		STA nmiBankedSub+1			;C - - - - - 0x00A7E1 02:87D1: 85 17
CODE_0587D3:
	RTS							;C - - - - - 0x00A7E3 02:87D3: 60

CODE_0587D4:
	LDA #$01					;C - - - - - 0x00A7E4 02:87D4: A9 01
	STA cutsceneActorActive				;C - - - - - 0x00A7E6 02:87D6: 8D 53 07
	STA cutsceneActorActive+1				;C - - - - - 0x00A7E9 02:87D9: 8D 54 07
	STA cutsceneActorActive+2				;C - - - - - 0x00A7EC 02:87DC: 8D 55 07
	STA cutsceneActorActive+3				;C - - - - - 0x00A7EF 02:87DF: 8D 56 07
	LDX #CS_ROUND70_WIN					;C - - - - - 0x00A7F2 02:87E2: A2 09
	JSR SetupCutscene				;C - - - - - 0x00A7F4 02:87E4: 20 82 84
	LDA #$00					;C - - - - - 0x00A7F7 02:87E7: A9 00
	STA currentCutsceneActor				;C - - - - - 0x00A7F9 02:87E9: 8D 5B 07
	STA openingCycle				;C - - - - - 0x00A7FC 02:87EC: 8D CD 04
	STA ram_0475				;C - - - - - 0x00A7FF 02:87EF: 8D 75 04
	LDA #$0A					;C - - - - - 0x00A802 02:87F2: A9 0A
	STA openingCounter				;C - - - - - 0x00A804 02:87F4: 8D CC 04
	LDA #.BANK(CODE_058813)					;C - - - - - 0x00A807 02:87F7: A9 05
	STA updateSubBankA				;C - - - - - 0x00A809 02:87F9: 85 18

	LDA #.BANK(CODE_0884AB)					;C - - - - - 0x00A80B 02:87FB: A9 08
	STA nmiPrgBankA				;C - - - - - 0x00A80D 02:87FD: 85 51
	JSR SpawnAdventureStartBubble				;C - - - - - 0x00A80F 02:87FF: 20 67 88

	LDA #.LOBYTE(CODE_0884AB)	;C - - - - - 0x00A812 02:8802: A9 AB
	STA nmiBankedSub			;C - - - - - 0x00A814 02:8804: 85 16
	LDA #.HIBYTE(CODE_0884AB)	;C - - - - - 0x00A816 02:8806: A9 84
	STA nmiBankedSub+1			;C - - - - - 0x00A818 02:8808: 85 17

	LDA #.LOBYTE(CODE_058813)	;C - - - - - 0x00A81A 02:880A: A9 13
	STA updateSub				;C - - - - - 0x00A81C 02:880C: 85 19
	LDA #.HIBYTE(CODE_058813)	;C - - - - - 0x00A81E 02:880E: A9 88
	STA updateSub+1				;C - - - - - 0x00A820 02:8810: 85 1A
	RTS							;C - - - - - 0x00A822 02:8812: 60

CODE_058813:
	LDA #.LOBYTE(CODE_099D2E)					;C - - - - - 0x00A823 02:8813: A9 2E
	STA bankedSub				;C - - - - - 0x00A825 02:8815: 85 55
	LDA #.HIBYTE(CODE_099D2E)					;C - - - - - 0x00A827 02:8817: A9 9D
	STA bankedSub+1				;C - - - - - 0x00A829 02:8819: 85 56
	LDA #.BANK(CODE_099D2E)					;C - - - - - 0x00A82B 02:881B: A9 09
	STA bankedSubBank				;C - - - - - 0x00A82D 02:881D: 85 57
	LDA #.BANK(*)					;C - - - - - 0x00A82F 02:881F: A9 05
	STA bankedSubRetBank				;C - - - - - 0x00A831 02:8821: 85 58
	JSR RunBankedSub				;C - - - - - 0x00A833 02:8823: 20 72 E7

	JSR EndingUpdateCycle				;C - - - - - 0x00A836 02:8826: 20 3D 88
	BEQ CODE_05883C				;C - - - - - 0x00A839 02:8829: F0 11
		LDA #.BANK(CODE_089D5D)					;C - - - - - 0x00A83B 02:882B: A9 08
		STA nmiPrgBankA				;C - - - - - 0x00A83D 02:882D: 85 51
		LDA #.LOBYTE(CODE_089D5D)	;C - - - - - 0x00A83F 02:882F: A9 5D
		STA nmiBankedSub			;C - - - - - 0x00A841 02:8831: 85 16
		LDA #.HIBYTE(CODE_089D5D)	;C - - - - - 0x00A843 02:8833: A9 9D
		STA nmiBankedSub+1			;C - - - - - 0x00A845 02:8835: 85 17
		LDA #2					;C - - - - - 0x00A847 02:8837: A9 02
		STA roundsToSkip				;C - - - - - 0x00A849 02:8839: 8D 7F 07
CODE_05883C:
	RTS							;C - - - - - 0x00A84C 02:883C: 60

EndingUpdateCycle:
	LDA globalTimer				;C - - - - - 0x00A84D 02:883D: A5 14
	AND #$3F					;C - - - - - 0x00A84F 02:883F: 29 3F
	BNE CODE_058861				;C - - - - - 0x00A851 02:8841: D0 1E
		INC openingCycle				;C - - - - - 0x00A853 02:8843: EE CD 04
		LDA openingCycle				;C - - - - - 0x00A856 02:8846: AD CD 04
		CMP openingCounter				;C - - - - - 0x00A859 02:8849: CD CC 04
		BCC CODE_058861				;C - - - - - 0x00A85C 02:884C: 90 13
			LDA #$00					;C - - - - - 0x00A85E 02:884E: A9 00
			STA cutsceneActorActive				;C - - - - - 0x00A860 02:8850: 8D 53 07
			STA cutsceneActorActive+1				;C - - - - - 0x00A863 02:8853: 8D 54 07
			STA cutsceneActorActive+2				;C - - - - - 0x00A866 02:8856: 8D 55 07
			STA cutsceneActorActive+3				;C - - - - - 0x00A869 02:8859: 8D 56 07
			LDA #$01					;C - - - - - 0x00A86C 02:885C: A9 01
			JMP CODE_058866				;C - - - - - 0x00A86E 02:885E: 4C 66 88
CODE_058861:
	JSR UpdateCutsceneActors				;C - - - - - 0x00A871 02:8861: 20 DC 84
	LDA #$00					;C - - - - - 0x00A874 02:8864: A9 00
CODE_058866:
	;A: 01 if cutscene done
	RTS							;C - - - - - 0x00A876 02:8866: 60

SpawnAdventureStartBubble:
	LDA #$00					;C - - - - - 0x00A877 02:8867: A9 00
	STA bubbleSpawnSlot				;C - - - - - 0x00A879 02:8869: 8D 43 07
	LDA #$01					;C - - - - - 0x00A87C 02:886C: A9 01
	STA bubbleSpawnState				;C - - - - - 0x00A87E 02:886E: 8D 44 07
	LDA objY				;C - - - - - 0x00A881 02:8871: AD 8B 05
	STA bubbleSpawnY				;C - - - - - 0x00A884 02:8874: 8D 45 07
	LDA objX				;C - - - - - 0x00A887 02:8877: AD B3 05
	STA bubbleSpawnX				;C - - - - - 0x00A88A 02:887A: 8D 46 07
	LDA #$00					;C - - - - - 0x00A88D 02:887D: A9 00
	STA bubbleSpawnChrSlot				;C - - - - - 0x00A88F 02:887F: 8D 49 07
	LDA #.LOBYTE(anFlames4_ID)					;C - - - - - 0x00A892 02:8882: A9 25
	STA bubbleSpawnAnim				;C - - - - - 0x00A894 02:8884: 8D 4A 07
	JSR SpawnBubble				;C - - - - - 0x00A897 02:8887: 20 2B EE
	RTS							;C - - - - - 0x00A89A 02:888A: 60

ResetLivesAndScore:
	;For current player
	LDA powerUps				;C - - - - - 0x00A89B 02:888B: A5 DE
	AND #~(POWERUP_CANDY|POWERUP_SHOE|POWERUP_BIG_BELL|POWERUP_BIG_TRIANGLE|POWERUP_BIG_COIN|POWERUP_BIG_DIAMOND)		;C - - - - - 0x00A89D 02:888D: 29 C0
	STA powerUps				;C - - - - - 0x00A89F 02:888F: 85 DE

	LDA #$00					;C - - - - - 0x00A8A1 02:8891: A9 00
	STA playerInvFrames				;C - - - - - 0x00A8A3 02:8893: 8D 77 04

	LDX currentPlayer				;C - - - - - 0x00A8A6 02:8896: AE 99 04
	LDA LivesScoreResetPlayerOfs,X			;C - - - - - 0x00A8A9 02:8899: BD C0 88
	TAY							;C - - - - - 0x00A8AC 02:889C: A8
	CLC							;C - - - - - 0x00A8AD 02:889D: 18
	ADC #SCORE_TOTAL_DIGITS					;C - - - - - 0x00A8AE 02:889E: 69 07
	STA scratch0				;C - - - - - 0x00A8B0 02:88A0: 85 00

	LDA #$01					;C - - - - - 0x00A8B2 02:88A2: A9 01
	STA playerHearts				;C - - - - - 0x00A8B4 02:88A4: 8D 78 04

	LDA #$03					;C - - - - - 0x00A8B7 02:88A7: A9 03
	STA playerLives				;C - - - - - 0x00A8B9 02:88A9: 8D 79 04
	STA livesDigits+1,Y				;C - - - - - 0x00A8BC 02:88AC: 99 80 04
	LDA #$00					;C - - - - - 0x00A8BF 02:88AF: A9 00
	STA livesDigits,Y				;C - - - - - 0x00A8C1 02:88B1: 99 7F 04
CODE_0588B4:
	STA scoreDigits,Y				;C - - - - - 0x00A8C4 02:88B4: 99 81 04
	STA scoreDigits+HUD_TOTAL_DIGITS+SCORE_TOTAL_DIGITS,Y				;C - - - - - 0x00A8C7 02:88B7: 99 91 04
	INY							;C - - - - - 0x00A8CA 02:88BA: C8
	CPY scratch0				;C - - - - - 0x00A8CB 02:88BB: C4 00
	BNE CODE_0588B4				;C - - - - - 0x00A8CD 02:88BD: D0 F5

	RTS							;C - - - - - 0x00A8CF 02:88BF: 60

LivesScoreResetPlayerOfs:
	.byte 0					;- D 0 - - - 0x00A8D0 02:88C0: 00
	.byte HUD_TOTAL_DIGITS					;- D 0 - - - 0x00A8D1 02:88C1: 09

ResetOAMBuffer:
	LDX #$00					;C - - - - - 0x00A8D2 02:88C2: A2 00
@clear:
	LDA #248					;C - - - - - 0x00A8D4 02:88C4: A9 F8
	STA OAMBuffer,X				;C - - - - - 0x00A8D6 02:88C6: 9D 00 02
	INX							;C - - - - - 0x00A8D9 02:88C9: E8
	INX							;C - - - - - 0x00A8DA 02:88CA: E8
	INX							;C - - - - - 0x00A8DB 02:88CB: E8
	INX							;C - - - - - 0x00A8DC 02:88CC: E8
	BNE @clear					;C - - - - - 0x00A8DD 02:88CD: D0 F5

	RTS							;C - - - - - 0x00A8DF 02:88CF: 60

AdventureStartSetup:
	LDA #$80					;C - - - - - 0x00A8E0 02:88D0: A9 80
	STA objX				;C - - - - - 0x00A8E2 02:88D2: 8D B3 05
	LDA #$7D					;C - - - - - 0x00A8E5 02:88D5: A9 7D
	STA objY				;C - - - - - 0x00A8E7 02:88D7: 8D 8B 05
	LDA #$00					;C - - - - - 0x00A8EA 02:88DA: A9 00
	STA objAnimHI				;C - - - - - 0x00A8EC 02:88DC: 8D 1B 07
	STA cutsceneActorActive				;C - - - - - 0x00A8EF 02:88DF: 8D 53 07
	STA cutsceneActorActive+1				;C - - - - - 0x00A8F2 02:88E2: 8D 54 07
	STA cutsceneActorActive+2				;C - - - - - 0x00A8F5 02:88E5: 8D 55 07
	STA cutsceneActorActive+3				;C - - - - - 0x00A8F8 02:88E8: 8D 56 07
	STA openingCycle				;C - - - - - 0x00A8FB 02:88EB: 8D CD 04
	STA openingCounter				;C - - - - - 0x00A8FE 02:88EE: 8D CC 04
	JSR SpawnAdventureStartBubble				;C - - - - - 0x00A901 02:88F1: 20 67 88
	JSR CODE_058910				;C - - - - - 0x00A904 02:88F4: 20 10 89
	LDA #.BANK(ImageTable1)					;C - - - - - 0x00A907 02:88F7: A9 04
	STA sprPrgBank				;C - - - - - 0x00A909 02:88F9: 8D 61 05
	JSR AnimateNonBubbles				;C - - - - - 0x00A90C 02:88FC: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x00A90F 02:88FF: 20 E2 EE

	LDA #.LOBYTE(CODE_05894D)	;C - - - - - 0x00A912 02:8902: A9 4D
	STA nmiBankedSub			;C - - - - - 0x00A914 02:8904: 85 16
	LDA #.HIBYTE(CODE_05894D)	;C - - - - - 0x00A916 02:8906: A9 89
	STA nmiBankedSub+1			;C - - - - - 0x00A918 02:8908: 85 17

	LDA #trGiantTower_ID					;C - - - - - 0x00A91A 02:890A: A9 03
	STA a:musicTrigger				;C - - - - - 0x00A91C 02:890C: 8D E0 00
	RTS							;C - - - - - 0x00A91F 02:890F: 60

CODE_058910:
	LDA #chrPlayer_A_ID					;C - - - - - 0x00A920 02:8910: A9 40
	STA chrBankD				;C - - - - - 0x00A922 02:8912: 85 4E
	LDX #$01					;C - - - - - 0x00A924 02:8914: A2 01
CODE_058916:
	LDA #$01					;C - - - - - 0x00A926 02:8916: A9 01
	STA objState,X				;C - - - - - 0x00A928 02:8918: 9D 63 05
	STA objChrSlot,X				;C - - - - - 0x00A92B 02:891B: 9D 2B 06
	LDA #.LOBYTE(anBubble_ID)					;C - - - - - 0x00A92E 02:891E: A9 27
	STA objAnim,X				;C - - - - - 0x00A930 02:8920: 9D 7B 06
	LDA #.HIBYTE(anBubble_ID)					;C - - - - - 0x00A933 02:8923: A9 00
	STA objAnimHI,X				;C - - - - - 0x00A935 02:8925: 9D 1B 07
	STA objAttr,X				;C - - - - - 0x00A938 02:8928: 9D F3 06
	STA objAnimProgress,X				;C - - - - - 0x00A93B 02:892B: 9D CB 06
	STA objAnimTimer,X				;C - - - - - 0x00A93E 02:892E: 9D A3 06
	LDA #$80					;C - - - - - 0x00A941 02:8931: A9 80
	STA objX,X				;C - - - - - 0x00A943 02:8933: 9D B3 05
	STA objY,X				;C - - - - - 0x00A946 02:8936: 9D 8B 05
	LDA DATA_058944,X			;C - - - - - 0x00A949 02:8939: BD 44 89
	STA enemyReward,X				;C - - - - - 0x00A94C 02:893C: 95 8E
	INX							;C - - - - - 0x00A94E 02:893E: E8
	CPX #$09					;C - - - - - 0x00A94F 02:893F: E0 09
	BCC CODE_058916				;C - - - - - 0x00A951 02:8941: 90 D3
	RTS							;C - - - - - 0x00A953 02:8943: 60

DATA_058944:
	.byte $00					;- - - - - - 0x00A954 02:8944: 00
	.byte $00					;- D 0 - - - 0x00A955 02:8945: 00
	.byte $20					;- D 0 - - - 0x00A956 02:8946: 20
	.byte $40					;- D 0 - - - 0x00A957 02:8947: 40
	.byte $60					;- D 0 - - - 0x00A958 02:8948: 60
	.byte $80					;- D 0 - - - 0x00A959 02:8949: 80
	.byte $A0					;- D 0 - - - 0x00A95A 02:894A: A0
	.byte $C0					;- D 0 - - - 0x00A95B 02:894B: C0
	.byte $E0					;- D 0 - - - 0x00A95C 02:894C: E0

CODE_05894D:
	LDA #.BANK(DATA_0ABF19)					;C - - - - - 0x00A95D 02:894D: A9 0A

.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00A95F 02:894F: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00A961 02:8951: 20 56 FF
.endif

	LDA pressedP1				;C - - - - - 0x00A964 02:8954: A5 0E
	AND #KEY_START				;C - - - - - 0x00A966 02:8956: 29 08
	BNE CODE_0589D5				;C - - - - - 0x00A968 02:8958: D0 7B
		LDA globalTimer				;C - - - - - 0x00A96A 02:895A: A5 14
		AND #$1F					;C - - - - - 0x00A96C 02:895C: 29 1F
		BNE CODE_05896A				;C - - - - - 0x00A96E 02:895E: D0 0A
			INC openingCycle				;C - - - - - 0x00A970 02:8960: EE CD 04
			LDA openingCycle				;C - - - - - 0x00A973 02:8963: AD CD 04
			CMP #$07					;C - - - - - 0x00A976 02:8966: C9 07
			BCS CODE_0589D5				;C - - - - - 0x00A978 02:8968: B0 6B
CODE_05896A:
	LDA openingCounter				;C - - - - - 0x00A97A 02:896A: AD CC 04
	CMP #$20					;C - - - - - 0x00A97D 02:896D: C9 20
	BCC CODE_05898C				;C - - - - - 0x00A97F 02:896F: 90 1B
		SEC							;C - - - - - 0x00A981 02:8971: 38
		SBC #$20					;C - - - - - 0x00A982 02:8972: E9 20
		LSR							;C - - - - - 0x00A984 02:8974: 4A
		ASL							;C - - - - - 0x00A985 02:8975: 0A
		TAX							;C - - - - - 0x00A986 02:8976: AA
		LDA DATA_0ABF19,X			;C - - - - - 0x00A987 02:8977: BD 19 BF
		EOR #$FF					;C - - - - - 0x00A98A 02:897A: 49 FF
		STA scratch0				;C - - - - - 0x00A98C 02:897C: 85 00
		INC scratch0				;C - - - - - 0x00A98E 02:897E: E6 00
		LDA DATA_0ABF19+1,X			;C - - - - - 0x00A990 02:8980: BD 1A BF
		EOR #$FF					;C - - - - - 0x00A993 02:8983: 49 FF
		STA scratch1				;C - - - - - 0x00A995 02:8985: 85 01
		INC scratch1				;C - - - - - 0x00A997 02:8987: E6 01
		JMP CODE_058999				;C - - - - - 0x00A999 02:8989: 4C 99 89
CODE_05898C:
	LSR							;C - - - - - 0x00A99C 02:898C: 4A
	ASL							;C - - - - - 0x00A99D 02:898D: 0A
	TAX							;C - - - - - 0x00A99E 02:898E: AA
	LDA DATA_0ABF19,X			;C - - - - - 0x00A99F 02:898F: BD 19 BF
	STA scratch0				;C - - - - - 0x00A9A2 02:8992: 85 00
	LDA DATA_0ABF19+1,X			;C - - - - - 0x00A9A4 02:8994: BD 1A BF
	STA scratch1				;C - - - - - 0x00A9A7 02:8997: 85 01
CODE_058999:
	LDA objX				;C - - - - - 0x00A9A9 02:8999: AD B3 05
	CLC							;C - - - - - 0x00A9AC 02:899C: 18
	ADC scratch0				;C - - - - - 0x00A9AD 02:899D: 65 00
	STA objX				;C - - - - - 0x00A9AF 02:899F: 8D B3 05
	LDA objY				;C - - - - - 0x00A9B2 02:89A2: AD 8B 05
	CLC							;C - - - - - 0x00A9B5 02:89A5: 18
	ADC scratch1				;C - - - - - 0x00A9B6 02:89A6: 65 01
	STA objY				;C - - - - - 0x00A9B8 02:89A8: 8D 8B 05
	JSR CODE_0589E7				;C - - - - - 0x00A9BB 02:89AB: 20 E7 89
	INC openingCounter				;C - - - - - 0x00A9BE 02:89AE: EE CC 04
	LDA openingCounter				;C - - - - - 0x00A9C1 02:89B1: AD CC 04
	CMP #$40					;C - - - - - 0x00A9C4 02:89B4: C9 40
	BCC CODE_0589BD				;C - - - - - 0x00A9C6 02:89B6: 90 05
		LDA #$00					;C - - - - - 0x00A9C8 02:89B8: A9 00
		STA openingCounter				;C - - - - - 0x00A9CA 02:89BA: 8D CC 04
CODE_0589BD:
	LDA globalTimer				;C - - - - - 0x00A9CD 02:89BD: A5 14
	AND #$01					;C - - - - - 0x00A9CF 02:89BF: 29 01
	BNE CODE_0589C6				;C - - - - - 0x00A9D1 02:89C1: D0 03
		JSR AnimateNonBubbles				;C - - - - - 0x00A9D3 02:89C3: 20 5C EE
CODE_0589C6:
	JSR DrawObjects				;C - - - - - 0x00A9D6 02:89C6: 20 E2 EE
	LDA globalTimer				;C - - - - - 0x00A9D9 02:89C9: A5 14
	LSR							;C - - - - - 0x00A9DB 02:89CB: 4A
	AND #$07					;C - - - - - 0x00A9DC 02:89CC: 29 07
	TAX							;C - - - - - 0x00A9DE 02:89CE: AA
	JSR CODE_058A39				;C - - - - - 0x00A9DF 02:89CF: 20 39 8A
	JMP CODE_0589E6				;C - - - - - 0x00A9E2 02:89D2: 4C E6 89

CODE_0589D5:
	LDX #$00					;C - - - - - 0x00A9E5 02:89D5: A2 00
	JSR CODE_058A39				;C - - - - - 0x00A9E7 02:89D7: 20 39 8A
	LDA #.BANK(CODE_088000)					;C - - - - - 0x00A9EA 02:89DA: A9 08
	STA nmiPrgBankA				;C - - - - - 0x00A9EC 02:89DC: 85 51
	LDA #.LOBYTE(CODE_088000)	;C - - - - - 0x00A9EE 02:89DE: A9 00
	STA nmiBankedSub			;C - - - - - 0x00A9F0 02:89E0: 85 16
	LDA #.HIBYTE(CODE_088000)	;C - - - - - 0x00A9F2 02:89E2: A9 80
	STA nmiBankedSub+1			;C - - - - - 0x00A9F4 02:89E4: 85 17
CODE_0589E6:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x00A9F6 02:89E6: 60

CODE_0589E7:
	LDX #$01					;C - - - - - 0x00A9F7 02:89E7: A2 01
CODE_0589E9:
	LDA enemyReward,X				;C - - - - - 0x00A9F9 02:89E9: B5 8E
	LSR							;C - - - - - 0x00A9FB 02:89EB: 4A
	LSR							;C - - - - - 0x00A9FC 02:89EC: 4A
	LSR							;C - - - - - 0x00A9FD 02:89ED: 4A
	AND #$1E					;C - - - - - 0x00A9FE 02:89EE: 29 1E
	CLC							;C - - - - - 0x00AA00 02:89F0: 18
	ADC DATA_0ABEB0,X			;C - - - - - 0x00AA01 02:89F1: 7D B0 BE
	TAY							;C - - - - - 0x00AA04 02:89F4: A8
	LDA globalTimer				;C - - - - - 0x00AA05 02:89F5: A5 14
	LSR							;C - - - - - 0x00AA07 02:89F7: 4A
	LDA DATA_0ABEB9,Y			;C - - - - - 0x00AA08 02:89F8: B9 B9 BE
	ADC #$00					;C - - - - - 0x00AA0B 02:89FB: 69 00
	PHA							;C - - - - - 0x00AA0D 02:89FD: 48
	ASL							;C - - - - - 0x00AA0E 02:89FE: 0A
	PLA							;C - - - - - 0x00AA0F 02:89FF: 68
	ROR							;C - - - - - 0x00AA10 02:8A00: 6A
	CLC							;C - - - - - 0x00AA11 02:8A01: 18
	ADC objX,X				;C - - - - - 0x00AA12 02:8A02: 7D B3 05
	STA objX,X				;C - - - - - 0x00AA15 02:8A05: 9D B3 05
	CLC							;C - - - - - 0x00AA18 02:8A08: 18
	ADC #$08					;C - - - - - 0x00AA19 02:8A09: 69 08
	CMP #$11					;C - - - - - 0x00AA1B 02:8A0B: C9 11
	BCC CODE_058A29				;C - - - - - 0x00AA1D 02:8A0D: 90 1A
		LDA globalTimer				;C - - - - - 0x00AA1F 02:8A0F: A5 14
		LSR							;C - - - - - 0x00AA21 02:8A11: 4A
		LDA DATA_0ABEB9+1,Y			;C - - - - - 0x00AA22 02:8A12: B9 BA BE
		ADC #$00					;C - - - - - 0x00AA25 02:8A15: 69 00
		PHA							;C - - - - - 0x00AA27 02:8A17: 48
		ASL							;C - - - - - 0x00AA28 02:8A18: 0A
		PLA							;C - - - - - 0x00AA29 02:8A19: 68
		ROR							;C - - - - - 0x00AA2A 02:8A1A: 6A
		CLC							;C - - - - - 0x00AA2B 02:8A1B: 18
		ADC objY,X				;C - - - - - 0x00AA2C 02:8A1C: 7D 8B 05
		STA objY,X				;C - - - - - 0x00AA2F 02:8A1F: 9D 8B 05
		CLC							;C - - - - - 0x00AA32 02:8A22: 18
		ADC #$08					;C - - - - - 0x00AA33 02:8A23: 69 08
		CMP #$11					;C - - - - - 0x00AA35 02:8A25: C9 11
		BCS CODE_058A31				;C - - - - - 0x00AA37 02:8A27: B0 08
CODE_058A29:
	LDA #$80					;C - - - - - 0x00AA39 02:8A29: A9 80
	STA objX,X				;C - - - - - 0x00AA3B 02:8A2B: 9D B3 05
	STA objY,X				;C - - - - - 0x00AA3E 02:8A2E: 9D 8B 05
CODE_058A31:
	INC enemyReward,X				;C - - - - - 0x00AA41 02:8A31: F6 8E
	INX							;C - - - - - 0x00AA43 02:8A33: E8
	CPX #$09					;C - - - - - 0x00AA44 02:8A34: E0 09
	BCC CODE_0589E9				;C - - - - - 0x00AA46 02:8A36: 90 B1

	RTS							;C - - - - - 0x00AA48 02:8A38: 60

CODE_058A39:
	LDA DATA_058A46,X			;C - - - - - 0x00AA49 02:8A39: BD 46 8A
	STA colorBuffer+13				;C - - - - - 0x00AA4C 02:8A3C: 8D 0D 03
	LDA DATA_058A4E,X			;C - - - - - 0x00AA4F 02:8A3F: BD 4E 8A
	STA colorBuffer+14				;C - - - - - 0x00AA52 02:8A42: 8D 0E 03
	RTS							;C - - - - - 0x00AA55 02:8A45: 60

DATA_058A46:
	.byte $30					;- D 0 - - - 0x00AA56 02:8A46: 30
	.byte $26					;- D 0 - - - 0x00AA57 02:8A47: 26
	.byte $16					;- D 0 - - - 0x00AA58 02:8A48: 16
	.byte $16					;- D 0 - - - 0x00AA59 02:8A49: 16
	.byte $26					;- D 0 - - - 0x00AA5A 02:8A4A: 26
	.byte $30					;- D 0 - - - 0x00AA5B 02:8A4B: 30
	.byte $30					;- D 0 - - - 0x00AA5C 02:8A4C: 30
	.byte $30					;- D 0 - - - 0x00AA5D 02:8A4D: 30
DATA_058A4E:
	.byte $3B					;- D 0 - - - 0x00AA5E 02:8A4E: 3B
	.byte $16					;- D 0 - - - 0x00AA5F 02:8A4F: 16
	.byte $06					;- D 0 - - - 0x00AA60 02:8A50: 06
	.byte $06					;- D 0 - - - 0x00AA61 02:8A51: 06
	.byte $16					;- D 0 - - - 0x00AA62 02:8A52: 16
	.byte $3B					;- D 0 - - - 0x00AA63 02:8A53: 3B
	.byte $3B					;- D 0 - - - 0x00AA64 02:8A54: 3B
	.byte $3B					;- D 0 - - - 0x00AA65 02:8A55: 3B

CODE_058A56:
	LDY #$00					;C - - - - - 0x00AA66 02:8A56: A0 00
CODE_058A58:
	LDA palEndingUnfaded,Y			;C - - - - - 0x00AA68 02:8A58: B9 9F 8A
	STA unfadedColorBuffer,Y				;C - - - - - 0x00AA6B 02:8A5B: 99 40 03
	INY							;C - - - - - 0x00AA6E 02:8A5E: C8
	CPY #17					;C - - - - - 0x00AA6F 02:8A5F: C0 11
	BNE CODE_058A58				;C - - - - - 0x00AA71 02:8A61: D0 F5

	LDA #$00					;C - - - - - 0x00AA73 02:8A63: A9 00
	STA ram_0475				;C - - - - - 0x00AA75 02:8A65: 8D 75 04
	JSR CODE_0FE36B				;C - - - - - 0x00AA78 02:8A68: 20 6B E3

	LDA #FADE_WHITE				;C - - - - - 0x00AA7B 02:8A6B: A9 02
	STA fadeMode				;C - - - - - 0x00AA7D 02:8A6D: 8D 53 05
	LDA #$2A					;C - - - - - 0x00AA80 02:8A70: A9 2A
	STA fadeUnk0556				;C - - - - - 0x00AA82 02:8A72: 8D 56 05
.ifdef REGION_JP
	LDA #$03					;- - - - - - 0x00AA99 02:8A89: A9
.else
	LDA #$07					;C - - - - - 0x00AA85 02:8A75: A9 07
.endif
	STA fadeSpeedMask				;C - - - - - 0x00AA87 02:8A77: 8D 57 05
	LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x00AA8A 02:8A7A: A9 00
	STA fadeColorsAdr				;C - - - - - 0x00AA8C 02:8A7C: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00AA8F 02:8A7F: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x00AA91 02:8A81: 8D 5B 05
	LDA #4					;C - - - - - 0x00AA94 02:8A84: A9 04
	STA fadePasses				;C - - - - - 0x00AA96 02:8A86: 8D 54 05
	LDA #32					;C - - - - - 0x00AA99 02:8A89: A9 20
	STA fadeColorsAmount				;C - - - - - 0x00AA9B 02:8A8B: 8D 55 05

.ifdef REGION_JP
	LDA #.LOBYTE(CODE_JP_058AC4)					;- - - - - - 0x00AAB2 02:8AA2: A9
	STA updateSub					;- - - - - - 0x00AAB4 02:8AA4: 85
	LDA #.HIBYTE(CODE_JP_058AC4)					;- - - - - - 0x00AAB6 02:8AA6: A9
	STA updateSub+1					;- - - - - - 0x00AAB8 02:8AA8: 85
.else
	LDA #.LOBYTE(CODE_058AB0)	;C - - - - - 0x00AA9E 02:8A8E: A9 B0
	STA updateSub				;C - - - - - 0x00AAA0 02:8A90: 85 19
	LDA #.HIBYTE(CODE_058AB0)	;C - - - - - 0x00AAA2 02:8A92: A9 8A
	STA updateSub+1				;C - - - - - 0x00AAA4 02:8A94: 85 1A
.endif

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00AAA6 02:8A96: A9 50
	STA nmiBankedSub			;C - - - - - 0x00AAA8 02:8A98: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00AAAA 02:8A9A: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x00AAAC 02:8A9C: 85 17
	RTS							;C - - - - - 0x00AAAE 02:8A9E: 60

palEndingUnfaded:
	;BG palette for the ending, to use for fading
	.byte $0F					;- D 0 - - - 0x00AAAF 02:8A9F: 0F
	.byte $1C					;- D 0 - - - 0x00AAB0 02:8AA0: 1C
	.byte $0C					;- D 0 - - - 0x00AAB1 02:8AA1: 0C
	.byte $2C					;- D 0 - - - 0x00AAB2 02:8AA2: 2C
	.byte $0F					;- D 0 - - - 0x00AAB3 02:8AA3: 0F
	.byte $00					;- D 0 - - - 0x00AAB4 02:8AA4: 00
	.byte $00					;- D 0 - - - 0x00AAB5 02:8AA5: 00
	.byte $00					;- D 0 - - - 0x00AAB6 02:8AA6: 00
	.byte $0F					;- D 0 - - - 0x00AAB7 02:8AA7: 0F
	.byte $00					;- D 0 - - - 0x00AAB8 02:8AA8: 00
	.byte $00					;- D 0 - - - 0x00AAB9 02:8AA9: 00
	.byte $00					;- D 0 - - - 0x00AABA 02:8AAA: 00
	.byte $0F					;- D 0 - - - 0x00AABB 02:8AAB: 0F
	.byte $30					;- D 0 - - - 0x00AABC 02:8AAC: 30
	.byte $16					;- D 0 - - - 0x00AABD 02:8AAD: 16
	.byte $0C					;- D 0 - - - 0x00AABE 02:8AAE: 0C
	.byte $0F					;- D 0 - - - 0x00AABF 02:8AAF: 0F

.ifdef REGION_JP
CODE_JP_058AC4:
	;- - - - - - 0x00AAD4 02:8AC4: A9
	LDA #FADE_IN
	STA fadeMode
	LDA #$2A
	STA fadeUnk0556
	LDA #$03
	STA fadeSpeedMask
	LDA #.LOBYTE(unfadedColorBuffer)
	STA fadeMaxColorsAdr
	LDA #.HIBYTE(unfadedColorBuffer)
	STA fadeMaxColorsAdr+1
	LDA #.LOBYTE(colorBuffer)
	STA fadeColorsAdr
	LDA #.HIBYTE(colorBuffer)
	STA fadeColorsAdr+1
	LDA #4
	STA fadePasses
	LDA #$20
	STA fadeColorsAmount
	LDA #.LOBYTE(CODE_JP_058B02)
	STA updateSub
	LDA #.HIBYTE(CODE_JP_058B02)
	STA updateSub+1
	LDA #.LOBYTE(RunColorFader)
	STA nmiBankedSub
	LDA #.HIBYTE(RunColorFader)
	STA nmiBankedSub+1
	RTS
.endif

.ifdef REGION_JP
CODE_JP_058B02:
	LDA #FADE_WHITE					;- - - - - - 0x00AB12 02:8B02: A9
	STA fadeMode					;- - - - - - 0x00AB14 02:8B04: 8D
	LDA #$2A					;- - - - - - 0x00AB17 02:8B07: A9
	STA fadeUnk0556					;- - - - - - 0x00AB19 02:8B09: 8D
	LDA #$03					;- - - - - - 0x00AB1C 02:8B0C: A9
	STA fadeSpeedMask					;- - - - - - 0x00AB1E 02:8B0E: 8D
	LDA #.LOBYTE(colorBuffer)					;- - - - - - 0x00AB21 02:8B11: A9
	STA fadeColorsAdr					;- - - - - - 0x00AB23 02:8B13: 8D
	LDA #.HIBYTE(colorBuffer)					;- - - - - - 0x00AB26 02:8B16: A9
	STA fadeColorsAdr+1					;- - - - - - 0x00AB28 02:8B18: 8D
	LDA #4					;- - - - - - 0x00AB2B 02:8B1B: A9
	STA fadePasses					;- - - - - - 0x00AB2D 02:8B1D: 8D
	LDA #32					;- - - - - - 0x00AB30 02:8B20: A9
	STA fadeColorsAmount					;- - - - - - 0x00AB32 02:8B22: 8D
	LDA #.LOBYTE(CODE_JP_058B36)					;- - - - - - 0x00AB35 02:8B25: A9
	STA updateSub					;- - - - - - 0x00AB37 02:8B27: 85
	LDA #.HIBYTE(CODE_JP_058B36)					;- - - - - - 0x00AB39 02:8B29: A9
	STA updateSub+1					;- - - - - - 0x00AB3B 02:8B2B: 85
	LDA #.LOBYTE(RunColorFader)					;- - - - - - 0x00AB3D 02:8B2D: A9
	STA nmiBankedSub					;- - - - - - 0x00AB3F 02:8B2F: 85
	LDA #.HIBYTE(RunColorFader)					;- - - - - - 0x00AB41 02:8B31: A9
	STA nmiBankedSub+1					;- - - - - - 0x00AB43 02:8B33: 85
	RTS					;- - - - - - 0x00AB45 02:8B35: 60
.endif

.ifdef REGION_JP
CODE_JP_058B36:
	LDA #FADE_IN					;- - - - - - 0x00AB46 02:8B36: A9
	STA fadeMode					;- - - - - - 0x00AB48 02:8B38: 8D
	LDA #$2A					;- - - - - - 0x00AB4B 02:8B3B: A9
	STA fadeUnk0556					;- - - - - - 0x00AB4D 02:8B3D: 8D
	LDA #$03					;- - - - - - 0x00AB50 02:8B40: A9
	STA fadeSpeedMask					;- - - - - - 0x00AB52 02:8B42: 8D
	LDA #.LOBYTE(unfadedColorBuffer)					;- - - - - - 0x00AB55 02:8B45: A9
	STA fadeMaxColorsAdr					;- - - - - - 0x00AB57 02:8B47: 8D
	LDA #.HIBYTE(unfadedColorBuffer)					;- - - - - - 0x00AB5A 02:8B4A: A9
	STA fadeMaxColorsAdr+1					;- - - - - - 0x00AB5C 02:8B4C: 8D
	LDA #.LOBYTE(colorBuffer)					;- - - - - - 0x00AB5F 02:8B4F: A9
	STA fadeColorsAdr					;- - - - - - 0x00AB61 02:8B51: 8D
	LDA #.HIBYTE(colorBuffer)					;- - - - - - 0x00AB64 02:8B54: A9
	STA fadeColorsAdr+1					;- - - - - - 0x00AB66 02:8B56: 8D
	LDA #4					;- - - - - - 0x00AB69 02:8B59: A9
	STA fadePasses					;- - - - - - 0x00AB6B 02:8B5B: 8D
	LDA #32					;- - - - - - 0x00AB6E 02:8B5E: A9
	STA fadeColorsAmount					;- - - - - - 0x00AB70 02:8B60: 8D
	LDA #.LOBYTE(CODE_058AB0)					;- - - - - - 0x00AB73 02:8B63: A9
	STA updateSub					;- - - - - - 0x00AB75 02:8B65: 85
	LDA #.HIBYTE(CODE_058AB0)					;- - - - - - 0x00AB77 02:8B67: A9
	STA updateSub+1					;- - - - - - 0x00AB79 02:8B69: 85
	LDA #.LOBYTE(RunColorFader)					;- - - - - - 0x00AB7B 02:8B6B: A9
	STA nmiBankedSub					;- - - - - - 0x00AB7D 02:8B6D: 85
	LDA #.HIBYTE(RunColorFader)					;- - - - - - 0x00AB7F 02:8B6F: A9
	STA nmiBankedSub+1					;- - - - - - 0x00AB81 02:8B71: 85
	RTS					;- - - - - - 0x00AB83 02:8B73: 60
.endif

CODE_058AB0:
	LDA #$05					;C - - - - - 0x00AAC0 02:8AB0: A9 05
	STA openingCounter				;C - - - - - 0x00AAC2 02:8AB2: 8D CC 04
	LDA #OPENING_ADVENTURE_MOVE		;C - - - - - 0x00AAC5 02:8AB5: A9 08
	STA openingStage				;C - - - - - 0x00AAC7 02:8AB7: 8D CF 04

	LDA #FADE_OUT					;C - - - - - 0x00AACA 02:8ABA: A9 00
	STA fadeMode				;C - - - - - 0x00AACC 02:8ABC: 8D 53 05
	LDA #$2A					;C - - - - - 0x00AACF 02:8ABF: A9 2A
	STA fadeUnk0556				;C - - - - - 0x00AAD1 02:8AC1: 8D 56 05
	LDA #$07					;C - - - - - 0x00AAD4 02:8AC4: A9 07
	STA fadeSpeedMask				;C - - - - - 0x00AAD6 02:8AC6: 8D 57 05
	LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x00AAD9 02:8AC9: A9 00
	STA fadeColorsAdr				;C - - - - - 0x00AADB 02:8ACB: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00AADE 02:8ACE: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x00AAE0 02:8AD0: 8D 5B 05
	LDA #4					;C - - - - - 0x00AAE3 02:8AD3: A9 04
	STA fadePasses				;C - - - - - 0x00AAE5 02:8AD5: 8D 54 05
	LDA #32					;C - - - - - 0x00AAE8 02:8AD8: A9 20
	STA fadeColorsAmount				;C - - - - - 0x00AAEA 02:8ADA: 8D 55 05

	LDA #.LOBYTE(CODE_058AEE)	;C - - - - - 0x00AAED 02:8ADD: A9 EE
	STA updateSub				;C - - - - - 0x00AAEF 02:8ADF: 85 19
	LDA #.HIBYTE(CODE_058AEE)	;C - - - - - 0x00AAF1 02:8AE1: A9 8A
	STA updateSub+1				;C - - - - - 0x00AAF3 02:8AE3: 85 1A

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00AAF5 02:8AE5: A9 50
	STA nmiBankedSub			;C - - - - - 0x00AAF7 02:8AE7: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00AAF9 02:8AE9: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x00AAFB 02:8AEB: 85 17
	RTS							;C - - - - - 0x00AAFD 02:8AED: 60

CODE_058AEE:
	LDA #$00					;C - - - - - 0x00AAFE 02:8AEE: A9 00
	STA vNametable				;C - - - - - 0x00AB00 02:8AF0: 85 2D
	STA hNametable				;C - - - - - 0x00AB02 02:8AF2: 85 2F

	LDA #.LOBYTE(LoadOpeningScreen)	;C - - - - - 0x00AB04 02:8AF4: A9 5D
	STA nmiBankedSub			;C - - - - - 0x00AB06 02:8AF6: 85 16
	LDA #.HIBYTE(LoadOpeningScreen)	;C - - - - - 0x00AB08 02:8AF8: A9 83
	STA nmiBankedSub+1			;C - - - - - 0x00AB0A 02:8AFA: 85 17
	RTS							;C - - - - - 0x00AB0C 02:8AFC: 60

CODE_058AFD:
	LDA #$01					;C - - - - - 0x00AB0D 02:8AFD: A9 01
	STA cutsceneActorActive				;C - - - - - 0x00AB0F 02:8AFF: 8D 53 07
	STA cutsceneActorActive+1				;C - - - - - 0x00AB12 02:8B02: 8D 54 07
	STA cutsceneActorActive+2				;C - - - - - 0x00AB15 02:8B05: 8D 55 07
	STA cutsceneActorActive+3				;C - - - - - 0x00AB18 02:8B08: 8D 56 07

	LDX #CS_ENDING					;C - - - - - 0x00AB1B 02:8B0B: A2 0C
	JSR SetupCutscene				;C - - - - - 0x00AB1D 02:8B0D: 20 82 84

	LDA #$00					;C - - - - - 0x00AB20 02:8B10: A9 00
	STA currentCutsceneActor				;C - - - - - 0x00AB22 02:8B12: 8D 5B 07
	STA openingCycle				;C - - - - - 0x00AB25 02:8B15: 8D CD 04
	LDA #$1E					;C - - - - - 0x00AB28 02:8B18: A9 1E
	STA openingCounter				;C - - - - - 0x00AB2A 02:8B1A: 8D CC 04

	LDA #.LOBYTE(CODE_058B40)	;C - - - - - 0x00AB2D 02:8B1D: A9 40
	STA nmiBankedSub			;C - - - - - 0x00AB2F 02:8B1F: 85 16
	LDA #.HIBYTE(CODE_058B40)	;C - - - - - 0x00AB31 02:8B21: A9 8B
	STA nmiBankedSub+1			;C - - - - - 0x00AB33 02:8B23: 85 17

	LDA #trEnding_ID					;C - - - - - 0x00AB35 02:8B25: A9 02
	STA a:musicTrigger				;C - - - - - 0x00AB37 02:8B27: 8D E0 00

	LDA #$0F					;C - - - - - 0x00AB3A 02:8B2A: A9 0F
	STA colorBuffer+COL_SPR+1				;C - - - - - 0x00AB3C 02:8B2C: 8D 11 03
	LDA #$30					;C - - - - - 0x00AB3F 02:8B2F: A9 30
	STA colorBuffer+COL_SPR+2				;C - - - - - 0x00AB41 02:8B31: 8D 12 03
	LDX currentPlayer				;C - - - - - 0x00AB44 02:8B34: AE 99 04
	LDA DATA_058B3E,X			;C - - - - - 0x00AB47 02:8B37: BD 3E 8B
	STA colorBuffer+COL_SPR+3				;C - - - - - 0x00AB4A 02:8B3A: 8D 13 03
	RTS							;C - - - - - 0x00AB4D 02:8B3D: 60

DATA_058B3E:
	.byte $2A					;- D 0 - - - 0x00AB4E 02:8B3E: 2A
	.byte $21					;- D 0 - - - 0x00AB4F 02:8B3F: 21

CODE_058B40:
	JSR EndingUpdateCycle				;C - - - - - 0x00AB50 02:8B40: 20 3D 88
	BEQ CODE_058B59				;C - - - - - 0x00AB53 02:8B43: F0 14
		LDA #$00					;C - - - - - 0x00AB55 02:8B45: A9 00
		STA openingCycle				;C - - - - - 0x00AB57 02:8B47: 8D CD 04
		STA openingCounter				;C - - - - - 0x00AB5A 02:8B4A: 8D CC 04
		LDA #.BANK(CODE_078000)					;C - - - - - 0x00AB5D 02:8B4D: A9 07
		STA nmiPrgBankA				;C - - - - - 0x00AB5F 02:8B4F: 85 51
		LDA #.LOBYTE(CODE_078000)	;C - - - - - 0x00AB61 02:8B51: A9 00
		STA nmiBankedSub			;C - - - - - 0x00AB63 02:8B53: 85 16
		LDA #.HIBYTE(CODE_078000)	;C - - - - - 0x00AB65 02:8B55: A9 80
		STA nmiBankedSub+1			;C - - - - - 0x00AB67 02:8B57: 85 17
CODE_058B59:
	RTS							;C - - - - - 0x00AB69 02:8B59: 60

CODE_058B5A:
	LDA #$00					;C - - - - - 0x00AB6A 02:8B5A: A9 00
	STA vNametable				;C - - - - - 0x00AB6C 02:8B5C: 85 2D
	STA roundFlags				;C - - - - - 0x00AB6E 02:8B5E: 8D 71 04

.ifdef REGION_JP
	LDA #$40
	STA $E000
.else
	LDA #$01					;C - - - - - 0x00AB71 02:8B61: A9 01
	STA $A000				;C - - - - - 0x00AB73 02:8B63: 8D 00 A0
.endif

	LDA #$00					;C - - - - - 0x00AB76 02:8B66: A9 00
	STA wideRound				;C - - - - - 0x00AB78 02:8B68: 8D B0 03
	LDA #chrSmallFont_A_ID					;C - - - - - 0x00AB7B 02:8B6B: A9 0E
	STA chrBankA				;C - - - - - 0x00AB7D 02:8B6D: 85 4B
	LDA #chrShoeCar_A_ID					;C - - - - - 0x00AB7F 02:8B6F: A9 38
	STA chrBankB				;C - - - - - 0x00AB81 02:8B71: 85 4C

	LDA #SPLASH_CONTINUE		;C - - - - - 0x00AB83 02:8B73: A9 00
	STA scratch0				;C - - - - - 0x00AB85 02:8B75: 85 00
	JSR LoadSplashMap				;C - - - - - 0x00AB87 02:8B77: 20 DB 8B

	JSR CODE_0FE36B				;C - - - - - 0x00AB8A 02:8B7A: 20 6B E3
	LDA #$00					;C - - - - - 0x00AB8D 02:8B7D: A9 00
	STA rewardsEaten				;C - - - - - 0x00AB8F 02:8B7F: 8D 3F 05
	STA skelMonstaWarnings				;C - - - - - 0x00AB92 02:8B82: 8D 40 05
	STA crystals				;C - - - - - 0x00AB95 02:8B85: 8D 41 05
	STA ram_0543				;C - - - - - 0x00AB98 02:8B88: 8D 43 05
	STA ram_0544				;C - - - - - 0x00AB9B 02:8B8B: 8D 44 05
	STA ram_0545				;C - - - - - 0x00AB9E 02:8B8E: 8D 45 05
	STA shootCounter				;C - - - - - 0x00ABA1 02:8B91: 8D 46 05
	STA sameRewardStreak				;C - - - - - 0x00ABA4 02:8B94: 8D 48 05
	STA ram_0549				;C - - - - - 0x00ABA7 02:8B97: 8D 49 05
	STA shoes				;C - - - - - 0x00ABAA 02:8B9A: 8D 4B 05
	STA ram_054C				;C - - - - - 0x00ABAD 02:8B9D: 8D 4C 05

	LDA #.LOBYTE(CODE_058BAC)	;C - - - - - 0x00ABB0 02:8BA0: A9 AC
	STA updateSub				;C - - - - - 0x00ABB2 02:8BA2: 85 19
	LDA #.HIBYTE(CODE_058BAC)	;C - - - - - 0x00ABB4 02:8BA4: A9 8B
	STA updateSub+1				;C - - - - - 0x00ABB6 02:8BA6: 85 1A
	RTS							;C - - - - - 0x00ABB8 02:8BA8: 60

DATA_058BA9:
	.byte $0E					;- - - - - - 0x00ABB9 02:8BA9: 0E
	.byte $02					;- - - - - - 0x00ABBA 02:8BAA: 02
	.byte $0E					;- - - - - - 0x00ABBB 02:8BAB: 0E

CODE_058BAC:
	LDA continues				;C - - - - - 0x00ABBC 02:8BAC: A5 DC
	BNE CODE_058BC2				;C - - - - - 0x00ABBE 02:8BAE: D0 12
		LDA #SPLASH_GAME_OVER	;C - - - - - 0x00ABC0 02:8BB0: A9 01
		STA scratch0				;C - - - - - 0x00ABC2 02:8BB2: 85 00
		JSR LoadSplashMap				;C - - - - - 0x00ABC4 02:8BB4: 20 DB 8B

		LDA #.LOBYTE(CODE_058C2E)	;C - - - - - 0x00ABC7 02:8BB7: A9 2E
		STA updateSub				;C - - - - - 0x00ABC9 02:8BB9: 85 19
		LDA #.HIBYTE(CODE_058C2E)	;C - - - - - 0x00ABCB 02:8BBB: A9 8C
		STA updateSub+1				;C - - - - - 0x00ABCD 02:8BBD: 85 1A

		JMP CODE_058BDA				;C - - - - - 0x00ABCF 02:8BBF: 4C DA 8B
CODE_058BC2:
	JSR CODE_058C03				;C - - - - - 0x00ABD2 02:8BC2: 20 03 8C
	LDA #$02					;C - - - - - 0x00ABD5 02:8BC5: A9 02
	STA scratch0				;C - - - - - 0x00ABD7 02:8BC7: 85 00
	JSR SplashScreenSprSetup				;C - - - - - 0x00ABD9 02:8BC9: 20 62 82
	JSR AnimateNonBubbles				;C - - - - - 0x00ABDC 02:8BCC: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x00ABDF 02:8BCF: 20 E2 EE

	LDA #.LOBYTE(CODE_058C2E)	;C - - - - - 0x00ABE2 02:8BD2: A9 2E
	STA nmiBankedSub			;C - - - - - 0x00ABE4 02:8BD4: 85 16
	LDA #.HIBYTE(CODE_058C2E)	;C - - - - - 0x00ABE6 02:8BD6: A9 8C
	STA nmiBankedSub+1			;C - - - - - 0x00ABE8 02:8BD8: 85 17
CODE_058BDA:
	RTS							;C - - - - - 0x00ABEA 02:8BDA: 60

LoadSplashMap:
	;0 Continue
	;1 Game over
	;2 Taito

	LDY scratch0				;C - - - - - 0x00ABEB 02:8BDB: A4 00

	LDA splashTargetL,Y			;C - - - - - 0x00ABED 02:8BDD: B9 F7 8B
	STA mapTargetAdr			;C - - - - - 0x00ABF0 02:8BE0: 85 49

	LDA splashTargetH,Y			;C - - - - - 0x00ABF2 02:8BE2: B9 FA 8B
	STA mapTargetAdr+1			;C - - - - - 0x00ABF5 02:8BE5: 85 4A

	LDA splashMaps,Y			;C - - - - - 0x00ABF7 02:8BE7: B9 00 8C
	STA mapID					;C - - - - - 0x00ABFA 02:8BEA: 8D 60 03

	LDA splashBaseTiles,Y		;C - - - - - 0x00ABFD 02:8BED: B9 FD 8B
	STA mapBaseTile				;C - - - - - 0x00AC00 02:8BF0: 8D 63 03

	JSR LoadMap					;C - - - - - 0x00AC03 02:8BF3: 20 23 E5
	RTS							;C - - - - - 0x00AC06 02:8BF6: 60

splashTargetL:
	.byte $00					;- D 0 - - - 0x00AC07 02:8BF7: 00
	.byte $C0					;- D 0 - - - 0x00AC08 02:8BF8: C0
	.byte $00					;- D 0 - - - 0x00AC09 02:8BF9: 00
splashTargetH:
	.byte $20					;- D 0 - - - 0x00AC0A 02:8BFA: 20
	.byte $21					;- D 0 - - - 0x00AC0B 02:8BFB: 21
	.byte $20					;- D 0 - - - 0x00AC0C 02:8BFC: 20
splashBaseTiles:
	.byte $00					;- D 0 - - - 0x00AC0D 02:8BFD: 00
	.byte $00					;- D 0 - - - 0x00AC0E 02:8BFE: 00
	.byte $00					;- D 0 - - - 0x00AC0F 02:8BFF: 00
splashMaps:
	.byte mapContinue_ID					;- D 0 - - - 0x00AC10 02:8C00: 59
	.byte mapGameOver_ID					;- D 0 - - - 0x00AC11 02:8C01: 68
	.byte mapTaito_ID					;- D 0 - - - 0x00AC12 02:8C02: 01

CODE_058C03:
	LDA #$0F					;C - - - - - 0x00AC13 02:8C03: A9 0F
	STA mapTargetAdr				;C - - - - - 0x00AC15 02:8C05: 85 49
	LDA #$22					;C - - - - - 0x00AC17 02:8C07: A9 22
	STA mapTargetAdr+1				;C - - - - - 0x00AC19 02:8C09: 85 4A
	LDA #$00					;C - - - - - 0x00AC1B 02:8C0B: A9 00
	STA ram_03AE				;C - - - - - 0x00AC1D 02:8C0D: 8D AE 03
	LDA #$7F					;C - - - - - 0x00AC20 02:8C10: A9 7F
	STA mapBuffer				;C - - - - - 0x00AC22 02:8C12: 8D 68 03
	LDA continues				;C - - - - - 0x00AC25 02:8C15: A5 DC
	CLC							;C - - - - - 0x00AC27 02:8C17: 18
	ADC #$10					;C - - - - - 0x00AC28 02:8C18: 69 10
	STA mapBuffer+32				;C - - - - - 0x00AC2A 02:8C1A: 8D 88 03
	LDA #$00					;C - - - - - 0x00AC2D 02:8C1D: A9 00
	STA mapBuffer+1				;C - - - - - 0x00AC2F 02:8C1F: 8D 69 03
	STA mapBuffer+32+1				;C - - - - - 0x00AC32 02:8C22: 8D 89 03

	LDA #.LOBYTE(CODE_0FE93B)	;C - - - - - 0x00AC35 02:8C25: A9 3B
	STA nmiUnbankedSub				;C - - - - - 0x00AC37 02:8C27: 85 35
	LDA #.HIBYTE(CODE_0FE93B)	;C - - - - - 0x00AC39 02:8C29: A9 E9
	STA nmiUnbankedSub+1				;C - - - - - 0x00AC3B 02:8C2B: 85 36
	RTS							;C - - - - - 0x00AC3D 02:8C2D: 60

CODE_058C2E:
	LDY #$00					;C - - - - - 0x00AC3E 02:8C2E: A0 00
CODE_058C30:
	LDA palGameOver,Y			;C - - - - - 0x00AC40 02:8C30: B9 87 8C
	STA unfadedColorBuffer,Y				;C - - - - - 0x00AC43 02:8C33: 99 40 03
	INY							;C - - - - - 0x00AC46 02:8C36: C8
	CPY #$13					;C - - - - - 0x00AC47 02:8C37: C0 13
	BNE CODE_058C30				;C - - - - - 0x00AC49 02:8C39: D0 F5

	LDY currentPlayer				;C - - - - - 0x00AC4B 02:8C3B: AC 99 04
	LDA GameOverPlayerColors,Y			;C - - - - - 0x00AC4E 02:8C3E: B9 9B 8C
	STA unfadedColorBuffer+16+3				;C - - - - - 0x00AC51 02:8C41: 8D 53 03

	LDA #FADE_IN					;C - - - - - 0x00AC54 02:8C44: A9 01
	STA fadeMode				;C - - - - - 0x00AC56 02:8C46: 8D 53 05
	LDA #$40					;C - - - - - 0x00AC59 02:8C49: A9 40
	STA fadeUnk0556				;C - - - - - 0x00AC5B 02:8C4B: 8D 56 05
	LDA #$03					;C - - - - - 0x00AC5E 02:8C4E: A9 03
	STA fadeSpeedMask				;C - - - - - 0x00AC60 02:8C50: 8D 57 05
	LDA #.LOBYTE(unfadedColorBuffer)					;C - - - - - 0x00AC63 02:8C53: A9 40
	STA fadeMaxColorsAdr				;C - - - - - 0x00AC65 02:8C55: 8D 58 05
	LDA #.HIBYTE(unfadedColorBuffer)					;C - - - - - 0x00AC68 02:8C58: A9 03
	STA fadeMaxColorsAdr+1				;C - - - - - 0x00AC6A 02:8C5A: 8D 59 05
	LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x00AC6D 02:8C5D: A9 00
	STA fadeColorsAdr				;C - - - - - 0x00AC6F 02:8C5F: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00AC72 02:8C62: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x00AC74 02:8C64: 8D 5B 05
	LDA #4					;C - - - - - 0x00AC77 02:8C67: A9 04
	STA fadePasses				;C - - - - - 0x00AC79 02:8C69: 8D 54 05
	LDA #20					;C - - - - - 0x00AC7C 02:8C6C: A9 14
	STA fadeColorsAmount				;C - - - - - 0x00AC7E 02:8C6E: 8D 55 05

	LDA #.LOBYTE(CODE_058C9D)	;C - - - - - 0x00AC81 02:8C71: A9 9D
	STA updateSub				;C - - - - - 0x00AC83 02:8C73: 85 19
	LDA #.HIBYTE(CODE_058C9D)	;C - - - - - 0x00AC85 02:8C75: A9 8C
	STA updateSub+1				;C - - - - - 0x00AC87 02:8C77: 85 1A

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00AC89 02:8C79: A9 50
	STA nmiBankedSub			;C - - - - - 0x00AC8B 02:8C7B: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00AC8D 02:8C7D: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x00AC8F 02:8C7F: 85 17

	LDA #trGameOver_ID					;C - - - - - 0x00AC91 02:8C81: A9 0F
	STA a:musicTrigger			;C - - - - - 0x00AC93 02:8C83: 8D E0 00
	RTS							;C - - - - - 0x00AC96 02:8C86: 60

palGameOver:
	.byte $0F					;- D 0 - - - 0x00AC97 02:8C87: 0F
	.byte $30					;- D 0 - - - 0x00AC98 02:8C88: 30
	.byte $11					;- D 0 - - - 0x00AC99 02:8C89: 11
	.byte $27					;- D 0 - - - 0x00AC9A 02:8C8A: 27
	.byte $0F					;- D 0 - - - 0x00AC9B 02:8C8B: 0F
	.byte $0F					;- D 0 - - - 0x00AC9C 02:8C8C: 0F
	.byte $0F					;- D 0 - - - 0x00AC9D 02:8C8D: 0F
	.byte $0F					;- D 0 - - - 0x00AC9E 02:8C8E: 0F
	.byte $0F					;- D 0 - - - 0x00AC9F 02:8C8F: 0F
	.byte $0F					;- D 0 - - - 0x00ACA0 02:8C90: 0F
	.byte $0F					;- D 0 - - - 0x00ACA1 02:8C91: 0F
	.byte $0F					;- D 0 - - - 0x00ACA2 02:8C92: 0F
	.byte $0F					;- D 0 - - - 0x00ACA3 02:8C93: 0F
	.byte $30					;- D 0 - - - 0x00ACA4 02:8C94: 30
	.byte $38					;- D 0 - - - 0x00ACA5 02:8C95: 38
	.byte $27					;- D 0 - - - 0x00ACA6 02:8C96: 27
	.byte $0F					;- D 0 - - - 0x00ACA7 02:8C97: 0F
	.byte $0F					;- D 0 - - - 0x00ACA8 02:8C98: 0F
	.byte $30					;- D 0 - - - 0x00ACA9 02:8C99: 30
	.byte $2A					;- - - - - - 0x00ACAA 02:8C9A: 2A

GameOverPlayerColors:
	.byte $2A					;- D 0 - - - 0x00ACAB 02:8C9B: 2A
	.byte $21					;- D 0 - - - 0x00ACAC 02:8C9C: 21

CODE_058C9D:
	LDA continues				;C - - - - - 0x00ACAD 02:8C9D: A5 DC
	BNE CODE_058CAA				;C - - - - - 0x00ACAF 02:8C9F: D0 09
		LDA pressedP1				;C - - - - - 0x00ACB1 02:8CA1: A5 0E
		AND #KEY_A|KEY_B|KEY_START|KEY_SELECT	;C - - - - - 0x00ACB3 02:8CA3: 29 0F
		BNE CODE_058CC3				;C - - - - - 0x00ACB5 02:8CA5: D0 1C
			JMP CODE_058D84				;C - - - - - 0x00ACB7 02:8CA7: 4C 84 8D
CODE_058CAA:
	LDA globalTimer				;C - - - - - 0x00ACBA 02:8CAA: A5 14
	AND #$01					;C - - - - - 0x00ACBC 02:8CAC: 29 01
	BNE CODE_058CB3				;C - - - - - 0x00ACBE 02:8CAE: D0 03
		JSR AnimateNonBubbles				;C - - - - - 0x00ACC0 02:8CB0: 20 5C EE
CODE_058CB3:
	JSR DrawObjects				;C - - - - - 0x00ACC3 02:8CB3: 20 E2 EE
	LDA pressedP1				;C - - - - - 0x00ACC6 02:8CB6: A5 0E
	AND #KEY_START				;C - - - - - 0x00ACC8 02:8CB8: 29 08
	BNE CODE_058CBF				;C - - - - - 0x00ACCA 02:8CBA: D0 03
		JMP CODE_058D84				;C - - - - - 0x00ACCC 02:8CBC: 4C 84 8D
CODE_058CBF:
	CMP #KEY_START				;C - - - - - 0x00ACCF 02:8CBF: C9 08
	BEQ CODE_058D1A				;C - - - - - 0x00ACD1 02:8CC1: F0 57
CODE_058CC3:
		LDA multiplayer				;C - - - - - 0x00ACD3 02:8CC3: A5 74
		CMP #$01					;C - - - - - 0x00ACD5 02:8CC5: C9 01
		BNE CODE_058CDB				;C - - - - - 0x00ACD7 02:8CC7: D0 12
			LDA #trSilence_ID					;C - - - - - 0x00ACD9 02:8CC9: A9 00
			STA a:musicTrigger				;C - - - - - 0x00ACDB 02:8CCB: 8D E0 00

			JSR ResetLivesAndScore				;C - - - - - 0x00ACDE 02:8CCE: 20 8B 88
			JSR CODE_05962D				;C - - - - - 0x00ACE1 02:8CD1: 20 2D 96
			LDA #$02					;C - - - - - 0x00ACE4 02:8CD4: A9 02
			STA multiplayer				;C - - - - - 0x00ACE6 02:8CD6: 85 74
			JMP CODE_058D84				;C - - - - - 0x00ACE8 02:8CD8: 4C 84 8D
CODE_058CDB:
		LDA #trSilence_ID					;C - - - - - 0x00ACEB 02:8CDB: A9 00
		STA a:musicTrigger				;C - - - - - 0x00ACED 02:8CDD: 8D E0 00

		LDA #.BANK(StartTaitoLogo)					;C - - - - - 0x00ACF0 02:8CE0: A9 05
		STA nmiPrgBankA				;C - - - - - 0x00ACF2 02:8CE2: 85 51

		LDA #FADE_OUT					;C - - - - - 0x00ACF4 02:8CE4: A9 00
		STA fadeMode				;C - - - - - 0x00ACF6 02:8CE6: 8D 53 05
		LDA #$40					;C - - - - - 0x00ACF9 02:8CE9: A9 40
		STA fadeUnk0556				;C - - - - - 0x00ACFB 02:8CEB: 8D 56 05
		LDA #$03					;C - - - - - 0x00ACFE 02:8CEE: A9 03
		STA fadeSpeedMask				;C - - - - - 0x00AD00 02:8CF0: 8D 57 05
		LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x00AD03 02:8CF3: A9 00
		STA fadeColorsAdr				;C - - - - - 0x00AD05 02:8CF5: 8D 5A 05
		LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00AD08 02:8CF8: A9 03
		STA fadeColorsAdr+1				;C - - - - - 0x00AD0A 02:8CFA: 8D 5B 05
		LDA #4					;C - - - - - 0x00AD0D 02:8CFD: A9 04
		STA fadePasses				;C - - - - - 0x00AD0F 02:8CFF: 8D 54 05
		LDA #32					;C - - - - - 0x00AD12 02:8D02: A9 20
		STA fadeColorsAmount				;C - - - - - 0x00AD14 02:8D04: 8D 55 05

		LDA #.LOBYTE(StartTaitoLogo)	;C - - - - - 0x00AD17 02:8D07: A9 00
		STA updateSub				;C - - - - - 0x00AD19 02:8D09: 85 19
		LDA #.HIBYTE(StartTaitoLogo)	;C - - - - - 0x00AD1B 02:8D0B: A9 80
		STA updateSub+1				;C - - - - - 0x00AD1D 02:8D0D: 85 1A

		LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00AD1F 02:8D0F: A9 50
		STA nmiBankedSub			;C - - - - - 0x00AD21 02:8D11: 85 16
		LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00AD23 02:8D13: A9 E8
		STA nmiBankedSub+1			;C - - - - - 0x00AD25 02:8D15: 85 17
		JMP CODE_058D84				;C - - - - - 0x00AD27 02:8D17: 4C 84 8D
CODE_058D1A:
	LDA #$03					;C - - - - - 0x00AD2A 02:8D1A: A9 03
	STA scratch0				;C - - - - - 0x00AD2C 02:8D1C: 85 00
	JSR SplashScreenSprSetup				;C - - - - - 0x00AD2E 02:8D1E: 20 62 82
	LDA #$00					;C - - - - - 0x00AD31 02:8D21: A9 00
	STA playerInvFrames				;C - - - - - 0x00AD33 02:8D23: 8D 77 04
	LDA vNametable				;C - - - - - 0x00AD36 02:8D26: A5 2D
	TAX							;C - - - - - 0x00AD38 02:8D28: AA
	LDA #$CB					;C - - - - - 0x00AD39 02:8D29: A9 CB
	STA mapTargetAdr				;C - - - - - 0x00AD3B 02:8D2B: 85 49
	LDA #$22					;C - - - - - 0x00AD3D 02:8D2D: A9 22
	STA mapTargetAdr+1				;C - - - - - 0x00AD3F 02:8D2F: 85 4A
	LDA #$EA					;C - - - - - 0x00AD41 02:8D31: A9 EA
	STA ram_03AA				;C - - - - - 0x00AD43 02:8D33: 8D AA 03
	LDA #$23					;C - - - - - 0x00AD46 02:8D36: A9 23
	STA ram_03AB				;C - - - - - 0x00AD48 02:8D38: 8D AB 03
	LDA #$02					;C - - - - - 0x00AD4B 02:8D3B: A9 02
	STA scratch4				;C - - - - - 0x00AD4D 02:8D3D: 85 04
	LDA #$80					;C - - - - - 0x00AD4F 02:8D3F: A9 80
	STA scratch5				;C - - - - - 0x00AD51 02:8D41: 85 05
	LDA DATA_058D85,X			;C - - - - - 0x00AD53 02:8D43: BD 85 8D
	STA ram_03AF				;C - - - - - 0x00AD56 02:8D46: 8D AF 03
	TAY							;C - - - - - 0x00AD59 02:8D49: A8
	LDA #$FF					;C - - - - - 0x00AD5A 02:8D4A: A9 FF
	STA ram_03B1,Y				;C - - - - - 0x00AD5C 02:8D4C: 99 B1 03
	INY							;C - - - - - 0x00AD5F 02:8D4F: C8
	STA ram_03B1,Y				;C - - - - - 0x00AD60 02:8D50: 99 B1 03
	INY							;C - - - - - 0x00AD63 02:8D53: C8
	STA ram_03B1,Y				;C - - - - - 0x00AD64 02:8D54: 99 B1 03
	INY							;C - - - - - 0x00AD67 02:8D57: C8
	LDA #$03					;C - - - - - 0x00AD68 02:8D58: A9 03
	CLC							;C - - - - - 0x00AD6A 02:8D5A: 18
	ADC ram_03AF				;C - - - - - 0x00AD6B 02:8D5B: 6D AF 03
	STA ram_03AE				;C - - - - - 0x00AD6E 02:8D5E: 8D AE 03

	LDA #.LOBYTE(CODE_099CB7)					;C - - - - - 0x00AD71 02:8D61: A9 B7
	STA bankedSub				;C - - - - - 0x00AD73 02:8D63: 85 55
	LDA #.HIBYTE(CODE_099CB7)					;C - - - - - 0x00AD75 02:8D65: A9 9C
	STA bankedSub+1				;C - - - - - 0x00AD77 02:8D67: 85 56
	LDA #.BANK(CODE_099CB7)					;C - - - - - 0x00AD79 02:8D69: A9 09
	STA bankedSubBank				;C - - - - - 0x00AD7B 02:8D6B: 85 57
	LDA #.BANK(*)					;C - - - - - 0x00AD7D 02:8D6D: A9 05
	STA bankedSubRetBank				;C - - - - - 0x00AD7F 02:8D6F: 85 58
	JSR RunBankedSub				;C - - - - - 0x00AD81 02:8D71: 20 72 E7

	LDA #.LOBYTE(CODE_0FE93B)	;C - - - - - 0x00AD84 02:8D74: A9 3B
	STA nmiUnbankedSub				;C - - - - - 0x00AD86 02:8D76: 85 35
	LDA #.HIBYTE(CODE_0FE93B)	;C - - - - - 0x00AD88 02:8D78: A9 E9
	STA nmiUnbankedSub+1				;C - - - - - 0x00AD8A 02:8D7A: 85 36

	LDA #.LOBYTE(CODE_058D87)	;C - - - - - 0x00AD8C 02:8D7C: A9 87
	STA nmiBankedSub			;C - - - - - 0x00AD8E 02:8D7E: 85 16
	LDA #.HIBYTE(CODE_058D87)	;C - - - - - 0x00AD90 02:8D80: A9 8D
	STA nmiBankedSub+1			;C - - - - - 0x00AD92 02:8D82: 85 17
CODE_058D84:
	RTS							;C - - - - - 0x00AD94 02:8D84: 60

DATA_058D85:
	.byte $2A					;- D 0 - - - 0x00AD95 02:8D85: 2A
	.byte $AA					;- - - - - - 0x00AD96 02:8D86: AA

CODE_058D87:
	LDA continues				;C - - - - - 0x00AD97 02:8D87: A5 DC
	BEQ CODE_058D8D				;C - - - - - 0x00AD99 02:8D89: F0 02
		DEC continues				;C - - - - - 0x00AD9B 02:8D8B: C6 DC
CODE_058D8D:
	JSR CODE_058C03				;C - - - - - 0x00AD9D 02:8D8D: 20 03 8C

	LDA #.LOBYTE(CODE_058D99)	;C - - - - - 0x00ADA0 02:8D90: A9 99
	STA nmiBankedSub			;C - - - - - 0x00ADA2 02:8D92: 85 16
	LDA #.HIBYTE(CODE_058D99)	;C - - - - - 0x00ADA4 02:8D94: A9 8D
	STA nmiBankedSub+1			;C - - - - - 0x00ADA6 02:8D96: 85 17
	RTS							;C - - - - - 0x00ADA8 02:8D98: 60

CODE_058D99:
	JSR AnimateNonBubbles				;C - - - - - 0x00ADA9 02:8D99: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x00ADAC 02:8D9C: 20 E2 EE
	LDA globalTimer				;C - - - - - 0x00ADAF 02:8D9F: A5 14
	AND #$3F					;C - - - - - 0x00ADB1 02:8DA1: 29 3F
	BEQ CODE_058DA8				;C - - - - - 0x00ADB3 02:8DA3: F0 03
		INC playerInvFrames				;C - - - - - 0x00ADB5 02:8DA5: EE 77 04
CODE_058DA8:
	LDA playerInvFrames				;C - - - - - 0x00ADB8 02:8DA8: AD 77 04
	CMP #$3C					;C - - - - - 0x00ADBB 02:8DAB: C9 3C
	BEQ CODE_058DB2				;C - - - - - 0x00ADBD 02:8DAD: F0 03
		JMP CODE_058DBD				;C - - - - - 0x00ADBF 02:8DAF: 4C BD 8D
CODE_058DB2:
	LDA #trSilence_ID					;C - - - - - 0x00ADC2 02:8DB2: A9 00
	STA a:musicTrigger				;C - - - - - 0x00ADC4 02:8DB4: 8D E0 00

	JSR ResetLivesAndScore				;C - - - - - 0x00ADC7 02:8DB7: 20 8B 88
	JSR CODE_05962D				;C - - - - - 0x00ADCA 02:8DBA: 20 2D 96
CODE_058DBD:
	RTS							;C - - - - - 0x00ADCD 02:8DBD: 60

CODE_058DBE:
	LDA multiplayer				;C - - - - - 0x00ADCE 02:8DBE: A5 74
	CMP #$01					;C - - - - - 0x00ADD0 02:8DC0: C9 01
	BNE CODE_058E2B				;C - - - - - 0x00ADD2 02:8DC2: D0 67
		LDA playerInvFrames				;C - - - - - 0x00ADD4 02:8DC4: AD 77 04
		BNE CODE_058E1A				;C - - - - - 0x00ADD7 02:8DC7: D0 51
			LDA sprPrgBank				;C - - - - - 0x00ADD9 02:8DC9: AD 61 05
			STA announceOrigSprBank				;C - - - - - 0x00ADDC 02:8DCC: 8D 62 05
			LDA #ANNOUNCE_PLAYER					;C - - - - - 0x00ADDF 02:8DCF: A9 03
			STA scratch0				;C - - - - - 0x00ADE1 02:8DD1: 85 00
			STA ram_0475				;C - - - - - 0x00ADE3 02:8DD3: 8D 75 04
			LDA #$01					;C - - - - - 0x00ADE6 02:8DD6: A9 01
			STA scratch4				;C - - - - - 0x00ADE8 02:8DD8: 85 04

			LDA #.LOBYTE(SpawnAnnounceObj)					;C - - - - - 0x00ADEA 02:8DDA: A9 76
			STA bankedSub				;C - - - - - 0x00ADEC 02:8DDC: 85 55
			LDA #.HIBYTE(SpawnAnnounceObj)					;C - - - - - 0x00ADEE 02:8DDE: A9 9C
			STA bankedSub+1				;C - - - - - 0x00ADF0 02:8DE0: 85 56
			LDA #.BANK(SpawnAnnounceObj)					;C - - - - - 0x00ADF2 02:8DE2: A9 08
			STA bankedSubBank				;C - - - - - 0x00ADF4 02:8DE4: 85 57
			LDA #.BANK(*)					;C - - - - - 0x00ADF6 02:8DE6: A9 05
			STA bankedSubRetBank				;C - - - - - 0x00ADF8 02:8DE8: 85 58
			JSR RunBankedSub				;C - - - - - 0x00ADFA 02:8DEA: 20 72 E7

			LDA #$98					;C - - - - - 0x00ADFD 02:8DED: A9 98
			STA scratch0				;C - - - - - 0x00ADFF 02:8DEF: 85 00
			LDA #$78					;C - - - - - 0x00AE01 02:8DF1: A9 78
			STA scratch1				;C - - - - - 0x00AE03 02:8DF3: 85 01
			INC scratch4				;C - - - - - 0x00AE05 02:8DF5: E6 04
			LDA currentPlayer				;C - - - - - 0x00AE07 02:8DF7: AD 99 04
			CLC							;C - - - - - 0x00AE0A 02:8DFA: 18
			ADC #$01					;C - - - - - 0x00AE0B 02:8DFB: 69 01
			STA scratch2				;C - - - - - 0x00AE0D 02:8DFD: 85 02

			LDA #.LOBYTE(CODE_0885FE)					;C - - - - - 0x00AE0F 02:8DFF: A9 FE
			STA bankedSub				;C - - - - - 0x00AE11 02:8E01: 85 55
			LDA #.HIBYTE(CODE_0885FE)					;C - - - - - 0x00AE13 02:8E03: A9 85
			STA bankedSub+1				;C - - - - - 0x00AE15 02:8E05: 85 56
			LDA #.BANK(CODE_0885FE)					;C - - - - - 0x00AE17 02:8E07: A9 08
			STA bankedSubBank				;C - - - - - 0x00AE19 02:8E09: 85 57
			LDA #.BANK(*)					;C - - - - - 0x00AE1B 02:8E0B: A9 05
			STA bankedSubRetBank				;C - - - - - 0x00AE1D 02:8E0D: 85 58
			JSR RunBankedSub				;C - - - - - 0x00AE1F 02:8E0F: 20 72 E7
			LDA #$28					;C - - - - - 0x00AE22 02:8E12: A9 28
			STA playerInvFrames				;C - - - - - 0x00AE24 02:8E14: 8D 77 04
			JMP CODE_058E20				;C - - - - - 0x00AE27 02:8E17: 4C 20 8E
	CODE_058E1A:
		LDA globalTimer				;C - - - - - 0x00AE2A 02:8E1A: A5 14
		AND #$01					;C - - - - - 0x00AE2C 02:8E1C: 29 01
		BNE CODE_058E23				;C - - - - - 0x00AE2E 02:8E1E: D0 03
	CODE_058E20:
			JSR AnimateNonBubbles				;C - - - - - 0x00AE30 02:8E20: 20 5C EE
	CODE_058E23:
		JSR DrawObjects				;C - - - - - 0x00AE33 02:8E23: 20 E2 EE
		DEC playerInvFrames				;C - - - - - 0x00AE36 02:8E26: CE 77 04
		BNE CODE_058E69				;C - - - - - 0x00AE39 02:8E29: D0 3E
CODE_058E2B:
	LDA #01					;C - - - - - 0x00AE3B 02:8E2B: A9 01
	STA scratch0				;C - - - - - 0x00AE3D 02:8E2D: 85 00
	JSR SplashScreenSprSetup				;C - - - - - 0x00AE3F 02:8E2F: 20 62 82
	LDA #.BANK(CODE_088000)					;C - - - - - 0x00AE42 02:8E32: A9 08
	STA nmiPrgBankA				;C - - - - - 0x00AE44 02:8E34: 85 51

	LDA #FADE_OUT					;C - - - - - 0x00AE46 02:8E36: A9 00
	STA fadeMode				;C - - - - - 0x00AE48 02:8E38: 8D 53 05
	LDA #$40					;C - - - - - 0x00AE4B 02:8E3B: A9 40
	STA fadeUnk0556				;C - - - - - 0x00AE4D 02:8E3D: 8D 56 05
	LDA #$03					;C - - - - - 0x00AE50 02:8E40: A9 03
	STA fadeSpeedMask				;C - - - - - 0x00AE52 02:8E42: 8D 57 05
	LDA #.LOBYTE(colorBuffer)+(4*4)					;C - - - - - 0x00AE55 02:8E45: A9 10
	STA fadeColorsAdr				;C - - - - - 0x00AE57 02:8E47: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00AE5A 02:8E4A: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x00AE5C 02:8E4C: 8D 5B 05
	LDA #4					;C - - - - - 0x00AE5F 02:8E4F: A9 04
	STA fadePasses				;C - - - - - 0x00AE61 02:8E51: 8D 54 05
	LDA #16					;C - - - - - 0x00AE64 02:8E54: A9 10
	STA fadeColorsAmount				;C - - - - - 0x00AE66 02:8E56: 8D 55 05

	LDA #.LOBYTE(CODE_088000)	;C - - - - - 0x00AE69 02:8E59: A9 00
	STA updateSub				;C - - - - - 0x00AE6B 02:8E5B: 85 19
	LDA #.HIBYTE(CODE_088000)	;C - - - - - 0x00AE6D 02:8E5D: A9 80
	STA updateSub+1				;C - - - - - 0x00AE6F 02:8E5F: 85 1A

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00AE71 02:8E61: A9 50
	STA nmiBankedSub			;C - - - - - 0x00AE73 02:8E63: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00AE75 02:8E65: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x00AE77 02:8E67: 85 17
CODE_058E69:
	RTS							;C - - - - - 0x00AE79 02:8E69: 60

CODE_058E6A:
	LDA multiplayer				;C - - - - - 0x00AE7A 02:8E6A: A5 74
	CMP #$01					;C - - - - - 0x00AE7C 02:8E6C: C9 01
	BEQ CODE_058E73				;C - - - - - 0x00AE7E 02:8E6E: F0 03
		JMP CODE_058CDB				;C - - - - - 0x00AE80 02:8E70: 4C DB 8C
CODE_058E73:
	LDA #trSilence_ID					;C - - - - - 0x00AE83 02:8E73: A9 00
	STA a:musicTrigger			;C - - - - - 0x00AE85 02:8E75: 8D E0 00

	JSR ResetLivesAndScore				;C - - - - - 0x00AE88 02:8E78: 20 8B 88
	JSR CODE_05962D				;C - - - - - 0x00AE8B 02:8E7B: 20 2D 96
	LDA #$02					;C - - - - - 0x00AE8E 02:8E7E: A9 02
	STA multiplayer				;C - - - - - 0x00AE90 02:8E80: 85 74
	RTS							;C - - - - - 0x00AE92 02:8E82: 60

CODE_058E83:
	LDA roundFlags				;C - - - - - 0x00AE93 02:8E83: AD 71 04
	AND #$18					;C - - - - - 0x00AE96 02:8E86: 29 18
	BEQ CODE_058E8E				;C - - - - - 0x00AE98 02:8E88: F0 04
		LDA #$00					;C - - - - - 0x00AE9A 02:8E8A: A9 00
		STA playerDmgType				;C - - - - - 0x00AE9C 02:8E8C: 85 7C
CODE_058E8E:
	LDY currentPlayer				;C - - - - - 0x00AE9E 02:8E8E: AC 99 04
	LDX PlayerInputIndex,Y			;C - - - - - 0x00AEA1 02:8E91: BE DA 8E

	LDA heldP1,X				;C - - - - - 0x00AEA4 02:8E94: B5 0A
	STA playerHeld				;C - - - - - 0x00AEA6 02:8E96: 85 72
	LDA pressedP1,X				;C - - - - - 0x00AEA8 02:8E98: B5 0E
	STA playerPressed				;C - - - - - 0x00AEAA 02:8E9A: 85 73

	LDA #$00					;C - - - - - 0x00AEAC 02:8E9C: A9 00
	STA ram_00D4				;C - - - - - 0x00AEAE 02:8E9E: 85 D4
	STA ram_00D5				;C - - - - - 0x00AEB0 02:8EA0: 85 D5

	LDA playerState				;C - - - - - 0x00AEB2 02:8EA2: A5 75
	CMP #PLAYER_STATE_FLOATING	;C - - - - - 0x00AEB4 02:8EA4: C9 02
	BEQ CODE_058EBF				;C - - - - - 0x00AEB6 02:8EA6: F0 17
		LDA objY				;C - - - - - 0x00AEB8 02:8EA8: AD 8B 05
		PHA							;C - - - - - 0x00AEBB 02:8EAB: 48
		LDA currentRound				;C - - - - - 0x00AEBC 02:8EAC: A5 D8
		CMP #40						;C - - - - - 0x00AEBE 02:8EAE: C9 28
		BNE CODE_058EB8				;C - - - - - 0x00AEC0 02:8EB0: D0 06
			INC objY				;C - - - - - 0x00AEC2 02:8EB2: EE 8B 05
			INC objY				;C - - - - - 0x00AEC5 02:8EB5: EE 8B 05
	CODE_058EB8:
		JSR CODE_059AFA				;C - - - - - 0x00AEC8 02:8EB8: 20 FA 9A
		PLA							;C - - - - - 0x00AECB 02:8EBB: 68
		STA objY				;C - - - - - 0x00AECC 02:8EBC: 8D 8B 05
CODE_058EBF:
	LDA playerState				;C - - - - - 0x00AECF 02:8EBF: A5 75
	ASL							;C - - - - - 0x00AED1 02:8EC1: 0A
	TAX							;C - - - - - 0x00AED2 02:8EC2: AA
	LDA PlayerStateHandlers,X			;C - - - - - 0x00AED3 02:8EC3: BD DC 8E
	STA scratch6				;C - - - - - 0x00AED6 02:8EC6: 85 06
	LDA PlayerStateHandlers+1,X			;C - - - - - 0x00AED8 02:8EC8: BD DD 8E
	STA scratch7				;C - - - - - 0x00AEDB 02:8ECB: 85 07
	LDA #.HIBYTE(@ret)			;C - - - - - 0x00AEDD 02:8ECD: A9 8E
	PHA							;C - - - - - 0x00AEDF 02:8ECF: 48
	LDA #.LOBYTE(@ret-1)		;C - - - - - 0x00AEE0 02:8ED0: A9 D5
	PHA							;C - - - - - 0x00AEE2 02:8ED2: 48
	JMP (scratch6)				;C - - - - - 0x00AEE3 02:8ED3: 6C 06 00
@ret:
	JSR CODE_0594EB				;C - - - - - 0x00AEE6 02:8ED6: 20 EB 94
	RTS							;C - - - - - 0x00AEE9 02:8ED9: 60

PlayerInputIndex:
	.byte $00					;- D 0 - - - 0x00AEEA 02:8EDA: 00
	.byte heldP2-heldP1			;- D 0 - - - 0x00AEEB 02:8EDB: 05

PlayerStateHandlers:
	.word PlayerHandlerNormal			;- D 0 - - - 0x00AEEC 02:8EDC: 14
	.word PlayerHandlerInflating			;- D 0 - - - 0x00AEEE 02:8EDE: F2
	.word PlayerHandlerFloating			;- D 0 - - - 0x00AEF0 02:8EE0: BE
	.word PlayerHandlerDead			;- D 0 - - - 0x00AEF2 02:8EE2: 64
	.word PlayerHandlerHang			;- - - - - - 0x00AEF4 02:8EE4: F8
	.word CODE_0597B8			;- D 0 - - - 0x00AEF6 02:8EE6: B8
	.word PlayerHandlerHang			;- - - - - - 0x00AEF8 02:8EE8: F8
	.word PlayerHandlerHang			;- - - - - - 0x00AEFA 02:8EEA: F8
	.word PlayerHandlerNeedler			;- D 0 - - - 0x00AEFC 02:8EEC: C1
	.word PlayerHandlerHurt			;- D 0 - - - 0x00AEFE 02:8EEE: 26
	.word PlayerHandlerStuck			;- D 0 - - - 0x00AF00 02:8EF0: 55
	.word CODE_05999F			;- D 0 - - - 0x00AF02 02:8EF2: 9F
	.word PlayerHandlerStuck			;- D 0 - - - 0x00AF04 02:8EF4: 55 Fire/water
	.word CODE_059A20			;- D 0 - - - 0x00AF06 02:8EF6: 20

PlayerHandlerHang:
	;Unreached
	JMP PlayerHandlerHang				;- - - - - - 0x00AF08 02:8EF8: 4C

CODE_058EFB:
	LDA shooting				;C - - - - - 0x00AF0B 02:8EFB: AD 17 05
	BEQ CODE_058F06				;C - - - - - 0x00AF0E 02:8EFE: F0 06
		JSR CODE_0594D9				;C - - - - - 0x00AF10 02:8F00: 20 D9 94
		JMP CODE_058F13				;C - - - - - 0x00AF13 02:8F03: 4C 13 8F
CODE_058F06:
	LDA playerState				;C - - - - - 0x00AF16 02:8F06: A5 75
	BNE CODE_058F10				;C - - - - - 0x00AF18 02:8F08: D0 06
		JSR CODE_059486				;C - - - - - 0x00AF1A 02:8F0A: 20 86 94
		JMP CODE_058F13				;C - - - - - 0x00AF1D 02:8F0D: 4C 13 8F
CODE_058F10:
	JSR CODE_0594A8				;C - - - - - 0x00AF20 02:8F10: 20 A8 94
CODE_058F13:
	RTS							;C - - - - - 0x00AF23 02:8F13: 60

PlayerHandlerNormal:
	LDA ram_0076				;C - - - - - 0x00AF24 02:8F14: A5 76
	BEQ CODE_058F33				;C - - - - - 0x00AF26 02:8F16: F0 1B
	CMP #$01					;C - - - - - 0x00AF28 02:8F18: C9 01
	BEQ CODE_058F39				;C - - - - - 0x00AF2A 02:8F1A: F0 1D
	CMP #$02					;C - - - - - 0x00AF2C 02:8F1C: C9 02
	BEQ CODE_058F3F				;C - - - - - 0x00AF2E 02:8F1E: F0 1F
	CMP #$03					;C - - - - - 0x00AF30 02:8F20: C9 03
	BEQ CODE_058F45				;C - - - - - 0x00AF32 02:8F22: F0 21
	CMP #$04					;C - - - - - 0x00AF34 02:8F24: C9 04
	BEQ CODE_058F45				;C - - - - - 0x00AF36 02:8F26: F0 1D
	CMP #$05					;C - - - - - 0x00AF38 02:8F28: C9 05
	BEQ CODE_058F4B				;C - - - - - 0x00AF3A 02:8F2A: F0 1F
	;Unreached
	CMP #$06					;- - - - - - 0x00AF3C 02:8F2C: C9
	BEQ CODE_058F51				;- - - - - - 0x00AF3E 02:8F2E: F0
	JMP CODE_058F5E				;- - - - - - 0x00AF40 02:8F30: 4C

CODE_058F33:
	JSR CODE_058F8C				;C - - - - - 0x00AF43 02:8F33: 20 8C 8F
	JMP CODE_058F5E				;C - - - - - 0x00AF46 02:8F36: 4C 5E 8F

CODE_058F39:
	;Unreached
	JSR CODE_058FB5				;- - - - - - 0x00AF49 02:8F39: 20
	JMP CODE_058F5E				;- - - - - - 0x00AF4C 02:8F3C: 4C

CODE_058F3F:
	JSR CODE_058FB6				;C - - - - - 0x00AF4F 02:8F3F: 20 B6 8F
	JMP CODE_058F5E				;C - - - - - 0x00AF52 02:8F42: 4C 5E 8F
CODE_058F45:
	JSR CODE_058FF6				;C - - - - - 0x00AF55 02:8F45: 20 F6 8F
	JMP CODE_058F5E				;C - - - - - 0x00AF58 02:8F48: 4C 5E 8F
CODE_058F4B:
	JSR CODE_059110				;C - - - - - 0x00AF5B 02:8F4B: 20 10 91
	JMP CODE_058F5E				;C - - - - - 0x00AF5E 02:8F4E: 4C 5E 8F
CODE_058F51:
	;Unreached
	LDA globalTimer				;- - - - - - 0x00AF61 02:8F51: A5
	AND #$07					;- - - - - - 0x00AF63 02:8F53: 29
	BNE CODE_058F5E				;- - - - - - 0x00AF65 02:8F55: D0
		LDA #$00					;- - - - - - 0x00AF67 02:8F57: A9
		STA ram_0076				;- - - - - - 0x00AF69 02:8F59: 85
		JMP CODE_058F5E				;- - - - - - 0x00AF6B 02:8F5B: 4C
CODE_058F5E:
	LDA playerHeld				;C - - - - - 0x00AF6E 02:8F5E: A5 72
	AND #KEY_B					;C - - - - - 0x00AF70 02:8F60: 29 02
	BEQ CODE_058F85				;C - - - - - 0x00AF72 02:8F62: F0 21

.ifdef REGION_JP
	LDA shooting					;- - - - - - 0x00B038 02:9028: AD
	BNE @holding					;- - - - - - 0x00B03B 02:902B: D0
.endif

	LDA playerPressed			;C - - - - - 0x00AF74 02:8F64: A5 73
	AND #KEY_B					;C - - - - - 0x00AF76 02:8F66: 29 02
	BEQ @holding				;C - - - - - 0x00AF78 02:8F68: F0 06
		JSR TrySingleBubble				;C - - - - - 0x00AF7A 02:8F6A: 20 59 91
		JMP CODE_058F85				;C - - - - - 0x00AF7D 02:8F6D: 4C 85 8F
@holding:
	INC inflateTime				;C - - - - - 0x00AF80 02:8F70: EE 7C 04
	LDA inflateTime				;C - - - - - 0x00AF83 02:8F73: AD 7C 04
	CMP #30						;C - - - - - 0x00AF86 02:8F76: C9 1E
	BCC CODE_058F85				;C - - - - - 0x00AF88 02:8F78: 90 0B
		LDA #PLAYER_STATE_INFLATING	;C - - - - - 0x00AF8A 02:8F7A: A9 01
		STA playerState				;C - - - - - 0x00AF8C 02:8F7C: 85 75
		STA extraBubbles				;C - - - - - 0x00AF8E 02:8F7E: 8D 7D 04
		LDA #$07					;C - - - - - 0x00AF91 02:8F81: A9 07
		STA ram_0076				;C - - - - - 0x00AF93 02:8F83: 85 76
CODE_058F85:
	JSR CODE_0596DF				;C - - - - - 0x00AF95 02:8F85: 20 DF 96
	JSR CODE_058EFB				;C - - - - - 0x00AF98 02:8F88: 20 FB 8E
	RTS							;C - - - - - 0x00AF9B 02:8F8B: 60

CODE_058F8C:
	LDA playerPressed			;C - - - - - 0x00AF9C 02:8F8C: A5 73
	AND #KEY_A					;C - - - - - 0x00AF9E 02:8F8E: 29 01
	BEQ CODE_058FA5				;C - - - - - 0x00AFA0 02:8F90: F0 13
		LDA #snJump_ID					;C - - - - - 0x00AFA2 02:8F92: A9 05
		STA a:soundTrigger				;C - - - - - 0x00AFA4 02:8F94: 8D E1 00
		LDA #$03					;C - - - - - 0x00AFA7 02:8F97: A9 03
		STA ram_0076				;C - - - - - 0x00AFA9 02:8F99: 85 76
		LDA playerHeld				;C - - - - - 0x00AFAB 02:8F9B: A5 72
		AND #KEY_LEFT|KEY_RIGHT		;C - - - - - 0x00AFAD 02:8F9D: 29 C0
		STA ram_047E				;C - - - - - 0x00AFAF 02:8F9F: 8D 7E 04
			JMP CODE_058FB4				;C - - - - - 0x00AFB2 02:8FA2: 4C B4 8F
CODE_058FA5:
	JSR UpdatePlayerDir				;C - - - - - 0x00AFB5 02:8FA5: 20 A3 9A
	BEQ CODE_058FAE				;C - - - - - 0x00AFB8 02:8FA8: F0 04
		LDA #$02					;C - - - - - 0x00AFBA 02:8FAA: A9 02
		STA ram_0076				;C - - - - - 0x00AFBC 02:8FAC: 85 76
CODE_058FAE:
	JSR CODE_059174				;C - - - - - 0x00AFBE 02:8FAE: 20 74 91
	JSR CODE_0591C2				;C - - - - - 0x00AFC1 02:8FB1: 20 C2 91
CODE_058FB4:
	RTS							;C - - - - - 0x00AFC4 02:8FB4: 60

CODE_058FB5:
	;Unreached
	RTS							;- - - - - - 0x00AFC5 02:8FB5: 60

CODE_058FB6:
	LDA playerPressed			;C - - - - - 0x00AFC6 02:8FB6: A5 73
	AND #KEY_A					;C - - - - - 0x00AFC8 02:8FB8: 29 01
	BEQ CODE_058FCF				;C - - - - - 0x00AFCA 02:8FBA: F0 13
		LDA #snJump_ID					;C - - - - - 0x00AFCC 02:8FBC: A9 05
		STA a:soundTrigger				;C - - - - - 0x00AFCE 02:8FBE: 8D E1 00
		LDA #$03					;C - - - - - 0x00AFD1 02:8FC1: A9 03
		STA ram_0076				;C - - - - - 0x00AFD3 02:8FC3: 85 76
		LDA playerHeld				;C - - - - - 0x00AFD5 02:8FC5: A5 72
		AND #KEY_LEFT|KEY_RIGHT		;C - - - - - 0x00AFD7 02:8FC7: 29 C0
		STA ram_047E				;C - - - - - 0x00AFD9 02:8FC9: 8D 7E 04
		JMP CODE_058FF5				;C - - - - - 0x00AFDC 02:8FCC: 4C F5 8F
CODE_058FCF:
	LDA hBlocked				;C - - - - - 0x00AFDF 02:8FCF: A5 79
	AND #KEY_LEFT|KEY_RIGHT		;C - - - - - 0x00AFE1 02:8FD1: 29 C0
	STA scratch0				;C - - - - - 0x00AFE3 02:8FD3: 85 00
	JSR UpdatePlayerDir				;C - - - - - 0x00AFE5 02:8FD5: 20 A3 9A
	BEQ CODE_058FEE				;C - - - - - 0x00AFE8 02:8FD8: F0 14
		LDA playerHeld				;C - - - - - 0x00AFEA 02:8FDA: A5 72
		AND scratch0				;C - - - - - 0x00AFEC 02:8FDC: 25 00
		BNE CODE_058FF2				;C - - - - - 0x00AFEE 02:8FDE: D0 12
			LDX extraBubbles				;C - - - - - 0x00AFF0 02:8FE0: AE 7D 04
			LDA DATA_0592F0,X			;C - - - - - 0x00AFF3 02:8FE3: BD F0 92
			STA scratch5				;C - - - - - 0x00AFF6 02:8FE6: 85 05
			JSR CODE_059049				;C - - - - - 0x00AFF8 02:8FE8: 20 49 90
			JMP CODE_058FF2				;C - - - - - 0x00AFFB 02:8FEB: 4C F2 8F
CODE_058FEE:
	LDA #$00					;C - - - - - 0x00AFFE 02:8FEE: A9 00
	STA ram_0076				;C - - - - - 0x00B000 02:8FF0: 85 76
CODE_058FF2:
	JSR CODE_059174				;C - - - - - 0x00B002 02:8FF2: 20 74 91
CODE_058FF5:
	RTS							;C - - - - - 0x00B005 02:8FF5: 60

CODE_058FF6:
	LDA ram_047B				;C - - - - - 0x00B006 02:8FF6: AD 7B 04
	CMP #$17					;C - - - - - 0x00B009 02:8FF9: C9 17
	BNE CODE_059004				;C - - - - - 0x00B00B 02:8FFB: D0 07
		LDA #$04					;C - - - - - 0x00B00D 02:8FFD: A9 04
		STA ram_0076				;C - - - - - 0x00B00F 02:8FFF: 85 76
		JMP CODE_059008				;C - - - - - 0x00B011 02:9001: 4C 08 90
CODE_059004:
	CMP #$2E					;C - - - - - 0x00B014 02:9004: C9 2E
	BCS CODE_059036				;C - - - - - 0x00B016 02:9006: B0 2E
CODE_059008:
		LDY ram_047B				;C - - - - - 0x00B018 02:9008: AC 7B 04
		LDA DATA_0590E2,Y			;C - - - - - 0x00B01B 02:900B: B9 E2 90
		STA ram_00D5				;C - - - - - 0x00B01E 02:900E: 85 D5
		INC ram_047B				;C - - - - - 0x00B020 02:9010: EE 7B 04
		JSR UpdatePlayerDir				;C - - - - - 0x00B023 02:9013: 20 A3 9A
		LDA hBlocked				;C - - - - - 0x00B026 02:9016: A5 79
		AND #$C0					;C - - - - - 0x00B028 02:9018: 29 C0
		AND ram_047E				;C - - - - - 0x00B02A 02:901A: 2D 7E 04
		BNE CODE_059022				;C - - - - - 0x00B02D 02:901D: D0 03
			JSR CODE_059070				;C - - - - - 0x00B02F 02:901F: 20 70 90
	CODE_059022:
		LDA ram_0076				;C - - - - - 0x00B032 02:9022: A5 76
		CMP #$03					;C - - - - - 0x00B034 02:9024: C9 03
		BEQ CODE_05902B				;C - - - - - 0x00B036 02:9026: F0 03
			JSR CODE_059174				;C - - - - - 0x00B038 02:9028: 20 74 91
	CODE_05902B:
		LDA ram_0062				;C - - - - - 0x00B03B 02:902B: A5 62
		BNE CODE_059033				;C - - - - - 0x00B03D 02:902D: D0 04
			LDA playerDir				;C - - - - - 0x00B03F 02:902F: A5 77
			STA ram_0062				;C - - - - - 0x00B041 02:9031: 85 62
	CODE_059033:
		JMP CODE_059045				;C - - - - - 0x00B043 02:9033: 4C 45 90
CODE_059036:
	LDA #$00					;C - - - - - 0x00B046 02:9036: A9 00
	STA ram_047B				;C - - - - - 0x00B048 02:9038: 8D 7B 04
	STA ram_047E				;C - - - - - 0x00B04B 02:903B: 8D 7E 04
	STA ram_0076				;C - - - - - 0x00B04E 02:903E: 85 76
	STA ram_0062				;C - - - - - 0x00B050 02:9040: 85 62
	JSR CODE_059174				;C - - - - - 0x00B052 02:9042: 20 74 91
CODE_059045:
	JSR CODE_05953A				;C - - - - - 0x00B055 02:9045: 20 3A 95
	RTS							;C - - - - - 0x00B058 02:9048: 60

CODE_059049:
	LDA powerUps				;C - - - - - 0x00B059 02:9049: A5 DE
	AND #POWERUP_SHOE					;C - - - - - 0x00B05B 02:904B: 29 02
	BEQ CODE_059051				;C - - - - - 0x00B05D 02:904D: F0 02
		INC scratch5				;C - - - - - 0x00B05F 02:904F: E6 05
CODE_059051:
	LDA globalTimer				;C - - - - - 0x00B061 02:9051: A5 14
	LSR							;C - - - - - 0x00B063 02:9053: 4A
	LSR							;C - - - - - 0x00B064 02:9054: 4A
	LDA globalTimer				;C - - - - - 0x00B065 02:9055: A5 14
	ROL							;C - - - - - 0x00B067 02:9057: 2A
	AND #$03					;C - - - - - 0x00B068 02:9058: 29 03
	CLC							;C - - - - - 0x00B06A 02:905A: 18
	ADC scratch5				;C - - - - - 0x00B06B 02:905B: 65 05
	LSR							;C - - - - - 0x00B06D 02:905D: 4A
	LSR							;C - - - - - 0x00B06E 02:905E: 4A
	STA ram_00D4				;C - - - - - 0x00B06F 02:905F: 85 D4
	LDX playerDir				;C - - - - - 0x00B071 02:9061: A6 77
	CPX #$01					;C - - - - - 0x00B073 02:9063: E0 01
	BNE CODE_05906F				;C - - - - - 0x00B075 02:9065: D0 08
		LDA ram_00D4				;C - - - - - 0x00B077 02:9067: A5 D4
		EOR #$FF					;C - - - - - 0x00B079 02:9069: 49 FF
		STA ram_00D4				;C - - - - - 0x00B07B 02:906B: 85 D4
		INC ram_00D4				;C - - - - - 0x00B07D 02:906D: E6 D4
CODE_05906F:
	RTS							;C - - - - - 0x00B07F 02:906F: 60

CODE_059070:
	LDX #$00					;C - - - - - 0x00B080 02:9070: A2 00
	LDA playerDir				;C - - - - - 0x00B082 02:9072: A5 77
	STA scratch0				;C - - - - - 0x00B084 02:9074: 85 00
	CLC							;C - - - - - 0x00B086 02:9076: 18
	ROR							;C - - - - - 0x00B087 02:9077: 6A
	ROR							;C - - - - - 0x00B088 02:9078: 6A
	ROR							;C - - - - - 0x00B089 02:9079: 6A
	AND hBlocked				;C - - - - - 0x00B08A 02:907A: 25 79
	BNE CODE_0590D3				;C - - - - - 0x00B08C 02:907C: D0 55

	LDA scratch5				;C - - - - - 0x00B08E 02:907E: A5 05
	BNE CODE_05908A				;C - - - - - 0x00B090 02:9080: D0 08
		CMP ram_047E				;C - - - - - 0x00B092 02:9082: CD 7E 04
		BEQ CODE_0590B0				;C - - - - - 0x00B095 02:9085: F0 29
			JMP CODE_0590AF				;C - - - - - 0x00B097 02:9087: 4C AF 90
CODE_05908A:
	CMP ram_047E				;C - - - - - 0x00B09A 02:908A: CD 7E 04
	BEQ CODE_0590AC				;C - - - - - 0x00B09D 02:908D: F0 1D
		LDA ram_047E				;C - - - - - 0x00B09F 02:908F: AD 7E 04
		BEQ CODE_05909D				;C - - - - - 0x00B0A2 02:9092: F0 09
			STA scratch0				;C - - - - - 0x00B0A4 02:9094: 85 00
			CLC							;C - - - - - 0x00B0A6 02:9096: 18
			ROL scratch0				;C - - - - - 0x00B0A7 02:9097: 26 00
			ROL scratch0				;C - - - - - 0x00B0A9 02:9099: 26 00
			ROL scratch0				;C - - - - - 0x00B0AB 02:909B: 26 00
	CODE_05909D:
		LDA ram_047B				;C - - - - - 0x00B0AD 02:909D: AD 7B 04
		CMP #$23					;C - - - - - 0x00B0B0 02:90A0: C9 23
		BCC CODE_0590AF				;C - - - - - 0x00B0B2 02:90A2: 90 0B
			LDA scratch5				;C - - - - - 0x00B0B4 02:90A4: A5 05
			STA ram_047E				;C - - - - - 0x00B0B6 02:90A6: 8D 7E 04
			JMP CODE_0590AE				;C - - - - - 0x00B0B9 02:90A9: 4C AE 90
CODE_0590AC:
	INX							;C - - - - - 0x00B0BC 02:90AC: E8
	INX							;C - - - - - 0x00B0BD 02:90AD: E8
CODE_0590AE:
	INX							;C - - - - - 0x00B0BE 02:90AE: E8
CODE_0590AF:
	INX							;C - - - - - 0x00B0BF 02:90AF: E8
CODE_0590B0:
	LDA DATA_0590D4,X			;C - - - - - 0x00B0C0 02:90B0: BD D4 90
	STA scratch2				;C - - - - - 0x00B0C3 02:90B3: 85 02
	LDA DATA_0590DB,X			;C - - - - - 0x00B0C5 02:90B5: BD DB 90
	STA ram_00D4				;C - - - - - 0x00B0C8 02:90B8: 85 D4
	LDA ram_047B				;C - - - - - 0x00B0CA 02:90BA: AD 7B 04
	AND #$03					;C - - - - - 0x00B0CD 02:90BD: 29 03
	CMP scratch2				;C - - - - - 0x00B0CF 02:90BF: C5 02
	BCC CODE_0590C5				;C - - - - - 0x00B0D1 02:90C1: 90 02
		INC ram_00D4				;C - - - - - 0x00B0D3 02:90C3: E6 D4
CODE_0590C5:
	LDX scratch0				;C - - - - - 0x00B0D5 02:90C5: A6 00
	CPX #$01					;C - - - - - 0x00B0D7 02:90C7: E0 01
	BNE CODE_0590D3				;C - - - - - 0x00B0D9 02:90C9: D0 08
		LDA ram_00D4				;C - - - - - 0x00B0DB 02:90CB: A5 D4
		EOR #$FF					;C - - - - - 0x00B0DD 02:90CD: 49 FF
		STA ram_00D4				;C - - - - - 0x00B0DF 02:90CF: 85 D4
		INC ram_00D4				;C - - - - - 0x00B0E1 02:90D1: E6 D4
CODE_0590D3:
	RTS							;C - - - - - 0x00B0E3 02:90D3: 60

DATA_0590D4:
	.byte $04					;- D 0 - - - 0x00B0E4 02:90D4: 04
	.byte $03					;- D 0 - - - 0x00B0E5 02:90D5: 03
	.byte $02					;- D 0 - - - 0x00B0E6 02:90D6: 02
	.byte $01					;- - - - - - 0x00B0E7 02:90D7: 01
	.byte $00					;- D 0 - - - 0x00B0E8 02:90D8: 00
	.byte $03					;- - - - - - 0x00B0E9 02:90D9: 03
	.byte $02					;- - - - - - 0x00B0EA 02:90DA: 02
DATA_0590DB:
	.byte $00					;- D 0 - - - 0x00B0EB 02:90DB: 00
	.byte $00					;- D 0 - - - 0x00B0EC 02:90DC: 00
	.byte $00					;- D 0 - - - 0x00B0ED 02:90DD: 00
	.byte $00					;- - - - - - 0x00B0EE 02:90DE: 00
	.byte $00					;- D 0 - - - 0x00B0EF 02:90DF: 00
	.byte $01					;- - - - - - 0x00B0F0 02:90E0: 01
	.byte $01					;- - - - - - 0x00B0F1 02:90E1: 01
DATA_0590E2:
	.byte $FD					;- D 0 - - - 0x00B0F2 02:90E2: FD
	.byte $FD					;- D 0 - - - 0x00B0F3 02:90E3: FD
	.byte $FD					;- D 0 - - - 0x00B0F4 02:90E4: FD
	.byte $FD					;- D 0 - - - 0x00B0F5 02:90E5: FD
	.byte $FD					;- D 0 - - - 0x00B0F6 02:90E6: FD
	.byte $FD					;- D 0 - - - 0x00B0F7 02:90E7: FD
	.byte $FD					;- D 0 - - - 0x00B0F8 02:90E8: FD
	.byte $FE					;- D 0 - - - 0x00B0F9 02:90E9: FE
	.byte $FE					;- D 0 - - - 0x00B0FA 02:90EA: FE
	.byte $FE					;- D 0 - - - 0x00B0FB 02:90EB: FE
	.byte $FE					;- D 0 - - - 0x00B0FC 02:90EC: FE
	.byte $FE					;- D 0 - - - 0x00B0FD 02:90ED: FE
	.byte $FE					;- D 0 - - - 0x00B0FE 02:90EE: FE
	.byte $FE					;- D 0 - - - 0x00B0FF 02:90EF: FE
	.byte $FE					;- D 0 - - - 0x00B100 02:90F0: FE
	.byte $FF					;- D 0 - - - 0x00B101 02:90F1: FF
	.byte $FF					;- D 0 - - - 0x00B102 02:90F2: FF
	.byte $FF					;- D 0 - - - 0x00B103 02:90F3: FF
	.byte $FF					;- D 0 - - - 0x00B104 02:90F4: FF
	.byte $FF					;- D 0 - - - 0x00B105 02:90F5: FF
	.byte $FF					;- D 0 - - - 0x00B106 02:90F6: FF
	.byte $00					;- D 0 - - - 0x00B107 02:90F7: 00
	.byte $00					;- D 0 - - - 0x00B108 02:90F8: 00
	.byte $00					;- D 0 - - - 0x00B109 02:90F9: 00
	.byte $00					;- D 0 - - - 0x00B10A 02:90FA: 00
	.byte $01					;- D 0 - - - 0x00B10B 02:90FB: 01
	.byte $01					;- D 0 - - - 0x00B10C 02:90FC: 01
	.byte $01					;- D 0 - - - 0x00B10D 02:90FD: 01
	.byte $01					;- D 0 - - - 0x00B10E 02:90FE: 01
	.byte $01					;- D 0 - - - 0x00B10F 02:90FF: 01
	.byte $01					;- D 0 - - - 0x00B110 02:9100: 01
	.byte $02					;- D 0 - - - 0x00B111 02:9101: 02
	.byte $02					;- D 0 - - - 0x00B112 02:9102: 02
	.byte $02					;- D 0 - - - 0x00B113 02:9103: 02
	.byte $02					;- D 0 - - - 0x00B114 02:9104: 02
	.byte $02					;- D 0 - - - 0x00B115 02:9105: 02
	.byte $02					;- D 0 - - - 0x00B116 02:9106: 02
	.byte $02					;- D 0 - - - 0x00B117 02:9107: 02
	.byte $02					;- D 0 - - - 0x00B118 02:9108: 02
	.byte $03					;- D 0 - - - 0x00B119 02:9109: 03
	.byte $03					;- D 0 - - - 0x00B11A 02:910A: 03
	.byte $03					;- D 0 - - - 0x00B11B 02:910B: 03
	.byte $03					;- D 0 - - - 0x00B11C 02:910C: 03
	.byte $03					;- D 0 - - - 0x00B11D 02:910D: 03
	.byte $03					;- D 0 - - - 0x00B11E 02:910E: 03
	.byte $03					;- D 0 - - - 0x00B11F 02:910F: 03

CODE_059110:
	JSR CODE_059140				;C - - - - - 0x00B120 02:9110: 20 40 91
	LDA hBlocked				;C - - - - - 0x00B123 02:9113: A5 79
	AND #KEY_LEFT|KEY_RIGHT		;C - - - - - 0x00B125 02:9115: 29 C0
	STA scratch0				;C - - - - - 0x00B127 02:9117: 85 00
	JSR UpdatePlayerDir				;C - - - - - 0x00B129 02:9119: 20 A3 9A
	BEQ CODE_05912B				;C - - - - - 0x00B12C 02:911C: F0 0D
		LDA playerHeld				;C - - - - - 0x00B12E 02:911E: A5 72
		AND scratch0				;C - - - - - 0x00B130 02:9120: 25 00
		BNE CODE_05912B				;C - - - - - 0x00B132 02:9122: D0 07
			LDA #$01					;C - - - - - 0x00B134 02:9124: A9 01
			STA scratch5				;C - - - - - 0x00B136 02:9126: 85 05
			JSR CODE_059049				;C - - - - - 0x00B138 02:9128: 20 49 90
CODE_05912B:
	JSR CODE_059174				;C - - - - - 0x00B13B 02:912B: 20 74 91
	LDA ram_0078				;C - - - - - 0x00B13E 02:912E: A5 78
	CMP #$81					;C - - - - - 0x00B140 02:9130: C9 81
	BNE CODE_05913C				;C - - - - - 0x00B142 02:9132: D0 08
		LDA hBlocked				;C - - - - - 0x00B144 02:9134: A5 79
		AND #$C0					;C - - - - - 0x00B146 02:9136: 29 C0
		BNE CODE_05913C				;C - - - - - 0x00B148 02:9138: D0 02
			DEC hBlocked				;C - - - - - 0x00B14A 02:913A: C6 79
CODE_05913C:
	JSR CODE_05953A				;C - - - - - 0x00B14C 02:913C: 20 3A 95
	RTS							;C - - - - - 0x00B14F 02:913F: 60

CODE_059140:
	LDX extraBubbles				;C - - - - - 0x00B150 02:9140: AE 7D 04
	LDA globalTimer				;C - - - - - 0x00B153 02:9143: A5 14
	LSR							;C - - - - - 0x00B155 02:9145: 4A
	LSR							;C - - - - - 0x00B156 02:9146: 4A
	LDA globalTimer				;C - - - - - 0x00B157 02:9147: A5 14
	ROL							;C - - - - - 0x00B159 02:9149: 2A
	AND #$03					;C - - - - - 0x00B15A 02:914A: 29 03
	CLC							;C - - - - - 0x00B15C 02:914C: 18
	ADC DATA_059155,X			;C - - - - - 0x00B15D 02:914D: 7D 55 91
	LSR							;C - - - - - 0x00B160 02:9150: 4A
	LSR							;C - - - - - 0x00B161 02:9151: 4A
	STA ram_00D5				;C - - - - - 0x00B162 02:9152: 85 D5
	RTS							;C - - - - - 0x00B164 02:9154: 60

DATA_059155:
	.byte $08					;- D 0 - - - 0x00B165 02:9155: 08
	.byte $06					;- D 0 - - - 0x00B166 02:9156: 06
	.byte $04					;- D 0 - - - 0x00B167 02:9157: 04
	.byte $04					;- - - - - - 0x00B168 02:9158: 04

TrySingleBubble:
.ifndef REGION_JP
	;JP ver does this check elsewhere
	LDA shooting				;C - - - - - 0x00B169 02:9159: AD 17 05
	BNE @end				;C - - - - - 0x00B16C 02:915C: D0 15
.endif
		LDA playerDir				;C - - - - - 0x00B16E 02:915E: A5 77
		STA shootDir				;C - - - - - 0x00B170 02:9160: 8D 14 05
		LDA #$01					;C - - - - - 0x00B173 02:9163: A9 01
		STA shootTrigger				;C - - - - - 0x00B175 02:9165: 8D 15 05
		LDA #$00					;C - - - - - 0x00B178 02:9168: A9 00
		STA inflateTime				;C - - - - - 0x00B17A 02:916A: 8D 7C 04
		STA extraBubbles				;C - - - - - 0x00B17D 02:916D: 8D 7D 04
		INC shootCounter				;C - - - - - 0x00B180 02:9170: EE 46 05
@end:
	RTS							;C - - - - - 0x00B183 02:9173: 60

CODE_059174:
	LDA ram_0078				;C - - - - - 0x00B184 02:9174: A5 78
	CMP #$80					;C - - - - - 0x00B186 02:9176: C9 80
	BCS CODE_059187				;C - - - - - 0x00B188 02:9178: B0 0D
		LDA ram_0076				;C - - - - - 0x00B18A 02:917A: A5 76
		CMP #$04					;C - - - - - 0x00B18C 02:917C: C9 04
		BEQ CODE_0591A5				;C - - - - - 0x00B18E 02:917E: F0 25
			LDA #$05					;C - - - - - 0x00B190 02:9180: A9 05
			STA ram_0076				;C - - - - - 0x00B192 02:9182: 85 76
			JMP CODE_0591A5				;C - - - - - 0x00B194 02:9184: 4C A5 91
CODE_059187:
	AND #$0F					;C - - - - - 0x00B197 02:9187: 29 0F
	EOR #$FF					;C - - - - - 0x00B199 02:9189: 49 FF
	STA ram_00D5				;C - - - - - 0x00B19B 02:918B: 85 D5
	INC ram_00D5				;C - - - - - 0x00B19D 02:918D: E6 D5
	LDA ram_0076				;C - - - - - 0x00B19F 02:918F: A5 76
	CMP #$01					;C - - - - - 0x00B1A1 02:9191: C9 01
	BEQ CODE_0591A5				;C - - - - - 0x00B1A3 02:9193: F0 10
		CMP #$02					;C - - - - - 0x00B1A5 02:9195: C9 02
		BEQ CODE_0591A5				;C - - - - - 0x00B1A7 02:9197: F0 0C
			LDA #$00					;C - - - - - 0x00B1A9 02:9199: A9 00
			STA ram_047B				;C - - - - - 0x00B1AB 02:919B: 8D 7B 04
			STA ram_0062				;C - - - - - 0x00B1AE 02:919E: 85 62
			STA ram_047E				;C - - - - - 0x00B1B0 02:91A0: 8D 7E 04
			STA ram_0076				;C - - - - - 0x00B1B3 02:91A3: 85 76
CODE_0591A5:
	RTS							;C - - - - - 0x00B1B5 02:91A5: 60

CODE_0591A6:
	;Unreached
	LDA hBlocked				;- - - - - - 0x00B1B6 02:91A6: A5
	AND #$C0					;- - - - - - 0x00B1B8 02:91A8: 29
	BEQ CODE_0591C1				;- - - - - - 0x00B1BA 02:91AA: F0
		LDA hBlocked				;- - - - - - 0x00B1BC 02:91AC: A5
		AND #$0F					;- - - - - - 0x00B1BE 02:91AE: 29
		STA scratch0				;- - - - - - 0x00B1C0 02:91B0: 85
		LDA ram_0062				;- - - - - - 0x00B1C2 02:91B2: A5
		BEQ CODE_0591BD				;- - - - - - 0x00B1C4 02:91B4: F0
			CMP #$01					;- - - - - - 0x00B1C6 02:91B6: C9
			BEQ CODE_0591C1				;- - - - - - 0x00B1C8 02:91B8: F0
				JMP CODE_0591C1				;- - - - - - 0x00B1CA 02:91BA: 4C
		CODE_0591BD:
		LDA playerDir				;- - - - - - 0x00B1CD 02:91BD: A5
		CMP #$02					;- - - - - - 0x00B1CF 02:91BF: C9
CODE_0591C1:
	RTS							;- - - - - - 0x00B1D1 02:91C1: 60

CODE_0591C2:
	LDA ram_007D				;C - - - - - 0x00B1D2 02:91C2: A5 7D
	AND #$60					;C - - - - - 0x00B1D4 02:91C4: 29 60
	BEQ CODE_0591F1				;C - - - - - 0x00B1D6 02:91C6: F0 29
		LDA hBlocked				;C - - - - - 0x00B1D8 02:91C8: A5 79
		AND #$C0					;C - - - - - 0x00B1DA 02:91CA: 29 C0
		BNE CODE_0591F1				;C - - - - - 0x00B1DC 02:91CC: D0 23
			LDA globalTimer				;C - - - - - 0x00B1DE 02:91CE: A5 14
			AND #$03					;C - - - - - 0x00B1E0 02:91D0: 29 03
			CLC							;C - - - - - 0x00B1E2 02:91D2: 18
			ADC ram_0476				;C - - - - - 0x00B1E3 02:91D3: 6D 76 04
			STA ram_00D4				;C - - - - - 0x00B1E6 02:91D6: 85 D4
			INC ram_00D4				;C - - - - - 0x00B1E8 02:91D8: E6 D4
			LSR ram_00D4				;C - - - - - 0x00B1EA 02:91DA: 46 D4
			LDX playerDir				;C - - - - - 0x00B1EC 02:91DC: A6 77
			CPX #$01					;C - - - - - 0x00B1EE 02:91DE: E0 01
			BEQ CODE_0591ED				;C - - - - - 0x00B1F0 02:91E0: F0 0B
				LDA ram_00D4				;C - - - - - 0x00B1F2 02:91E2: A5 D4
				EOR #$FF					;C - - - - - 0x00B1F4 02:91E4: 49 FF
				STA ram_00D4				;C - - - - - 0x00B1F6 02:91E6: 85 D4
				INC ram_00D4				;C - - - - - 0x00B1F8 02:91E8: E6 D4
				JMP CODE_0591F1				;C - - - - - 0x00B1FA 02:91EA: 4C F1 91
		CODE_0591ED:
			LDA #$00					;C - - - - - 0x00B1FD 02:91ED: A9 00
			STA ram_007D				;C - - - - - 0x00B1FF 02:91EF: 85 7D
CODE_0591F1:
	RTS							;C - - - - - 0x00B201 02:91F1: 60

PlayerHandlerInflating:
	INC inflateTime				;C - - - - - 0x00B202 02:91F2: EE 7C 04
	LDA inflateTime				;C - - - - - 0x00B205 02:91F5: AD 7C 04
	CMP #$3C					;C - - - - - 0x00B208 02:91F8: C9 3C
	BNE CODE_059201				;C - - - - - 0x00B20A 02:91FA: D0 05
		LDA #$02					;C - - - - - 0x00B20C 02:91FC: A9 02
		STA extraBubbles				;C - - - - - 0x00B20E 02:91FE: 8D 7D 04
CODE_059201:
	LDA ram_0076				;C - - - - - 0x00B211 02:9201: A5 76
	CMP #$07					;C - - - - - 0x00B213 02:9203: C9 07
	BEQ CODE_05921A				;C - - - - - 0x00B215 02:9205: F0 13
	CMP #$08					;C - - - - - 0x00B217 02:9207: C9 08
	BEQ CODE_059223				;C - - - - - 0x00B219 02:9209: F0 18
	CMP #$09					;C - - - - - 0x00B21B 02:920B: C9 09
	BEQ CODE_05923F				;C - - - - - 0x00B21D 02:920D: F0 30
	CMP #$0C					;C - - - - - 0x00B21F 02:920F: C9 0C
	BEQ CODE_059248				;C - - - - - 0x00B221 02:9211: F0 35
	CMP #$0D					;C - - - - - 0x00B223 02:9213: C9 0D
	BEQ CODE_059248				;C - - - - - 0x00B225 02:9215: F0 31
	;Unreached
	JMP CODE_05924E				;- - - - - - 0x00B227 02:9217: 4C

CODE_05921A:
	JSR CODE_05926D				;C - - - - - 0x00B22A 02:921A: 20 6D 92
	JSR CODE_059502				;C - - - - - 0x00B22D 02:921D: 20 02 95
	JMP CODE_05924E				;C - - - - - 0x00B230 02:9220: 4C 4E 92
CODE_059223:
	JSR CODE_0592AF				;C - - - - - 0x00B233 02:9223: 20 AF 92
	LDA ram_0076				;C - - - - - 0x00B236 02:9226: A5 76
	CMP #$09					;C - - - - - 0x00B238 02:9228: C9 09
	BEQ CODE_05923F				;C - - - - - 0x00B23A 02:922A: F0 13
		LDA objState				;C - - - - - 0x00B23C 02:922C: AD 63 05
		CMP #$08					;C - - - - - 0x00B23F 02:922F: C9 08
		BEQ CODE_05924E				;C - - - - - 0x00B241 02:9231: F0 1B
			LDX extraBubbles				;C - - - - - 0x00B243 02:9233: AE 7D 04
			LDA DATA_05926A,X			;C - - - - - 0x00B246 02:9236: BD 6A 92
			STA objState				;C - - - - - 0x00B249 02:9239: 8D 63 05
			JMP CODE_05924E				;C - - - - - 0x00B24C 02:923C: 4C 4E 92
CODE_05923F:
	JSR CODE_0592F4				;C - - - - - 0x00B24F 02:923F: 20 F4 92
	JSR CODE_059502				;C - - - - - 0x00B252 02:9242: 20 02 95
	JMP CODE_059251				;C - - - - - 0x00B255 02:9245: 4C 51 92
CODE_059248:
	JSR CODE_059333				;C - - - - - 0x00B258 02:9248: 20 33 93
	JMP CODE_059251				;C - - - - - 0x00B25B 02:924B: 4C 51 92
CODE_05924E:
	JSR CODE_059AB2				;C - - - - - 0x00B25E 02:924E: 20 B2 9A
CODE_059251:
	LDA playerHeld				;C - - - - - 0x00B261 02:9251: A5 72
	AND #KEY_B					;C - - - - - 0x00B263 02:9253: 29 02
	BNE CODE_059263				;C - - - - - 0x00B265 02:9255: D0 0C
		LDA extraBubbles				;C - - - - - 0x00B267 02:9257: AD 7D 04
		STA shootQueuedBubbles				;C - - - - - 0x00B26A 02:925A: 8D 16 05
		JSR CODE_059A0E				;C - - - - - 0x00B26D 02:925D: 20 0E 9A
		JSR TrySingleBubble				;C - - - - - 0x00B270 02:9260: 20 59 91
CODE_059263:
	JSR CODE_0596DF				;C - - - - - 0x00B273 02:9263: 20 DF 96
	JSR CODE_058EFB				;C - - - - - 0x00B276 02:9266: 20 FB 8E
	RTS							;C - - - - - 0x00B279 02:9269: 60

DATA_05926A:
	.byte $06					;- - - - - - 0x00B27A 02:926A: 06
	.byte $06					;- D 0 - - - 0x00B27B 02:926B: 06
	.byte $07					;- D 0 - - - 0x00B27C 02:926C: 07

CODE_05926D:
	LDA inflateTime				;C - - - - - 0x00B27D 02:926D: AD 7C 04
	CMP #120					;C - - - - - 0x00B280 02:9270: C9 78
	BCC CODE_059289				;C - - - - - 0x00B282 02:9272: 90 15
		LDA #PLAYER_STATE_FLOATING	;C - - - - - 0x00B284 02:9274: A9 02
		STA playerState				;C - - - - - 0x00B286 02:9276: 85 75
		LDA #$0A					;C - - - - - 0x00B288 02:9278: A9 0A
		STA ram_0076				;C - - - - - 0x00B28A 02:927A: 85 76
		LDA #$08					;C - - - - - 0x00B28C 02:927C: A9 08
		STA objState				;C - - - - - 0x00B28E 02:927E: 8D 63 05
		LDA #snFloat_ID					;C - - - - - 0x00B291 02:9281: A9 0E
		STA a:soundTrigger				;C - - - - - 0x00B293 02:9283: 8D E1 00
		JMP CODE_0592AE				;C - - - - - 0x00B296 02:9286: 4C AE 92
CODE_059289:
	LDA playerHeld				;C - - - - - 0x00B299 02:9289: A5 72
	AND #KEY_LEFT|KEY_RIGHT		;C - - - - - 0x00B29B 02:928B: 29 C0
	BEQ CODE_059296				;C - - - - - 0x00B29D 02:928D: F0 07
		LDA #$08					;C - - - - - 0x00B29F 02:928F: A9 08
		STA ram_0076				;C - - - - - 0x00B2A1 02:9291: 85 76
		JMP CODE_0592AE				;C - - - - - 0x00B2A3 02:9293: 4C AE 92
CODE_059296:
	LDA ram_0078				;C - - - - - 0x00B2A6 02:9296: A5 78
	CMP #$80					;C - - - - - 0x00B2A8 02:9298: C9 80
	BCS CODE_0592A3				;C - - - - - 0x00B2AA 02:929A: B0 07
		LDA #$09					;C - - - - - 0x00B2AC 02:929C: A9 09
		STA ram_0076				;C - - - - - 0x00B2AE 02:929E: 85 76
		JMP CODE_0592AE				;C - - - - - 0x00B2B0 02:92A0: 4C AE 92
CODE_0592A3:
	AND #$0F					;C - - - - - 0x00B2B3 02:92A3: 29 0F
	EOR #$FF					;C - - - - - 0x00B2B5 02:92A5: 49 FF
	STA ram_00D5				;C - - - - - 0x00B2B7 02:92A7: 85 D5
	INC ram_00D5				;C - - - - - 0x00B2B9 02:92A9: E6 D5
	JSR CODE_0591C2				;C - - - - - 0x00B2BB 02:92AB: 20 C2 91
CODE_0592AE:
	RTS							;C - - - - - 0x00B2BE 02:92AE: 60

CODE_0592AF:
	LDA inflateTime				;C - - - - - 0x00B2BF 02:92AF: AD 7C 04
	CMP #120					;C - - - - - 0x00B2C2 02:92B2: C9 78
	BCC CODE_0592C6				;C - - - - - 0x00B2C4 02:92B4: 90 10
		LDA #PLAYER_STATE_FLOATING	;C - - - - - 0x00B2C6 02:92B6: A9 02
		STA playerState				;C - - - - - 0x00B2C8 02:92B8: 85 75
		LDA #$0A					;C - - - - - 0x00B2CA 02:92BA: A9 0A
		STA ram_0076				;C - - - - - 0x00B2CC 02:92BC: 85 76
		LDA #$08					;C - - - - - 0x00B2CE 02:92BE: A9 08
		STA objState				;C - - - - - 0x00B2D0 02:92C0: 8D 63 05
		JMP CODE_0592EF				;C - - - - - 0x00B2D3 02:92C3: 4C EF 92
CODE_0592C6:
	JSR UpdatePlayerDir				;C - - - - - 0x00B2D6 02:92C6: 20 A3 9A
	BNE CODE_0592D2				;C - - - - - 0x00B2D9 02:92C9: D0 07
		LDA #$07					;C - - - - - 0x00B2DB 02:92CB: A9 07
		STA ram_0076				;C - - - - - 0x00B2DD 02:92CD: 85 76
		JMP CODE_0592E5				;C - - - - - 0x00B2DF 02:92CF: 4C E5 92
CODE_0592D2:
	LDA hBlocked				;C - - - - - 0x00B2E2 02:92D2: A5 79
	AND #KEY_LEFT|KEY_RIGHT		;C - - - - - 0x00B2E4 02:92D4: 29 C0
	AND playerHeld				;C - - - - - 0x00B2E6 02:92D6: 25 72
	BNE CODE_0592E5				;C - - - - - 0x00B2E8 02:92D8: D0 0B
		LDX extraBubbles				;C - - - - - 0x00B2EA 02:92DA: AE 7D 04
		LDA DATA_0592F0,X			;C - - - - - 0x00B2ED 02:92DD: BD F0 92
		STA scratch5				;C - - - - - 0x00B2F0 02:92E0: 85 05
		JSR CODE_059049				;C - - - - - 0x00B2F2 02:92E2: 20 49 90
CODE_0592E5:
	LDA ram_0078				;C - - - - - 0x00B2F5 02:92E5: A5 78
	CMP #$80					;C - - - - - 0x00B2F7 02:92E7: C9 80
	BCS CODE_0592EF				;C - - - - - 0x00B2F9 02:92E9: B0 04
		LDA #$09					;C - - - - - 0x00B2FB 02:92EB: A9 09
		STA ram_0076				;C - - - - - 0x00B2FD 02:92ED: 85 76
CODE_0592EF:
	RTS							;C - - - - - 0x00B2FF 02:92EF: 60

DATA_0592F0:
	.byte $05					;- D 0 - - - 0x00B300 02:92F0: 05
	.byte $03					;- D 0 - - - 0x00B301 02:92F1: 03
	.byte $02					;- D 0 - - - 0x00B302 02:92F2: 02
	.byte $02					;- - - - - - 0x00B303 02:92F3: 02

CODE_0592F4:
	LDA inflateTime				;C - - - - - 0x00B304 02:92F4: AD 7C 04
	CMP #120					;C - - - - - 0x00B307 02:92F7: C9 78
	BCC CODE_05930B				;C - - - - - 0x00B309 02:92F9: 90 10
		LDA #PLAYER_STATE_FLOATING	;C - - - - - 0x00B30B 02:92FB: A9 02
		STA playerState				;C - - - - - 0x00B30D 02:92FD: 85 75
		LDA #$0A					;C - - - - - 0x00B30F 02:92FF: A9 0A
		STA ram_0076				;C - - - - - 0x00B311 02:9301: 85 76
		LDA #$08					;C - - - - - 0x00B313 02:9303: A9 08
		STA objState				;C - - - - - 0x00B315 02:9305: 8D 63 05
		JMP CODE_05932F				;C - - - - - 0x00B318 02:9308: 4C 2F 93
CODE_05930B:
	JSR CODE_059140				;C - - - - - 0x00B31B 02:930B: 20 40 91
	JSR UpdatePlayerDir				;C - - - - - 0x00B31E 02:930E: 20 A3 9A
	BEQ CODE_059322				;C - - - - - 0x00B321 02:9311: F0 0F
		LDA hBlocked				;C - - - - - 0x00B323 02:9313: A5 79
		AND #KEY_LEFT|KEY_RIGHT		;C - - - - - 0x00B325 02:9315: 29 C0
		AND playerHeld				;C - - - - - 0x00B327 02:9317: 25 72
		BNE CODE_059322				;C - - - - - 0x00B329 02:9319: D0 07
			LDA #$01					;C - - - - - 0x00B32B 02:931B: A9 01
			STA scratch5				;C - - - - - 0x00B32D 02:931D: 85 05
			JSR CODE_059049				;C - - - - - 0x00B32F 02:931F: 20 49 90
CODE_059322:
	LDA ram_0078				;C - - - - - 0x00B332 02:9322: A5 78
	CMP #$80					;C - - - - - 0x00B334 02:9324: C9 80
	BCC CODE_05932F				;C - - - - - 0x00B336 02:9326: 90 07
		LDA #$07					;C - - - - - 0x00B338 02:9328: A9 07
		STA ram_0076				;C - - - - - 0x00B33A 02:932A: 85 76
		JSR CODE_059502				;C - - - - - 0x00B33C 02:932C: 20 02 95
CODE_05932F:
	RTS							;C - - - - - 0x00B33F 02:932F: 60

DATA_059330:
	.byte $09					;- - - - - - 0x00B340 02:9330: 09
	.byte $09					;- - - - - - 0x00B341 02:9331: 09
	.byte $0A					;- - - - - - 0x00B342 02:9332: 0A

CODE_059333:
	LDA inflateTime				;C - - - - - 0x00B343 02:9333: AD 7C 04
	CMP #120					;C - - - - - 0x00B346 02:9336: C9 78
	BCC CODE_05934A				;C - - - - - 0x00B348 02:9338: 90 10
		LDA #PLAYER_STATE_FLOATING	;C - - - - - 0x00B34A 02:933A: A9 02
		STA playerState				;C - - - - - 0x00B34C 02:933C: 85 75
		LDA #$0A					;C - - - - - 0x00B34E 02:933E: A9 0A
		STA ram_0076				;C - - - - - 0x00B350 02:9340: 85 76
		LDA #$08					;C - - - - - 0x00B352 02:9342: A9 08
		STA objState				;C - - - - - 0x00B354 02:9344: 8D 63 05
		JMP CODE_0593BD				;C - - - - - 0x00B357 02:9347: 4C BD 93
CODE_05934A:
	LDA ram_047B				;C - - - - - 0x00B35A 02:934A: AD 7B 04
	CMP #$17					;C - - - - - 0x00B35D 02:934D: C9 17
	BCS CODE_05935F				;C - - - - - 0x00B35F 02:934F: B0 0E
		LDY ram_047B				;C - - - - - 0x00B361 02:9351: AC 7B 04
		LDA DATA_0590E2,Y			;C - - - - - 0x00B364 02:9354: B9 E2 90
		STA ram_00D5				;C - - - - - 0x00B367 02:9357: 85 D5
		INC ram_047B				;C - - - - - 0x00B369 02:9359: EE 7B 04
		JMP CODE_059372				;C - - - - - 0x00B36C 02:935C: 4C 72 93
CODE_05935F:
	CMP #$2E					;C - - - - - 0x00B36F 02:935F: C9 2E
	BCS CODE_059386				;C - - - - - 0x00B371 02:9361: B0 23
		LDY ram_047B				;C - - - - - 0x00B373 02:9363: AC 7B 04
		LDA DATA_0590E2,Y			;C - - - - - 0x00B376 02:9366: B9 E2 90
		STA ram_00D5				;C - - - - - 0x00B379 02:9369: 85 D5
		INC ram_047B				;C - - - - - 0x00B37B 02:936B: EE 7B 04
		LDA #$0D					;C - - - - - 0x00B37E 02:936E: A9 0D
		STA ram_0076				;C - - - - - 0x00B380 02:9370: 85 76
	CODE_059372:
		JSR UpdatePlayerDir				;C - - - - - 0x00B382 02:9372: 20 A3 9A
		LDA hBlocked				;C - - - - - 0x00B385 02:9375: A5 79
		AND #KEY_LEFT|KEY_RIGHT		;C - - - - - 0x00B387 02:9377: 29 C0
		AND playerHeld				;C - - - - - 0x00B389 02:9379: 25 72
		BNE CODE_059380				;C - - - - - 0x00B38B 02:937B: D0 03
			JSR CODE_059070				;C - - - - - 0x00B38D 02:937D: 20 70 90
	CODE_059380:
		LDA ram_0076				;C - - - - - 0x00B390 02:9380: A5 76
		CMP #$0C					;C - - - - - 0x00B392 02:9382: C9 0C
		BEQ CODE_0593BA				;C - - - - - 0x00B394 02:9384: F0 34
CODE_059386:
	LDA ram_0078				;C - - - - - 0x00B396 02:9386: A5 78
	CMP #$80					;C - - - - - 0x00B398 02:9388: C9 80
	BCS CODE_0593A4				;C - - - - - 0x00B39A 02:938A: B0 18
		LDA ram_047B				;C - - - - - 0x00B39C 02:938C: AD 7B 04
		CMP #$2E					;C - - - - - 0x00B39F 02:938F: C9 2E
		BCC CODE_0593BD				;C - - - - - 0x00B3A1 02:9391: 90 2A
			LDA #$00					;C - - - - - 0x00B3A3 02:9393: A9 00
			STA ram_047B				;C - - - - - 0x00B3A5 02:9395: 8D 7B 04
			STA ram_0062				;C - - - - - 0x00B3A8 02:9398: 85 62
			STA ram_047E				;C - - - - - 0x00B3AA 02:939A: 8D 7E 04
			LDA #$09					;C - - - - - 0x00B3AD 02:939D: A9 09
			STA ram_0076				;C - - - - - 0x00B3AF 02:939F: 85 76
			JMP CODE_0593BD				;C - - - - - 0x00B3B1 02:93A1: 4C BD 93
CODE_0593A4:
	AND #$0F					;C - - - - - 0x00B3B4 02:93A4: 29 0F
	EOR #$FF					;C - - - - - 0x00B3B6 02:93A6: 49 FF
	STA ram_00D5				;C - - - - - 0x00B3B8 02:93A8: 85 D5
	INC ram_00D5				;C - - - - - 0x00B3BA 02:93AA: E6 D5
	LDA #$00					;C - - - - - 0x00B3BC 02:93AC: A9 00
	STA ram_047B				;C - - - - - 0x00B3BE 02:93AE: 8D 7B 04
	STA ram_0062				;C - - - - - 0x00B3C1 02:93B1: 85 62
	STA ram_047E				;C - - - - - 0x00B3C3 02:93B3: 8D 7E 04
	LDA #$07					;C - - - - - 0x00B3C6 02:93B6: A9 07
	STA ram_0076				;C - - - - - 0x00B3C8 02:93B8: 85 76
CODE_0593BA:
	JSR CODE_05953A				;C - - - - - 0x00B3CA 02:93BA: 20 3A 95
CODE_0593BD:
	RTS							;C - - - - - 0x00B3CD 02:93BD: 60

PlayerHandlerFloating:
	JSR CODE_059BD3				;C - - - - - 0x00B3CE 02:93BE: 20 D3 9B
	LDA #$00					;C - - - - - 0x00B3D1 02:93C1: A9 00
	STA scratch2				;C - - - - - 0x00B3D3 02:93C3: 85 02
	STA scratch3				;C - - - - - 0x00B3D5 02:93C5: 85 03
	LDA globalTimer				;C - - - - - 0x00B3D7 02:93C7: A5 14
	AND #$03					;C - - - - - 0x00B3D9 02:93C9: 29 03
	BNE CODE_0593E6				;C - - - - - 0x00B3DB 02:93CB: D0 19
		LDA playerHeld				;C - - - - - 0x00B3DD 02:93CD: A5 72
		AND #KEY_DOWN				;C - - - - - 0x00B3DF 02:93CF: 29 20
		BNE CODE_0593E6				;C - - - - - 0x00B3E1 02:93D1: D0 13
			LDA ram_007A				;C - - - - - 0x00B3E3 02:93D3: A5 7A
			AND #$0F					;C - - - - - 0x00B3E5 02:93D5: 29 0F
			CLC							;C - - - - - 0x00B3E7 02:93D7: 18
			ADC ram_0476				;C - - - - - 0x00B3E8 02:93D8: 6D 76 04
			TAX							;C - - - - - 0x00B3EB 02:93DB: AA
			LDA DATA_059434,X			;C - - - - - 0x00B3EC 02:93DC: BD 34 94
			STA scratch2				;C - - - - - 0x00B3EF 02:93DF: 85 02
			LDA DATA_059444,X			;C - - - - - 0x00B3F1 02:93E1: BD 44 94
			STA scratch3				;C - - - - - 0x00B3F4 02:93E4: 85 03
CODE_0593E6:
	JSR UpdatePlayerDir				;C - - - - - 0x00B3F6 02:93E6: 20 A3 9A
	BEQ CODE_0593FA				;C - - - - - 0x00B3F9 02:93E9: F0 0F
		LDA hBlocked				;C - - - - - 0x00B3FB 02:93EB: A5 79
		AND #$C0					;C - - - - - 0x00B3FD 02:93ED: 29 C0
		AND scratch5				;C - - - - - 0x00B3FF 02:93EF: 25 05
		BNE CODE_059401				;C - - - - - 0x00B401 02:93F1: D0 0E
			LDA #$02					;C - - - - - 0x00B403 02:93F3: A9 02
			STA scratch5				;C - - - - - 0x00B405 02:93F5: 85 05
			JSR CODE_059049				;C - - - - - 0x00B407 02:93F7: 20 49 90
CODE_0593FA:
	LDA ram_00D4				;C - - - - - 0x00B40A 02:93FA: A5 D4
	CLC							;C - - - - - 0x00B40C 02:93FC: 18
	ADC scratch3				;C - - - - - 0x00B40D 02:93FD: 65 03
	STA ram_00D4				;C - - - - - 0x00B40F 02:93FF: 85 D4
CODE_059401:
	LDA playerHeld				;C - - - - - 0x00B411 02:9401: A5 72
	AND #KEY_UP|KEY_DOWN		;C - - - - - 0x00B413 02:9403: 29 30
	BEQ CODE_059410				;C - - - - - 0x00B415 02:9405: F0 09
		LSR							;C - - - - - 0x00B417 02:9407: 4A
		LSR							;C - - - - - 0x00B418 02:9408: 4A
		LSR							;C - - - - - 0x00B419 02:9409: 4A
		LSR							;C - - - - - 0x00B41A 02:940A: 4A
		STA scratch0				;C - - - - - 0x00B41B 02:940B: 85 00
		JSR CODE_059454				;C - - - - - 0x00B41D 02:940D: 20 54 94
CODE_059410:
	LDA ram_00D5				;C - - - - - 0x00B420 02:9410: A5 D5
	CLC							;C - - - - - 0x00B422 02:9412: 18
	ADC scratch2				;C - - - - - 0x00B423 02:9413: 65 02
	STA ram_00D5				;C - - - - - 0x00B425 02:9415: 85 D5
	LDA playerHeld				;C - - - - - 0x00B427 02:9417: A5 72
	AND #KEY_B					;C - - - - - 0x00B429 02:9419: 29 02
	BNE CODE_05942D				;C - - - - - 0x00B42B 02:941B: D0 10
		LDA #$02					;C - - - - - 0x00B42D 02:941D: A9 02
		STA shootQueuedBubbles				;C - - - - - 0x00B42F 02:941F: 8D 16 05
		JSR CODE_059A0E				;C - - - - - 0x00B432 02:9422: 20 0E 9A
		JSR TrySingleBubble				;C - - - - - 0x00B435 02:9425: 20 59 91

.ifndef REGION_JP
		LDA #$00					;C - - - - - 0x00B438 02:9428: A9 00
		STA ram_04CA				;C - - - - - 0x00B43A 02:942A: 8D CA 04
.endif
CODE_05942D:
	JSR CODE_0596DF				;C - - - - - 0x00B43D 02:942D: 20 DF 96
	JSR CODE_058EFB				;C - - - - - 0x00B440 02:9430: 20 FB 8E
	RTS							;C - - - - - 0x00B443 02:9433: 60

DATA_059434:
	.byte $FF					;- D 0 - - - 0x00B444 02:9434: FF
	.byte $01					;- D 0 - - - 0x00B445 02:9435: 01
	.byte $00					;- D 0 - - - 0x00B446 02:9436: 00
	.byte $00					;- D 0 - - - 0x00B447 02:9437: 00
	.byte $FE					;- D 0 - - - 0x00B448 02:9438: FE
	.byte $02					;- D 0 - - - 0x00B449 02:9439: 02
	.byte $00					;- D 0 - - - 0x00B44A 02:943A: 00
	.byte $00					;- D 0 - - - 0x00B44B 02:943B: 00
	.byte $FD					;- D 0 - - - 0x00B44C 02:943C: FD
	.byte $03					;- D 0 - - - 0x00B44D 02:943D: 03
	.byte $00					;- D 0 - - - 0x00B44E 02:943E: 00
	.byte $00					;- D 0 - - - 0x00B44F 02:943F: 00
	.byte $FC					;- D 0 - - - 0x00B450 02:9440: FC
	.byte $04					;- - - - - - 0x00B451 02:9441: 04
	.byte $00					;- - - - - - 0x00B452 02:9442: 00
	.byte $00					;- - - - - - 0x00B453 02:9443: 00
DATA_059444:
	.byte $00					;- D 0 - - - 0x00B454 02:9444: 00
	.byte $00					;- D 0 - - - 0x00B455 02:9445: 00
	.byte $FF					;- D 0 - - - 0x00B456 02:9446: FF
	.byte $01					;- D 0 - - - 0x00B457 02:9447: 01
	.byte $00					;- D 0 - - - 0x00B458 02:9448: 00
	.byte $00					;- D 0 - - - 0x00B459 02:9449: 00
	.byte $FE					;- D 0 - - - 0x00B45A 02:944A: FE
	.byte $02					;- D 0 - - - 0x00B45B 02:944B: 02
	.byte $00					;- D 0 - - - 0x00B45C 02:944C: 00
	.byte $00					;- D 0 - - - 0x00B45D 02:944D: 00
	.byte $FD					;- D 0 - - - 0x00B45E 02:944E: FD
	.byte $03					;- D 0 - - - 0x00B45F 02:944F: 03
	.byte $00					;- D 0 - - - 0x00B460 02:9450: 00
	.byte $00					;- - - - - - 0x00B461 02:9451: 00
	.byte $FC					;- - - - - - 0x00B462 02:9452: FC
	.byte $04					;- - - - - - 0x00B463 02:9453: 04

CODE_059454:
	LDX scratch0				;C - - - - - 0x00B464 02:9454: A6 00
	CPX #$02					;C - - - - - 0x00B466 02:9456: E0 02
	BNE CODE_059460				;C - - - - - 0x00B468 02:9458: D0 06
		LDA ram_0078				;C - - - - - 0x00B46A 02:945A: A5 78
		CMP #$80					;C - - - - - 0x00B46C 02:945C: C9 80
		BCS CODE_059485				;C - - - - - 0x00B46E 02:945E: B0 25
CODE_059460:
	LDA globalTimer				;C - - - - - 0x00B470 02:9460: A5 14
	LSR							;C - - - - - 0x00B472 02:9462: 4A
	LSR							;C - - - - - 0x00B473 02:9463: 4A
	LDA globalTimer				;C - - - - - 0x00B474 02:9464: A5 14
	ROL							;C - - - - - 0x00B476 02:9466: 2A
	AND #$03					;C - - - - - 0x00B477 02:9467: 29 03
	CLC							;C - - - - - 0x00B479 02:9469: 18
	ADC #$01					;C - - - - - 0x00B47A 02:946A: 69 01
	LSR							;C - - - - - 0x00B47C 02:946C: 4A
	LSR							;C - - - - - 0x00B47D 02:946D: 4A
	STA scratch4				;C - - - - - 0x00B47E 02:946E: 85 04
	LDX scratch0				;C - - - - - 0x00B480 02:9470: A6 00
	CPX #$01					;C - - - - - 0x00B482 02:9472: E0 01
	BNE CODE_05947E				;C - - - - - 0x00B484 02:9474: D0 08
		LDA scratch4				;C - - - - - 0x00B486 02:9476: A5 04
		EOR #$FF					;C - - - - - 0x00B488 02:9478: 49 FF
		STA scratch4				;C - - - - - 0x00B48A 02:947A: 85 04
		INC scratch4				;C - - - - - 0x00B48C 02:947C: E6 04
CODE_05947E:
	LDA ram_00D5				;C - - - - - 0x00B48E 02:947E: A5 D5
	CLC							;C - - - - - 0x00B490 02:9480: 18
	ADC scratch4				;C - - - - - 0x00B491 02:9481: 65 04
	STA ram_00D5				;C - - - - - 0x00B493 02:9483: 85 D5
CODE_059485:
	RTS							;C - - - - - 0x00B495 02:9485: 60

CODE_059486:
	LDA ram_0076				;C - - - - - 0x00B496 02:9486: A5 76
	ASL							;C - - - - - 0x00B498 02:9488: 0A
	CLC							;C - - - - - 0x00B499 02:9489: 18
	ADC playerDir				;C - - - - - 0x00B49A 02:948A: 65 77
	TAX							;C - - - - - 0x00B49C 02:948C: AA
	LDA DATA_059499,X			;C - - - - - 0x00B49D 02:948D: BD 99 94
	CMP objAnim				;C - - - - - 0x00B4A0 02:9490: CD 7B 06
	BEQ CODE_059498				;C - - - - - 0x00B4A3 02:9493: F0 03
		JSR CODE_0599FF				;C - - - - - 0x00B4A5 02:9495: 20 FF 99
CODE_059498:
	RTS							;C - - - - - 0x00B4A8 02:9498: 60

DATA_059499:
	.byte $00					;- - - - - - 0x00B4A9 02:9499: 00
	.byte $01					;- D 0 - - - 0x00B4AA 02:949A: 01
	.byte $02					;- D 0 - - - 0x00B4AB 02:949B: 02
	.byte $0B					;- - - - - - 0x00B4AC 02:949C: 0B
	.byte $0C					;- - - - - - 0x00B4AD 02:949D: 0C
	.byte $03					;- D 0 - - - 0x00B4AE 02:949E: 03
	.byte $04					;- D 0 - - - 0x00B4AF 02:949F: 04
	.byte $05					;- D 0 - - - 0x00B4B0 02:94A0: 05
	.byte $06					;- D 0 - - - 0x00B4B1 02:94A1: 06
	.byte $07					;- D 0 - - - 0x00B4B2 02:94A2: 07
	.byte $08					;- D 0 - - - 0x00B4B3 02:94A3: 08
	.byte $09					;- D 0 - - - 0x00B4B4 02:94A4: 09
	.byte $0A					;- D 0 - - - 0x00B4B5 02:94A5: 0A
	.byte $33					;- - - - - - 0x00B4B6 02:94A6: 33
	.byte $34					;- - - - - - 0x00B4B7 02:94A7: 34

CODE_0594A8:
	LDA objState				;C - - - - - 0x00B4B8 02:94A8: AD 63 05
	ASL							;C - - - - - 0x00B4BB 02:94AB: 0A
	CLC							;C - - - - - 0x00B4BC 02:94AC: 18
	ADC playerDir				;C - - - - - 0x00B4BD 02:94AD: 65 77
	TAX							;C - - - - - 0x00B4BF 02:94AF: AA
	LDA DATA_0594BC,X			;C - - - - - 0x00B4C0 02:94B0: BD BC 94
	CMP objAnim				;C - - - - - 0x00B4C3 02:94B3: CD 7B 06
	BEQ CODE_0594BB				;C - - - - - 0x00B4C6 02:94B6: F0 03
		JSR CODE_0599FF				;C - - - - - 0x00B4C8 02:94B8: 20 FF 99
CODE_0594BB:
	RTS							;C - - - - - 0x00B4CB 02:94BB: 60

DATA_0594BC:
	.byte $00					;- - - - - - 0x00B4CC 02:94BC: 00
	.byte $0F					;- - - - - - 0x00B4CD 02:94BD: 0F
	.byte $10					;- - - - - - 0x00B4CE 02:94BE: 10
	.byte $0F					;- D 0 - - - 0x00B4CF 02:94BF: 0F
	.byte $10					;- D 0 - - - 0x00B4D0 02:94C0: 10
	.byte $19					;- D 0 - - - 0x00B4D1 02:94C1: 19
	.byte $1A					;- D 0 - - - 0x00B4D2 02:94C2: 1A
	.byte $28					;- D 0 - - - 0x00B4D3 02:94C3: 28
	.byte $29					;- D 0 - - - 0x00B4D4 02:94C4: 29
	.byte $2C					;- D 0 - - - 0x00B4D5 02:94C5: 2C
	.byte $2D					;- D 0 - - - 0x00B4D6 02:94C6: 2D
	.byte $35					;- - - - - - 0x00B4D7 02:94C7: 35
	.byte $36					;- - - - - - 0x00B4D8 02:94C8: 36
	.byte $11					;- D 0 - - - 0x00B4D9 02:94C9: 11
	.byte $12					;- D 0 - - - 0x00B4DA 02:94CA: 12
	.byte $1B					;- D 0 - - - 0x00B4DB 02:94CB: 1B
	.byte $1C					;- D 0 - - - 0x00B4DC 02:94CC: 1C
	.byte $23					;- D 0 - - - 0x00B4DD 02:94CD: 23
	.byte $24					;- D 0 - - - 0x00B4DE 02:94CE: 24
	.byte $17					;- - - - - - 0x00B4DF 02:94CF: 17
	.byte $18					;- - - - - - 0x00B4E0 02:94D0: 18
	.byte $21					;- - - - - - 0x00B4E1 02:94D1: 21
	.byte $22					;- - - - - - 0x00B4E2 02:94D2: 22
	.byte $26					;- D 0 - - - 0x00B4E3 02:94D3: 26
	.byte $37					;- D 0 - - - 0x00B4E4 02:94D4: 37
	.byte $01					;- D 0 - - - 0x00B4E5 02:94D5: 01
	.byte $02					;- D 0 - - - 0x00B4E6 02:94D6: 02
	.byte $26					;- - - - - - 0x00B4E7 02:94D7: 26
	.byte $37					;- - - - - - 0x00B4E8 02:94D8: 37

CODE_0594D9:
	LDA playerDir				;C - - - - - 0x00B4E9 02:94D9: A5 77
	TAX							;C - - - - - 0x00B4EB 02:94DB: AA
	LDA DATA_0594E8,X			;C - - - - - 0x00B4EC 02:94DC: BD E8 94
	CMP objAnim				;C - - - - - 0x00B4EF 02:94DF: CD 7B 06
	BEQ CODE_0594E7				;C - - - - - 0x00B4F2 02:94E2: F0 03
		JSR CODE_0599FF				;C - - - - - 0x00B4F4 02:94E4: 20 FF 99
CODE_0594E7:
	RTS							;C - - - - - 0x00B4F7 02:94E7: 60

DATA_0594E8:
	.byte $00					;- - - - - - 0x00B4F8 02:94E8: 00
	.byte $33					;- D 0 - - - 0x00B4F9 02:94E9: 33
	.byte $34					;- D 0 - - - 0x00B4FA 02:94EA: 34

CODE_0594EB:
	LDA wideScrollDir				;C - - - - - 0x00B4FB 02:94EB: A5 31
	BNE CODE_0594F8				;C - - - - - 0x00B4FD 02:94ED: D0 09
		LDA objX				;C - - - - - 0x00B4FF 02:94EF: AD B3 05
		CLC							;C - - - - - 0x00B502 02:94F2: 18
		ADC ram_00D4				;C - - - - - 0x00B503 02:94F3: 65 D4
		STA objX				;C - - - - - 0x00B505 02:94F5: 8D B3 05
CODE_0594F8:
	LDA objY				;C - - - - - 0x00B508 02:94F8: AD 8B 05
	CLC							;C - - - - - 0x00B50B 02:94FB: 18
	ADC ram_00D5				;C - - - - - 0x00B50C 02:94FC: 65 D5
	STA objY				;C - - - - - 0x00B50E 02:94FE: 8D 8B 05
	RTS							;C - - - - - 0x00B511 02:9501: 60

CODE_059502:
	LDA objState				;C - - - - - 0x00B512 02:9502: AD 63 05
	CMP #$08					;C - - - - - 0x00B515 02:9505: C9 08
	BEQ CODE_059539				;C - - - - - 0x00B517 02:9507: F0 30
		LDA inflateTime				;C - - - - - 0x00B519 02:9509: AD 7C 04
		CMP #$1E					;C - - - - - 0x00B51C 02:950C: C9 1E
		BCC CODE_059539				;C - - - - - 0x00B51E 02:950E: 90 29
			LDA #$02					;C - - - - - 0x00B520 02:9510: A9 02
			STA objState				;C - - - - - 0x00B522 02:9512: 8D 63 05
			LDA inflateTime				;C - - - - - 0x00B525 02:9515: AD 7C 04
			CMP #$3C					;C - - - - - 0x00B528 02:9518: C9 3C
			BCC CODE_059539				;C - - - - - 0x00B52A 02:951A: 90 1D
				LDA #$03					;C - - - - - 0x00B52C 02:951C: A9 03
				STA objState				;C - - - - - 0x00B52E 02:951E: 8D 63 05
				LDA inflateTime				;C - - - - - 0x00B531 02:9521: AD 7C 04
				CMP #$5A					;C - - - - - 0x00B534 02:9524: C9 5A
				BCC CODE_059539				;C - - - - - 0x00B536 02:9526: 90 11
					LDA #$04					;C - - - - - 0x00B538 02:9528: A9 04
					STA objState				;C - - - - - 0x00B53A 02:952A: 8D 63 05
					LDA inflateTime				;C - - - - - 0x00B53D 02:952D: AD 7C 04
					CMP #$78					;C - - - - - 0x00B540 02:9530: C9 78
					BCC CODE_059539				;C - - - - - 0x00B542 02:9532: 90 05
						;Unreached
						LDA #$05					;- - - - - - 0x00B544 02:9534: A9
						STA objState				;- - - - - - 0x00B546 02:9536: 8D
CODE_059539:
	RTS							;C - - - - - 0x00B549 02:9539: 60

CODE_05953A:
	LDA ram_007D				;C - - - - - 0x00B54A 02:953A: A5 7D
	CMP #$80					;C - - - - - 0x00B54C 02:953C: C9 80
	BNE CODE_059563				;C - - - - - 0x00B54E 02:953E: D0 23
		LDA #$00					;C - - - - - 0x00B550 02:9540: A9 00
		STA ram_047B				;C - - - - - 0x00B552 02:9542: 8D 7B 04
		STA ram_0062				;C - - - - - 0x00B555 02:9545: 85 62
		LDA ram_0076				;C - - - - - 0x00B557 02:9547: A5 76
		CMP #$07					;C - - - - - 0x00B559 02:9549: C9 07
		BCC CODE_059558				;C - - - - - 0x00B55B 02:954B: 90 0B
			;Unreached
			CMP #$0E					;- - - - - - 0x00B55D 02:954D: C9
			BCS CODE_059558				;- - - - - - 0x00B55F 02:954F: B0
				LDA #$0C					;- - - - - - 0x00B561 02:9551: A9
				STA ram_0076				;- - - - - - 0x00B563 02:9553: 85
				JMP CODE_059563				;- - - - - - 0x00B565 02:9555: 4C
	CODE_059558:
		LDA #$03					;C - - - - - 0x00B568 02:9558: A9 03
		STA ram_0076				;C - - - - - 0x00B56A 02:955A: 85 76
		INC ram_0545				;C - - - - - 0x00B56C 02:955C: EE 45 05
		LDA #$00					;C - - - - - 0x00B56F 02:955F: A9 00
		STA ram_007D				;C - - - - - 0x00B571 02:9561: 85 7D
CODE_059563:
	RTS							;C - - - - - 0x00B573 02:9563: 60

PlayerHandlerDead:
	LDA roundFlags				;C - - - - - 0x00B574 02:9564: AD 71 04
	AND #$19					;C - - - - - 0x00B577 02:9567: 29 19
	BEQ CODE_05956E				;C - - - - - 0x00B579 02:9569: F0 03
		;Unreached
		INC roundNumberDuration				;- - - - - - 0x00B57B 02:956B: EE
CODE_05956E:
	LDA #$2A					;C - - - - - 0x00B57E 02:956E: A9 2A
	CMP objAnim				;C - - - - - 0x00B580 02:9570: CD 7B 06
	BEQ CODE_059596				;C - - - - - 0x00B583 02:9573: F0 21
		JSR CODE_0599FF				;C - - - - - 0x00B585 02:9575: 20 FF 99
		DEC playerLives				;C - - - - - 0x00B588 02:9578: CE 79 04
		LDA bubblesLifespanLevel				;C - - - - - 0x00B58B 02:957B: A5 DA
		BEQ CODE_059581				;C - - - - - 0x00B58D 02:957D: F0 02
			DEC bubblesLifespanLevel				;C - - - - - 0x00B58F 02:957F: C6 DA
	CODE_059581:
		LDA livesCurrentPos				;C - - - - - 0x00B591 02:9581: AD 98 04
		ORA #$03					;C - - - - - 0x00B594 02:9584: 09 03
		STA livesCurrentPos				;C - - - - - 0x00B596 02:9586: 8D 98 04
		LDA #$00					;C - - - - - 0x00B599 02:9589: A9 00
		STA ram_047B				;C - - - - - 0x00B59B 02:958B: 8D 7B 04
		LDA #snDie_ID					;C - - - - - 0x00B59E 02:958E: A9 09
		STA a:soundTrigger			;C - - - - - 0x00B5A0 02:9590: 8D E1 00
		JMP CODE_059606				;C - - - - - 0x00B5A3 02:9593: 4C 06 96
CODE_059596:
	LDX ram_047B				;C - - - - - 0x00B5A6 02:9596: AE 7B 04
	CPX #$25					;C - - - - - 0x00B5A9 02:9599: E0 25
	BEQ CODE_0595C1				;C - - - - - 0x00B5AB 02:959B: F0 24
		CPX #$24					;C - - - - - 0x00B5AD 02:959D: E0 24
		BEQ CODE_0595A4				;C - - - - - 0x00B5AF 02:959F: F0 03
			INC ram_047B				;C - - - - - 0x00B5B1 02:95A1: EE 7B 04
	CODE_0595A4:
		LDA DATA_059607,X			;C - - - - - 0x00B5B4 02:95A4: BD 07 96
		STA ram_00D5				;C - - - - - 0x00B5B7 02:95A7: 85 D5
		CPX #$14					;C - - - - - 0x00B5B9 02:95A9: E0 14
		BCC CODE_059606				;C - - - - - 0x00B5BB 02:95AB: 90 59
			LDA objY				;C - - - - - 0x00B5BD 02:95AD: AD 8B 05
			CMP #$E0					;C - - - - - 0x00B5C0 02:95B0: C9 E0
			BCC CODE_059606				;C - - - - - 0x00B5C2 02:95B2: 90 52
				LDA #$12					;C - - - - - 0x00B5C4 02:95B4: A9 12
				STA objAnimProgress				;C - - - - - 0x00B5C6 02:95B6: 8D CB 06
				LDA #$00					;C - - - - - 0x00B5C9 02:95B9: A9 00
				STA objAnimTimer				;C - - - - - 0x00B5CB 02:95BB: 8D A3 06
				INC ram_047B				;C - - - - - 0x00B5CE 02:95BE: EE 7B 04
CODE_0595C1:
	JSR CODE_059A0E				;C - - - - - 0x00B5D1 02:95C1: 20 0E 9A
	JSR CODE_0596B4				;C - - - - - 0x00B5D4 02:95C4: 20 B4 96
	LDA playerLives				;C - - - - - 0x00B5D7 02:95C7: AD 79 04
	BEQ CODE_059606				;C - - - - - 0x00B5DA 02:95CA: F0 3A
		LDA currentRound				;C - - - - - 0x00B5DC 02:95CC: A5 D8
		CMP #20					;C - - - - - 0x00B5DE 02:95CE: C9 14
		BNE CODE_0595D7				;C - - - - - 0x00B5E0 02:95D0: D0 05
			LDA #$01					;C - - - - - 0x00B5E2 02:95D2: A9 01
			STA wideHScroll				;C - - - - - 0x00B5E4 02:95D4: 8D 61 07
	CODE_0595D7:
		LDA multiplayer				;C - - - - - 0x00B5E7 02:95D7: A5 74
		CMP #$01					;C - - - - - 0x00B5E9 02:95D9: C9 01
		BNE CODE_0595E3				;C - - - - - 0x00B5EB 02:95DB: D0 06
			JSR CODE_05962D				;C - - - - - 0x00B5ED 02:95DD: 20 2D 96
			JMP CODE_059606				;C - - - - - 0x00B5F0 02:95E0: 4C 06 96
	CODE_0595E3:
.ifdef REGION_JP
		LDA #196					;- - - - - - 0x00B6B2 02:96A2: A9
.else
		LDA #193					;C - - - - - 0x00B5F3 02:95E3: A9 C1
.endif
		STA objY				;C - - - - - 0x00B5F5 02:95E5: 8D 8B 05
		LDA #31					;C - - - - - 0x00B5F8 02:95E8: A9 1F
		STA objX				;C - - - - - 0x00B5FA 02:95EA: 8D B3 05
		LDA #anPlayerR_ID					;C - - - - - 0x00B5FD 02:95ED: A9 02
		STA objAnim				;C - - - - - 0x00B5FF 02:95EF: 8D 7B 06
		JSR CODE_0599FF				;C - - - - - 0x00B602 02:95F2: 20 FF 99
		LDA #120					;C - - - - - 0x00B605 02:95F5: A9 78
		STA playerInvFrames				;C - - - - - 0x00B607 02:95F7: 8D 77 04
		LDA #$02					;C - - - - - 0x00B60A 02:95FA: A9 02
		STA playerDir				;C - - - - - 0x00B60C 02:95FC: 85 77
		LDA livesCurrentPos				;C - - - - - 0x00B60E 02:95FE: AD 98 04
		ORA #$03					;C - - - - - 0x00B611 02:9601: 09 03
		STA livesCurrentPos				;C - - - - - 0x00B613 02:9603: 8D 98 04
CODE_059606:
	RTS							;C - - - - - 0x00B616 02:9606: 60

DATA_059607:
	.byte $FD					;- D 0 - - - 0x00B617 02:9607: FD
	.byte $FD					;- D 0 - - - 0x00B618 02:9608: FD
	.byte $FD					;- D 0 - - - 0x00B619 02:9609: FD
	.byte $FD					;- D 0 - - - 0x00B61A 02:960A: FD
	.byte $FD					;- D 0 - - - 0x00B61B 02:960B: FD
	.byte $FD					;- D 0 - - - 0x00B61C 02:960C: FD
	.byte $FE					;- D 0 - - - 0x00B61D 02:960D: FE
	.byte $FE					;- D 0 - - - 0x00B61E 02:960E: FE
	.byte $FE					;- D 0 - - - 0x00B61F 02:960F: FE
	.byte $FE					;- D 0 - - - 0x00B620 02:9610: FE
	.byte $FE					;- D 0 - - - 0x00B621 02:9611: FE
	.byte $FE					;- D 0 - - - 0x00B622 02:9612: FE
	.byte $FF					;- D 0 - - - 0x00B623 02:9613: FF
	.byte $FF					;- D 0 - - - 0x00B624 02:9614: FF
	.byte $FF					;- D 0 - - - 0x00B625 02:9615: FF
	.byte $FF					;- D 0 - - - 0x00B626 02:9616: FF
	.byte $00					;- D 0 - - - 0x00B627 02:9617: 00
	.byte $00					;- D 0 - - - 0x00B628 02:9618: 00
	.byte $00					;- D 0 - - - 0x00B629 02:9619: 00
	.byte $00					;- D 0 - - - 0x00B62A 02:961A: 00
	.byte $01					;- D 0 - - - 0x00B62B 02:961B: 01
	.byte $01					;- D 0 - - - 0x00B62C 02:961C: 01
	.byte $01					;- D 0 - - - 0x00B62D 02:961D: 01
	.byte $01					;- D 0 - - - 0x00B62E 02:961E: 01
	.byte $02					;- D 0 - - - 0x00B62F 02:961F: 02
	.byte $02					;- D 0 - - - 0x00B630 02:9620: 02
	.byte $02					;- D 0 - - - 0x00B631 02:9621: 02
	.byte $02					;- D 0 - - - 0x00B632 02:9622: 02
	.byte $02					;- D 0 - - - 0x00B633 02:9623: 02
	.byte $02					;- D 0 - - - 0x00B634 02:9624: 02
	.byte $03					;- D 0 - - - 0x00B635 02:9625: 03
	.byte $03					;- D 0 - - - 0x00B636 02:9626: 03
	.byte $03					;- D 0 - - - 0x00B637 02:9627: 03
	.byte $03					;- D 0 - - - 0x00B638 02:9628: 03
	.byte $03					;- D 0 - - - 0x00B639 02:9629: 03
	.byte $03					;- D 0 - - - 0x00B63A 02:962A: 03
	.byte $04					;- D 0 - - - 0x00B63B 02:962B: 04
	.byte $00					;- - - - - - 0x00B63C 02:962C: 00

CODE_05962D:
	LDA #$00					;C - - - - - 0x00B63D 02:962D: A9 00
	STA playerInvFrames				;C - - - - - 0x00B63F 02:962F: 8D 77 04
	STA a:soundTrigger				;C - - - - - 0x00B642 02:9632: 8D E1 00

	LDA multiplayer				;C - - - - - 0x00B645 02:9635: A5 74
	CMP #$01					;C - - - - - 0x00B647 02:9637: C9 01
	BNE CODE_059657				;C - - - - - 0x00B649 02:9639: D0 1C
		;Switch player
		LDA currentPlayer				;C - - - - - 0x00B64B 02:963B: AD 99 04
		EOR multiplayer				;C - - - - - 0x00B64E 02:963E: 45 74
		STA currentPlayer				;C - - - - - 0x00B650 02:9640: 8D 99 04

		LDX #$00					;C - - - - - 0x00B653 02:9643: A2 00
	CODE_059645:
		LDA bonusGameProgress,X				;C - - - - - 0x00B655 02:9645: B5 D6
		STA scratch0				;C - - - - - 0x00B657 02:9647: 85 00
		LDA ram_00D7,X				;C - - - - - 0x00B659 02:9649: B5 D7
		STA bonusGameProgress,X				;C - - - - - 0x00B65B 02:964B: 95 D6
		LDA scratch0				;C - - - - - 0x00B65D 02:964D: A5 00
		STA ram_00D7,X				;C - - - - - 0x00B65F 02:964F: 95 D7
		INX							;C - - - - - 0x00B661 02:9651: E8
		INX							;C - - - - - 0x00B662 02:9652: E8
		CPX #$0A					;C - - - - - 0x00B663 02:9653: E0 0A
		BCC CODE_059645				;C - - - - - 0x00B665 02:9655: 90 EE
CODE_059657:
	LDX currentPlayer				;C - - - - - 0x00B667 02:9657: AE 99 04
	LDY DATA_0596B2,X			;C - - - - - 0x00B66A 02:965A: BC B2 96
	LDA livesDigits,Y				;C - - - - - 0x00B66D 02:965D: B9 7F 04
	BEQ CODE_05966B				;C - - - - - 0x00B670 02:9660: F0 09
		;Unreached
		TAX							;- - - - - - 0x00B672 02:9662: AA
		LDA #$00					;- - - - - - 0x00B673 02:9663: A9
	CODE_059665:
		CLC							;- - - - - - 0x00B675 02:9665: 18
		ADC #$0A					;- - - - - - 0x00B676 02:9666: 69
		DEX							;- - - - - - 0x00B678 02:9668: CA
		BNE CODE_059665				;- - - - - - 0x00B679 02:9669: D0
CODE_05966B:
	CLC							;C - - - - - 0x00B67B 02:966B: 18
	ADC livesDigits+1,Y				;C - - - - - 0x00B67C 02:966C: 79 80 04
	STA playerLives				;C - - - - - 0x00B67F 02:966F: 8D 79 04

	LDA #01					;C - - - - - 0x00B682 02:9672: A9 01
	STA playerHearts				;C - - - - - 0x00B684 02:9674: 8D 78 04
	JSR CODE_0FEC8C				;C - - - - - 0x00B687 02:9677: 20 8C EC
	LDA #.BANK(CODE_058DBE)					;C - - - - - 0x00B68A 02:967A: A9 05
	STA nmiPrgBankA				;C - - - - - 0x00B68C 02:967C: 85 51

	LDA #FADE_OUT					;C - - - - - 0x00B68E 02:967E: A9 00
	STA fadeMode				;C - - - - - 0x00B690 02:9680: 8D 53 05
	LDA #$40					;C - - - - - 0x00B693 02:9683: A9 40
	STA fadeUnk0556				;C - - - - - 0x00B695 02:9685: 8D 56 05
	LDA #$03					;C - - - - - 0x00B698 02:9688: A9 03
	STA fadeSpeedMask				;C - - - - - 0x00B69A 02:968A: 8D 57 05
	LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x00B69D 02:968D: A9 00
	STA fadeColorsAdr				;C - - - - - 0x00B69F 02:968F: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00B6A2 02:9692: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x00B6A4 02:9694: 8D 5B 05
	LDA #4					;C - - - - - 0x00B6A7 02:9697: A9 04
	STA fadePasses				;C - - - - - 0x00B6A9 02:9699: 8D 54 05
	LDA #32					;C - - - - - 0x00B6AC 02:969C: A9 20
	STA fadeColorsAmount				;C - - - - - 0x00B6AE 02:969E: 8D 55 05

	LDA #.LOBYTE(CODE_058DBE)	;C - - - - - 0x00B6B1 02:96A1: A9 BE
	STA updateSub				;C - - - - - 0x00B6B3 02:96A3: 85 19
	LDA #.HIBYTE(CODE_058DBE)	;C - - - - - 0x00B6B5 02:96A5: A9 8D
	STA updateSub+1				;C - - - - - 0x00B6B7 02:96A7: 85 1A

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00B6B9 02:96A9: A9 50
	STA nmiBankedSub			;C - - - - - 0x00B6BB 02:96AB: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00B6BD 02:96AD: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x00B6BF 02:96AF: 85 17
	RTS							;C - - - - - 0x00B6C1 02:96B1: 60

DATA_0596B2:
	.byte $00					;- D 0 - - - 0x00B6C2 02:96B2: 00
	.byte $09					;- D 0 - - - 0x00B6C3 02:96B3: 09

CODE_0596B4:
	LDA #$00					;C - - - - - 0x00B6C4 02:96B4: A9 00
	STA playerDmgType				;C - - - - - 0x00B6C6 02:96B6: 85 7C
	STA playerHazardTrigger				;C - - - - - 0x00B6C8 02:96B8: 85 7E
	STA ram_007D				;C - - - - - 0x00B6CA 02:96BA: 85 7D
	STA shootQueuedBubbles				;C - - - - - 0x00B6CC 02:96BC: 8D 16 05
	STA ram_047A				;C - - - - - 0x00B6CF 02:96BF: 8D 7A 04
	STA ram_047B				;C - - - - - 0x00B6D2 02:96C2: 8D 7B 04
	STA ram_0062				;C - - - - - 0x00B6D5 02:96C5: 85 62
	STA ram_077B				;C - - - - - 0x00B6D7 02:96C7: 8D 7B 07
	STA bubbleVariant				;C - - - - - 0x00B6DA 02:96CA: 8D 19 05
	LDA ram_007B				;C - - - - - 0x00B6DD 02:96CD: A5 7B
	AND #$7F					;C - - - - - 0x00B6DF 02:96CF: 29 7F
	STA ram_007B				;C - - - - - 0x00B6E1 02:96D1: 85 7B
	LDA powerUps				;C - - - - - 0x00B6E3 02:96D3: A5 DE
	AND #~(POWERUP_CANDY|POWERUP_SHOE)					;C - - - - - 0x00B6E5 02:96D5: 29 FC
	STA powerUps				;C - - - - - 0x00B6E7 02:96D7: 85 DE
	LDA #1					;C - - - - - 0x00B6E9 02:96D9: A9 01
	STA playerHearts				;C - - - - - 0x00B6EB 02:96DB: 8D 78 04
	RTS							;C - - - - - 0x00B6EE 02:96DE: 60

CODE_0596DF:
	LDA playerInvFrames				;C - - - - - 0x00B6EF 02:96DF: AD 77 04
	BEQ CODE_0596FC				;C - - - - - 0x00B6F2 02:96E2: F0 18
		DEC playerInvFrames				;C - - - - - 0x00B6F4 02:96E4: CE 77 04
		LDA ram_007B				;C - - - - - 0x00B6F7 02:96E7: A5 7B
		AND #$7F					;C - - - - - 0x00B6F9 02:96E9: 29 7F
		STA ram_007B				;C - - - - - 0x00B6FB 02:96EB: 85 7B
		LDA #$00					;C - - - - - 0x00B6FD 02:96ED: A9 00
		STA playerDmgType				;C - - - - - 0x00B6FF 02:96EF: 85 7C
		LDA playerState				;C - - - - - 0x00B701 02:96F1: A5 75
		CMP #$05					;C - - - - - 0x00B703 02:96F3: C9 05
		BEQ CODE_0596FC				;C - - - - - 0x00B705 02:96F5: F0 05
			LDA #$00					;C - - - - - 0x00B707 02:96F7: A9 00
			STA ram_077B				;C - - - - - 0x00B709 02:96F9: 8D 7B 07
CODE_0596FC:
	LDA ram_007B				;C - - - - - 0x00B70C 02:96FC: A5 7B
	BEQ CODE_05971B				;C - - - - - 0x00B70E 02:96FE: F0 1B
		CMP #$80					;C - - - - - 0x00B710 02:9700: C9 80
		BCC CODE_059707				;C - - - - - 0x00B712 02:9702: 90 03
		JMP CODE_059782				;C - - - - - 0x00B714 02:9704: 4C 82 97
	CODE_059707:
		CMP #$02					;C - - - - - 0x00B717 02:9707: C9 02
		BNE CODE_05971B				;C - - - - - 0x00B719 02:9709: D0 10
			LDA #$05					;C - - - - - 0x00B71B 02:970B: A9 05
			STA playerState				;C - - - - - 0x00B71D 02:970D: 85 75
			LDA #$00					;C - - - - - 0x00B71F 02:970F: A9 00
			STA ram_0076				;C - - - - - 0x00B721 02:9711: 85 76
			LDA #$0B					;C - - - - - 0x00B723 02:9713: A9 0B
			STA objState				;C - - - - - 0x00B725 02:9715: 8D 63 05
			JMP CODE_05971B				;C - - - - - 0x00B728 02:9718: 4C 1B 97
CODE_05971B:
	LDA playerHazardTrigger				;C - - - - - 0x00B72B 02:971B: A5 7E
	CMP #$F0					;C - - - - - 0x00B72D 02:971D: C9 F0
	BCC CODE_059761				;C - - - - - 0x00B72F 02:971F: 90 40
		AND #$0F					;C - - - - - 0x00B731 02:9721: 29 0F
		BEQ CODE_059761				;C - - - - - 0x00B733 02:9723: F0 3C
			CMP #$03					;C - - - - - 0x00B735 02:9725: C9 03
			BNE CODE_059744				;C - - - - - 0x00B737 02:9727: D0 1B
				LDA ram_047B				;C - - - - - 0x00B739 02:9729: AD 7B 04
				BEQ CODE_059739				;C - - - - - 0x00B73C 02:972C: F0 0B
					CMP #$0A					;C - - - - - 0x00B73E 02:972E: C9 0A
					BCS CODE_059739				;C - - - - - 0x00B740 02:9730: B0 07
						LDA #$00					;C - - - - - 0x00B742 02:9732: A9 00
						STA playerHazardTrigger				;C - - - - - 0x00B744 02:9734: 85 7E
						JMP CODE_059761				;C - - - - - 0x00B746 02:9736: 4C 61 97
				CODE_059739:
					LDA #$0B					;C - - - - - 0x00B749 02:9739: A9 0B
					STA playerState				;C - - - - - 0x00B74B 02:973B: 85 75
					LDA #$00					;C - - - - - 0x00B74D 02:973D: A9 00
					STA ram_0076				;C - - - - - 0x00B74F 02:973F: 85 76
					JMP CODE_0597B7				;C - - - - - 0x00B751 02:9741: 4C B7 97
		CODE_059744:
			CMP #$07					;C - - - - - 0x00B754 02:9744: C9 07
			BEQ CODE_059782				;C - - - - - 0x00B756 02:9746: F0 3A
			CMP #$08					;C - - - - - 0x00B758 02:9748: C9 08
			BEQ CODE_059759				;C - - - - - 0x00B75A 02:974A: F0 0D
			LDA #PLAYER_STATE_SLUGGISH	;C - - - - - 0x00B75C 02:974C: A9 0C
			STA playerState				;C - - - - - 0x00B75E 02:974E: 85 75
			LDA #$00					;C - - - - - 0x00B760 02:9750: A9 00
			STA ram_0076				;C - - - - - 0x00B762 02:9752: 85 76
			STA playerDmgType				;C - - - - - 0x00B764 02:9754: 85 7C
			JMP CODE_0597B7				;C - - - - - 0x00B766 02:9756: 4C B7 97
		CODE_059759:
			LDA #PLAYER_STATE_SLUGGISH	;C - - - - - 0x00B769 02:9759: A9 0C
			STA playerState				;C - - - - - 0x00B76B 02:975B: 85 75
			LDA #$00					;C - - - - - 0x00B76D 02:975D: A9 00
			STA ram_0076				;C - - - - - 0x00B76F 02:975F: 85 76
CODE_059761:
	LDA playerDmgType				;C - - - - - 0x00B771 02:9761: A5 7C
	CMP #$C0					;C - - - - - 0x00B773 02:9763: C9 C0
	BNE CODE_059777				;C - - - - - 0x00B775 02:9765: D0 10
		LDA #$0C					;C - - - - - 0x00B777 02:9767: A9 0C
		STA objState				;C - - - - - 0x00B779 02:9769: 8D 63 05
		LDA #PLAYER_STATE_NEEDLER	;C - - - - - 0x00B77C 02:976C: A9 08
		STA playerState				;C - - - - - 0x00B77E 02:976E: 85 75
		LDA #$00					;C - - - - - 0x00B780 02:9770: A9 00
		STA ram_0076				;C - - - - - 0x00B782 02:9772: 85 76
		JMP CODE_0597B7				;C - - - - - 0x00B784 02:9774: 4C B7 97
CODE_059777:
	CMP #$80					;C - - - - - 0x00B787 02:9777: C9 80
	BCC CODE_0597B7				;C - - - - - 0x00B789 02:9779: 90 3C
	CMP #$96					;C - - - - - 0x00B78B 02:977B: C9 96
	BNE CODE_059782				;C - - - - - 0x00B78D 02:977D: D0 03
		INC ram_0547				;C - - - - - 0x00B78F 02:977F: EE 47 05
CODE_059782:
	LDA livesCurrentPos				;C - - - - - 0x00B792 02:9782: AD 98 04
	ORA #$03					;C - - - - - 0x00B795 02:9785: 09 03
	STA livesCurrentPos				;C - - - - - 0x00B797 02:9787: 8D 98 04
	INC ram_054A				;C - - - - - 0x00B79A 02:978A: EE 4A 05
	LDA playerHearts				;C - - - - - 0x00B79D 02:978D: AD 78 04
	SEC							;C - - - - - 0x00B7A0 02:9790: 38
	SBC #$01					;C - - - - - 0x00B7A1 02:9791: E9 01
	STA playerHearts				;C - - - - - 0x00B7A3 02:9793: 8D 78 04
	BEQ CODE_0597B3				;C - - - - - 0x00B7A6 02:9796: F0 1B
		LDA #PLAYER_STATE_HURT		;C - - - - - 0x00B7A8 02:9798: A9 09
		STA playerState				;C - - - - - 0x00B7AA 02:979A: 85 75
		LDA #$00					;C - - - - - 0x00B7AC 02:979C: A9 00
		STA ram_0076				;C - - - - - 0x00B7AE 02:979E: 85 76
		STA inflateTime				;C - - - - - 0x00B7B0 02:97A0: 8D 7C 04
		STA extraBubbles				;C - - - - - 0x00B7B3 02:97A3: 8D 7D 04
		LDA #$01					;C - - - - - 0x00B7B6 02:97A6: A9 01
		STA objState				;C - - - - - 0x00B7B8 02:97A8: 8D 63 05
		LDA #$02					;C - - - - - 0x00B7BB 02:97AB: A9 02
		STA ram_04AB				;C - - - - - 0x00B7BD 02:97AD: 8D AB 04
		JMP CODE_0597B7				;C - - - - - 0x00B7C0 02:97B0: 4C B7 97
CODE_0597B3:
	LDA #PLAYER_STATE_DEAD		;C - - - - - 0x00B7C3 02:97B3: A9 03
	STA playerState				;C - - - - - 0x00B7C5 02:97B5: 85 75
CODE_0597B7:
	RTS							;C - - - - - 0x00B7C7 02:97B7: 60

CODE_0597B8:
	LDA ram_0076				;C - - - - - 0x00B7C8 02:97B8: A5 76
	CMP #$00					;C - - - - - 0x00B7CA 02:97BA: C9 00
	BEQ CODE_0597F9				;C - - - - - 0x00B7CC 02:97BC: F0 3B
		CMP #$03					;C - - - - - 0x00B7CE 02:97BE: C9 03
		BEQ CODE_0597C5				;C - - - - - 0x00B7D0 02:97C0: F0 03
			;Unreached
			JMP CODE_05982B				;- - - - - - 0x00B7D2 02:97C2: 4C
	CODE_0597C5:
		DEC ram_047B				;C - - - - - 0x00B7D5 02:97C5: CE 7B 04
		BNE CODE_0597D8				;C - - - - - 0x00B7D8 02:97C8: D0 0E
			LDA #$00					;C - - - - - 0x00B7DA 02:97CA: A9 00
			STA playerState				;C - - - - - 0x00B7DC 02:97CC: 85 75
			STA ram_077B				;C - - - - - 0x00B7DE 02:97CE: 8D 7B 07
			LDA #$05					;C - - - - - 0x00B7E1 02:97D1: A9 05
			STA ram_0076				;C - - - - - 0x00B7E3 02:97D3: 85 76
			JMP CODE_05982B				;C - - - - - 0x00B7E5 02:97D5: 4C 2B 98
	CODE_0597D8:
		LDA #$02					;C - - - - - 0x00B7E8 02:97D8: A9 02
		STA objAnimTimer				;C - - - - - 0x00B7EA 02:97DA: 8D A3 06
		JSR CODE_059845				;C - - - - - 0x00B7ED 02:97DD: 20 45 98
		LDA ram_0078				;C - - - - - 0x00B7F0 02:97E0: A5 78
		AND #$80					;C - - - - - 0x00B7F2 02:97E2: 29 80
		BNE CODE_0597EB				;C - - - - - 0x00B7F4 02:97E4: D0 05
			LDA DATA_05987B,X			;C - - - - - 0x00B7F6 02:97E6: BD 7B 98
			STA ram_00D5				;C - - - - - 0x00B7F9 02:97E9: 85 D5
	CODE_0597EB:
		LDA hBlocked				;C - - - - - 0x00B7FB 02:97EB: A5 79
		AND #$C0					;C - - - - - 0x00B7FD 02:97ED: 29 C0
		BNE CODE_0597F6				;C - - - - - 0x00B7FF 02:97EF: D0 05
			LDA DATA_059884,X			;C - - - - - 0x00B801 02:97F1: BD 84 98
			STA ram_00D4				;C - - - - - 0x00B804 02:97F4: 85 D4
	CODE_0597F6:
		JMP CODE_05982B				;C - - - - - 0x00B806 02:97F6: 4C 2B 98
CODE_0597F9:
	LDA objAnimTimer				;C - - - - - 0x00B809 02:97F9: AD A3 06
	BNE CODE_059828				;C - - - - - 0x00B80C 02:97FC: D0 2A
		LDA globalTimer				;C - - - - - 0x00B80E 02:97FE: A5 14
		AND #$01					;C - - - - - 0x00B810 02:9800: 29 01
		BNE CODE_059828				;C - - - - - 0x00B812 02:9802: D0 24
			LDA ram_077B				;C - - - - - 0x00B814 02:9804: AD 7B 07
			ASL							;C - - - - - 0x00B817 02:9807: 0A
			TAX							;C - - - - - 0x00B818 02:9808: AA
			LDA DATA_05989F,X			;C - - - - - 0x00B819 02:9809: BD 9F 98
			STA scratch0				;C - - - - - 0x00B81C 02:980C: 85 00
			LDA DATA_05989F+1,X			;C - - - - - 0x00B81E 02:980E: BD A0 98
			STA scratch1				;C - - - - - 0x00B821 02:9811: 85 01
			JSR CODE_059832				;C - - - - - 0x00B823 02:9813: 20 32 98
			LDA scratch0				;C - - - - - 0x00B826 02:9816: A5 00
			CLC							;C - - - - - 0x00B828 02:9818: 18
			ADC DATA_05988D,X			;C - - - - - 0x00B829 02:9819: 7D 8D 98
			STA objY				;C - - - - - 0x00B82C 02:981C: 8D 8B 05
			LDA scratch1				;C - - - - - 0x00B82F 02:981F: A5 01
			CLC							;C - - - - - 0x00B831 02:9821: 18
			ADC DATA_059896,X			;C - - - - - 0x00B832 02:9822: 7D 96 98
			STA objX				;C - - - - - 0x00B835 02:9825: 8D B3 05
CODE_059828:
	JSR CODE_059AB2				;C - - - - - 0x00B838 02:9828: 20 B2 9A
CODE_05982B:
	JSR CODE_0596DF				;C - - - - - 0x00B83B 02:982B: 20 DF 96
	JSR CODE_058EFB				;C - - - - - 0x00B83E 02:982E: 20 FB 8E
	RTS							;C - - - - - 0x00B841 02:9831: 60

CODE_059832:
	LDA playerDir				;C - - - - - 0x00B842 02:9832: A5 77
	CMP #$02					;C - - - - - 0x00B844 02:9834: C9 02
	BEQ CODE_059841				;C - - - - - 0x00B846 02:9836: F0 09
		LDY objAnimProgress				;C - - - - - 0x00B848 02:9838: AC CB 06
		LDX DATA_059869,Y			;C - - - - - 0x00B84B 02:983B: BE 69 98
		JMP CODE_059844				;C - - - - - 0x00B84E 02:983E: 4C 44 98
CODE_059841:
	LDX objAnimProgress				;C - - - - - 0x00B851 02:9841: AE CB 06
CODE_059844:
	RTS							;C - - - - - 0x00B854 02:9844: 60

CODE_059845:
	LDA playerDir				;C - - - - - 0x00B855 02:9845: A5 77
	CMP #$02					;C - - - - - 0x00B857 02:9847: C9 02
	BEQ CODE_059854				;C - - - - - 0x00B859 02:9849: F0 09
		LDY objAnimProgress				;C - - - - - 0x00B85B 02:984B: AC CB 06
		LDX DATA_059872,Y			;C - - - - - 0x00B85E 02:984E: BE 72 98
		JMP CODE_059857				;C - - - - - 0x00B861 02:9851: 4C 57 98
CODE_059854:
	LDX objAnimProgress				;C - - - - - 0x00B864 02:9854: AE CB 06
CODE_059857:
	RTS							;C - - - - - 0x00B867 02:9857: 60

DATA_059858:
	.byte $00					;- - - - - - 0x00B868 02:9858: 00
	.byte $00					;- - - - - - 0x00B869 02:9859: 00
	.byte $01					;- - - - - - 0x00B86A 02:985A: 01
	.byte $01					;- - - - - - 0x00B86B 02:985B: 01
	.byte $01					;- - - - - - 0x00B86C 02:985C: 01
	.byte $00					;- - - - - - 0x00B86D 02:985D: 00
	.byte $01					;- - - - - - 0x00B86E 02:985E: 01
	.byte $00					;- - - - - - 0x00B86F 02:985F: 00
	.byte $00					;- - - - - - 0x00B870 02:9860: 00
	.byte $00					;- - - - - - 0x00B871 02:9861: 00
	.byte $01					;- - - - - - 0x00B872 02:9862: 01
	.byte $01					;- - - - - - 0x00B873 02:9863: 01
	.byte $00					;- - - - - - 0x00B874 02:9864: 00
	.byte $00					;- - - - - - 0x00B875 02:9865: 00
	.byte $01					;- - - - - - 0x00B876 02:9866: 01
	.byte $00					;- - - - - - 0x00B877 02:9867: 00
	.byte $01					;- - - - - - 0x00B878 02:9868: 01
DATA_059869:
	.byte $00					;- D 0 - - - 0x00B879 02:9869: 00
	.byte $07					;- D 0 - - - 0x00B87A 02:986A: 07
	.byte $06					;- D 0 - - - 0x00B87B 02:986B: 06
	.byte $05					;- D 0 - - - 0x00B87C 02:986C: 05
	.byte $04					;- D 0 - - - 0x00B87D 02:986D: 04
	.byte $03					;- D 0 - - - 0x00B87E 02:986E: 03
	.byte $02					;- D 0 - - - 0x00B87F 02:986F: 02
	.byte $01					;- D 0 - - - 0x00B880 02:9870: 01
	.byte $08					;- D 0 - - - 0x00B881 02:9871: 08
DATA_059872:
	.byte $00					;- - - - - - 0x00B882 02:9872: 00
	.byte $01					;- D 0 - - - 0x00B883 02:9873: 01
	.byte $08					;- D 0 - - - 0x00B884 02:9874: 08
	.byte $07					;- D 0 - - - 0x00B885 02:9875: 07
	.byte $06					;- D 0 - - - 0x00B886 02:9876: 06
	.byte $05					;- - - - - - 0x00B887 02:9877: 05
	.byte $04					;- D 0 - - - 0x00B888 02:9878: 04
	.byte $03					;- D 0 - - - 0x00B889 02:9879: 03
	.byte $02					;- D 0 - - - 0x00B88A 02:987A: 02
DATA_05987B:
	.byte $00					;- - - - - - 0x00B88B 02:987B: 00
	.byte $FC					;- D 0 - - - 0x00B88C 02:987C: FC
	.byte $FE					;- D 0 - - - 0x00B88D 02:987D: FE
	.byte $00					;- D 0 - - - 0x00B88E 02:987E: 00
	.byte $02					;- D 0 - - - 0x00B88F 02:987F: 02
	.byte $04					;- D 0 - - - 0x00B890 02:9880: 04
	.byte $02					;- D 0 - - - 0x00B891 02:9881: 02
	.byte $00					;- D 0 - - - 0x00B892 02:9882: 00
	.byte $FE					;- D 0 - - - 0x00B893 02:9883: FE
DATA_059884:
	.byte $00					;- - - - - - 0x00B894 02:9884: 00
	.byte $00					;- D 0 - - - 0x00B895 02:9885: 00
	.byte $02					;- D 0 - - - 0x00B896 02:9886: 02
	.byte $04					;- D 0 - - - 0x00B897 02:9887: 04
	.byte $02					;- D 0 - - - 0x00B898 02:9888: 02
	.byte $00					;- D 0 - - - 0x00B899 02:9889: 00
	.byte $FE					;- D 0 - - - 0x00B89A 02:988A: FE
	.byte $FC					;- D 0 - - - 0x00B89B 02:988B: FC
	.byte $FE					;- D 0 - - - 0x00B89C 02:988C: FE
DATA_05988D:
	.byte $00					;- D 0 - - - 0x00B89D 02:988D: 00
	.byte $EC					;- D 0 - - - 0x00B89E 02:988E: EC
	.byte $08					;- D 0 - - - 0x00B89F 02:988F: 08
	.byte $18					;- D 0 - - - 0x00B8A0 02:9890: 18
	.byte $22					;- D 0 - - - 0x00B8A1 02:9891: 22
	.byte $18					;- D 0 - - - 0x00B8A2 02:9892: 18
	.byte $00					;- D 0 - - - 0x00B8A3 02:9893: 00
	.byte $EC					;- D 0 - - - 0x00B8A4 02:9894: EC
	.byte $E4					;- D 0 - - - 0x00B8A5 02:9895: E4
DATA_059896:
	.byte $00					;- D 0 - - - 0x00B8A6 02:9896: 00
	.byte $12					;- D 0 - - - 0x00B8A7 02:9897: 12
	.byte $1C					;- D 0 - - - 0x00B8A8 02:9898: 1C
	.byte $12					;- D 0 - - - 0x00B8A9 02:9899: 12
	.byte $00					;- D 0 - - - 0x00B8AA 02:989A: 00
	.byte $EE					;- D 0 - - - 0x00B8AB 02:989B: EE
	.byte $E4					;- D 0 - - - 0x00B8AC 02:989C: E4
	.byte $EE					;- D 0 - - - 0x00B8AD 02:989D: EE
	.byte $00					;- D 0 - - - 0x00B8AE 02:989E: 00
DATA_05989F:
	.byte $00					;- - - - - - 0x00B8AF 02:989F: 00
	.byte $00					;- - - - - - 0x00B8B0 02:98A0: 00
	.byte $40					;- D 0 - - - 0x00B8B1 02:98A1: 40
	.byte $50					;- D 0 - - - 0x00B8B2 02:98A2: 50
	.byte $40					;- D 0 - - - 0x00B8B3 02:98A3: 40
	.byte $B0					;- D 0 - - - 0x00B8B4 02:98A4: B0
	.byte $40					;- D 0 - - - 0x00B8B5 02:98A5: 40
	.byte $80					;- D 0 - - - 0x00B8B6 02:98A6: 80
	.byte $70					;- D 0 - - - 0x00B8B7 02:98A7: 70
	.byte $80					;- D 0 - - - 0x00B8B8 02:98A8: 80
	.byte $40					;- - - - - - 0x00B8B9 02:98A9: 40
	.byte $40					;- - - - - - 0x00B8BA 02:98AA: 40
	.byte $80					;- - - - - - 0x00B8BB 02:98AB: 80
	.byte $30					;- - - - - - 0x00B8BC 02:98AC: 30
	.byte $70					;- D 0 - - - 0x00B8BD 02:98AD: 70
	.byte $70					;- D 0 - - - 0x00B8BE 02:98AE: 70
	.byte $A0					;- D 0 - - - 0x00B8BF 02:98AF: A0
	.byte $80					;- D 0 - - - 0x00B8C0 02:98B0: 80
	.byte $70					;- D 0 - - - 0x00B8C1 02:98B1: 70
	.byte $B0					;- D 0 - - - 0x00B8C2 02:98B2: B0
	.byte $B0					;- D 0 - - - 0x00B8C3 02:98B3: B0
	.byte $D0					;- D 0 - - - 0x00B8C4 02:98B4: D0
	.byte $40					;- D 0 - - - 0x00B8C5 02:98B5: 40
	.byte $80					;- D 0 - - - 0x00B8C6 02:98B6: 80
	.byte $80					;- D 0 - - - 0x00B8C7 02:98B7: 80
	.byte $50					;- D 0 - - - 0x00B8C8 02:98B8: 50
	.byte $80					;- D 0 - - - 0x00B8C9 02:98B9: 80
	.byte $B0					;- D 0 - - - 0x00B8CA 02:98BA: B0
	.byte $80					;- D 0 - - - 0x00B8CB 02:98BB: 80
	.byte $40					;- D 0 - - - 0x00B8CC 02:98BC: 40
	.byte $A0					;- D 0 - - - 0x00B8CD 02:98BD: A0
	.byte $80					;- D 0 - - - 0x00B8CE 02:98BE: 80
	.byte $80					;- D 0 - - - 0x00B8CF 02:98BF: 80
	.byte $C0					;- D 0 - - - 0x00B8D0 02:98C0: C0

PlayerHandlerNeedler:
	LDA ram_0076				;C - - - - - 0x00B8D1 02:98C1: A5 76
	CMP #$00					;C - - - - - 0x00B8D3 02:98C3: C9 00
	BEQ CODE_0598CF				;C - - - - - 0x00B8D5 02:98C5: F0 08
	CMP #$01					;C - - - - - 0x00B8D7 02:98C7: C9 01
	BEQ CODE_0598EC				;C - - - - - 0x00B8D9 02:98C9: F0 21
	CMP #$02					;C - - - - - 0x00B8DB 02:98CB: C9 02
	BEQ CODE_0598FB				;C - - - - - 0x00B8DD 02:98CD: F0 2C
CODE_0598CF:
	LDA playerDmgType				;C - - - - - 0x00B8DF 02:98CF: A5 7C
	CMP #$85					;C - - - - - 0x00B8E1 02:98D1: C9 85
	BNE CODE_0598E9				;C - - - - - 0x00B8E3 02:98D3: D0 14
		INC ram_0076				;C - - - - - 0x00B8E5 02:98D5: E6 76
		LDA #snNeedlerHit_ID					;C - - - - - 0x00B8E7 02:98D7: A9 1E
		STA a:soundTrigger				;C - - - - - 0x00B8E9 02:98D9: 8D E1 00
		LDA #$F9					;C - - - - - 0x00B8EC 02:98DC: A9 F9
		CLC							;C - - - - - 0x00B8EE 02:98DE: 18
		ADC playerDir				;C - - - - - 0x00B8EF 02:98DF: 65 77
		JSR CODE_0599FF				;C - - - - - 0x00B8F1 02:98E1: 20 FF 99
		LDA #$50					;C - - - - - 0x00B8F4 02:98E4: A9 50
		STA ram_047B				;C - - - - - 0x00B8F6 02:98E6: 8D 7B 04
CODE_0598E9:
	JMP CODE_059925				;C - - - - - 0x00B8F9 02:98E9: 4C 25 99
CODE_0598EC:
	DEC ram_047B				;C - - - - - 0x00B8FC 02:98EC: CE 7B 04
	BNE CODE_0598F8				;C - - - - - 0x00B8FF 02:98EF: D0 07
		INC ram_0076				;C - - - - - 0x00B901 02:98F1: E6 76
		LDA #$14					;C - - - - - 0x00B903 02:98F3: A9 14
		STA ram_047B				;C - - - - - 0x00B905 02:98F5: 8D 7B 04
CODE_0598F8:
	JMP CODE_059925				;C - - - - - 0x00B908 02:98F8: 4C 25 99
CODE_0598FB:
	DEC ram_047B				;C - - - - - 0x00B90B 02:98FB: CE 7B 04
	BNE CODE_059925				;C - - - - - 0x00B90E 02:98FE: D0 25
		LDA livesCurrentPos				;C - - - - - 0x00B910 02:9900: AD 98 04
		ORA #$03					;C - - - - - 0x00B913 02:9903: 09 03
		STA livesCurrentPos				;C - - - - - 0x00B915 02:9905: 8D 98 04
		INC ram_054A				;C - - - - - 0x00B918 02:9908: EE 4A 05
		LDA playerHearts				;C - - - - - 0x00B91B 02:990B: AD 78 04
		SEC							;C - - - - - 0x00B91E 02:990E: 38
		SBC #$01					;C - - - - - 0x00B91F 02:990F: E9 01
		BEQ CODE_059921				;C - - - - - 0x00B921 02:9911: F0 0E
			STA playerHearts				;C - - - - - 0x00B923 02:9913: 8D 78 04
			LDA #$78					;C - - - - - 0x00B926 02:9916: A9 78
			STA playerInvFrames				;C - - - - - 0x00B928 02:9918: 8D 77 04
			JSR CODE_059A0E				;C - - - - - 0x00B92B 02:991B: 20 0E 9A
			JMP CODE_059925				;C - - - - - 0x00B92E 02:991E: 4C 25 99
	CODE_059921:
		LDA #PLAYER_STATE_DEAD		;C - - - - - 0x00B931 02:9921: A9 03
		STA playerState				;C - - - - - 0x00B933 02:9923: 85 75
CODE_059925:
	RTS							;C - - - - - 0x00B935 02:9925: 60

PlayerHandlerHurt:
	LDA ram_0076				;C - - - - - 0x00B936 02:9926: A5 76
	CMP #$00					;C - - - - - 0x00B938 02:9928: C9 00
	BEQ CODE_059930				;C - - - - - 0x00B93A 02:992A: F0 04
		CMP #$01					;C - - - - - 0x00B93C 02:992C: C9 01
		BEQ CODE_059942				;C - - - - - 0x00B93E 02:992E: F0 12
CODE_059930:
	LDA #snHurt_ID					;C - - - - - 0x00B940 02:9930: A9 0D
	STA a:soundTrigger				;C - - - - - 0x00B942 02:9932: 8D E1 00
	LDY playerDir				;C - - - - - 0x00B945 02:9935: A4 77
	LDA DATA_059952,Y			;C - - - - - 0x00B947 02:9937: B9 52 99
	JSR CODE_0599FF				;C - - - - - 0x00B94A 02:993A: 20 FF 99
	INC ram_0076				;C - - - - - 0x00B94D 02:993D: E6 76
	JMP CODE_059951				;C - - - - - 0x00B94F 02:993F: 4C 51 99
CODE_059942:
	LDA objAnimTimer				;C - - - - - 0x00B952 02:9942: AD A3 06
	CMP #$01					;C - - - - - 0x00B955 02:9945: C9 01
	BNE CODE_059951				;C - - - - - 0x00B957 02:9947: D0 08
		LDA #$78					;C - - - - - 0x00B959 02:9949: A9 78
		STA playerInvFrames				;C - - - - - 0x00B95B 02:994B: 8D 77 04
		JSR CODE_059A0E				;C - - - - - 0x00B95E 02:994E: 20 0E 9A
CODE_059951:
	RTS							;C - - - - - 0x00B961 02:9951: 60

DATA_059952:
	.byte $00					;- - - - - - 0x00B962 02:9952: 00
	.byte $0D					;- D 0 - - - 0x00B963 02:9953: 0D
	.byte $0E					;- D 0 - - - 0x00B964 02:9954: 0E

PlayerHandlerStuck:
	LDA ram_0076				;C - - - - - 0x00B965 02:9955: A5 76
	BEQ CODE_059964				;C - - - - - 0x00B967 02:9957: F0 0B
	CMP #$01					;C - - - - - 0x00B969 02:9959: C9 01
	BEQ CODE_05997D				;C - - - - - 0x00B96B 02:995B: F0 20
	CMP #$02					;C - - - - - 0x00B96D 02:995D: C9 02
	BEQ CODE_059987				;C - - - - - 0x00B96F 02:995F: F0 26
	;Unreached
	JMP CODE_05998A				;- - - - - - 0x00B971 02:9961: 4C
CODE_059964:
	LDY playerDir				;C - - - - - 0x00B974 02:9964: A4 77
	LDA DATA_059952,Y			;C - - - - - 0x00B976 02:9966: B9 52 99
	JSR CODE_0599FF				;C - - - - - 0x00B979 02:9969: 20 FF 99
	INC ram_0076				;C - - - - - 0x00B97C 02:996C: E6 76
	LDA playerState				;C - - - - - 0x00B97E 02:996E: A5 75
	SEC							;C - - - - - 0x00B980 02:9970: 38
	SBC #$0A					;C - - - - - 0x00B981 02:9971: E9 0A
	TAX							;C - - - - - 0x00B983 02:9973: AA
	LDA DATA_05999C,X			;C - - - - - 0x00B984 02:9974: BD 9C 99
	STA ram_047A				;C - - - - - 0x00B987 02:9977: 8D 7A 04
	JMP CODE_05998A				;C - - - - - 0x00B98A 02:997A: 4C 8A 99
CODE_05997D:
	DEC ram_047A				;C - - - - - 0x00B98D 02:997D: CE 7A 04
	BNE CODE_05998A				;C - - - - - 0x00B990 02:9980: D0 08
		INC ram_0076				;C - - - - - 0x00B992 02:9982: E6 76
		JMP CODE_05998A				;C - - - - - 0x00B994 02:9984: 4C 8A 99
CODE_059987:
	JSR CODE_059A0E				;C - - - - - 0x00B997 02:9987: 20 0E 9A
CODE_05998A:
	JSR CODE_059AB2				;C - - - - - 0x00B99A 02:998A: 20 B2 9A
	BEQ CODE_059993				;C - - - - - 0x00B99D 02:998D: F0 04
		LDA #$00					;C - - - - - 0x00B99F 02:998F: A9 00
		STA playerHazardTrigger				;C - - - - - 0x00B9A1 02:9991: 85 7E
CODE_059993:
	LDA playerInvFrames				;C - - - - - 0x00B9A3 02:9993: AD 77 04
	BEQ CODE_05999B				;C - - - - - 0x00B9A6 02:9996: F0 03
		DEC playerInvFrames				;C - - - - - 0x00B9A8 02:9998: CE 77 04
CODE_05999B:
	RTS							;C - - - - - 0x00B9AB 02:999B: 60

DATA_05999C:
	.byte $78					;- D 0 - - - 0x00B9AC 02:999C: 78
	.byte $00					;- - - - - - 0x00B9AD 02:999D: 00
	.byte $05					;- D 0 - - - 0x00B9AE 02:999E: 05

CODE_05999F:
	LDA playerHazardTrigger				;C - - - - - 0x00B9AF 02:999F: A5 7E
	BNE CODE_0599A6				;C - - - - - 0x00B9B1 02:99A1: D0 03
		JMP CODE_0599E9				;C - - - - - 0x00B9B3 02:99A3: 4C E9 99
CODE_0599A6:
	LDA ram_007B				;C - - - - - 0x00B9B6 02:99A6: A5 7B
	AND #$7F					;C - - - - - 0x00B9B8 02:99A8: 29 7F
	STA ram_007B				;C - - - - - 0x00B9BA 02:99AA: 85 7B
	LDA ram_0076				;C - - - - - 0x00B9BC 02:99AC: A5 76
	BEQ CODE_0599BB				;C - - - - - 0x00B9BE 02:99AE: F0 0B
		CMP #$01					;C - - - - - 0x00B9C0 02:99B0: C9 01
		BEQ CODE_0599C8				;C - - - - - 0x00B9C2 02:99B2: F0 14
			;Unreached
			CMP #$02					;- - - - - - 0x00B9C4 02:99B4: C9
			BEQ CODE_0599E9				;- - - - - - 0x00B9C6 02:99B6: F0
				JMP CODE_0599EC				;- - - - - - 0x00B9C8 02:99B8: 4C
CODE_0599BB:
	LDY playerDir				;C - - - - - 0x00B9CB 02:99BB: A4 77
	LDA DATA_059952,Y			;C - - - - - 0x00B9CD 02:99BD: B9 52 99
	JSR CODE_0599FF				;C - - - - - 0x00B9D0 02:99C0: 20 FF 99
	INC ram_0076				;C - - - - - 0x00B9D3 02:99C3: E6 76
	JMP CODE_0599EC				;C - - - - - 0x00B9D5 02:99C5: 4C EC 99
CODE_0599C8:
	LDX playerHazardSlot				;C - - - - - 0x00B9D8 02:99C8: A6 7F
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x00B9DA 02:99CA: BD C7 05
	STA objX				;C - - - - - 0x00B9DD 02:99CD: 8D B3 05
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x00B9E0 02:99D0: BD 9F 05
	SEC							;C - - - - - 0x00B9E3 02:99D3: 38
	SBC #$03					;C - - - - - 0x00B9E4 02:99D4: E9 03
	STA objY				;C - - - - - 0x00B9E6 02:99D6: 8D 8B 05
	JSR CODE_059AB2				;C - - - - - 0x00B9E9 02:99D9: 20 B2 9A
	BNE CODE_0599EC				;C - - - - - 0x00B9EC 02:99DC: D0 0E
		LDA playerHazardTrigger				;C - - - - - 0x00B9EE 02:99DE: A5 7E
		CMP #$F0					;C - - - - - 0x00B9F0 02:99E0: C9 F0
		BCS CODE_0599EC				;C - - - - - 0x00B9F2 02:99E2: B0 08
			;Unreached
			INC ram_0076				;- - - - - - 0x00B9F4 02:99E4: E6
			JMP CODE_0599EC				;- - - - - - 0x00B9F6 02:99E6: 4C
CODE_0599E9:
	JSR CODE_059A0E				;C - - - - - 0x00B9F9 02:99E9: 20 0E 9A
CODE_0599EC:
	LDA playerInvFrames				;C - - - - - 0x00B9FC 02:99EC: AD 77 04
	BEQ CODE_0599F4				;C - - - - - 0x00B9FF 02:99EF: F0 03
		DEC playerInvFrames				;C - - - - - 0x00BA01 02:99F1: CE 77 04
CODE_0599F4:
	LDA #$00					;C - - - - - 0x00BA04 02:99F4: A9 00
	STA playerDmgType				;C - - - - - 0x00BA06 02:99F6: 85 7C
	RTS							;C - - - - - 0x00BA08 02:99F8: 60

DATA_0599F9:
	.byte $F9					;- D 0 - - - 0x00BA09 02:99F9: F9
	.byte $07					;- - - - - - 0x00BA0A 02:99FA: 07
DATA_0599FB:
	.byte $0D					;- D 0 - - - 0x00BA0B 02:99FB: 0D
	.byte $F3					;- - - - - - 0x00BA0C 02:99FC: F3
	.byte $FA					;- - - - - - 0x00BA0D 02:99FD: FA
DATA_0599FE:
	.byte $0C					;- D 0 - - - 0x00BA0E 02:99FE: 0C

CODE_0599FF:
	STA objAnim				;C - - - - - 0x00BA0F 02:99FF: 8D 7B 06
	LDA #$00					;C - - - - - 0x00BA12 02:9A02: A9 00
	STA objAnimHI				;C - - - - - 0x00BA14 02:9A04: 8D 1B 07
	STA objAnimProgress				;C - - - - - 0x00BA17 02:9A07: 8D CB 06
	STA objAnimTimer				;C - - - - - 0x00BA1A 02:9A0A: 8D A3 06
	RTS							;C - - - - - 0x00BA1D 02:9A0D: 60

CODE_059A0E:
	LDA #$01					;C - - - - - 0x00BA1E 02:9A0E: A9 01
	STA objState				;C - - - - - 0x00BA20 02:9A10: 8D 63 05
	LDA #$00					;C - - - - - 0x00BA23 02:9A13: A9 00
	STA playerState				;C - - - - - 0x00BA25 02:9A15: 85 75
	STA ram_0076				;C - - - - - 0x00BA27 02:9A17: 85 76
	STA inflateTime				;C - - - - - 0x00BA29 02:9A19: 8D 7C 04
	STA extraBubbles				;C - - - - - 0x00BA2C 02:9A1C: 8D 7D 04
	RTS							;C - - - - - 0x00BA2F 02:9A1F: 60

CODE_059A20:
	LDA ram_0076				;C - - - - - 0x00BA30 02:9A20: A5 76
	BEQ CODE_059A3B				;C - - - - - 0x00BA32 02:9A22: F0 17
	CMP #$01					;C - - - - - 0x00BA34 02:9A24: C9 01
	BEQ CODE_059A41				;C - - - - - 0x00BA36 02:9A26: F0 19
	CMP #$02					;C - - - - - 0x00BA38 02:9A28: C9 02
	BEQ CODE_059A47				;C - - - - - 0x00BA3A 02:9A2A: F0 1B
	CMP #$03					;C - - - - - 0x00BA3C 02:9A2C: C9 03
	BEQ CODE_059A4D				;C - - - - - 0x00BA3E 02:9A2E: F0 1D
	CMP #$04					;C - - - - - 0x00BA40 02:9A30: C9 04
	BEQ CODE_059A4D				;C - - - - - 0x00BA42 02:9A32: F0 19
	CMP #$05					;C - - - - - 0x00BA44 02:9A34: C9 05
	BEQ CODE_059A53				;C - - - - - 0x00BA46 02:9A36: F0 1B
	;Unreached
	JMP CODE_059A59
CODE_059A3B:
	JSR CODE_058F8C				;C - - - - - 0x00BA4B 02:9A3B: 20 8C 8F
	JMP CODE_059A59				;C - - - - - 0x00BA4E 02:9A3E: 4C 59 9A

CODE_059A41:
	;Unreached
	JSR CODE_058FB5				;- - - - - - 0x00BA51 02:9A41: 20
	JMP CODE_059A59				;- - - - - - 0x00BA54 02:9A44: 4C

CODE_059A47:
	JSR CODE_058FB6				;C - - - - - 0x00BA57 02:9A47: 20 B6 8F
	JMP CODE_059A59				;C - - - - - 0x00BA5A 02:9A4A: 4C 59 9A
CODE_059A4D:
	JSR CODE_058FF6				;C - - - - - 0x00BA5D 02:9A4D: 20 F6 8F
	JMP CODE_059A59				;C - - - - - 0x00BA60 02:9A50: 4C 59 9A
CODE_059A53:
	JSR CODE_059110				;C - - - - - 0x00BA63 02:9A53: 20 10 91
	JMP CODE_059A59				;C - - - - - 0x00BA66 02:9A56: 4C 59 9A
CODE_059A59:
	DEC ram_047A				;C - - - - - 0x00BA69 02:9A59: CE 7A 04
	BNE CODE_059A64				;C - - - - - 0x00BA6C 02:9A5C: D0 06
	JSR CODE_059A0E				;C - - - - - 0x00BA6E 02:9A5E: 20 0E 9A
	JMP CODE_059A6D				;C - - - - - 0x00BA71 02:9A61: 4C 6D 9A
CODE_059A64:
	JSR CODE_0596DF				;C - - - - - 0x00BA74 02:9A64: 20 DF 96
	LDA shooting				;C - - - - - 0x00BA77 02:9A67: AD 17 05
	JSR CODE_059A6E				;C - - - - - 0x00BA7A 02:9A6A: 20 6E 9A
CODE_059A6D:
	RTS							;C - - - - - 0x00BA7D 02:9A6D: 60

CODE_059A6E:
	LDA ram_0076				;C - - - - - 0x00BA7E 02:9A6E: A5 76
	ASL							;C - - - - - 0x00BA80 02:9A70: 0A
	CLC							;C - - - - - 0x00BA81 02:9A71: 18
	ADC playerDir				;C - - - - - 0x00BA82 02:9A72: 65 77
	TAX							;C - - - - - 0x00BA84 02:9A74: AA
	LDA objAnimHI				;C - - - - - 0x00BA85 02:9A75: AD 1B 07
	BEQ CODE_059A82				;C - - - - - 0x00BA88 02:9A78: F0 08
		LDA SmallPlayerAnims,X			;C - - - - - 0x00BA8A 02:9A7A: BD 96 9A
		CMP objAnim				;C - - - - - 0x00BA8D 02:9A7D: CD 7B 06
		BEQ CODE_059A95				;C - - - - - 0x00BA90 02:9A80: F0 13
CODE_059A82:
	LDA SmallPlayerAnims,X			;C - - - - - 0x00BA92 02:9A82: BD 96 9A
	STA objAnim				;C - - - - - 0x00BA95 02:9A85: 8D 7B 06
	LDA #.HIBYTE(anPlayerSmallL_ID)					;C - - - - - 0x00BA98 02:9A88: A9 01
	STA objAnimHI				;C - - - - - 0x00BA9A 02:9A8A: 8D 1B 07
	LDA #$00					;C - - - - - 0x00BA9D 02:9A8D: A9 00
	STA objAnimProgress				;C - - - - - 0x00BA9F 02:9A8F: 8D CB 06
	STA objAnimTimer				;C - - - - - 0x00BAA2 02:9A92: 8D A3 06
CODE_059A95:
	RTS							;C - - - - - 0x00BAA5 02:9A95: 60

SmallPlayerAnims:
	.byte $00											;- - - - - - 0x00BAA6 02:9A96: 00
	.byte .LOBYTE(anPlayerSmallL_ID)					;- D 0 - - - 0x00BAA7 02:9A97: 30
	.byte .LOBYTE(anPlayerSmallR_ID)					;- D 0 - - - 0x00BAA8 02:9A98: 31
	.byte .LOBYTE(anPlayerSmallL_ID)					;- - - - - - 0x00BAA9 02:9A99: 30
	.byte .LOBYTE(anPlayerSmallR_ID)					;- - - - - - 0x00BAAA 02:9A9A: 31
	.byte .LOBYTE(anPlayerSmallWalkL_ID)				;- D 0 - - - 0x00BAAB 02:9A9B: 34
	.byte .LOBYTE(anPlayerSmallWalkR_ID)				;- D 0 - - - 0x00BAAC 02:9A9C: 35
	.byte .LOBYTE(anPlayerSmallWalkL_ID)				;- D 0 - - - 0x00BAAD 02:9A9D: 34
	.byte .LOBYTE(anPlayerSmallWalkR_ID)				;- D 0 - - - 0x00BAAE 02:9A9E: 35
	.byte .LOBYTE(anPlayerSmallL_ID)					;- D 0 - - - 0x00BAAF 02:9A9F: 30
	.byte .LOBYTE(anPlayerSmallR_ID)					;- D 0 - - - 0x00BAB0 02:9AA0: 31
	.byte .LOBYTE(anPlayerSmallL_ID)					;- D 0 - - - 0x00BAB1 02:9AA1: 30
	.byte .LOBYTE(anPlayerSmallR_ID)					;- D 0 - - - 0x00BAB2 02:9AA2: 31

UpdatePlayerDir:
	LDA playerHeld				;C - - - - - 0x00BAB3 02:9AA3: A5 72
	AND #KEY_LEFT|KEY_RIGHT		;C - - - - - 0x00BAB5 02:9AA5: 29 C0
	STA scratch5				;C - - - - - 0x00BAB7 02:9AA7: 85 05
	BEQ CODE_059AB1				;C - - - - - 0x00BAB9 02:9AA9: F0 06
		CLC							;C - - - - - 0x00BABB 02:9AAB: 18
		ROL							;C - - - - - 0x00BABC 02:9AAC: 2A
		ROL							;C - - - - - 0x00BABD 02:9AAD: 2A
		ROL							;C - - - - - 0x00BABE 02:9AAE: 2A
		STA playerDir				;C - - - - - 0x00BABF 02:9AAF: 85 77
CODE_059AB1:
	RTS							;C - - - - - 0x00BAC1 02:9AB1: 60

CODE_059AB2:
	LDA playerPressed			;C - - - - - 0x00BAC2 02:9AB2: A5 73
	AND #KEY_A					;C - - - - - 0x00BAC4 02:9AB4: 29 01
	BEQ CODE_059ACF				;C - - - - - 0x00BAC6 02:9AB6: F0 17
		LDA #snJump_ID					;C - - - - - 0x00BAC8 02:9AB8: A9 05
		STA a:soundTrigger				;C - - - - - 0x00BACA 02:9ABA: 8D E1 00

		LDX playerState				;C - - - - - 0x00BACD 02:9ABD: A6 75
		LDA InflatingJumpResults,X			;C - - - - - 0x00BACF 02:9ABF: BD D0 9A
		STA playerState				;C - - - - - 0x00BAD2 02:9AC2: 85 75
		LDA DATA_059ADE,X			;C - - - - - 0x00BAD4 02:9AC4: BD DE 9A
		STA ram_0076				;C - - - - - 0x00BAD7 02:9AC7: 85 76
		LDA DATA_059AEC,X			;C - - - - - 0x00BAD9 02:9AC9: BD EC 9A
		STA ram_047B				;C - - - - - 0x00BADC 02:9ACC: 8D 7B 04
CODE_059ACF:
	RTS							;C - - - - - 0x00BADF 02:9ACF: 60

InflatingJumpResults:
	.byte $00					;- D 0 - - - 0x00BAE0 02:9AD0: 00
	.byte $01					;- D 0 - - - 0x00BAE1 02:9AD1: 01
	.byte $00					;- D 0 - - - 0x00BAE2 02:9AD2: 00
	.byte $00					;- - - - - - 0x00BAE3 02:9AD3: 00
	.byte $00					;- - - - - - 0x00BAE4 02:9AD4: 00
	.byte $05					;- D 0 - - - 0x00BAE5 02:9AD5: 05
	.byte $00					;- - - - - - 0x00BAE6 02:9AD6: 00
	.byte $00					;- - - - - - 0x00BAE7 02:9AD7: 00
	.byte $00					;- - - - - - 0x00BAE8 02:9AD8: 00
	.byte $00					;- - - - - - 0x00BAE9 02:9AD9: 00
	.byte $00					;- D 0 - - - 0x00BAEA 02:9ADA: 00
	.byte $00					;- D 0 - - - 0x00BAEB 02:9ADB: 00
	.byte $00					;- D 0 - - - 0x00BAEC 02:9ADC: 00
	.byte $00					;- - - - - - 0x00BAED 02:9ADD: 00
DATA_059ADE:
	.byte $03					;- D 0 - - - 0x00BAEE 02:9ADE: 03
	.byte $0C					;- D 0 - - - 0x00BAEF 02:9ADF: 0C
	.byte $00					;- D 0 - - - 0x00BAF0 02:9AE0: 00
	.byte $00					;- - - - - - 0x00BAF1 02:9AE1: 00
	.byte $00					;- - - - - - 0x00BAF2 02:9AE2: 00
	.byte $03					;- D 0 - - - 0x00BAF3 02:9AE3: 03
	.byte $00					;- - - - - - 0x00BAF4 02:9AE4: 00
	.byte $00					;- - - - - - 0x00BAF5 02:9AE5: 00
	.byte $00					;- - - - - - 0x00BAF6 02:9AE6: 00
	.byte $00					;- - - - - - 0x00BAF7 02:9AE7: 00
	.byte $03					;- D 0 - - - 0x00BAF8 02:9AE8: 03
	.byte $03					;- D 0 - - - 0x00BAF9 02:9AE9: 03
	.byte $03					;- D 0 - - - 0x00BAFA 02:9AEA: 03
	.byte $03					;- - - - - - 0x00BAFB 02:9AEB: 03
DATA_059AEC:
	.byte $00					;- D 0 - - - 0x00BAFC 02:9AEC: 00
	.byte $00					;- D 0 - - - 0x00BAFD 02:9AED: 00
	.byte $00					;- D 0 - - - 0x00BAFE 02:9AEE: 00
	.byte $00					;- - - - - - 0x00BAFF 02:9AEF: 00
	.byte $00					;- - - - - - 0x00BB00 02:9AF0: 00
	.byte $10					;- D 0 - - - 0x00BB01 02:9AF1: 10
	.byte $00					;- - - - - - 0x00BB02 02:9AF2: 00
	.byte $00					;- - - - - - 0x00BB03 02:9AF3: 00
	.byte $00					;- - - - - - 0x00BB04 02:9AF4: 00
	.byte $00					;- - - - - - 0x00BB05 02:9AF5: 00
	.byte $01					;- D 0 - - - 0x00BB06 02:9AF6: 01
	.byte $01					;- D 0 - - - 0x00BB07 02:9AF7: 01
	.byte $01					;- D 0 - - - 0x00BB08 02:9AF8: 01
	.byte $00					;- - - - - - 0x00BB09 02:9AF9: 00

CODE_059AFA:
	LDA #$00					;C - - - - - 0x00BB0A 02:9AFA: A9 00
	STA ram_0078				;C - - - - - 0x00BB0C 02:9AFC: 85 78
	STA hBlocked				;C - - - - - 0x00BB0E 02:9AFE: 85 79
	STA ram_0081				;C - - - - - 0x00BB10 02:9B00: 85 81
	LDA ram_007B				;C - - - - - 0x00BB12 02:9B02: A5 7B
	AND #$80					;C - - - - - 0x00BB14 02:9B04: 29 80
	STA ram_007B				;C - - - - - 0x00BB16 02:9B06: 85 7B
	LDX #$00					;C - - - - - 0x00BB18 02:9B08: A2 00
	JSR CODE_0FF643				;C - - - - - 0x00BB1A 02:9B0A: 20 43 F6
	LDA objY				;C - - - - - 0x00BB1D 02:9B0D: AD 8B 05
	CLC							;C - - - - - 0x00BB20 02:9B10: 18
	ADC #$0B					;C - - - - - 0x00BB21 02:9B11: 69 0B
	STA scratch0				;C - - - - - 0x00BB23 02:9B13: 85 00
	LDA objX				;C - - - - - 0x00BB25 02:9B15: AD B3 05
	CLC							;C - - - - - 0x00BB28 02:9B18: 18
	ADC DATA_059C69				;C - - - - - 0x00BB29 02:9B19: 6D 69 9C
	STA scratch1				;C - - - - - 0x00BB2C 02:9B1C: 85 01
	JSR GetTile				;C - - - - - 0x00BB2E 02:9B1E: 20 CB F4
	JSR CODE_0FF7AC				;C - - - - - 0x00BB31 02:9B21: 20 AC F7
	LDA scratch3				;C - - - - - 0x00BB34 02:9B24: A5 03
	EOR #$07					;C - - - - - 0x00BB36 02:9B26: 49 07
	STA scratch3				;C - - - - - 0x00BB38 02:9B28: 85 03
	JSR CheckWall				;C - - - - - 0x00BB3A 02:9B2A: 20 E2 F7
	LDA hBlocked				;C - - - - - 0x00BB3D 02:9B2D: A5 79
	ORA scratch4				;C - - - - - 0x00BB3F 02:9B2F: 05 04
	STA hBlocked				;C - - - - - 0x00BB41 02:9B31: 85 79
	LDA scratch1				;C - - - - - 0x00BB43 02:9B33: A5 01
	CLC							;C - - - - - 0x00BB45 02:9B35: 18
	ADC DATA_059C6B				;C - - - - - 0x00BB46 02:9B36: 6D 6B 9C
	STA scratch1				;C - - - - - 0x00BB49 02:9B39: 85 01
	JSR GetTile				;C - - - - - 0x00BB4B 02:9B3B: 20 CB F4
	JSR CODE_0FF7AC				;C - - - - - 0x00BB4E 02:9B3E: 20 AC F7
	JSR CheckFloor				;C - - - - - 0x00BB51 02:9B41: 20 1A F8
	LDY playerDir				;C - - - - - 0x00BB54 02:9B44: A4 77
	CPY #$02					;C - - - - - 0x00BB56 02:9B46: C0 02
	BNE CODE_059B53				;C - - - - - 0x00BB58 02:9B48: D0 09
		LDA hBlocked				;C - - - - - 0x00BB5A 02:9B4A: A5 79
		AND #$40					;C - - - - - 0x00BB5C 02:9B4C: 29 40
		ORA scratch4				;C - - - - - 0x00BB5E 02:9B4E: 05 04
		JMP CODE_059B59				;C - - - - - 0x00BB60 02:9B50: 4C 59 9B
CODE_059B53:
	LDA scratch4				;C - - - - - 0x00BB63 02:9B53: A5 04
	AND #$80					;C - - - - - 0x00BB65 02:9B55: 29 80
	ORA hBlocked				;C - - - - - 0x00BB67 02:9B57: 05 79
CODE_059B59:
	STA hBlocked				;C - - - - - 0x00BB69 02:9B59: 85 79
	LDA ram_0078				;C - - - - - 0x00BB6B 02:9B5B: A5 78
	BNE CODE_059BA1				;C - - - - - 0x00BB6D 02:9B5D: D0 42
		LDA scratch0				;C - - - - - 0x00BB6F 02:9B5F: A5 00
		CLC							;C - - - - - 0x00BB71 02:9B61: 18
		ADC #$01					;C - - - - - 0x00BB72 02:9B62: 69 01
		STA scratch0				;C - - - - - 0x00BB74 02:9B64: 85 00
		LDA objX				;C - - - - - 0x00BB76 02:9B66: AD B3 05
		STA scratch1				;C - - - - - 0x00BB79 02:9B69: 85 01
		JSR GetTile				;C - - - - - 0x00BB7B 02:9B6B: 20 CB F4
		JSR CODE_0FF07A				;C - - - - - 0x00BB7E 02:9B6E: 20 7A F0
		JSR CODE_0FF852				;C - - - - - 0x00BB81 02:9B71: 20 52 F8
		LDA scratch4				;C - - - - - 0x00BB84 02:9B74: A5 04
		BNE CODE_059BA1				;C - - - - - 0x00BB86 02:9B76: D0 29
			LDA objX				;C - - - - - 0x00BB88 02:9B78: AD B3 05
			CLC							;C - - - - - 0x00BB8B 02:9B7B: 18
			ADC DATA_0599F9				;C - - - - - 0x00BB8C 02:9B7C: 6D F9 99
			STA scratch1				;C - - - - - 0x00BB8F 02:9B7F: 85 01
			JSR GetTile				;C - - - - - 0x00BB91 02:9B81: 20 CB F4
			JSR CODE_0FF07A				;C - - - - - 0x00BB94 02:9B84: 20 7A F0
			JSR CODE_0FF852				;C - - - - - 0x00BB97 02:9B87: 20 52 F8
			LDA scratch4				;C - - - - - 0x00BB9A 02:9B8A: A5 04
			BNE CODE_059BA1				;C - - - - - 0x00BB9C 02:9B8C: D0 13
				LDA scratch1				;C - - - - - 0x00BB9E 02:9B8E: A5 01
				CLC							;C - - - - - 0x00BBA0 02:9B90: 18
				ADC DATA_0599FE				;C - - - - - 0x00BBA1 02:9B91: 6D FE 99
				STA scratch1				;C - - - - - 0x00BBA4 02:9B94: 85 01
				JSR GetTile				;C - - - - - 0x00BBA6 02:9B96: 20 CB F4
				JSR CODE_0FF07A				;C - - - - - 0x00BBA9 02:9B99: 20 7A F0
				JSR CODE_0FF852				;C - - - - - 0x00BBAC 02:9B9C: 20 52 F8
				LDA scratch4				;C - - - - - 0x00BBAF 02:9B9F: A5 04
CODE_059BA1:
	STA ram_0078				;C - - - - - 0x00BBB1 02:9BA1: 85 78
	ORA hBlocked				;C - - - - - 0x00BBB3 02:9BA3: 05 79
	AND #$C0					;C - - - - - 0x00BBB5 02:9BA5: 29 C0
	BEQ CODE_059BB8				;C - - - - - 0x00BBB7 02:9BA7: F0 0F
		LDA irqEffect				;C - - - - - 0x00BBB9 02:9BA9: A5 1D
		CMP #$01					;C - - - - - 0x00BBBB 02:9BAB: C9 01
		BNE CODE_059BB8				;C - - - - - 0x00BBBD 02:9BAD: D0 09
			LDA objX				;C - - - - - 0x00BBBF 02:9BAF: AD B3 05
			SEC							;C - - - - - 0x00BBC2 02:9BB2: 38
			SBC ram_0081				;C - - - - - 0x00BBC3 02:9BB3: E5 81
			STA objX				;C - - - - - 0x00BBC5 02:9BB5: 8D B3 05
CODE_059BB8:
	LDA #$00					;C - - - - - 0x00BBC8 02:9BB8: A9 00
	STA ram_0081				;C - - - - - 0x00BBCA 02:9BBA: 85 81
	RTS							;C - - - - - 0x00BBCC 02:9BBC: 60

.ifndef REGION_JP
CODE_059BBD:
	;Unreached
	LDA objY				;- - - - - - 0x00BBCD 02:9BBD: AD
	CMP a:ram_0020			;- - - - - - 0x00BBD0 02:9BC0: CD
	BCC CODE_059BCE				;- - - - - - 0x00BBD3 02:9BC3: 90
		SEC							;- - - - - - 0x00BBD5 02:9BC5: 38
		SBC #$C4					;- - - - - - 0x00BBD6 02:9BC6: E9
		BCC CODE_059BD2				;- - - - - - 0x00BBD8 02:9BC8: 90
			CMP #$04					;- - - - - - 0x00BBDA 02:9BCA: C9
			BCC CODE_059BD2				;- - - - - - 0x00BBDC 02:9BCC: 90
CODE_059BCE:
	LDA #$00					;- - - - - - 0x00BBDE 02:9BCE: A9
	STA ram_0078				;- - - - - - 0x00BBE0 02:9BD0: 85
CODE_059BD2:
	RTS							;- - - - - - 0x00BBE2 02:9BD2: 60
.endif

CODE_059BD3:
	LDA #$00					;C - - - - - 0x00BBE3 02:9BD3: A9 00
	STA ram_0078				;C - - - - - 0x00BBE5 02:9BD5: 85 78
	STA hBlocked				;C - - - - - 0x00BBE7 02:9BD7: 85 79
	STA ram_0081				;C - - - - - 0x00BBE9 02:9BD9: 85 81
	LDA ram_007B				;C - - - - - 0x00BBEB 02:9BDB: A5 7B
	AND #$80					;C - - - - - 0x00BBED 02:9BDD: 29 80
	STA ram_007B				;C - - - - - 0x00BBEF 02:9BDF: 85 7B
	JSR CODE_0FF643				;C - - - - - 0x00BBF1 02:9BE1: 20 43 F6
	LDA objY				;C - - - - - 0x00BBF4 02:9BE4: AD 8B 05
	STA scratch0				;C - - - - - 0x00BBF7 02:9BE7: 85 00
	LDA objX				;C - - - - - 0x00BBF9 02:9BE9: AD B3 05
	STA scratch1				;C - - - - - 0x00BBFC 02:9BEC: 85 01
	JSR CODE_0FF5E6				;C - - - - - 0x00BBFE 02:9BEE: 20 E6 F5
	LDA scratch4				;C - - - - - 0x00BC01 02:9BF1: A5 04
	STA ram_007A				;C - - - - - 0x00BC03 02:9BF3: 85 7A
	LDA scratch0				;C - - - - - 0x00BC05 02:9BF5: A5 00
	CLC							;C - - - - - 0x00BC07 02:9BF7: 18
	ADC #$06					;C - - - - - 0x00BC08 02:9BF8: 69 06
	STA scratch0				;C - - - - - 0x00BC0A 02:9BFA: 85 00
	LDX playerDir				;C - - - - - 0x00BC0C 02:9BFC: A6 77
	DEX							;C - - - - - 0x00BC0E 02:9BFE: CA
	LDA scratch1				;C - - - - - 0x00BC0F 02:9BFF: A5 01
	CLC							;C - - - - - 0x00BC11 02:9C01: 18
	ADC DATA_059C69,X			;C - - - - - 0x00BC12 02:9C02: 7D 69 9C
	STA scratch1				;C - - - - - 0x00BC15 02:9C05: 85 01
	JSR GetTile				;C - - - - - 0x00BC17 02:9C07: 20 CB F4
	JSR CODE_0FF7AC				;C - - - - - 0x00BC1A 02:9C0A: 20 AC F7
	CPX #$00					;C - - - - - 0x00BC1D 02:9C0D: E0 00
	BNE CODE_059C1D				;C - - - - - 0x00BC1F 02:9C0F: D0 0C
		LDA scratch3				;C - - - - - 0x00BC21 02:9C11: A5 03
		EOR #$07					;C - - - - - 0x00BC23 02:9C13: 49 07
		STA scratch3				;C - - - - - 0x00BC25 02:9C15: 85 03
		JSR CheckWall				;C - - - - - 0x00BC27 02:9C17: 20 E2 F7
		JMP CODE_059C20				;C - - - - - 0x00BC2A 02:9C1A: 4C 20 9C
CODE_059C1D:
	JSR CheckFloor				;C - - - - - 0x00BC2D 02:9C1D: 20 1A F8
CODE_059C20:
	LDA hBlocked				;C - - - - - 0x00BC30 02:9C20: A5 79
	ORA scratch4				;C - - - - - 0x00BC32 02:9C22: 05 04
	STA hBlocked				;C - - - - - 0x00BC34 02:9C24: 85 79
	LDA ram_0078				;C - - - - - 0x00BC36 02:9C26: A5 78
	BNE CODE_059C66				;C - - - - - 0x00BC38 02:9C28: D0 3C
		LDA scratch0				;C - - - - - 0x00BC3A 02:9C2A: A5 00
		CLC							;C - - - - - 0x00BC3C 02:9C2C: 18
		ADC #$06					;C - - - - - 0x00BC3D 02:9C2D: 69 06
		STA scratch0				;C - - - - - 0x00BC3F 02:9C2F: 85 00
		LDA objX				;C - - - - - 0x00BC41 02:9C31: AD B3 05
		STA scratch1				;C - - - - - 0x00BC44 02:9C34: 85 01
		JSR GetTile				;C - - - - - 0x00BC46 02:9C36: 20 CB F4
		JSR CODE_0FF7AC				;C - - - - - 0x00BC49 02:9C39: 20 AC F7
		JSR CODE_0FF852				;C - - - - - 0x00BC4C 02:9C3C: 20 52 F8
		LDA scratch4				;C - - - - - 0x00BC4F 02:9C3F: A5 04
		BNE CODE_059C66				;C - - - - - 0x00BC51 02:9C41: D0 23
			LDA objX				;C - - - - - 0x00BC53 02:9C43: AD B3 05
			CLC							;C - - - - - 0x00BC56 02:9C46: 18
			ADC DATA_0599F9				;C - - - - - 0x00BC57 02:9C47: 6D F9 99
			STA scratch1				;C - - - - - 0x00BC5A 02:9C4A: 85 01
			JSR GetTile				;C - - - - - 0x00BC5C 02:9C4C: 20 CB F4
			JSR CODE_0FF852				;C - - - - - 0x00BC5F 02:9C4F: 20 52 F8
			LDA scratch4				;C - - - - - 0x00BC62 02:9C52: A5 04
			BNE CODE_059C66				;C - - - - - 0x00BC64 02:9C54: D0 10
				LDA scratch1				;C - - - - - 0x00BC66 02:9C56: A5 01
				CLC							;C - - - - - 0x00BC68 02:9C58: 18
				ADC DATA_0599FB				;C - - - - - 0x00BC69 02:9C59: 6D FB 99
				STA scratch1				;C - - - - - 0x00BC6C 02:9C5C: 85 01
				JSR GetTile				;C - - - - - 0x00BC6E 02:9C5E: 20 CB F4
				JSR CODE_0FF852				;C - - - - - 0x00BC71 02:9C61: 20 52 F8
				LDA scratch4				;C - - - - - 0x00BC74 02:9C64: A5 04
CODE_059C66:
	STA ram_0078				;C - - - - - 0x00BC76 02:9C66: 85 78
	RTS							;C - - - - - 0x00BC78 02:9C68: 60

DATA_059C69:
	.byte $F8					;- D 0 - - - 0x00BC79 02:9C69: F8
	.byte $08					;- D 0 - - - 0x00BC7A 02:9C6A: 08
DATA_059C6B:
	.byte $10					;- D 0 - - - 0x00BC7B 02:9C6B: 10
	.byte $F0					;- - - - - - 0x00BC7C 02:9C6C: F0

SpawnProj_Local:
	;Spawn projectile and register parent
	;Also return current amount projectiles linked to parent in scratch0
	;X: Parent enemy index
	;00: X
	;01: Y
	;02: CHR slot
	;05: State (Projectile ID)
	;06-07: Anim

	LDY #$00					;C - - - - - 0x00BC7D 02:9C6D: A0 00
@findslot:
	LDA objState+OSLOT_PROJ,Y				;C - - - - - 0x00BC7F 02:9C6F: B9 64 05
	BNE @nextslot				;C - - - - - 0x00BC82 02:9C72: D0 42
		LDA scratch5				;C - - - - - 0x00BC84 02:9C74: A5 05
		STA objState+OSLOT_PROJ,Y				;C - - - - - 0x00BC86 02:9C76: 99 64 05
		LDA scratch6				;C - - - - - 0x00BC89 02:9C79: A5 06
		STA objAnim+OSLOT_PROJ,Y				;C - - - - - 0x00BC8B 02:9C7B: 99 7C 06
		LDA scratch7				;C - - - - - 0x00BC8E 02:9C7E: A5 07
		STA objAnimHI+OSLOT_PROJ,Y				;C - - - - - 0x00BC90 02:9C80: 99 1C 07
		LDA #$00					;C - - - - - 0x00BC93 02:9C83: A9 00
		STA projCounter,Y				;C - - - - - 0x00BC95 02:9C85: 99 1D 05
		STA objAnimProgress+OSLOT_PROJ,Y				;C - - - - - 0x00BC98 02:9C88: 99 CC 06
		STA objAnimTimer+OSLOT_PROJ,Y				;C - - - - - 0x00BC9B 02:9C8B: 99 A4 06
		STA projHSpeed,Y				;C - - - - - 0x00BC9E 02:9C8E: 99 2D 05
		STA projVSpeed,Y				;C - - - - - 0x00BCA1 02:9C91: 99 35 05
		LDA scratch2				;C - - - - - 0x00BCA4 02:9C94: A5 02
		STA objChrSlot+OSLOT_PROJ,Y				;C - - - - - 0x00BCA6 02:9C96: 99 2C 06
		LDA enemyMad,X				;C - - - - - 0x00BCA9 02:9C99: B5 63
		BEQ @normalcolor				;C - - - - - 0x00BCAB 02:9C9B: F0 04
			LDA #$03					;C - - - - - 0x00BCAD 02:9C9D: A9 03
			BNE @haveattr				;C - - - - - 0x00BCAF 02:9C9F: D0 05
	@normalcolor:
		LDA scratch2				;C - - - - - 0x00BCB1 02:9CA1: A5 02
		SEC							;C - - - - - 0x00BCB3 02:9CA3: 38
		SBC #$01					;C - - - - - 0x00BCB4 02:9CA4: E9 01
	@haveattr:
		STA objAttr+OSLOT_PROJ,Y				;C - - - - - 0x00BCB6 02:9CA6: 99 F4 06
		LDA scratch0				;C - - - - - 0x00BCB9 02:9CA9: A5 00
		STA objX+OSLOT_PROJ,Y				;C - - - - - 0x00BCBB 02:9CAB: 99 B4 05
		LDA scratch1				;C - - - - - 0x00BCBE 02:9CAE: A5 01
		STA objY+OSLOT_PROJ,Y				;C - - - - - 0x00BCC0 02:9CB0: 99 8C 05
		JMP @spawned				;C - - - - - 0x00BCC3 02:9CB3: 4C BE 9C
@nextslot:
	INY							;C - - - - - 0x00BCC6 02:9CB6: C8
	CPY #8					;C - - - - - 0x00BCC7 02:9CB7: C0 08
	BNE @findslot				;C - - - - - 0x00BCC9 02:9CB9: D0 B4
		;Unreached
		JMP @end				;- - - - - - 0x00BCCB 02:9CBB: 4C
@spawned:
	TYA							;C - - - - - 0x00BCCE 02:9CBE: 98
	PHA							;C - - - - - 0x00BCCF 02:9CBF: 48
	LDY #$00					;C - - - - - 0x00BCD0 02:9CC0: A0 00
	STY scratch0				;C - - - - - 0x00BCD2 02:9CC2: 84 00
@countparent:
	TXA							;C - - - - - 0x00BCD4 02:9CC4: 8A
	CMP projParent,Y				;C - - - - - 0x00BCD5 02:9CC5: D9 25 05
	BNE @matchchecked				;C - - - - - 0x00BCD8 02:9CC8: D0 02
		INC scratch0				;C - - - - - 0x00BCDA 02:9CCA: E6 00
@matchchecked:
	INY							;C - - - - - 0x00BCDC 02:9CCC: C8
	CPY #8					;C - - - - - 0x00BCDD 02:9CCD: C0 08
	BCC @countparent				;C - - - - - 0x00BCDF 02:9CCF: 90 F3

	PLA							;C - - - - - 0x00BCE1 02:9CD1: 68
	TAY							;C - - - - - 0x00BCE2 02:9CD2: A8
	TXA							;C - - - - - 0x00BCE3 02:9CD3: 8A
	STA projParent,Y				;C - - - - - 0x00BCE4 02:9CD4: 99 25 05
@end:
	RTS							;C - - - - - 0x00BCE7 02:9CD7: 60

CODE_059CD8:
	LDA #.BANK(CODE_0781B9)					;C - - - - - 0x00BCE8 02:9CD8: A9 07
	STA nmiPrgBankA				;C - - - - - 0x00BCEA 02:9CDA: 85 51
	LDA #.LOBYTE(CODE_0781B9)	;C - - - - - 0x00BCEC 02:9CDC: A9 B9
	STA nmiBankedSub			;C - - - - - 0x00BCEE 02:9CDE: 85 16
	LDA #.HIBYTE(CODE_0781B9)	;C - - - - - 0x00BCF0 02:9CE0: A9 81
	STA nmiBankedSub+1			;C - - - - - 0x00BCF2 02:9CE2: 85 17
	RTS							;C - - - - - 0x00BCF4 02:9CE4: 60

CODE_059CE5:
	LDA bufPPUMASK				;C - - - - - 0x00BCF5 02:9CE5: A5 33
	AND #$E7					;C - - - - - 0x00BCF7 02:9CE7: 29 E7
	STA bufPPUMASK				;C - - - - - 0x00BCF9 02:9CE9: 85 33
	STA PPUMASK					;C - - - - - 0x00BCFB 02:9CEB: 8D 01 20
	LDA PPUSTATUS					;C - - - - - 0x00BCFE 02:9CEE: AD 02 20
	LDA #$23					;C - - - - - 0x00BD01 02:9CF1: A9 23
	STA PPUADDR					;C - - - - - 0x00BD03 02:9CF3: 8D 06 20
	LDA #$C0					;C - - - - - 0x00BD06 02:9CF6: A9 C0
	STA PPUADDR					;C - - - - - 0x00BD08 02:9CF8: 8D 06 20
	LDA #$00					;C - - - - - 0x00BD0B 02:9CFB: A9 00
	TAY							;C - - - - - 0x00BD0D 02:9CFD: A8
CODE_059CFE:
	STA PPUDATA					;C - - - - - 0x00BD0E 02:9CFE: 8D 07 20
	INY							;C - - - - - 0x00BD11 02:9D01: C8
	CPY #$40					;C - - - - - 0x00BD12 02:9D02: C0 40
	BNE CODE_059CFE				;C - - - - - 0x00BD14 02:9D04: D0 F8

	LDA PPUSTATUS					;C - - - - - 0x00BD16 02:9D06: AD 02 20
	LDA #$27					;C - - - - - 0x00BD19 02:9D09: A9 27
	STA PPUADDR				;C - - - - - 0x00BD1B 02:9D0B: 8D 06 20
	LDA #$C0					;C - - - - - 0x00BD1E 02:9D0E: A9 C0
	STA PPUADDR				;C - - - - - 0x00BD20 02:9D10: 8D 06 20
	LDA #$00					;C - - - - - 0x00BD23 02:9D13: A9 00
	TAY							;C - - - - - 0x00BD25 02:9D15: A8
CODE_059D16:
	STA PPUDATA				;C - - - - - 0x00BD26 02:9D16: 8D 07 20
	INY							;C - - - - - 0x00BD29 02:9D19: C8
	CPY #$40					;C - - - - - 0x00BD2A 02:9D1A: C0 40
	BNE CODE_059D16				;C - - - - - 0x00BD2C 02:9D1C: D0 F8

	LDA #.LOBYTE(CODE_059D4B)		;C - - - - - 0x00BD2E 02:9D1E: A9 4B
	STA nmiBankedSub				;C - - - - - 0x00BD30 02:9D20: 85 16
	LDA #.HIBYTE(CODE_059D4B)		;C - - - - - 0x00BD32 02:9D22: A9 9D
	STA nmiBankedSub+1				;C - - - - - 0x00BD34 02:9D24: 85 17

	LDA bufPPUMASK				;C - - - - - 0x00BD36 02:9D26: A5 33
	ORA #$18					;C - - - - - 0x00BD38 02:9D28: 09 18
	STA bufPPUMASK				;C - - - - - 0x00BD3A 02:9D2A: 85 33
	STA PPUMASK				;C - - - - - 0x00BD3C 02:9D2C: 8D 01 20
	RTS							;C - - - - - 0x00BD3F 02:9D2F: 60

CODE_059D30:
	LDA bufPPUMASK				;C - - - - - 0x00BD40 02:9D30: A5 33
	AND #$E7					;C - - - - - 0x00BD42 02:9D32: 29 E7
	STA bufPPUMASK				;C - - - - - 0x00BD44 02:9D34: 85 33
	STA PPUMASK				;C - - - - - 0x00BD46 02:9D36: 8D 01 20

	LDA #.LOBYTE(CODE_059D4B)	;C - - - - - 0x00BD49 02:9D39: A9 4B
	STA nmiBankedSub			;C - - - - - 0x00BD4B 02:9D3B: 85 16
	LDA #.HIBYTE(CODE_059D4B)	;C - - - - - 0x00BD4D 02:9D3D: A9 9D
	STA nmiBankedSub+1			;C - - - - - 0x00BD4F 02:9D3F: 85 17
	LDA bufPPUMASK				;C - - - - - 0x00BD51 02:9D41: A5 33
	ORA #$18					;C - - - - - 0x00BD53 02:9D43: 09 18
	STA bufPPUMASK				;C - - - - - 0x00BD55 02:9D45: 85 33
	STA PPUMASK				;C - - - - - 0x00BD57 02:9D47: 8D 01 20
	RTS							;C - - - - - 0x00BD5A 02:9D4A: 60

CODE_059D4B:
	LDA #FADE_IN					;C - - - - - 0x00BD5B 02:9D4B: A9 01
	STA fadeMode				;C - - - - - 0x00BD5D 02:9D4D: 8D 53 05
	LDA #$2A					;C - - - - - 0x00BD60 02:9D50: A9 2A
	STA fadeUnk0556				;C - - - - - 0x00BD62 02:9D52: 8D 56 05
	LDA #$03					;C - - - - - 0x00BD65 02:9D55: A9 03
	STA fadeSpeedMask				;C - - - - - 0x00BD67 02:9D57: 8D 57 05
	LDA #.LOBYTE(palBossCaveUnfaded)					;C - - - - - 0x00BD6A 02:9D5A: A9 89
	STA fadeMaxColorsAdr				;C - - - - - 0x00BD6C 02:9D5C: 8D 58 05
	LDA #.HIBYTE(palBossCaveUnfaded)					;C - - - - - 0x00BD6F 02:9D5F: A9 9D
	STA fadeMaxColorsAdr+1				;C - - - - - 0x00BD71 02:9D61: 8D 59 05
	LDA #.LOBYTE(colorBuffer)					;C - - - - - 0x00BD74 02:9D64: A9 00
	STA fadeColorsAdr				;C - - - - - 0x00BD76 02:9D66: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)					;C - - - - - 0x00BD79 02:9D69: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x00BD7B 02:9D6B: 8D 5B 05
	LDA #4					;C - - - - - 0x00BD7E 02:9D6E: A9 04
	STA fadePasses				;C - - - - - 0x00BD80 02:9D70: 8D 54 05
	LDA #17					;C - - - - - 0x00BD83 02:9D73: A9 11
	STA fadeColorsAmount				;C - - - - - 0x00BD85 02:9D75: 8D 55 05

	LDA #.LOBYTE(CODE_059D9A)	;C - - - - - 0x00BD88 02:9D78: A9 9A
	STA updateSub				;C - - - - - 0x00BD8A 02:9D7A: 85 19
	LDA #.HIBYTE(CODE_059D9A)	;C - - - - - 0x00BD8C 02:9D7C: A9 9D
	STA updateSub+1				;C - - - - - 0x00BD8E 02:9D7E: 85 1A

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x00BD90 02:9D80: A9 50
	STA nmiBankedSub			;C - - - - - 0x00BD92 02:9D82: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x00BD94 02:9D84: A9 E8
	STA nmiBankedSub+1			;C - - - - - 0x00BD96 02:9D86: 85 17
	RTS							;C - - - - - 0x00BD98 02:9D88: 60

palBossCaveUnfaded:
	;Use this when fading in
	.byte $0F					;- D 0 - - - 0x00BD99 02:9D89: 0F
	.byte $2C					;- D 0 - - - 0x00BD9A 02:9D8A: 2C
	.byte $1C					;- D 0 - - - 0x00BD9B 02:9D8B: 1C
	.byte $0C					;- D 0 - - - 0x00BD9C 02:9D8C: 0C
	.byte $0F					;- D 0 - - - 0x00BD9D 02:9D8D: 0F
	.byte $2C					;- D 0 - - - 0x00BD9E 02:9D8E: 2C
	.byte $1C					;- D 0 - - - 0x00BD9F 02:9D8F: 1C
	.byte $0C					;- D 0 - - - 0x00BDA0 02:9D90: 0C
	.byte $0F					;- D 0 - - - 0x00BDA1 02:9D91: 0F
	.byte $2C					;- D 0 - - - 0x00BDA2 02:9D92: 2C
	.byte $1C					;- D 0 - - - 0x00BDA3 02:9D93: 1C
	.byte $0C					;- D 0 - - - 0x00BDA4 02:9D94: 0C
	.byte $0F					;- D 0 - - - 0x00BDA5 02:9D95: 0F
	.byte $30					;- D 0 - - - 0x00BDA6 02:9D96: 30
	.byte $16					;- D 0 - - - 0x00BDA7 02:9D97: 16
	.byte $0C					;- D 0 - - - 0x00BDA8 02:9D98: 0C
	.byte $0F					;- D 0 - - - 0x00BDA9 02:9D99: 0F

CODE_059D9A:
	LDA #.BANK(CODE_0884AB)					;C - - - - - 0x00BDAA 02:9D9A: A9 08
	STA nmiPrgBankA				;C - - - - - 0x00BDAC 02:9D9C: 85 51
	LDA #.LOBYTE(CODE_0884AB)	;C - - - - - 0x00BDAE 02:9D9E: A9 AB
	STA nmiBankedSub			;C - - - - - 0x00BDB0 02:9DA0: 85 16
	LDA #.HIBYTE(CODE_0884AB)	;C - - - - - 0x00BDB2 02:9DA2: A9 84
	STA nmiBankedSub+1			;C - - - - - 0x00BDB4 02:9DA4: 85 17
	LDA #$00					;C - - - - - 0x00BDB6 02:9DA6: A9 00
	STA roundNumberDuration				;C - - - - - 0x00BDB8 02:9DA8: 8D 73 04
	LDA #.BANK(CODE_08856D)					;C - - - - - 0x00BDBB 02:9DAB: A9 08
	STA updateSubBankA			;C - - - - - 0x00BDBD 02:9DAD: 85 18
	LDA #.LOBYTE(CODE_08856D)	;C - - - - - 0x00BDBF 02:9DAF: A9 6D
	STA updateSub				;C - - - - - 0x00BDC1 02:9DB1: 85 19
	LDA #.HIBYTE(CODE_08856D)	;C - - - - - 0x00BDC3 02:9DB3: A9 85
	STA updateSub+1				;C - - - - - 0x00BDC5 02:9DB5: 85 1A
	RTS							;C - - - - - 0x00BDC7 02:9DB7: 60

CODE_059DB8:
	LDA #$01					;C - - - - - 0x00BDC8 02:9DB8: A9 01
	STA enteringRound				;C - - - - - 0x00BDCA 02:9DBA: 85 37
	LDA vNametable				;C - - - - - 0x00BDCC 02:9DBC: A5 2D
	ASL							;C - - - - - 0x00BDCE 02:9DBE: 0A
	ASL							;C - - - - - 0x00BDCF 02:9DBF: 0A
	ASL							;C - - - - - 0x00BDD0 02:9DC0: 0A
	STA scratch0				;C - - - - - 0x00BDD1 02:9DC1: 85 00
	LDA currentRound				;C - - - - - 0x00BDD3 02:9DC3: A5 D8
	CMP #20						;C - - - - - 0x00BDD5 02:9DC5: C9 14
	BNE CODE_059DCD				;C - - - - - 0x00BDD7 02:9DC7: D0 04
		LDA #$04					;C - - - - - 0x00BDD9 02:9DC9: A9 04
		STA scratch0				;C - - - - - 0x00BDDB 02:9DCB: 85 00
CODE_059DCD:
	LDA #$02					;C - - - - - 0x00BDDD 02:9DCD: A9 02
	STA mapTargetAdr				;C - - - - - 0x00BDDF 02:9DCF: 85 49
	LDA #$20					;C - - - - - 0x00BDE1 02:9DD1: A9 20
	ORA scratch0				;C - - - - - 0x00BDE3 02:9DD3: 05 00
	STA mapTargetAdr+1				;C - - - - - 0x00BDE5 02:9DD5: 85 4A
	LDA #$C0					;C - - - - - 0x00BDE7 02:9DD7: A9 C0
	STA ram_03AA				;C - - - - - 0x00BDE9 02:9DD9: 8D AA 03
	LDA #$23					;C - - - - - 0x00BDEC 02:9DDC: A9 23
	ORA scratch0				;C - - - - - 0x00BDEE 02:9DDE: 05 00
	STA ram_03AB				;C - - - - - 0x00BDF0 02:9DE0: 8D AB 03
	JSR CODE_059EE4				;C - - - - - 0x00BDF3 02:9DE3: 20 E4 9E

	LDA #.LOBYTE(CODE_0FE93B)	;C - - - - - 0x00BDF6 02:9DE6: A9 3B
	STA nmiUnbankedSub				;C - - - - - 0x00BDF8 02:9DE8: 85 35
	LDA #.HIBYTE(CODE_0FE93B)	;C - - - - - 0x00BDFA 02:9DEA: A9 E9
	STA nmiUnbankedSub+1				;C - - - - - 0x00BDFC 02:9DEC: 85 36

	LDA #.LOBYTE(CODE_059DFB)	;C - - - - - 0x00BDFE 02:9DEE: A9 FB
	STA nmiBankedSub			;C - - - - - 0x00BE00 02:9DF0: 85 16
	LDA #.HIBYTE(CODE_059DFB)	;C - - - - - 0x00BE02 02:9DF2: A9 9D
	STA nmiBankedSub+1			;C - - - - - 0x00BE04 02:9DF4: 85 17
	RTS							;C - - - - - 0x00BE06 02:9DF6: 60

DATA_059DF7:
	.byte $00					;- D 0 - - - 0x00BE07 02:9DF7: 00
	.byte $80					;- D 0 - - - 0x00BE08 02:9DF8: 80

DATA_059DF9:
	.byte $00					;- D 0 - - - 0x00BE09 02:9DF9: 00
	.byte $80					;- D 0 - - - 0x00BE0A 02:9DFA: 80

CODE_059DFB:
	LDA vNametable				;C - - - - - 0x00BE0B 02:9DFB: A5 2D
	ASL							;C - - - - - 0x00BE0D 02:9DFD: 0A
	ASL							;C - - - - - 0x00BE0E 02:9DFE: 0A
	ASL							;C - - - - - 0x00BE0F 02:9DFF: 0A
	STA scratch0				;C - - - - - 0x00BE10 02:9E00: 85 00
	LDA currentRound				;C - - - - - 0x00BE12 02:9E02: A5 D8
	CMP #20					;C - - - - - 0x00BE14 02:9E04: C9 14
	BNE CODE_059E0C				;C - - - - - 0x00BE16 02:9E06: D0 04
		LDA #$04					;C - - - - - 0x00BE18 02:9E08: A9 04
		STA scratch0				;C - - - - - 0x00BE1A 02:9E0A: 85 00
CODE_059E0C:
	LDA #$42					;C - - - - - 0x00BE1C 02:9E0C: A9 42
	STA mapTargetAdr				;C - - - - - 0x00BE1E 02:9E0E: 85 49
	LDA #$20					;C - - - - - 0x00BE20 02:9E10: A9 20
	ORA scratch0				;C - - - - - 0x00BE22 02:9E12: 05 00
	STA mapTargetAdr+1				;C - - - - - 0x00BE24 02:9E14: 85 4A
	LDA #$C0					;C - - - - - 0x00BE26 02:9E16: A9 C0
	STA ram_03AA				;C - - - - - 0x00BE28 02:9E18: 8D AA 03
	LDA #$23					;C - - - - - 0x00BE2B 02:9E1B: A9 23
	ORA scratch0				;C - - - - - 0x00BE2D 02:9E1D: 05 00
	STA ram_03AB				;C - - - - - 0x00BE2F 02:9E1F: 8D AB 03
	JSR CODE_059EE4				;C - - - - - 0x00BE32 02:9E22: 20 E4 9E
	LDX vNametable				;C - - - - - 0x00BE35 02:9E25: A6 2D
	LDA DATA_059DF9,X			;C - - - - - 0x00BE37 02:9E27: BD F9 9D
	STA scratch0				;C - - - - - 0x00BE3A 02:9E2A: 85 00
	LDA #$5C					;C - - - - - 0x00BE3C 02:9E2C: A9 5C
	CLC							;C - - - - - 0x00BE3E 02:9E2E: 18
	ADC scratch0				;C - - - - - 0x00BE3F 02:9E2F: 65 00
	STA mapBuffer+4				;C - - - - - 0x00BE41 02:9E31: 8D 6C 03
	CLC							;C - - - - - 0x00BE44 02:9E34: 18
	ADC #$01					;C - - - - - 0x00BE45 02:9E35: 69 01
	STA mapBuffer+32+4				;C - - - - - 0x00BE47 02:9E37: 8D 8C 03
	LDA #chrThunder_ID					;C - - - - - 0x00BE4A 02:9E3A: A9 50
	STA chrBankD				;C - - - - - 0x00BE4C 02:9E3C: 85 4E
	LDA #$01					;C - - - - - 0x00BE4E 02:9E3E: A9 01
	STA objState+OSLOT_ICON				;C - - - - - 0x00BE50 02:9E40: 8D 76 05
	LDA #$17					;C - - - - - 0x00BE53 02:9E43: A9 17
	STA objY+OSLOT_ICON				;C - - - - - 0x00BE55 02:9E45: 8D 9E 05
	LDA #$26					;C - - - - - 0x00BE58 02:9E48: A9 26
	STA objX+OSLOT_ICON				;C - - - - - 0x00BE5A 02:9E4A: 8D C6 05
	LDA #.LOBYTE(anJrDoll_ID)					;C - - - - - 0x00BE5D 02:9E4D: A9 19
	STA objAnim+OSLOT_ICON				;C - - - - - 0x00BE5F 02:9E4F: 8D 8E 06
	LDA #.HIBYTE(anJrDoll_ID)					;C - - - - - 0x00BE62 02:9E52: A9 01
	STA objAnimHI+OSLOT_ICON				;C - - - - - 0x00BE64 02:9E54: 8D 2E 07
	LDA #$01					;C - - - - - 0x00BE67 02:9E57: A9 01
	STA objChrSlot+OSLOT_ICON				;C - - - - - 0x00BE69 02:9E59: 8D 3E 06
	LDA #$00					;C - - - - - 0x00BE6C 02:9E5C: A9 00
	STA objAnimProgress+OSLOT_ICON				;C - - - - - 0x00BE6E 02:9E5E: 8D DE 06
	STA objAnimTimer+OSLOT_ICON				;C - - - - - 0x00BE71 02:9E61: 8D B6 06

	LDA #.LOBYTE(CODE_0FE93B)	;C - - - - - 0x00BE74 02:9E64: A9 3B
	STA nmiUnbankedSub				;C - - - - - 0x00BE76 02:9E66: 85 35
	LDA #.HIBYTE(CODE_0FE93B)	;C - - - - - 0x00BE78 02:9E68: A9 E9
	STA nmiUnbankedSub+1				;C - - - - - 0x00BE7A 02:9E6A: 85 36

	LDA #.LOBYTE(CODE_059E75)	;C - - - - - 0x00BE7C 02:9E6C: A9 75
	STA nmiBankedSub			;C - - - - - 0x00BE7E 02:9E6E: 85 16
	LDA #.HIBYTE(CODE_059E75)	;C - - - - - 0x00BE80 02:9E70: A9 9E
	STA nmiBankedSub+1			;C - - - - - 0x00BE82 02:9E72: 85 17
	RTS							;C - - - - - 0x00BE84 02:9E74: 60

CODE_059E75:
	LDA #.LOBYTE(CODE_099BE7)					;C - - - - - 0x00BE85 02:9E75: A9 E7
	STA bankedSub				;C - - - - - 0x00BE87 02:9E77: 85 55
	LDA #.HIBYTE(CODE_099BE7)					;C - - - - - 0x00BE89 02:9E79: A9 9B
	STA bankedSub+1				;C - - - - - 0x00BE8B 02:9E7B: 85 56
	LDA #.BANK(CODE_099BE7)					;C - - - - - 0x00BE8D 02:9E7D: A9 09
	STA bankedSubBank				;C - - - - - 0x00BE8F 02:9E7F: 85 57
	LDA #.BANK(*)					;C - - - - - 0x00BE91 02:9E81: A9 05
	STA bankedSubRetBank				;C - - - - - 0x00BE93 02:9E83: 85 58
	JSR RunBankedSub				;C - - - - - 0x00BE95 02:9E85: 20 72 E7

	LDA livesCurrentPos				;C - - - - - 0x00BE98 02:9E88: AD 98 04
	BNE CODE_059E95				;C - - - - - 0x00BE9B 02:9E8B: D0 08
		LDA #.LOBYTE(CODE_059E96)	;C - - - - - 0x00BE9D 02:9E8D: A9 96
		STA nmiBankedSub			;C - - - - - 0x00BE9F 02:9E8F: 85 16
		LDA #.HIBYTE(CODE_059E96)	;C - - - - - 0x00BEA1 02:9E91: A9 9E
		STA nmiBankedSub+1			;C - - - - - 0x00BEA3 02:9E93: 85 17
CODE_059E95:
	RTS							;C - - - - - 0x00BEA5 02:9E95: 60

CODE_059E96:
	LDA #.LOBYTE(ColorBufferToVRAM)	;C - - - - - 0x00BEA6 02:9E96: A9 8A
	STA nmiUnbankedSub			;C - - - - - 0x00BEA8 02:9E98: 85 35
	LDA #.HIBYTE(ColorBufferToVRAM)	;C - - - - - 0x00BEAA 02:9E9A: A9 E3
	STA nmiUnbankedSub+1				;C - - - - - 0x00BEAC 02:9E9C: 85 36

	LDA updateSubBankA				;C - - - - - 0x00BEAE 02:9E9E: A5 18
	STA nmiPrgBankA				;C - - - - - 0x00BEB0 02:9EA0: 85 51
	LDA updateSub				;C - - - - - 0x00BEB2 02:9EA2: A5 19
	STA nmiBankedSub				;C - - - - - 0x00BEB4 02:9EA4: 85 16
	LDA updateSub+1				;C - - - - - 0x00BEB6 02:9EA6: A5 1A
	STA nmiBankedSub+1				;C - - - - - 0x00BEB8 02:9EA8: 85 17

	LDA #$00					;C - - - - - 0x00BEBA 02:9EAA: A9 00
	STA enteringRound				;C - - - - - 0x00BEBC 02:9EAC: 85 37
	RTS							;C - - - - - 0x00BEBE 02:9EAE: 60

CODE_059EAF:
	LDA vNametable				;C - - - - - 0x00BEBF 02:9EAF: A5 2D
	ASL							;C - - - - - 0x00BEC1 02:9EB1: 0A
	ASL							;C - - - - - 0x00BEC2 02:9EB2: 0A
	ASL							;C - - - - - 0x00BEC3 02:9EB3: 0A
	STA scratch0				;C - - - - - 0x00BEC4 02:9EB4: 85 00
	LDA #$42					;C - - - - - 0x00BEC6 02:9EB6: A9 42
	STA mapTargetAdr				;C - - - - - 0x00BEC8 02:9EB8: 85 49
	LDA #$20					;C - - - - - 0x00BECA 02:9EBA: A9 20
	ORA scratch0				;C - - - - - 0x00BECC 02:9EBC: 05 00
	STA mapTargetAdr+1				;C - - - - - 0x00BECE 02:9EBE: 85 4A
	LDA #$C0					;C - - - - - 0x00BED0 02:9EC0: A9 C0
	STA ram_03AA				;C - - - - - 0x00BED2 02:9EC2: 8D AA 03
	LDA #$23					;C - - - - - 0x00BED5 02:9EC5: A9 23
	ORA scratch0				;C - - - - - 0x00BED7 02:9EC7: 05 00
	STA ram_03AB				;C - - - - - 0x00BED9 02:9EC9: 8D AB 03
	JSR CODE_059EE4				;C - - - - - 0x00BEDC 02:9ECC: 20 E4 9E

	LDA #.LOBYTE(CODE_0FE93B)	;C - - - - - 0x00BEDF 02:9ECF: A9 3B
	STA nmiUnbankedSub				;C - - - - - 0x00BEE1 02:9ED1: 85 35
	LDA #.HIBYTE(CODE_0FE93B)	;C - - - - - 0x00BEE3 02:9ED3: A9 E9
	STA nmiUnbankedSub+1				;C - - - - - 0x00BEE5 02:9ED5: 85 36

	LDA updateSubBankA				;C - - - - - 0x00BEE7 02:9ED7: A5 18
	STA nmiPrgBankA				;C - - - - - 0x00BEE9 02:9ED9: 85 51
	LDA updateSub				;C - - - - - 0x00BEEB 02:9EDB: A5 19
	STA nmiBankedSub				;C - - - - - 0x00BEED 02:9EDD: 85 16
	LDA updateSub+1				;C - - - - - 0x00BEEF 02:9EDF: A5 1A
	STA nmiBankedSub+1				;C - - - - - 0x00BEF1 02:9EE1: 85 17
	RTS							;C - - - - - 0x00BEF3 02:9EE3: 60

CODE_059EE4:
	LDA #.BANK(RoundHUDChrBanks)					;C - - - - - 0x00BEF4 02:9EE4: A9 04
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x00BEF6 02:9EE6: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x00BEF8 02:9EE8: 20 56 FF
.endif

	LDX vNametable				;C - - - - - 0x00BEFB 02:9EEB: A6 2D
	LDY currentRound				;C - - - - - 0x00BEFD 02:9EED: A4 D8

	LDA RoundHUDChrBanks,Y			;C - - - - - 0x00BEFF 02:9EEF: B9 6F BC
	STA chrBankA,X				;C - - - - - 0x00BF02 02:9EF2: 95 4B

	LDA DATA_059DF9,X			;C - - - - - 0x00BF04 02:9EF4: BD F9 9D
	STA scratch0				;C - - - - - 0x00BF07 02:9EF7: 85 00

	LDA RoundHUDBlankTileIndexes,Y			;C - - - - - 0x00BF09 02:9EF9: B9 C4 BC
	CLC							;C - - - - - 0x00BF0C 02:9EFC: 18
	ADC vNametable				;C - - - - - 0x00BF0D 02:9EFD: 65 2D
	TAX							;C - - - - - 0x00BF0F 02:9EFF: AA

	LDY #$00					;C - - - - - 0x00BF10 02:9F00: A0 00
	LDX vNametable				;C - - - - - 0x00BF12 02:9F02: A6 2D
	LDA HUDBlankTiles,X			;C - - - - - 0x00BF14 02:9F04: BD 19 BD
CODE_059F07:
	STA mapBuffer,Y				;C - - - - - 0x00BF17 02:9F07: 99 68 03
	STA mapBuffer+32,Y				;C - - - - - 0x00BF1A 02:9F0A: 99 88 03
	INY							;C - - - - - 0x00BF1D 02:9F0D: C8
	CPY #28						;C - - - - - 0x00BF1E 02:9F0E: C0 1C
	BNE CODE_059F07				;C - - - - - 0x00BF20 02:9F10: D0 F5

	LDA #$00					;C - - - - - 0x00BF22 02:9F12: A9 00
	STA mapBuffer,Y				;C - - - - - 0x00BF24 02:9F14: 99 68 03
	STA mapBuffer+32,Y				;C - - - - - 0x00BF27 02:9F17: 99 88 03

	LDY DATA_059DF7,X			;C - - - - - 0x00BF2A 02:9F1A: BC F7 9D
	STY ram_03AF				;C - - - - - 0x00BF2D 02:9F1D: 8C AF 03
	LDX #$00					;C - - - - - 0x00BF30 02:9F20: A2 00
	LDA ram_03B1,Y				;C - - - - - 0x00BF32 02:9F22: B9 B1 03
	ORA #$CC					;C - - - - - 0x00BF35 02:9F25: 09 CC
	STA ram_03B1,Y				;C - - - - - 0x00BF37 02:9F27: 99 B1 03
CODE_059F2A:
	INY							;C - - - - - 0x00BF3A 02:9F2A: C8
	LDA ram_03B1,Y				;C - - - - - 0x00BF3B 02:9F2B: B9 B1 03
	ORA #$FF					;C - - - - - 0x00BF3E 02:9F2E: 09 FF
	STA ram_03B1,Y				;C - - - - - 0x00BF40 02:9F30: 99 B1 03
	INX							;C - - - - - 0x00BF43 02:9F33: E8
	CPX #$06					;C - - - - - 0x00BF44 02:9F34: E0 06
	BNE CODE_059F2A				;C - - - - - 0x00BF46 02:9F36: D0 F2

	INY							;C - - - - - 0x00BF48 02:9F38: C8
	LDA ram_03B1,Y				;C - - - - - 0x00BF49 02:9F39: B9 B1 03
	ORA #$33					;C - - - - - 0x00BF4C 02:9F3C: 09 33
	STA ram_03B1,Y				;C - - - - - 0x00BF4E 02:9F3E: 99 B1 03
	INY							;C - - - - - 0x00BF51 02:9F41: C8
	STY ram_03AE				;C - - - - - 0x00BF52 02:9F42: 8C AE 03
	LDA #$03					;C - - - - - 0x00BF55 02:9F45: A9 03
	STA livesCurrentPos				;C - - - - - 0x00BF57 02:9F47: 8D 98 04

.ifdef REGION_JP
	LDA nmiPrgBankB					;- - - - - - 0x00C003 02:9FF3: A5
	STA prgBankB					;- - - - - - 0x00C005 02:9FF5: 85
	STA $8001					;- - - - - - 0x00C007 02:9FF7: 8D
.endif
	RTS							;C - - - - - 0x00BF5A 02:9F4A: 60

.ifdef REGION_JP
;Filler data
	;- - - - - - 0x00C00B 02:9FFB: 04
	.incbin "filler/fill05_JP.bin"
.else
DATA_059F4B:
	;Unreached
	.byte $03					;- - - - - - 0x00BF5B 02:9F4B: 03
CODE_059F4C:
	;Unreached
	INY							;- - - - - - 0x00BF5C 02:9F4C: C8
	STY ram_03AE				;- - - - - - 0x00BF5D 02:9F4D: 8C
	LDA #$03					;- - - - - - 0x00BF60 02:9F50: A9
	STA livesCurrentPos				;- - - - - - 0x00BF62 02:9F52: 8D
	RTS							;- - - - - - 0x00BF65 02:9F55: 60
.endif