.segment "PRG_BANK_F"
; 0x01E010-0x02000F

;Contents: Main engine, Startup, Interrupt handlers, Enemy hitboxes

Begin:
	SEI							;C - - - - - 0x01E010 07:E000: 78
CODE_0FE001:
	LDA #PPU_NAMETABLE_2800|PPU_OBJTABLE_1000|PPU_OBJ_8X16		;C - - - - - 0x01E011 07:E001: A9 2A
	STA bufPPUCTRL				;C - - - - - 0x01E013 07:E003: 85 32
	LDA bufPPUCTRL				;C - - - - - 0x01E015 07:E005: A5 32
	AND #~PPU_NMI			;C - - - - - 0x01E017 07:E007: 29 7F
	STA bufPPUCTRL				;C - - - - - 0x01E019 07:E009: 85 32
	STA PPUCTRL					;C - - - - - 0x01E01B 07:E00B: 8D 00 20

	CLD							;C - - - - - 0x01E01E 07:E00E: D8
	LDX #$00					;C - - - - - 0x01E01F 07:E00F: A2 00
	DEX							;C - - - - - 0x01E021 07:E011: CA
	TXS							;C - - - - - 0x01E022 07:E012: 9A
	LDY #$00					;C - - - - - 0x01E023 07:E013: A0 00
	LDX #$00					;C - - - - - 0x01E025 07:E015: A2 00
CODE_0FE017:
	NOP							;C - - - - - 0x01E027 07:E017: EA
	NOP							;C - - - - - 0x01E028 07:E018: EA
	DEX							;C - - - - - 0x01E029 07:E019: CA
	BNE CODE_0FE017				;C - - - - - 0x01E02A 07:E01A: D0 FB

	DEY							;C - - - - - 0x01E02C 07:E01C: 88
	BNE CODE_0FE017				;C - - - - - 0x01E02D 07:E01D: D0 F8

	LDX #$02					;C - - - - - 0x01E02F 07:E01F: A2 02
CODE_0FE021:
	BIT PPUSTATUS				;C - - - - - 0x01E031 07:E021: 2C 02 20
	BPL CODE_0FE021				;C - - - - - 0x01E034 07:E024: 10 FB

CODE_0FE026:
	BIT PPUSTATUS				;C - - - - - 0x01E036 07:E026: 2C 02 20
	BMI CODE_0FE026				;C - - - - - 0x01E039 07:E029: 30 FB

	DEX							;C - - - - - 0x01E03B 07:E02B: CA
	BNE CODE_0FE021				;C - - - - - 0x01E03C 07:E02C: D0 F3

	LDA #PPU_LEFTBG			;C - - - - - 0x01E03E 07:E02E: A9 02
	STA bufPPUMASK				;C - - - - - 0x01E040 07:E030: 85 33
	LDA bufPPUMASK				;C - - - - - 0x01E042 07:E032: A5 33
	AND #~(PPU_BG|PPU_OBJ)	;C - - - - - 0x01E044 07:E034: 29 E7
	STA bufPPUMASK				;C - - - - - 0x01E046 07:E036: 85 33
	STA PPUMASK					;C - - - - - 0x01E048 07:E038: 8D 01 20

	;Initialize memory, register StartTaitoLogo to advance from there
	JSR MemInit					;C - - - - - 0x01E04B 07:E03B: 20 99 E0

	LDA #.BANK(AdditionalTracks)					;C - - - - - 0x01E04E 07:E03E: A9 0D
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x01E050 07:E040: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x01E052 07:E042: 20 56 FF
.endif

	JSR AudioInit				;C - - - - - 0x01E055 07:E045: 20 06 C0

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif

	LDA #snSilence_ID					;C - - - - - 0x01E058 07:E048: A9 00
	STA a:soundTrigger			;C - - - - - 0x01E05A 07:E04A: 8D E1 00
	LDA #trSilence_ID					;C - - - - - 0x01E05D 07:E04D: A9 00
	STA a:musicTrigger			;C - - - - - 0x01E05F 07:E04F: 8D E0 00

	LDA PPUSTATUS				;C - - - - - 0x01E062 07:E052: AD 02 20
	LDA hScroll					;C - - - - - 0x01E065 07:E055: A5 2B
	STA PPUSCROLL				;C - - - - - 0x01E067 07:E057: 8D 05 20
	LDA vScroll					;C - - - - - 0x01E06A 07:E05A: A5 29
	STA PPUSCROLL				;C - - - - - 0x01E06C 07:E05C: 8D 05 20

	LDA bufPPUCTRL				;C - - - - - 0x01E06F 07:E05F: A5 32
	STA PPUCTRL					;C - - - - - 0x01E071 07:E061: 8D 00 20

	LDA #.LOBYTE(DummyIRQSub)	;C - - - - - 0x01E074 07:E064: A9 45
	STA irqSub					;C - - - - - 0x01E076 07:E066: 85 1B
	LDA #.HIBYTE(DummyIRQSub)	;C - - - - - 0x01E078 07:E068: A9 E1
	STA irqSub+1				;C - - - - - 0x01E07A 07:E06A: 85 1C

	LDA #$01					;C - - - - - 0x01E07C 07:E06C: A9 01
.ifdef REGION_JP
	STA $C003
	STA $C003
.else
	STA $E000					;C - - - - - 0x01E07E 07:E06E: 8D 00 E0
	STA $E000					;C - - - - - 0x01E081 07:E071: 8D 00 E0
.endif

	LDA bufPPUCTRL				;C - - - - - 0x01E084 07:E074: A5 32
	ORA #PPU_NMI			;C - - - - - 0x01E086 07:E076: 09 80
	STA bufPPUCTRL				;C - - - - - 0x01E088 07:E078: 85 32
	STA PPUCTRL					;C - - - - - 0x01E08A 07:E07A: 8D 00 20
	CLI							;C - - - - - 0x01E08D 07:E07D: 58
CODE_0FE07E:
	JMP CODE_0FE07E				;C - - - - - 0x01E08E 07:E07E: 4C 7E E0

CODE_0FE081:
	;Unreached
	LDA bufPPUMASK				;- - - - - - 0x01E091 07:E081: A5
	AND #~(PPU_BG|PPU_OBJ)	;- - - - - - 0x01E093 07:E083: 29
	STA bufPPUMASK				;- - - - - - 0x01E095 07:E085: 85
	STA PPUMASK					;- - - - - - 0x01E097 07:E087: 8D

	LDX #$28					;- - - - - - 0x01E09A 07:E08A: A2
CODE_0FE08C:
	DEX							;- - - - - - 0x01E09C 07:E08C: CA
	BNE CODE_0FE08C				;- - - - - - 0x01E09D 07:E08D: D0

	LDA bufPPUMASK				;- - - - - - 0x01E09F 07:E08F: A5
	ORA #PPU_BG|PPU_OBJ	;- - - - - - 0x01E0A1 07:E091: 09
	STA bufPPUMASK				;- - - - - - 0x01E0A3 07:E093: 85
	STA PPUMASK					;- - - - - - 0x01E0A5 07:E095: 8D
	RTS							;- - - - - - 0x01E0A8 07:E098: 60

MemInit:
	LDA bufPPUCTRL				;C - - - - - 0x01E0A9 07:E099: A5 32
	PHA							;C - - - - - 0x01E0AB 07:E09B: 48
	LDA bufPPUMASK				;C - - - - - 0x01E0AC 07:E09C: A5 33
	PHA							;C - - - - - 0x01E0AE 07:E09E: 48

	LDA #$00					;C - - - - - 0x01E0AF 07:E09F: A9 00
	LDX #$00					;C - - - - - 0x01E0B1 07:E0A1: A2 00
CODE_0FE0A3:
	;Clear zero page
	STA a:$0000,X				;C - - - - - 0x01E0B3 07:E0A3: 9D 00 00
	INX							;C - - - - - 0x01E0B6 07:E0A6: E8
	BNE CODE_0FE0A3				;C - - - - - 0x01E0B7 07:E0A7: D0 FA

	PLA							;C - - - - - 0x01E0B9 07:E0A9: 68
	STA bufPPUMASK				;C - - - - - 0x01E0BA 07:E0AA: 85 33
	PLA							;C - - - - - 0x01E0BC 07:E0AC: 68
	STA bufPPUCTRL				;C - - - - - 0x01E0BD 07:E0AD: 85 32

	LDA #$00					;C - - - - - 0x01E0BF 07:E0AF: A9 00
	LDX #$00					;C - - - - - 0x01E0C1 07:E0B1: A2 00
CODE_0FE0B3:
	STA a:$0200,X				;C - - - - - 0x01E0C3 07:E0B3: 9D 00 02
	STA a:$0300,X				;C - - - - - 0x01E0C6 07:E0B6: 9D 00 03
	STA a:$0400,X				;C - - - - - 0x01E0C9 07:E0B9: 9D 00 04
	STA a:$0500,X				;C - - - - - 0x01E0CC 07:E0BC: 9D 00 05
	STA a:$0600,X				;C - - - - - 0x01E0CF 07:E0BF: 9D 00 06
	STA a:$0700,X				;C - - - - - 0x01E0D2 07:E0C2: 9D 00 07
	INX							;C - - - - - 0x01E0D5 07:E0C5: E8
	BNE CODE_0FE0B3				;C - - - - - 0x01E0D6 07:E0C6: D0 EB

	JSR PPUInit				;C - - - - - 0x01E0D8 07:E0C8: 20 FA E0
	LDX #$1F					;C - - - - - 0x01E0DB 07:E0CB: A2 1F
CODE_0FE0CD:
	LDA #$0F					;C - - - - - 0x01E0DD 07:E0CD: A9 0F
	STA colorBuffer,X				;C - - - - - 0x01E0DF 07:E0CF: 9D 00 03
	DEX							;C - - - - - 0x01E0E2 07:E0D2: CA
	BPL CODE_0FE0CD				;C - - - - - 0x01E0E3 07:E0D3: 10 F8

	LDX #$00					;C - - - - - 0x01E0E5 07:E0D5: A2 00
CODE_0FE0D7:
	LDA InitialBanks,X			;C - - - - - 0x01E0E7 07:E0D7: BD F2 E0
	STA chrBankA,X				;C - - - - - 0x01E0EA 07:E0DA: 95 4B
	INX							;C - - - - - 0x01E0EC 07:E0DC: E8
	CPX #8					;C - - - - - 0x01E0ED 07:E0DD: E0 08
	BNE CODE_0FE0D7				;C - - - - - 0x01E0EF 07:E0DF: D0 F6

	LDA #.LOBYTE(StartTaitoLogo)	;C - - - - - 0x01E0F1 07:E0E1: A9 00
	STA nmiBankedSub			;C - - - - - 0x01E0F3 07:E0E3: 85 16
	LDA #.HIBYTE(StartTaitoLogo)	;C - - - - - 0x01E0F5 07:E0E5: A9 80
	STA nmiBankedSub+1			;C - - - - - 0x01E0F7 07:E0E7: 85 17

	LDA #.LOBYTE(ColorBufferToVRAM)	;C - - - - - 0x01E0F9 07:E0E9: A9 8A
	STA nmiUnbankedSub			;C - - - - - 0x01E0FB 07:E0EB: 85 35
	LDA #.HIBYTE(ColorBufferToVRAM)	;C - - - - - 0x01E0FD 07:E0ED: A9 E3
	STA nmiUnbankedSub+1		;C - - - - - 0x01E0FF 07:E0EF: 85 36
	RTS							;C - - - - - 0x01E101 07:E0F1: 60

InitialBanks:
	;CHR
	.byte chrOldTitle_A_ID					;- D 0 - - - 0x01E102 07:E0F2: 00
	.byte chrTaito_A_ID					;- D 0 - - - 0x01E103 07:E0F3: 04
	.byte $00					;- D 0 - - - 0x01E104 07:E0F4: 00
	.byte $00					;- D 0 - - - 0x01E105 07:E0F5: 00
	.byte $00					;- D 0 - - - 0x01E106 07:E0F6: 00
	.byte $00					;- D 0 - - - 0x01E107 07:E0F7: 00
	;PRG
	.byte .BANK(StartTaitoLogo)					;- D 0 - - - 0x01E108 07:E0F8: 05
	.byte $00					;- D 0 - - - 0x01E109 07:E0F9: 00

PPUInit:
	LDA bufPPUCTRL				;C - - - - - 0x01E10A 07:E0FA: A5 32
	ORA #PPU_OBJTABLE_1000	;C - - - - - 0x01E10C 07:E0FC: 09 08
	STA bufPPUCTRL				;C - - - - - 0x01E10E 07:E0FE: 85 32
	STA PPUCTRL				;C - - - - - 0x01E110 07:E100: 8D 00 20

	LDA bufPPUMASK				;C - - - - - 0x01E113 07:E103: A5 33
	LDA #PPU_LEFTBG|PPU_LEFTOBJ		;C - - - - - 0x01E115 07:E105: A9 06
	STA bufPPUMASK				;C - - - - - 0x01E117 07:E107: 85 33
	STA PPUMASK				;C - - - - - 0x01E119 07:E109: 8D 01 20

	LDA #$20					;C - - - - - 0x01E11C 07:E10C: A9 20
	LDX #$03					;C - - - - - 0x01E11E 07:E10E: A2 03
	LDY #$FF					;C - - - - - 0x01E120 07:E110: A0 FF
	JSR CODE_0FE31C				;C - - - - - 0x01E122 07:E112: 20 1C E3

	LDA #$24					;C - - - - - 0x01E125 07:E115: A9 24
	LDX #$03					;C - - - - - 0x01E127 07:E117: A2 03
	LDY #$FF					;C - - - - - 0x01E129 07:E119: A0 FF
	JSR CODE_0FE31C				;C - - - - - 0x01E12B 07:E11B: 20 1C E3

	LDA PPUSTATUS				;C - - - - - 0x01E12E 07:E11E: AD 02 20
	LDA #$3F					;C - - - - - 0x01E131 07:E121: A9 3F
	STA PPUADDR				;C - - - - - 0x01E133 07:E123: 8D 06 20
	LDA #$00					;C - - - - - 0x01E136 07:E126: A9 00
	STA PPUADDR				;C - - - - - 0x01E138 07:E128: 8D 06 20
	STA PPUADDR				;C - - - - - 0x01E13B 07:E12B: 8D 06 20
	STA PPUADDR				;C - - - - - 0x01E13E 07:E12E: 8D 06 20
	RTS							;C - - - - - 0x01E141 07:E131: 60

IRQHandler:
	PHA							;C - - - - - 0x01E142 07:E132: 48
	TXA							;C - - - - - 0x01E143 07:E133: 8A
	PHA							;C - - - - - 0x01E144 07:E134: 48
	TYA							;C - - - - - 0x01E145 07:E135: 98
	PHA							;C - - - - - 0x01E146 07:E136: 48

	LDA #$01					;C - - - - - 0x01E147 07:E137: A9 01
.ifdef REGION_JP
	STA $C003
.else
	STA $E000					;C - - - - - 0x01E149 07:E139: 8D 00 E0
.endif
	JMP (irqSub)				;C - - - - - 0x01E14C 07:E13C: 6C 1B 00
IRQSubRet:
	PLA							;C - - - - - 0x01E14F 07:E13F: 68
	TAY							;C - - - - - 0x01E150 07:E140: A8
	PLA							;C - - - - - 0x01E151 07:E141: 68
	TAX							;C - - - - - 0x01E152 07:E142: AA
	PLA							;C - - - - - 0x01E153 07:E143: 68
	RTI							;C - - - - - 0x01E154 07:E144: 40

DummyIRQSub:
	;Unreached
	JMP IRQSubRet					;- - - - - - 0x01E155 07:E145: 4C

NMIHandler:
	SEI							;C - - - - - 0x01E158 07:E148: 78
	PHA							;C - - - - - 0x01E159 07:E149: 48
	TXA							;C - - - - - 0x01E15A 07:E14A: 8A
	PHA							;C - - - - - 0x01E15B 07:E14B: 48
	TYA							;C - - - - - 0x01E15C 07:E14C: 98
	PHA							;C - - - - - 0x01E15D 07:E14D: 48
	LDA PPUSTATUS				;C - - - - - 0x01E15E 07:E14E: AD 02 20
	AND #PPU_VBLANK		;C - - - - - 0x01E161 07:E151: 29 80
	BNE @VBlank					;C - - - - - 0x01E163 07:E153: D0 03
		;Unreached
		JMP NMIFinish				;- - - - - - 0x01E165 07:E155: 4C
@VBlank:
	LDA bufPPUCTRL				;C - - - - - 0x01E168 07:E158: A5 32
	AND #~PPU_NMI			;C - - - - - 0x01E16A 07:E15A: 29 7F
	STA bufPPUCTRL				;C - - - - - 0x01E16C 07:E15C: 85 32
	STA PPUCTRL				;C - - - - - 0x01E16E 07:E15E: 8D 00 20

	;Turn off BG and sprites
	LDA bufPPUMASK				;C - - - - - 0x01E171 07:E161: A5 33
	AND #~(PPU_BG|PPU_OBJ)	;C - - - - - 0x01E173 07:E163: 29 E7
	STA bufPPUMASK				;C - - - - - 0x01E175 07:E165: 85 33
	STA PPUMASK				;C - - - - - 0x01E177 07:E167: 8D 01 20

	LDA nmiProgress				;C - - - - - 0x01E17A 07:E16A: A5 15
	BEQ CODE_0FE171				;C - - - - - 0x01E17C 07:E16C: F0 03
		JMP NMIShort				;C - - - - - 0x01E17E 07:E16E: 4C 97 E2
CODE_0FE171:
	LDA #$01					;C - - - - - 0x01E181 07:E171: A9 01
	STA nmiProgress				;C - - - - - 0x01E183 07:E173: 85 15

	LDA bufPPUCTRL				;C - - - - - 0x01E185 07:E175: A5 32
	AND #~PPU_INC_32		;C - - - - - 0x01E187 07:E177: 29 FB
	STA bufPPUCTRL				;C - - - - - 0x01E189 07:E179: 85 32
	STA PPUCTRL				;C - - - - - 0x01E18B 07:E17B: 8D 00 20

	LDA #$00					;C - - - - - 0x01E18E 07:E17E: A9 00
	STA OAMADDR				;C - - - - - 0x01E190 07:E180: 8D 03 20
	LDA #$02					;C - - - - - 0x01E193 07:E183: A9 02
	STA OAMDMA				;C - - - - - 0x01E195 07:E185: 8D 14 40
	LDA irqEffect				;C - - - - - 0x01E198 07:E188: A5 1D
	BEQ @IRQEffectChecked			;C - - - - - 0x01E19A 07:E18A: F0 0E
		LDA irqLatch				;C - - - - - 0x01E19C 07:E18C: A5 1E
		STA $C000				;C - - - - - 0x01E19E 07:E18E: 8D 00 C0
		STA $C001				;C - - - - - 0x01E1A1 07:E191: 8D 01 C0
.ifdef REGION_JP
		STA $C003
		STA $C002
.else
		STA $E000				;C - - - - - 0x01E1A4 07:E194: 8D 00 E0
		STA $E001				;C - - - - - 0x01E1A7 07:E197: 8D 01 E0
.endif
@IRQEffectChecked:
	JMP (nmiUnbankedSub)		;C - - - - - 0x01E1AA 07:E19A: 6C 35 00
NMISubRet:
	LDA enteringRound			;C - - - - - 0x01E1AD 07:E19D: A5 37
	AND #$01					;C - - - - - 0x01E1AF 07:E19F: 29 01
	BNE CODE_0FE1B6				;C - - - - - 0x01E1B1 07:E1A1: D0 13
		LDA PPUSTATUS				;C - - - - - 0x01E1B3 07:E1A3: AD 02 20
		LDA #$3F					;C - - - - - 0x01E1B6 07:E1A6: A9 3F
		STA PPUADDR				;C - - - - - 0x01E1B8 07:E1A8: 8D 06 20
		LDA #$00					;C - - - - - 0x01E1BB 07:E1AB: A9 00
		STA PPUADDR				;C - - - - - 0x01E1BD 07:E1AD: 8D 06 20
		STA PPUADDR				;C - - - - - 0x01E1C0 07:E1B0: 8D 06 20
		STA PPUADDR				;C - - - - - 0x01E1C3 07:E1B3: 8D 06 20
CODE_0FE1B6:
	LDA bufPPUCTRL				;C - - - - - 0x01E1C6 07:E1B6: A5 32
	AND #~PPU_NAMETABLE		;C - - - - - 0x01E1C8 07:E1B8: 29 FC
	STA bufPPUCTRL				;C - - - - - 0x01E1CA 07:E1BA: 85 32

	LDA vNametable				;C - - - - - 0x01E1CC 07:E1BC: A5 2D
	ASL							;C - - - - - 0x01E1CE 07:E1BE: 0A
	ORA hNametable				;C - - - - - 0x01E1CF 07:E1BF: 05 2F
	AND #$03					;C - - - - - 0x01E1D1 07:E1C1: 29 03
	ORA bufPPUCTRL				;C - - - - - 0x01E1D3 07:E1C3: 05 32
	STA bufPPUCTRL				;C - - - - - 0x01E1D5 07:E1C5: 85 32

	LDA bufPPUMASK				;C - - - - - 0x01E1D7 07:E1C7: A5 33
	ORA #PPU_BG|PPU_OBJ	;C - - - - - 0x01E1D9 07:E1C9: 09 18
	STA bufPPUMASK				;C - - - - - 0x01E1DB 07:E1CB: 85 33
	STA PPUMASK				;C - - - - - 0x01E1DD 07:E1CD: 8D 01 20

	LDA PPUSTATUS				;C - - - - - 0x01E1E0 07:E1D0: AD 02 20
	LDA hScroll				;C - - - - - 0x01E1E3 07:E1D3: A5 2B
	STA PPUSCROLL				;C - - - - - 0x01E1E5 07:E1D5: 8D 05 20
	LDA vScroll				;C - - - - - 0x01E1E8 07:E1D8: A5 29
	STA PPUSCROLL				;C - - - - - 0x01E1EA 07:E1DA: 8D 05 20

	LDA bufPPUCTRL				;C - - - - - 0x01E1ED 07:E1DD: A5 32
	STA PPUCTRL				;C - - - - - 0x01E1EF 07:E1DF: 8D 00 20

	LDA heldP1				;C - - - - - 0x01E1F2 07:E1E2: A5 0A
	STA prevHeldP1				;C - - - - - 0x01E1F4 07:E1E4: 85 0B
	LDA heldP2				;C - - - - - 0x01E1F6 07:E1E6: A5 0F
	STA prevHeldP2				;C - - - - - 0x01E1F8 07:E1E8: 85 10

	JSR ReadPad				;C - - - - - 0x01E1FA 07:E1EA: 20 FA E2
	LDA readResultP1				;C - - - - - 0x01E1FD 07:E1ED: A5 0C
	STA firstReadResultP1				;C - - - - - 0x01E1FF 07:E1EF: 85 0D
	LDA readResultP2				;C - - - - - 0x01E201 07:E1F1: A5 11
	STA firstReadResultP2				;C - - - - - 0x01E203 07:E1F3: 85 12

	JSR ReadPad				;C - - - - - 0x01E205 07:E1F5: 20 FA E2
	LDA readResultP1				;C - - - - - 0x01E208 07:E1F8: A5 0C
	AND firstReadResultP1				;C - - - - - 0x01E20A 07:E1FA: 25 0D
	STA heldP1				;C - - - - - 0x01E20C 07:E1FC: 85 0A
	LDA readResultP2				;C - - - - - 0x01E20E 07:E1FE: A5 11
	AND firstReadResultP2				;C - - - - - 0x01E210 07:E200: 25 12
	STA heldP2				;C - - - - - 0x01E212 07:E202: 85 0F

	LDA #$00					;C - - - - - 0x01E214 07:E204: A9 00
	CLC							;C - - - - - 0x01E216 07:E206: 18
	SBC prevHeldP1				;C - - - - - 0x01E217 07:E207: E5 0B
	AND heldP1				;C - - - - - 0x01E219 07:E209: 25 0A
	STA pressedP1				;C - - - - - 0x01E21B 07:E20B: 85 0E
	LDA #$00					;C - - - - - 0x01E21D 07:E20D: A9 00
	CLC							;C - - - - - 0x01E21F 07:E20F: 18
	SBC prevHeldP2				;C - - - - - 0x01E220 07:E210: E5 10
	AND heldP2				;C - - - - - 0x01E222 07:E212: 25 0F
	STA pressedP2				;C - - - - - 0x01E224 07:E214: 85 13

.ifdef REGION_JP
	JSR HaltDPadOpposites				;C - - - - - 0x01E22D 07:E21D: 20 FD E2
.endif

	INC globalTimer				;C - - - - - 0x01E226 07:E216: E6 14

.ifdef REGION_JP
	LDA chrBankA				;C - - - - - 0x01E232 07:E222: A5 4A
	LSR							;C - - - - - 0x01E234 07:E224: 4A
	STA $8002				;C - - - - - 0x01E235 07:E225: 8D 02 80
	LDA chrBankB				;C - - - - - 0x01E238 07:E228: A5 4B
	LSR							;C - - - - - 0x01E23A 07:E22A: 4A
	STA $8003				;C - - - - - 0x01E23B 07:E22B: 8D 03 80

	LDA chrBankC				;C - - - - - 0x01E23E 07:E22E: A5 4C
	STA $A000				;C - - - - - 0x01E240 07:E230: 8D 00 A0
	LDA chrBankD				;C - - - - - 0x01E243 07:E233: A5 4D
	STA $A001				;C - - - - - 0x01E245 07:E235: 8D 01 A0
	LDA chrBankE				;C - - - - - 0x01E248 07:E238: A5 4E
	STA $A002				;C - - - - - 0x01E24A 07:E23A: 8D 02 A0
	LDA chrBankF				;C - - - - - 0x01E24D 07:E23D: A5 4F
	STA $A003				;C - - - - - 0x01E24F 07:E23F: 8D 03 A0

	LDA nmiPrgBankA				;C - - - - - 0x01E252 07:E242: A5 50
	STA prgBankA				;C - - - - - 0x01E254 07:E244: 85 54
	STA $8000				;C - - - - - 0x01E256 07:E246: 8D 00 80

	LDA nmiPrgBankB				;C - - - - - 0x01E259 07:E249: A5 51
	STA prgBankB				;C - - - - - 0x01E25B 07:E24B: 85 53
	STA $8001				;C - - - - - 0x01E25D 07:E24D: 8D 01 80
.else
	LDA #$00					;C - - - - - 0x01E228 07:E218: A9 00
	STA $8000				;C - - - - - 0x01E22A 07:E21A: 8D 00 80
	LDA chrBankA				;C - - - - - 0x01E22D 07:E21D: A5 4B
	STA $8001				;C - - - - - 0x01E22F 07:E21F: 8D 01 80

	LDA #$01					;C - - - - - 0x01E232 07:E222: A9 01
	STA $8000				;C - - - - - 0x01E234 07:E224: 8D 00 80
	LDA chrBankB				;C - - - - - 0x01E237 07:E227: A5 4C
	STA $8001				;C - - - - - 0x01E239 07:E229: 8D 01 80

	LDA #$02					;C - - - - - 0x01E23C 07:E22C: A9 02
	STA $8000				;C - - - - - 0x01E23E 07:E22E: 8D 00 80
	LDA chrBankC				;C - - - - - 0x01E241 07:E231: A5 4D
	STA $8001				;C - - - - - 0x01E243 07:E233: 8D 01 80

	LDA #$03					;C - - - - - 0x01E246 07:E236: A9 03
	STA $8000				;C - - - - - 0x01E248 07:E238: 8D 00 80
	LDA chrBankD				;C - - - - - 0x01E24B 07:E23B: A5 4E
	STA $8001				;C - - - - - 0x01E24D 07:E23D: 8D 01 80

	LDA #$04					;C - - - - - 0x01E250 07:E240: A9 04
	STA $8000				;C - - - - - 0x01E252 07:E242: 8D 00 80
	LDA chrBankE				;C - - - - - 0x01E255 07:E245: A5 4F
	STA $8001				;C - - - - - 0x01E257 07:E247: 8D 01 80

	LDA #$05					;C - - - - - 0x01E25A 07:E24A: A9 05
	STA $8000				;C - - - - - 0x01E25C 07:E24C: 8D 00 80
	LDA chrBankF				;C - - - - - 0x01E25F 07:E24F: A5 50
	STA $8001				;C - - - - - 0x01E261 07:E251: 8D 01 80

	LDA #$06					;C - - - - - 0x01E264 07:E254: A9 06
	STA $8000				;C - - - - - 0x01E266 07:E256: 8D 00 80
	LDA nmiPrgBankA				;C - - - - - 0x01E269 07:E259: A5 51
	STA $8001				;C - - - - - 0x01E26B 07:E25B: 8D 01 80
	STA prgBankA				;C - - - - - 0x01E26E 07:E25E: 85 54

	LDA #$07					;C - - - - - 0x01E270 07:E260: A9 07
	STA $8000				;C - - - - - 0x01E272 07:E262: 8D 00 80
	LDA nmiPrgBankB				;C - - - - - 0x01E275 07:E265: A5 52
	STA $8001				;C - - - - - 0x01E277 07:E267: 8D 01 80
	STA prgBankB				;C - - - - - 0x01E27A 07:E26A: 85 53
.endif

	LDA bufPPUCTRL				;C - - - - - 0x01E27C 07:E26C: A5 32
	ORA #PPU_NMI			;C - - - - - 0x01E27E 07:E26E: 09 80
	STA bufPPUCTRL				;C - - - - - 0x01E280 07:E270: 85 32
	STA PPUCTRL					;C - - - - - 0x01E282 07:E272: 8D 00 20
	CLI							;C - - - - - 0x01E285 07:E275: 58

	LDA #.HIBYTE(@midsubret)	;C - - - - - 0x01E286 07:E276: A9 E2
	PHA							;C - - - - - 0x01E288 07:E278: 48
	LDA #.LOBYTE(@midsubret-1)	;C - - - - - 0x01E289 07:E279: A9 7E
	PHA							;C - - - - - 0x01E28B 07:E27B: 48
	JMP (nmiBankedSub)			;C - - - - - 0x01E28C 07:E27C: 6C 16 00
@midsubret:
	LDA #$03					;C - - - - - 0x01E28F 07:E27F: A9 03
	STA nmiProgress				;C - - - - - 0x01E291 07:E281: 85 15

	LDA #.BANK(AdditionalTracks)					;C - - - - - 0x01E293 07:E283: A9 0D
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x01E295 07:E285: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x01E297 07:E287: 20 56 FF
.endif

	JSR AudioUpdate				;C - - - - - 0x01E29A 07:E28A: 20 39 C0

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif

	LDA #$00					;C - - - - - 0x01E29D 07:E28D: A9 00
	STA nmiProgress				;C - - - - - 0x01E29F 07:E28F: 85 15

	PLA							;C - - - - - 0x01E2A1 07:E291: 68
	TAY							;C - - - - - 0x01E2A2 07:E292: A8
	PLA							;C - - - - - 0x01E2A3 07:E293: 68
	TAX							;C - - - - - 0x01E2A4 07:E294: AA
	PLA							;C - - - - - 0x01E2A5 07:E295: 68
	RTI							;C - - - - - 0x01E2A6 07:E296: 40

NMIShort:
	LDA irqEffect				;C - - - - - 0x01E2A7 07:E297: A5 1D
	BEQ @IRQEffectChecked		;C - - - - - 0x01E2A9 07:E299: F0 0E
		LDA irqLatch				;C - - - - - 0x01E2AB 07:E29B: A5 1E
		STA $C000				;C - - - - - 0x01E2AD 07:E29D: 8D 00 C0
		STA $C001				;C - - - - - 0x01E2B0 07:E2A0: 8D 01 C0
.ifdef REGION_JP
		STA $C003
		STA $C002
.else
		STA $E000				;C - - - - - 0x01E2B3 07:E2A3: 8D 00 E0
		STA $E001				;C - - - - - 0x01E2B6 07:E2A6: 8D 01 E0
.endif
@IRQEffectChecked:
	LDA bufPPUMASK				;C - - - - - 0x01E2B9 07:E2A9: A5 33
	ORA #PPU_BG|PPU_OBJ	;C - - - - - 0x01E2BB 07:E2AB: 09 18
	STA bufPPUMASK				;C - - - - - 0x01E2BD 07:E2AD: 85 33
	STA PPUMASK				;C - - - - - 0x01E2BF 07:E2AF: 8D 01 20

	LDA PPUSTATUS				;C - - - - - 0x01E2C2 07:E2B2: AD 02 20
	LDA hScroll				;C - - - - - 0x01E2C5 07:E2B5: A5 2B
	STA PPUSCROLL				;C - - - - - 0x01E2C7 07:E2B7: 8D 05 20
	LDA vScroll				;C - - - - - 0x01E2CA 07:E2BA: A5 29
	STA PPUSCROLL				;C - - - - - 0x01E2CC 07:E2BC: 8D 05 20

	LDA bufPPUCTRL				;C - - - - - 0x01E2CF 07:E2BF: A5 32
	STA PPUCTRL				;C - - - - - 0x01E2D1 07:E2C1: 8D 00 20

	LDA nmiProgress				;C - - - - - 0x01E2D4 07:E2C4: A5 15
	CMP #$01					;C - - - - - 0x01E2D6 07:E2C6: C9 01
	BNE CODE_0FE2E7				;C - - - - - 0x01E2D8 07:E2C8: D0 1D
		INC nmiProgress				;C - - - - - 0x01E2DA 07:E2CA: E6 15
		LDA irqEffect				;C - - - - - 0x01E2DC 07:E2CC: A5 1D
		BNE CODE_0FE2E7				;C - - - - - 0x01E2DE 07:E2CE: D0 17
.ifndef REGION_JP
			LDA #$07					;C - - - - - 0x01E2E0 07:E2D0: A9 07
			STA $8000				;C - - - - - 0x01E2E2 07:E2D2: 8D 00 80
.endif
			LDA #$0D					;C - - - - - 0x01E2E5 07:E2D5: A9 0D
			STA $8001				;C - - - - - 0x01E2E7 07:E2D7: 8D 01 80
			JSR AudioUpdate				;C - - - - - 0x01E2EA 07:E2DA: 20 39 C0

.ifndef REGION_JP
			LDA #$07					;C - - - - - 0x01E2ED 07:E2DD: A9 07
			STA $8000				;C - - - - - 0x01E2EF 07:E2DF: 8D 00 80
.endif
			LDA prgBankB				;C - - - - - 0x01E2F2 07:E2E2: A5 53
			STA $8001				;C - - - - - 0x01E2F4 07:E2E4: 8D 01 80
CODE_0FE2E7:
	LDA bufPPUCTRL				;C - - - - - 0x01E2F7 07:E2E7: A5 32
	ORA #PPU_NMI			;C - - - - - 0x01E2F9 07:E2E9: 09 80
	STA bufPPUCTRL				;C - - - - - 0x01E2FB 07:E2EB: 85 32
	STA PPUCTRL				;C - - - - - 0x01E2FD 07:E2ED: 8D 00 20
	CLI							;C - - - - - 0x01E300 07:E2F0: 58
NMIFinish:
	PLA							;C - - - - - 0x01E301 07:E2F1: 68
	TAY							;C - - - - - 0x01E302 07:E2F2: A8
	PLA							;C - - - - - 0x01E303 07:E2F3: 68
	TAX							;C - - - - - 0x01E304 07:E2F4: AA
	PLA							;C - - - - - 0x01E305 07:E2F5: 68
	RTI							;C - - - - - 0x01E306 07:E2F6: 40

CODE_0FE2F7:
	;Unreached
	JMP CODE_0FE2F7				;- - - - - - 0x01E307 07:E2F7: 4C

ReadPad:
	LDA #$01					;C - - - - - 0x01E30A 07:E2FA: A9 01
	STA JOY1				;C - - - - - 0x01E30C 07:E2FC: 8D 16 40
	LDA #$00					;C - - - - - 0x01E30F 07:E2FF: A9 00
	STA JOY1				;C - - - - - 0x01E311 07:E301: 8D 16 40
	LDX #$08					;C - - - - - 0x01E314 07:E304: A2 08
CODE_0FE306:
	LDA JOY1					;C - - - - - 0x01E316 07:E306: AD 16 40
	LSR							;C - - - - - 0x01E319 07:E309: 4A
	BCS CODE_0FE30D				;C - - - - - 0x01E31A 07:E30A: B0 01
		LSR							;C - - - - - 0x01E31C 07:E30C: 4A
CODE_0FE30D:
	ROR readResultP1				;C - - - - - 0x01E31D 07:E30D: 66 0C
	LDA JOY2					;C - - - - - 0x01E31F 07:E30F: AD 17 40
	LSR							;C - - - - - 0x01E322 07:E312: 4A
	BCS CODE_0FE316				;C - - - - - 0x01E323 07:E313: B0 01
		LSR							;C - - - - - 0x01E325 07:E315: 4A
CODE_0FE316:
	ROR readResultP2				;C - - - - - 0x01E326 07:E316: 66 11
	DEX							;C - - - - - 0x01E328 07:E318: CA
	BNE CODE_0FE306				;C - - - - - 0x01E329 07:E319: D0 EB

	RTS							;C - - - - - 0x01E32B 07:E31B: 60

.ifdef REGION_JP
HaltDPadOpposites:
	LDA heldP1				;C - - - - - 0x01E30D 07:E2FD: A5 0A
	LSR							;C - - - - - 0x01E30F 07:E2FF: 4A
	AND heldP1				;C - - - - - 0x01E310 07:E300: 25 0A
	AND #KEY_UP|KEY_DOWN|KEY_LEFT|KEY_RIGHT			;C - - - - - 0x01E312 07:E302: 29 F0
	;Check if both UP and DOWN held (bits were next to each other, now combined if both were set)
	CMP #KEY_UP					;C - - - - - 0x01E314 07:E304: C9 10
	BEQ @p1bad				;C - - - - - 0x01E316 07:E306: F0 08
	;Check if both LEFT and RIGHT held (bits were next to each other, now combined if both were set)
	CMP #KEY_LEFT					;C - - - - - 0x01E318 07:E308: C9 40
	BEQ @p1bad			;- - - - - - 0x01E31A 07:E30A: F0
	CMP #KEY_UP|KEY_LEFT					;- - - - - - 0x01E31C 07:E30C: C9
	BNE @p1checked			;- - - - - - 0x01E31E 07:E30E: D0
@p1bad:
	LDA #$00
	STA heldP1				;C - - - - - 0x01E322 07:E312: 85 0A
	STA pressedP1				;C - - - - - 0x01E324 07:E314: 85 0E
@p1checked:
	LDA heldP2				;C - - - - - 0x01E326 07:E316: A5 0F
	LSR							;C - - - - - 0x01E328 07:E318: 4A
	AND heldP2				;C - - - - - 0x01E329 07:E319: 25 0F
	AND #KEY_UP|KEY_DOWN|KEY_LEFT|KEY_RIGHT			;C - - - - - 0x01E32B 07:E31B: 29 F0
	CMP #KEY_UP					;C - - - - - 0x01E32D 07:E31D: C9 10
	BEQ @p2bad				;C - - - - - 0x01E32F 07:E31F: F0 08
	CMP #KEY_LEFT					;C - - - - - 0x01E331 07:E321: C9 40
	BEQ @p2bad			;- - - - - - 0x01E333 07:E323: F0
	CMP #KEY_UP|KEY_LEFT					;- - - - - - 0x01E335 07:E325: C9
	BNE @p2checked			;- - - - - - 0x01E337 07:E327: D0
@p2bad:
	LDA #$00
	STA heldP2				;C - - - - - 0x01E33B 07:E32B: 85 0F
	STA pressedP2				;C - - - - - 0x01E33D 07:E32D: 85 13
@p2checked:
	RTS							;C - - - - - 0x01E33F 07:E32F: 60
.endif

CODE_0FE31C:
	;A: To PPUADDR
	;X: To PPUDATA early
	;Y: To PPUDATA later

	STA scratch0				;C - - - - - 0x01E32C 07:E31C: 85 00
	LDA PPUSTATUS				;C - - - - - 0x01E32E 07:E31E: AD 02 20
	LDA scratch0				;C - - - - - 0x01E331 07:E321: A5 00
	STA PPUADDR				;C - - - - - 0x01E333 07:E323: 8D 06 20
	LDA #$00					;C - - - - - 0x01E336 07:E326: A9 00
	STA PPUADDR				;C - - - - - 0x01E338 07:E328: 8D 06 20
	STY scratch0				;C - - - - - 0x01E33B 07:E32B: 84 00
	TXA							;C - - - - - 0x01E33D 07:E32D: 8A
	LDX #$1E					;C - - - - - 0x01E33E 07:E32E: A2 1E
CODE_0FE330:
	LDY #$20					;C - - - - - 0x01E340 07:E330: A0 20
CODE_0FE332:
	STA PPUDATA				;C - - - - - 0x01E342 07:E332: 8D 07 20
	DEY							;C - - - - - 0x01E345 07:E335: 88
	BNE CODE_0FE332				;C - - - - - 0x01E346 07:E336: D0 FA

	DEX							;C - - - - - 0x01E348 07:E338: CA
	BNE CODE_0FE330				;C - - - - - 0x01E349 07:E339: D0 F5

	LDA scratch0				;C - - - - - 0x01E34B 07:E33B: A5 00
	LDX #$02					;C - - - - - 0x01E34D 07:E33D: A2 02
CODE_0FE33F:
	LDY #$20					;C - - - - - 0x01E34F 07:E33F: A0 20
CODE_0FE341:
	STA PPUDATA				;C - - - - - 0x01E351 07:E341: 8D 07 20
	DEY							;C - - - - - 0x01E354 07:E344: 88
	BNE CODE_0FE341				;C - - - - - 0x01E355 07:E345: D0 FA

	DEX							;C - - - - - 0x01E357 07:E347: CA
	BNE CODE_0FE33F				;C - - - - - 0x01E358 07:E348: D0 F5

	RTS							;C - - - - - 0x01E35A 07:E34A: 60

DATA_0FE34B:
	;Unreached
	;Palettes
	.byte $0F					;- - - - - - 0x01E35B 07:E34B: 0F
	.byte $12					;- - - - - - 0x01E35C 07:E34C: 12
	.byte $38					;- - - - - - 0x01E35D 07:E34D: 38
	.byte $30					;- - - - - - 0x01E35E 07:E34E: 30
	.byte $0F					;- - - - - - 0x01E35F 07:E34F: 0F
	.byte $02					;- - - - - - 0x01E360 07:E350: 02
	.byte $08					;- - - - - - 0x01E361 07:E351: 08
	.byte $06					;- - - - - - 0x01E362 07:E352: 06
	.byte $0F					;- - - - - - 0x01E363 07:E353: 0F
	.byte $12					;- - - - - - 0x01E364 07:E354: 12
	.byte $16					;- - - - - - 0x01E365 07:E355: 16
	.byte $30					;- - - - - - 0x01E366 07:E356: 30
	.byte $0F					;- - - - - - 0x01E367 07:E357: 0F
	.byte $12					;- - - - - - 0x01E368 07:E358: 12
	.byte $16					;- - - - - - 0x01E369 07:E359: 16
	.byte $30					;- - - - - - 0x01E36A 07:E35A: 30
	.byte $0F					;- - - - - - 0x01E36B 07:E35B: 0F
	.byte $21					;- - - - - - 0x01E36C 07:E35C: 21
	.byte $01					;- - - - - - 0x01E36D 07:E35D: 01
	.byte $27					;- - - - - - 0x01E36E 07:E35E: 27
	.byte $0F					;- - - - - - 0x01E36F 07:E35F: 0F
	.byte $1A					;- - - - - - 0x01E370 07:E360: 1A
	.byte $07					;- - - - - - 0x01E371 07:E361: 07
	.byte $27					;- - - - - - 0x01E372 07:E362: 27
	.byte $0F					;- - - - - - 0x01E373 07:E363: 0F
	.byte $02					;- - - - - - 0x01E374 07:E364: 02
	.byte $2C					;- - - - - - 0x01E375 07:E365: 2C
	.byte $30					;- - - - - - 0x01E376 07:E366: 30
	.byte $0F					;- - - - - - 0x01E377 07:E367: 0F
	.byte $2C					;- - - - - - 0x01E378 07:E368: 2C
	.byte $28					;- - - - - - 0x01E379 07:E369: 28
	.byte $30					;- - - - - - 0x01E37A 07:E36A: 30

CODE_0FE36B:
	LDX #$00					;C - - - - - 0x01E37B 07:E36B: A2 00
	LDA #240					;C - - - - - 0x01E37D 07:E36D: A9 F0
CODE_0FE36F:
	STA OAMBuffer,X				;C - - - - - 0x01E37F 07:E36F: 9D 00 02
	INX							;C - - - - - 0x01E382 07:E372: E8
	INX							;C - - - - - 0x01E383 07:E373: E8
	INX							;C - - - - - 0x01E384 07:E374: E8
	INX							;C - - - - - 0x01E385 07:E375: E8
	CPX #$00					;C - - - - - 0x01E386 07:E376: E0 00
	BNE CODE_0FE36F				;C - - - - - 0x01E388 07:E378: D0 F5

CODE_0FE37A:
	LDX #$00					;C - - - - - 0x01E38A 07:E37A: A2 00
	LDA #$00					;C - - - - - 0x01E38C 07:E37C: A9 00
CODE_0FE37E:
	STA objState,X				;C - - - - - 0x01E38E 07:E37E: 9D 63 05
	STA objAnimHI,X				;C - - - - - 0x01E391 07:E381: 9D 1B 07
	INX							;C - - - - - 0x01E394 07:E384: E8
	CPX #$28					;C - - - - - 0x01E395 07:E385: E0 28
	BNE CODE_0FE37E				;C - - - - - 0x01E397 07:E387: D0 F5

	RTS							;C - - - - - 0x01E399 07:E389: 60

ColorBufferToVRAM:
	LDA PPUSTATUS				;C - - - - - 0x01E39A 07:E38A: AD 02 20
	LDA #$3F					;C - - - - - 0x01E39D 07:E38D: A9 3F
	STA PPUADDR				;C - - - - - 0x01E39F 07:E38F: 8D 06 20
	LDA #$00					;C - - - - - 0x01E3A2 07:E392: A9 00
	STA PPUADDR				;C - - - - - 0x01E3A4 07:E394: 8D 06 20
	LDX #$00					;C - - - - - 0x01E3A7 07:E397: A2 00
@copy:
	LDA colorBuffer,X				;C - - - - - 0x01E3A9 07:E399: BD 00 03
	STA PPUDATA				;C - - - - - 0x01E3AC 07:E39C: 8D 07 20
	INX							;C - - - - - 0x01E3AF 07:E39F: E8
	CPX #$20					;C - - - - - 0x01E3B0 07:E3A0: E0 20
	BNE @copy				;C - - - - - 0x01E3B2 07:E3A2: D0 F5

	JMP NMISubRet				;C - - - - - 0x01E3B4 07:E3A4: 4C 9D E1

NMIWriteMapChunk:
	LDA mapChunkHalf			;C - - - - - 0x01E3B7 07:E3A7: A5 48
	CMP #$FF					;C - - - - - 0x01E3B9 07:E3A9: C9 FF
	BEQ CODE_0FE3DA				;C - - - - - 0x01E3BB 07:E3AB: F0 2D

	LDA ram_0364				;C - - - - - 0x01E3BD 07:E3AD: AD 64 03
	STA scratch6				;C - - - - - 0x01E3C0 07:E3B0: 85 06
	LDA #$01					;C - - - - - 0x01E3C2 07:E3B2: A9 01
	STA scratch4				;C - - - - - 0x01E3C4 07:E3B4: 85 04
	LDX #$00					;C - - - - - 0x01E3C6 07:E3B6: A2 00
CODE_0FE3B8:
	;Run twice to copy whole chunk of $20 bytes
	STX mapChunkHalf			;C - - - - - 0x01E3C8 07:E3B8: 86 48
	TXA							;C - - - - - 0x01E3CA 07:E3BA: 8A
	AND #$01					;C - - - - - 0x01E3CB 07:E3BB: 29 01
	ASL							;C - - - - - 0x01E3CD 07:E3BD: 0A
	STA scratch5				;C - - - - - 0x01E3CE 07:E3BE: 85 05
	JSR MapChunkToNametable		;C - - - - - 0x01E3D0 07:E3C0: 20 2B E7

	LDA mapTargetAdr			;C - - - - - 0x01E3D3 07:E3C3: A5 49
	CLC							;C - - - - - 0x01E3D5 07:E3C5: 18
	ADC #$20					;C - - - - - 0x01E3D6 07:E3C6: 69 20
	STA mapTargetAdr			;C - - - - - 0x01E3D8 07:E3C8: 85 49
	LDA #$00					;C - - - - - 0x01E3DA 07:E3CA: A9 00
	ADC mapTargetAdr+1			;C - - - - - 0x01E3DC 07:E3CC: 65 4A
	STA mapTargetAdr+1			;C - - - - - 0x01E3DE 07:E3CE: 85 4A

	LDX mapChunkHalf			;C - - - - - 0x01E3E0 07:E3D0: A6 48
	INX							;C - - - - - 0x01E3E2 07:E3D2: E8
	CPX #$02					;C - - - - - 0x01E3E3 07:E3D3: E0 02
	BNE CODE_0FE3B8				;C - - - - - 0x01E3E5 07:E3D5: D0 E1

	JSR CODE_0FE431				;C - - - - - 0x01E3E7 07:E3D7: 20 31 E4
CODE_0FE3DA:
	LDA #$00					;C - - - - - 0x01E3EA 07:E3DA: A9 00
	STA mapChunkHalf			;C - - - - - 0x01E3EC 07:E3DC: 85 48
	JMP NMISubRet				;C - - - - - 0x01E3EE 07:E3DE: 4C 9D E1

CODE_0FE3E1:
	;Unreached
	LDA mapChunkHalf				;- - - - - - 0x01E3F1 07:E3E1: A5
	CMP #$FF					;- - - - - - 0x01E3F3 07:E3E3: C9
	BEQ CODE_0FE42A				;- - - - - - 0x01E3F5 07:E3E5: F0

	LDA bufPPUCTRL				;- - - - - - 0x01E3F7 07:E3E7: A5
	ORA #$04					;- - - - - - 0x01E3F9 07:E3E9: 09
	STA bufPPUCTRL				;- - - - - - 0x01E3FB 07:E3EB: 85
	STA PPUCTRL					;- - - - - - 0x01E3FD 07:E3ED: 8D
	LDA ram_0364				;- - - - - - 0x01E400 07:E3F0: AD
	STA scratch6				;- - - - - - 0x01E403 07:E3F3: 85
	LDA #$02					;- - - - - - 0x01E405 07:E3F5: A9
	STA scratch4				;- - - - - - 0x01E407 07:E3F7: 85
	LDX #$00					;- - - - - - 0x01E409 07:E3F9: A2
CODE_0FE3FB:
	;Run twice to copy whole chunk of $20 bytes
	STX mapChunkHalf				;- - - - - - 0x01E40B 07:E3FB: 86
	TXA							;- - - - - - 0x01E40D 07:E3FD: 8A
	AND #$01					;- - - - - - 0x01E40E 07:E3FE: 29
	STA scratch5				;- - - - - - 0x01E410 07:E400: 85
	JSR MapChunkToNametable				;- - - - - - 0x01E412 07:E402: 20

	LDA mapTargetAdr				;- - - - - - 0x01E415 07:E405: A5
	CLC							;- - - - - - 0x01E417 07:E407: 18
	ADC #$01					;- - - - - - 0x01E418 07:E408: 69
	AND #$1F					;- - - - - - 0x01E41A 07:E40A: 29
	BNE CODE_0FE416				;- - - - - - 0x01E41C 07:E40C: D0
		LDA mapTargetAdr+1				;- - - - - - 0x01E41E 07:E40E: A5
		EOR #$04					;- - - - - - 0x01E420 07:E410: 49
		STA mapTargetAdr+1				;- - - - - - 0x01E422 07:E412: 85
		LDA #$00					;- - - - - - 0x01E424 07:E414: A9
CODE_0FE416:
	STA scratch5				;- - - - - - 0x01E426 07:E416: 85
	LDA mapTargetAdr				;- - - - - - 0x01E428 07:E418: A5
	AND #$E0					;- - - - - - 0x01E42A 07:E41A: 29
	EOR scratch5				;- - - - - - 0x01E42C 07:E41C: 45
	STA mapTargetAdr				;- - - - - - 0x01E42E 07:E41E: 85
	LDX mapChunkHalf				;- - - - - - 0x01E430 07:E420: A6
	INX							;- - - - - - 0x01E432 07:E422: E8
	CPX #$02					;- - - - - - 0x01E433 07:E423: E0
	BNE CODE_0FE3FB				;- - - - - - 0x01E435 07:E425: D0
		JSR CODE_0FE470				;- - - - - - 0x01E437 07:E427: 20
CODE_0FE42A:
	LDA #$00					;- - - - - - 0x01E43A 07:E42A: A9
	STA mapChunkHalf				;- - - - - - 0x01E43C 07:E42C: 85
	JMP NMISubRet				;- - - - - - 0x01E43E 07:E42E: 4C
CODE_0FE431:
	LDA PPUSTATUS				;C - - - - - 0x01E441 07:E431: AD 02 20
	LDA ram_03AB				;C - - - - - 0x01E444 07:E434: AD AB 03
	STA PPUADDR				;C - - - - - 0x01E447 07:E437: 8D 06 20
	LDA ram_03AA				;C - - - - - 0x01E44A 07:E43A: AD AA 03
	STA PPUADDR				;C - - - - - 0x01E44D 07:E43D: 8D 06 20
	LDY #$00					;C - - - - - 0x01E450 07:E440: A0 00
	LDX ram_03AF				;C - - - - - 0x01E452 07:E442: AE AF 03
CODE_0FE445:
	LDA ram_03B1,X				;C - - - - - 0x01E455 07:E445: BD B1 03
	STA PPUDATA				;C - - - - - 0x01E458 07:E448: 8D 07 20
	INX							;C - - - - - 0x01E45B 07:E44B: E8
	INY							;C - - - - - 0x01E45C 07:E44C: C8
	CPY ram_03AE				;C - - - - - 0x01E45D 07:E44D: CC AE 03
	BNE CODE_0FE445				;C - - - - - 0x01E460 07:E450: D0 F3

	LDA macroTileCounter				;C - - - - - 0x01E462 07:E452: AD A8 03
	AND #$01					;C - - - - - 0x01E465 07:E455: 29 01
	EOR ram_03A9				;C - - - - - 0x01E467 07:E457: 4D A9 03
	BEQ CODE_0FE46F				;C - - - - - 0x01E46A 07:E45A: F0 13
		LDA ram_03AA				;C - - - - - 0x01E46C 07:E45C: AD AA 03
		CLC							;C - - - - - 0x01E46F 07:E45F: 18
		ADC ram_03AC				;C - - - - - 0x01E470 07:E460: 6D AC 03
		STA ram_03AA				;C - - - - - 0x01E473 07:E463: 8D AA 03
		LDA ram_03AB				;C - - - - - 0x01E476 07:E466: AD AB 03
		ADC ram_03AD				;C - - - - - 0x01E479 07:E469: 6D AD 03
		STA ram_03AB				;C - - - - - 0x01E47C 07:E46C: 8D AB 03
CODE_0FE46F:
	RTS							;C - - - - - 0x01E47F 07:E46F: 60

CODE_0FE470:
	;Unreached
	LDY #$00					;- - - - - - 0x01E480 07:E470: A0
	LDX ram_03AF				;- - - - - - 0x01E482 07:E472: AE
	LDA ram_03AB				;- - - - - - 0x01E485 07:E475: AD
	STA scratch1				;- - - - - - 0x01E488 07:E478: 85
	LDA ram_03AA				;- - - - - - 0x01E48A 07:E47A: AD
	STA scratch0				;- - - - - - 0x01E48D 07:E47D: 85
CODE_0FE47F:
	LDA PPUSTATUS					;- - - - - - 0x01E48F 07:E47F: AD
	LDA scratch1				;- - - - - - 0x01E492 07:E482: A5
	STA PPUADDR					;- - - - - - 0x01E494 07:E484: 8D
	LDA scratch0				;- - - - - - 0x01E497 07:E487: A5
	STA PPUADDR					;- - - - - - 0x01E499 07:E489: 8D
	LDA ram_03B1,X				;- - - - - - 0x01E49C 07:E48C: BD
	STA PPUDATA					;- - - - - - 0x01E49F 07:E48F: 8D
	TXA							;- - - - - - 0x01E4A2 07:E492: 8A
	CLC							;- - - - - - 0x01E4A3 07:E493: 18
	ADC ram_03AC				;- - - - - - 0x01E4A4 07:E494: 6D
	TAX							;- - - - - - 0x01E4A7 07:E497: AA
	LDA scratch0				;- - - - - - 0x01E4A8 07:E498: A5
	CLC							;- - - - - - 0x01E4AA 07:E49A: 18
	ADC ram_03AC				;- - - - - - 0x01E4AB 07:E49B: 6D
	STA scratch0				;- - - - - - 0x01E4AE 07:E49E: 85
	LDA scratch1				;- - - - - - 0x01E4B0 07:E4A0: A5
	ADC ram_03AD				;- - - - - - 0x01E4B2 07:E4A2: 6D
	STA scratch1				;- - - - - - 0x01E4B5 07:E4A5: 85
	INY							;- - - - - - 0x01E4B7 07:E4A7: C8
	CPY ram_03AE				;- - - - - - 0x01E4B8 07:E4A8: CC
	BNE CODE_0FE47F				;- - - - - - 0x01E4BB 07:E4AB: D0

	LDA macroTileCounter				;- - - - - - 0x01E4BD 07:E4AD: AD
	AND #$01					;- - - - - - 0x01E4C0 07:E4B0: 29
	EOR ram_03A9				;- - - - - - 0x01E4C2 07:E4B2: 4D
	BEQ CODE_0FE4C8				;- - - - - - 0x01E4C5 07:E4B5: F0
		LDA ram_03AA				;- - - - - - 0x01E4C7 07:E4B7: AD
		CLC							;- - - - - - 0x01E4CA 07:E4BA: 18
		ADC #$01					;- - - - - - 0x01E4CB 07:E4BB: 69
		STA ram_03AA				;- - - - - - 0x01E4CD 07:E4BD: 8D
		LDA ram_03AB				;- - - - - - 0x01E4D0 07:E4C0: AD
		ADC #$00					;- - - - - - 0x01E4D3 07:E4C3: 69
		STA ram_03AB				;- - - - - - 0x01E4D5 07:E4C5: 8D
CODE_0FE4C8:
	RTS							;- - - - - - 0x01E4D8 07:E4C8: 60

.ifdef REGION_JP
CODE_JP_0FE4DD:
	LDY #00					;- - - - - - 0x01E4ED 07:E4DD: A0
	STY ram_055D					;- - - - - - 0x01E4EF 07:E4DF: 8C
CODE_JP_0FE4E2:
	LDA (scratch0),Y			;- - - - - - 0x01E4F2 07:E4E2: B1
	CLC					;- - - - - - 0x01E4F4 07:E4E4: 18
	ADC ram_055D					;- - - - - - 0x01E4F5 07:E4E5: 6D
	STA ram_055D					;- - - - - - 0x01E4F8 07:E4E8: 8D
	INC scratch0					;- - - - - - 0x01E4FB 07:E4EB: E6
	BNE	CODE_JP_0FE4F1				;- - - - - - 0x01E4FD 07:E4ED: D0
		INC scratch1					;- - - - - - 0x01E4FF 07:E4EF: E6
CODE_JP_0FE4F1:
	LDA scratch0					;- - - - - - 0x01E501 07:E4F1: A5
	CMP scratch2					;- - - - - - 0x01E503 07:E4F3: C5
	BNE	CODE_JP_0FE4E2				;- - - - - - 0x01E505 07:E4F5: D0

	LDA scratch1				;C - - - - - 0x01E507 07:E4F7: A5 01
	CMP scratch3				;C - - - - - 0x01E509 07:E4F9: C5 03
	BNE CODE_JP_0FE4E2				;C - - - - - 0x01E50B 07:E4FB: D0 E5

	RTS							;C - - - - - 0x01E50D 07:E4FD: 60
.endif

GetMapParams:
	;00: map ID

	TYA							;C - - - - - 0x01E4D9 07:E4C9: 98
	PHA							;C - - - - - 0x01E4DA 07:E4CA: 48
	LDA #.BANK(MapTable)					;C - - - - - 0x01E4DB 07:E4CB: A9 00

.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x01E4DD 07:E4CD: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x01E4DF 07:E4CF: 20 56 FF
.endif

	LDA #$00					;C - - - - - 0x01E4E2 07:E4D2: A9 00
	STA scratch1				;C - - - - - 0x01E4E4 07:E4D4: 85 01

	CLC							;C - - - - - 0x01E4E6 07:E4D6: 18
	LDA scratch0				;C - - - - - 0x01E4E7 07:E4D7: A5 00
	ASL scratch0				;C - - - - - 0x01E4E9 07:E4D9: 06 00
	ROL scratch1				;C - - - - - 0x01E4EB 07:E4DB: 26 01
	ASL scratch0				;C - - - - - 0x01E4ED 07:E4DD: 06 00
	ROL scratch1				;C - - - - - 0x01E4EF 07:E4DF: 26 01
	ASL scratch0				;C - - - - - 0x01E4F1 07:E4E1: 06 00
	ROL scratch1				;C - - - - - 0x01E4F3 07:E4E3: 26 01
	LDA #$00					;C - - - - - 0x01E4F5 07:E4E5: A9 00
	CLC							;C - - - - - 0x01E4F7 07:E4E7: 18
	ADC scratch0				;C - - - - - 0x01E4F8 07:E4E8: 65 00
	STA scratch2				;C - - - - - 0x01E4FA 07:E4EA: 85 02

	LDA #$A0					;C - - - - - 0x01E4FC 07:E4EC: A9 A0
	ADC scratch1				;C - - - - - 0x01E4FE 07:E4EE: 65 01
	STA scratch3				;C - - - - - 0x01E500 07:E4F0: 85 03

	;02: Adr of MapTable entry
	LDY #$00					;C - - - - - 0x01E502 07:E4F2: A0 00
	LDA (scratch2),Y			;C - - - - - 0x01E504 07:E4F4: B1 02
	STA mapMacroDefs				;C - - - - - 0x01E506 07:E4F6: 85 3E
	INY							;C - - - - - 0x01E508 07:E4F8: C8
	LDA (scratch2),Y			;C - - - - - 0x01E509 07:E4F9: B1 02
	STA mapMacroDefs+1				;C - - - - - 0x01E50B 07:E4FB: 85 3F
	INY							;C - - - - - 0x01E50D 07:E4FD: C8
	LDA (scratch2),Y			;C - - - - - 0x01E50E 07:E4FE: B1 02
	STA mapMacroList				;C - - - - - 0x01E510 07:E500: 85 3C
	INY							;C - - - - - 0x01E512 07:E502: C8
	LDA (scratch2),Y			;C - - - - - 0x01E513 07:E503: B1 02
	STA mapMacroList+1				;C - - - - - 0x01E515 07:E505: 85 3D
	INY							;C - - - - - 0x01E517 07:E507: C8

	LDA (scratch2),Y			;C - - - - - 0x01E518 07:E508: B1 02
	STA scratch0				;C - - - - - 0x01E51A 07:E50A: 85 00
	STA nmiPrgBankB				;C - - - - - 0x01E51C 07:E50C: 85 52
	INY							;C - - - - - 0x01E51E 07:E50E: C8
	LDA (scratch2),Y			;C - - - - - 0x01E51F 07:E50F: B1 02
	STA ram_0361				;C - - - - - 0x01E521 07:E511: 8D 61 03
	INY							;C - - - - - 0x01E524 07:E514: C8
	LDA (scratch2),Y			;C - - - - - 0x01E525 07:E515: B1 02
	STA ram_0365				;C - - - - - 0x01E527 07:E517: 8D 65 03
	INY							;C - - - - - 0x01E52A 07:E51A: C8
	LDA (scratch2),Y			;C - - - - - 0x01E52B 07:E51B: B1 02
	STA ram_0366				;C - - - - - 0x01E52D 07:E51D: 8D 66 03

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif

	PLA							;C - - - - - 0x01E530 07:E520: 68
	TAY							;C - - - - - 0x01E531 07:E521: A8
	RTS							;C - - - - - 0x01E532 07:E522: 60

LoadMap:
	LDA #$FF					;C - - - - - 0x01E533 07:E523: A9 FF
	STA mapChunkHalf				;C - - - - - 0x01E535 07:E525: 85 48

	LDA mapID				;C - - - - - 0x01E537 07:E527: AD 60 03
	STA scratch0				;C - - - - - 0x01E53A 07:E52A: 85 00
	JSR GetMapParams				;C - - - - - 0x01E53C 07:E52C: 20 C9 E4

	LDX ram_0361				;C - - - - - 0x01E53F 07:E52F: AE 61 03
	LDA DATA_0FE5E2,X			;C - - - - - 0x01E542 07:E532: BD E2 E5
	STA mapMacroListInc				;C - - - - - 0x01E545 07:E535: 8D 67 03
	LDA #$08					;C - - - - - 0x01E548 07:E538: A9 08
	STA ram_03AC				;C - - - - - 0x01E54A 07:E53A: 8D AC 03
	LDA #$00					;C - - - - - 0x01E54D 07:E53D: A9 00
	STA ram_03AD				;C - - - - - 0x01E54F 07:E53F: 8D AD 03

	LDA ram_0365				;C - - - - - 0x01E552 07:E542: AD 65 03
	CMP #$10					;C - - - - - 0x01E555 07:E545: C9 10
	BCC CODE_0FE54B				;C - - - - - 0x01E557 07:E547: 90 02
		LDA #$10					;C - - - - - 0x01E559 07:E549: A9 10
CODE_0FE54B:
	CLC							;C - - - - - 0x01E55B 07:E54B: 18
	ADC #$01					;C - - - - - 0x01E55C 07:E54C: 69 01
	LSR							;C - - - - - 0x01E55E 07:E54E: 4A
	STA ram_03AE				;C - - - - - 0x01E55F 07:E54F: 8D AE 03
	LDA ram_0366				;C - - - - - 0x01E562 07:E552: AD 66 03
	CLC							;C - - - - - 0x01E565 07:E555: 18
	ADC #$01					;C - - - - - 0x01E566 07:E556: 69 01
	STA macroTileCounter				;C - - - - - 0x01E568 07:E558: 8D A8 03

	CLC							;C - - - - - 0x01E56B 07:E55B: 18
	LDA mapTargetAdr			;C - - - - - 0x01E56C 07:E55C: A5 49
	AND #$40					;C - - - - - 0x01E56E 07:E55E: 29 40
	ROL							;C - - - - - 0x01E570 07:E560: 2A
	ROL							;C - - - - - 0x01E571 07:E561: 2A
	ROL							;C - - - - - 0x01E572 07:E562: 2A
	STA ram_03A9				;C - - - - - 0x01E573 07:E563: 8D A9 03

	LDA bufPPUCTRL				;C - - - - - 0x01E576 07:E566: A5 32
	AND #~PPU_INC_32			;C - - - - - 0x01E578 07:E568: 29 FB
	STA bufPPUCTRL				;C - - - - - 0x01E57A 07:E56A: 85 32
	STA PPUCTRL					;C - - - - - 0x01E57C 07:E56C: 8D 00 20

	LDA ram_0365				;C - - - - - 0x01E57F 07:E56F: AD 65 03
	STA ram_0364				;C - - - - - 0x01E582 07:E572: 8D 64 03

	LDA #.LOBYTE(NMIWriteMapChunk)	;C - - - - - 0x01E585 07:E575: A9 A7
	STA nmiUnbankedSub			;C - - - - - 0x01E587 07:E577: 85 35
	LDA #.HIBYTE(NMIWriteMapChunk)	;C - - - - - 0x01E589 07:E579: A9 E3
	STA nmiUnbankedSub+1				;C - - - - - 0x01E58B 07:E57B: 85 36

	LDA #.LOBYTE(NMIReadMacroTiles)	;C - - - - - 0x01E58D 07:E57D: A9 86
	STA nmiBankedSub			;C - - - - - 0x01E58F 07:E57F: 85 16
	LDA #.HIBYTE(NMIReadMacroTiles)	;C - - - - - 0x01E591 07:E581: A9 E5
	STA nmiBankedSub+1			;C - - - - - 0x01E593 07:E583: 85 17
	RTS							;C - - - - - 0x01E595 07:E585: 60

NMIReadMacroTiles:
	LDA macroTileCounter				;C - - - - - 0x01E596 07:E586: AD A8 03
	CMP #$01					;C - - - - - 0x01E599 07:E589: C9 01
	BEQ @finish				;C - - - - - 0x01E59B 07:E58B: F0 44

	LDA ram_0365				;C - - - - - 0x01E59D 07:E58D: AD 65 03
	CMP #$10					;C - - - - - 0x01E5A0 07:E590: C9 10
	BCC @capped				;C - - - - - 0x01E5A2 07:E592: 90 02
		LDA #$10					;C - - - - - 0x01E5A4 07:E594: A9 10
@capped:
	STA scratch6				;C - - - - - 0x01E5A6 07:E596: 85 06
	LDA #$01					;C - - - - - 0x01E5A8 07:E598: A9 01
	STA scratch8				;C - - - - - 0x01E5AA 07:E59A: 85 08
	LDA #$00					;C - - - - - 0x01E5AC 07:E59C: A9 00
	STA scratch0				;C - - - - - 0x01E5AE 07:E59E: 85 00
	LDA mapBaseTile				;C - - - - - 0x01E5B0 07:E5A0: AD 63 03
	STA scratch1				;C - - - - - 0x01E5B3 07:E5A3: 85 01
	JSR MacroRowToBuffer				;C - - - - - 0x01E5B5 07:E5A5: 20 CE E6
	JSR CODE_0FE791				;C - - - - - 0x01E5B8 07:E5A8: 20 91 E7

	LDA ram_0365				;C - - - - - 0x01E5BB 07:E5AB: AD 65 03
	STA scratch3				;C - - - - - 0x01E5BE 07:E5AE: 85 03
	LDA scratch1				;C - - - - - 0x01E5C0 07:E5B0: A5 01
	AND #$01					;C - - - - - 0x01E5C2 07:E5B2: 29 01
	STA scratch4				;C - - - - - 0x01E5C4 07:E5B4: 85 04
	LDA #$01					;C - - - - - 0x01E5C6 07:E5B6: A9 01
	STA scratch2				;C - - - - - 0x01E5C8 07:E5B8: 85 02
	JSR CODE_0FE653				;C - - - - - 0x01E5CA 07:E5BA: 20 53 E6

	LDA mapMacroList				;C - - - - - 0x01E5CD 07:E5BD: A5 3C
	CLC							;C - - - - - 0x01E5CF 07:E5BF: 18
	ADC mapMacroListInc				;C - - - - - 0x01E5D0 07:E5C0: 6D 67 03
	STA mapMacroList				;C - - - - - 0x01E5D3 07:E5C3: 85 3C
	LDA mapMacroList+1				;C - - - - - 0x01E5D5 07:E5C5: A5 3D
	ADC #$00					;C - - - - - 0x01E5D7 07:E5C7: 69 00
	STA mapMacroList+1				;C - - - - - 0x01E5D9 07:E5C9: 85 3D

	DEC macroTileCounter				;C - - - - - 0x01E5DB 07:E5CB: CE A8 03
	JMP @end				;C - - - - - 0x01E5DE 07:E5CE: 4C E1 E5
@finish:
	LDA #.LOBYTE(ColorBufferToVRAM)	;C - - - - - 0x01E5E1 07:E5D1: A9 8A
	STA nmiUnbankedSub			;C - - - - - 0x01E5E3 07:E5D3: 85 35
	LDA #.HIBYTE(ColorBufferToVRAM)	;C - - - - - 0x01E5E5 07:E5D5: A9 E3
	STA nmiUnbankedSub+1		;C - - - - - 0x01E5E7 07:E5D7: 85 36

	LDA updateSub				;C - - - - - 0x01E5E9 07:E5D9: A5 19
	STA nmiBankedSub				;C - - - - - 0x01E5EB 07:E5DB: 85 16
	LDA updateSub+1				;C - - - - - 0x01E5ED 07:E5DD: A5 1A
	STA nmiBankedSub+1				;C - - - - - 0x01E5EF 07:E5DF: 85 17
@end:
	RTS							;C - - - - - 0x01E5F1 07:E5E1: 60

DATA_0FE5E2:
	.byte $00					;- D 0 - - - 0x01E5F2 07:E5E2: 00
	.byte $00					;- D 0 - - - 0x01E5F3 07:E5E3: 00
	.byte $10					;- D 0 - - - 0x01E5F4 07:E5E4: 10
	.byte $20					;- - - - - - 0x01E5F5 07:E5E5: 20
	.byte $30					;- - - - - - 0x01E5F6 07:E5E6: 30
	.byte $40					;- - - - - - 0x01E5F7 07:E5E7: 40
	.byte $50					;- - - - - - 0x01E5F8 07:E5E8: 50
	.byte $60					;- - - - - - 0x01E5F9 07:E5E9: 60
	.byte $70					;- - - - - - 0x01E5FA 07:E5EA: 70
	.byte $80					;- - - - - - 0x01E5FB 07:E5EB: 80
	.byte $90					;- - - - - - 0x01E5FC 07:E5EC: 90
	.byte $A0					;- - - - - - 0x01E5FD 07:E5ED: A0
	.byte $B0					;- - - - - - 0x01E5FE 07:E5EE: B0
	.byte $C0					;- - - - - - 0x01E5FF 07:E5EF: C0

CODE_0FE5F0:
	LDA #mapRound20B_ID					;C - - - - - 0x01E600 07:E5F0: A9 65
	STA mapID				;C - - - - - 0x01E602 07:E5F2: 8D 60 03
	LDA #$01					;C - - - - - 0x01E605 07:E5F5: A9 01
	STA wideRound				;C - - - - - 0x01E607 07:E5F7: 8D B0 03
	LDA mapTargetAdr				;C - - - - - 0x01E60A 07:E5FA: A5 49
	CLC							;C - - - - - 0x01E60C 07:E5FC: 18
	ADC #$40					;C - - - - - 0x01E60D 07:E5FD: 69 40
	STA mapTargetAdr				;C - - - - - 0x01E60F 07:E5FF: 85 49
	LDA mapTargetAdr+1				;C - - - - - 0x01E611 07:E601: A5 4A
	ADC #$00					;C - - - - - 0x01E613 07:E603: 69 00
	AND #$F7					;C - - - - - 0x01E615 07:E605: 29 F7
	STA mapTargetAdr+1				;C - - - - - 0x01E617 07:E607: 85 4A

	LDA #.BANK(CODE_059CE5)					;C - - - - - 0x01E619 07:E609: A9 05
	STA nmiPrgBankA				;C - - - - - 0x01E61B 07:E60B: 85 51
	LDA #.LOBYTE(CODE_059CE5)	;C - - - - - 0x01E61D 07:E60D: A9 E5
	STA updateSub				;C - - - - - 0x01E61F 07:E60F: 85 19
	LDA #.HIBYTE(CODE_059CE5)	;C - - - - - 0x01E621 07:E611: A9 9C
	STA updateSub+1				;C - - - - - 0x01E623 07:E613: 85 1A

	LDA #$00					;C - - - - - 0x01E625 07:E615: A9 00
.ifdef REGION_JP
	STA $E000					;- - - - - - 0x01E663 07:E653: 8D
.else
	STA $A000				;C - - - - - 0x01E627 07:E617: 8D 00 A0
.endif
	LDA #$01					;C - - - - - 0x01E62A 07:E61A: A9 01
	STA wideRound				;C - - - - - 0x01E62C 07:E61C: 8D B0 03
	JSR LoadMap				;C - - - - - 0x01E62F 07:E61F: 20 23 E5
	RTS							;C - - - - - 0x01E632 07:E622: 60

DATA_0FE623:
	;Unreached
	.byte $20					;- - - - - - 0x01E633 07:E623: 20
	.byte $24					;- - - - - - 0x01E634 07:E624: 24
	.byte $20					;- - - - - - 0x01E635 07:E625: 20

CODE_0FE626:
	LDA #mapRound40B_ID					;C - - - - - 0x01E636 07:E626: A9 67
	STA mapID				;C - - - - - 0x01E638 07:E628: 8D 60 03
	LDX vNametable				;C - - - - - 0x01E63B 07:E62B: A6 2D
	LDA #$00					;C - - - - - 0x01E63D 07:E62D: A9 00
	STA mapTargetAdr				;C - - - - - 0x01E63F 07:E62F: 85 49
	LDA DATA_0FE650,X			;C - - - - - 0x01E641 07:E631: BD 50 E6
	STA mapTargetAdr+1				;C - - - - - 0x01E644 07:E634: 85 4A
	LDA #$00					;C - - - - - 0x01E646 07:E636: A9 00
	STA wideRound				;C - - - - - 0x01E648 07:E638: 8D B0 03

.ifdef REGION_JP
	LDA #$40
	STA $E000
.else
	LDA #$01					;C - - - - - 0x01E64B 07:E63B: A9 01
	STA $A000				;C - - - - - 0x01E64D 07:E63D: 8D 00 A0
.endif
	LDA #.BANK(CODE_059D30)					;C - - - - - 0x01E650 07:E640: A9 05
	STA nmiPrgBankA				;C - - - - - 0x01E652 07:E642: 85 51

	LDA #.LOBYTE(CODE_059D30)	;C - - - - - 0x01E654 07:E644: A9 30
	STA updateSub				;C - - - - - 0x01E656 07:E646: 85 19
	LDA #.HIBYTE(CODE_059D30)	;C - - - - - 0x01E658 07:E648: A9 9D
	STA updateSub+1				;C - - - - - 0x01E65A 07:E64A: 85 1A

	JSR LoadMap				;C - - - - - 0x01E65C 07:E64C: 20 23 E5
	RTS							;C - - - - - 0x01E65F 07:E64F: 60

DATA_0FE650:
	.byte $28					;- D 0 - - - 0x01E660 07:E650: 28
	.byte $20					;- - - - - - 0x01E661 07:E651: 20
	.byte $28					;- - - - - - 0x01E662 07:E652: 28

CODE_0FE653:
	LDY #$00					;C - - - - - 0x01E663 07:E653: A0 00
CODE_0FE655:
	LDA mapAttrBuffer,Y				;C - - - - - 0x01E665 07:E655: B9 20 03
	LDX #$00					;C - - - - - 0x01E668 07:E658: A2 00
CODE_0FE65A:
	CPX scratch1				;C - - - - - 0x01E66A 07:E65A: E4 01
	BEQ CODE_0FE664				;C - - - - - 0x01E66C 07:E65C: F0 06
		ASL							;C - - - - - 0x01E66E 07:E65E: 0A
		ASL							;C - - - - - 0x01E66F 07:E65F: 0A
		INX							;C - - - - - 0x01E670 07:E660: E8
		JMP CODE_0FE65A				;C - - - - - 0x01E671 07:E661: 4C 5A E6
CODE_0FE664:
	STA scratch5				;C - - - - - 0x01E674 07:E664: 85 05
	LDA DATA_0FE68C,X			;C - - - - - 0x01E676 07:E666: BD 8C E6
	STA scratch0				;C - - - - - 0x01E679 07:E669: 85 00
	LDX scratch6				;C - - - - - 0x01E67B 07:E66B: A6 06
	LDA ram_03B1,X				;C - - - - - 0x01E67D 07:E66D: BD B1 03
	AND scratch0				;C - - - - - 0x01E680 07:E670: 25 00
	ORA scratch5				;C - - - - - 0x01E682 07:E672: 05 05
	STA ram_03B1,X				;C - - - - - 0x01E684 07:E674: 9D B1 03
	LDA scratch1				;C - - - - - 0x01E687 07:E677: A5 01
	EOR scratch2				;C - - - - - 0x01E689 07:E679: 45 02
	STA scratch1				;C - - - - - 0x01E68B 07:E67B: 85 01
	TYA							;C - - - - - 0x01E68D 07:E67D: 98
	AND #$01					;C - - - - - 0x01E68E 07:E67E: 29 01
	EOR scratch4				;C - - - - - 0x01E690 07:E680: 45 04
	BEQ CODE_0FE686				;C - - - - - 0x01E692 07:E682: F0 02
		INC scratch6				;C - - - - - 0x01E694 07:E684: E6 06
CODE_0FE686:
	INY							;C - - - - - 0x01E696 07:E686: C8
	CPY scratch3				;C - - - - - 0x01E697 07:E687: C4 03
	BNE CODE_0FE655				;C - - - - - 0x01E699 07:E689: D0 CA

	RTS							;C - - - - - 0x01E69B 07:E68B: 60

DATA_0FE68C:
	.byte $FC					;- D 0 - - - 0x01E69C 07:E68C: FC
	.byte $F3					;- D 0 - - - 0x01E69D 07:E68D: F3
	.byte $CF					;- D 0 - - - 0x01E69E 07:E68E: CF
	.byte $3F					;- D 0 - - - 0x01E69F 07:E68F: 3F

CODE_0FE690:
	;Unreached
	LDY #$00					;- - - - - - 0x01E6A0 07:E690: A0
CODE_0FE692:
	LDA mapAttrBuffer,Y				;- - - - - - 0x01E6A2 07:E692: B9
	LDX #$00					;- - - - - - 0x01E6A5 07:E695: A2
CODE_0FE697:
	CPX scratch1				;- - - - - - 0x01E6A7 07:E697: E4
	BEQ CODE_0FE6A1				;- - - - - - 0x01E6A9 07:E699: F0
		ASL A						;- - - - - - 0x01E6AB 07:E69B: 0A
		ASL A						;- - - - - - 0x01E6AC 07:E69C: 0A
		INX							;- - - - - - 0x01E6AD 07:E69D: E8
		JMP CODE_0FE697				;- - - - - - 0x01E6AE 07:E69E: 4C
CODE_0FE6A1:
	STA scratch5				;- - - - - - 0x01E6B1 07:E6A1: 85
	LDA DATA_0FE68C,X			;- - - - - - 0x01E6B3 07:E6A3: BD
	STA scratch0				;- - - - - - 0x01E6B6 07:E6A6: 85
	LDX scratch6				;- - - - - - 0x01E6B8 07:E6A8: A6
	LDA ram_03B1,X				;- - - - - - 0x01E6BA 07:E6AA: BD
	AND scratch0				;- - - - - - 0x01E6BD 07:E6AD: 25
	ORA scratch5				;- - - - - - 0x01E6BF 07:E6AF: 05
	STA ram_03B1,X				;- - - - - - 0x01E6C1 07:E6B1: 9D
	LDA scratch1				;- - - - - - 0x01E6C4 07:E6B4: A5
	EOR scratch2				;- - - - - - 0x01E6C6 07:E6B6: 45
	STA scratch1				;- - - - - - 0x01E6C8 07:E6B8: 85
	TYA							;- - - - - - 0x01E6CA 07:E6BA: 98
	AND #$01					;- - - - - - 0x01E6CB 07:E6BB: 29
	EOR scratch4				;- - - - - - 0x01E6CD 07:E6BD: 45
	BEQ CODE_0FE6C8				;- - - - - - 0x01E6CF 07:E6BF: F0
		LDA scratch6				;- - - - - - 0x01E6D1 07:E6C1: A5
		CLC							;- - - - - - 0x01E6D3 07:E6C3: 18
		ADC #$08					;- - - - - - 0x01E6D4 07:E6C4: 69
		STA scratch6				;- - - - - - 0x01E6D6 07:E6C6: 85
CODE_0FE6C8:
	INY							;- - - - - - 0x01E6D8 07:E6C8: C8
	CPY scratch3				;- - - - - - 0x01E6D9 07:E6C9: C4
	BNE CODE_0FE692				;- - - - - - 0x01E6DB 07:E6CB: D0
	RTS							;- - - - - - 0x01E6DD 07:E6CD: 60

MacroRowToBuffer:
	;Read one row of 16x16 macro tiles (fills buffer with 64 8x8 tiles)
	LDA #$00					;C - - - - - 0x01E6DE 07:E6CE: A9 00
	PHA							;C - - - - - 0x01E6E0 07:E6D0: 48
@readmacro:
	LDX #$00					;C - - - - - 0x01E6E1 07:E6D1: A2 00
	STX scratch5				;C - - - - - 0x01E6E3 07:E6D3: 86 05

	;Read 16x16 tile number
	LDA (mapMacroList,X)		;C - - - - - 0x01E6E5 07:E6D5: A1 3C
	STA scratch4				;C - - - - - 0x01E6E7 07:E6D7: 85 04
	ASL							;C - - - - - 0x01E6E9 07:E6D9: 0A
	ROL scratch5				;C - - - - - 0x01E6EA 07:E6DA: 26 05
	ASL							;C - - - - - 0x01E6EC 07:E6DC: 0A
	ROL scratch5				;C - - - - - 0x01E6ED 07:E6DD: 26 05
	CLC							;C - - - - - 0x01E6EF 07:E6DF: 18
	ADC scratch4				;C - - - - - 0x01E6F0 07:E6E0: 65 04
	STA scratch4				;C - - - - - 0x01E6F2 07:E6E2: 85 04
	LDA #$00					;C - - - - - 0x01E6F4 07:E6E4: A9 00
	ADC scratch5				;C - - - - - 0x01E6F6 07:E6E6: 65 05
	STA scratch5				;C - - - - - 0x01E6F8 07:E6E8: 85 05
	;Now times 5

	LDA mapMacroDefs				;C - - - - - 0x01E6FA 07:E6EA: A5 3E
	CLC							;C - - - - - 0x01E6FC 07:E6EC: 18
	ADC scratch4				;C - - - - - 0x01E6FD 07:E6ED: 65 04
	STA scratch4				;C - - - - - 0x01E6FF 07:E6EF: 85 04
	LDA mapMacroDefs+1				;C - - - - - 0x01E701 07:E6F1: A5 3F
	ADC scratch5				;C - - - - - 0x01E703 07:E6F3: 65 05
	STA scratch5				;C - - - - - 0x01E705 07:E6F5: 85 05
	LDY #$00					;C - - - - - 0x01E707 07:E6F7: A0 00
	PLA							;C - - - - - 0x01E709 07:E6F9: 68
	PHA							;C - - - - - 0x01E70A 07:E6FA: 48
	LSR							;C - - - - - 0x01E70B 07:E6FB: 4A
	LSR							;C - - - - - 0x01E70C 07:E6FC: 4A
	TAX							;C - - - - - 0x01E70D 07:E6FD: AA

	;Read attribute byte
	LDA (scratch4),Y			;C - - - - - 0x01E70E 07:E6FE: B1 04
	CLC							;C - - - - - 0x01E710 07:E700: 18
	ADC scratch0				;C - - - - - 0x01E711 07:E701: 65 00
	STA mapAttrBuffer,X				;C - - - - - 0x01E713 07:E703: 9D 20 03
	PLA							;C - - - - - 0x01E716 07:E706: 68
	TAX							;C - - - - - 0x01E717 07:E707: AA
@readpiece:
	;Read the four 8x8 tile numbers
	;01: Base tile number
	INY							;C - - - - - 0x01E718 07:E708: C8
	LDA (scratch4),Y			;C - - - - - 0x01E719 07:E709: B1 04
	CLC							;C - - - - - 0x01E71B 07:E70B: 18
	ADC scratch1				;C - - - - - 0x01E71C 07:E70C: 65 01
	STA mapBuffer,X				;C - - - - - 0x01E71E 07:E70E: 9D 68 03
	INX							;C - - - - - 0x01E721 07:E711: E8
	CPY #$04					;C - - - - - 0x01E722 07:E712: C0 04
	BNE @readpiece				;C - - - - - 0x01E724 07:E714: D0 F2

	LDA mapMacroList				;C - - - - - 0x01E726 07:E716: A5 3C
	CLC							;C - - - - - 0x01E728 07:E718: 18
	ADC scratch8				;C - - - - - 0x01E729 07:E719: 65 08
	STA mapMacroList				;C - - - - - 0x01E72B 07:E71B: 85 3C
	LDA #$00					;C - - - - - 0x01E72D 07:E71D: A9 00
	ADC mapMacroList+1				;C - - - - - 0x01E72F 07:E71F: 65 3D
	STA mapMacroList+1				;C - - - - - 0x01E731 07:E721: 85 3D

	TXA							;C - - - - - 0x01E733 07:E723: 8A
	PHA							;C - - - - - 0x01E734 07:E724: 48
	DEC scratch6				;C - - - - - 0x01E735 07:E725: C6 06
	BNE @readmacro				;C - - - - - 0x01E737 07:E727: D0 A8

	PLA							;C - - - - - 0x01E739 07:E729: 68
	RTS							;C - - - - - 0x01E73A 07:E72A: 60

MapChunkToNametable:
	LDA PPUSTATUS				;C - - - - - 0x01E73B 07:E72B: AD 02 20
	LDA mapTargetAdr+1				;C - - - - - 0x01E73E 07:E72E: A5 4A
	STA PPUADDR				;C - - - - - 0x01E740 07:E730: 8D 06 20
	LDA mapTargetAdr				;C - - - - - 0x01E743 07:E733: A5 49
	STA PPUADDR				;C - - - - - 0x01E745 07:E735: 8D 06 20

	;04: how far ahead X should be of Y (usually 01)
	;05: buffer start pos (usually 00 or 02)
	;06: Amount of copy operations (two bytes each)
	LDA scratch5				;C - - - - - 0x01E748 07:E738: A5 05
	TAY							;C - - - - - 0x01E74A 07:E73A: A8
	CLC							;C - - - - - 0x01E74B 07:E73B: 18
	ADC scratch4				;C - - - - - 0x01E74C 07:E73C: 65 04
	TAX							;C - - - - - 0x01E74E 07:E73E: AA
	LDA scratch6				;C - - - - - 0x01E74F 07:E73F: A5 06
	ASL							;C - - - - - 0x01E751 07:E741: 0A
	ASL							;C - - - - - 0x01E752 07:E742: 0A
	ADC scratch5				;C - - - - - 0x01E753 07:E743: 65 05
	STA scratch5				;C - - - - - 0x01E755 07:E745: 85 05
CODE_0FE747:
	LDA mapBuffer,Y				;C - - - - - 0x01E757 07:E747: B9 68 03
	STA PPUDATA				;C - - - - - 0x01E75A 07:E74A: 8D 07 20
	INY							;C - - - - - 0x01E75D 07:E74D: C8
	INY							;C - - - - - 0x01E75E 07:E74E: C8
	INY							;C - - - - - 0x01E75F 07:E74F: C8
	INY							;C - - - - - 0x01E760 07:E750: C8
	LDA mapBuffer,X				;C - - - - - 0x01E761 07:E751: BD 68 03
	STA PPUDATA				;C - - - - - 0x01E764 07:E754: 8D 07 20
	INX							;C - - - - - 0x01E767 07:E757: E8
	INX							;C - - - - - 0x01E768 07:E758: E8
	INX							;C - - - - - 0x01E769 07:E759: E8
	INX							;C - - - - - 0x01E76A 07:E75A: E8
	CPY scratch5				;C - - - - - 0x01E76B 07:E75B: C4 05
	BNE CODE_0FE747				;C - - - - - 0x01E76D 07:E75D: D0 E8
	RTS							;C - - - - - 0x01E76F 07:E75F: 60

DATA_0FE760:
	;Unreached
	.byte $00					;- - - - - - 0x01E770 07:E760: 00
	.byte $02					;- - - - - - 0x01E771 07:E761: 02
	.byte $00					;- - - - - - 0x01E772 07:E762: 00
	.byte $01					;- - - - - - 0x01E773 07:E763: 01
	.byte $00					;- - - - - - 0x01E774 07:E764: 00
	.byte $02					;- - - - - - 0x01E775 07:E765: 02
	.byte $01					;- - - - - - 0x01E776 07:E766: 01
	.byte $03					;- - - - - - 0x01E777 07:E767: 03
	.byte $02					;- - - - - - 0x01E778 07:E768: 02
	.byte $03					;- - - - - - 0x01E779 07:E769: 03
	.byte $01					;- - - - - - 0x01E77A 07:E76A: 01
	.byte $03					;- - - - - - 0x01E77B 07:E76B: 03
	.byte $40					;- - - - - - 0x01E77C 07:E76C: 40
	.byte $42					;- - - - - - 0x01E77D 07:E76D: 42
	.byte $14					;- - - - - - 0x01E77E 07:E76E: 14
	.byte $15					;- - - - - - 0x01E77F 07:E76F: 15
	.byte $38					;- - - - - - 0x01E780 07:E770: 38
	.byte $3A					;- - - - - - 0x01E781 07:E771: 3A

RunBankedSub:
	LDA bankedSubBank				;C - - - - - 0x01E782 07:E772: A5 57

.ifdef REGION_JP
	STA prgBankA
	STA $8000
.else
	STA newPrgBank				;C - - - - - 0x01E784 07:E774: 85 3B
	JSR SwapPrgBankA				;C - - - - - 0x01E786 07:E776: 20 3D FF
.endif

	LDA bankedSubRetBank				;C - - - - - 0x01E789 07:E779: A5 58
	PHA							;C - - - - - 0x01E78B 07:E77B: 48
	LDA #.HIBYTE(@ret-1)					;C - - - - - 0x01E78C 07:E77C: A9 E7
	PHA							;C - - - - - 0x01E78E 07:E77E: 48
	LDA #.LOBYTE(@ret-1)					;C - - - - - 0x01E78F 07:E77F: A9 85
	PHA							;C - - - - - 0x01E791 07:E781: 48
	JMP (bankedSub)				;C - - - - - 0x01E792 07:E782: 6C 55 00
	;Unreached
	NOP							;- - - - - - 0x01E795 07:E785: EA
@ret:
	PLA							;C - - - - - 0x01E796 07:E786: 68
	STA bankedSubRetBank				;C - - - - - 0x01E797 07:E787: 85 58
	LDA bankedSubRetBank				;C - - - - - 0x01E799 07:E789: A5 58

.ifdef REGION_JP
	STA prgBankA
	STA $8000
.else
	STA newPrgBank				;C - - - - - 0x01E79B 07:E78B: 85 3B
	JSR SwapPrgBankA				;C - - - - - 0x01E79D 07:E78D: 20 3D FF
.endif
	RTS							;C - - - - - 0x01E7A0 07:E790: 60

CODE_0FE791:
	LDA #$02					;C - - - - - 0x01E7A1 07:E791: A9 02
	AND mapTargetAdr				;C - - - - - 0x01E7A3 07:E793: 25 49
	LSR							;C - - - - - 0x01E7A5 07:E795: 4A
	STA scratch1				;C - - - - - 0x01E7A6 07:E796: 85 01
	LDA #$40					;C - - - - - 0x01E7A8 07:E798: A9 40
	AND mapTargetAdr				;C - - - - - 0x01E7AA 07:E79A: 25 49
	BEQ CODE_0FE7A5				;C - - - - - 0x01E7AC 07:E79C: F0 07
		LDA scratch1				;C - - - - - 0x01E7AE 07:E79E: A5 01
		CLC							;C - - - - - 0x01E7B0 07:E7A0: 18
		ADC #$02					;C - - - - - 0x01E7B1 07:E7A1: 69 02
		STA scratch1				;C - - - - - 0x01E7B3 07:E7A3: 85 01
CODE_0FE7A5:
	LDA mapTargetAdr				;C - - - - - 0x01E7B5 07:E7A5: A5 49
	STA scratch6				;C - - - - - 0x01E7B7 07:E7A7: 85 06
	LDA wideRound				;C - - - - - 0x01E7B9 07:E7A9: AD B0 03
	BEQ CODE_0FE7B5				;C - - - - - 0x01E7BC 07:E7AC: F0 07
		LDA #$07					;C - - - - - 0x01E7BE 07:E7AE: A9 07
		STA scratch0				;C - - - - - 0x01E7C0 07:E7B0: 85 00
		JMP CODE_0FE7B9				;C - - - - - 0x01E7C2 07:E7B2: 4C B9 E7
CODE_0FE7B5:
	LDA #$0F					;C - - - - - 0x01E7C5 07:E7B5: A9 0F
	STA scratch0				;C - - - - - 0x01E7C7 07:E7B7: 85 00
CODE_0FE7B9:
	LDA mapTargetAdr+1				;C - - - - - 0x01E7C9 07:E7B9: A5 4A
	AND scratch0				;C - - - - - 0x01E7CB 07:E7BB: 25 00
	STA scratch7				;C - - - - - 0x01E7CD 07:E7BD: 85 07
	CLC							;C - - - - - 0x01E7CF 07:E7BF: 18
	ASL scratch6				;C - - - - - 0x01E7D0 07:E7C0: 06 06
	ROL scratch7				;C - - - - - 0x01E7D2 07:E7C2: 26 07
	ASL scratch7				;C - - - - - 0x01E7D4 07:E7C4: 06 07
	ASL scratch7				;C - - - - - 0x01E7D6 07:E7C6: 06 07
	ASL scratch7				;C - - - - - 0x01E7D8 07:E7C8: 06 07
	CLC							;C - - - - - 0x01E7DA 07:E7CA: 18
	LDA mapTargetAdr				;C - - - - - 0x01E7DB 07:E7CB: A5 49
	AND #$1C					;C - - - - - 0x01E7DD 07:E7CD: 29 1C
	LSR							;C - - - - - 0x01E7DF 07:E7CF: 4A
	LSR							;C - - - - - 0x01E7E0 07:E7D0: 4A
	ADC scratch7				;C - - - - - 0x01E7E1 07:E7D1: 65 07
	STA scratch6				;C - - - - - 0x01E7E3 07:E7D3: 85 06
	STA ram_03AF				;C - - - - - 0x01E7E5 07:E7D5: 8D AF 03
	LDA ram_03AF				;C - - - - - 0x01E7E8 07:E7D8: AD AF 03
	AND #$3F					;C - - - - - 0x01E7EB 07:E7DB: 29 3F
	TAX							;C - - - - - 0x01E7ED 07:E7DD: AA
	LDA DATA_0FE80C,X			;C - - - - - 0x01E7EE 07:E7DE: BD 0C E8
	STA ram_03AA				;C - - - - - 0x01E7F1 07:E7E1: 8D AA 03

	LDA wideRound				;C - - - - - 0x01E7F4 07:E7E4: AD B0 03
	BEQ CODE_0FE7FC				;C - - - - - 0x01E7F7 07:E7E7: F0 13
		CLC							;C - - - - - 0x01E7F9 07:E7E9: 18
		LDA ram_03AF				;C - - - - - 0x01E7FA 07:E7EA: AD AF 03
		AND #$40					;C - - - - - 0x01E7FD 07:E7ED: 29 40
		ROL							;C - - - - - 0x01E7FF 07:E7EF: 2A
		ROL							;C - - - - - 0x01E800 07:E7F0: 2A
		ROL							;C - - - - - 0x01E801 07:E7F1: 2A
		TAX							;C - - - - - 0x01E802 07:E7F2: AA
		LDA DATA_0FE84E,X			;C - - - - - 0x01E803 07:E7F3: BD 4E E8
		STA ram_03AB				;C - - - - - 0x01E806 07:E7F6: 8D AB 03
		JMP CODE_0FE80B				;C - - - - - 0x01E809 07:E7F9: 4C 0B E8
CODE_0FE7FC:
	CLC							;C - - - - - 0x01E80C 07:E7FC: 18
	LDA ram_03AF				;C - - - - - 0x01E80D 07:E7FD: AD AF 03
	AND #$80					;C - - - - - 0x01E810 07:E800: 29 80
	ROL							;C - - - - - 0x01E812 07:E802: 2A
	ROL							;C - - - - - 0x01E813 07:E803: 2A
	TAX							;C - - - - - 0x01E814 07:E804: AA
	LDA DATA_0FE84C,X			;C - - - - - 0x01E815 07:E805: BD 4C E8
	STA ram_03AB				;C - - - - - 0x01E818 07:E808: 8D AB 03
CODE_0FE80B:
	RTS							;C - - - - - 0x01E81B 07:E80B: 60

DATA_0FE80C:
	.byte $C0					;- D 0 - - - 0x01E81C 07:E80C: C0
	.byte $C1					;- - - - - - 0x01E81D 07:E80D: C1
	.byte $C2					;- - - - - - 0x01E81E 07:E80E: C2
	.byte $C3					;- - - - - - 0x01E81F 07:E80F: C3
	.byte $C4					;- - - - - - 0x01E820 07:E810: C4
	.byte $C5					;- - - - - - 0x01E821 07:E811: C5
	.byte $C6					;- - - - - - 0x01E822 07:E812: C6
	.byte $C7					;- - - - - - 0x01E823 07:E813: C7
	.byte $C8					;- D 0 - - - 0x01E824 07:E814: C8
	.byte $C9					;- D 0 - - - 0x01E825 07:E815: C9
	.byte $CA					;- D 0 - - - 0x01E826 07:E816: CA
	.byte $CB					;- D 0 - - - 0x01E827 07:E817: CB
	.byte $CC					;- - - - - - 0x01E828 07:E818: CC
	.byte $CD					;- D 0 - - - 0x01E829 07:E819: CD
	.byte $CE					;- - - - - - 0x01E82A 07:E81A: CE
	.byte $CF					;- - - - - - 0x01E82B 07:E81B: CF
	.byte $D0					;- D 0 - - - 0x01E82C 07:E81C: D0
	.byte $D1					;- D 0 - - - 0x01E82D 07:E81D: D1
	.byte $D2					;- D 0 - - - 0x01E82E 07:E81E: D2
	.byte $D3					;- D 0 - - - 0x01E82F 07:E81F: D3
	.byte $D4					;- - - - - - 0x01E830 07:E820: D4
	.byte $D5					;- D 0 - - - 0x01E831 07:E821: D5
	.byte $D6					;- - - - - - 0x01E832 07:E822: D6
	.byte $D7					;- - - - - - 0x01E833 07:E823: D7
	.byte $D8					;- D 0 - - - 0x01E834 07:E824: D8
	.byte $D9					;- D 0 - - - 0x01E835 07:E825: D9
	.byte $DA					;- D 0 - - - 0x01E836 07:E826: DA
	.byte $DB					;- D 0 - - - 0x01E837 07:E827: DB
	.byte $DC					;- - - - - - 0x01E838 07:E828: DC
	.byte $DD					;- D 0 - - - 0x01E839 07:E829: DD
	.byte $DE					;- D 0 - - - 0x01E83A 07:E82A: DE
	.byte $DF					;- - - - - - 0x01E83B 07:E82B: DF
	.byte $E0					;- D 0 - - - 0x01E83C 07:E82C: E0
	.byte $E1					;- D 0 - - - 0x01E83D 07:E82D: E1
	.byte $E2					;- D 0 - - - 0x01E83E 07:E82E: E2
	.byte $E3					;- D 0 - - - 0x01E83F 07:E82F: E3
	.byte $E4					;- - - - - - 0x01E840 07:E830: E4
	.byte $E5					;- D 0 - - - 0x01E841 07:E831: E5
	.byte $E6					;- D 0 - - - 0x01E842 07:E832: E6
	.byte $E7					;- - - - - - 0x01E843 07:E833: E7
	.byte $E8					;- D 0 - - - 0x01E844 07:E834: E8
	.byte $E9					;- - - - - - 0x01E845 07:E835: E9
	.byte $EA					;- D 0 - - - 0x01E846 07:E836: EA
	.byte $EB					;- D 0 - - - 0x01E847 07:E837: EB
	.byte $EC					;- - - - - - 0x01E848 07:E838: EC
	.byte $ED					;- - - - - - 0x01E849 07:E839: ED
	.byte $EE					;- D 0 - - - 0x01E84A 07:E83A: EE
	.byte $EF					;- - - - - - 0x01E84B 07:E83B: EF
	.byte $F0					;- D 0 - - - 0x01E84C 07:E83C: F0
	.byte $F1					;- - - - - - 0x01E84D 07:E83D: F1
	.byte $F2					;- - - - - - 0x01E84E 07:E83E: F2
	.byte $F3					;- D 0 - - - 0x01E84F 07:E83F: F3
	.byte $F4					;- - - - - - 0x01E850 07:E840: F4
	.byte $F5					;- - - - - - 0x01E851 07:E841: F5
	.byte $F6					;- - - - - - 0x01E852 07:E842: F6
	.byte $F7					;- - - - - - 0x01E853 07:E843: F7
	.byte $F8					;- D 0 - - - 0x01E854 07:E844: F8
	.byte $F9					;- - - - - - 0x01E855 07:E845: F9
	.byte $FA					;- - - - - - 0x01E856 07:E846: FA
	.byte $FB					;- - - - - - 0x01E857 07:E847: FB
	.byte $FC					;- - - - - - 0x01E858 07:E848: FC
	.byte $FD					;- - - - - - 0x01E859 07:E849: FD
	.byte $FE					;- - - - - - 0x01E85A 07:E84A: FE
	.byte $FF					;- - - - - - 0x01E85B 07:E84B: FF

DATA_0FE84C:
	.byte $23					;- D 0 - - - 0x01E85C 07:E84C: 23
	.byte $2B					;- D 0 - - - 0x01E85D 07:E84D: 2B

DATA_0FE84E:
	.byte $23					;- D 0 - - - 0x01E85E 07:E84E: 23
	.byte $27					;- D 0 - - - 0x01E85F 07:E84F: 27

RunColorFader:
	LDA globalTimer				;C - - - - - 0x01E860 07:E850: A5 14
	AND fadeSpeedMask				;C - - - - - 0x01E862 07:E852: 2D 57 05
	BNE @end				;C - - - - - 0x01E865 07:E855: D0 40

	LDA fadeColorsAdr				;C - - - - - 0x01E867 07:E857: AD 5A 05
	STA scratch2				;C - - - - - 0x01E86A 07:E85A: 85 02
	LDA fadeColorsAdr+1				;C - - - - - 0x01E86C 07:E85C: AD 5B 05
	STA scratch3				;C - - - - - 0x01E86F 07:E85F: 85 03

	LDA fadeColorsAmount				;C - - - - - 0x01E871 07:E861: AD 55 05
	STA scratch8				;C - - - - - 0x01E874 07:E864: 85 08

	LDA fadeMode				;C - - - - - 0x01E876 07:E866: AD 53 05
	CMP #FADE_OUT					;C - - - - - 0x01E879 07:E869: C9 00
	BNE @notout				;C - - - - - 0x01E87B 07:E86B: D0 06
		JSR DarkenColors				;C - - - - - 0x01E87D 07:E86D: 20 D6 E8
		JMP @passdone				;C - - - - - 0x01E880 07:E870: 4C 8A E8
@notout:
	CMP #FADE_IN					;C - - - - - 0x01E883 07:E873: C9 01
	BNE @notin				;C - - - - - 0x01E885 07:E875: D0 10
		LDA fadeMaxColorsAdr				;C - - - - - 0x01E887 07:E877: AD 58 05
		STA scratch0				;C - - - - - 0x01E88A 07:E87A: 85 00
		LDA fadeMaxColorsAdr+1				;C - - - - - 0x01E88C 07:E87C: AD 59 05
		STA scratch1				;C - - - - - 0x01E88F 07:E87F: 85 01

		JSR BrightenColorsToMatch				;C - - - - - 0x01E891 07:E881: 20 98 E8
		JMP @passdone				;C - - - - - 0x01E894 07:E884: 4C 8A E8
@notin:
	;FADE_WHITE
	JSR BrightenColors				;C - - - - - 0x01E897 07:E887: 20 04 E9
@passdone:
	DEC fadePasses				;C - - - - - 0x01E89A 07:E88A: CE 54 05
	BNE @end				;C - - - - - 0x01E89D 07:E88D: D0 08
		LDA updateSub				;C - - - - - 0x01E89F 07:E88F: A5 19
		STA nmiBankedSub				;C - - - - - 0x01E8A1 07:E891: 85 16
		LDA updateSub+1				;C - - - - - 0x01E8A3 07:E893: A5 1A
		STA nmiBankedSub+1				;C - - - - - 0x01E8A5 07:E895: 85 17
@end:
	RTS							;C - - - - - 0x01E8A7 07:E897: 60

BrightenColorsToMatch:
	;00: Unfaded colors adr
	;02: Current colors adr
	;08: Colors amount
@adjust:
	LDX #$00					;C - - - - - 0x01E8A8 07:E898: A2 00
	LDA (scratch0,X)			;C - - - - - 0x01E8AA 07:E89A: A1 00
	AND #$30					;C - - - - - 0x01E8AC 07:E89C: 29 30
	STA scratch4				;C - - - - - 0x01E8AE 07:E89E: 85 04

	LDA (scratch2,X)			;C - - - - - 0x01E8B0 07:E8A0: A1 02
	AND #$30					;C - - - - - 0x01E8B2 07:E8A2: 29 30
	STA scratch5				;C - - - - - 0x01E8B4 07:E8A4: 85 05
	CMP scratch4				;C - - - - - 0x01E8B6 07:E8A6: C5 04
	BEQ @write				;C - - - - - 0x01E8B8 07:E8A8: F0 05
		;Brighten
		CLC							;C - - - - - 0x01E8BA 07:E8AA: 18
		ADC #$10					;C - - - - - 0x01E8BB 07:E8AB: 69 10
		STA scratch5				;C - - - - - 0x01E8BD 07:E8AD: 85 05
@write:
	LDA (scratch0,X)			;C - - - - - 0x01E8BF 07:E8AF: A1 00
	AND #$0F					;C - - - - - 0x01E8C1 07:E8B1: 29 0F
	ORA scratch5				;C - - - - - 0x01E8C3 07:E8B3: 05 05
	STA (scratch2,X)			;C - - - - - 0x01E8C5 07:E8B5: 81 02

	LDX #$00					;C - - - - - 0x01E8C7 07:E8B7: A2 00
@bumpadr:
	LDA scratch0,X				;C - - - - - 0x01E8C9 07:E8B9: B5 00
	CLC							;C - - - - - 0x01E8CB 07:E8BB: 18
	ADC #$01					;C - - - - - 0x01E8CC 07:E8BC: 69 01
	STA scratch0,X				;C - - - - - 0x01E8CE 07:E8BE: 95 00

	LDA scratch1,X				;C - - - - - 0x01E8D0 07:E8C0: B5 01
	ADC #$00					;C - - - - - 0x01E8D2 07:E8C2: 69 00
	STA scratch1,X				;C - - - - - 0x01E8D4 07:E8C4: 95 01

	INX							;C - - - - - 0x01E8D6 07:E8C6: E8
	INX							;C - - - - - 0x01E8D7 07:E8C7: E8
	CPX #$04					;C - - - - - 0x01E8D8 07:E8C8: E0 04
	BNE @bumpadr				;C - - - - - 0x01E8DA 07:E8CA: D0 ED

	DEC scratch8				;C - - - - - 0x01E8DC 07:E8CC: C6 08
	BNE @adjust				;C - - - - - 0x01E8DE 07:E8CE: D0 C8

	RTS							;C - - - - - 0x01E8E0 07:E8D0: 60

DATA_0FE8D1:
	;Unreached
	.byte $00					;- - - - - - 0x01E8E1 07:E8D1: 00
	.byte $30					;- - - - - - 0x01E8E2 07:E8D2: 30
	.byte $20					;- - - - - - 0x01E8E3 07:E8D3: 20
	.byte $10					;- - - - - - 0x01E8E4 07:E8D4: 10
	.byte $00					;- - - - - - 0x01E8E5 07:E8D5: 00

DarkenColors:
	;02: Colors adr
	;08: Amount of colors

	LDX #$00					;C - - - - - 0x01E8E6 07:E8D6: A2 00
@read:
	LDA (scratch2,X)			;C - - - - - 0x01E8E8 07:E8D8: A1 02
	AND #$30					;C - - - - - 0x01E8EA 07:E8DA: 29 30
	STA scratch5				;C - - - - - 0x01E8EC 07:E8DC: 85 05
	BNE @darken				;C - - - - - 0x01E8EE 07:E8DE: D0 05
		;Set to black if on darkest shade
		LDA #$0F					;C - - - - - 0x01E8F0 07:E8E0: A9 0F
		JMP @write				;C - - - - - 0x01E8F2 07:E8E2: 4C F0 E8
@darken:
	SEC							;C - - - - - 0x01E8F5 07:E8E5: 38
	SBC #$10					;C - - - - - 0x01E8F6 07:E8E6: E9 10
	STA scratch5				;C - - - - - 0x01E8F8 07:E8E8: 85 05

	LDA (scratch2,X)			;C - - - - - 0x01E8FA 07:E8EA: A1 02
	AND #$0F					;C - - - - - 0x01E8FC 07:E8EC: 29 0F
	ORA scratch5				;C - - - - - 0x01E8FE 07:E8EE: 05 05
@write:
	STA (scratch2,X)			;C - - - - - 0x01E900 07:E8F0: 81 02

	LDA scratch2				;C - - - - - 0x01E902 07:E8F2: A5 02
	CLC							;C - - - - - 0x01E904 07:E8F4: 18
	ADC #$01					;C - - - - - 0x01E905 07:E8F5: 69 01
	STA scratch2				;C - - - - - 0x01E907 07:E8F7: 85 02

	LDA scratch3				;C - - - - - 0x01E909 07:E8F9: A5 03
	ADC #$00					;C - - - - - 0x01E90B 07:E8FB: 69 00
	STA scratch3				;C - - - - - 0x01E90D 07:E8FD: 85 03

	DEC scratch8				;C - - - - - 0x01E90F 07:E8FF: C6 08
	BNE @read				;C - - - - - 0x01E911 07:E901: D0 D5

	RTS							;C - - - - - 0x01E913 07:E903: 60

BrightenColors:
	;02: Colors adr
	;08: Amount of colors

	LDX #$00					;C - - - - - 0x01E914 07:E904: A2 00
@read:
	LDA (scratch2,X)			;C - - - - - 0x01E916 07:E906: A1 02
	AND #$30					;C - - - - - 0x01E918 07:E908: 29 30
	STA scratch5				;C - - - - - 0x01E91A 07:E90A: 85 05
	CMP #$30					;C - - - - - 0x01E91C 07:E90C: C9 30
	BNE @brighten				;C - - - - - 0x01E91E 07:E90E: D0 03
		JMP @write				;C - - - - - 0x01E920 07:E910: 4C 27 E9
@brighten:
	CLC							;C - - - - - 0x01E923 07:E913: 18
	ADC #$10					;C - - - - - 0x01E924 07:E914: 69 10
	STA scratch5				;C - - - - - 0x01E926 07:E916: 85 05

	LDA (scratch2,X)			;C - - - - - 0x01E928 07:E918: A1 02
	AND #$0F					;C - - - - - 0x01E92A 07:E91A: 29 0F
	CMP #$0F					;C - - - - - 0x01E92C 07:E91C: C9 0F
	BNE @merge				;C - - - - - 0x01E92E 07:E91E: D0 05
		;Turn black into dark gray
		LDA #$00					;C - - - - - 0x01E930 07:E920: A9 00
		JMP @write				;C - - - - - 0x01E932 07:E922: 4C 27 E9
@merge:
	ORA scratch5				;C - - - - - 0x01E935 07:E925: 05 05
@write:
	STA (scratch2,X)			;C - - - - - 0x01E937 07:E927: 81 02

	LDA scratch2				;C - - - - - 0x01E939 07:E929: A5 02
	CLC							;C - - - - - 0x01E93B 07:E92B: 18
	ADC #$01					;C - - - - - 0x01E93C 07:E92C: 69 01
	STA scratch2				;C - - - - - 0x01E93E 07:E92E: 85 02

	LDA scratch3				;C - - - - - 0x01E940 07:E930: A5 03
	ADC #$00					;C - - - - - 0x01E942 07:E932: 69 00
	STA scratch3				;C - - - - - 0x01E944 07:E934: 85 03

	DEC scratch8				;C - - - - - 0x01E946 07:E936: C6 08
	BNE @read				;C - - - - - 0x01E948 07:E938: D0 CC

	RTS							;C - - - - - 0x01E94A 07:E93A: 60

CODE_0FE93B:
	LDA PPUSTATUS				;C - - - - - 0x01E94B 07:E93B: AD 02 20
	LDA mapTargetAdr+1				;C - - - - - 0x01E94E 07:E93E: A5 4A
	STA PPUADDR				;C - - - - - 0x01E950 07:E940: 8D 06 20
	LDA mapTargetAdr				;C - - - - - 0x01E953 07:E943: A5 49
	STA PPUADDR				;C - - - - - 0x01E955 07:E945: 8D 06 20
	LDX #$00					;C - - - - - 0x01E958 07:E948: A2 00
CODE_0FE94A:
	LDA mapBuffer,X				;C - - - - - 0x01E95A 07:E94A: BD 68 03
	BEQ CODE_0FE957				;C - - - - - 0x01E95D 07:E94D: F0 08
		STA PPUDATA				;C - - - - - 0x01E95F 07:E94F: 8D 07 20
		INX							;C - - - - - 0x01E962 07:E952: E8
		CPX #$20					;C - - - - - 0x01E963 07:E953: E0 20
		BCC CODE_0FE94A				;C - - - - - 0x01E965 07:E955: 90 F3
CODE_0FE957:
	LDA mapTargetAdr				;C - - - - - 0x01E967 07:E957: A5 49
	CLC							;C - - - - - 0x01E969 07:E959: 18
	ADC #$20					;C - - - - - 0x01E96A 07:E95A: 69 20
	STA mapTargetAdr				;C - - - - - 0x01E96C 07:E95C: 85 49
	LDA mapTargetAdr+1				;C - - - - - 0x01E96E 07:E95E: A5 4A
	ADC #$00					;C - - - - - 0x01E970 07:E960: 69 00
	STA mapTargetAdr+1				;C - - - - - 0x01E972 07:E962: 85 4A
	LDA PPUSTATUS				;C - - - - - 0x01E974 07:E964: AD 02 20
	LDA mapTargetAdr+1				;C - - - - - 0x01E977 07:E967: A5 4A
	STA PPUADDR				;C - - - - - 0x01E979 07:E969: 8D 06 20
	LDA mapTargetAdr				;C - - - - - 0x01E97C 07:E96C: A5 49
	STA PPUADDR				;C - - - - - 0x01E97E 07:E96E: 8D 06 20
	LDX #$00					;C - - - - - 0x01E981 07:E971: A2 00
CODE_0FE973:
	LDA mapBuffer+32,X				;C - - - - - 0x01E983 07:E973: BD 88 03
	BEQ CODE_0FE980				;C - - - - - 0x01E986 07:E976: F0 08
		STA PPUDATA				;C - - - - - 0x01E988 07:E978: 8D 07 20
		INX							;C - - - - - 0x01E98B 07:E97B: E8
		CPX #$20					;C - - - - - 0x01E98C 07:E97C: E0 20
		BCC CODE_0FE973				;C - - - - - 0x01E98E 07:E97E: 90 F3
CODE_0FE980:
	LDA ram_03AE				;C - - - - - 0x01E990 07:E980: AD AE 03
	BEQ CODE_0FE9A3				;C - - - - - 0x01E993 07:E983: F0 1E
		LDA PPUSTATUS				;C - - - - - 0x01E995 07:E985: AD 02 20
		LDA ram_03AB				;C - - - - - 0x01E998 07:E988: AD AB 03
		STA PPUADDR				;C - - - - - 0x01E99B 07:E98B: 8D 06 20
		LDA ram_03AA				;C - - - - - 0x01E99E 07:E98E: AD AA 03
		STA PPUADDR				;C - - - - - 0x01E9A1 07:E991: 8D 06 20
		LDX ram_03AF				;C - - - - - 0x01E9A4 07:E994: AE AF 03
	CODE_0FE997:
		LDA ram_03B1,X				;C - - - - - 0x01E9A7 07:E997: BD B1 03
		STA PPUDATA				;C - - - - - 0x01E9AA 07:E99A: 8D 07 20
		INX							;C - - - - - 0x01E9AD 07:E99D: E8
		CPX ram_03AE				;C - - - - - 0x01E9AE 07:E99E: EC AE 03
		BNE CODE_0FE997				;C - - - - - 0x01E9B1 07:E9A1: D0 F4
CODE_0FE9A3:
	LDA #.LOBYTE(ColorBufferToVRAM)		;C - - - - - 0x01E9B3 07:E9A3: A9 8A
	STA nmiUnbankedSub				;C - - - - - 0x01E9B5 07:E9A5: 85 35
	LDA #.HIBYTE(ColorBufferToVRAM)		;C - - - - - 0x01E9B7 07:E9A7: A9 E3
	STA nmiUnbankedSub+1				;C - - - - - 0x01E9B9 07:E9A9: 85 36
	JMP NMISubRet				;C - - - - - 0x01E9BB 07:E9AB: 4C 9D E1

CODE_0FE9AE:
	;Unreached
	LDA #$00					;- - - - - - 0x01E9BE 07:E9AE: A9
	STA ram_005F				;- - - - - - 0x01E9C0 07:E9B0: 85
CODE_0FE9B2:
	LDA PPUSTATUS					;- - - - - - 0x01E9C2 07:E9B2: AD
	LDA mapTargetAdr+1				;- - - - - - 0x01E9C5 07:E9B5: A5
	STA PPUADDR					;- - - - - - 0x01E9C7 07:E9B7: 8D
	LDA mapTargetAdr				;- - - - - - 0x01E9CA 07:E9BA: A5
	STA PPUADDR					;- - - - - - 0x01E9CC 07:E9BC: 8D
	LDY ram_005F				;- - - - - - 0x01E9CF 07:E9BF: A4
	LDX DATA_0FE9F4,Y			;- - - - - - 0x01E9D1 07:E9C1: BE
	LDY #$00					;- - - - - - 0x01E9D4 07:E9C4: A0
CODE_0FE9C6:
	LDA mapBuffer,X				;- - - - - - 0x01E9D6 07:E9C6: BD
	BEQ CODE_0FE9D4				;- - - - - - 0x01E9D9 07:E9C9: F0
		STA PPUDATA					;- - - - - - 0x01E9DB 07:E9CB: 8D
		INX							;- - - - - - 0x01E9DE 07:E9CE: E8
		INY							;- - - - - - 0x01E9DF 07:E9CF: C8
		CPY #$10					;- - - - - - 0x01E9E0 07:E9D0: C0
		BCC CODE_0FE9C6				;- - - - - - 0x01E9E2 07:E9D2: 90
CODE_0FE9D4:
	LDA mapTargetAdr				;- - - - - - 0x01E9E4 07:E9D4: A5
	CLC							;- - - - - - 0x01E9E6 07:E9D6: 18
	ADC #$20					;- - - - - - 0x01E9E7 07:E9D7: 69
	STA mapTargetAdr				;- - - - - - 0x01E9E9 07:E9D9: 85
	LDA mapTargetAdr+1				;- - - - - - 0x01E9EB 07:E9DB: A5
	ADC #$00					;- - - - - - 0x01E9ED 07:E9DD: 69
	STA mapTargetAdr+1				;- - - - - - 0x01E9EF 07:E9DF: 85
	INC ram_005F				;- - - - - - 0x01E9F1 07:E9E1: E6
	LDA ram_005F				;- - - - - - 0x01E9F3 07:E9E3: A5
	CMP #$04					;- - - - - - 0x01E9F5 07:E9E5: C9
	BCC CODE_0FE9B2				;- - - - - - 0x01E9F7 07:E9E7: 90

	LDA #.LOBYTE(ColorBufferToVRAM)	;- - - - - - 0x01E9F9 07:E9E9: A9
	STA nmiUnbankedSub			;- - - - - - 0x01E9FB 07:E9EB: 85
	LDA #.HIBYTE(ColorBufferToVRAM)	;- - - - - - 0x01E9FD 07:E9ED: A9
	STA nmiUnbankedSub+1				;- - - - - - 0x01E9FF 07:E9EF: 85
	JMP NMISubRet				;- - - - - - 0x01EA01 07:E9F1: 4C

DATA_0FE9F4:
	.byte $00					;- - - - - - 0x01EA04 07:E9F4: 00
	.byte $10					;- - - - - - 0x01EA05 07:E9F5: 10
	.byte $20					;- - - - - - 0x01EA06 07:E9F6: 20
	.byte $30					;- - - - - - 0x01EA07 07:E9F7: 30

SetRoundIRQ:
.ifndef REGION_JP
	LDA #$07					;C - - - - - 0x01EA08 07:E9F8: A9 07
	STA $8000				;C - - - - - 0x01EA0A 07:E9FA: 8D 00 80
.endif
	LDA #.BANK(IRQRoundsLatch)					;C - - - - - 0x01EA0D 07:E9FD: A9 0A
.ifdef REGION_JP
	STA prgBankB					;- - - - - - 0x01EA46 07:EA36: 85
	STA $8001					;- - - - - - 0x01EA48 07:EA38: 8D
.else
	STA $8001				;C - - - - - 0x01EA0F 07:E9FF: 8D 01 80
	STA prgBankB				;C - - - - - 0x01EA12 07:EA02: 85 53
.endif

	LDX #$00					;C - - - - - 0x01EA14 07:EA04: A2 00
CODE_0FEA06:
	LDA IRQRounds,X			;C - - - - - 0x01EA16 07:EA06: BD 6C BA
	CMP currentRound				;C - - - - - 0x01EA19 07:EA09: C5 D8
	BEQ CODE_0FEA1D				;C - - - - - 0x01EA1B 07:EA0B: F0 10
		;No IRQ effect for this round
		INX							;C - - - - - 0x01EA1D 07:EA0D: E8
		CPX #$10					;C - - - - - 0x01EA1E 07:EA0E: E0 10
		BNE CODE_0FEA06				;C - - - - - 0x01EA20 07:EA10: D0 F4

		LDA #$00					;C - - - - - 0x01EA22 07:EA12: A9 00
		STA irqEffect				;C - - - - - 0x01EA24 07:EA14: 85 1D
		STA ram_00D3				;C - - - - - 0x01EA26 07:EA16: 85 D3
		STA ram_00D2				;C - - - - - 0x01EA28 07:EA18: 85 D2
		JMP CODE_0FEA95				;C - - - - - 0x01EA2A 07:EA1A: 4C 95 EA
CODE_0FEA1D:
	STX ram_0026				;C - - - - - 0x01EA2D 07:EA1D: 86 26
	LDA IRQRoundsLatch,X			;C - - - - - 0x01EA2F 07:EA1F: BD 7A BA
	STA irqLatch				;C - - - - - 0x01EA32 07:EA22: 85 1E
	TXA							;C - - - - - 0x01EA34 07:EA24: 8A
	STA scratch4				;C - - - - - 0x01EA35 07:EA25: 85 04
	ASL							;C - - - - - 0x01EA37 07:EA27: 0A
	ASL							;C - - - - - 0x01EA38 07:EA28: 0A
	TAX							;C - - - - - 0x01EA39 07:EA29: AA
	LDA IRQRoundsParams,X			;C - - - - - 0x01EA3A 07:EA2A: BD A2 EA
	STA irqEffect				;C - - - - - 0x01EA3D 07:EA2D: 85 1D
	INC irqEffect				;C - - - - - 0x01EA3F 07:EA2F: E6 1D
	ASL							;C - - - - - 0x01EA41 07:EA31: 0A
	CLC							;C - - - - - 0x01EA42 07:EA32: 18
	ADC #.LOBYTE(DATA_0FEA96)					;C - - - - - 0x01EA43 07:EA33: 69 96
	STA scratch6				;C - - - - - 0x01EA45 07:EA35: 85 06
	LDA #.HIBYTE(DATA_0FEA96)					;C - - - - - 0x01EA47 07:EA37: A9 EA
	ADC #$00					;C - - - - - 0x01EA49 07:EA39: 69 00
	STA scratch7				;C - - - - - 0x01EA4B 07:EA3B: 85 07
	LDY #$00					;C - - - - - 0x01EA4D 07:EA3D: A0 00
	LDA (scratch6),Y			;C - - - - - 0x01EA4F 07:EA3F: B1 06
	STA irqSub				;C - - - - - 0x01EA51 07:EA41: 85 1B
	INY							;C - - - - - 0x01EA53 07:EA43: C8
	LDA (scratch6),Y			;C - - - - - 0x01EA54 07:EA44: B1 06
	STA irqSub+1				;C - - - - - 0x01EA56 07:EA46: 85 1C
	INX							;C - - - - - 0x01EA58 07:EA48: E8
	LDA IRQRoundsParams,X			;C - - - - - 0x01EA59 07:EA49: BD A2 EA
	STA ram_0021				;C - - - - - 0x01EA5C 07:EA4C: 85 21
	INX							;C - - - - - 0x01EA5E 07:EA4E: E8
	LDA IRQRoundsParams,X			;C - - - - - 0x01EA5F 07:EA4F: BD A2 EA
	STA scratch8				;C - - - - - 0x01EA62 07:EA52: 85 08
	INX							;C - - - - - 0x01EA64 07:EA54: E8
	LDA IRQRoundsParams,X			;C - - - - - 0x01EA65 07:EA55: BD A2 EA
	STA scratch9				;C - - - - - 0x01EA68 07:EA58: 85 09
	LDA ram_0021				;C - - - - - 0x01EA6A 07:EA5A: A5 21
	ASL							;C - - - - - 0x01EA6C 07:EA5C: 0A
	STA scratch0				;C - - - - - 0x01EA6D 07:EA5D: 85 00
	LDY #$00					;C - - - - - 0x01EA6F 07:EA5F: A0 00
CODE_0FEA61:
	LDA (scratch8),Y			;C - - - - - 0x01EA71 07:EA61: B1 08
	STA ram_0769,Y				;C - - - - - 0x01EA73 07:EA63: 99 69 07
	INY							;C - - - - - 0x01EA76 07:EA66: C8
	CPY scratch0				;C - - - - - 0x01EA77 07:EA67: C4 00
	BNE CODE_0FEA61				;C - - - - - 0x01EA79 07:EA69: D0 F6

	JSR CODE_0FEADA				;C - - - - - 0x01EA7B 07:EA6B: 20 DA EA
	LDA ram_0026				;C - - - - - 0x01EA7E 07:EA6E: A5 26
	CMP #$08					;C - - - - - 0x01EA80 07:EA70: C9 08
	BCS CODE_0FEA84				;C - - - - - 0x01EA82 07:EA72: B0 10
		AND #$07					;C - - - - - 0x01EA84 07:EA74: 29 07
		CLC							;C - - - - - 0x01EA86 07:EA76: 18
		ADC #.LOBYTE(DATA_06B4DB)					;C - - - - - 0x01EA87 07:EA77: 69 DB
		STA ram_0027				;C - - - - - 0x01EA89 07:EA79: 85 27
		LDA #.HIBYTE(DATA_06B4DB)					;C - - - - - 0x01EA8B 07:EA7B: A9 B4
		ADC #$00					;C - - - - - 0x01EA8D 07:EA7D: 69 00
		STA ram_0028				;C - - - - - 0x01EA8F 07:EA7F: 85 28
		JMP CODE_0FEA95				;C - - - - - 0x01EA91 07:EA81: 4C 95 EA
CODE_0FEA84:
	CMP #$10					;C - - - - - 0x01EA94 07:EA84: C9 10
	BCS CODE_0FEA95				;C - - - - - 0x01EA96 07:EA86: B0 0D
		AND #$07					;C - - - - - 0x01EA98 07:EA88: 29 07
		CLC							;C - - - - - 0x01EA9A 07:EA8A: 18
		ADC #.LOBYTE(DATA_06B5DB)	;C - - - - - 0x01EA9B 07:EA8B: 69 DB
		STA ram_0027				;C - - - - - 0x01EA9D 07:EA8D: 85 27
		LDA #.HIBYTE(DATA_06B5DB)	;C - - - - - 0x01EA9F 07:EA8F: A9 B5
		ADC #$00					;C - - - - - 0x01EAA1 07:EA91: 69 00
		STA ram_0028				;C - - - - - 0x01EAA3 07:EA93: 85 28
CODE_0FEA95:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x01EAA5 07:EA95: 60

DATA_0FEA96:
	;- D 0 - - - 0x01EAA6 07:EA96: 25
	.word CODE_0FEB25
	.word CODE_0FEB25
	.word CODE_0FEB7A
	.word CODE_0FEB25
	.word CODE_0FEB25
	.word CODE_0FEB25

IRQRoundsParams:
	;- D 0 - - - 0x01EAB2 07:EAA2: 00
	;00: Effect
	;01: Entries in table (two bytes each: height, horizontal speed left)
	;02: Table

	;Round 08
	.byte 0, 4
	.word IRQTable_Round08

	;Round 13
	.byte 0, 2
	.word IRQTable_Round13

	;Round 17
	.byte 0, 6
	.word IRQTable_Round17

	;Round 20
	.byte 4, 1
	.word IRQTable_Round20

	;Round 28
	.byte 0, 2
	.word IRQTable_Round28

	;Round 33
	.byte 0, 2
	.word IRQTable_Round33

	;Round 38
	.byte 0, 6
	.word IRQTable_Round38

	;Round 40
	.byte 2, 2
	.word IRQTable_Round40

	;Round 43
	.byte 2, 1
	.word IRQTable_Round43

	;Round 48
	.byte 0, 6
	.word IRQTable_Round48

	;Round 50
	.byte 0, 2
	.word IRQTable_Round50

	;Round 57
	.byte 0, 2
	.word IRQTable_Round57

	;Round 60
	.byte 0, 2
	.word IRQTable_Round60

	;Round 72
	.byte 0, 5
	.word IRQTable_Round72

CODE_0FEADA:
	TXA							;C - - - - - 0x01EAEA 07:EADA: 8A
	PHA							;C - - - - - 0x01EAEB 07:EADB: 48
	LDA scratch4				;C - - - - - 0x01EAEC 07:EADC: A5 04
	ASL							;C - - - - - 0x01EAEE 07:EADE: 0A
	TAY							;C - - - - - 0x01EAEF 07:EADF: A8
	LDA DATA_0FEB09,Y			;C - - - - - 0x01EAF0 07:EAE0: B9 09 EB
	STA ram_0760				;C - - - - - 0x01EAF3 07:EAE3: 8D 60 07
	LDA DATA_0FEB09+1,Y			;C - - - - - 0x01EAF6 07:EAE6: B9 0A EB
	STA wideHScroll				;C - - - - - 0x01EAF9 07:EAE9: 8D 61 07
	LDY #$00					;C - - - - - 0x01EAFC 07:EAEC: A0 00
CODE_0FEAEE:
	LDA #$00					;C - - - - - 0x01EAFE 07:EAEE: A9 00
	STA ram_0762,Y				;C - - - - - 0x01EB00 07:EAF0: 99 62 07
	INY							;C - - - - - 0x01EB03 07:EAF3: C8
	CPY ram_0021				;C - - - - - 0x01EB04 07:EAF4: C4 21
	BNE CODE_0FEAEE				;C - - - - - 0x01EB06 07:EAF6: D0 F6

	LDA currentRound				;C - - - - - 0x01EB08 07:EAF8: A5 D8
	CMP #38					;C - - - - - 0x01EB0A 07:EAFA: C9 26
	BNE CODE_0FEB06				;C - - - - - 0x01EB0C 07:EAFC: D0 08
		LDA #$80					;C - - - - - 0x01EB0E 07:EAFE: A9 80
		STA ram_0763				;C - - - - - 0x01EB10 07:EB00: 8D 63 07
		STA ram_0765				;C - - - - - 0x01EB13 07:EB03: 8D 65 07
CODE_0FEB06:
	PLA							;C - - - - - 0x01EB16 07:EB06: 68
	TAX							;C - - - - - 0x01EB17 07:EB07: AA
	RTS							;C - - - - - 0x01EB18 07:EB08: 60

DATA_0FEB09:
	.byte $00					;- D 0 - - - 0x01EB19 07:EB09: 00
	.byte $00					;- D 0 - - - 0x01EB1A 07:EB0A: 00

	.byte $00					;- D 0 - - - 0x01EB1B 07:EB0B: 00
	.byte $00					;- D 0 - - - 0x01EB1C 07:EB0C: 00

	.byte $00					;- D 0 - - - 0x01EB1D 07:EB0D: 00
	.byte $00					;- D 0 - - - 0x01EB1E 07:EB0E: 00

	.byte $00					;- D 0 - - - 0x01EB1F 07:EB0F: 00
	.byte $01					;- D 0 - - - 0x01EB20 07:EB10: 01

	.byte $00					;- D 0 - - - 0x01EB21 07:EB11: 00
	.byte $00					;- D 0 - - - 0x01EB22 07:EB12: 00

	.byte $00					;- D 0 - - - 0x01EB23 07:EB13: 00
	.byte $80					;- D 0 - - - 0x01EB24 07:EB14: 80

	.byte $00					;- D 0 - - - 0x01EB25 07:EB15: 00
	.byte $00					;- D 0 - - - 0x01EB26 07:EB16: 00

	.byte $1C					;- D 0 - - - 0x01EB27 07:EB17: 1C
	.byte $34					;- D 0 - - - 0x01EB28 07:EB18: 34

	.byte $20					;- D 0 - - - 0x01EB29 07:EB19: 20
	.byte $00					;- D 0 - - - 0x01EB2A 07:EB1A: 00

	.byte $00					;- D 0 - - - 0x01EB2B 07:EB1B: 00
	.byte $00					;- D 0 - - - 0x01EB2C 07:EB1C: 00

	.byte $00					;- D 0 - - - 0x01EB2D 07:EB1D: 00
	.byte $00					;- D 0 - - - 0x01EB2E 07:EB1E: 00

	.byte $00					;- D 0 - - - 0x01EB2F 07:EB1F: 00
	.byte $00					;- D 0 - - - 0x01EB30 07:EB20: 00

	.byte $00					;- D 0 - - - 0x01EB31 07:EB21: 00
	.byte $00					;- D 0 - - - 0x01EB32 07:EB22: 00

	.byte $00					;- D 0 - - - 0x01EB33 07:EB23: 00
	.byte $00					;- D 0 - - - 0x01EB34 07:EB24: 00

CODE_0FEB25:
	LDA ram_0020				;C - - - - - 0x01EB35 07:EB25: A5 20
	ASL							;C - - - - - 0x01EB37 07:EB27: 0A
	TAX							;C - - - - - 0x01EB38 07:EB28: AA
	LDA ram_0769,X				;C - - - - - 0x01EB39 07:EB29: BD 69 07
	STA $C000				;C - - - - - 0x01EB3C 07:EB2C: 8D 00 C0
	LDY ram_0020				;C - - - - - 0x01EB3F 07:EB2F: A4 20
	LDA wideHScroll,Y				;C - - - - - 0x01EB41 07:EB31: B9 61 07
	STA ram_0024				;C - - - - - 0x01EB44 07:EB34: 85 24
	LDA #$00					;C - - - - - 0x01EB46 07:EB36: A9 00
	STA ram_0025				;C - - - - - 0x01EB48 07:EB38: 85 25
	NOP							;C - - - - - 0x01EB4A 07:EB3A: EA
	NOP							;C - - - - - 0x01EB4B 07:EB3B: EA
	NOP							;C - - - - - 0x01EB4C 07:EB3C: EA
	NOP							;C - - - - - 0x01EB4D 07:EB3D: EA
	NOP							;C - - - - - 0x01EB4E 07:EB3E: EA
	JMP CODE_0FEB42				;C - - - - - 0x01EB4F 07:EB3F: 4C 42 EB
CODE_0FEB42:
	NOP							;C - - - - - 0x01EB52 07:EB42: EA
	NOP							;C - - - - - 0x01EB53 07:EB43: EA
	NOP							;C - - - - - 0x01EB54 07:EB44: EA
	NOP							;C - - - - - 0x01EB55 07:EB45: EA
	NOP							;C - - - - - 0x01EB56 07:EB46: EA
	NOP							;C - - - - - 0x01EB57 07:EB47: EA
	NOP							;C - - - - - 0x01EB58 07:EB48: EA
	NOP							;C - - - - - 0x01EB59 07:EB49: EA
	NOP							;C - - - - - 0x01EB5A 07:EB4A: EA
	NOP							;C - - - - - 0x01EB5B 07:EB4B: EA
	NOP							;C - - - - - 0x01EB5C 07:EB4C: EA
	NOP							;C - - - - - 0x01EB5D 07:EB4D: EA
	LDA PPUSTATUS				;C - - - - - 0x01EB5E 07:EB4E: AD 02 20
	LDA ram_0024				;C - - - - - 0x01EB61 07:EB51: A5 24
	STA PPUSCROLL				;C - - - - - 0x01EB63 07:EB53: 8D 05 20
	LDA ram_0025				;C - - - - - 0x01EB66 07:EB56: A5 25
	STA PPUSCROLL				;C - - - - - 0x01EB68 07:EB58: 8D 05 20
	LDA bufPPUCTRL				;C - - - - - 0x01EB6B 07:EB5B: A5 32
	STA PPUCTRL				;C - - - - - 0x01EB6D 07:EB5D: 8D 00 20
	INY							;C - - - - - 0x01EB70 07:EB60: C8
	CPY ram_0021				;C - - - - - 0x01EB71 07:EB61: C4 21
	BNE CODE_0FEB6C				;C - - - - - 0x01EB73 07:EB63: D0 07
		LDY #$00					;C - - - - - 0x01EB75 07:EB65: A0 00
		STY ram_0020				;C - - - - - 0x01EB77 07:EB67: 84 20
		JMP CODE_0FEB77				;C - - - - - 0x01EB79 07:EB69: 4C 77 EB
CODE_0FEB6C:
	STY ram_0020				;C - - - - - 0x01EB7C 07:EB6C: 84 20
	LDA ram_0769,X				;C - - - - - 0x01EB7E 07:EB6E: BD 69 07
	STA $C001					;C - - - - - 0x01EB81 07:EB71: 8D 01 C0
.ifdef REGION_JP
	STA $C002					;- - - - - - 0x01EBC2 07:EBB2: 8D
.else
	STA $E001					;C - - - - - 0x01EB84 07:EB74: 8D 01 E0
.endif
CODE_0FEB77:
	JMP IRQSubRet				;C - - - - - 0x01EB87 07:EB77: 4C 3F E1

CODE_0FEB7A:
	LDA ram_0020				;C - - - - - 0x01EB8A 07:EB7A: A5 20
	ASL							;C - - - - - 0x01EB8C 07:EB7C: 0A
	TAX							;C - - - - - 0x01EB8D 07:EB7D: AA
	LDA ram_0769,X				;C - - - - - 0x01EB8E 07:EB7E: BD 69 07
	STA $C000				;C - - - - - 0x01EB91 07:EB81: 8D 00 C0
.ifndef REGION_JP
	NOP							;C - - - - - 0x01EB94 07:EB84: EA
	NOP							;C - - - - - 0x01EB95 07:EB85: EA
	NOP							;C - - - - - 0x01EB96 07:EB86: EA
	NOP							;C - - - - - 0x01EB97 07:EB87: EA
	NOP							;C - - - - - 0x01EB98 07:EB88: EA
	NOP							;C - - - - - 0x01EB99 07:EB89: EA
	NOP							;C - - - - - 0x01EB9A 07:EB8A: EA
.endif
	LDY ram_0020				;C - - - - - 0x01EB9B 07:EB8B: A4 20
	LDA ram_0760,Y				;C - - - - - 0x01EB9D 07:EB8D: B9 60 07
	ASL							;C - - - - - 0x01EBA0 07:EB90: 0A
	TAX							;C - - - - - 0x01EBA1 07:EB91: AA
	LDA DATA_0FEBCB,X			;C - - - - - 0x01EBA2 07:EB92: BD CB EB
	STA ram_0025				;C - - - - - 0x01EBA5 07:EB95: 85 25
	LDA vNametable				;C - - - - - 0x01EBA7 07:EB97: A5 2D
	ASL							;C - - - - - 0x01EBA9 07:EB99: 0A
	ASL							;C - - - - - 0x01EBAA 07:EB9A: 0A
	ASL							;C - - - - - 0x01EBAB 07:EB9B: 0A
	STA ram_0024				;C - - - - - 0x01EBAC 07:EB9C: 85 24
	LDA DATA_0FEBCB+1,X			;C - - - - - 0x01EBAE 07:EB9E: BD CC EB
	EOR ram_0024				;C - - - - - 0x01EBB1 07:EBA1: 45 24
	STA ram_0024				;C - - - - - 0x01EBB3 07:EBA3: 85 24
	LDA PPUSTATUS				;C - - - - - 0x01EBB5 07:EBA5: AD 02 20
	LDA ram_0024				;C - - - - - 0x01EBB8 07:EBA8: A5 24
	STA PPUADDR				;C - - - - - 0x01EBBA 07:EBAA: 8D 06 20
	LDA ram_0025				;C - - - - - 0x01EBBD 07:EBAD: A5 25
	STA PPUADDR				;C - - - - - 0x01EBBF 07:EBAF: 8D 06 20
	LDY ram_0020				;C - - - - - 0x01EBC2 07:EBB2: A4 20
	INY							;C - - - - - 0x01EBC4 07:EBB4: C8
	CPY ram_0021				;C - - - - - 0x01EBC5 07:EBB5: C4 21
	BNE CODE_0FEBC0				;C - - - - - 0x01EBC7 07:EBB7: D0 07
		LDY #$00					;C - - - - - 0x01EBC9 07:EBB9: A0 00
		STY ram_0020				;C - - - - - 0x01EBCB 07:EBBB: 84 20
		JMP CODE_0FEBC8				;C - - - - - 0x01EBCD 07:EBBD: 4C C8 EB
CODE_0FEBC0:
	STY ram_0020				;C - - - - - 0x01EBD0 07:EBC0: 84 20
	STA $C001					;C - - - - - 0x01EBD2 07:EBC2: 8D 01 C0
.ifdef REGION_JP
	STA $C002
.else
	STA $E001					;C - - - - - 0x01EBD5 07:EBC5: 8D 01 E0
.endif
CODE_0FEBC8:
	JMP IRQSubRet				;C - - - - - 0x01EBD8 07:EBC8: 4C 3F E1

DATA_0FEBCB:
	;- D 0 - - - 0x01EBDB 07:EBCB: 00
	.word $2000
	.word $2020
	.word $2040
	.word $2060
	.word $2080
	.word $20A0
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
	.word $2320
	.word $2340
	.word $2360
	.word $2380
	.word $23A0
	.word $23C0
	.word $23E0
	.word $2800
	.word $2820
	.word $2840
	.word $2860
	.word $2880
	.word $28A0
	.word $28C0
	.word $28E0
	.word $2900
	.word $2920
	.word $2940
	.word $2960
	.word $2980
	.word $29A0
	.word $29C0
	.word $29E0
	.word $2A00
	.word $2A20
	.word $2A40
	.word $2A60
	.word $2A80
	.word $2AA0
	.word $2AC0
	.word $2AE0
	.word $2B00
	.word $2B20
	.word $2B40
	.word $2B60
	.word $2380					;(Typo)
	.word $2BA0
	.word $2BC0
	.word $2BE0

CODE_0FEC4B:
	TXA							;C - - - - - 0x01EC5B 07:EC4B: 8A
	PHA							;C - - - - - 0x01EC5C 07:EC4C: 48
	LDA ram_0760				;C - - - - - 0x01EC5D 07:EC4D: AD 60 07
	SEC							;C - - - - - 0x01EC60 07:EC50: 38
	SBC #$02					;C - - - - - 0x01EC61 07:EC51: E9 02
	CMP #$02					;C - - - - - 0x01EC63 07:EC53: C9 02
	BNE CODE_0FEC59				;C - - - - - 0x01EC65 07:EC55: D0 02
		LDA #$1C					;C - - - - - 0x01EC67 07:EC57: A9 1C
CODE_0FEC59:
	STA ram_0760				;C - - - - - 0x01EC69 07:EC59: 8D 60 07
	SEC							;C - - - - - 0x01EC6C 07:EC5C: 38
	SBC #$04					;C - - - - - 0x01EC6D 07:EC5D: E9 04
	TAX							;C - - - - - 0x01EC6F 07:EC5F: AA
	LDA originalTerrainAdr				;C - - - - - 0x01EC70 07:EC60: A5 44
	CLC							;C - - - - - 0x01EC72 07:EC62: 18
	ADC DATA_0FEC72,X			;C - - - - - 0x01EC73 07:EC63: 7D 72 EC
	STA terrainAdr				;C - - - - - 0x01EC76 07:EC66: 85 42
	LDA originalTerrainAdr+1				;C - - - - - 0x01EC78 07:EC68: A5 45
	ADC DATA_0FEC72+1,X			;C - - - - - 0x01EC7A 07:EC6A: 7D 73 EC
	STA terrainAdr+1				;C - - - - - 0x01EC7D 07:EC6D: 85 43
	PLA							;C - - - - - 0x01EC7F 07:EC6F: 68
	TAX							;C - - - - - 0x01EC80 07:EC70: AA
	RTS							;C - - - - - 0x01EC81 07:EC71: 60

DATA_0FEC72:
	;- D 0 - - - 0x01EC82 07:EC72: 00
	.word $0000
	.word $0010
	.word $0020
	.word $0030
	.word $0040
	.word $0050
	.word $0060
	.word $0070
	.word $0080
	.word $0090
	.word $00A0
	.word $00B0
	.word $00C0

CODE_0FEC8C:
	LDX #$00					;C - - - - - 0x01EC9C 07:EC8C: A2 00
	LDA #$00					;C - - - - - 0x01EC9E 07:EC8E: A9 00
CODE_0FEC90:
	STA ram_0760,X				;C - - - - - 0x01ECA0 07:EC90: 9D 60 07
	INX							;C - - - - - 0x01ECA3 07:EC93: E8
	CPX #$08					;C - - - - - 0x01ECA4 07:EC94: E0 08
	BNE CODE_0FEC90				;C - - - - - 0x01ECA6 07:EC96: D0 F8

	LDX #$00					;C - - - - - 0x01ECA8 07:EC98: A2 00
CODE_0FEC9A:
	STA ram_076A,X				;C - - - - - 0x01ECAA 07:EC9A: 9D 6A 07
	INX							;C - - - - - 0x01ECAD 07:EC9D: E8
	INX							;C - - - - - 0x01ECAE 07:EC9E: E8
	CPX #$10					;C - - - - - 0x01ECAF 07:EC9F: E0 10
	BNE CODE_0FEC9A				;C - - - - - 0x01ECB1 07:ECA1: D0 F7

	LDA #$00					;C - - - - - 0x01ECB3 07:ECA3: A9 00
	STA irqEffect				;C - - - - - 0x01ECB5 07:ECA5: 85 1D
	RTS							;C - - - - - 0x01ECB7 07:ECA7: 60

CODE_0FECA8:
	;Unreached
	LDY #$00					;- - - - - - 0x01ECB8 07:ECA8: A0
CODE_0FECAA:
	LDA ram_0760,Y				;- - - - - - 0x01ECBA 07:ECAA: B9
	BEQ CODE_0FECBB				;- - - - - - 0x01ECBD 07:ECAD: F0
		CMP #$80					;- - - - - - 0x01ECBF 07:ECAF: C9
		BCC CODE_0FECB8				;- - - - - - 0x01ECC1 07:ECB1: 90
			SEC							;- - - - - - 0x01ECC3 07:ECB3: 38
			SBC #$01					;- - - - - - 0x01ECC4 07:ECB4: E9
			BCC CODE_0FECBB				;- - - - - - 0x01ECC6 07:ECB6: 90
	CODE_0FECB8:
		CLC							;- - - - - - 0x01ECC8 07:ECB8: 18
		ADC #$01					;- - - - - - 0x01ECC9 07:ECB9: 69
CODE_0FECBB:
	STA ram_0760,Y				;- - - - - - 0x01ECCB 07:ECBB: 99
	INY							;- - - - - - 0x01ECCE 07:ECBE: C8
	INY							;- - - - - - 0x01ECCF 07:ECBF: C8
	CPY #$10					;- - - - - - 0x01ECD0 07:ECC0: C0
	BNE CODE_0FECAA				;- - - - - - 0x01ECD2 07:ECC2: D0

	RTS							;- - - - - - 0x01ECD4 07:ECC4: 60

;Height, horizontal speed (positive for left, negative for right)

IRQTable_Round08:
.ifdef REGION_JP
	;- - - - - - 0x01ED0C 07:ECFC: F2
	.byte $F2,$FF
	.byte $C2,$00
	.byte $F0,$FF
	.byte $00,$00
.else
	;- D 0 - - - 0x01ECD5 07:ECC5: 0E
	.byte $0E,$FF
	.byte $3E,$00
	.byte $0E,$FF
	.byte $00,$00
.endif

IRQTable_Round13:
.ifdef REGION_JP
	;- - - - - - 0x01ED14 07:ED04: C2
	.byte $C2,$01
	.byte $00,$00
.else
	;- D 0 - - - 0x01ECDD 07:ECCD: 3E
	.byte $3E,$01
	.byte $00,$00
.endif

IRQTable_Round17:
.ifdef REGION_JP
	;- - - - - - 0x01ED18 07:ED08: E9
	.byte $E9,$01
	.byte $F2,$00
	.byte $E9,$FF
	.byte $F2,$00
	.byte $E9,$01
	.byte $00,$00
.else
	;- D 0 - - - 0x01ECE1 07:ECD1: 16
	.byte $16,$00
	.byte $0E,$00
	.byte $16,$FF
	.byte $0E,$00
	.byte $16,$01
	.byte $00,$00
.endif

IRQTable_Round20:
.ifdef REGION_JP
	;- - - - - - 0x01ED24 07:ED14: 00
	.byte $00,$00
.else
	;- D 0 - - - 0x01ECED 07:ECDD: 00
	.byte $00,$00
.endif

IRQTable_Round28:
.ifdef REGION_JP
	;- - - - - - 0x01ED26 07:ED16: C0
	.byte $C0,$00
	.byte $00,$00
.else
	;- D 0 - - - 0x01ECEF 07:ECDF: 40
	.byte $40,$00
	.byte $00,$00
.endif

IRQTable_Round33:
.ifdef REGION_JP
	;- - - - - - 0x01ED2A 07:ED1A: DC
	.byte $DC,$FF
	.byte $00,$00
.else
	;- D 0 - - - 0x01ECF3 07:ECE3: 23
	.byte $23,$FF
	.byte $00,$00
.endif

IRQTable_Round38:
.ifdef REGION_JP
	;- - - - - - 0x01ED2E 07:ED1E: E0
	.byte $E0,$FF
	.byte $E2,$00
	.byte $E0,$01
	.byte $E2,$00
	.byte $E0,$FF
	.byte $00,$00
.else
	;- D 0 - - - 0x01ECF7 07:ECE7: 1F
	.byte $1F,$FF
	.byte $1E,$00
	.byte $1E,$01
	.byte $1E,$00
	.byte $1E,$FF
	.byte $00,$00
.endif

IRQTable_Round40:
.ifdef REGION_JP
	;- - - - - - 0x01ED3A 07:ED2A: 54
	.byte $54,$00
	.byte $00,$00
.else
	;- D 0 - - - 0x01ED03 07:ECF3: AE
	.byte $AE,$00
	.byte $00,$00
.endif

IRQTable_Round43:
.ifdef REGION_JP
	;- - - - - - 0x01ED3E 07:ED2E: 00
	.byte $00,$00
.else
	;- D 0 - - - 0x01ED07 07:ECF7: 00
	.byte $00,$00
.endif

IRQTable_Round48:
.ifdef REGION_JP
	;- - - - - - 0x01ED40 07:ED30: EC
	.byte $EC,$00
	.byte $F0,$00
	.byte $EC,$00
	.byte $F0,$00
	.byte $EC,$00
	.byte $00,$00
.else
	;- D 0 - - - 0x01ED09 07:ECF9: 14
	.byte $14,$00
	.byte $10,$00
	.byte $14,$00
	.byte $10,$00
	.byte $10,$00
	.byte $00,$00
.endif

IRQTable_Round50:
.ifdef REGION_JP
	;- - - - - - 0x01ED4C 07:ED3C: BD
	.byte $BD,$00
	.byte $00,$00
.else
	;- D 0 - - - 0x01ED15 07:ED05: 42
	.byte $42,$00
	.byte $00,$00
.endif

IRQTable_Round57:
.ifdef REGION_JP
	;- - - - - - 0x01ED50 07:ED40: B4
	.byte $B4,$00
	.byte $00,$00
.else
	;- D 0 - - - 0x01ED19 07:ED09: 4A
	.byte $4A,$00
	.byte $00,$00
.endif

IRQTable_Round60:
.ifdef REGION_JP
	;- - - - - - 0x01ED54 07:ED44: 50
	.byte $50,$FD
	.byte $00,$00
.else
	;- D 0 - - - 0x01ED1D 07:ED0D: AF
	.byte $AF,$FD
	.byte $00,$00
.endif

IRQTable_Round72:
.ifdef REGION_JP
	;- - - - - - 0x01ED58 07:ED48: E2
	.byte $E2,$01
	.byte $E2,$FF
	.byte $E2,$01
	.byte $E2,$FF
	.byte $00,$00
.else
	;- D 0 - - - 0x01ED21 07:ED11: 1E
	.byte $1E,$01
	.byte $1E,$FF
	.byte $1E,$01
	.byte $1E,$FF
	.byte $00,$00
.endif

CODE_0FED1B:
	;Unreached
	NOP							;- - - - - - 0x01ED2B 07:ED1B: EA
	NOP							;- - - - - - 0x01ED2C 07:ED1C: EA
	RTS							;- - - - - - 0x01ED2D 07:ED1D: 60

AnimateObjects:
.ifdef REGION_JP
	LDA #.BANK(AnimTable)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x01ED2E 07:ED1E: A9 00
	ORA #$07					;C - - - - - 0x01ED30 07:ED20: 09 07
	STA $8000				;C - - - - - 0x01ED32 07:ED22: 8D 00 80
	LDA #.BANK(AnimTable)					;C - - - - - 0x01ED35 07:ED25: A9 0C
	STA $8001				;C - - - - - 0x01ED37 07:ED27: 8D 01 80
	STA prgBankB				;C - - - - - 0x01ED3A 07:ED2A: 85 53

	LDA #$00					;C - - - - - 0x01ED3C 07:ED2C: A9 00
	ORA #$07					;C - - - - - 0x01ED3E 07:ED2E: 09 07
	STA $8000				;C - - - - - 0x01ED40 07:ED30: 8D 00 80
	LDA #.BANK(AnimTable)					;C - - - - - 0x01ED43 07:ED33: A9 0C
	STA $8001				;C - - - - - 0x01ED45 07:ED35: 8D 01 80
	STA prgBankB				;C - - - - - 0x01ED48 07:ED38: 85 53
.endif

	LDX #20					;C - - - - - 0x01ED4A 07:ED3A: A2 14
@checkobj:
	LDA objState,X				;C - - - - - 0x01ED4C 07:ED3C: BD 63 05
	BEQ @nextobj				;C - - - - - 0x01ED4F 07:ED3F: F0 5C

	LDA objAnimTimer,X				;C - - - - - 0x01ED51 07:ED41: BD A3 06
	BNE @waiting				;C - - - - - 0x01ED54 07:ED44: D0 54

	LDA objAnim,X				;C - - - - - 0x01ED56 07:ED46: BD 7B 06
	STA scratch0				;C - - - - - 0x01ED59 07:ED49: 85 00
	LDA objAnimHI,X				;C - - - - - 0x01ED5B 07:ED4B: BD 1B 07
	STA scratch1				;C - - - - - 0x01ED5E 07:ED4E: 85 01
	ASL scratch0				;C - - - - - 0x01ED60 07:ED50: 06 00
	ROL scratch1				;C - - - - - 0x01ED62 07:ED52: 26 01
	LDA scratch0				;C - - - - - 0x01ED64 07:ED54: A5 00
	CLC							;C - - - - - 0x01ED66 07:ED56: 18
	ADC #.LOBYTE(AnimTable)	;C - - - - - 0x01ED67 07:ED57: 69 00
	STA scratch6				;C - - - - - 0x01ED69 07:ED59: 85 06
	LDA scratch1				;C - - - - - 0x01ED6B 07:ED5B: A5 01
	ADC #.HIBYTE(AnimTable)					;C - - - - - 0x01ED6D 07:ED5D: 69 A0
	STA scratch7				;C - - - - - 0x01ED6F 07:ED5F: 85 07
	LDY #$00					;C - - - - - 0x01ED71 07:ED61: A0 00
	LDA (scratch6),Y			;C - - - - - 0x01ED73 07:ED63: B1 06
	STA scratch8				;C - - - - - 0x01ED75 07:ED65: 85 08
	INY							;C - - - - - 0x01ED77 07:ED67: C8
	LDA (scratch6),Y			;C - - - - - 0x01ED78 07:ED68: B1 06
	STA scratch9				;C - - - - - 0x01ED7A 07:ED6A: 85 09
	LDA objAnimProgress,X				;C - - - - - 0x01ED7C 07:ED6C: BD CB 06
@read:
	STA scratch0				;C - - - - - 0x01ED7F 07:ED6F: 85 00
	ASL							;C - - - - - 0x01ED81 07:ED71: 0A
	ASL							;C - - - - - 0x01ED82 07:ED72: 0A
	TAY							;C - - - - - 0x01ED83 07:ED73: A8
	INC objAnimProgress,X				;C - - - - - 0x01ED84 07:ED74: FE CB 06

	;Image/end
	LDA (scratch8),Y			;C - - - - - 0x01ED87 07:ED77: B1 08
	CMP #$FF					;C - - - - - 0x01ED89 07:ED79: C9 FF
	BNE @newimg				;C - - - - - 0x01ED8B 07:ED7B: D0 08
		;Loop
		LDA #$00					;C - - - - - 0x01ED8D 07:ED7D: A9 00
		STA objAnimProgress,X				;C - - - - - 0x01ED8F 07:ED7F: 9D CB 06
		JMP @read				;C - - - - - 0x01ED92 07:ED82: 4C 6F ED
@newimg:
	STA objImgOfs,X				;C - - - - - 0x01ED95 07:ED85: 9D DB 05
	INY							;C - - - - - 0x01ED98 07:ED88: C8
	;
	LDA (scratch8),Y			;C - - - - - 0x01ED99 07:ED89: B1 08
	STA objImgOfsHI,X				;C - - - - - 0x01ED9B 07:ED8B: 9D 03 06
	INY							;C - - - - - 0x01ED9E 07:ED8E: C8
	;Duration
	LDA (scratch8),Y			;C - - - - - 0x01ED9F 07:ED8F: B1 08
	STA objAnimTimer,X				;C - - - - - 0x01EDA1 07:ED91: 9D A3 06
	INY							;C - - - - - 0x01EDA4 07:ED94: C8
	;CHR bank
	LDA (scratch8),Y			;C - - - - - 0x01EDA5 07:ED95: B1 08
	STA objChrBank,X				;C - - - - - 0x01EDA7 07:ED97: 9D 53 06
@waiting:
	DEC objAnimTimer,X				;C - - - - - 0x01EDAA 07:ED9A: DE A3 06
@nextobj:
	INX							;C - - - - - 0x01EDAD 07:ED9D: E8
	CPX #40					;C - - - - - 0x01EDAE 07:ED9E: E0 28
	BNE @checkobj				;C - - - - - 0x01EDB0 07:EDA0: D0 9A

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x01EDB2 07:EDA2: 60

CODE_0FEDA3:
	;Unreached
	;Requires sprite to start with struct size AND CHR bank number
	TXA							;- - - - - - 0x01EDB3 07:EDA3: 8A
	PHA							;- - - - - - 0x01EDB4 07:EDA4: 48
	TYA							;- - - - - - 0x01EDB5 07:EDA5: 98
	PHA							;- - - - - - 0x01EDB6 07:EDA6: 48
	
	;ImageTable1 and ImageTable2 both at $A000 in their respective banks
.ifdef REGION_JP
	LDA #.BANK(ImageTable1)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;- - - - - - 0x01EDB7 07:EDA7: A9
	ORA #$07					;- - - - - - 0x01EDB9 07:EDA9: 09
	STA $8000					;- - - - - - 0x01EDBB 07:EDAB: 8D
	LDA #.BANK(ImageTable1)					;- - - - - - 0x01EDBE 07:EDAE: A9
	STA $8001					;- - - - - - 0x01EDC0 07:EDB0: 8D
	STA prgBankB				;- - - - - - 0x01EDC3 07:EDB3: 85

	LDA #$00					;- - - - - - 0x01EDC5 07:EDB5: A9
	ORA #$07					;- - - - - - 0x01EDC7 07:EDB7: 09
	STA $8000					;- - - - - - 0x01EDC9 07:EDB9: 8D
	LDA #.BANK(ImageTable1)					;- - - - - - 0x01EDCC 07:EDBC: A9
	STA $8001					;- - - - - - 0x01EDCE 07:EDBE: 8D
	STA prgBankB				;- - - - - - 0x01EDD1 07:EDC1: 85
.endif

	LDA scratch0				;- - - - - - 0x01EDD3 07:EDC3: A5
	CLC							;- - - - - - 0x01EDD5 07:EDC5: 18
	ADC #$00					;- - - - - - 0x01EDD6 07:EDC6: 69
	STA scratch0				;- - - - - - 0x01EDD8 07:EDC8: 85

	LDA scratch1				;- - - - - - 0x01EDDA 07:EDCA: A5
	ADC #$A0					;- - - - - - 0x01EDDC 07:EDCC: 69
	STA scratch1				;- - - - - - 0x01EDDE 07:EDCE: 85

	LDY #$00					;- - - - - - 0x01EDE0 07:EDD0: A0
	LDA (scratch0),Y			;- - - - - - 0x01EDE2 07:EDD2: B1
	STA scratch8				;- - - - - - 0x01EDE4 07:EDD4: 85
	INY							;- - - - - - 0x01EDE6 07:EDD6: C8

	LDA (scratch0),Y			;- - - - - - 0x01EDE7 07:EDD7: B1
	STA scratch9				;- - - - - - 0x01EDE9 07:EDD9: 85
	LDY #$00					;- - - - - - 0x01EDEB 07:EDDB: A0

	LDA (scratch8),Y			;- - - - - - 0x01EDED 07:EDDD: B1
	CLC							;- - - - - - 0x01EDEF 07:EDDF: 18
	ADC #$02					;- - - - - - 0x01EDF0 07:EDE0: 69
	STA scratch4				;- - - - - - 0x01EDF2 07:EDE2: 85

	LDX ram_055F				;- - - - - - 0x01EDF4 07:EDE4: AE
	INY							;- - - - - - 0x01EDF7 07:EDE7: C8
	LDA (scratch8),Y			;- - - - - - 0x01EDF8 07:EDE8: B1
	STA chrBankC,X				;- - - - - - 0x01EDFA 07:EDEA: 95

	LDA SprBaseTiles,X			;- - - - - - 0x01EDFC 07:EDEC: BD
	STA scratch5				;- - - - - - 0x01EDFF 07:EDEF: 85
	LDX oamBufferPos				;- - - - - - 0x01EE01 07:EDF1: AE
	LDY #$02					;- - - - - - 0x01EE04 07:EDF4: A0
CODE_0FEDF6:
	LDA (scratch8),Y			;- - - - - - 0x01EE06 07:EDF6: B1
	CLC							;- - - - - - 0x01EE08 07:EDF8: 18
	ADC scratch2				;- - - - - - 0x01EE09 07:EDF9: 65
	STA OAMBuffer,X				;- - - - - - 0x01EE0B 07:EDFB: 9D
	INX							;- - - - - - 0x01EE0E 07:EDFE: E8
	INY							;- - - - - - 0x01EE0F 07:EDFF: C8

	LDA (scratch8),Y				;- - - - - - 0x01EE10 07:EE00: B1
	CLC							;- - - - - - 0x01EE12 07:EE02: 18
	ADC scratch5				;- - - - - - 0x01EE13 07:EE03: 65
	STA OAMBuffer,X				;- - - - - - 0x01EE15 07:EE05: 9D
	INX							;- - - - - - 0x01EE18 07:EE08: E8
	INY							;- - - - - - 0x01EE19 07:EE09: C8

	LDA (scratch8),Y			;- - - - - - 0x01EE1A 07:EE0A: B1
	STA OAMBuffer,X				;- - - - - - 0x01EE1C 07:EE0C: 9D
	INX							;- - - - - - 0x01EE1F 07:EE0F: E8
	INY							;- - - - - - 0x01EE20 07:EE10: C8

	LDA (scratch8),Y			;- - - - - - 0x01EE21 07:EE11: B1
	CLC							;- - - - - - 0x01EE23 07:EE13: 18
	ADC scratch3				;- - - - - - 0x01EE24 07:EE14: 65
	STA OAMBuffer,X				;- - - - - - 0x01EE26 07:EE16: 9D
	INX							;- - - - - - 0x01EE29 07:EE19: E8
	INY							;- - - - - - 0x01EE2A 07:EE1A: C8
	CPY scratch4				;- - - - - - 0x01EE2B 07:EE1B: C4
	BNE CODE_0FEDF6				;- - - - - - 0x01EE2D 07:EE1D: D0

	STX oamBufferPos				;- - - - - - 0x01EE2F 07:EE1F: 8E

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	PLA							;- - - - - - 0x01EE32 07:EE22: 68
	TAY							;- - - - - - 0x01EE33 07:EE23: A8
	PLA							;- - - - - - 0x01EE34 07:EE24: 68
	TAX							;- - - - - - 0x01EE35 07:EE25: AA
	RTS							;- - - - - - 0x01EE36 07:EE26: 60

SprBaseTiles:
	.byte $00					;- D 0 - - - 0x01EE37 07:EE27: 00
	.byte $40					;- D 0 - - - 0x01EE38 07:EE28: 40
	.byte $80					;- D 0 - - - 0x01EE39 07:EE29: 80
	.byte $C0					;- D 0 - - - 0x01EE3A 07:EE2A: C0

SpawnBubble:
	;Spawn simple bubble
	TXA							;C - - - - - 0x01EE3B 07:EE2B: 8A
	PHA							;C - - - - - 0x01EE3C 07:EE2C: 48
	LDX bubbleSpawnSlot				;C - - - - - 0x01EE3D 07:EE2D: AE 43 07
	LDA bubbleSpawnState				;C - - - - - 0x01EE40 07:EE30: AD 44 07
	STA objState,X				;C - - - - - 0x01EE43 07:EE33: 9D 63 05
	LDA bubbleSpawnY				;C - - - - - 0x01EE46 07:EE36: AD 45 07
	STA objY,X				;C - - - - - 0x01EE49 07:EE39: 9D 8B 05
	LDA bubbleSpawnX				;C - - - - - 0x01EE4C 07:EE3C: AD 46 07
	STA objX,X				;C - - - - - 0x01EE4F 07:EE3F: 9D B3 05
	LDA bubbleSpawnChrSlot				;C - - - - - 0x01EE52 07:EE42: AD 49 07
	STA objChrSlot,X				;C - - - - - 0x01EE55 07:EE45: 9D 2B 06
	LDA bubbleSpawnAnim				;C - - - - - 0x01EE58 07:EE48: AD 4A 07
	STA objAnim,X				;C - - - - - 0x01EE5B 07:EE4B: 9D 7B 06
	LDA #$00					;C - - - - - 0x01EE5E 07:EE4E: A9 00
	STA objAnimTimer,X				;C - - - - - 0x01EE60 07:EE50: 9D A3 06
	STA objAnimProgress,X				;C - - - - - 0x01EE63 07:EE53: 9D CB 06
	STA objAnimHI,X				;C - - - - - 0x01EE66 07:EE56: 9D 1B 07
	PLA							;C - - - - - 0x01EE69 07:EE59: 68
	TAX							;C - - - - - 0x01EE6A 07:EE5A: AA
	RTS							;C - - - - - 0x01EE6B 07:EE5B: 60

AnimateNonBubbles:
	;Animate objects before bubble slots
.ifdef REGION_JP
	LDA #.BANK(AnimTable)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x01EE6C 07:EE5C: A9 00
	ORA #$07					;C - - - - - 0x01EE6E 07:EE5E: 09 07
	STA $8000				;C - - - - - 0x01EE70 07:EE60: 8D 00 80
	LDA #.BANK(AnimTable)					;C - - - - - 0x01EE73 07:EE63: A9 0C
	STA $8001				;C - - - - - 0x01EE75 07:EE65: 8D 01 80
	STA prgBankB				;C - - - - - 0x01EE78 07:EE68: 85 53

	LDA #$00					;C - - - - - 0x01EE7A 07:EE6A: A9 00
	ORA #$07					;C - - - - - 0x01EE7C 07:EE6C: 09 07
	STA $8000				;C - - - - - 0x01EE7E 07:EE6E: 8D 00 80
	LDA #.BANK(AnimTable)					;C - - - - - 0x01EE81 07:EE71: A9 0C
	STA $8001				;C - - - - - 0x01EE83 07:EE73: 8D 01 80
	STA prgBankB				;C - - - - - 0x01EE86 07:EE76: 85 53
.endif

	LDX #$00					;C - - - - - 0x01EE88 07:EE78: A2 00
@checkobj:
	LDA objState,X				;C - - - - - 0x01EE8A 07:EE7A: BD 63 05
	BEQ @nextobj				;C - - - - - 0x01EE8D 07:EE7D: F0 5D

	LDA objAnimTimer,X				;C - - - - - 0x01EE8F 07:EE7F: BD A3 06
	BNE @waiting				;C - - - - - 0x01EE92 07:EE82: D0 55

	LDA objAnim,X				;C - - - - - 0x01EE94 07:EE84: BD 7B 06
	STA scratch0				;C - - - - - 0x01EE97 07:EE87: 85 00
	LDA objAnimHI,X				;C - - - - - 0x01EE99 07:EE89: BD 1B 07
	STA scratch1				;C - - - - - 0x01EE9C 07:EE8C: 85 01
	CLC							;C - - - - - 0x01EE9E 07:EE8E: 18
	ASL scratch0				;C - - - - - 0x01EE9F 07:EE8F: 06 00
	ROL scratch1				;C - - - - - 0x01EEA1 07:EE91: 26 01
	LDA scratch0				;C - - - - - 0x01EEA3 07:EE93: A5 00
	CLC							;C - - - - - 0x01EEA5 07:EE95: 18
	ADC #$00					;C - - - - - 0x01EEA6 07:EE96: 69 00
	STA scratch6				;C - - - - - 0x01EEA8 07:EE98: 85 06
	LDA scratch1				;C - - - - - 0x01EEAA 07:EE9A: A5 01
	ADC #$A0					;C - - - - - 0x01EEAC 07:EE9C: 69 A0
	STA scratch7				;C - - - - - 0x01EEAE 07:EE9E: 85 07
	LDY #$00					;C - - - - - 0x01EEB0 07:EEA0: A0 00
	LDA (scratch6),Y			;C - - - - - 0x01EEB2 07:EEA2: B1 06
	STA scratch8				;C - - - - - 0x01EEB4 07:EEA4: 85 08
	INY							;C - - - - - 0x01EEB6 07:EEA6: C8
	LDA (scratch6),Y			;C - - - - - 0x01EEB7 07:EEA7: B1 06
	STA scratch9				;C - - - - - 0x01EEB9 07:EEA9: 85 09
	LDA objAnimProgress,X				;C - - - - - 0x01EEBB 07:EEAB: BD CB 06
@read:
	STA scratch0				;C - - - - - 0x01EEBE 07:EEAE: 85 00
	ASL							;C - - - - - 0x01EEC0 07:EEB0: 0A
	ASL							;C - - - - - 0x01EEC1 07:EEB1: 0A
	TAY							;C - - - - - 0x01EEC2 07:EEB2: A8
	INC objAnimProgress,X				;C - - - - - 0x01EEC3 07:EEB3: FE CB 06
	LDA (scratch8),Y			;C - - - - - 0x01EEC6 07:EEB6: B1 08
	CMP #$FF					;C - - - - - 0x01EEC8 07:EEB8: C9 FF
	BNE @newimg				;C - - - - - 0x01EECA 07:EEBA: D0 08
		LDA #$00					;C - - - - - 0x01EECC 07:EEBC: A9 00
		STA objAnimProgress,X				;C - - - - - 0x01EECE 07:EEBE: 9D CB 06
		JMP @read				;C - - - - - 0x01EED1 07:EEC1: 4C AE EE
@newimg:
	STA objImgOfs,X				;C - - - - - 0x01EED4 07:EEC4: 9D DB 05
	INY							;C - - - - - 0x01EED7 07:EEC7: C8
	LDA (scratch8),Y			;C - - - - - 0x01EED8 07:EEC8: B1 08
	STA objImgOfsHI,X				;C - - - - - 0x01EEDA 07:EECA: 9D 03 06
	INY							;C - - - - - 0x01EEDD 07:EECD: C8
	LDA (scratch8),Y			;C - - - - - 0x01EEDE 07:EECE: B1 08
	STA objAnimTimer,X				;C - - - - - 0x01EEE0 07:EED0: 9D A3 06
	INY							;C - - - - - 0x01EEE3 07:EED3: C8
	LDA (scratch8),Y			;C - - - - - 0x01EEE4 07:EED4: B1 08
	STA objChrBank,X				;C - - - - - 0x01EEE6 07:EED6: 9D 53 06
@waiting:
	DEC objAnimTimer,X				;C - - - - - 0x01EEE9 07:EED9: DE A3 06
@nextobj:
	INX							;C - - - - - 0x01EEEC 07:EEDC: E8
	CPX #20						;C - - - - - 0x01EEED 07:EEDD: E0 14
	BNE @checkobj				;C - - - - - 0x01EEEF 07:EEDF: D0 99

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x01EEF1 07:EEE1: 60

DrawObjects:
.ifdef REGION_JP
	LDA sprPrgBank
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x01EEF2 07:EEE2: A9 00
	ORA #$07					;C - - - - - 0x01EEF4 07:EEE4: 09 07
	STA $8000				;C - - - - - 0x01EEF6 07:EEE6: 8D 00 80
	LDA sprPrgBank				;C - - - - - 0x01EEF9 07:EEE9: AD 61 05
	STA $8001				;C - - - - - 0x01EEFC 07:EEEC: 8D 01 80
	STA prgBankB				;C - - - - - 0x01EEFF 07:EEEF: 85 53

	LDA #$00					;C - - - - - 0x01EF01 07:EEF1: A9 00
	ORA #$07					;C - - - - - 0x01EF03 07:EEF3: 09 07
	STA $8000				;C - - - - - 0x01EF05 07:EEF5: 8D 00 80
	LDA sprPrgBank				;C - - - - - 0x01EF08 07:EEF8: AD 61 05
	STA $8001				;C - - - - - 0x01EF0B 07:EEFB: 8D 01 80
	STA prgBankB				;C - - - - - 0x01EF0E 07:EEFE: 85 53
.endif

	LDA globalTimer				;C - - - - - 0x01EF10 07:EF00: A5 14
	AND #$01					;C - - - - - 0x01EF12 07:EF02: 29 01
	BEQ CODE_0FEF09				;C - - - - - 0x01EF14 07:EF04: F0 03
		JMP CODE_0FEFBB				;C - - - - - 0x01EF16 07:EF06: 4C BB EF
CODE_0FEF09:
	;Even frame, draw all objects
	LDA #$00					;C - - - - - 0x01EF19 07:EF09: A9 00
	STA oamBufferPos				;C - - - - - 0x01EF1B 07:EF0B: 8D 5E 05
	LDA #$00					;C - - - - - 0x01EF1E 07:EF0E: A9 00
	STA scratch4				;C - - - - - 0x01EF20 07:EF10: 85 04
CODE_0FEF12:
	LDY scratch4				;C - - - - - 0x01EF22 07:EF12: A4 04
	LDA ram_0475				;C - - - - - 0x01EF24 07:EF14: AD 75 04
	BEQ CODE_0FEF21				;C - - - - - 0x01EF27 07:EF17: F0 08
		CPY ram_0475				;C - - - - - 0x01EF29 07:EF19: CC 75 04
		BCC CODE_0FEF21				;C - - - - - 0x01EF2C 07:EF1C: 90 03
			JMP CODE_0FEFAA				;C - - - - - 0x01EF2E 07:EF1E: 4C AA EF
CODE_0FEF21:
	LDA objState,Y				;C - - - - - 0x01EF31 07:EF21: B9 63 05
	BNE CODE_0FEF29				;C - - - - - 0x01EF34 07:EF24: D0 03
		JMP CODE_0FEFAA				;C - - - - - 0x01EF36 07:EF26: 4C AA EF
CODE_0FEF29:
	LDA objAttr,Y				;C - - - - - 0x01EF39 07:EF29: B9 F3 06
	STA sprAttr				;C - - - - - 0x01EF3C 07:EF2C: 8D 60 05
	LDA objY,Y				;C - - - - - 0x01EF3F 07:EF2F: B9 8B 05
	STA scratch2				;C - - - - - 0x01EF42 07:EF32: 85 02
	LDA objX,Y				;C - - - - - 0x01EF44 07:EF34: B9 B3 05
	STA scratch3				;C - - - - - 0x01EF47 07:EF37: 85 03

	LDX objChrSlot,Y				;C - - - - - 0x01EF49 07:EF39: BE 2B 06
	LDA objChrBank,Y				;C - - - - - 0x01EF4C 07:EF3C: B9 53 06
	BEQ CODE_0FEF43				;C - - - - - 0x01EF4F 07:EF3F: F0 02
		STA chrBankC,X				;C - - - - - 0x01EF51 07:EF41: 95 4D
CODE_0FEF43:
	LDA objImgOfs,Y				;C - - - - - 0x01EF53 07:EF43: B9 DB 05
	CLC							;C - - - - - 0x01EF56 07:EF46: 18
	ADC #$00					;C - - - - - 0x01EF57 07:EF47: 69 00
	STA scratch0				;C - - - - - 0x01EF59 07:EF49: 85 00

	LDA objImgOfsHI,Y				;C - - - - - 0x01EF5B 07:EF4B: B9 03 06
	ADC #$A0					;C - - - - - 0x01EF5E 07:EF4E: 69 A0
	STA scratch1				;C - - - - - 0x01EF60 07:EF50: 85 01

	LDY #$00					;C - - - - - 0x01EF62 07:EF52: A0 00
	LDA (scratch0),Y			;C - - - - - 0x01EF64 07:EF54: B1 00
	STA scratch8				;C - - - - - 0x01EF66 07:EF56: 85 08

	INY							;C - - - - - 0x01EF68 07:EF58: C8
	LDA (scratch0),Y			;C - - - - - 0x01EF69 07:EF59: B1 00
	STA scratch9				;C - - - - - 0x01EF6B 07:EF5B: 85 09

	;Get size of sprite struct
	LDY #$00					;C - - - - - 0x01EF6D 07:EF5D: A0 00
	LDA (scratch8),Y			;C - - - - - 0x01EF6F 07:EF5F: B1 08
	CLC							;C - - - - - 0x01EF71 07:EF61: 18
	ADC #$01					;C - - - - - 0x01EF72 07:EF62: 69 01
	STA scratch1				;C - - - - - 0x01EF74 07:EF64: 85 01

	LDA SprBaseTiles,X			;C - - - - - 0x01EF76 07:EF66: BD 27 EE
	STA scratch5				;C - - - - - 0x01EF79 07:EF69: 85 05
	LDX oamBufferPos				;C - - - - - 0x01EF7B 07:EF6B: AE 5E 05
	LDY #$01					;C - - - - - 0x01EF7E 07:EF6E: A0 01
CODE_0FEF70:
	;02: Base Y
	;03: Base X
	;05: Base tile number
	;sprAttr: Attributes

	;Get Y
	LDA (scratch8),Y			;C - - - - - 0x01EF80 07:EF70: B1 08
	CLC							;C - - - - - 0x01EF82 07:EF72: 18
	ADC scratch2				;C - - - - - 0x01EF83 07:EF73: 65 02
	STA OAMBuffer,X				;C - - - - - 0x01EF85 07:EF75: 9D 00 02
	INX							;C - - - - - 0x01EF88 07:EF78: E8
	INY							;C - - - - - 0x01EF89 07:EF79: C8

	;Get tile number
	LDA (scratch8),Y			;C - - - - - 0x01EF8A 07:EF7A: B1 08
	CLC							;C - - - - - 0x01EF8C 07:EF7C: 18
	ADC scratch5				;C - - - - - 0x01EF8D 07:EF7D: 65 05
	STA OAMBuffer,X				;C - - - - - 0x01EF8F 07:EF7F: 9D 00 02
	INX							;C - - - - - 0x01EF92 07:EF82: E8
	INY							;C - - - - - 0x01EF93 07:EF83: C8

	;Get attributes
	LDA (scratch8),Y			;C - - - - - 0x01EF94 07:EF84: B1 08
	ORA sprAttr				;C - - - - - 0x01EF96 07:EF86: 0D 60 05
	STA OAMBuffer,X				;C - - - - - 0x01EF99 07:EF89: 9D 00 02
	INX							;C - - - - - 0x01EF9C 07:EF8C: E8
	INY							;C - - - - - 0x01EF9D 07:EF8D: C8

	;Get X
	LDA (scratch8),Y			;C - - - - - 0x01EF9E 07:EF8E: B1 08
	CLC							;C - - - - - 0x01EFA0 07:EF90: 18
	ADC scratch3				;C - - - - - 0x01EFA1 07:EF91: 65 03
	STA OAMBuffer,X				;C - - - - - 0x01EFA3 07:EF93: 9D 00 02
	INX							;C - - - - - 0x01EFA6 07:EF96: E8
	CPX #$00					;C - - - - - 0x01EFA7 07:EF97: E0 00
	BNE CODE_0FEF9E				;C - - - - - 0x01EFA9 07:EF99: D0 03
		JMP CODE_0FF079				;C - - - - - 0x01EFAB 07:EF9B: 4C 79 F0
CODE_0FEF9E:
	INY							;C - - - - - 0x01EFAE 07:EF9E: C8
	CPY scratch1				;C - - - - - 0x01EFAF 07:EF9F: C4 01
	BNE CODE_0FEF70				;C - - - - - 0x01EFB1 07:EFA1: D0 CD

	STX oamBufferPos				;C - - - - - 0x01EFB3 07:EFA3: 8E 5E 05
	CPX #$00					;C - - - - - 0x01EFB6 07:EFA6: E0 00
	BEQ CODE_0FEFB8				;C - - - - - 0x01EFB8 07:EFA8: F0 0E
CODE_0FEFAA:
	INC scratch4				;C - - - - - 0x01EFBA 07:EFAA: E6 04
	LDA scratch4				;C - - - - - 0x01EFBC 07:EFAC: A5 04
	CMP #40					;C - - - - - 0x01EFBE 07:EFAE: C9 28
	BEQ CODE_0FEFB5				;C - - - - - 0x01EFC0 07:EFB0: F0 03
		JMP CODE_0FEF12				;C - - - - - 0x01EFC2 07:EFB2: 4C 12 EF
CODE_0FEFB5:
	JMP CODE_0FF064				;C - - - - - 0x01EFC5 07:EFB5: 4C 64 F0

CODE_0FEFB8:
	;Unreached
	;OAM buffer completely full
	JMP CODE_0FF064				;- - - - - - 0x01EFC8 07:EFB8: 4C

CODE_0FEFBB:
	;Uneven frame,
	LDA #$00					;C - - - - - 0x01EFCB 07:EFBB: A9 00
	STA oamBufferPos				;C - - - - - 0x01EFCD 07:EFBD: 8D 5E 05
	LDA #$27					;C - - - - - 0x01EFD0 07:EFC0: A9 27
	STA scratch4				;C - - - - - 0x01EFD2 07:EFC2: 85 04
CODE_0FEFC4:
	LDY scratch4				;C - - - - - 0x01EFD4 07:EFC4: A4 04
	LDA ram_0475				;C - - - - - 0x01EFD6 07:EFC6: AD 75 04
	BEQ CODE_0FEFD3				;C - - - - - 0x01EFD9 07:EFC9: F0 08
		CPY ram_0475				;C - - - - - 0x01EFDB 07:EFCB: CC 75 04
		BCC CODE_0FEFD3				;C - - - - - 0x01EFDE 07:EFCE: 90 03
			JMP CODE_0FF059				;C - - - - - 0x01EFE0 07:EFD0: 4C 59 F0
CODE_0FEFD3:
	LDA objState,Y				;C - - - - - 0x01EFE3 07:EFD3: B9 63 05
	BNE CODE_0FEFDB				;C - - - - - 0x01EFE6 07:EFD6: D0 03
		JMP CODE_0FF059				;C - - - - - 0x01EFE8 07:EFD8: 4C 59 F0
CODE_0FEFDB:
	LDA objAttr,Y				;C - - - - - 0x01EFEB 07:EFDB: B9 F3 06
	STA sprAttr				;C - - - - - 0x01EFEE 07:EFDE: 8D 60 05
	LDA objY,Y				;C - - - - - 0x01EFF1 07:EFE1: B9 8B 05
	STA scratch2				;C - - - - - 0x01EFF4 07:EFE4: 85 02
	LDA objX,Y				;C - - - - - 0x01EFF6 07:EFE6: B9 B3 05
	STA scratch3				;C - - - - - 0x01EFF9 07:EFE9: 85 03
	LDX objChrSlot,Y				;C - - - - - 0x01EFFB 07:EFEB: BE 2B 06
	LDA objChrBank,Y				;C - - - - - 0x01EFFE 07:EFEE: B9 53 06
	BEQ CODE_0FEFF5				;C - - - - - 0x01F001 07:EFF1: F0 02
		STA chrBankC,X				;C - - - - - 0x01F003 07:EFF3: 95 4D
CODE_0FEFF5:
	LDA objImgOfs,Y				;C - - - - - 0x01F005 07:EFF5: B9 DB 05
	CLC							;C - - - - - 0x01F008 07:EFF8: 18
	ADC #$00					;C - - - - - 0x01F009 07:EFF9: 69 00
	STA scratch0				;C - - - - - 0x01F00B 07:EFFB: 85 00

	LDA objImgOfsHI,Y				;C - - - - - 0x01F00D 07:EFFD: B9 03 06
	ADC #$A0					;C - - - - - 0x01F010 07:F000: 69 A0
	STA scratch1				;C - - - - - 0x01F012 07:F002: 85 01

	LDY #$00					;C - - - - - 0x01F014 07:F004: A0 00
	LDA (scratch0),Y			;C - - - - - 0x01F016 07:F006: B1 00
	STA scratch8				;C - - - - - 0x01F018 07:F008: 85 08

	INY							;C - - - - - 0x01F01A 07:F00A: C8
	LDA (scratch0),Y			;C - - - - - 0x01F01B 07:F00B: B1 00
	STA scratch9				;C - - - - - 0x01F01D 07:F00D: 85 09

	LDY #$00					;C - - - - - 0x01F01F 07:F00F: A0 00
	LDA (scratch8),Y			;C - - - - - 0x01F021 07:F011: B1 08
	CLC							;C - - - - - 0x01F023 07:F013: 18
	ADC #$01					;C - - - - - 0x01F024 07:F014: 69 01
	STA scratch1				;C - - - - - 0x01F026 07:F016: 85 01

	LDA SprBaseTiles,X			;C - - - - - 0x01F028 07:F018: BD 27 EE
	STA scratch5				;C - - - - - 0x01F02B 07:F01B: 85 05
	LDX oamBufferPos				;C - - - - - 0x01F02D 07:F01D: AE 5E 05
	LDY #$01					;C - - - - - 0x01F030 07:F020: A0 01
CODE_0FF022:
	;Get Y
	LDA (scratch8),Y			;C - - - - - 0x01F032 07:F022: B1 08
	CLC							;C - - - - - 0x01F034 07:F024: 18
	ADC scratch2				;C - - - - - 0x01F035 07:F025: 65 02
	STA OAMBuffer,X				;C - - - - - 0x01F037 07:F027: 9D 00 02
	INX							;C - - - - - 0x01F03A 07:F02A: E8
	INY							;C - - - - - 0x01F03B 07:F02B: C8

	;Get tile number
	LDA (scratch8),Y			;C - - - - - 0x01F03C 07:F02C: B1 08
	CLC							;C - - - - - 0x01F03E 07:F02E: 18
	ADC scratch5				;C - - - - - 0x01F03F 07:F02F: 65 05
	STA OAMBuffer,X				;C - - - - - 0x01F041 07:F031: 9D 00 02
	INX							;C - - - - - 0x01F044 07:F034: E8
	INY							;C - - - - - 0x01F045 07:F035: C8

	;Get attr
	LDA (scratch8),Y			;C - - - - - 0x01F046 07:F036: B1 08
	ORA sprAttr				;C - - - - - 0x01F048 07:F038: 0D 60 05
	STA OAMBuffer,X				;C - - - - - 0x01F04B 07:F03B: 9D 00 02
	INX							;C - - - - - 0x01F04E 07:F03E: E8
	INY							;C - - - - - 0x01F04F 07:F03F: C8

	;Get X
	LDA (scratch8),Y			;C - - - - - 0x01F050 07:F040: B1 08
	CLC							;C - - - - - 0x01F052 07:F042: 18
	ADC scratch3				;C - - - - - 0x01F053 07:F043: 65 03
	STA OAMBuffer,X				;C - - - - - 0x01F055 07:F045: 9D 00 02

	INX							;C - - - - - 0x01F058 07:F048: E8
	CPX #$00					;C - - - - - 0x01F059 07:F049: E0 00
	BEQ CODE_0FF079				;C - - - - - 0x01F05B 07:F04B: F0 2C

	INY							;C - - - - - 0x01F05D 07:F04D: C8
	CPY scratch1				;C - - - - - 0x01F05E 07:F04E: C4 01
	BNE CODE_0FF022				;C - - - - - 0x01F060 07:F050: D0 D0

	STX oamBufferPos				;C - - - - - 0x01F062 07:F052: 8E 5E 05
	CPX #$00					;C - - - - - 0x01F065 07:F055: E0 00
	BEQ CODE_0FF079				;C - - - - - 0x01F067 07:F057: F0 20
CODE_0FF059:
	DEC scratch4				;C - - - - - 0x01F069 07:F059: C6 04
	LDA scratch4				;C - - - - - 0x01F06B 07:F05B: A5 04
	CMP #$FF					;C - - - - - 0x01F06D 07:F05D: C9 FF
	BEQ CODE_0FF064				;C - - - - - 0x01F06F 07:F05F: F0 03
		JMP CODE_0FEFC4				;C - - - - - 0x01F071 07:F061: 4C C4 EF
CODE_0FF064:
	LDX oamBufferPos				;C - - - - - 0x01F074 07:F064: AE 5E 05
CODE_0FF067:
	LDA #$F0					;C - - - - - 0x01F077 07:F067: A9 F0
	STA OAMBuffer,X				;C - - - - - 0x01F079 07:F069: 9D 00 02
	LDA #$01					;C - - - - - 0x01F07C 07:F06C: A9 01
	STA OAMBuffer+1,X				;C - - - - - 0x01F07E 07:F06E: 9D 01 02
	INX							;C - - - - - 0x01F081 07:F071: E8
	INX							;C - - - - - 0x01F082 07:F072: E8
	INX							;C - - - - - 0x01F083 07:F073: E8
	INX							;C - - - - - 0x01F084 07:F074: E8
	CPX #$00					;C - - - - - 0x01F085 07:F075: E0 00
	BNE CODE_0FF067				;C - - - - - 0x01F087 07:F077: D0 EE
CODE_0FF079:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x01F089 07:F079: 60

CODE_0FF07A:
	LDA ram_0081				;C - - - - - 0x01F08A 07:F07A: A5 81
	BNE CODE_0FF087				;C - - - - - 0x01F08C 07:F07C: D0 09
		LDA ram_0080				;C - - - - - 0x01F08E 07:F07E: A5 80
		ASL							;C - - - - - 0x01F090 07:F080: 0A
		TAY							;C - - - - - 0x01F091 07:F081: A8
		LDA ram_0768,Y				;C - - - - - 0x01F092 07:F082: B9 68 07
		STA ram_0081				;C - - - - - 0x01F095 07:F085: 85 81
CODE_0FF087:
	RTS							;C - - - - - 0x01F097 07:F087: 60

CODE_0FF088:
	LDA #$00					;C - - - - - 0x01F098 07:F088: A9 00
	STA ram_0081				;C - - - - - 0x01F09A 07:F08A: 85 81
	LDA enemyDir,X				;C - - - - - 0x01F09C 07:F08C: B5 A2
	STA enemyHitboxDir				;C - - - - - 0x01F09E 07:F08E: 8D 7E 07
	LDY enemyType,X				;C - - - - - 0x01F0A1 07:F091: B4 98
	LDA EnemyHitboxIndexes,Y			;C - - - - - 0x01F0A3 07:F093: B9 C2 F1
	AND #$1E					;C - - - - - 0x01F0A6 07:F096: 29 1E
	TAY							;C - - - - - 0x01F0A8 07:F098: A8
	LDA EnemyHitboxes,Y			;C - - - - - 0x01F0A9 07:F099: B9 E7 F1
	STA scratch6				;C - - - - - 0x01F0AC 07:F09C: 85 06
	LDA EnemyHitboxes+1,Y			;C - - - - - 0x01F0AE 07:F09E: B9 E8 F1
	STA scratch7				;C - - - - - 0x01F0B1 07:F0A1: 85 07
	LDY #$00					;C - - - - - 0x01F0B3 07:F0A3: A0 00
CODE_0FF0A5:
	LDA (scratch6),Y			;C - - - - - 0x01F0B5 07:F0A5: B1 06
	STA enemyHitboxDown,Y				;C - - - - - 0x01F0B7 07:F0A7: 99 B9 04
	INY							;C - - - - - 0x01F0BA 07:F0AA: C8
	CPY #5					;C - - - - - 0x01F0BB 07:F0AB: C0 05
	BNE CODE_0FF0A5				;C - - - - - 0x01F0BD 07:F0AD: D0 F6

	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01F0BF 07:F0AF: BD 94 05
	STA scratch0				;C - - - - - 0x01F0C2 07:F0B2: 85 00
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F0C4 07:F0B4: BD BC 05
	STA scratch1				;C - - - - - 0x01F0C7 07:F0B7: 85 01
	LDA ram_04AF,X				;C - - - - - 0x01F0C9 07:F0B9: BD AF 04
	TAY							;C - - - - - 0x01F0CC 07:F0BC: A8
	LDA DATA_0FF18A,Y			;C - - - - - 0x01F0CD 07:F0BD: B9 8A F1
	CMP #$01					;C - - - - - 0x01F0D0 07:F0C0: C9 01
	BNE CODE_0FF0D0				;C - - - - - 0x01F0D2 07:F0C2: D0 0C
		JSR CODE_0FF242				;C - - - - - 0x01F0D4 07:F0C4: 20 42 F2
		JSR CODE_0FF283				;C - - - - - 0x01F0D7 07:F0C7: 20 83 F2
		JSR CODE_0FF661				;C - - - - - 0x01F0DA 07:F0CA: 20 61 F6
		JMP CODE_0FF189				;C - - - - - 0x01F0DD 07:F0CD: 4C 89 F1
CODE_0FF0D0:
	CMP #$02					;C - - - - - 0x01F0E0 07:F0D0: C9 02
	BNE CODE_0FF0E3				;C - - - - - 0x01F0E2 07:F0D2: D0 0F
		JSR CODE_0FF242				;C - - - - - 0x01F0E4 07:F0D4: 20 42 F2
		JSR CODE_0FF283				;C - - - - - 0x01F0E7 07:F0D7: 20 83 F2
		JSR CODE_0FF36E				;C - - - - - 0x01F0EA 07:F0DA: 20 6E F3
		JSR CODE_0FF661				;C - - - - - 0x01F0ED 07:F0DD: 20 61 F6
		JMP CODE_0FF189				;C - - - - - 0x01F0F0 07:F0E0: 4C 89 F1
CODE_0FF0E3:
	CMP #$03					;C - - - - - 0x01F0F3 07:F0E3: C9 03
	BNE CODE_0FF0F3				;C - - - - - 0x01F0F5 07:F0E5: D0 0C
		JSR CODE_0FF242				;C - - - - - 0x01F0F7 07:F0E7: 20 42 F2
		JSR CODE_0FF283				;C - - - - - 0x01F0FA 07:F0EA: 20 83 F2
		JSR CODE_0FF661				;C - - - - - 0x01F0FD 07:F0ED: 20 61 F6
		JMP CODE_0FF189				;C - - - - - 0x01F100 07:F0F0: 4C 89 F1
CODE_0FF0F3:
	CMP #$04					;C - - - - - 0x01F103 07:F0F3: C9 04
	BNE CODE_0FF100				;C - - - - - 0x01F105 07:F0F5: D0 09
		JSR CODE_0FF283				;C - - - - - 0x01F107 07:F0F7: 20 83 F2
		JSR CODE_0FF661				;C - - - - - 0x01F10A 07:F0FA: 20 61 F6
		JMP CODE_0FF189				;C - - - - - 0x01F10D 07:F0FD: 4C 89 F1
CODE_0FF100:
	CMP #$05					;C - - - - - 0x01F110 07:F100: C9 05
	BNE CODE_0FF10D				;C - - - - - 0x01F112 07:F102: D0 09
		JSR CODE_0FF242				;C - - - - - 0x01F114 07:F104: 20 42 F2
		JSR CODE_0FF2EA				;C - - - - - 0x01F117 07:F107: 20 EA F2
		JMP CODE_0FF189				;C - - - - - 0x01F11A 07:F10A: 4C 89 F1
CODE_0FF10D:
	CMP #$06					;C - - - - - 0x01F11D 07:F10D: C9 06
	BNE CODE_0FF11A				;C - - - - - 0x01F11F 07:F10F: D0 09
		JSR CODE_0FF242				;C - - - - - 0x01F121 07:F111: 20 42 F2
		JSR CODE_0FF326				;C - - - - - 0x01F124 07:F114: 20 26 F3
		JMP CODE_0FF189				;C - - - - - 0x01F127 07:F117: 4C 89 F1
CODE_0FF11A:
	CMP #$07					;C - - - - - 0x01F12A 07:F11A: C9 07
	BNE CODE_0FF12C				;C - - - - - 0x01F12C 07:F11C: D0 0E
		LDA #DIR_RIGHT					;C - - - - - 0x01F12E 07:F11E: A9 02
		STA enemyHitboxDir				;C - - - - - 0x01F130 07:F120: 8D 7E 07
		JSR CODE_0FF242				;C - - - - - 0x01F133 07:F123: 20 42 F2
		JSR CODE_0FF3CD				;C - - - - - 0x01F136 07:F126: 20 CD F3
		JMP CODE_0FF189				;C - - - - - 0x01F139 07:F129: 4C 89 F1
CODE_0FF12C:
	CMP #$08					;C - - - - - 0x01F13C 07:F12C: C9 08
	BNE CODE_0FF13E				;C - - - - - 0x01F13E 07:F12E: D0 0E
		LDA #DIR_LEFT					;C - - - - - 0x01F140 07:F130: A9 01
		STA enemyHitboxDir				;C - - - - - 0x01F142 07:F132: 8D 7E 07
		JSR CODE_0FF242				;C - - - - - 0x01F145 07:F135: 20 42 F2
		JSR CODE_0FF3CD				;C - - - - - 0x01F148 07:F138: 20 CD F3
		JMP CODE_0FF189				;C - - - - - 0x01F14B 07:F13B: 4C 89 F1
CODE_0FF13E:
	CMP #$09					;C - - - - - 0x01F14E 07:F13E: C9 09
	BNE CODE_0FF14B				;C - - - - - 0x01F150 07:F140: D0 09
		JSR CODE_0FF242				;C - - - - - 0x01F152 07:F142: 20 42 F2
		JSR CODE_0FF39E				;C - - - - - 0x01F155 07:F145: 20 9E F3
		JMP CODE_0FF189				;C - - - - - 0x01F158 07:F148: 4C 89 F1
CODE_0FF14B:
	CMP #$0A					;C - - - - - 0x01F15B 07:F14B: C9 0A
	BNE CODE_0FF158				;C - - - - - 0x01F15D 07:F14D: D0 09
		JSR CODE_0FF242				;C - - - - - 0x01F15F 07:F14F: 20 42 F2
		JSR CODE_0FF283				;C - - - - - 0x01F162 07:F152: 20 83 F2
		JMP CODE_0FF189				;C - - - - - 0x01F165 07:F155: 4C 89 F1
CODE_0FF158:
	CMP #$0B					;C - - - - - 0x01F168 07:F158: C9 0B
	BNE CODE_0FF162				;C - - - - - 0x01F16A 07:F15A: D0 06
		JSR CODE_0FF3DE				;C - - - - - 0x01F16C 07:F15C: 20 DE F3
		JMP CODE_0FF189				;C - - - - - 0x01F16F 07:F15F: 4C 89 F1
CODE_0FF162:
	CMP #$0C					;C - - - - - 0x01F172 07:F162: C9 0C
	BNE CODE_0FF16F				;C - - - - - 0x01F174 07:F164: D0 09
		;Unreached
		JSR CODE_0FF420				;- - - - - - 0x01F176 07:F166: 20
		JSR CODE_0FF39E				;- - - - - - 0x01F179 07:F169: 20
		JMP CODE_0FF189				;- - - - - - 0x01F17C 07:F16C: 4C
CODE_0FF16F:
	CMP #$0D					;C - - - - - 0x01F17F 07:F16F: C9 0D
	BNE CODE_0FF17C				;C - - - - - 0x01F181 07:F171: D0 09
		;Unreached
		JSR CODE_0FF420				;- - - - - - 0x01F183 07:F173: 20
		JSR CODE_0FF283				;- - - - - - 0x01F186 07:F176: 20
		JMP CODE_0FF189				;- - - - - - 0x01F189 07:F179: 4C
CODE_0FF17C:
	CMP #$0E					;C - - - - - 0x01F18C 07:F17C: C9 0E
	BNE CODE_0FF189				;C - - - - - 0x01F18E 07:F17E: D0 09
		JSR CODE_0FF242				;C - - - - - 0x01F190 07:F180: 20 42 F2
		JSR CODE_0FF283				;C - - - - - 0x01F193 07:F183: 20 83 F2
		JMP CODE_0FF189				;C - - - - - 0x01F196 07:F186: 4C 89 F1
CODE_0FF189:
	RTS							;C - - - - - 0x01F199 07:F189: 60

DATA_0FF18A:
	.byte $00					;- D 0 - - - 0x01F19A 07:F18A: 00
	.byte $01					;- D 0 - - - 0x01F19B 07:F18B: 01
	.byte $02					;- D 0 - - - 0x01F19C 07:F18C: 02
	.byte $03					;- - - - - - 0x01F19D 07:F18D: 03
	.byte $04					;- D 0 - - - 0x01F19E 07:F18E: 04
	.byte $00					;- - - - - - 0x01F19F 07:F18F: 00
	.byte $01					;- D 0 - - - 0x01F1A0 07:F190: 01
	.byte $02					;- D 0 - - - 0x01F1A1 07:F191: 02
	.byte $03					;- D 0 - - - 0x01F1A2 07:F192: 03
	.byte $04					;- D 0 - - - 0x01F1A3 07:F193: 04
	.byte $00					;- - - - - - 0x01F1A4 07:F194: 00
	.byte $05					;- D 0 - - - 0x01F1A5 07:F195: 05
	.byte $06					;- D 0 - - - 0x01F1A6 07:F196: 06
	.byte $07					;- D 0 - - - 0x01F1A7 07:F197: 07
	.byte $08					;- D 0 - - - 0x01F1A8 07:F198: 08
	.byte $04					;- D 0 - - - 0x01F1A9 07:F199: 04
	.byte $09					;- D 0 - - - 0x01F1AA 07:F19A: 09
	.byte $0A					;- D 0 - - - 0x01F1AB 07:F19B: 0A
	.byte $04					;- D 0 - - - 0x01F1AC 07:F19C: 04
	.byte $00					;- - - - - - 0x01F1AD 07:F19D: 00
	.byte $01					;- D 0 - - - 0x01F1AE 07:F19E: 01
	.byte $00					;- - - - - - 0x01F1AF 07:F19F: 00
	.byte $03					;- - - - - - 0x01F1B0 07:F1A0: 03
	.byte $04					;- D 0 - - - 0x01F1B1 07:F1A1: 04
	.byte $00					;- - - - - - 0x01F1B2 07:F1A2: 00
	.byte $09					;- D 0 - - - 0x01F1B3 07:F1A3: 09
	.byte $0A					;- D 0 - - - 0x01F1B4 07:F1A4: 0A
	.byte $01					;- - - - - - 0x01F1B5 07:F1A5: 01
	.byte $02					;- - - - - - 0x01F1B6 07:F1A6: 02
	.byte $03					;- - - - - - 0x01F1B7 07:F1A7: 03
	.byte $04					;- - - - - - 0x01F1B8 07:F1A8: 04
	.byte $00					;- - - - - - 0x01F1B9 07:F1A9: 00
	.byte $01					;- D 0 - - - 0x01F1BA 07:F1AA: 01
	.byte $03					;- - - - - - 0x01F1BB 07:F1AB: 03
	.byte $04					;- - - - - - 0x01F1BC 07:F1AC: 04
	.byte $00					;- - - - - - 0x01F1BD 07:F1AD: 00
	.byte $0F					;- - - - - - 0x01F1BE 07:F1AE: 0F
	.byte $10					;- - - - - - 0x01F1BF 07:F1AF: 10
	.byte $11					;- - - - - - 0x01F1C0 07:F1B0: 11
	.byte $12					;- - - - - - 0x01F1C1 07:F1B1: 12
	.byte $00					;- - - - - - 0x01F1C2 07:F1B2: 00
	.byte $0E					;- D 0 - - - 0x01F1C3 07:F1B3: 0E
	.byte $00					;- - - - - - 0x01F1C4 07:F1B4: 00
	.byte $00					;- - - - - - 0x01F1C5 07:F1B5: 00
	.byte $00					;- - - - - - 0x01F1C6 07:F1B6: 00
	.byte $00					;- - - - - - 0x01F1C7 07:F1B7: 00
	.byte $0C					;- - - - - - 0x01F1C8 07:F1B8: 0C
	.byte $0D					;- - - - - - 0x01F1C9 07:F1B9: 0D
	.byte $00					;- - - - - - 0x01F1CA 07:F1BA: 00
	.byte $00					;- - - - - - 0x01F1CB 07:F1BB: 00
	.byte $00					;- - - - - - 0x01F1CC 07:F1BC: 00
	.byte $0B					;- D 0 - - - 0x01F1CD 07:F1BD: 0B
	.byte $04					;- D 0 - - - 0x01F1CE 07:F1BE: 04
	.byte $00					;- - - - - - 0x01F1CF 07:F1BF: 00
	.byte $00					;- - - - - - 0x01F1D0 07:F1C0: 00
	.byte $00					;- - - - - - 0x01F1D1 07:F1C1: 00

EnemyHitboxIndexes:
	.byte $00					;- - - - - - 0x01F1D2 07:F1C2: 00
	.byte $00					;- D 0 - - - 0x01F1D3 07:F1C3: 00
	.byte $00					;- D 0 - - - 0x01F1D4 07:F1C4: 00
	.byte $02					;- D 0 - - - 0x01F1D5 07:F1C5: 02
	.byte $02					;- D 0 - - - 0x01F1D6 07:F1C6: 02
	.byte $10					;- D 0 - - - 0x01F1D7 07:F1C7: 10
	.byte $00					;- D 0 - - - 0x01F1D8 07:F1C8: 00
	.byte $02					;- D 0 - - - 0x01F1D9 07:F1C9: 02
	.byte $00					;- D 0 - - - 0x01F1DA 07:F1CA: 00
	.byte $00					;- D 0 - - - 0x01F1DB 07:F1CB: 00
	.byte $00					;- D 0 - - - 0x01F1DC 07:F1CC: 00
	.byte $04					;- D 0 - - - 0x01F1DD 07:F1CD: 04
	.byte $00					;- D 0 - - - 0x01F1DE 07:F1CE: 00
	.byte $04					;- D 0 - - - 0x01F1DF 07:F1CF: 04
	.byte $00					;- D 0 - - - 0x01F1E0 07:F1D0: 00
	.byte $00					;- D 0 - - - 0x01F1E1 07:F1D1: 00
	.byte $06					;- D 0 - - - 0x01F1E2 07:F1D2: 06
	.byte $00					;- D 0 - - - 0x01F1E3 07:F1D3: 00
	.byte $00					;- D 0 - - - 0x01F1E4 07:F1D4: 00
	.byte $08					;- D 0 - - - 0x01F1E5 07:F1D5: 08
	.byte $0A					;- D 0 - - - 0x01F1E6 07:F1D6: 0A
	.byte $00					;- D 0 - - - 0x01F1E7 07:F1D7: 00
	.byte $00					;- D 0 - - - 0x01F1E8 07:F1D8: 00
	.byte $18					;- D 0 - - - 0x01F1E9 07:F1D9: 18
	.byte $10					;- D 0 - - - 0x01F1EA 07:F1DA: 10
	.byte $14					;- D 0 - - - 0x01F1EB 07:F1DB: 14
	.byte $16					;- D 0 - - - 0x01F1EC 07:F1DC: 16
	.byte $00					;- D 0 - - - 0x01F1ED 07:F1DD: 00
	.byte $0E					;- D 0 - - - 0x01F1EE 07:F1DE: 0E
	.byte $0C					;- D 0 - - - 0x01F1EF 07:F1DF: 0C
	.byte $0C					;- D 0 - - - 0x01F1F0 07:F1E0: 0C
	.byte $0C					;- D 0 - - - 0x01F1F1 07:F1E1: 0C
	.byte $0E					;- D 0 - - - 0x01F1F2 07:F1E2: 0E
	.byte $00					;- D 0 - - - 0x01F1F3 07:F1E3: 00
	.byte $00					;- D 0 - - - 0x01F1F4 07:F1E4: 00
	.byte $12					;- D 0 - - - 0x01F1F5 07:F1E5: 12
	.byte $02					;- D 0 - - - 0x01F1F6 07:F1E6: 02

EnemyHitboxes:
	;- D 0 - - - 0x01F1F7 07:F1E7: 01
	;00: YOffset downwards
	;01: XOffset when facing left
	;02: XOffset when facing right
	;03: YOffset upwards
	;04: Tiles to scan upwards when reaching for player
	.word DATA_0FF201
	.word DATA_0FF206
	.word DATA_0FF20B
	.word DATA_0FF210
	.word DATA_0FF215
	.word DATA_0FF21A
	.word DATA_0FF21F
	.word DATA_0FF224
	.word DATA_0FF229
	.word DATA_0FF22E
	.word DATA_0FF233
	.word DATA_0FF238
	.word DATA_0FF23D

DATA_0FF201:
	.byte $08					;- D 0 - - - 0x01F211 07:F201: 08
	.byte $FB					;- D 0 - - - 0x01F212 07:F202: FB
	.byte $05					;- D 0 - - - 0x01F213 07:F203: 05
	.byte $F0					;- D 0 - - - 0x01F214 07:F204: F0
	.byte $03					;- D 0 - - - 0x01F215 07:F205: 03

DATA_0FF206:
	.byte $08					;- D 0 - - - 0x01F216 07:F206: 08
	.byte $F9					;- D 0 - - - 0x01F217 07:F207: F9
	.byte $07					;- D 0 - - - 0x01F218 07:F208: 07
	.byte $F8					;- D 0 - - - 0x01F219 07:F209: F8
	.byte $01					;- D 0 - - - 0x01F21A 07:F20A: 01

DATA_0FF20B:
	.byte $18					;- D 0 - - - 0x01F21B 07:F20B: 18
	.byte $F6					;- D 0 - - - 0x01F21C 07:F20C: F6
	.byte $0A					;- D 0 - - - 0x01F21D 07:F20D: 0A
	.byte $F0					;- D 0 - - - 0x01F21E 07:F20E: F0
	.byte $03					;- D 0 - - - 0x01F21F 07:F20F: 03

DATA_0FF210:
	.byte $10					;- D 0 - - - 0x01F220 07:F210: 10
	.byte $F6					;- D 0 - - - 0x01F221 07:F211: F6
	.byte $0A					;- D 0 - - - 0x01F222 07:F212: 0A
	.byte $F0					;- D 0 - - - 0x01F223 07:F213: F0
	.byte $03					;- D 0 - - - 0x01F224 07:F214: 03

DATA_0FF215:
	.byte $30					;- D 0 - - - 0x01F225 07:F215: 30
	.byte $F6					;- D 0 - - - 0x01F226 07:F216: F6
	.byte $0A					;- D 0 - - - 0x01F227 07:F217: 0A
	.byte $10					;- D 0 - - - 0x01F228 07:F218: 10
	.byte $03					;- D 0 - - - 0x01F229 07:F219: 03

DATA_0FF21A:
	.byte $10					;- D 0 - - - 0x01F22A 07:F21A: 10
	.byte $F6					;- D 0 - - - 0x01F22B 07:F21B: F6
	.byte $0A					;- D 0 - - - 0x01F22C 07:F21C: 0A
	.byte $00					;- D 0 - - - 0x01F22D 07:F21D: 00
	.byte $01					;- D 0 - - - 0x01F22E 07:F21E: 01

DATA_0FF21F:
	.byte $0C					;- D 0 - - - 0x01F22F 07:F21F: 0C
	.byte $F6					;- D 0 - - - 0x01F230 07:F220: F6
	.byte $0A					;- D 0 - - - 0x01F231 07:F221: 0A
	.byte $F4					;- D 0 - - - 0x01F232 07:F222: F4
	.byte $01					;- D 0 - - - 0x01F233 07:F223: 01

DATA_0FF224:
	.byte $20					;- D 0 - - - 0x01F234 07:F224: 20
	.byte $F2					;- D 0 - - - 0x01F235 07:F225: F2
	.byte $0E					;- D 0 - - - 0x01F236 07:F226: 0E
	.byte $FC					;- D 0 - - - 0x01F237 07:F227: FC
	.byte $01					;- D 0 - - - 0x01F238 07:F228: 01

DATA_0FF229:
	.byte $10					;- D 0 - - - 0x01F239 07:F229: 10
	.byte $FB					;- D 0 - - - 0x01F23A 07:F22A: FB
	.byte $05					;- D 0 - - - 0x01F23B 07:F22B: 05
	.byte $F4					;- D 0 - - - 0x01F23C 07:F22C: F4
	.byte $01					;- D 0 - - - 0x01F23D 07:F22D: 01

DATA_0FF22E:
	.byte $0C					;- D 0 - - - 0x01F23E 07:F22E: 0C
	.byte $F9					;- D 0 - - - 0x01F23F 07:F22F: F9
	.byte $07					;- D 0 - - - 0x01F240 07:F230: 07
	.byte $F4					;- D 0 - - - 0x01F241 07:F231: F4
	.byte $01					;- D 0 - - - 0x01F242 07:F232: 01

DATA_0FF233:
	.byte $18					;- D 0 - - - 0x01F243 07:F233: 18
	.byte $F2					;- D 0 - - - 0x01F244 07:F234: F2
	.byte $0E					;- D 0 - - - 0x01F245 07:F235: 0E
	.byte $FC					;- D 0 - - - 0x01F246 07:F236: FC
	.byte $01					;- D 0 - - - 0x01F247 07:F237: 01

DATA_0FF238:
	.byte $18					;- D 0 - - - 0x01F248 07:F238: 18
	.byte $FB					;- D 0 - - - 0x01F249 07:F239: FB
	.byte $05					;- D 0 - - - 0x01F24A 07:F23A: 05
	.byte $FC					;- D 0 - - - 0x01F24B 07:F23B: FC
	.byte $01					;- D 0 - - - 0x01F24C 07:F23C: 01

DATA_0FF23D:
	.byte $08					;- D 0 - - - 0x01F24D 07:F23D: 08
	.byte $F8					;- D 0 - - - 0x01F24E 07:F23E: F8
	.byte $08					;- D 0 - - - 0x01F24F 07:F23F: 08
	.byte $F0					;- D 0 - - - 0x01F250 07:F240: F0
	.byte $03					;- D 0 - - - 0x01F251 07:F241: 03

CODE_0FF242:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01F252 07:F242: BD 94 05
	CLC							;C - - - - - 0x01F255 07:F245: 18
	ADC enemyHitboxDown				;C - - - - - 0x01F256 07:F246: 6D B9 04
	SEC							;C - - - - - 0x01F259 07:F249: 38
	SBC #$07					;C - - - - - 0x01F25A 07:F24A: E9 07
	STA scratch0				;C - - - - - 0x01F25C 07:F24C: 85 00
	LDY enemyHitboxDir				;C - - - - - 0x01F25E 07:F24E: AC 7E 07
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F261 07:F251: BD BC 05
	CLC							;C - - - - - 0x01F264 07:F254: 18
	ADC enemyHitboxDown,Y				;C - - - - - 0x01F265 07:F255: 79 B9 04
	STA scratch1				;C - - - - - 0x01F268 07:F258: 85 01
	JSR GetTile				;C - - - - - 0x01F26A 07:F25A: 20 CB F4
	JSR CODE_0FF07A				;C - - - - - 0x01F26D 07:F25D: 20 7A F0
	LDY enemyHitboxDir				;C - - - - - 0x01F270 07:F260: AC 7E 07
	CPY #$01					;C - - - - - 0x01F273 07:F263: C0 01
	BNE CODE_0FF273				;C - - - - - 0x01F275 07:F265: D0 0C
		LDA scratch3				;C - - - - - 0x01F277 07:F267: A5 03
		EOR #$07					;C - - - - - 0x01F279 07:F269: 49 07
		STA scratch3				;C - - - - - 0x01F27B 07:F26B: 85 03
		JSR CheckWall				;C - - - - - 0x01F27D 07:F26D: 20 E2 F7
		JMP CODE_0FF276				;C - - - - - 0x01F280 07:F270: 4C 76 F2
CODE_0FF273:
	JSR CheckFloor				;C - - - - - 0x01F283 07:F273: 20 1A F8
CODE_0FF276:
	LDA scratch4				;C - - - - - 0x01F286 07:F276: A5 04
	STA projTouchingPlayer				;C - - - - - 0x01F288 07:F278: 85 CE
	AND #$C0					;C - - - - - 0x01F28A 07:F27A: 29 C0
	BNE CODE_0FF282				;C - - - - - 0x01F28C 07:F27C: D0 04
		LDA #$00					;C - - - - - 0x01F28E 07:F27E: A9 00
		STA ram_0081				;C - - - - - 0x01F290 07:F280: 85 81
CODE_0FF282:
	RTS							;C - - - - - 0x01F292 07:F282: 60

CODE_0FF283:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01F293 07:F283: BD 94 05
	CLC							;C - - - - - 0x01F296 07:F286: 18
	ADC enemyHitboxDown				;C - - - - - 0x01F297 07:F287: 6D B9 04
	STA scratch0				;C - - - - - 0x01F29A 07:F28A: 85 00
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F29C 07:F28C: BD BC 05
	STA scratch1				;C - - - - - 0x01F29F 07:F28F: 85 01
	LDA enemyHitboxLeft				;C - - - - - 0x01F2A1 07:F291: AD BA 04
	CMP #$08					;C - - - - - 0x01F2A4 07:F294: C9 08
	BCC CODE_0FF2A8				;C - - - - - 0x01F2A6 07:F296: 90 10
		JSR GetTile				;C - - - - - 0x01F2A8 07:F298: 20 CB F4
		JSR CODE_0FF07A				;C - - - - - 0x01F2AB 07:F29B: 20 7A F0
		JSR CODE_0FF852				;C - - - - - 0x01F2AE 07:F29E: 20 52 F8
		LDA scratch4				;C - - - - - 0x01F2B1 07:F2A1: A5 04
		BNE CODE_0FF2CE				;C - - - - - 0x01F2B3 07:F2A3: D0 29
			LDA enemyHitboxLeft				;C - - - - - 0x01F2B5 07:F2A5: AD BA 04
CODE_0FF2A8:
	CLC							;C - - - - - 0x01F2B8 07:F2A8: 18
	ADC scratch1				;C - - - - - 0x01F2B9 07:F2A9: 65 01
	STA scratch1				;C - - - - - 0x01F2BB 07:F2AB: 85 01
	JSR GetTile				;C - - - - - 0x01F2BD 07:F2AD: 20 CB F4
	JSR CODE_0FF07A				;C - - - - - 0x01F2C0 07:F2B0: 20 7A F0
	JSR CODE_0FF852				;C - - - - - 0x01F2C3 07:F2B3: 20 52 F8
	LDA scratch4				;C - - - - - 0x01F2C6 07:F2B6: A5 04
	BNE CODE_0FF2CE				;C - - - - - 0x01F2C8 07:F2B8: D0 14
		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F2CA 07:F2BA: BD BC 05
		CLC							;C - - - - - 0x01F2CD 07:F2BD: 18
		ADC enemyHitboxRight				;C - - - - - 0x01F2CE 07:F2BE: 6D BB 04
		STA scratch1				;C - - - - - 0x01F2D1 07:F2C1: 85 01
		JSR GetTile				;C - - - - - 0x01F2D3 07:F2C3: 20 CB F4
		JSR CODE_0FF07A				;C - - - - - 0x01F2D6 07:F2C6: 20 7A F0
		JSR CODE_0FF852				;C - - - - - 0x01F2D9 07:F2C9: 20 52 F8
		LDA scratch4				;C - - - - - 0x01F2DC 07:F2CC: A5 04
CODE_0FF2CE:
	STA ram_00CD				;C - - - - - 0x01F2DE 07:F2CE: 85 CD
	AND #$C0					;C - - - - - 0x01F2E0 07:F2D0: 29 C0
	BEQ CODE_0FF2E5				;C - - - - - 0x01F2E2 07:F2D2: F0 11
		LDA irqEffect				;C - - - - - 0x01F2E4 07:F2D4: A5 1D
		CMP #$01					;C - - - - - 0x01F2E6 07:F2D6: C9 01
		BNE CODE_0FF2E5				;C - - - - - 0x01F2E8 07:F2D8: D0 0B
			ASL ram_0081				;C - - - - - 0x01F2EA 07:F2DA: 06 81
			LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F2EC 07:F2DC: BD BC 05
			SEC							;C - - - - - 0x01F2EF 07:F2DF: 38
			SBC ram_0081				;C - - - - - 0x01F2F0 07:F2E0: E5 81
			STA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F2F2 07:F2E2: 9D BC 05
CODE_0FF2E5:
	LDA #$00					;C - - - - - 0x01F2F5 07:F2E5: A9 00
	STA ram_0081				;C - - - - - 0x01F2F7 07:F2E7: 85 81
	RTS							;C - - - - - 0x01F2F9 07:F2E9: 60

CODE_0FF2EA:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01F2FA 07:F2EA: BD 94 05
	CLC							;C - - - - - 0x01F2FD 07:F2ED: 18
	ADC enemyHitboxDown				;C - - - - - 0x01F2FE 07:F2EE: 6D B9 04
	STA scratch0				;C - - - - - 0x01F301 07:F2F1: 85 00
	LDY enemyDir,X				;C - - - - - 0x01F303 07:F2F3: B4 A2
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F305 07:F2F5: BD BC 05
	CLC							;C - - - - - 0x01F308 07:F2F8: 18
	ADC enemyHitboxDown,Y				;C - - - - - 0x01F309 07:F2F9: 79 B9 04
	STA scratch1				;C - - - - - 0x01F30C 07:F2FC: 85 01
	JSR GetTile				;C - - - - - 0x01F30E 07:F2FE: 20 CB F4
	JSR CODE_0FF852				;C - - - - - 0x01F311 07:F301: 20 52 F8
	LDA scratch4				;C - - - - - 0x01F314 07:F304: A5 04
	AND #$80					;C - - - - - 0x01F316 07:F306: 29 80
	LSR							;C - - - - - 0x01F318 07:F308: 4A
	STA ram_00CD				;C - - - - - 0x01F319 07:F309: 85 CD
	LDA enemyDir,X				;C - - - - - 0x01F31B 07:F30B: B5 A2
	EOR #$03					;C - - - - - 0x01F31D 07:F30D: 49 03
	TAY							;C - - - - - 0x01F31F 07:F30F: A8
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F320 07:F310: BD BC 05
	CLC							;C - - - - - 0x01F323 07:F313: 18
	ADC enemyHitboxDown,Y				;C - - - - - 0x01F324 07:F314: 79 B9 04
	STA scratch1				;C - - - - - 0x01F327 07:F317: 85 01
	JSR GetTile				;C - - - - - 0x01F329 07:F319: 20 CB F4
	JSR CODE_0FF852				;C - - - - - 0x01F32C 07:F31C: 20 52 F8
	LDA ram_00CD				;C - - - - - 0x01F32F 07:F31F: A5 CD
	ORA scratch4				;C - - - - - 0x01F331 07:F321: 05 04
	STA ram_00CD				;C - - - - - 0x01F333 07:F323: 85 CD
	RTS							;C - - - - - 0x01F335 07:F325: 60

CODE_0FF326:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01F336 07:F326: BD 94 05
	CLC							;C - - - - - 0x01F339 07:F329: 18
	ADC enemyHitboxUp				;C - - - - - 0x01F33A 07:F32A: 6D BC 04
	STA scratch0				;C - - - - - 0x01F33D 07:F32D: 85 00
	LDY enemyDir,X				;C - - - - - 0x01F33F 07:F32F: B4 A2
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F341 07:F331: BD BC 05
	CLC							;C - - - - - 0x01F344 07:F334: 18
	ADC enemyHitboxDown,Y				;C - - - - - 0x01F345 07:F335: 79 B9 04
	STA scratch1				;C - - - - - 0x01F348 07:F338: 85 01
	JSR GetTile				;C - - - - - 0x01F34A 07:F33A: 20 CB F4
	LDA scratch2				;C - - - - - 0x01F34D 07:F33D: A5 02
	EOR #$07					;C - - - - - 0x01F34F 07:F33F: 49 07
	STA scratch2				;C - - - - - 0x01F351 07:F341: 85 02
	JSR CODE_0FF8F3				;C - - - - - 0x01F353 07:F343: 20 F3 F8
	LDA scratch4				;C - - - - - 0x01F356 07:F346: A5 04
	AND #$80					;C - - - - - 0x01F358 07:F348: 29 80
	LSR							;C - - - - - 0x01F35A 07:F34A: 4A
	STA ram_00CF				;C - - - - - 0x01F35B 07:F34B: 85 CF
	LDA enemyDir,X				;C - - - - - 0x01F35D 07:F34D: B5 A2
	EOR #$03					;C - - - - - 0x01F35F 07:F34F: 49 03
	TAY							;C - - - - - 0x01F361 07:F351: A8
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F362 07:F352: BD BC 05
	CLC							;C - - - - - 0x01F365 07:F355: 18
	ADC enemyHitboxDown,Y				;C - - - - - 0x01F366 07:F356: 79 B9 04
	STA scratch1				;C - - - - - 0x01F369 07:F359: 85 01
	JSR GetTile				;C - - - - - 0x01F36B 07:F35B: 20 CB F4
	LDA scratch2				;C - - - - - 0x01F36E 07:F35E: A5 02
	EOR #$07					;C - - - - - 0x01F370 07:F360: 49 07
	STA scratch2				;C - - - - - 0x01F372 07:F362: 85 02
	JSR CODE_0FF8F3				;C - - - - - 0x01F374 07:F364: 20 F3 F8
	LDA ram_00CF				;C - - - - - 0x01F377 07:F367: A5 CF
	ORA scratch4				;C - - - - - 0x01F379 07:F369: 05 04
	STA ram_00CF				;C - - - - - 0x01F37B 07:F36B: 85 CF
	RTS							;C - - - - - 0x01F37D 07:F36D: 60

CODE_0FF36E:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01F37E 07:F36E: BD 94 05
	CLC							;C - - - - - 0x01F381 07:F371: 18
	ADC enemyHitboxUp				;C - - - - - 0x01F382 07:F372: 6D BC 04
	STA scratch0				;C - - - - - 0x01F385 07:F375: 85 00
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F387 07:F377: BD BC 05
	STA scratch1				;C - - - - - 0x01F38A 07:F37A: 85 01
	LDY #$00					;C - - - - - 0x01F38C 07:F37C: A0 00
CODE_0FF37E:
	TYA							;C - - - - - 0x01F38E 07:F37E: 98
	PHA							;C - - - - - 0x01F38F 07:F37F: 48
	JSR GetTile				;C - - - - - 0x01F390 07:F380: 20 CB F4
	JSR CODE_0FF852				;C - - - - - 0x01F393 07:F383: 20 52 F8
	PLA							;C - - - - - 0x01F396 07:F386: 68
	TAY							;C - - - - - 0x01F397 07:F387: A8
	LDA scratch4				;C - - - - - 0x01F398 07:F388: A5 04
	BNE CODE_0FF39B				;C - - - - - 0x01F39A 07:F38A: D0 0F
		LDA scratch0				;C - - - - - 0x01F39C 07:F38C: A5 00
		SEC							;C - - - - - 0x01F39E 07:F38E: 38
		SBC #$08					;C - - - - - 0x01F39F 07:F38F: E9 08
		STA scratch0				;C - - - - - 0x01F3A1 07:F391: 85 00
		INY							;C - - - - - 0x01F3A3 07:F393: C8
		CPY enemyUpperScanRange				;C - - - - - 0x01F3A4 07:F394: CC BD 04
		BNE CODE_0FF37E				;C - - - - - 0x01F3A7 07:F397: D0 E5

		LDA #$00					;C - - - - - 0x01F3A9 07:F399: A9 00
CODE_0FF39B:
	;A/04: Non-zero if suitable ledge found above
	STA ram_00CF				;C - - - - - 0x01F3AB 07:F39B: 85 CF
	RTS							;C - - - - - 0x01F3AD 07:F39D: 60

CODE_0FF39E:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01F3AE 07:F39E: BD 94 05
	CLC							;C - - - - - 0x01F3B1 07:F3A1: 18
	ADC enemyHitboxUp				;C - - - - - 0x01F3B2 07:F3A2: 6D BC 04
	STA scratch0				;C - - - - - 0x01F3B5 07:F3A5: 85 00
	LDY #$00					;C - - - - - 0x01F3B7 07:F3A7: A0 00
CODE_0FF3A9:
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F3B9 07:F3A9: BD BC 05
	CLC							;C - - - - - 0x01F3BC 07:F3AC: 18
	ADC DATA_0FF3CA,Y			;C - - - - - 0x01F3BD 07:F3AD: 79 CA F3
	STA scratch1				;C - - - - - 0x01F3C0 07:F3B0: 85 01
	JSR GetTile				;C - - - - - 0x01F3C2 07:F3B2: 20 CB F4
	LDA scratch2				;C - - - - - 0x01F3C5 07:F3B5: A5 02
	EOR #$07					;C - - - - - 0x01F3C7 07:F3B7: 49 07
	STA scratch2				;C - - - - - 0x01F3C9 07:F3B9: 85 02
	JSR CODE_0FF8F3				;C - - - - - 0x01F3CB 07:F3BB: 20 F3 F8
	LDA scratch4				;C - - - - - 0x01F3CE 07:F3BE: A5 04
	BNE CODE_0FF3C7				;C - - - - - 0x01F3D0 07:F3C0: D0 05
		INY							;C - - - - - 0x01F3D2 07:F3C2: C8
		CPY #$03					;C - - - - - 0x01F3D3 07:F3C3: C0 03
		BCC CODE_0FF3A9				;C - - - - - 0x01F3D5 07:F3C5: 90 E2
CODE_0FF3C7:
	STA ram_00CF				;C - - - - - 0x01F3D7 07:F3C7: 85 CF
	RTS							;C - - - - - 0x01F3D9 07:F3C9: 60

DATA_0FF3CA:
	.byte $00					;- D 0 - - - 0x01F3DA 07:F3CA: 00
	.byte $08					;- - - - - - 0x01F3DB 07:F3CB: 08
	.byte $F8					;- D 0 - - - 0x01F3DC 07:F3CC: F8

CODE_0FF3CD:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x01F3DD 07:F3CD: BD 6C 05
	CMP #$01					;C - - - - - 0x01F3E0 07:F3D0: C9 01
	BNE CODE_0FF3DA				;C - - - - - 0x01F3E2 07:F3D2: D0 06
		JSR CODE_0FF326				;C - - - - - 0x01F3E4 07:F3D4: 20 26 F3
		JMP CODE_0FF3DD				;C - - - - - 0x01F3E7 07:F3D7: 4C DD F3
CODE_0FF3DA:
	JSR CODE_0FF2EA				;C - - - - - 0x01F3EA 07:F3DA: 20 EA F2
CODE_0FF3DD:
	RTS							;C - - - - - 0x01F3ED 07:F3DD: 60

CODE_0FF3DE:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01F3EE 07:F3DE: BD 94 05
	STA scratch0				;C - - - - - 0x01F3F1 07:F3E1: 85 00
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F3F3 07:F3E3: BD BC 05
	CMP #$10					;C - - - - - 0x01F3F6 07:F3E6: C9 10
	BCC CODE_0FF3F1				;C - - - - - 0x01F3F8 07:F3E8: 90 07
		CMP #$F0					;C - - - - - 0x01F3FA 07:F3EA: C9 F0
		BCS CODE_0FF406				;C - - - - - 0x01F3FC 07:F3EC: B0 18
			JMP CODE_0FF41B				;C - - - - - 0x01F3FE 07:F3EE: 4C 1B F4
CODE_0FF3F1:
	SEC							;C - - - - - 0x01F401 07:F3F1: 38
	SBC #$08					;C - - - - - 0x01F402 07:F3F2: E9 08
	STA scratch1				;C - - - - - 0x01F404 07:F3F4: 85 01
	JSR GetTile				;C - - - - - 0x01F406 07:F3F6: 20 CB F4
	JSR CODE_0FF07A				;C - - - - - 0x01F409 07:F3F9: 20 7A F0
	JSR CheckWall				;C - - - - - 0x01F40C 07:F3FC: 20 E2 F7
	LDA scratch4				;C - - - - - 0x01F40F 07:F3FF: A5 04
	STA projTouchingPlayer				;C - - - - - 0x01F411 07:F401: 85 CE
	JMP CODE_0FF41F				;C - - - - - 0x01F413 07:F403: 4C 1F F4
CODE_0FF406:
	CLC							;C - - - - - 0x01F416 07:F406: 18
	ADC #$08					;C - - - - - 0x01F417 07:F407: 69 08
	STA scratch1				;C - - - - - 0x01F419 07:F409: 85 01
	JSR GetTile				;C - - - - - 0x01F41B 07:F40B: 20 CB F4
	JSR CODE_0FF07A				;C - - - - - 0x01F41E 07:F40E: 20 7A F0
	JSR CheckFloor				;C - - - - - 0x01F421 07:F411: 20 1A F8
	LDA scratch4				;C - - - - - 0x01F424 07:F414: A5 04
	STA projTouchingPlayer				;C - - - - - 0x01F426 07:F416: 85 CE
	JMP CODE_0FF41F				;C - - - - - 0x01F428 07:F418: 4C 1F F4
CODE_0FF41B:
	LDA #$00					;C - - - - - 0x01F42B 07:F41B: A9 00
	STA projTouchingPlayer				;C - - - - - 0x01F42D 07:F41D: 85 CE
CODE_0FF41F:
	RTS							;C - - - - - 0x01F42F 07:F41F: 60

CODE_0FF420:
	;Unreached
	LDY enemyDir,X				;- - - - - - 0x01F430 07:F420: B4
	LDA objX+OSLOT_ENEMY,X				;- - - - - - 0x01F432 07:F422: BD
	CLC							;- - - - - - 0x01F435 07:F425: 18
	ADC enemyHitboxDown,Y				;- - - - - - 0x01F436 07:F426: 79
	STA scratch1				;- - - - - - 0x01F439 07:F429: 85
	LDA objY+OSLOT_ENEMY,X				;- - - - - - 0x01F43B 07:F42B: BD
	SEC							;- - - - - - 0x01F43E 07:F42E: 38
	SBC #$18					;- - - - - - 0x01F43F 07:F42F: E9
	STA scratch0				;- - - - - - 0x01F441 07:F431: 85
	LDY #$00					;- - - - - - 0x01F443 07:F433: A0
CODE_0FF435:
	TYA							;- - - - - - 0x01F445 07:F435: 98
	PHA							;- - - - - - 0x01F446 07:F436: 48
	LDA scratch0				;- - - - - - 0x01F447 07:F437: A5
	CLC							;- - - - - - 0x01F449 07:F439: 18
	ADC enemyHitboxDown				;- - - - - - 0x01F44A 07:F43A: 6D
	STA scratch0				;- - - - - - 0x01F44D 07:F43D: 85
	JSR GetTile				;- - - - - - 0x01F44F 07:F43F: 20
	JSR CODE_0FF07A				;- - - - - - 0x01F452 07:F442: 20
	LDA enemyDir,X				;- - - - - - 0x01F455 07:F445: B5
	CMP #$01					;- - - - - - 0x01F457 07:F447: C9
	BNE CODE_0FF457				;- - - - - - 0x01F459 07:F449: D0
		LDA scratch3				;- - - - - - 0x01F45B 07:F44B: A5
		EOR #$07					;- - - - - - 0x01F45D 07:F44D: 49
		STA scratch3				;- - - - - - 0x01F45F 07:F44F: 85
		JSR CheckWall				;- - - - - - 0x01F461 07:F451: 20
		JMP CODE_0FF45A				;- - - - - - 0x01F464 07:F454: 4C
CODE_0FF457:
	JSR CheckFloor				;- - - - - - 0x01F467 07:F457: 20
CODE_0FF45A:
	PLA							;- - - - - - 0x01F46A 07:F45A: 68
	TAY							;- - - - - - 0x01F46B 07:F45B: A8
	LDA scratch4				;- - - - - - 0x01F46C 07:F45C: A5
	STA projTouchingPlayer				;- - - - - - 0x01F46E 07:F45E: 85
	BNE CODE_0FF467				;- - - - - - 0x01F470 07:F460: D0
		INY							;- - - - - - 0x01F472 07:F462: C8
		CPY #$03					;- - - - - - 0x01F473 07:F463: C0
		BNE CODE_0FF435				;- - - - - - 0x01F475 07:F465: D0
CODE_0FF467:
	RTS							;- - - - - - 0x01F477 07:F467: 60

BubbleEmergingCheckTerrain:
	LDY shootDir				;C - - - - - 0x01F478 07:F468: AC 14 05
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01F47B 07:F46B: BD 9F 05
	CLC							;C - - - - - 0x01F47E 07:F46E: 18
	ADC BubbleEmergingTerrainVOffsets,Y			;C - - - - - 0x01F47F 07:F46F: 79 C5 F4
	STA scratch0				;C - - - - - 0x01F482 07:F472: 85 00

	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01F484 07:F474: BD C7 05
	CLC							;C - - - - - 0x01F487 07:F477: 18
	ADC BubbleEmergingTerrainHOffsets,Y			;C - - - - - 0x01F488 07:F478: 79 C8 F4
	STA scratch1				;C - - - - - 0x01F48B 07:F47B: 85 01

	JSR GetTile				;C - - - - - 0x01F48D 07:F47D: 20 CB F4
	LDY shootDir				;C - - - - - 0x01F490 07:F480: AC 14 05
	CPY #$02					;C - - - - - 0x01F493 07:F483: C0 02
	BEQ CODE_0FF493				;C - - - - - 0x01F495 07:F485: F0 0C
		LDA scratch3				;C - - - - - 0x01F497 07:F487: A5 03
		EOR #$07					;C - - - - - 0x01F499 07:F489: 49 07
		STA scratch3				;C - - - - - 0x01F49B 07:F48B: 85 03
		JSR CheckWall				;C - - - - - 0x01F49D 07:F48D: 20 E2 F7
		JMP CODE_0FF496				;C - - - - - 0x01F4A0 07:F490: 4C 96 F4
CODE_0FF493:
	JSR CheckFloor				;C - - - - - 0x01F4A3 07:F493: 20 1A F8
CODE_0FF496:
	;04: Collision result (40 wall, 80 floor)
	LDA scratch4				;C - - - - - 0x01F4A6 07:F496: A5 04
	STA terrainResult				;C - - - - - 0x01F4A8 07:F498: 8D E9 04
	BEQ CODE_0FF4C4				;C - - - - - 0x01F4AB 07:F49B: F0 27
		LDA shootDir				;C - - - - - 0x01F4AD 07:F49D: AD 14 05
		EOR #$03					;C - - - - - 0x01F4B0 07:F4A0: 49 03
		TAY							;C - - - - - 0x01F4B2 07:F4A2: A8

		LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01F4B3 07:F4A3: BD 9F 05
		CLC							;C - - - - - 0x01F4B6 07:F4A6: 18
		ADC BubbleEmergingTerrainVOffsets,Y			;C - - - - - 0x01F4B7 07:F4A7: 79 C5 F4
		STA scratch0				;C - - - - - 0x01F4BA 07:F4AA: 85 00

		LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01F4BC 07:F4AC: BD C7 05
		CLC							;C - - - - - 0x01F4BF 07:F4AF: 18
		ADC BubbleEmergingTerrainHOffsets,Y			;C - - - - - 0x01F4C0 07:F4B0: 79 C8 F4
		STA scratch1				;C - - - - - 0x01F4C3 07:F4B3: 85 01

		JSR GetTile				;C - - - - - 0x01F4C5 07:F4B5: 20 CB F4
		JSR CheckSolid				;C - - - - - 0x01F4C8 07:F4B8: 20 D2 F9
		LDA scratch0				;C - - - - - 0x01F4CB 07:F4BB: A5 00
		BEQ CODE_0FF4C4				;C - - - - - 0x01F4CD 07:F4BD: F0 05
			LDA #$FF					;C - - - - - 0x01F4CF 07:F4BF: A9 FF
			STA terrainResult				;C - - - - - 0x01F4D1 07:F4C1: 8D E9 04
CODE_0FF4C4:
	RTS							;C - - - - - 0x01F4D4 07:F4C4: 60

BubbleEmergingTerrainVOffsets:
	.byte $00					;- - - - - - 0x01F4D5 07:F4C5: 00
	.byte $00					;- D 0 - - - 0x01F4D6 07:F4C6: 00
	.byte $00					;- D 0 - - - 0x01F4D7 07:F4C7: 00

BubbleEmergingTerrainHOffsets:
	.byte $00					;- - - - - - 0x01F4D8 07:F4C8: 00
	.byte $F8					;- D 0 - - - 0x01F4D9 07:F4C9: F8
	.byte $08					;- D 0 - - - 0x01F4DA 07:F4CA: 08

GetTile:
	;Get 8x8 tile at round X,Y
	;00: Y
	;01: X

	LDA irqEffect				;C - - - - - 0x01F4DB 07:F4CB: A5 1D
.ifdef REGION_JP
	BEQ CODE_0FF563					;- - - - - - 0x01F4DB 07:F4CB: F0
.else
	BNE CODE_0FF4D2				;C - - - - - 0x01F4DD 07:F4CD: D0 03
		JMP CODE_0FF563				;C - - - - - 0x01F4DF 07:F4CF: 4C 63 F5
.endif
CODE_0FF4D2:
	CMP #$02					;C - - - - - 0x01F4E2 07:F4D2: C9 02
	BEQ CODE_0FF50A				;C - - - - - 0x01F4E4 07:F4D4: F0 34

	CMP #$05					;C - - - - - 0x01F4E6 07:F4D6: C9 05
	BEQ CODE_0FF549				;C - - - - - 0x01F4E8 07:F4D8: F0 6F

.ifdef REGION_JP
	LDA #.BANK(RoundsFlowTable)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x01F4EA 07:F4DA: A9 00
	ORA #$07					;C - - - - - 0x01F4EC 07:F4DC: 09 07
	STA $8000				;C - - - - - 0x01F4EE 07:F4DE: 8D 00 80
	LDA #.BANK(RoundsFlowTable)					;C - - - - - 0x01F4F1 07:F4E1: A9 06
	STA $8001				;C - - - - - 0x01F4F3 07:F4E3: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F4F6 07:F4E6: 85 53

	LDA #$00					;C - - - - - 0x01F4F8 07:F4E8: A9 00
	ORA #$07					;C - - - - - 0x01F4FA 07:F4EA: 09 07
	STA $8000				;C - - - - - 0x01F4FC 07:F4EC: 8D 00 80
	LDA #.BANK(RoundsFlowTable)					;C - - - - - 0x01F4FF 07:F4EF: A9 06
	STA $8001				;C - - - - - 0x01F501 07:F4F1: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F504 07:F4F4: 85 53
.endif

	LDA scratch0				;C - - - - - 0x01F506 07:F4F6: A5 00
	AND #$F8					;C - - - - - 0x01F508 07:F4F8: 29 F8
	TAY							;C - - - - - 0x01F50A 07:F4FA: A8
	LDA (ram_0027),Y			;C - - - - - 0x01F50B 07:F4FB: B1 27
	STA ram_0080				;C - - - - - 0x01F50D 07:F4FD: 85 80
	BEQ CODE_0FF563				;C - - - - - 0x01F50F 07:F4FF: F0 62

	TAY							;C - - - - - 0x01F511 07:F501: A8
	LDA ram_0760,Y				;C - - - - - 0x01F512 07:F502: B9 60 07
	STA ram_00D2				;C - - - - - 0x01F515 07:F505: 85 D2
	JMP CODE_0FF535				;C - - - - - 0x01F517 07:F507: 4C 35 F5
CODE_0FF50A:
	;Unreached

.ifdef REGION_JP
	LDA #.BANK(RoundsFlowTable)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;- - - - - - 0x01F51A 07:F50A: A9
	ORA #$07					;- - - - - - 0x01F51C 07:F50C: 09
	STA $8000					;- - - - - - 0x01F51E 07:F50E: 8D
	LDA #.BANK(RoundsFlowTable)					;- - - - - - 0x01F521 07:F511: A9
	STA $8001					;- - - - - - 0x01F523 07:F513: 8D
	STA prgBankB				;- - - - - - 0x01F526 07:F516: 85

	LDA #$00					;- - - - - - 0x01F528 07:F518: A9
	ORA #$07					;- - - - - - 0x01F52A 07:F51A: 09
	STA $8000					;- - - - - - 0x01F52C 07:F51C: 8D
	LDA #.BANK(RoundsFlowTable)					;- - - - - - 0x01F52F 07:F51F: A9
	STA $8001					;- - - - - - 0x01F531 07:F521: 8D
	STA prgBankB				;- - - - - - 0x01F534 07:F524: 85
.endif

	LDA scratch0				;- - - - - - 0x01F536 07:F526: A5
	AND #$F8					;- - - - - - 0x01F538 07:F528: 29
	BEQ CODE_0FF563				;- - - - - - 0x01F53A 07:F52A: F0

	TAY							;- - - - - - 0x01F53C 07:F52C: A8
	LDA (ram_0027),Y			;- - - - - - 0x01F53D 07:F52D: B1
	TAY							;- - - - - - 0x01F53F 07:F52F: A8
	LDA flowAdr+1,Y				;- - - - - - 0x01F540 07:F530: B9
	STA ram_00D3				;- - - - - - 0x01F543 07:F533: 85
CODE_0FF535:
	LDA scratch0				;C - - - - - 0x01F545 07:F535: A5 00
	CLC							;C - - - - - 0x01F547 07:F537: 18
	ADC ram_00D3				;C - - - - - 0x01F548 07:F538: 65 D3
	AND #$F0					;C - - - - - 0x01F54A 07:F53A: 29 F0
	STA scratch2				;C - - - - - 0x01F54C 07:F53C: 85 02
	LDA scratch1				;C - - - - - 0x01F54E 07:F53E: A5 01
	CLC							;C - - - - - 0x01F550 07:F540: 18
	ADC ram_00D2				;C - - - - - 0x01F551 07:F541: 65 D2
	STA ram_001F				;C - - - - - 0x01F553 07:F543: 85 1F
	CLC							;C - - - - - 0x01F555 07:F545: 18
	JMP CODE_0FF56D				;C - - - - - 0x01F556 07:F546: 4C 6D F5
CODE_0FF549:
	LDA scratch0				;C - - - - - 0x01F559 07:F549: A5 00
	AND #$F0					;C - - - - - 0x01F55B 07:F54B: 29 F0
	STA scratch2				;C - - - - - 0x01F55D 07:F54D: 85 02
	ASL scratch2				;C - - - - - 0x01F55F 07:F54F: 06 02
	LDA originalTerrainAdr+1				;C - - - - - 0x01F561 07:F551: A5 45
	ADC #$00					;C - - - - - 0x01F563 07:F553: 69 00
	STA terrainAdr+1				;C - - - - - 0x01F565 07:F555: 85 43
	LDA scratch1				;C - - - - - 0x01F567 07:F557: A5 01
	CLC							;C - - - - - 0x01F569 07:F559: 18
	ADC wideHScroll				;C - - - - - 0x01F56A 07:F55A: 6D 61 07
	STA ram_001F				;C - - - - - 0x01F56D 07:F55D: 85 1F
	ROR							;C - - - - - 0x01F56F 07:F55F: 6A
	JMP CODE_0FF56E				;C - - - - - 0x01F570 07:F560: 4C 6E F5
CODE_0FF563:
	;Now have effective X and Y, taking IRQ effects into account
	LDA scratch0				;C - - - - - 0x01F573 07:F563: A5 00
	AND #$F0					;C - - - - - 0x01F575 07:F565: 29 F0
	STA scratch2				;C - - - - - 0x01F577 07:F567: 85 02

	LDA scratch1				;C - - - - - 0x01F579 07:F569: A5 01
	STA ram_001F				;C - - - - - 0x01F57B 07:F56B: 85 1F
CODE_0FF56D:
	LSR							;C - - - - - 0x01F57D 07:F56D: 4A
CODE_0FF56E:
	LSR							;C - - - - - 0x01F57E 07:F56E: 4A
	LSR							;C - - - - - 0x01F57F 07:F56F: 4A
	LSR							;C - - - - - 0x01F580 07:F570: 4A
	CLC							;C - - - - - 0x01F581 07:F571: 18
	ADC scratch2				;C - - - - - 0x01F582 07:F572: 65 02
	STA ram_0046				;C - - - - - 0x01F584 07:F574: 85 46
	TAY							;C - - - - - 0x01F586 07:F576: A8

.ifdef REGION_JP
	LDA terrainBank
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x01F587 07:F577: A9 00
	ORA #$07					;C - - - - - 0x01F589 07:F579: 09 07
	STA $8000				;C - - - - - 0x01F58B 07:F57B: 8D 00 80
	LDA terrainBank				;C - - - - - 0x01F58E 07:F57E: AD 5B 07
	STA $8001				;C - - - - - 0x01F591 07:F581: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F594 07:F584: 85 53

	LDA #$00					;C - - - - - 0x01F596 07:F586: A9 00
	ORA #$07					;C - - - - - 0x01F598 07:F588: 09 07
	STA $8000				;C - - - - - 0x01F59A 07:F58A: 8D 00 80
	LDA terrainBank				;C - - - - - 0x01F59D 07:F58D: AD 5B 07
	STA $8001				;C - - - - - 0x01F5A0 07:F590: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F5A3 07:F593: 85 53
.endif

	;Get 16x16 tile number
	LDA (terrainAdr),Y			;C - - - - - 0x01F5A5 07:F595: B1 42
	STA scratch3				;C - - - - - 0x01F5A7 07:F597: 85 03
	STA scratch6				;C - - - - - 0x01F5A9 07:F599: 85 06
	LDA #$00					;C - - - - - 0x01F5AB 07:F59B: A9 00
	STA scratch7				;C - - - - - 0x01F5AD 07:F59D: 85 07
	ASL scratch6				;C - - - - - 0x01F5AF 07:F59F: 06 06
	ROL scratch7				;C - - - - - 0x01F5B1 07:F5A1: 26 07
	ASL scratch6				;C - - - - - 0x01F5B3 07:F5A3: 06 06
	ROL scratch7				;C - - - - - 0x01F5B5 07:F5A5: 26 07
	;Now times 4 (16-bit)
	LDA scratch6				;C - - - - - 0x01F5B7 07:F5A7: A5 06
	CLC							;C - - - - - 0x01F5B9 07:F5A9: 18
	ADC scratch3				;C - - - - - 0x01F5BA 07:F5AA: 65 03
	STA scratch6				;C - - - - - 0x01F5BC 07:F5AC: 85 06
	LDA scratch7				;C - - - - - 0x01F5BE 07:F5AE: A5 07
	ADC #$00					;C - - - - - 0x01F5C0 07:F5B0: 69 00
	STA scratch7				;C - - - - - 0x01F5C2 07:F5B2: 85 07
	;Now times 5 (16-bit)
	LDA terrainTypeDefs				;C - - - - - 0x01F5C4 07:F5B4: A5 40
	CLC							;C - - - - - 0x01F5C6 07:F5B6: 18
	ADC scratch6				;C - - - - - 0x01F5C7 07:F5B7: 65 06
	STA terrainTileDef				;C - - - - - 0x01F5C9 07:F5B9: 85 60
	LDA terrainTypeDefs+1				;C - - - - - 0x01F5CB 07:F5BB: A5 41
	ADC scratch7				;C - - - - - 0x01F5CD 07:F5BD: 65 07
	STA terrainTileDef+1				;C - - - - - 0x01F5CF 07:F5BF: 85 61

	LDY #$01					;C - - - - - 0x01F5D1 07:F5C1: A0 01
	LDA scratch0				;C - - - - - 0x01F5D3 07:F5C3: A5 00
	AND #$0F					;C - - - - - 0x01F5D5 07:F5C5: 29 0F
	CMP #$08					;C - - - - - 0x01F5D7 07:F5C7: C9 08
	BCC CODE_0FF5CD				;C - - - - - 0x01F5D9 07:F5C9: 90 02
		LDY #$03					;C - - - - - 0x01F5DB 07:F5CB: A0 03
CODE_0FF5CD:
	AND #$07					;C - - - - - 0x01F5DD 07:F5CD: 29 07
	STA scratch2				;C - - - - - 0x01F5DF 07:F5CF: 85 02
	LDA ram_001F				;C - - - - - 0x01F5E1 07:F5D1: A5 1F
	AND #$0F					;C - - - - - 0x01F5E3 07:F5D3: 29 0F
	CMP #$08					;C - - - - - 0x01F5E5 07:F5D5: C9 08
	BCC CODE_0FF5DA				;C - - - - - 0x01F5E7 07:F5D7: 90 01
		INY							;C - - - - - 0x01F5E9 07:F5D9: C8
CODE_0FF5DA:
	AND #$07					;C - - - - - 0x01F5EA 07:F5DA: 29 07
	STA scratch3				;C - - - - - 0x01F5EC 07:F5DC: 85 03
	LDA (terrainTileDef),Y			;C - - - - - 0x01F5EE 07:F5DE: B1 60
	STA scratch4				;C - - - - - 0x01F5F0 07:F5E0: 85 04
	STY ram_075C				;C - - - - - 0x01F5F2 07:F5E2: 8C 5C 07

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x01F5F5 07:F5E5: 60

CODE_0FF5E6:
	LDA irqEffect				;C - - - - - 0x01F5F6 07:F5E6: A5 1D
	BEQ CODE_0FF629				;C - - - - - 0x01F5F8 07:F5E8: F0 3F

	CMP #$01					;C - - - - - 0x01F5FA 07:F5EA: C9 01
	BNE CODE_0FF629				;C - - - - - 0x01F5FC 07:F5EC: D0 3B

.ifdef REGION_JP
	LDA #.BANK(RoundsFlowTable)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x01F5FE 07:F5EE: A9 00
	ORA #$07					;C - - - - - 0x01F600 07:F5F0: 09 07
	STA $8000				;C - - - - - 0x01F602 07:F5F2: 8D 00 80
	LDA #.BANK(RoundsFlowTable)					;C - - - - - 0x01F605 07:F5F5: A9 06
	STA $8001				;C - - - - - 0x01F607 07:F5F7: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F60A 07:F5FA: 85 53

	LDA #$00					;C - - - - - 0x01F60C 07:F5FC: A9 00
	ORA #$07					;C - - - - - 0x01F60E 07:F5FE: 09 07
	STA $8000				;C - - - - - 0x01F610 07:F600: 8D 00 80
	LDA #.BANK(RoundsFlowTable)					;C - - - - - 0x01F613 07:F603: A9 06
	STA $8001				;C - - - - - 0x01F615 07:F605: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F618 07:F608: 85 53
.endif

	LDA scratch0				;C - - - - - 0x01F61A 07:F60A: A5 00
	AND #$F8					;C - - - - - 0x01F61C 07:F60C: 29 F8
	TAY							;C - - - - - 0x01F61E 07:F60E: A8
	LDA (ram_0027),Y			;C - - - - - 0x01F61F 07:F60F: B1 27
	TAY							;C - - - - - 0x01F621 07:F611: A8
	LDA ram_0760,Y				;C - - - - - 0x01F622 07:F612: B9 60 07
	STA ram_00D2				;C - - - - - 0x01F625 07:F615: 85 D2

.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif

	LDA scratch0				;C - - - - - 0x01F627 07:F617: A5 00
	CLC							;C - - - - - 0x01F629 07:F619: 18
	ADC ram_00D3				;C - - - - - 0x01F62A 07:F61A: 65 D3
	AND #$F0					;C - - - - - 0x01F62C 07:F61C: 29 F0
	STA scratch2				;C - - - - - 0x01F62E 07:F61E: 85 02
	LDA scratch1				;C - - - - - 0x01F630 07:F620: A5 01
	CLC							;C - - - - - 0x01F632 07:F622: 18
	ADC ram_00D2				;C - - - - - 0x01F633 07:F623: 65 D2
	CLC							;C - - - - - 0x01F635 07:F625: 18
	JMP CODE_0FF632				;C - - - - - 0x01F636 07:F626: 4C 32 F6
CODE_0FF629:
	LDA scratch0				;C - - - - - 0x01F639 07:F629: A5 00
	AND #$F0					;C - - - - - 0x01F63B 07:F62B: 29 F0
	STA scratch2				;C - - - - - 0x01F63D 07:F62D: 85 02
	LDA scratch1				;C - - - - - 0x01F63F 07:F62F: A5 01
	CLC							;C - - - - - 0x01F641 07:F631: 18
CODE_0FF632:
	LSR							;C - - - - - 0x01F642 07:F632: 4A
	LSR							;C - - - - - 0x01F643 07:F633: 4A
	LSR							;C - - - - - 0x01F644 07:F634: 4A
	LSR							;C - - - - - 0x01F645 07:F635: 4A
	CLC							;C - - - - - 0x01F646 07:F636: 18
	ADC scratch2				;C - - - - - 0x01F647 07:F637: 65 02
	STA ram_0046				;C - - - - - 0x01F649 07:F639: 85 46
	JSR CODE_0FF986				;C - - - - - 0x01F64B 07:F63B: 20 86 F9
	LDA scratch5				;C - - - - - 0x01F64E 07:F63E: A5 05
	STA scratch4				;C - - - - - 0x01F650 07:F640: 85 04
	RTS							;C - - - - - 0x01F652 07:F642: 60

CODE_0FF643:
	LDA objY				;C - - - - - 0x01F653 07:F643: AD 8B 05
	CLC							;C - - - - - 0x01F656 07:F646: 18
	ADC ram_0070				;C - - - - - 0x01F657 07:F647: 65 70
	STA scratch0				;C - - - - - 0x01F659 07:F649: 85 00
	LDA objX				;C - - - - - 0x01F65B 07:F64B: AD B3 05
	STA scratch1				;C - - - - - 0x01F65E 07:F64E: 85 01
	JSR GetTile				;C - - - - - 0x01F660 07:F650: 20 CB F4
	LDA #$00					;C - - - - - 0x01F663 07:F653: A9 00
	STA scratch5				;C - - - - - 0x01F665 07:F655: 85 05
	LDA #.HIBYTE(@ret-1)					;C - - - - - 0x01F667 07:F657: A9 F6
	PHA							;C - - - - - 0x01F669 07:F659: 48
	LDA #.LOBYTE(@ret-1)					;C - - - - - 0x01F66A 07:F65A: A9 5F
	PHA							;C - - - - - 0x01F66C 07:F65C: 48
	JMP (ram_006E)				;C - - - - - 0x01F66D 07:F65D: 6C 6E 00
@ret:
	RTS							;C - - - - - 0x01F670 07:F660: 60

CODE_0FF661:
	LDA currentRound				;C - - - - - 0x01F671 07:F661: A5 D8
	CMP #$45					;C - - - - - 0x01F673 07:F663: C9 45
	BEQ CODE_0FF672				;C - - - - - 0x01F675 07:F665: F0 0B
	CMP #$49					;C - - - - - 0x01F677 07:F667: C9 49
	BEQ CODE_0FF672				;C - - - - - 0x01F679 07:F669: F0 07
	CMP #$4E					;C - - - - - 0x01F67B 07:F66B: C9 4E
	BEQ CODE_0FF672				;C - - - - - 0x01F67D 07:F66D: F0 03
		JMP CODE_0FF686				;C - - - - - 0x01F67F 07:F66F: 4C 86 F6
CODE_0FF672:
	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01F682 07:F672: BD 94 05
	STA scratch0				;C - - - - - 0x01F685 07:F675: 85 00
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01F687 07:F677: BD BC 05
	STA scratch1				;C - - - - - 0x01F68A 07:F67A: 85 01
	JSR GetTile				;C - - - - - 0x01F68C 07:F67C: 20 CB F4
	LDA #$01					;C - - - - - 0x01F68F 07:F67F: A9 01
	STA scratch5				;C - - - - - 0x01F691 07:F681: 85 05
	JSR CODE_0FFCF6				;C - - - - - 0x01F693 07:F683: 20 F6 FC
CODE_0FF686:
	RTS							;C - - - - - 0x01F696 07:F686: 60

CODE_0FF687:
	RTS							;C - - - - - 0x01F697 07:F687: 60

CODE_0FF688:
	LDA playerState				;C - - - - - 0x01F698 07:F688: A5 75
	CMP #$02					;C - - - - - 0x01F69A 07:F68A: C9 02
	BEQ CODE_0FF6FC				;C - - - - - 0x01F69C 07:F68C: F0 6E

	CMP #$03					;C - - - - - 0x01F69E 07:F68E: C9 03
	BEQ CODE_0FF6FC				;C - - - - - 0x01F6A0 07:F690: F0 6A

	LDA ram_007B				;C - - - - - 0x01F6A2 07:F692: A5 7B
	CMP #$80					;C - - - - - 0x01F6A4 07:F694: C9 80
	BCS CODE_0FF6FC				;C - - - - - 0x01F6A6 07:F696: B0 64

	LDA ram_077B				;C - - - - - 0x01F6A8 07:F698: AD 7B 07
	BNE CODE_0FF6FC				;C - - - - - 0x01F6AB 07:F69B: D0 5F

	LDA scratch4				;C - - - - - 0x01F6AD 07:F69D: A5 04
	CMP cutsceneActorActive				;C - - - - - 0x01F6AF 07:F69F: CD 53 07
	BNE CODE_0FF6FC				;C - - - - - 0x01F6B2 07:F6A2: D0 58

	JSR CODE_0FF727				;C - - - - - 0x01F6B4 07:F6A4: 20 27 F7
	LDX ram_077B				;C - - - - - 0x01F6B7 07:F6A7: AE 7B 07
	CPX #$00					;C - - - - - 0x01F6BA 07:F6AA: E0 00
	BEQ CODE_0FF6FC				;C - - - - - 0x01F6BC 07:F6AC: F0 4E

	LDY DATA_0FF75A,X			;C - - - - - 0x01F6BE 07:F6AE: BC 5A F7
	LDA #$00					;C - - - - - 0x01F6C1 07:F6B1: A9 00
	STA scratch0				;C - - - - - 0x01F6C3 07:F6B3: 85 00
	LDA DATA_0FF76B,Y			;C - - - - - 0x01F6C5 07:F6B5: B9 6B F7
CODE_0FF6B8:
	INC scratch0				;C - - - - - 0x01F6C8 07:F6B8: E6 00
	CLC							;C - - - - - 0x01F6CA 07:F6BA: 18
	ADC #$10					;C - - - - - 0x01F6CB 07:F6BB: 69 10
	CMP objY				;C - - - - - 0x01F6CD 07:F6BD: CD 8B 05
	BCC CODE_0FF6B8				;C - - - - - 0x01F6D0 07:F6C0: 90 F6

	DEC scratch0				;C - - - - - 0x01F6D2 07:F6C2: C6 00
	LDA scratch0				;C - - - - - 0x01F6D4 07:F6C4: A5 00
	STA scratch1				;C - - - - - 0x01F6D6 07:F6C6: 85 01
	ASL							;C - - - - - 0x01F6D8 07:F6C8: 0A
	CLC							;C - - - - - 0x01F6D9 07:F6C9: 18
	ADC scratch1				;C - - - - - 0x01F6DA 07:F6CA: 65 01
	STA scratch0				;C - - - - - 0x01F6DC 07:F6CC: 85 00
	LDA DATA_0FF76B+1,Y			;C - - - - - 0x01F6DE 07:F6CE: B9 6C F7
CODE_0FF6D1:
	INC scratch0				;C - - - - - 0x01F6E1 07:F6D1: E6 00
	CLC							;C - - - - - 0x01F6E3 07:F6D3: 18
	ADC #$10					;C - - - - - 0x01F6E4 07:F6D4: 69 10
	CMP objX				;C - - - - - 0x01F6E6 07:F6D6: CD B3 05
	BCC CODE_0FF6D1				;C - - - - - 0x01F6E9 07:F6D9: 90 F6

	LDY DATA_0FF6FD,X			;C - - - - - 0x01F6EB 07:F6DB: BC FD F6
	STY playerDir				;C - - - - - 0x01F6EE 07:F6DE: 84 77
	LDA PlayerRotateAnims,Y			;C - - - - - 0x01F6F0 07:F6E0: B9 0E F7
	STA objAnim				;C - - - - - 0x01F6F3 07:F6E3: 8D 7B 06
	LDA scratch0				;C - - - - - 0x01F6F6 07:F6E6: A5 00
	CLC							;C - - - - - 0x01F6F8 07:F6E8: 18
	ADC DATA_0FF711,Y			;C - - - - - 0x01F6F9 07:F6E9: 79 11 F7
	TAY							;C - - - - - 0x01F6FC 07:F6EC: A8
	LDA DATA_0FF714,Y			;C - - - - - 0x01F6FD 07:F6ED: B9 14 F7
	STA objAnimProgress				;C - - - - - 0x01F700 07:F6F0: 8D CB 06
	LDA #$00					;C - - - - - 0x01F703 07:F6F3: A9 00
	STA objAnimTimer				;C - - - - - 0x01F705 07:F6F5: 8D A3 06
	LDA #$02					;C - - - - - 0x01F708 07:F6F8: A9 02
	STA ram_007B				;C - - - - - 0x01F70A 07:F6FA: 85 7B
CODE_0FF6FC:
	RTS							;C - - - - - 0x01F70C 07:F6FC: 60

DATA_0FF6FD:
	.byte $00					;- - - - - - 0x01F70D 07:F6FD: 00
	.byte $02					;- D 0 - - - 0x01F70E 07:F6FE: 02
	.byte $01					;- D 0 - - - 0x01F70F 07:F6FF: 01
	.byte $01					;- D 0 - - - 0x01F710 07:F700: 01
	.byte $01					;- D 0 - - - 0x01F711 07:F701: 01
	.byte $02					;- - - - - - 0x01F712 07:F702: 02
	.byte $01					;- - - - - - 0x01F713 07:F703: 01
	.byte $02					;- D 0 - - - 0x01F714 07:F704: 02
	.byte $02					;- D 0 - - - 0x01F715 07:F705: 02
	.byte $02					;- D 0 - - - 0x01F716 07:F706: 02
	.byte $01					;- D 0 - - - 0x01F717 07:F707: 01
	.byte $01					;- D 0 - - - 0x01F718 07:F708: 01
	.byte $02					;- D 0 - - - 0x01F719 07:F709: 02
	.byte $02					;- D 0 - - - 0x01F71A 07:F70A: 02
	.byte $01					;- D 0 - - - 0x01F71B 07:F70B: 01
	.byte $02					;- D 0 - - - 0x01F71C 07:F70C: 02
	.byte $01					;- D 0 - - - 0x01F71D 07:F70D: 01

PlayerRotateAnims:
	.byte $00					;- - - - - - 0x01F71E 07:F70E: 00
	.byte anPlayerRotateL_ID					;- D 0 - - - 0x01F71F 07:F70F: 26
	.byte anPlayerRotateR_ID					;- D 0 - - - 0x01F720 07:F710: 37

DATA_0FF711:
	.byte $00					;- - - - - - 0x01F721 07:F711: 00
	.byte $09					;- D 0 - - - 0x01F722 07:F712: 09
	.byte $00					;- D 0 - - - 0x01F723 07:F713: 00
DATA_0FF714:
	.byte $00					;- - - - - - 0x01F724 07:F714: 00
	.byte $07					;- D 0 - - - 0x01F725 07:F715: 07
	.byte $00					;- D 0 - - - 0x01F726 07:F716: 00
	.byte $01					;- D 0 - - - 0x01F727 07:F717: 01
	.byte $06					;- D 0 - - - 0x01F728 07:F718: 06
	.byte $00					;- D 0 - - - 0x01F729 07:F719: 00
	.byte $02					;- D 0 - - - 0x01F72A 07:F71A: 02
	.byte $05					;- D 0 - - - 0x01F72B 07:F71B: 05
	.byte $04					;- D 0 - - - 0x01F72C 07:F71C: 04
	.byte $03					;- D 0 - - - 0x01F72D 07:F71D: 03
	.byte $01					;- D 0 - - - 0x01F72E 07:F71E: 01
	.byte $00					;- D 0 - - - 0x01F72F 07:F71F: 00
	.byte $07					;- D 0 - - - 0x01F730 07:F720: 07
	.byte $02					;- D 0 - - - 0x01F731 07:F721: 02
	.byte $00					;- D 0 - - - 0x01F732 07:F722: 00
	.byte $06					;- D 0 - - - 0x01F733 07:F723: 06
	.byte $03					;- - - - - - 0x01F734 07:F724: 03
	.byte $04					;- D 0 - - - 0x01F735 07:F725: 04
	.byte $05					;- D 0 - - - 0x01F736 07:F726: 05

CODE_0FF727:
	LDX ram_077C				;C - - - - - 0x01F737 07:F727: AE 7C 07
CODE_0FF72A:
	LDY DATA_0FF75A,X			;C - - - - - 0x01F73A 07:F72A: BC 5A F7
	LDA DATA_0FF76B,Y			;C - - - - - 0x01F73D 07:F72D: B9 6B F7
	CMP objY				;C - - - - - 0x01F740 07:F730: CD 8B 05
	BCS CODE_0FF753				;C - - - - - 0x01F743 07:F733: B0 1E

	CLC							;C - - - - - 0x01F745 07:F735: 18
	ADC #$30					;C - - - - - 0x01F746 07:F736: 69 30
	CMP objY				;C - - - - - 0x01F748 07:F738: CD 8B 05
	BCC CODE_0FF753				;C - - - - - 0x01F74B 07:F73B: 90 16

	LDA DATA_0FF76B+1,Y			;C - - - - - 0x01F74D 07:F73D: B9 6C F7
	CMP objX				;C - - - - - 0x01F750 07:F740: CD B3 05
	BCS CODE_0FF753				;C - - - - - 0x01F753 07:F743: B0 0E

	CLC							;C - - - - - 0x01F755 07:F745: 18
	ADC #$30					;C - - - - - 0x01F756 07:F746: 69 30
	CMP objX				;C - - - - - 0x01F758 07:F748: CD B3 05
	BCC CODE_0FF753				;C - - - - - 0x01F75B 07:F74B: 90 06
		STX ram_077B				;C - - - - - 0x01F75D 07:F74D: 8E 7B 07
		JMP CODE_0FF759				;C - - - - - 0x01F760 07:F750: 4C 59 F7
CODE_0FF753:
	INX							;C - - - - - 0x01F763 07:F753: E8
	CPX ram_077D				;C - - - - - 0x01F764 07:F754: EC 7D 07
	BNE CODE_0FF72A				;C - - - - - 0x01F767 07:F757: D0 D1
CODE_0FF759:
	RTS							;C - - - - - 0x01F769 07:F759: 60

DATA_0FF75A:
	.byte $00					;- - - - - - 0x01F76A 07:F75A: 00
	.byte $00					;- D 0 - - - 0x01F76B 07:F75B: 00
	.byte $02					;- D 0 - - - 0x01F76C 07:F75C: 02
	.byte $04					;- D 0 - - - 0x01F76D 07:F75D: 04
	.byte $06					;- D 0 - - - 0x01F76E 07:F75E: 06
	.byte $08					;- D 0 - - - 0x01F76F 07:F75F: 08
	.byte $0A					;- D 0 - - - 0x01F770 07:F760: 0A
	.byte $0C					;- D 0 - - - 0x01F771 07:F761: 0C
	.byte $0E					;- D 0 - - - 0x01F772 07:F762: 0E
	.byte $10					;- D 0 - - - 0x01F773 07:F763: 10
	.byte $12					;- D 0 - - - 0x01F774 07:F764: 12
	.byte $14					;- D 0 - - - 0x01F775 07:F765: 14
	.byte $16					;- D 0 - - - 0x01F776 07:F766: 16
	.byte $18					;- D 0 - - - 0x01F777 07:F767: 18
	.byte $1A					;- D 0 - - - 0x01F778 07:F768: 1A
	.byte $1C					;- D 0 - - - 0x01F779 07:F769: 1C
	.byte $1E					;- D 0 - - - 0x01F77A 07:F76A: 1E
DATA_0FF76B:
	;- D 0 - - - 0x01F77B 07:F76B: 28
	;Y, X
	.byte 40,56
	.byte 40,152
	.byte 40,104
	.byte 88,104
	.byte 40,40
	.byte 104,$18
	.byte 88,88
	.byte 136,104
	.byte 88,152
	.byte 152,184
	.byte 40,104
	.byte 104,56
	.byte 104,152
	.byte 104,40
	.byte 136,104
	.byte 104,168

CODE_0FF78B:
	LDA scratch4				;C - - - - - 0x01F79B 07:F78B: A5 04
	CMP cutsceneActorActive+2				;C - - - - - 0x01F79D 07:F78D: CD 55 07
	BNE CODE_0FF799				;C - - - - - 0x01F7A0 07:F790: D0 07
		LDA #$C0					;C - - - - - 0x01F7A2 07:F792: A9 C0
		STA hBlocked				;C - - - - - 0x01F7A4 07:F794: 85 79
		JSR CODE_0FF07A				;C - - - - - 0x01F7A6 07:F796: 20 7A F0
CODE_0FF799:
	RTS							;C - - - - - 0x01F7A9 07:F799: 60

CODE_0FF79A:
	LDA ram_007B				;C - - - - - 0x01F7AA 07:F79A: A5 7B
	CMP #$80					;C - - - - - 0x01F7AC 07:F79C: C9 80
	BCS CODE_0FF7AB				;C - - - - - 0x01F7AE 07:F79E: B0 0B
		LDA scratch4				;C - - - - - 0x01F7B0 07:F7A0: A5 04
		CMP cutsceneActorActive+2				;C - - - - - 0x01F7B2 07:F7A2: CD 55 07
		BNE CODE_0FF7AB				;C - - - - - 0x01F7B5 07:F7A5: D0 04
			LDA #$80					;C - - - - - 0x01F7B7 07:F7A7: A9 80
			STA ram_007B				;C - - - - - 0x01F7B9 07:F7A9: 85 7B
CODE_0FF7AB:
	RTS							;C - - - - - 0x01F7BB 07:F7AB: 60

CODE_0FF7AC:
	LDA roundFlags				;C - - - - - 0x01F7BC 07:F7AC: AD 71 04
	AND #RFLAG_UNK08|RFLAG_UNK10					;C - - - - - 0x01F7BF 07:F7AF: 29 18
	BNE CODE_0FF7C9				;C - - - - - 0x01F7C1 07:F7B1: D0 16

	LDA ram_007B				;C - - - - - 0x01F7C3 07:F7B3: A5 7B
	CMP #$80					;C - - - - - 0x01F7C5 07:F7B5: C9 80
	BCS CODE_0FF7C9				;C - - - - - 0x01F7C7 07:F7B7: B0 10

	LDA scratch4				;C - - - - - 0x01F7C9 07:F7B9: A5 04
	CMP solidTerrainStart2				;C - - - - - 0x01F7CB 07:F7BB: CD 4F 07
	BCC CODE_0FF7C9				;C - - - - - 0x01F7CE 07:F7BE: 90 09

	CMP solidTerrainEnd2				;C - - - - - 0x01F7D0 07:F7C0: CD 50 07
	BCS CODE_0FF7C9				;C - - - - - 0x01F7D3 07:F7C3: B0 04
		LDA #$80					;C - - - - - 0x01F7D5 07:F7C5: A9 80
		STA ram_007B				;C - - - - - 0x01F7D7 07:F7C7: 85 7B
CODE_0FF7C9:
	RTS							;C - - - - - 0x01F7D9 07:F7C9: 60

CODE_0FF7CA:
	JSR CODE_0FF7AC				;C - - - - - 0x01F7DA 07:F7CA: 20 AC F7
	LDA objY				;C - - - - - 0x01F7DD 07:F7CD: AD 8B 05
	SEC							;C - - - - - 0x01F7E0 07:F7D0: 38
	SBC #$C4					;C - - - - - 0x01F7E1 07:F7D1: E9 C4
	BCC CODE_0FF7DA				;C - - - - - 0x01F7E3 07:F7D3: 90 05
		CLC							;C - - - - - 0x01F7E5 07:F7D5: 18
		ADC #$80					;C - - - - - 0x01F7E6 07:F7D6: 69 80
		STA ram_0078				;C - - - - - 0x01F7E8 07:F7D8: 85 78
CODE_0FF7DA:
	RTS							;C - - - - - 0x01F7EA 07:F7DA: 60

CODE_0FF7DB:
	JSR CODE_0FF7AC				;C - - - - - 0x01F7EB 07:F7DB: 20 AC F7
	JSR CODE_0FF688				;C - - - - - 0x01F7EE 07:F7DE: 20 88 F6
	RTS							;C - - - - - 0x01F7F1 07:F7E1: 60

CheckWall:
	;03: ??
	;04: ??

.ifdef REGION_JP
	LDA terrainBank
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x01F7F2 07:F7E2: A9 00
	ORA #$07					;C - - - - - 0x01F7F4 07:F7E4: 09 07
	STA $8000				;C - - - - - 0x01F7F6 07:F7E6: 8D 00 80
	LDA terrainBank				;C - - - - - 0x01F7F9 07:F7E9: AD 5B 07
	STA $8001				;C - - - - - 0x01F7FC 07:F7EC: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F7FF 07:F7EF: 85 53

	LDA #$00					;C - - - - - 0x01F801 07:F7F1: A9 00
	ORA #$07					;C - - - - - 0x01F803 07:F7F3: 09 07
	STA $8000				;C - - - - - 0x01F805 07:F7F5: 8D 00 80
	LDA terrainBank				;C - - - - - 0x01F808 07:F7F8: AD 5B 07
	STA $8001				;C - - - - - 0x01F80B 07:F7FB: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F80E 07:F7FE: 85 53
.endif

	LDA scratch4				;C - - - - - 0x01F810 07:F800: A5 04
	CMP solidTerrainStart0				;C - - - - - 0x01F812 07:F802: CD 4B 07
	BCC CODE_0FF815				;C - - - - - 0x01F815 07:F805: 90 0E
		CMP solidTerrainEnd0				;C - - - - - 0x01F817 07:F807: CD 4C 07
		BCS CODE_0FF815				;C - - - - - 0x01F81A 07:F80A: B0 09
			LDA #$40					;C - - - - - 0x01F81C 07:F80C: A9 40
			ORA scratch3				;C - - - - - 0x01F81E 07:F80E: 05 03
			STA scratch4				;C - - - - - 0x01F820 07:F810: 85 04
			JMP CODE_0FF819				;C - - - - - 0x01F822 07:F812: 4C 19 F8
CODE_0FF815:
	LDA #$00					;C - - - - - 0x01F825 07:F815: A9 00
	STA scratch4				;C - - - - - 0x01F827 07:F817: 85 04
CODE_0FF819:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x01F829 07:F819: 60

CheckFloor:
.ifdef REGION_JP
	LDA terrainBank
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x01F82A 07:F81A: A9 00
	ORA #$07					;C - - - - - 0x01F82C 07:F81C: 09 07
	STA $8000				;C - - - - - 0x01F82E 07:F81E: 8D 00 80
	LDA terrainBank				;C - - - - - 0x01F831 07:F821: AD 5B 07
	STA $8001				;C - - - - - 0x01F834 07:F824: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F837 07:F827: 85 53

	LDA #$00					;C - - - - - 0x01F839 07:F829: A9 00
	ORA #$07					;C - - - - - 0x01F83B 07:F82B: 09 07
	STA $8000				;C - - - - - 0x01F83D 07:F82D: 8D 00 80
	LDA terrainBank				;C - - - - - 0x01F840 07:F830: AD 5B 07
	STA $8001				;C - - - - - 0x01F843 07:F833: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F846 07:F836: 85 53
.endif

	LDA scratch4				;C - - - - - 0x01F848 07:F838: A5 04
	CMP solidTerrainStart0				;C - - - - - 0x01F84A 07:F83A: CD 4B 07
	BCC CODE_0FF84D				;C - - - - - 0x01F84D 07:F83D: 90 0E
		CMP solidTerrainEnd0				;C - - - - - 0x01F84F 07:F83F: CD 4C 07
		BCS CODE_0FF84D				;C - - - - - 0x01F852 07:F842: B0 09
			LDA #$80					;C - - - - - 0x01F854 07:F844: A9 80
			ORA scratch3				;C - - - - - 0x01F856 07:F846: 05 03
			STA scratch4				;C - - - - - 0x01F858 07:F848: 85 04
			JMP CODE_0FF851				;C - - - - - 0x01F85A 07:F84A: 4C 51 F8
CODE_0FF84D:
	LDA #$00					;C - - - - - 0x01F85D 07:F84D: A9 00
	STA scratch4				;C - - - - - 0x01F85F 07:F84F: 85 04
CODE_0FF851:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x01F861 07:F851: 60

CODE_0FF852:
.ifdef REGION_JP
	LDA terrainBank
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x01F862 07:F852: A9 00
	ORA #$07					;C - - - - - 0x01F864 07:F854: 09 07
	STA $8000				;C - - - - - 0x01F866 07:F856: 8D 00 80
	LDA terrainBank				;C - - - - - 0x01F869 07:F859: AD 5B 07
	STA $8001				;C - - - - - 0x01F86C 07:F85C: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F86F 07:F85F: 85 53
	LDA #$00					;C - - - - - 0x01F871 07:F861: A9 00
	ORA #$07					;C - - - - - 0x01F873 07:F863: 09 07
	STA $8000				;C - - - - - 0x01F875 07:F865: 8D 00 80
	LDA terrainBank				;C - - - - - 0x01F878 07:F868: AD 5B 07
	STA $8001				;C - - - - - 0x01F87B 07:F86B: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F87E 07:F86E: 85 53
.endif

	LDA scratch4				;C - - - - - 0x01F880 07:F870: A5 04
	CMP solidTerrainStart0				;C - - - - - 0x01F882 07:F872: CD 4B 07
	BCC CODE_0FF885				;C - - - - - 0x01F885 07:F875: 90 0E
		CMP solidTerrainEnd0				;C - - - - - 0x01F887 07:F877: CD 4C 07
		BCS CODE_0FF885				;C - - - - - 0x01F88A 07:F87A: B0 09
			LDA #$80					;C - - - - - 0x01F88C 07:F87C: A9 80
			ORA scratch2				;C - - - - - 0x01F88E 07:F87E: 05 02
			STA scratch4				;C - - - - - 0x01F890 07:F880: 85 04
			JMP CODE_0FF88C				;C - - - - - 0x01F892 07:F882: 4C 8C F8
CODE_0FF885:
	LDA #$00					;C - - - - - 0x01F895 07:F885: A9 00
	STA scratch4				;C - - - - - 0x01F897 07:F887: 85 04
	JMP CODE_0FF8F2				;C - - - - - 0x01F899 07:F889: 4C F2 F8
CODE_0FF88C:
	LDA ram_075C				;C - - - - - 0x01F89C 07:F88C: AD 5C 07
	CMP #$03					;C - - - - - 0x01F89F 07:F88F: C9 03
	BCS CODE_0FF8DD				;C - - - - - 0x01F8A1 07:F891: B0 4A

	LDA ram_0046				;C - - - - - 0x01F8A3 07:F893: A5 46
	SEC							;C - - - - - 0x01F8A5 07:F895: 38
	SBC ram_0047				;C - - - - - 0x01F8A6 07:F896: E5 47
	TAY							;C - - - - - 0x01F8A8 07:F898: A8
	BCS CODE_0FF8A7				;C - - - - - 0x01F8A9 07:F899: B0 0C
		LDA irqEffect				;C - - - - - 0x01F8AB 07:F89B: A5 1D
		CMP #$05					;C - - - - - 0x01F8AD 07:F89D: C9 05
		BNE CODE_0FF8A7				;C - - - - - 0x01F8AF 07:F89F: D0 06
			LDA terrainAdr+1				;C - - - - - 0x01F8B1 07:F8A1: A5 43
			EOR #$01					;C - - - - - 0x01F8B3 07:F8A3: 49 01
			STA terrainAdr+1				;C - - - - - 0x01F8B5 07:F8A5: 85 43
CODE_0FF8A7:
	LDA (terrainAdr),Y			;C - - - - - 0x01F8B7 07:F8A7: B1 42
	STA scratch5				;C - - - - - 0x01F8B9 07:F8A9: 85 05
	STA scratch6				;C - - - - - 0x01F8BB 07:F8AB: 85 06
	LDA #$00					;C - - - - - 0x01F8BD 07:F8AD: A9 00
	STA scratch7				;C - - - - - 0x01F8BF 07:F8AF: 85 07
	ASL scratch6				;C - - - - - 0x01F8C1 07:F8B1: 06 06
	ROL scratch7				;C - - - - - 0x01F8C3 07:F8B3: 26 07
	ASL scratch6				;C - - - - - 0x01F8C5 07:F8B5: 06 06
	ROL scratch7				;C - - - - - 0x01F8C7 07:F8B7: 26 07
	LDA scratch6				;C - - - - - 0x01F8C9 07:F8B9: A5 06
	CLC							;C - - - - - 0x01F8CB 07:F8BB: 18
	ADC scratch5				;C - - - - - 0x01F8CC 07:F8BC: 65 05
	STA scratch6				;C - - - - - 0x01F8CE 07:F8BE: 85 06
	LDA scratch7				;C - - - - - 0x01F8D0 07:F8C0: A5 07
	ADC #$00					;C - - - - - 0x01F8D2 07:F8C2: 69 00
	STA scratch7				;C - - - - - 0x01F8D4 07:F8C4: 85 07
	LDA terrainTypeDefs				;C - - - - - 0x01F8D6 07:F8C6: A5 40
	CLC							;C - - - - - 0x01F8D8 07:F8C8: 18
	ADC scratch6				;C - - - - - 0x01F8D9 07:F8C9: 65 06
	STA scratch6				;C - - - - - 0x01F8DB 07:F8CB: 85 06
	LDA terrainTypeDefs+1				;C - - - - - 0x01F8DD 07:F8CD: A5 41
	ADC scratch7				;C - - - - - 0x01F8DF 07:F8CF: 65 07
	STA scratch7				;C - - - - - 0x01F8E1 07:F8D1: 85 07
	LDY ram_075C				;C - - - - - 0x01F8E3 07:F8D3: AC 5C 07
	INY							;C - - - - - 0x01F8E6 07:F8D6: C8
	INY							;C - - - - - 0x01F8E7 07:F8D7: C8
	LDA (scratch6),Y			;C - - - - - 0x01F8E8 07:F8D8: B1 06
	JMP CODE_0FF8E4				;C - - - - - 0x01F8EA 07:F8DA: 4C E4 F8
CODE_0FF8DD:
	LDY ram_075C				;C - - - - - 0x01F8ED 07:F8DD: AC 5C 07
	DEY							;C - - - - - 0x01F8F0 07:F8E0: 88
	DEY							;C - - - - - 0x01F8F1 07:F8E1: 88
	LDA (terrainTileDef),Y			;C - - - - - 0x01F8F2 07:F8E2: B1 60
CODE_0FF8E4:
	CMP solidTerrainStart0				;C - - - - - 0x01F8F4 07:F8E4: CD 4B 07
	BCC CODE_0FF8F2				;C - - - - - 0x01F8F7 07:F8E7: 90 09
		CMP solidTerrainEnd0				;C - - - - - 0x01F8F9 07:F8E9: CD 4C 07
		BCS CODE_0FF8F2				;C - - - - - 0x01F8FC 07:F8EC: B0 04
			LDA #$00					;C - - - - - 0x01F8FE 07:F8EE: A9 00
			STA scratch4				;C - - - - - 0x01F900 07:F8F0: 85 04
CODE_0FF8F2:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x01F902 07:F8F2: 60

CODE_0FF8F3:
.ifdef REGION_JP
	LDA terrainBank
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x01F903 07:F8F3: A9 00
	ORA #$07					;C - - - - - 0x01F905 07:F8F5: 09 07
	STA $8000				;C - - - - - 0x01F907 07:F8F7: 8D 00 80
	LDA terrainBank				;C - - - - - 0x01F90A 07:F8FA: AD 5B 07
	STA $8001				;C - - - - - 0x01F90D 07:F8FD: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F910 07:F900: 85 53
	LDA #$00					;C - - - - - 0x01F912 07:F902: A9 00
	ORA #$07					;C - - - - - 0x01F914 07:F904: 09 07
	STA $8000				;C - - - - - 0x01F916 07:F906: 8D 00 80
	LDA terrainBank				;C - - - - - 0x01F919 07:F909: AD 5B 07
	STA $8001				;C - - - - - 0x01F91C 07:F90C: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F91F 07:F90F: 85 53
.endif

	LDA scratch4				;C - - - - - 0x01F921 07:F911: A5 04
	CMP solidTerrainStart0				;C - - - - - 0x01F923 07:F913: CD 4B 07
	BCC CODE_0FF926				;C - - - - - 0x01F926 07:F916: 90 0E
		CMP solidTerrainEnd0				;C - - - - - 0x01F928 07:F918: CD 4C 07
		BCS CODE_0FF926				;C - - - - - 0x01F92B 07:F91B: B0 09
			LDA #$80					;C - - - - - 0x01F92D 07:F91D: A9 80
			ORA scratch2				;C - - - - - 0x01F92F 07:F91F: 05 02
			STA scratch4				;C - - - - - 0x01F931 07:F921: 85 04
			JMP CODE_0FF92D				;C - - - - - 0x01F933 07:F923: 4C 2D F9
CODE_0FF926:
	LDA #$00					;C - - - - - 0x01F936 07:F926: A9 00
	STA scratch4				;C - - - - - 0x01F938 07:F928: 85 04
	JMP CODE_0FF985				;C - - - - - 0x01F93A 07:F92A: 4C 85 F9
CODE_0FF92D:
	LDA ram_075C				;C - - - - - 0x01F93D 07:F92D: AD 5C 07
	CMP #$03					;C - - - - - 0x01F940 07:F930: C9 03
	BCC CODE_0FF970				;C - - - - - 0x01F942 07:F932: 90 3C

	LDA ram_0046				;C - - - - - 0x01F944 07:F934: A5 46
	CLC							;C - - - - - 0x01F946 07:F936: 18
	ADC ram_0047				;C - - - - - 0x01F947 07:F937: 65 47
	TAY							;C - - - - - 0x01F949 07:F939: A8
	LDA (terrainAdr),Y			;C - - - - - 0x01F94A 07:F93A: B1 42
	STA scratch5				;C - - - - - 0x01F94C 07:F93C: 85 05
	STA scratch6				;C - - - - - 0x01F94E 07:F93E: 85 06
	LDA #$00					;C - - - - - 0x01F950 07:F940: A9 00
	STA scratch7				;C - - - - - 0x01F952 07:F942: 85 07
	ASL scratch6				;C - - - - - 0x01F954 07:F944: 06 06
	ROL scratch7				;C - - - - - 0x01F956 07:F946: 26 07
	ASL scratch6				;C - - - - - 0x01F958 07:F948: 06 06
	ROL scratch7				;C - - - - - 0x01F95A 07:F94A: 26 07
	LDA scratch6				;C - - - - - 0x01F95C 07:F94C: A5 06
	CLC							;C - - - - - 0x01F95E 07:F94E: 18
	ADC scratch5				;C - - - - - 0x01F95F 07:F94F: 65 05
	STA scratch6				;C - - - - - 0x01F961 07:F951: 85 06
	LDA scratch7				;C - - - - - 0x01F963 07:F953: A5 07
	ADC #$00					;C - - - - - 0x01F965 07:F955: 69 00
	STA scratch7				;C - - - - - 0x01F967 07:F957: 85 07
	LDA terrainTypeDefs				;C - - - - - 0x01F969 07:F959: A5 40
	CLC							;C - - - - - 0x01F96B 07:F95B: 18
	ADC scratch6				;C - - - - - 0x01F96C 07:F95C: 65 06
	STA scratch6				;C - - - - - 0x01F96E 07:F95E: 85 06
	LDA terrainTypeDefs+1				;C - - - - - 0x01F970 07:F960: A5 41
	ADC scratch7				;C - - - - - 0x01F972 07:F962: 65 07
	STA scratch7				;C - - - - - 0x01F974 07:F964: 85 07
	LDY ram_075C				;C - - - - - 0x01F976 07:F966: AC 5C 07
	DEY							;C - - - - - 0x01F979 07:F969: 88
	DEY							;C - - - - - 0x01F97A 07:F96A: 88
	LDA (scratch6),Y			;C - - - - - 0x01F97B 07:F96B: B1 06
	JMP CODE_0FF977				;C - - - - - 0x01F97D 07:F96D: 4C 77 F9
CODE_0FF970:
	LDY ram_075C				;C - - - - - 0x01F980 07:F970: AC 5C 07
	INY							;C - - - - - 0x01F983 07:F973: C8
	INY							;C - - - - - 0x01F984 07:F974: C8
	LDA (terrainTileDef),Y			;C - - - - - 0x01F985 07:F975: B1 60
CODE_0FF977:
	CMP solidTerrainStart0				;C - - - - - 0x01F987 07:F977: CD 4B 07
	BCC CODE_0FF985				;C - - - - - 0x01F98A 07:F97A: 90 09
		CMP solidTerrainEnd0				;C - - - - - 0x01F98C 07:F97C: CD 4C 07
		BCS CODE_0FF985				;C - - - - - 0x01F98F 07:F97F: B0 04
			LDA #$00					;C - - - - - 0x01F991 07:F981: A9 00
			STA scratch4				;C - - - - - 0x01F993 07:F983: 85 04
CODE_0FF985:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x01F995 07:F985: 60

CODE_0FF986:
.ifdef REGION_JP
	LDA #.BANK(RoundsFlowTable)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x01F996 07:F986: A9 00
	ORA #$07					;C - - - - - 0x01F998 07:F988: 09 07
	STA $8000				;C - - - - - 0x01F99A 07:F98A: 8D 00 80
	LDA #.BANK(RoundsFlowTable)					;C - - - - - 0x01F99D 07:F98D: A9 06
	STA $8001				;C - - - - - 0x01F99F 07:F98F: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F9A2 07:F992: 85 53
	LDA #$00					;C - - - - - 0x01F9A4 07:F994: A9 00
	ORA #$07					;C - - - - - 0x01F9A6 07:F996: 09 07
	STA $8000				;C - - - - - 0x01F9A8 07:F998: 8D 00 80
	LDA #.BANK(RoundsFlowTable)					;C - - - - - 0x01F9AB 07:F99B: A9 06
	STA $8001				;C - - - - - 0x01F9AD 07:F99D: 8D 01 80
	STA prgBankB				;C - - - - - 0x01F9B0 07:F9A0: 85 53
.endif

	LDA ram_0046				;C - - - - - 0x01F9B2 07:F9A2: A5 46
	LSR							;C - - - - - 0x01F9B4 07:F9A4: 4A
	LSR							;C - - - - - 0x01F9B5 07:F9A5: 4A
	TAY							;C - - - - - 0x01F9B6 07:F9A6: A8
	LDA flowAdr				;C - - - - - 0x01F9B7 07:F9A7: AD 5D 07
	STA scratch6				;C - - - - - 0x01F9BA 07:F9AA: 85 06
	LDA flowAdr+1				;C - - - - - 0x01F9BC 07:F9AC: AD 5E 07
	STA scratch7				;C - - - - - 0x01F9BF 07:F9AF: 85 07
	LDA (scratch6),Y			;C - - - - - 0x01F9C1 07:F9B1: B1 06
	STA scratch5				;C - - - - - 0x01F9C3 07:F9B3: 85 05
	LDA ram_0046				;C - - - - - 0x01F9C5 07:F9B5: A5 46
	AND #$03					;C - - - - - 0x01F9C7 07:F9B7: 29 03
	TAY							;C - - - - - 0x01F9C9 07:F9B9: A8
	LDA DATA_0FF9CE,Y			;C - - - - - 0x01F9CA 07:F9BA: B9 CE F9
	AND scratch5				;C - - - - - 0x01F9CD 07:F9BD: 25 05
	STA scratch5				;C - - - - - 0x01F9CF 07:F9BF: 85 05
CODE_0FF9C1:
	CPY #$03					;C - - - - - 0x01F9D1 07:F9C1: C0 03
	BEQ CODE_0FF9CD				;C - - - - - 0x01F9D3 07:F9C3: F0 08
		LSR scratch5				;C - - - - - 0x01F9D5 07:F9C5: 46 05
		LSR scratch5				;C - - - - - 0x01F9D7 07:F9C7: 46 05
		INY							;C - - - - - 0x01F9D9 07:F9C9: C8
		JMP CODE_0FF9C1				;C - - - - - 0x01F9DA 07:F9CA: 4C C1 F9
CODE_0FF9CD:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x01F9DD 07:F9CD: 60

DATA_0FF9CE:
	.byte $C0					;- D 0 - - - 0x01F9DE 07:F9CE: C0
	.byte $30					;- D 0 - - - 0x01F9DF 07:F9CF: 30
	.byte $0C					;- D 0 - - - 0x01F9E0 07:F9D0: 0C
	.byte $03					;- D 0 - - - 0x01F9E1 07:F9D1: 03

CheckSolid:
	;04: 8x8 tile type
	LDA scratch4				;C - - - - - 0x01F9E2 07:F9D2: A5 04
	CMP solidTerrainStart0				;C - - - - - 0x01F9E4 07:F9D4: CD 4B 07
	BCC CODE_0FF9E3				;C - - - - - 0x01F9E7 07:F9D7: 90 0A
		CMP solidTerrainEnd0				;C - - - - - 0x01F9E9 07:F9D9: CD 4C 07
		BCS CODE_0FF9E3				;C - - - - - 0x01F9EC 07:F9DC: B0 05
			LDA #$FF					;C - - - - - 0x01F9EE 07:F9DE: A9 FF
			JMP CODE_0FF9E5				;C - - - - - 0x01F9F0 07:F9E0: 4C E5 F9
CODE_0FF9E3:
	LDA #$00					;C - - - - - 0x01F9F3 07:F9E3: A9 00
CODE_0FF9E5:
	STA scratch0				;C - - - - - 0x01F9F5 07:F9E5: 85 00
	RTS							;C - - - - - 0x01F9F7 07:F9E7: 60

CODE_0FF9E8:
	LDA ram_00CA				;C - - - - - 0x01F9F8 07:F9E8: A5 CA
	BEQ CODE_0FFA55				;C - - - - - 0x01F9FA 07:F9EA: F0 69

	LDA shooting				;C - - - - - 0x01F9FC 07:F9EC: AD 17 05
	BEQ CODE_0FFA55				;C - - - - - 0x01F9FF 07:F9EF: F0 64

.ifndef REGION_JP
	LDY shootInitialSlot				;C - - - - - 0x01FA01 07:F9F1: AC 18 05
	LDA objState+OSLOT_BUBBLE,Y				;C - - - - - 0x01FA04 07:F9F4: B9 77 05
	CMP #$80					;C - - - - - 0x01FA07 07:F9F7: C9 80
	BNE CODE_0FFA55				;C - - - - - 0x01FA09 07:F9F9: D0 5A
.endif

	LDY shootQueuedBubbles				;C - - - - - 0x01FA0B 07:F9FB: AC 16 05
	LDA DATA_0FFA56,Y			;C - - - - - 0x01FA0E 07:F9FE: B9 56 FA
	STA scratch0				;C - - - - - 0x01FA11 07:FA01: 85 00
	LDY enemyType,X				;C - - - - - 0x01FA13 07:FA03: B4 98
	LDA DATA_0FFA59,Y			;C - - - - - 0x01FA15 07:FA05: B9 59 FA
	CLC							;C - - - - - 0x01FA18 07:FA08: 18
	ADC scratch0				;C - - - - - 0x01FA19 07:FA09: 65 00
	STA collW				;C - - - - - 0x01FA1B 07:FA0B: 85 D0
	LDA DATA_0FFA7E,Y			;C - - - - - 0x01FA1D 07:FA0D: B9 7E FA
	CLC							;C - - - - - 0x01FA20 07:FA10: 18
	ADC scratch0				;C - - - - - 0x01FA21 07:FA11: 65 00
	STA collH				;C - - - - - 0x01FA23 07:FA13: 85 D1
	LDY shootInitialSlot				;C - - - - - 0x01FA25 07:FA15: AC 18 05
	LDA objX+OSLOT_BUBBLE,Y				;C - - - - - 0x01FA28 07:FA18: B9 C7 05
	SEC							;C - - - - - 0x01FA2B 07:FA1B: 38
	SBC objX+OSLOT_ENEMY,X				;C - - - - - 0x01FA2C 07:FA1C: FD BC 05
	BCS CODE_0FFA2A				;C - - - - - 0x01FA2F 07:FA1F: B0 09
		EOR #$FF					;C - - - - - 0x01FA31 07:FA21: 49 FF
		STA scratch4				;C - - - - - 0x01FA33 07:FA23: 85 04
		INC scratch4				;C - - - - - 0x01FA35 07:FA25: E6 04
		JMP CODE_0FFA2C				;C - - - - - 0x01FA37 07:FA27: 4C 2C FA
CODE_0FFA2A:
	STA scratch4				;C - - - - - 0x01FA3A 07:FA2A: 85 04
CODE_0FFA2C:
	LDA collW				;C - - - - - 0x01FA3C 07:FA2C: A5 D0
	CMP scratch4				;C - - - - - 0x01FA3E 07:FA2E: C5 04
	BCC CODE_0FFA55				;C - - - - - 0x01FA40 07:FA30: 90 23

	LDY shootInitialSlot				;C - - - - - 0x01FA42 07:FA32: AC 18 05
	LDA objY+OSLOT_BUBBLE,Y				;C - - - - - 0x01FA45 07:FA35: B9 9F 05
	SEC							;C - - - - - 0x01FA48 07:FA38: 38
	SBC objY+OSLOT_ENEMY,X				;C - - - - - 0x01FA49 07:FA39: FD 94 05
	BCS CODE_0FFA47				;C - - - - - 0x01FA4C 07:FA3C: B0 09
		EOR #$FF					;C - - - - - 0x01FA4E 07:FA3E: 49 FF
		STA scratch5				;C - - - - - 0x01FA50 07:FA40: 85 05
		INC scratch5				;C - - - - - 0x01FA52 07:FA42: E6 05
		JMP CODE_0FFA49				;C - - - - - 0x01FA54 07:FA44: 4C 49 FA
CODE_0FFA47:
	STA scratch5				;C - - - - - 0x01FA57 07:FA47: 85 05
CODE_0FFA49:
	LDA collH				;C - - - - - 0x01FA59 07:FA49: A5 D1
	CMP scratch5				;C - - - - - 0x01FA5B 07:FA4B: C5 05
	BCC CODE_0FFA55				;C - - - - - 0x01FA5D 07:FA4D: 90 06
		LDA ram_00CA				;C - - - - - 0x01FA5F 07:FA4F: A5 CA
		ORA #$80					;C - - - - - 0x01FA61 07:FA51: 09 80
		STA ram_00CA				;C - - - - - 0x01FA63 07:FA53: 85 CA
CODE_0FFA55:
	RTS							;C - - - - - 0x01FA65 07:FA55: 60

DATA_0FFA56:
	.byte $00					;- D 0 - - - 0x01FA66 07:FA56: 00
	.byte $08					;- D 0 - - - 0x01FA67 07:FA57: 08
	.byte $10					;- D 0 - - - 0x01FA68 07:FA58: 10

DATA_0FFA59:
	.byte $00					;- - - - - - 0x01FA69 07:FA59: 00
	.byte $0A					;- D 0 - - - 0x01FA6A 07:FA5A: 0A
	.byte $09					;- D 0 - - - 0x01FA6B 07:FA5B: 09
	.byte $0A					;- D 0 - - - 0x01FA6C 07:FA5C: 0A
	.byte $0B					;- D 0 - - - 0x01FA6D 07:FA5D: 0B
	.byte $08					;- D 0 - - - 0x01FA6E 07:FA5E: 08
	.byte $0A					;- D 0 - - - 0x01FA6F 07:FA5F: 0A
	.byte $0A					;- D 0 - - - 0x01FA70 07:FA60: 0A
	.byte $0A					;- D 0 - - - 0x01FA71 07:FA61: 0A
	.byte $16					;- D 0 - - - 0x01FA72 07:FA62: 16
	.byte $14					;- D 0 - - - 0x01FA73 07:FA63: 14
	.byte $12					;- D 0 - - - 0x01FA74 07:FA64: 12
	.byte $12					;- D 0 - - - 0x01FA75 07:FA65: 12
	.byte $12					;- D 0 - - - 0x01FA76 07:FA66: 12
	.byte $16					;- D 0 - - - 0x01FA77 07:FA67: 16
	.byte $12					;- D 0 - - - 0x01FA78 07:FA68: 12
	.byte $12					;- D 0 - - - 0x01FA79 07:FA69: 12
	.byte $08					;- D 0 - - - 0x01FA7A 07:FA6A: 08
	.byte $18					;- D 0 - - - 0x01FA7B 07:FA6B: 18
	.byte $1A					;- D 0 - - - 0x01FA7C 07:FA6C: 1A
	.byte $1A					;- D 0 - - - 0x01FA7D 07:FA6D: 1A
	.byte $14					;- D 0 - - - 0x01FA7E 07:FA6E: 14
	.byte $1A					;- - - - - - 0x01FA7F 07:FA6F: 1A
	.byte $0A					;- D 0 - - - 0x01FA80 07:FA70: 0A
	.byte $0A					;- D 0 - - - 0x01FA81 07:FA71: 0A
	.byte $1E					;- - - - - - 0x01FA82 07:FA72: 1E
	.byte $18					;- - - - - - 0x01FA83 07:FA73: 18
	.byte $18					;- - - - - - 0x01FA84 07:FA74: 18
	.byte $1E					;- - - - - - 0x01FA85 07:FA75: 1E
	.byte $10					;- - - - - - 0x01FA86 07:FA76: 10
	.byte $10					;- - - - - - 0x01FA87 07:FA77: 10
	.byte $10					;- - - - - - 0x01FA88 07:FA78: 10
	.byte $18					;- - - - - - 0x01FA89 07:FA79: 18
	.byte $0A					;- - - - - - 0x01FA8A 07:FA7A: 0A
	.byte $00					;- - - - - - 0x01FA8B 07:FA7B: 00
	.byte $00					;- - - - - - 0x01FA8C 07:FA7C: 00
	.byte $0A					;- D 0 - - - 0x01FA8D 07:FA7D: 0A

DATA_0FFA7E:
	.byte $00					;- - - - - - 0x01FA8E 07:FA7E: 00
	.byte $0B					;- D 0 - - - 0x01FA8F 07:FA7F: 0B
	.byte $0B					;- D 0 - - - 0x01FA90 07:FA80: 0B
	.byte $0B					;- D 0 - - - 0x01FA91 07:FA81: 0B
	.byte $0A					;- D 0 - - - 0x01FA92 07:FA82: 0A
	.byte $0E					;- D 0 - - - 0x01FA93 07:FA83: 0E
	.byte $0A					;- D 0 - - - 0x01FA94 07:FA84: 0A
	.byte $09					;- D 0 - - - 0x01FA95 07:FA85: 09
	.byte $0B					;- D 0 - - - 0x01FA96 07:FA86: 0B
	.byte $12					;- D 0 - - - 0x01FA97 07:FA87: 12
	.byte $16					;- D 0 - - - 0x01FA98 07:FA88: 16
	.byte $1E					;- D 0 - - - 0x01FA99 07:FA89: 1E
	.byte $12					;- D 0 - - - 0x01FA9A 07:FA8A: 12
	.byte $1E					;- D 0 - - - 0x01FA9B 07:FA8B: 1E
	.byte $16					;- D 0 - - - 0x01FA9C 07:FA8C: 16
	.byte $1E					;- D 0 - - - 0x01FA9D 07:FA8D: 1E
	.byte $12					;- D 0 - - - 0x01FA9E 07:FA8E: 12
	.byte $08					;- D 0 - - - 0x01FA9F 07:FA8F: 08
	.byte $10					;- D 0 - - - 0x01FAA0 07:FA90: 10
	.byte $14					;- D 0 - - - 0x01FAA1 07:FA91: 14
	.byte $14					;- D 0 - - - 0x01FAA2 07:FA92: 14
	.byte $18					;- D 0 - - - 0x01FAA3 07:FA93: 18
	.byte $14					;- - - - - - 0x01FAA4 07:FA94: 14
	.byte $0B					;- D 0 - - - 0x01FAA5 07:FA95: 0B
	.byte $10					;- D 0 - - - 0x01FAA6 07:FA96: 10
	.byte $1E					;- - - - - - 0x01FAA7 07:FA97: 1E
	.byte $1E					;- - - - - - 0x01FAA8 07:FA98: 1E
	.byte $18					;- - - - - - 0x01FAA9 07:FA99: 18
	.byte $1E					;- - - - - - 0x01FAAA 07:FA9A: 1E
	.byte $10					;- - - - - - 0x01FAAB 07:FA9B: 10
	.byte $10					;- - - - - - 0x01FAAC 07:FA9C: 10
	.byte $10					;- - - - - - 0x01FAAD 07:FA9D: 10
	.byte $1E					;- - - - - - 0x01FAAE 07:FA9E: 1E
	.byte $0B					;- - - - - - 0x01FAAF 07:FA9F: 0B
	.byte $00					;- - - - - - 0x01FAB0 07:FAA0: 00
	.byte $00					;- - - - - - 0x01FAB1 07:FAA1: 00
	.byte $09					;- D 0 - - - 0x01FAB2 07:FAA2: 09

CODE_0FFAA3:
.ifdef REGION_JP
	LDA objChrSlot+OSLOT_ENEMY,X					;- - - - - - 0x01FA13 07:FA03: BD
	STA scratch8					;- - - - - - 0x01FA16 07:FA06: 85
.endif

	LDY shootInitialSlot				;C - - - - - 0x01FAB3 07:FAA3: AC 18 05
	TXA							;C - - - - - 0x01FAB6 07:FAA6: 8A
	STA bubbleTrappedSlot,Y				;C - - - - - 0x01FAB7 07:FAA7: 99 FF 04
.ifdef REGION_JP
	LDA #$03					;- - - - - - 0x01FA1F 07:FA0F: A9
.else
	LDA #$88					;C - - - - - 0x01FABA 07:FAAA: A9 88
.endif
	STA objState+OSLOT_BUBBLE,Y				;C - - - - - 0x01FABC 07:FAAC: 99 77 05

.ifdef REGION_JP
	LDA scratch8				;- - - - - - 0x01FA24 07:FA14: A5
	STA objChrSlot+OSLOT_BUBBLE,Y					;- - - - - - 0x01FA26 07:FA16: 99
	LDA objChrBank+OSLOT_ENEMY,X					;- - - - - - 0x01FA29 07:FA19: BD
	STA objChrBank+OSLOT_BUBBLE,Y					;- - - - - - 0x01FA2C 07:FA1C: 99
	LDA enemyType,X					;- - - - - - 0x01FA2F 07:FA1F: B5
	CLC							;- - - - - - 0x01FA31 07:FA21: 18
	ADC #anSpringitBlast_ID					;- - - - - - 0x01FA32 07:FA22: 69
	STA objAnim+OSLOT_BUBBLE,Y					;- - - - - - 0x01FA34 07:FA24: 99
	LDA objY+OSLOT_ENEMY,X					;- - - - - - 0x01FA37 07:FA27: BD
	STA objY+OSLOT_BUBBLE,Y					;- - - - - - 0x01FA3A 07:FA2A: 99
	LDA objX+OSLOT_ENEMY,X					;- - - - - - 0x01FA3D 07:FA2D: BD
	STA objX+OSLOT_BUBBLE,Y					;- - - - - - 0x01FA40 07:FA30: 99
.endif

	LDA #$00					;C - - - - - 0x01FABF 07:FAAF: A9 00
	STA ram_00CA				;C - - - - - 0x01FAC1 07:FAB1: 85 CA

.ifdef REGION_JP
	STA objAnimProgress+OSLOT_BUBBLE,Y					;- - - - - - 0x01FA47 07:FA37: 99
	STA objAnimTimer+OSLOT_BUBBLE,Y						;- - - - - - 0x01FA4A 07:FA3A: 99
	STA shooting					;- - - - - - 0x01FA4D 07:FA3D: 8D
	STA shootQueuedBubbles					;- - - - - - 0x01FA50 07:FA40: 8D
.endif

	STA ram_00AC,X				;C - - - - - 0x01FAC3 07:FAB3: 95 AC
	STA enemyHits,X				;C - - - - - 0x01FAC5 07:FAB5: 9D BE 04
	RTS							;C - - - - - 0x01FAC8 07:FAB8: 60

.ifndef REGION_JP
CODE_0FFAB9:
	LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x01FAC9 07:FAB9: BD 77 05
	CMP #$88					;C - - - - - 0x01FACC 07:FABC: C9 88
	BNE CODE_0FFAEE				;C - - - - - 0x01FACE 07:FABE: D0 2E
		LDY shootInitialSlot				;C - - - - - 0x01FAD0 07:FAC0: AC 18 05
		LDA #$03					;C - - - - - 0x01FAD3 07:FAC3: A9 03
		STA objState+OSLOT_BUBBLE,Y				;C - - - - - 0x01FAD5 07:FAC5: 99 77 05
		LDX bubbleTrappedSlot,Y				;C - - - - - 0x01FAD8 07:FAC8: BE FF 04
		LDA objChrSlot+OSLOT_ENEMY,X				;C - - - - - 0x01FADB 07:FACB: BD 34 06
		STA objChrSlot+OSLOT_BUBBLE,Y				;C - - - - - 0x01FADE 07:FACE: 99 3F 06
		LDA objChrBank+OSLOT_ENEMY,X				;C - - - - - 0x01FAE1 07:FAD1: BD 5C 06
		STA objChrBank+OSLOT_BUBBLE,Y				;C - - - - - 0x01FAE4 07:FAD4: 99 67 06
		LDA enemyType,X				;C - - - - - 0x01FAE7 07:FAD7: B5 98
		CLC							;C - - - - - 0x01FAE9 07:FAD9: 18
		ADC #anSpringitBlast_ID					;C - - - - - 0x01FAEA 07:FADA: 69 5A
		STA objAnim+OSLOT_BUBBLE,Y				;C - - - - - 0x01FAEC 07:FADC: 99 8F 06
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01FAEF 07:FADF: BD 94 05
		STA objY+OSLOT_BUBBLE,Y				;C - - - - - 0x01FAF2 07:FAE2: 99 9F 05
		LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01FAF5 07:FAE5: BD BC 05
		STA objX+OSLOT_BUBBLE,Y				;C - - - - - 0x01FAF8 07:FAE8: 99 C7 05
		JMP CODE_0FFAFA				;C - - - - - 0x01FAFB 07:FAEB: 4C FA FA
CODE_0FFAEE:
	CMP #$89					;C - - - - - 0x01FAFE 07:FAEE: C9 89
	BNE CODE_0FFB0B				;C - - - - - 0x01FB00 07:FAF0: D0 19

	LDY shootInitialSlot				;C - - - - - 0x01FB02 07:FAF2: AC 18 05
	LDA #$19					;C - - - - - 0x01FB05 07:FAF5: A9 19
	STA objState+OSLOT_BUBBLE,Y				;C - - - - - 0x01FB07 07:FAF7: 99 77 05
CODE_0FFAFA:
	LDA #$00					;C - - - - - 0x01FB0A 07:FAFA: A9 00
	STA objAnimProgress+OSLOT_BUBBLE,Y				;C - - - - - 0x01FB0C 07:FAFC: 99 DF 06
	STA objAnimTimer+OSLOT_BUBBLE,Y				;C - - - - - 0x01FB0F 07:FAFF: 99 B7 06
	STA bubbleProgress,Y				;C - - - - - 0x01FB12 07:FB02: 99 D5 04
	STA shooting				;C - - - - - 0x01FB15 07:FB05: 8D 17 05
	STA shootQueuedBubbles				;C - - - - - 0x01FB18 07:FB08: 8D 16 05
CODE_0FFB0B:
	RTS							;C - - - - - 0x01FB1B 07:FB0B: 60
.endif

CODE_0FFB0C:
	LDA shooting				;C - - - - - 0x01FB1C 07:FB0C: AD 17 05
	BEQ CODE_0FFB19				;C - - - - - 0x01FB1F 07:FB0F: F0 08
		LDY shootInitialSlot				;C - - - - - 0x01FB21 07:FB11: AC 18 05
.ifdef REGION_JP
		LDA #$19					;- - - - - - 0x01FA62 07:FA52: 19
.else
		LDA #$89					;C - - - - - 0x01FB24 07:FB14: A9 89
.endif
		STA objState+OSLOT_BUBBLE,Y				;C - - - - - 0x01FB26 07:FB16: 99 77 05

.ifdef REGION_JP
		LDA #$00					;- - - - - - 0x01FA66 07:FA56: A9
		STA bubbleProgress,Y					;- - - - - - 0x01FA68 07:FA58: 99
		STA shooting					;- - - - - - 0x01FA6B 07:FA5B: 8D
		STA shootQueuedBubbles					;- - - - - - 0x01FA6E 07:FA5E: 8D
.endif
CODE_0FFB19:
	RTS							;C - - - - - 0x01FB29 07:FB19: 60

PlayerCheckEnemyCollision:
	LDA #$00					;C - - - - - 0x01FB2A 07:FB1A: A9 00
	STA scratch1				;C - - - - - 0x01FB2C 07:FB1C: 85 01
	LDA objX				;C - - - - - 0x01FB2E 07:FB1E: AD B3 05
	STA scratch2				;C - - - - - 0x01FB31 07:FB21: 85 02
	LDA objY				;C - - - - - 0x01FB33 07:FB23: AD 8B 05
	STA scratch3				;C - - - - - 0x01FB36 07:FB26: 85 03
	;01: Enemy slot
	;02: X
	;03: Y
@checkslot:
	LDX scratch1				;C - - - - - 0x01FB38 07:FB28: A6 01
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x01FB3A 07:FB2A: BD 6C 05
	BEQ @notvalid				;C - - - - - 0x01FB3D 07:FB2D: F0 38

	CMP #ENEMY_DYING					;C - - - - - 0x01FB3F 07:FB2F: C9 0B
	BEQ @notvalid				;C - - - - - 0x01FB41 07:FB31: F0 34

	CMP #$0C					;C - - - - - 0x01FB43 07:FB33: C9 0C
	BEQ @notvalid				;C - - - - - 0x01FB45 07:FB35: F0 30

	LDA ram_00C0,X				;C - - - - - 0x01FB47 07:FB37: B5 C0
	BMI @notvalid				;C - - - - - 0x01FB49 07:FB39: 30 2C

	LDY enemyType,X				;C - - - - - 0x01FB4B 07:FB3B: B4 98
	CPY #ENEMY_KIRIKABUN					;C - - - - - 0x01FB4D 07:FB3D: C0 0E
	BEQ @notvalid				;C - - - - - 0x01FB4F 07:FB3F: F0 26

	CPY #ENEMY_CARRYHELI					;C - - - - - 0x01FB51 07:FB41: C0 09
	BNE @notheli				;C - - - - - 0x01FB53 07:FB43: D0 07
		LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x01FB55 07:FB45: BD 6C 05
		CMP #$03					;C - - - - - 0x01FB58 07:FB48: C9 03
		BEQ @notvalid				;C - - - - - 0x01FB5A 07:FB4A: F0 1B
@notheli:
	LDA EnemiesMaskW,Y			;C - - - - - 0x01FB5C 07:FB4C: B9 31 FC
	STA collW				;C - - - - - 0x01FB5F 07:FB4F: 85 D0
	LDA EnemiesMaskH,Y			;C - - - - - 0x01FB61 07:FB51: B9 56 FC
	STA collH				;C - - - - - 0x01FB64 07:FB54: 85 D1
	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x01FB66 07:FB56: BD BC 05
	SEC							;C - - - - - 0x01FB69 07:FB59: 38
	SBC scratch2				;C - - - - - 0x01FB6A 07:FB5A: E5 02
	BCS @poshdist				;C - - - - - 0x01FB6C 07:FB5C: B0 0C

	EOR #$FF					;C - - - - - 0x01FB6E 07:FB5E: 49 FF
	STA scratch4				;C - - - - - 0x01FB70 07:FB60: 85 04
	INC scratch4				;C - - - - - 0x01FB72 07:FB62: E6 04
	JMP @havehdist				;C - - - - - 0x01FB74 07:FB64: 4C 6C FB
@notvalid:
	JMP @next				;C - - - - - 0x01FB77 07:FB67: 4C E3 FB
@poshdist:
	STA scratch4				;C - - - - - 0x01FB7A 07:FB6A: 85 04
@havehdist:
	LDA collW				;C - - - - - 0x01FB7C 07:FB6C: A5 D0
	CMP scratch4				;C - - - - - 0x01FB7E 07:FB6E: C5 04
	BCC @next				;C - - - - - 0x01FB80 07:FB70: 90 71

	LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x01FB82 07:FB72: BD 94 05
	SEC							;C - - - - - 0x01FB85 07:FB75: 38
	SBC scratch3				;C - - - - - 0x01FB86 07:FB76: E5 03
	BCS @posvdist				;C - - - - - 0x01FB88 07:FB78: B0 09
		EOR #$FF					;C - - - - - 0x01FB8A 07:FB7A: 49 FF
		STA scratch5				;C - - - - - 0x01FB8C 07:FB7C: 85 05
		INC scratch5				;C - - - - - 0x01FB8E 07:FB7E: E6 05
		JMP @havevdist				;C - - - - - 0x01FB90 07:FB80: 4C 85 FB
@posvdist:
	STA scratch5				;C - - - - - 0x01FB93 07:FB83: 85 05
@havevdist:
	;04: HDistance
	;05: VDistance
	LDA collH				;C - - - - - 0x01FB95 07:FB85: A5 D1
	CMP scratch5				;C - - - - - 0x01FB97 07:FB87: C5 05
	BCC @next				;C - - - - - 0x01FB99 07:FB89: 90 58

	;Collision confirmed
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x01FB9B 07:FB8B: BD 6C 05
	CMP #ENEMY_COLLECTABLE					;C - - - - - 0x01FB9E 07:FB8E: C9 0D
	BNE @notreward				;C - - - - - 0x01FBA0 07:FB90: D0 33

	;Is reward, ready to be collected
	LDA #$01					;C - - - - - 0x01FBA2 07:FB92: A9 01
	STA scoreAdditionDigits+4				;C - - - - - 0x01FBA4 07:FB94: 8D A5 04
	TXA							;C - - - - - 0x01FBA7 07:FB97: 8A
	PHA							;C - - - - - 0x01FBA8 07:FB98: 48
	JSR AddScore				;C - - - - - 0x01FBA9 07:FB99: 20 C7 FE
	PLA							;C - - - - - 0x01FBAC 07:FB9C: 68
	TAX							;C - - - - - 0x01FBAD 07:FB9D: AA

	LDA #snReward_ID					;C - - - - - 0x01FBAE 07:FB9E: A9 28
	STA a:soundTrigger				;C - - - - - 0x01FBB0 07:FBA0: 8D E1 00

	LDA enemyReward,X				;C - - - - - 0x01FBB3 07:FBA3: B5 8E
	CMP lastRewardType				;C - - - - - 0x01FBB5 07:FBA5: CD 4E 05
	BNE @streakbroken				;C - - - - - 0x01FBB8 07:FBA8: D0 06
		INC sameRewardStreak				;C - - - - - 0x01FBBA 07:FBAA: EE 48 05
		JMP @streakchecked				;C - - - - - 0x01FBBD 07:FBAD: 4C B8 FB
@streakbroken:
	STA lastRewardType				;C - - - - - 0x01FBC0 07:FBB0: 8D 4E 05
	LDA #$00					;C - - - - - 0x01FBC3 07:FBB3: A9 00
	STA sameRewardStreak				;C - - - - - 0x01FBC5 07:FBB5: 8D 48 05
@streakchecked:
	LDA #$00					;C - - - - - 0x01FBC8 07:FBB8: A9 00
	STA enemyType,X				;C - - - - - 0x01FBCA 07:FBBA: 95 98
	STA objState+OSLOT_ENEMY,X				;C - - - - - 0x01FBCC 07:FBBC: 9D 6C 05
	INC rewardsEaten				;C - - - - - 0x01FBCF 07:FBBF: EE 3F 05
	JMP @end				;C - - - - - 0x01FBD2 07:FBC2: 4C EE FB
@notreward:
	LDA enemyType,X				;C - - - - - 0x01FBD5 07:FBC5: B5 98
	CMP #ENEMY_TRASH					;C - - - - - 0x01FBD7 07:FBC7: C9 15
	BNE @nottrash				;C - - - - - 0x01FBD9 07:FBC9: D0 0F
		;Is trash can
		LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x01FBDB 07:FBCB: BD 6C 05
		CMP #$02					;C - - - - - 0x01FBDE 07:FBCE: C9 02
		BCS @end				;C - - - - - 0x01FBE0 07:FBD0: B0 1C
			LDA #$02					;C - - - - - 0x01FBE2 07:FBD2: A9 02
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x01FBE4 07:FBD4: 9D 6C 05
			JMP @end				;C - - - - - 0x01FBE7 07:FBD7: 4C EE FB
@nottrash:
	LDA enemyType,X				;C - - - - - 0x01FBEA 07:FBDA: B5 98
	ORA #DMG_ENEMY					;C - - - - - 0x01FBEC 07:FBDC: 09 80
	STA playerDmgType				;C - - - - - 0x01FBEE 07:FBDE: 85 7C
	JMP @end				;C - - - - - 0x01FBF0 07:FBE0: 4C EE FB
@next:
	INC scratch1				;C - - - - - 0x01FBF3 07:FBE3: E6 01
	LDX scratch1				;C - - - - - 0x01FBF5 07:FBE5: A6 01
	CPX #9					;C - - - - - 0x01FBF7 07:FBE7: E0 09
	BEQ @end				;C - - - - - 0x01FBF9 07:FBE9: F0 03
		JMP @checkslot				;C - - - - - 0x01FBFB 07:FBEB: 4C 28 FB
@end:
	RTS							;C - - - - - 0x01FBFE 07:FBEE: 60

PlayerCheckProjCollision:
	;X: Proj index
	;collW, collH: projectile size
	LDA playerInvFrames				;C - - - - - 0x01FBFF 07:FBEF: AD 77 04
	BNE @end				;C - - - - - 0x01FC02 07:FBF2: D0 3C

	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x01FC04 07:FBF4: BD B4 05
	SEC							;C - - - - - 0x01FC07 07:FBF7: 38
	SBC objX				;C - - - - - 0x01FC08 07:FBF8: ED B3 05
	BCS @poshdist				;C - - - - - 0x01FC0B 07:FBFB: B0 09
		EOR #$FF					;C - - - - - 0x01FC0D 07:FBFD: 49 FF
		STA scratch4				;C - - - - - 0x01FC0F 07:FBFF: 85 04
		INC scratch4				;C - - - - - 0x01FC11 07:FC01: E6 04
		JMP @havehdist				;C - - - - - 0x01FC13 07:FC03: 4C 08 FC
@poshdist:
	STA scratch4				;C - - - - - 0x01FC16 07:FC06: 85 04
@havehdist:
	LDA collW				;C - - - - - 0x01FC18 07:FC08: A5 D0
	CMP scratch4				;C - - - - - 0x01FC1A 07:FC0A: C5 04
	BCC @end				;C - - - - - 0x01FC1C 07:FC0C: 90 22

	LDA objY+OSLOT_PROJ,X				;C - - - - - 0x01FC1E 07:FC0E: BD 8C 05
	SEC							;C - - - - - 0x01FC21 07:FC11: 38
	SBC objY				;C - - - - - 0x01FC22 07:FC12: ED 8B 05
	BCS @posvdist				;C - - - - - 0x01FC25 07:FC15: B0 09
		EOR #$FF					;C - - - - - 0x01FC27 07:FC17: 49 FF
		STA scratch5				;C - - - - - 0x01FC29 07:FC19: 85 05
		INC scratch5				;C - - - - - 0x01FC2B 07:FC1B: E6 05
		JMP @havevdist				;C - - - - - 0x01FC2D 07:FC1D: 4C 22 FC
@posvdist:
	STA scratch5				;C - - - - - 0x01FC30 07:FC20: 85 05
@havevdist:
	LDA collH				;C - - - - - 0x01FC32 07:FC22: A5 D1
	CMP scratch5				;C - - - - - 0x01FC34 07:FC24: C5 05
	BCC @end				;C - - - - - 0x01FC36 07:FC26: 90 08
		LDA objState+OSLOT_PROJ,X				;C - - - - - 0x01FC38 07:FC28: BD 64 05
		ORA #PROJ_HIT					;C - - - - - 0x01FC3B 07:FC2B: 09 80
		STA objState+OSLOT_PROJ,X				;C - - - - - 0x01FC3D 07:FC2D: 9D 64 05
@end:
	RTS							;C - - - - - 0x01FC40 07:FC30: 60

EnemiesMaskW:
	.byte $00					;- D 0 - - - 0x01FC41 07:FC31: 00
	.byte $0B					;- D 0 - - - 0x01FC42 07:FC32: 0B
	.byte $0B					;- D 0 - - - 0x01FC43 07:FC33: 0B
	.byte $0B					;- D 0 - - - 0x01FC44 07:FC34: 0B
	.byte $0C					;- D 0 - - - 0x01FC45 07:FC35: 0C
	.byte $0B					;- D 0 - - - 0x01FC46 07:FC36: 0B
	.byte $0B					;- D 0 - - - 0x01FC47 07:FC37: 0B
	.byte $0B					;- D 0 - - - 0x01FC48 07:FC38: 0B
	.byte $0B					;- D 0 - - - 0x01FC49 07:FC39: 0B
	.byte $15					;- D 0 - - - 0x01FC4A 07:FC3A: 15
	.byte $13					;- D 0 - - - 0x01FC4B 07:FC3B: 13
	.byte $11					;- D 0 - - - 0x01FC4C 07:FC3C: 11
	.byte $11					;- D 0 - - - 0x01FC4D 07:FC3D: 11
	.byte $11					;- D 0 - - - 0x01FC4E 07:FC3E: 11
	.byte $15					;- - - - - - 0x01FC4F 07:FC3F: 15
	.byte $11					;- D 0 - - - 0x01FC50 07:FC40: 11
	.byte $11					;- D 0 - - - 0x01FC51 07:FC41: 11
	.byte $08					;- D 0 - - - 0x01FC52 07:FC42: 08
	.byte $17					;- D 0 - - - 0x01FC53 07:FC43: 17
	.byte $15					;- D 0 - - - 0x01FC54 07:FC44: 15
	.byte $15					;- D 0 - - - 0x01FC55 07:FC45: 15
	.byte $13					;- D 0 - - - 0x01FC56 07:FC46: 13
	.byte $15					;- D 0 - - - 0x01FC57 07:FC47: 15
	.byte $0B					;- D 0 - - - 0x01FC58 07:FC48: 0B
	.byte $0B					;- D 0 - - - 0x01FC59 07:FC49: 0B
	.byte $1E					;- D 0 - - - 0x01FC5A 07:FC4A: 1E
	.byte $1E					;- D 0 - - - 0x01FC5B 07:FC4B: 1E
	.byte $18					;- D 0 - - - 0x01FC5C 07:FC4C: 18
	.byte $1E					;- D 0 - - - 0x01FC5D 07:FC4D: 1E
	.byte $10					;- D 0 - - - 0x01FC5E 07:FC4E: 10
	.byte $10					;- D 0 - - - 0x01FC5F 07:FC4F: 10
	.byte $10					;- D 0 - - - 0x01FC60 07:FC50: 10
	.byte $18					;- D 0 - - - 0x01FC61 07:FC51: 18
	.byte $0B					;- D 0 - - - 0x01FC62 07:FC52: 0B
	.byte $0B					;- D 0 - - - 0x01FC63 07:FC53: 0B
	.byte $00					;- - - - - - 0x01FC64 07:FC54: 00
	.byte $0B					;- D 0 - - - 0x01FC65 07:FC55: 0B
EnemiesMaskH:
	.byte $00					;- D 0 - - - 0x01FC66 07:FC56: 00
	.byte $0D					;- D 0 - - - 0x01FC67 07:FC57: 0D
	.byte $0D					;- D 0 - - - 0x01FC68 07:FC58: 0D
	.byte $0D					;- D 0 - - - 0x01FC69 07:FC59: 0D
	.byte $0C					;- D 0 - - - 0x01FC6A 07:FC5A: 0C
	.byte $10					;- D 0 - - - 0x01FC6B 07:FC5B: 10
	.byte $0C					;- D 0 - - - 0x01FC6C 07:FC5C: 0C
	.byte $0B					;- D 0 - - - 0x01FC6D 07:FC5D: 0B
	.byte $0D					;- D 0 - - - 0x01FC6E 07:FC5E: 0D
	.byte $12					;- D 0 - - - 0x01FC6F 07:FC5F: 12
	.byte $16					;- D 0 - - - 0x01FC70 07:FC60: 16
	.byte $1E					;- D 0 - - - 0x01FC71 07:FC61: 1E
	.byte $12					;- D 0 - - - 0x01FC72 07:FC62: 12
	.byte $1E					;- D 0 - - - 0x01FC73 07:FC63: 1E
	.byte $16					;- - - - - - 0x01FC74 07:FC64: 16
	.byte $1E					;- D 0 - - - 0x01FC75 07:FC65: 1E
	.byte $12					;- D 0 - - - 0x01FC76 07:FC66: 12
	.byte $08					;- D 0 - - - 0x01FC77 07:FC67: 08
	.byte $14					;- D 0 - - - 0x01FC78 07:FC68: 14
	.byte $1A					;- D 0 - - - 0x01FC79 07:FC69: 1A
	.byte $1C					;- D 0 - - - 0x01FC7A 07:FC6A: 1C
	.byte $18					;- D 0 - - - 0x01FC7B 07:FC6B: 18
	.byte $14					;- D 0 - - - 0x01FC7C 07:FC6C: 14
	.byte $0D					;- D 0 - - - 0x01FC7D 07:FC6D: 0D
	.byte $10					;- D 0 - - - 0x01FC7E 07:FC6E: 10
	.byte $1A					;- D 0 - - - 0x01FC7F 07:FC6F: 1A
	.byte $1E					;- D 0 - - - 0x01FC80 07:FC70: 1E
	.byte $18					;- D 0 - - - 0x01FC81 07:FC71: 18
	.byte $1E					;- D 0 - - - 0x01FC82 07:FC72: 1E
	.byte $10					;- D 0 - - - 0x01FC83 07:FC73: 10
	.byte $10					;- D 0 - - - 0x01FC84 07:FC74: 10
	.byte $10					;- D 0 - - - 0x01FC85 07:FC75: 10
	.byte $1E					;- D 0 - - - 0x01FC86 07:FC76: 1E
	.byte $0D					;- D 0 - - - 0x01FC87 07:FC77: 0D
	.byte $0D					;- D 0 - - - 0x01FC88 07:FC78: 0D
	.byte $00					;- - - - - - 0x01FC89 07:FC79: 00
	.byte $0B					;- D 0 - - - 0x01FC8A 07:FC7A: 0B

PopBubble:
	;X: Bubble slot
	LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x01FC8B 07:FC7B: BD 77 05
	CMP #BUBBLE_ENEMY					;C - - - - - 0x01FC8E 07:FC7E: C9 03
	BEQ @enemy				;C - - - - - 0x01FC90 07:FC80: F0 04

	CMP #BUBBLE_ENEMY_EXPIRING					;C - - - - - 0x01FC92 07:FC82: C9 04
	BNE @pop				;C - - - - - 0x01FC94 07:FC84: D0 3F
@enemy:
	LDA #snEnemyPop_ID					;C - - - - - 0x01FC96 07:FC86: A9 27
	STA a:soundTrigger				;C - - - - - 0x01FC98 07:FC88: 8D E1 00

	LDY bubbleTrappedSlot,X				;C - - - - - 0x01FC9B 07:FC8B: BC FF 04
	LDA #ENEMY_DYING					;C - - - - - 0x01FC9E 07:FC8E: A9 0B
	STA objState+OSLOT_ENEMY,Y				;C - - - - - 0x01FCA0 07:FC90: 99 6C 05

	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01FCA3 07:FC93: BD 9F 05
	STA objY+OSLOT_ENEMY,Y				;C - - - - - 0x01FCA6 07:FC96: 99 94 05
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01FCA9 07:FC99: BD C7 05
	STA objX+OSLOT_ENEMY,Y				;C - - - - - 0x01FCAC 07:FC9C: 99 BC 05

	LDA #$00					;C - - - - - 0x01FCAF 07:FC9F: A9 00
	STA bubbleTrappedSlot,X				;C - - - - - 0x01FCB1 07:FCA1: 9D FF 04
	LDA #$33					;C - - - - - 0x01FCB4 07:FCA4: A9 33
	STA ram_04AF,Y				;C - - - - - 0x01FCB6 07:FCA6: 99 AF 04

	LDX enemyType,Y				;C - - - - - 0x01FCB9 07:FCA9: B6 98
	LDA EnemyDeathAnims,X			;C - - - - - 0x01FCBB 07:FCAB: BD CD FC
	STA objAnim+OSLOT_ENEMY,Y				;C - - - - - 0x01FCBE 07:FCAE: 99 84 06
	LDA #.HIBYTE(anZenChanDie_ID)					;C - - - - - 0x01FCC1 07:FCB1: A9 00
	STA objAnimHI+OSLOT_ENEMY,Y				;C - - - - - 0x01FCC3 07:FCB3: 99 24 07

	TYA							;C - - - - - 0x01FCC6 07:FCB6: 98
	TAX							;C - - - - - 0x01FCC7 07:FCB7: AA
	LDA #$00					;C - - - - - 0x01FCC8 07:FCB8: A9 00
	STA objAnimProgress+OSLOT_ENEMY,X				;C - - - - - 0x01FCCA 07:FCBA: 9D D4 06
	STA objAnimTimer+OSLOT_ENEMY,X				;C - - - - - 0x01FCCD 07:FCBD: 9D AC 06
	STA ram_00AC,X				;C - - - - - 0x01FCD0 07:FCC0: 95 AC
	INC ram_051A				;C - - - - - 0x01FCD2 07:FCC2: EE 1A 05
@pop:
	LDX scratch1				;C - - - - - 0x01FCD5 07:FCC5: A6 01
	LDA #BUBBLE_POPPING					;C - - - - - 0x01FCD7 07:FCC7: A9 22
	STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x01FCD9 07:FCC9: 9D 77 05
	RTS							;C - - - - - 0x01FCDC 07:FCCC: 60

EnemyDeathAnims:
	.byte $00						;- - - - - - 0x01FCDD 07:FCCD: 00
	.byte anZenChanDie_ID			;- D 0 - - - 0x01FCDE 07:FCCE: 9F
	.byte anBanebouDie_ID			;- D 0 - - - 0x01FCDF 07:FCCF: A2
	.byte anBlobbyDie_ID			;- D 0 - - - 0x01FCE0 07:FCD0: A3
	.byte anPulpulDie_ID			;- D 0 - - - 0x01FCE1 07:FCD1: A4
	.byte anNeedlerDie_ID			;- D 0 - - - 0x01FCE2 07:FCD2: A1
	.byte anInvaderDie_ID			;- D 0 - - - 0x01FCE3 07:FCD3: A5
	.byte anMonstaDie_ID			;- D 0 - - - 0x01FCE4 07:FCD4: A0
	.byte anHeitaiKunDie_ID			;- D 0 - - - 0x01FCE5 07:FCD5: A6
	.byte anZenChanDie_ID			;- - - - - - 0x01FCE6 07:FCD6: 9F
	.byte anBanebouDie_ID			;- - - - - - 0x01FCE7 07:FCD7: A2
	.byte anBlobbyDie_ID			;- - - - - - 0x01FCE8 07:FCD8: A3
	.byte anPulpulDie_ID			;- - - - - - 0x01FCE9 07:FCD9: A4
	.byte anNeedlerDie_ID			;- - - - - - 0x01FCEA 07:FCDA: A1
	.byte anInvaderDie_ID			;- - - - - - 0x01FCEB 07:FCDB: A5
	.byte anMonstaDie_ID			;- - - - - - 0x01FCEC 07:FCDC: A0
	.byte anDrunkDie_ID				;- D 0 - - - 0x01FCED 07:FCDD: AE
	.byte anFlutterflyDie_ID		;- D 0 - - - 0x01FCEE 07:FCDE: AC
	.byte anDOHDie_ID				;- D 0 - - - 0x01FCEF 07:FCDF: 9B
	.byte $00					;- - - - - - 0x01FCF0 07:FCE0: 00
	.byte $00					;- - - - - - 0x01FCF1 07:FCE1: 00
	.byte $00					;- - - - - - 0x01FCF2 07:FCE2: 00
	.byte $00					;- - - - - - 0x01FCF3 07:FCE3: 00
	.byte anChuckerDie_ID					;- D 0 - - - 0x01FCF4 07:FCE4: D7
	.byte anRounderDie_ID					;- D 0 - - - 0x01FCF5 07:FCE5: E3
	.byte $00					;- - - - - - 0x01FCF6 07:FCE6: 00
	.byte $00					;- - - - - - 0x01FCF7 07:FCE7: 00
	.byte $00					;- - - - - - 0x01FCF8 07:FCE8: 00
	.byte $00					;- - - - - - 0x01FCF9 07:FCE9: 00
	.byte $00					;- - - - - - 0x01FCFA 07:FCEA: 00
	.byte $00					;- - - - - - 0x01FCFB 07:FCEB: 00
	.byte $00					;- - - - - - 0x01FCFC 07:FCEC: 00
	.byte $00					;- - - - - - 0x01FCFD 07:FCED: 00
	.byte $00					;- - - - - - 0x01FCFE 07:FCEE: 00
	.byte $00					;- - - - - - 0x01FCFF 07:FCEF: 00
	.byte $00					;- - - - - - 0x01FD00 07:FCF0: 00
	.byte anMonstaDie_ID					;- - - - - - 0x01FD01 07:FCF1: A0
	.byte anPlayerNeedlerL_ID					;- - - - - - 0x01FD02 07:FCF2: FA
	.byte anPlayerJumpR_ID					;- - - - - - 0x01FD03 07:FCF3: 06
	.byte anUNK0C_ID					;- - - - - - 0x01FD04 07:FCF4: 0C
	.byte anFinalSkullL_ID					;- - - - - - 0x01FD05 07:FCF5: F4

CODE_0FFCF6:
	LDA ram_0776				;C - - - - - 0x01FD06 07:FCF6: AD 76 07
	STA scratch4				;C - - - - - 0x01FD09 07:FCF9: 85 04
CODE_0FFCFB:
	TAY							;C - - - - - 0x01FD0B 07:FCFB: A8
	LDA DATA_0FFD61,Y			;C - - - - - 0x01FD0C 07:FCFC: B9 61 FD
	CMP scratch1				;C - - - - - 0x01FD0F 07:FCFF: C5 01
	BCS CODE_0FFD57				;C - - - - - 0x01FD11 07:FD01: B0 54

	LDA DATA_0FFD69,Y			;C - - - - - 0x01FD13 07:FD03: B9 69 FD
	CMP scratch1				;C - - - - - 0x01FD16 07:FD06: C5 01
	BCC CODE_0FFD57				;C - - - - - 0x01FD18 07:FD08: 90 4D

	TYA							;C - - - - - 0x01FD1A 07:FD0A: 98
	SEC							;C - - - - - 0x01FD1B 07:FD0B: 38
	SBC ram_0776				;C - - - - - 0x01FD1C 07:FD0C: ED 76 07
	TAY							;C - - - - - 0x01FD1F 07:FD0F: A8
	LDA ram_076D,Y				;C - - - - - 0x01FD20 07:FD10: B9 6D 07
	TAY							;C - - - - - 0x01FD23 07:FD13: A8
	LDA DATA_0FFD71,Y			;C - - - - - 0x01FD24 07:FD14: B9 71 FD
	CMP scratch0				;C - - - - - 0x01FD27 07:FD17: C5 00
	BEQ CODE_0FFD39				;C - - - - - 0x01FD29 07:FD19: F0 1E
	BCS CODE_0FFD60				;C - - - - - 0x01FD2B 07:FD1B: B0 43

	LDA DATA_0FFD71+1,Y			;C - - - - - 0x01FD2D 07:FD1D: B9 72 FD
	CLC							;C - - - - - 0x01FD30 07:FD20: 18
	ADC #$02					;C - - - - - 0x01FD31 07:FD21: 69 02
	CMP scratch0				;C - - - - - 0x01FD33 07:FD23: C5 00
	BCS CODE_0FFD39				;C - - - - - 0x01FD35 07:FD25: B0 12
		LDA scratch5				;C - - - - - 0x01FD37 07:FD27: A5 05
		BNE CODE_0FFD60				;C - - - - - 0x01FD39 07:FD29: D0 35

		LDA DATA_0FFD71+2,Y			;C - - - - - 0x01FD3B 07:FD2B: B9 73 FD
		CMP scratch0				;C - - - - - 0x01FD3E 07:FD2E: C5 00
		BCC CODE_0FFD57				;C - - - - - 0x01FD40 07:FD30: 90 25

		LDA #$80					;C - - - - - 0x01FD42 07:FD32: A9 80
		STA ram_007B				;C - - - - - 0x01FD44 07:FD34: 85 7B
		JMP CODE_0FFD60				;C - - - - - 0x01FD46 07:FD36: 4C 60 FD
CODE_0FFD39:
	LDA scratch5				;C - - - - - 0x01FD49 07:FD39: A5 05
	BNE CODE_0FFD4A				;C - - - - - 0x01FD4B 07:FD3B: D0 0D
		LDA scratch0				;C - - - - - 0x01FD4D 07:FD3D: A5 00
		SEC							;C - - - - - 0x01FD4F 07:FD3F: 38
		SBC DATA_0FFD71,Y			;C - - - - - 0x01FD50 07:FD40: F9 71 FD
		ORA #$80					;C - - - - - 0x01FD53 07:FD43: 09 80
		STA ram_0078				;C - - - - - 0x01FD55 07:FD45: 85 78
		JMP CODE_0FFD60				;C - - - - - 0x01FD57 07:FD47: 4C 60 FD
CODE_0FFD4A:
	LDA DATA_0FFD71,Y			;C - - - - - 0x01FD5A 07:FD4A: B9 71 FD
	SEC							;C - - - - - 0x01FD5D 07:FD4D: 38
	SBC scratch0				;C - - - - - 0x01FD5E 07:FD4E: E5 00
	ORA #$C0					;C - - - - - 0x01FD60 07:FD50: 09 C0
	STA ram_00CD				;C - - - - - 0x01FD62 07:FD52: 85 CD
	JMP CODE_0FFD60				;C - - - - - 0x01FD64 07:FD54: 4C 60 FD
CODE_0FFD57:
	INC scratch4				;C - - - - - 0x01FD67 07:FD57: E6 04
	LDA scratch4				;C - - - - - 0x01FD69 07:FD59: A5 04
	CMP ram_0777				;C - - - - - 0x01FD6B 07:FD5B: CD 77 07
	BCC CODE_0FFCFB				;C - - - - - 0x01FD6E 07:FD5E: 90 9B
CODE_0FFD60:
	RTS							;C - - - - - 0x01FD70 07:FD60: 60

DATA_0FFD61:
	.byte $28					;- D 0 - - - 0x01FD71 07:FD61: 28
	.byte $68					;- D 0 - - - 0x01FD72 07:FD62: 68
	.byte $B8					;- D 0 - - - 0x01FD73 07:FD63: B8
	.byte $50					;- D 0 - - - 0x01FD74 07:FD64: 50
	.byte $18					;- D 0 - - - 0x01FD75 07:FD65: 18
	.byte $50					;- D 0 - - - 0x01FD76 07:FD66: 50
	.byte $90					;- D 0 - - - 0x01FD77 07:FD67: 90
	.byte $D0					;- D 0 - - - 0x01FD78 07:FD68: D0

DATA_0FFD69:
	.byte $48					;- D 0 - - - 0x01FD79 07:FD69: 48
	.byte $98					;- D 0 - - - 0x01FD7A 07:FD6A: 98
	.byte $D8					;- D 0 - - - 0x01FD7B 07:FD6B: D8
	.byte $B0					;- D 0 - - - 0x01FD7C 07:FD6C: B0
	.byte $30					;- D 0 - - - 0x01FD7D 07:FD6D: 30
	.byte $70					;- D 0 - - - 0x01FD7E 07:FD6E: 70
	.byte $B0					;- D 0 - - - 0x01FD7F 07:FD6F: B0
	.byte $E8					;- D 0 - - - 0x01FD80 07:FD70: E8

DATA_0FFD71:
	.byte $30					;- D 0 - - - 0x01FD81 07:FD71: 30
	.byte $38					;- D 0 - - - 0x01FD82 07:FD72: 38
	.byte $40					;- D 0 - - - 0x01FD83 07:FD73: 40

	.byte $48					;- D 0 - - - 0x01FD84 07:FD74: 48
	.byte $50					;- D 0 - - - 0x01FD85 07:FD75: 50
	.byte $58					;- D 0 - - - 0x01FD86 07:FD76: 58

	.byte $60					;- D 0 - - - 0x01FD87 07:FD77: 60
	.byte $68					;- D 0 - - - 0x01FD88 07:FD78: 68
	.byte $70					;- D 0 - - - 0x01FD89 07:FD79: 70

	.byte $78					;- D 0 - - - 0x01FD8A 07:FD7A: 78
	.byte $80					;- D 0 - - - 0x01FD8B 07:FD7B: 80
	.byte $88					;- D 0 - - - 0x01FD8C 07:FD7C: 88

	.byte $90					;- D 0 - - - 0x01FD8D 07:FD7D: 90
	.byte $98					;- D 0 - - - 0x01FD8E 07:FD7E: 98
	.byte $A0					;- D 0 - - - 0x01FD8F 07:FD7F: A0

	.byte $A8					;- D 0 - - - 0x01FD90 07:FD80: A8
	.byte $B0					;- D 0 - - - 0x01FD91 07:FD81: B0
	.byte $B8					;- D 0 - - - 0x01FD92 07:FD82: B8

	.byte $C0					;- - - - - - 0x01FD93 07:FD83: C0
	.byte $C8					;- - - - - - 0x01FD94 07:FD84: C8
	.byte $D0					;- - - - - - 0x01FD95 07:FD85: D0

	.byte $D8					;- - - - - - 0x01FD96 07:FD86: D8
	.byte $E0					;- - - - - - 0x01FD97 07:FD87: E0
	.byte $E8					;- - - - - - 0x01FD98 07:FD88: E8

CODE_0FFD89:
	LDA currentRound				;C - - - - - 0x01FD99 07:FD89: A5 D8
	CMP #20					;C - - - - - 0x01FD9B 07:FD8B: C9 14
	BEQ CODE_0FFD92				;C - - - - - 0x01FD9D 07:FD8D: F0 03
		JMP CODE_0FFE6B				;C - - - - - 0x01FD9F 07:FD8F: 4C 6B FE
CODE_0FFD92:
	LDA wideScrollDir				;C - - - - - 0x01FDA2 07:FD92: A5 31
	BNE CODE_0FFD99				;C - - - - - 0x01FDA4 07:FD94: D0 03
		JMP CODE_0FFE6B				;C - - - - - 0x01FDA6 07:FD96: 4C 6B FE
CODE_0FFD99:
	LDX #$12					;C - - - - - 0x01FDA9 07:FD99: A2 12
CODE_0FFD9B:
	CPX #$13					;C - - - - - 0x01FDAB 07:FD9B: E0 13
	BNE CODE_0FFDA1				;C - - - - - 0x01FDAD 07:FD9D: D0 02
		LDX #$01					;C - - - - - 0x01FDAF 07:FD9F: A2 01
CODE_0FFDA1:
	LDA #$00					;C - - - - - 0x01FDB1 07:FDA1: A9 00
	STA scratch0				;C - - - - - 0x01FDB3 07:FDA3: 85 00
	LDA objState,X				;C - - - - - 0x01FDB5 07:FDA5: BD 63 05
	BEQ CODE_0FFDEE				;C - - - - - 0x01FDB8 07:FDA8: F0 44

	LDA wideScrollDir				;C - - - - - 0x01FDBA 07:FDAA: A5 31
	CMP #$01					;C - - - - - 0x01FDBC 07:FDAC: C9 01
	BNE CODE_0FFDB9				;C - - - - - 0x01FDBE 07:FDAE: D0 09
		LDA objX,X				;C - - - - - 0x01FDC0 07:FDB0: BD B3 05
		CLC							;C - - - - - 0x01FDC3 07:FDB3: 18
		ADC #$04					;C - - - - - 0x01FDC4 07:FDB4: 69 04
		JMP CODE_0FFDBF				;C - - - - - 0x01FDC6 07:FDB6: 4C BF FD
CODE_0FFDB9:
	LDA objX,X				;C - - - - - 0x01FDC9 07:FDB9: BD B3 05
	SEC							;C - - - - - 0x01FDCC 07:FDBC: 38
	SBC #$04					;C - - - - - 0x01FDCD 07:FDBD: E9 04
CODE_0FFDBF:
	STA objX,X				;C - - - - - 0x01FDCF 07:FDBF: 9D B3 05
	CMP #$08					;C - - - - - 0x01FDD2 07:FDC2: C9 08
	BCC CODE_0FFDCA				;C - - - - - 0x01FDD4 07:FDC4: 90 04
	CMP #$F8					;C - - - - - 0x01FDD6 07:FDC6: C9 F8
	BCC CODE_0FFDEE				;C - - - - - 0x01FDD8 07:FDC8: 90 24
CODE_0FFDCA:
	LDA #$01					;C - - - - - 0x01FDDA 07:FDCA: A9 01
	STA scratch0				;C - - - - - 0x01FDDC 07:FDCC: 85 00
	CPX #$01					;C - - - - - 0x01FDDE 07:FDCE: E0 01
	BNE CODE_0FFDD9				;C - - - - - 0x01FDE0 07:FDD0: D0 07
		;Unreached
		LDA #$FF					;- - - - - - 0x01FDE2 07:FDD2: A9
		STA projParent				;- - - - - - 0x01FDE4 07:FDD4: 8D
		BNE CODE_0FFDE4				;- - - - - - 0x01FDE7 07:FDD7: D0
CODE_0FFDD9:
	CPX #$14					;C - - - - - 0x01FDE9 07:FDD9: E0 14
	BCC CODE_0FFDEE				;C - - - - - 0x01FDEB 07:FDDB: 90 11
		;Unreached
		LDA objState,X				;- - - - - - 0x01FDED 07:FDDD: BD
		CMP #$80					;- - - - - - 0x01FDF0 07:FDE0: C9
		BEQ CODE_0FFE4C				;- - - - - - 0x01FDF2 07:FDE2: F0
CODE_0FFDE4:
	;Unreached
	LDA #$00					;- - - - - - 0x01FDF4 07:FDE4: A9
	STA objState,X				;- - - - - - 0x01FDF6 07:FDE6: 9D
	STA objAnimHI,X				;- - - - - - 0x01FDF9 07:FDE9: 9D
	BEQ CODE_0FFE4C				;- - - - - - 0x01FDFC 07:FDEC: F0
CODE_0FFDEE:
	CPX #$12					;C - - - - - 0x01FDFE 07:FDEE: E0 12
	BNE CODE_0FFE4C				;C - - - - - 0x01FE00 07:FDF0: D0 5A

	LDA objState+OSLOT_ENEMY				;C - - - - - 0x01FE02 07:FDF2: AD 6C 05
	BNE CODE_0FFE43				;C - - - - - 0x01FE05 07:FDF5: D0 4C

	LDA ram_054D				;C - - - - - 0x01FE07 07:FDF7: AD 4D 05
	BEQ CODE_0FFE4C				;C - - - - - 0x01FE0A 07:FDFA: F0 50

	LDA wideHScroll				;C - - - - - 0x01FE0C 07:FDFC: AD 61 07
	SEC							;C - - - - - 0x01FE0F 07:FDFF: 38
	SBC ram_00BD				;C - - - - - 0x01FE10 07:FE00: E5 BD
	BCS CODE_0FFE09				;C - - - - - 0x01FE12 07:FE02: B0 05
		EOR #$FF					;C - - - - - 0x01FE14 07:FE04: 49 FF
		CLC							;C - - - - - 0x01FE16 07:FE06: 18
		ADC #$01					;C - - - - - 0x01FE17 07:FE07: 69 01
CODE_0FFE09:
	CMP #$78					;C - - - - - 0x01FE19 07:FE09: C9 78
	BCS DATA_0FFE2E				;C - - - - - 0x01FE1B 07:FE0B: B0 21
		LDA #$01					;C - - - - - 0x01FE1D 07:FE0D: A9 01
		STA ram_054D				;C - - - - - 0x01FE1F 07:FE0F: 8D 4D 05
		LDA objState+OSLOT_ENEMY+9				;C - - - - - 0x01FE22 07:FE12: AD 75 05
		SEC							;C - - - - - 0x01FE25 07:FE15: 38
		SBC #$05					;C - - - - - 0x01FE26 07:FE16: E9 05
		TAY							;C - - - - - 0x01FE28 07:FE18: A8
		LDA DATA_0FFE6C,Y			;C - - - - - 0x01FE29 07:FE19: B9 6C FE
		STA objAnim+OSLOT_ENEMY+9				;C - - - - - 0x01FE2C 07:FE1C: 8D 8D 06
		LDA #.HIBYTE(anBigPudding_ID)					;C - - - - - 0x01FE2F 07:FE1F: A9 01
		STA objAnimHI+OSLOT_ENEMY+9				;C - - - - - 0x01FE31 07:FE21: 8D 2D 07
		LDA #$00					;C - - - - - 0x01FE34 07:FE24: A9 00
		STA objAnimProgress+OSLOT_ENEMY+9				;C - - - - - 0x01FE36 07:FE26: 8D DD 06
		STA objAnimTimer+OSLOT_ENEMY+9				;C - - - - - 0x01FE39 07:FE29: 8D B5 06
		BEQ CODE_0FFE4C				;C - - - - - 0x01FE3C 07:FE2C: F0 1E
DATA_0FFE2E:
	;Unreached
	LDA #$00					;- - - - - - 0x01FE3E 07:FE2E: A9
	STA objAnim+OSLOT_ENEMY+9				;- - - - - - 0x01FE40 07:FE30: 8D
	STA objAnimHI+OSLOT_ENEMY+9				;- - - - - - 0x01FE43 07:FE33: 8D
	STA objAnimProgress+OSLOT_ENEMY+9				;- - - - - - 0x01FE46 07:FE36: 8D
	STA objAnimTimer+OSLOT_ENEMY+9				;- - - - - - 0x01FE49 07:FE39: 8D
	LDA #$02					;- - - - - - 0x01FE4C 07:FE3C: A9
	STA scratch0				;- - - - - - 0x01FE4E 07:FE3E: 85
	STA ram_054D				;- - - - - - 0x01FE50 07:FE40: 8D
CODE_0FFE43:
	LDA scratch0				;C - - - - - 0x01FE53 07:FE43: A5 00
	BEQ CODE_0FFE4C				;C - - - - - 0x01FE55 07:FE45: F0 05
		LDA #$00					;C - - - - - 0x01FE57 07:FE47: A9 00
		STA objY,X				;C - - - - - 0x01FE59 07:FE49: 9D 8B 05
CODE_0FFE4C:
	CPX #$01					;C - - - - - 0x01FE5C 07:FE4C: E0 01
	BNE CODE_0FFE52				;C - - - - - 0x01FE5E 07:FE4E: D0 02
		LDX #$13					;C - - - - - 0x01FE60 07:FE50: A2 13
CODE_0FFE52:
	INX							;C - - - - - 0x01FE62 07:FE52: E8
	CPX #$28					;C - - - - - 0x01FE63 07:FE53: E0 28
	BCS CODE_0FFE5A				;C - - - - - 0x01FE65 07:FE55: B0 03
		JMP CODE_0FFD9B				;C - - - - - 0x01FE67 07:FE57: 4C 9B FD
CODE_0FFE5A:
	LDA objState+OSLOT_ENEMY				;C - - - - - 0x01FE6A 07:FE5A: AD 6C 05
	BEQ CODE_0FFE6B				;C - - - - - 0x01FE6D 07:FE5D: F0 0C
		LDA wideHScroll				;C - - - - - 0x01FE6F 07:FE5F: AD 61 07
		CMP #$40					;C - - - - - 0x01FE72 07:FE62: C9 40
		BCS CODE_0FFE6B				;C - - - - - 0x01FE74 07:FE64: B0 05
			LDA #$A0					;C - - - - - 0x01FE76 07:FE66: A9 A0
			STA objY+OSLOT_ENEMY+9				;C - - - - - 0x01FE78 07:FE68: 8D 9D 05
CODE_0FFE6B:
	RTS							;C - - - - - 0x01FE7B 07:FE6B: 60

DATA_0FFE6C:
	.byte anBigPudding_ID				;- - - - - - 0x01FE7C 07:FE6C: 94
	.byte anBigPineapple_ID			;- - - - - - 0x01FE7D 07:FE6D: 95
	.byte anBigHamburger_ID			;- - - - - - 0x01FE7E 07:FE6E: 96
	.byte anBigDessert_ID				;- - - - - - 0x01FE7F 07:FE6F: 97
	.byte anBigFieldPeas_ID				;- - - - - - 0x01FE80 07:FE70: 98

DespawnProj:
	;X: Proj index
	TXA							;C - - - - - 0x01FE81 07:FE71: 8A
	TAY							;C - - - - - 0x01FE82 07:FE72: A8
DespawnProj_Direct:
	;Y: Proj index
	CPY #8					;C - - - - - 0x01FE83 07:FE73: C0 08
	BCS @end				;C - - - - - 0x01FE85 07:FE75: B0 0A
		LDA #$FF					;C - - - - - 0x01FE87 07:FE77: A9 FF
		STA projParent,Y				;C - - - - - 0x01FE89 07:FE79: 99 25 05
		LDA #$00					;C - - - - - 0x01FE8C 07:FE7C: A9 00
		STA objState+OSLOT_PROJ,Y				;C - - - - - 0x01FE8E 07:FE7E: 99 64 05
@end:
	RTS							;C - - - - - 0x01FE91 07:FE81: 60

SpawnProj:
	;Spawn projectile and register parent
	;Also return current amount projectiles linked to parent in scratch0
	;X: Parent enemy index
	;00: X
	;01: Y
	;02: CHR slot
	;05: State (Projectile ID)
	;06-07: Anim

	LDA prgBankA				;C - - - - - 0x01FE92 07:FE82: A5 54
	PHA							;C - - - - - 0x01FE94 07:FE84: 48
	LDA #.BANK(SpawnProj_Local)					;C - - - - - 0x01FE95 07:FE85: A9 05

.ifdef REGION_JP
	STA prgBankA
	STA $8000
.else
	STA newPrgBank				;C - - - - - 0x01FE97 07:FE87: 85 3B
	JSR SwapPrgBankA				;C - - - - - 0x01FE99 07:FE89: 20 3D FF
.endif

	JSR SpawnProj_Local				;C - - - - - 0x01FE9C 07:FE8C: 20 6D 9C

	PLA							;C - - - - - 0x01FE9F 07:FE8F: 68
	STA prgBankA				;C - - - - - 0x01FEA0 07:FE90: 85 54
	LDA prgBankA				;C - - - - - 0x01FEA2 07:FE92: A5 54

.ifdef REGION_JP
	STA prgBankA
	STA $8000
.else
	STA newPrgBank				;C - - - - - 0x01FEA4 07:FE94: 85 3B
	JSR SwapPrgBankA				;C - - - - - 0x01FEA6 07:FE96: 20 3D FF
.endif
	RTS							;C - - - - - 0x01FEA9 07:FE99: 60

.ifdef REGION_JP
;For US, this is located in bank 09 instead
BubblesTravelUpdate:
	LDA #8					;C - - - - - 0x013DAA 04:9D9A: A9 08
	STA collW				;C - - - - - 0x013DAC 04:9D9C: 85 D0
	STA collH				;C - - - - - 0x013DAE 04:9D9E: 85 D1

	LDX #$00					;C - - - - - 0x013DB0 04:9DA0: A2 00
	STX ram_051B				;C - - - - - 0x013DB2 04:9DA2: 8E 1B 05
	TXA							;C - - - - - 0x013DB5 04:9DA5: 8A
@clear:
	STA bubbleDir,X				;C - - - - - 0x013DB6 04:9DA6: 9D EB 04
	INX							;C - - - - - 0x013DB9 04:9DA9: E8
	CPX #20					;C - - - - - 0x013DBA 04:9DAA: E0 14
	BNE @clear				;C - - - - - 0x013DBC 04:9DAC: D0 F8

	LDA globalTimer				;C - - - - - 0x013DBE 04:9DAE: A5 14
	AND #$06					;C - - - - - 0x013DC0 04:9DB0: 29 06
	STA scratch6				;C - - - - - 0x013DC2 04:9DB2: 85 06
	LDX #$00					;C - - - - - 0x013DC4 04:9DB4: A2 00
	STX scratch0				;C - - - - - 0x013DC6 04:9DB6: 86 00
	LDA #$01					;C - - - - - 0x013DC8 04:9DB8: A9 01
	STA scratch1				;C - - - - - 0x013DCA 04:9DBA: 85 01
CODE_099DBC:
	LDX scratch0				;C - - - - - 0x013DCC 04:9DBC: A6 00
	LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x013DCE 04:9DBE: BD 77 05
	BEQ CODE_099DDF				;C - - - - - 0x013DD1 04:9DC1: F0 1C
	CMP #BUBBLE_EMERGING					;C - - - - - 0x013DD3 04:9DC3: C9 80
.ifdef REGION_JP
	BEQ CODE_099DDF					;- - - - - - 0x01FE1D 07:FE0D: F0
.else
	BCS CODE_099DDF				;C - - - - - 0x013DD5 04:9DC5: B0 18
.endif

	CMP #BUBBLE_POWER_POPPED					;C - - - - - 0x013DD7 04:9DC7: C9 06
	BEQ CODE_099DDF				;C - - - - - 0x013DD9 04:9DC9: F0 14
		CMP #BUBBLE_POPPED					;C - - - - - 0x013DDB 04:9DCB: C9 23
		BEQ CODE_099DE2				;C - - - - - 0x013DDD 04:9DCD: F0 13
			LDA bubbleDir,X				;C - - - - - 0x013DDF 04:9DCF: BD EB 04
			BNE CODE_099DDF				;C - - - - - 0x013DE2 04:9DD2: D0 0B
				LDA scratch0				;C - - - - - 0x013DE4 04:9DD4: A5 00
				AND scratch6				;C - - - - - 0x013DE6 04:9DD6: 25 06
				CMP scratch6				;C - - - - - 0x013DE8 04:9DD8: C5 06
				BNE CODE_099DDF				;C - - - - - 0x013DEA 04:9DDA: D0 03
					JMP CODE_099DE2				;C - - - - - 0x013DEC 04:9DDC: 4C E2 9D
CODE_099DDF:
	JMP CODE_099E88				;C - - - - - 0x013DEF 04:9DDF: 4C 88 9E
CODE_099DE2:
	LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x013DF2 04:9DE2: BD 77 05
	STA scratch7				;C - - - - - 0x013DF5 04:9DE5: 85 07
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x013DF7 04:9DE7: BD C7 05
	STA scratch2				;C - - - - - 0x013DFA 04:9DEA: 85 02
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x013DFC 04:9DEC: BD 9F 05
	STA scratch3				;C - - - - - 0x013DFF 04:9DEF: 85 03
CODE_099DF1:
	;01: Other bubble slot
	;02: X
	;03: Y
	;07: State

	LDA #$00					;C - - - - - 0x013E01 04:9DF1: A9 00
	STA scratch8				;C - - - - - 0x013E03 04:9DF3: 85 08
	STA scratch9				;C - - - - - 0x013E05 04:9DF5: 85 09

	LDX scratch1				;C - - - - - 0x013E07 04:9DF7: A6 01
	LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x013E09 04:9DF9: BD 77 05
	BEQ CODE_099E6E				;C - - - - - 0x013E0C 04:9DFC: F0 70

	CMP #BUBBLE_EMERGING					;C - - - - - 0x013E0E 04:9DFE: C9 80
.ifdef REGION_JP
	BEQ CODE_099E6E				;- - - - - - 0x01FE58 07:FE48: F0
.else
	BCS CODE_099E6E				;C - - - - - 0x013E10 04:9E00: B0 6C
.endif

	CMP #BUBBLE_POWER_POPPED					;C - - - - - 0x013E12 04:9E02: C9 06
	BEQ CODE_099E6E				;C - - - - - 0x013E14 04:9E04: F0 68

	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x013E16 04:9E06: BD C7 05
	SEC							;C - - - - - 0x013E19 04:9E09: 38
	SBC scratch2				;C - - - - - 0x013E1A 04:9E0A: E5 02
	BCS CODE_099E15				;C - - - - - 0x013E1C 04:9E0C: B0 07
		EOR #$FF					;C - - - - - 0x013E1E 04:9E0E: 49 FF
		CLC							;C - - - - - 0x013E20 04:9E10: 18
		ADC #$01					;C - - - - - 0x013E21 04:9E11: 69 01
		INC scratch8				;C - - - - - 0x013E23 04:9E13: E6 08
CODE_099E15:
	;Got horizontal distance to other bubble
	;08: 1 if to the right of other bubble

	CMP collW				;C - - - - - 0x013E25 04:9E15: C5 D0
	BCS CODE_099E6E				;C - - - - - 0x013E27 04:9E17: B0 55

	STA scratch4				;C - - - - - 0x013E29 04:9E19: 85 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x013E2B 04:9E1B: BD 9F 05
	SEC							;C - - - - - 0x013E2E 04:9E1E: 38
	SBC scratch3				;C - - - - - 0x013E2F 04:9E1F: E5 03
	BCS CODE_099E2A				;C - - - - - 0x013E31 04:9E21: B0 07
		EOR #$FF					;C - - - - - 0x013E33 04:9E23: 49 FF
		CLC							;C - - - - - 0x013E35 04:9E25: 18
		ADC #$01					;C - - - - - 0x013E36 04:9E26: 69 01
		INC scratch9				;C - - - - - 0x013E38 04:9E28: E6 09
CODE_099E2A:
	;Got vertical distance to other bubble
	;09: 1 if below other bubble

	CMP collH				;C - - - - - 0x013E3A 04:9E2A: C5 D1
	BCS CODE_099E6E				;C - - - - - 0x013E3C 04:9E2C: B0 40

	STA scratch5				;C - - - - - 0x013E3E 04:9E2E: 85 05
	LDA scratch7				;C - - - - - 0x013E40 04:9E30: A5 07
	CMP #BUBBLE_POPPED					;C - - - - - 0x013E42 04:9E32: C9 23
	BNE CODE_099E58				;C - - - - - 0x013E44 04:9E34: D0 22
		LDA #24					;C - - - - - 0x013E46 04:9E36: A9 18
		STA collW				;C - - - - - 0x013E48 04:9E38: 85 D0
		STA collH				;C - - - - - 0x013E4A 04:9E3A: 85 D1
		INC ram_051B				;C - - - - - 0x013E4C 04:9E3C: EE 1B 05

		LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x013E4F 04:9E3F: BD 77 05
		CMP #BUBBLE_ENEMY					;C - - - - - 0x013E52 04:9E42: C9 03
		BEQ CODE_099E52				;C - - - - - 0x013E54 04:9E44: F0 0C
		CMP #BUBBLE_ENEMY_EXPIRING					;C - - - - - 0x013E56 04:9E46: C9 04
		BEQ CODE_099E52				;C - - - - - 0x013E58 04:9E48: F0 08
			;Pop other bubble
			LDA #BUBBLE_POPPING					;C - - - - - 0x013E5A 04:9E4A: A9 22
			STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x013E5C 04:9E4C: 9D 77 05
			JMP CODE_099E6E				;C - - - - - 0x013E5F 04:9E4F: 4C 6E 9E
	CODE_099E52:
		;Pop self
		JSR PopBubble				;C - - - - - 0x013E62 04:9E52: 20 7B FC
		JMP CODE_099E6E				;C - - - - - 0x013E65 04:9E55: 4C 6E 9E
CODE_099E58:
	;04: HDistance
	;05: VDistance
	LDA scratch4				;C - - - - - 0x013E68 04:9E58: A5 04
	CMP scratch5				;C - - - - - 0x013E6A 04:9E5A: C5 05
	BCC CODE_099E66				;C - - - - - 0x013E6C 04:9E5C: 90 08
		LDA #$02					;C - - - - - 0x013E6E 04:9E5E: A9 02
		SEC							;C - - - - - 0x013E70 04:9E60: 38
		SBC scratch8				;C - - - - - 0x013E71 04:9E61: E5 08
		JMP CODE_099E6B				;C - - - - - 0x013E73 04:9E63: 4C 6B 9E
CODE_099E66:
	LDA #$04					;C - - - - - 0x013E76 04:9E66: A9 04
	SEC							;C - - - - - 0x013E78 04:9E68: 38
	SBC scratch9				;C - - - - - 0x013E79 04:9E69: E5 09
CODE_099E6B:
	STA bubbleDir,X				;C - - - - - 0x013E7B 04:9E6B: 9D EB 04
CODE_099E6E:
	INC scratch1				;C - - - - - 0x013E7E 04:9E6E: E6 01
	LDX scratch1				;C - - - - - 0x013E80 04:9E70: A6 01
	CPX scratch0				;C - - - - - 0x013E82 04:9E72: E4 00
	BEQ CODE_099E88				;C - - - - - 0x013E84 04:9E74: F0 12
		CPX #20					;C - - - - - 0x013E86 04:9E76: E0 14
		BEQ CODE_099E7D				;C - - - - - 0x013E88 04:9E78: F0 03
			JMP CODE_099DF1				;C - - - - - 0x013E8A 04:9E7A: 4C F1 9D
	CODE_099E7D:
		LDA #$00					;C - - - - - 0x013E8D 04:9E7D: A9 00
		CMP scratch0				;C - - - - - 0x013E8F 04:9E7F: C5 00
		BEQ CODE_099E88				;C - - - - - 0x013E91 04:9E81: F0 05
			STA scratch1				;C - - - - - 0x013E93 04:9E83: 85 01
			JMP CODE_099DF1				;C - - - - - 0x013E95 04:9E85: 4C F1 9D
CODE_099E88:
	INC scratch0				;C - - - - - 0x013E98 04:9E88: E6 00
	LDX scratch0				;C - - - - - 0x013E9A 04:9E8A: A6 00
	STX scratch1				;C - - - - - 0x013E9C 04:9E8C: 86 01
	INC scratch1				;C - - - - - 0x013E9E 04:9E8E: E6 01
	CPX #19					;C - - - - - 0x013EA0 04:9E90: E0 13
	BEQ CODE_099E97				;C - - - - - 0x013EA2 04:9E92: F0 03
		JMP CODE_099DBC				;C - - - - - 0x013EA4 04:9E94: 4C BC 9D
CODE_099E97:
	LDA ram_051B				;C - - - - - 0x013EA7 04:9E97: AD 1B 05
	BEQ CODE_099EA5				;C - - - - - 0x013EAA 04:9E9A: F0 09
		LDA ram_051A				;C - - - - - 0x013EAC 04:9E9C: AD 1A 05
		STA ram_0549				;C - - - - - 0x013EAF 04:9E9F: 8D 49 05
		JMP CODE_099EF8				;C - - - - - 0x013EB2 04:9EA2: 4C F8 9E
CODE_099EA5:
	LDA #.BANK(DATA_04BF6D)					;C - - - - - 0x013EBC 04:9EAC: A9 04
	STA prgBankB
	STA $8001

	LDY ram_051A				;C - - - - - 0x013ED1 04:9EC1: AC 1A 05
	BEQ CODE_099EF0				;C - - - - - 0x013ED4 04:9EC4: F0 2A
		CPY #$03					;C - - - - - 0x013ED6 04:9EC6: C0 03
		BCC CODE_099EDB				;C - - - - - 0x013ED8 04:9EC8: 90 11
			LDA #$01					;C - - - - - 0x013EDA 04:9ECA: A9 01
			STA bonusRewardEarned				;C - - - - - 0x013EDC 04:9ECC: 8D 51 05

			LDA roundFlags				;C - - - - - 0x013EE3 04:9ED3: AD 71 04
			ORA #RFLAG_MULTI_REWARD					;C - - - - - 0x013EE6 04:9ED6: 09 40
			STA roundFlags				;C - - - - - 0x013EE8 04:9ED8: 8D 71 04
	CODE_099EDB:
		LDX DATA_04BF6D,Y			;C - - - - - 0x013EEB 04:9EDB: BE 6D BF
		LDA DATA_04BF64,Y			;C - - - - - 0x013EEE 04:9EDE: B9 64 BF
		STA scoreAdditionDigits,X				;C - - - - - 0x013EF1 04:9EE1: 9D A1 04
		LDX DATA_04BF7F,Y			;C - - - - - 0x013EF4 04:9EE4: BE 7F BF
		LDA DATA_04BF76,Y			;C - - - - - 0x013EF7 04:9EE7: B9 76 BF
		STA scoreAdditionDigits,X				;C - - - - - 0x013EFA 04:9EEA: 9D A1 04
		JSR AddScore				;C - - - - - 0x013EFD 04:9EED: 20 C7 FE
CODE_099EF0:
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001

	LDA #$00					;C - - - - - 0x013F00 04:9EF0: A9 00
	STA ram_051A				;C - - - - - 0x013F02 04:9EF2: 8D 1A 05
	STA ram_0549				;C - - - - - 0x013F05 04:9EF5: 8D 49 05
CODE_099EF8:
	RTS							;C - - - - - 0x013F08 04:9EF8: 60
.endif

.ifndef REGION_JP
;For JP, this is located further down
CODE_0FFE9A:
	LDX scratch0				;C - - - - - 0x01FEAA 07:FE9A: A6 00
	LDA DATA_0FFEAC,X			;C - - - - - 0x01FEAC 07:FE9C: BD AC FE
	STA updateSubBankA			;C - - - - - 0x01FEAF 07:FE9F: 85 18
	LDA DATA_0FFEAC+1,X			;C - - - - - 0x01FEB1 07:FEA1: BD AD FE
	STA updateSub				;C - - - - - 0x01FEB4 07:FEA4: 85 19
	LDA DATA_0FFEAC+2,X			;C - - - - - 0x01FEB6 07:FEA6: BD AE FE
	STA updateSub+1				;C - - - - - 0x01FEB9 07:FEA9: 85 1A
	RTS							;C - - - - - 0x01FEBB 07:FEAB: 60
.endif

.ifndef REGION_JP
;For JP, this is located further down
DATA_0FFEAC:
	.byte .BANK(CODE_088000)					;- D 0 - - - 0x01FEBC 07:FEAC: 08
	.word CODE_088000			;- D 0 - - - 0x01FEBD 07:FEAD: 00
	.byte .BANK(CODE_088646)					;- D 0 - - - 0x01FEBF 07:FEAF: 08
	.word CODE_088646			;- D 0 - - - 0x01FEC0 07:FEB0: 46
	.byte .BANK(CODE_088652)					;- D 0 - - - 0x01FEC2 07:FEB2: 08
	.word CODE_088652			;- D 0 - - - 0x01FEC3 07:FEB3: 52
	.byte .BANK(CODE_089CDD)					;- D 0 - - - 0x01FEC5 07:FEB5: 08
	.word CODE_089CDD			;- D 0 - - - 0x01FEC6 07:FEB6: DD
	.byte .BANK(CODE_089CDD)					;- D 0 - - - 0x01FEC8 07:FEB8: 08
	.word CODE_089CDD			;- D 0 - - - 0x01FEC9 07:FEB9: DD
	.byte .BANK(CODE_088000)					;- - - - - - 0x01FECB 07:FEBB: 08
	.word CODE_088000			;- - - - - - 0x01FECC 07:FEBC: 00
	.byte .BANK(CODE_088000)					;- - - - - - 0x01FECE 07:FEBE: 08
	.word CODE_088000			;- - - - - - 0x01FECF 07:FEBF: 00
	.byte .BANK(StartBonusRound)					;- D 0 - - - 0x01FED1 07:FEC1: 08
	.word StartBonusRound			;- D 0 - - - 0x01FED2 07:FEC2: 2D
	.byte .BANK(CODE_088632)					;- D 0 - - - 0x01FED4 07:FEC4: 08
	.word CODE_088632			;- D 0 - - - 0x01FED5 07:FEC5: 32
.endif

AddScore:
	LDY currentPlayer				;C - - - - - 0x01FED7 07:FEC7: AC 99 04
	LDX ScoreAdditionStartOfs,Y			;C - - - - - 0x01FEDA 07:FECA: BE 3B FF
	LDY #SCORE_TOTAL_DIGITS					;C - - - - - 0x01FEDD 07:FECD: A0 07
CODE_0FFECF:
	DEX							;C - - - - - 0x01FEDF 07:FECF: CA
	DEY							;C - - - - - 0x01FEE0 07:FED0: 88
	LDA scoreDigits,X				;C - - - - - 0x01FEE1 07:FED1: BD 81 04
	CLC							;C - - - - - 0x01FEE4 07:FED4: 18
	ADC scoreAdditionDigits,Y				;C - - - - - 0x01FEE5 07:FED5: 79 A1 04
	CMP #10					;C - - - - - 0x01FEE8 07:FED8: C9 0A
	BCC CODE_0FFEE6				;C - - - - - 0x01FEEA 07:FEDA: 90 0A
		SEC							;C - - - - - 0x01FEEC 07:FEDC: 38
		SBC #10					;C - - - - - 0x01FEED 07:FEDD: E9 0A
		CPX #$00					;C - - - - - 0x01FEEF 07:FEDF: E0 00
		BEQ CODE_0FFEF0				;C - - - - - 0x01FEF1 07:FEE1: F0 0D

		INC livesDigits+1,X				;C - - - - - 0x01FEF3 07:FEE3: FE 80 04
CODE_0FFEE6:
	STA scoreDigits,X				;C - - - - - 0x01FEF6 07:FEE6: 9D 81 04
	CPY #$00					;C - - - - - 0x01FEF9 07:FEE9: C0 00
	BNE CODE_0FFECF				;C - - - - - 0x01FEFB 07:FEEB: D0 E2

	JMP CODE_0FFF00				;C - - - - - 0x01FEFD 07:FEED: 4C 00 FF

CODE_0FFEF0:
	;Unreached
	LDY currentPlayer				;- - - - - - 0x01FF00 07:FEF0: AC
	LDX ScoreAdditionStartOfs,Y			;- - - - - - 0x01FF03 07:FEF3: BE
CODE_0FFEF6:
	DEX							;- - - - - - 0x01FF06 07:FEF6: CA
	LDA #9					;- - - - - - 0x01FF07 07:FEF7: A9
	STA scoreDigits,X				;- - - - - - 0x01FF09 07:FEF9: 9D
	CPX #$00					;- - - - - - 0x01FF0C 07:FEFC: E0
	BNE CODE_0FFEF6				;- - - - - - 0x01FF0E 07:FEFE: D0
CODE_0FFF00:
	LDA livesCurrentPos				;C - - - - - 0x01FF10 07:FF00: AD 98 04
	ORA #$01					;C - - - - - 0x01FF13 07:FF03: 09 01
	STA livesCurrentPos				;C - - - - - 0x01FF15 07:FF05: 8D 98 04
	LDY currentPlayer				;C - - - - - 0x01FF18 07:FF08: AC 99 04
	LDX ScoreAdditionStartOfs,Y			;C - - - - - 0x01FF1B 07:FF0B: BE 3B FF
	LDY #SCORE_TOTAL_DIGITS					;C - - - - - 0x01FF1E 07:FF0E: A0 07
CODE_0FFF10:
	DEX							;C - - - - - 0x01FF20 07:FF10: CA
	DEY							;C - - - - - 0x01FF21 07:FF11: 88
	LDA scoreDigits+HUD_TOTAL_DIGITS+SCORE_TOTAL_DIGITS,X				;C - - - - - 0x01FF22 07:FF12: BD 91 04
	CLC							;C - - - - - 0x01FF25 07:FF15: 18
	ADC scoreAdditionDigits,Y				;C - - - - - 0x01FF26 07:FF16: 79 A1 04
	CMP #10					;C - - - - - 0x01FF29 07:FF19: C9 0A
	BCC CODE_0FFF27				;C - - - - - 0x01FF2B 07:FF1B: 90 0A
		SEC							;C - - - - - 0x01FF2D 07:FF1D: 38
		SBC #10					;C - - - - - 0x01FF2E 07:FF1E: E9 0A
		CPX #$00					;C - - - - - 0x01FF30 07:FF20: E0 00
		BEQ CODE_0FFF2E				;C - - - - - 0x01FF32 07:FF22: F0 0A

		INC scoreDigits+HUD_TOTAL_DIGITS+SCORE_TOTAL_DIGITS-1,X				;C - - - - - 0x01FF34 07:FF24: FE 90 04
CODE_0FFF27:
	STA scoreDigits+HUD_TOTAL_DIGITS+SCORE_TOTAL_DIGITS,X				;C - - - - - 0x01FF37 07:FF27: 9D 91 04
	CPY #$00					;C - - - - - 0x01FF3A 07:FF2A: C0 00
	BNE CODE_0FFF10				;C - - - - - 0x01FF3C 07:FF2C: D0 E2
CODE_0FFF2E:
	LDY #$00					;C - - - - - 0x01FF3E 07:FF2E: A0 00
	LDA #$00					;C - - - - - 0x01FF40 07:FF30: A9 00
CODE_0FFF32:
	STA scoreAdditionDigits,Y				;C - - - - - 0x01FF42 07:FF32: 99 A1 04
	INY							;C - - - - - 0x01FF45 07:FF35: C8
	CPY #SCORE_TOTAL_DIGITS					;C - - - - - 0x01FF46 07:FF36: C0 07
	BNE CODE_0FFF32				;C - - - - - 0x01FF48 07:FF38: D0 F8

	RTS							;C - - - - - 0x01FF4A 07:FF3A: 60

ScoreAdditionStartOfs:
	.byte SCORE_TOTAL_DIGITS					;- D 0 - - - 0x01FF4B 07:FF3B: 07
	.byte HUD_TOTAL_DIGITS+SCORE_TOTAL_DIGITS					;- D 0 - - - 0x01FF4C 07:FF3C: 10

.ifndef REGION_JP
SwapPrgBankA:
	LDA #$06					;C - - - - - 0x01FF4D 07:FF3D: A9 06
	STA $8000				;C - - - - - 0x01FF4F 07:FF3F: 8D 00 80
	LDA newPrgBank				;C - - - - - 0x01FF52 07:FF42: A5 3B
	STA $8001				;C - - - - - 0x01FF54 07:FF44: 8D 01 80
	STA prgBankA				;C - - - - - 0x01FF57 07:FF47: 85 54

	LDA #$06					;C - - - - - 0x01FF59 07:FF49: A9 06
	STA $8000				;C - - - - - 0x01FF5B 07:FF4B: 8D 00 80
	LDA newPrgBank				;C - - - - - 0x01FF5E 07:FF4E: A5 3B
	STA $8001				;C - - - - - 0x01FF60 07:FF50: 8D 01 80
	STA prgBankA				;C - - - - - 0x01FF63 07:FF53: 85 54
	RTS							;C - - - - - 0x01FF65 07:FF55: 60
.endif

.ifndef REGION_JP
SwapPrgBankB:
	LDA #$07					;C - - - - - 0x01FF66 07:FF56: A9 07
	STA $8000				;C - - - - - 0x01FF68 07:FF58: 8D 00 80
	LDA newPrgBank				;C - - - - - 0x01FF6B 07:FF5B: A5 3B
	STA $8001				;C - - - - - 0x01FF6D 07:FF5D: 8D 01 80
	STA prgBankB				;C - - - - - 0x01FF70 07:FF60: 85 53

	LDA #$07					;C - - - - - 0x01FF72 07:FF62: A9 07
	STA $8000				;C - - - - - 0x01FF74 07:FF64: 8D 00 80
	LDA newPrgBank				;C D 0 - - - 0x01FF77 07:FF67: A5 3B
	STA $8001				;C - - - - - 0x01FF79 07:FF69: 8D 01 80
	STA prgBankB				;C - - - - - 0x01FF7C 07:FF6C: 85 53
	RTS							;C - - - - - 0x01FF7E 07:FF6E: 60
.endif

.ifdef REGION_JP
;For US, this is located earlier in this bank
CODE_0FFE9A:
	LDX scratch0				;C - - - - - 0x01FEAA 07:FE9A: A6 00
	LDA DATA_0FFEAC,X			;C - - - - - 0x01FEAC 07:FE9C: BD AC FE
	STA updateSubBankA			;C - - - - - 0x01FEAF 07:FE9F: 85 18
	LDA DATA_0FFEAC+1,X			;C - - - - - 0x01FEB1 07:FEA1: BD AD FE
	STA updateSub				;C - - - - - 0x01FEB4 07:FEA4: 85 19
	LDA DATA_0FFEAC+2,X			;C - - - - - 0x01FEB6 07:FEA6: BD AE FE
	STA updateSub+1				;C - - - - - 0x01FEB9 07:FEA9: 85 1A
	RTS							;C - - - - - 0x01FEBB 07:FEAB: 60
.endif

.ifdef REGION_JP
;For US, this is located earlier in this bank
DATA_0FFEAC:
	.byte .BANK(CODE_088000)					;- D 0 - - - 0x01FEBC 07:FEAC: 08
	.word CODE_088000			;- D 0 - - - 0x01FEBD 07:FEAD: 00
	.byte .BANK(CODE_088646)					;- D 0 - - - 0x01FEBF 07:FEAF: 08
	.word CODE_088646			;- D 0 - - - 0x01FEC0 07:FEB0: 46
	.byte .BANK(CODE_088652)					;- D 0 - - - 0x01FEC2 07:FEB2: 08
	.word CODE_088652			;- D 0 - - - 0x01FEC3 07:FEB3: 52
	.byte .BANK(CODE_089CDD)					;- D 0 - - - 0x01FEC5 07:FEB5: 08
	.word CODE_089CDD			;- D 0 - - - 0x01FEC6 07:FEB6: DD
	.byte .BANK(CODE_089CDD)					;- D 0 - - - 0x01FEC8 07:FEB8: 08
	.word CODE_089CDD			;- D 0 - - - 0x01FEC9 07:FEB9: DD
	.byte .BANK(CODE_088000)					;- - - - - - 0x01FECB 07:FEBB: 08
	.word CODE_088000			;- - - - - - 0x01FECC 07:FEBC: 00
	.byte .BANK(CODE_088000)					;- - - - - - 0x01FECE 07:FEBE: 08
	.word CODE_088000			;- - - - - - 0x01FECF 07:FEBF: 00
	.byte .BANK(StartBonusRound)					;- D 0 - - - 0x01FED1 07:FEC1: 08
	.word StartBonusRound			;- D 0 - - - 0x01FED2 07:FEC2: 2D
	.byte .BANK(CODE_088632)					;- D 0 - - - 0x01FED4 07:FEC4: 08
	.word CODE_088632			;- D 0 - - - 0x01FED5 07:FEC5: 32
.endif

.ifdef REGION_JP
;Filler data
	;- - - - - - 0x01FFE2 07:FFD2: FB
	.incbin "filler/fill0F_JP.bin"
.endif

;Vectors
.segment "VECTORS"
	.word NMIHandler			;- D 0 - - - 0x02000A 07:FFFA: 48 NMI
	.word Begin					;- D 0 - - - 0x02000C 07:FFFC: 00 RESET
	.word IRQHandler			;- D 0 - - - 0x02000E 07:FFFE: 32 IRQ, BRK