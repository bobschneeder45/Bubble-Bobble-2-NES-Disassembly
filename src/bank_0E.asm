.segment "PRG_BANK_E"
; 0x01C010-0x01E00F

;Contents: Audio engine, some music tracks, may have unused DMC samples (at least a table for them)

CODE_0EC000:
	;Unreached
	JMP AudioInit				;- - - - - - 0x01C010 07:C000: 4C
CODE_0EC003:
	;Unreached
	JMP AudioUpdate				;- - - - - - 0x01C013 07:C003: 4C
AudioInit:
	LDA #$00					;C - - - - - 0x01C016 07:C006: A9 00
	STA SND_CHN					;C - - - - - 0x01C018 07:C008: 8D 15 40
	LDX #$10					;C - - - - - 0x01C01B 07:C00B: A2 10
@clearchannel:
	STA SQ1_VOL,X					;C - - - - - 0x01C01D 07:C00D: 9D 00 40
	DEX							;C - - - - - 0x01C020 07:C010: CA
	BPL @clearchannel				;C - - - - - 0x01C021 07:C011: 10 FA

	LDA #$0F					;C - - - - - 0x01C023 07:C013: A9 0F
	STA SND_CHN				;C - - - - - 0x01C025 07:C015: 8D 15 40
	LDA #$40					;C - - - - - 0x01C028 07:C018: A9 40
	STA JOY2				;C - - - - - 0x01C02A 07:C01A: 8D 17 40
	LDA #$00					;C - - - - - 0x01C02D 07:C01D: A9 00
	TAX							;C - - - - - 0x01C02F 07:C01F: AA
@clearstatus:
	STA musicTrigger,X				;C - - - - - 0x01C030 07:C020: 95 E0
	INX							;C - - - - - 0x01C032 07:C022: E8
	CPX #ram_00F1+1-musicTrigger					;C - - - - - 0x01C033 07:C023: E0 12
	BNE @clearstatus				;C - - - - - 0x01C035 07:C025: D0 F9

	TAX							;C - - - - - 0x01C037 07:C027: AA
@clearseq:
	STA trackAdrSQ1,X				;C - - - - - 0x01C038 07:C028: 9D 90 07
	INX							;C - - - - - 0x01C03B 07:C02B: E8
	CPX #ram_07F5+1-trackAdrSQ1	;C - - - - - 0x01C03C 07:C02C: E0 66
	BNE @clearseq				;C - - - - - 0x01C03E 07:C02E: D0 F8

	LDA #SOUND_PLAYING					;C - - - - - 0x01C040 07:C030: A9 80
	STA musicTrigger				;C - - - - - 0x01C042 07:C032: 85 E0
	STA soundTrigger				;C - - - - - 0x01C044 07:C034: 85 E1
	STA jingleTrigger				;C - - - - - 0x01C046 07:C036: 85 E2
CODE_0EC038:
	RTS							;C - - - - - 0x01C048 07:C038: 60

AudioUpdate:
	JSR JingleUpdate				;C - - - - - 0x01C049 07:C039: 20 6D C7
	LDA soundTrigger				;C - - - - - 0x01C04C 07:C03C: A5 E1
	BMI @nonewsound				;C - - - - - 0x01C04E 07:C03E: 30 06
		JSR PlaySound				;C - - - - - 0x01C050 07:C040: 20 35 C7
		JMP CODE_0EC064				;C - - - - - 0x01C053 07:C043: 4C 64 C0
@nonewsound:
	LDX #CHOFS_SOUND_SQ2					;C - - - - - 0x01C056 07:C046: A2 47
	LDA trackAdrSQ1+1,X				;C - - - - - 0x01C058 07:C048: BD 91 07
	BEQ CODE_0EC055				;C - - - - - 0x01C05B 07:C04B: F0 08
		JSR UpdateChannelSequence				;C - - - - - 0x01C05D 07:C04D: 20 CF C0
		LDY #$04					;C - - - - - 0x01C060 07:C050: A0 04
		JSR CODE_0EC65F				;C - - - - - 0x01C062 07:C052: 20 5F C6
CODE_0EC055:
	LDX #CHOFS_SOUND_NOISE					;C - - - - - 0x01C065 07:C055: A2 54
	LDA trackAdrSQ1+1,X				;C - - - - - 0x01C067 07:C057: BD 91 07
	BEQ CODE_0EC064				;C - - - - - 0x01C06A 07:C05A: F0 08
		JSR UpdateChannelSequence				;C - - - - - 0x01C06C 07:C05C: 20 CF C0
		LDY #$0C					;C - - - - - 0x01C06F 07:C05F: A0 0C
		JSR CODE_0EC65F				;C - - - - - 0x01C071 07:C061: 20 5F C6
CODE_0EC064:
	LDA jingleTrigger				;C - - - - - 0x01C074 07:C064: A5 E2
	CMP #JINGLE_PLAYING					;C - - - - - 0x01C076 07:C066: C9 80
	BNE CODE_0EC038				;C - - - - - 0x01C078 07:C068: D0 CE

	LDA musicTrigger				;C - - - - - 0x01C07A 07:C06A: A5 E0
	BMI @nownewmusic				;C - - - - - 0x01C07C 07:C06C: 30 03
		JMP PlayMusic				;C - - - - - 0x01C07E 07:C06E: 4C 87 C6
@nownewmusic:
	LDA ram_07F5				;C - - - - - 0x01C081 07:C071: AD F5 07
	CLC							;C - - - - - 0x01C084 07:C074: 18
	ADC ram_07F4				;C - - - - - 0x01C085 07:C075: 6D F4 07
	STA ram_07F4				;C - - - - - 0x01C088 07:C078: 8D F4 07
	BCS CODE_0EC07E				;C - - - - - 0x01C08B 07:C07B: B0 01
	RTS							;C - - - - - 0x01C08D 07:C07D: 60

CODE_0EC07E:
	LDX #CHOFS_MUSIC_SQ1					;C - - - - - 0x01C08E 07:C07E: A2 00
	LDA trackAdrSQ1+1,X				;C - - - - - 0x01C090 07:C080: BD 91 07
	BEQ CODE_0EC093				;C - - - - - 0x01C093 07:C083: F0 0E
		JSR UpdateChannelSequence				;C - - - - - 0x01C095 07:C085: 20 CF C0
		JSR CODE_0EC59D				;C - - - - - 0x01C098 07:C088: 20 9D C5
		JSR CODE_0EC7B3				;C - - - - - 0x01C09B 07:C08B: 20 B3 C7
		LDY #$00					;C - - - - - 0x01C09E 07:C08E: A0 00
		JSR CODE_0EC65F				;C - - - - - 0x01C0A0 07:C090: 20 5F C6
CODE_0EC093:
	LDX #CHOFS_MUSIC_SQ2					;C - - - - - 0x01C0A3 07:C093: A2 18
	LDA trackAdrSQ1+1,X				;C - - - - - 0x01C0A5 07:C095: BD 91 07
	BEQ CODE_0EC0AD				;C - - - - - 0x01C0A8 07:C098: F0 13

	JSR UpdateChannelSequence				;C - - - - - 0x01C0AA 07:C09A: 20 CF C0
	JSR CODE_0EC59D				;C - - - - - 0x01C0AD 07:C09D: 20 9D C5
	JSR CODE_0EC7B3				;C - - - - - 0x01C0B0 07:C0A0: 20 B3 C7

	LDA soundAdrSQ2+1				;C - - - - - 0x01C0B3 07:C0A3: AD D8 07
	BNE CODE_0EC0AD				;C - - - - - 0x01C0B6 07:C0A6: D0 05
		LDY #$04					;C - - - - - 0x01C0B8 07:C0A8: A0 04
		JSR CODE_0EC65F				;C - - - - - 0x01C0BA 07:C0AA: 20 5F C6
CODE_0EC0AD:
	LDX #CHOFS_MUSIC_TRI					;C - - - - - 0x01C0BD 07:C0AD: A2 30
	LDA trackAdrSQ1+1,X				;C - - - - - 0x01C0BF 07:C0AF: BD 91 07
	BEQ CODE_0EC0BC				;C - - - - - 0x01C0C2 07:C0B2: F0 08
		JSR UpdateChannelSequence				;C - - - - - 0x01C0C4 07:C0B4: 20 CF C0
		LDY #$08					;C - - - - - 0x01C0C7 07:C0B7: A0 08
		JSR CODE_0EC65F				;C - - - - - 0x01C0C9 07:C0B9: 20 5F C6
CODE_0EC0BC:
	LDX #CHOFS_MUSIC_NOISE					;C - - - - - 0x01C0CC 07:C0BC: A2 3F
	LDA trackAdrSQ1+1,X				;C - - - - - 0x01C0CE 07:C0BE: BD 91 07
	BEQ CODE_0EC0C6				;C - - - - - 0x01C0D1 07:C0C1: F0 03
		JSR UpdateChannelSequence				;C - - - - - 0x01C0D3 07:C0C3: 20 CF C0
CODE_0EC0C6:
	LDA soundAdrSQ2+1				;C - - - - - 0x01C0D6 07:C0C6: AD D8 07
	ORA soundAdrNOISE+1				;C - - - - - 0x01C0D9 07:C0C9: 0D E5 07
	STA musicAdr+1				;C - - - - - 0x01C0DC 07:C0CC: 85 EB
	RTS							;C - - - - - 0x01C0DE 07:C0CE: 60

UpdateChannelSequence:
	LDA trackTimerSQ1,X				;C - - - - - 0x01C0DF 07:C0CF: BD 96 07
	BNE UpdateChannelSequence_Waiting				;C - - - - - 0x01C0E2 07:C0D2: D0 54

	STX currentChannelOfs				;C - - - - - 0x01C0E4 07:C0D4: 86 E5
	LDA trackAdrSQ1,X				;C - - - - - 0x01C0E6 07:C0D6: BD 90 07
	STA musicReadAdr				;C - - - - - 0x01C0E9 07:C0D9: 85 E6
	LDA trackAdrSQ1+1,X				;C - - - - - 0x01C0EB 07:C0DB: BD 91 07
	STA musicReadAdr+1				;C - - - - - 0x01C0EE 07:C0DE: 85 E7
	JMP UpdateChannelSequence_ReadOp				;C - - - - - 0x01C0F0 07:C0E0: 4C EF C0
UpdateChannelSequence_OpRetC0:
	TYA							;C - - - - - 0x01C0F3 07:C0E3: 98
	CLC							;C - - - - - 0x01C0F4 07:C0E4: 18
	ADC musicReadAdr				;C - - - - - 0x01C0F5 07:C0E5: 65 E6
	STA musicReadAdr				;C - - - - - 0x01C0F7 07:C0E7: 85 E6

	LDA musicReadAdr+1				;C - - - - - 0x01C0F9 07:C0E9: A5 E7
	ADC #$00					;C - - - - - 0x01C0FB 07:C0EB: 69 00
	STA musicReadAdr+1				;C - - - - - 0x01C0FD 07:C0ED: 85 E7
UpdateChannelSequence_ReadOp:
	LDY #$00					;C - - - - - 0x01C0FF 07:C0EF: A0 00
	LDA (musicReadAdr),Y			;C - - - - - 0x01C101 07:C0F1: B1 E6
	CMP #$C0					;C - - - - - 0x01C103 07:C0F3: C9 C0
	BCC @type00				;C - - - - - 0x01C105 07:C0F5: 90 0F
		;C0-FF: Run subroutine, first operand would be in next byte
		INY							;C - - - - - 0x01C107 07:C0F7: C8
		AND #$3E					;C - - - - - 0x01C108 07:C0F8: 29 3E
		TAX							;C - - - - - 0x01C10A 07:C0FA: AA
		LDA AudioOpHandlersC0,X			;C - - - - - 0x01C10B 07:C0FB: BD AB C2
		STA musicAdr				;C - - - - - 0x01C10E 07:C0FE: 85 EA
		LDA AudioOpHandlersC0+1,X			;C - - - - - 0x01C110 07:C100: BD AC C2
		JMP @haveopadr				;C - - - - - 0x01C113 07:C103: 4C 14 C1
@type00:
	;00-B0 (0-B): Run subroutine, first operand would be baked into same byte, whole byte for some
	LSR							;C - - - - - 0x01C116 07:C106: 4A
	LSR							;C - - - - - 0x01C117 07:C107: 4A
	LSR							;C - - - - - 0x01C118 07:C108: 4A
	AND #$1E					;C - - - - - 0x01C119 07:C109: 29 1E
	TAX							;C - - - - - 0x01C11B 07:C10B: AA
	LDA AudioOpHandlers00,X			;C - - - - - 0x01C11C 07:C10C: BD 39 C1
	STA musicAdr				;C - - - - - 0x01C11F 07:C10F: 85 EA
	LDA AudioOpHandlers00+1,X			;C - - - - - 0x01C121 07:C111: BD 3A C1
@haveopadr:
	STA musicAdr+1				;C - - - - - 0x01C124 07:C114: 85 EB
	LDX currentChannelOfs				;C - - - - - 0x01C126 07:C116: A6 E5
	JMP (musicAdr)				;C - - - - - 0x01C128 07:C118: 6C EA 00
UpdateChannelSequence_OpRet00:
	CLC							;C - - - - - 0x01C12B 07:C11B: 18
	ADC musicReadAdr				;C - - - - - 0x01C12C 07:C11C: 65 E6
	STA trackAdrSQ1,X				;C - - - - - 0x01C12E 07:C11E: 9D 90 07
	LDA musicReadAdr+1				;C - - - - - 0x01C131 07:C121: A5 E7
	ADC #$00					;C - - - - - 0x01C133 07:C123: 69 00
	STA trackAdrSQ1+1,X				;C - - - - - 0x01C135 07:C125: 9D 91 07
UpdateChannelSequence_Waiting:
	DEC trackTimerSQ1,X				;C - - - - - 0x01C138 07:C128: DE 96 07
	LDA trackNoteTimerSQ1,X				;C - - - - - 0x01C13B 07:C12B: BD 97 07
	BEQ CODE_0EC138				;C - - - - - 0x01C13E 07:C12E: F0 08

	DEC trackNoteTimerSQ1,X				;C - - - - - 0x01C140 07:C130: DE 97 07
	BNE CODE_0EC138				;C - - - - - 0x01C143 07:C133: D0 03

	JMP EndNote				;C - - - - - 0x01C145 07:C135: 4C 88 C2
CODE_0EC138:
	RTS							;C - - - - - 0x01C148 07:C138: 60

AudioOpHandlers00:
	;- D 0 - - - 0x01C149 07:C139: 51
	.word CODE_0EC151			;xx OR bits $7F of xx into ram_079D...
	.word CODE_0EC151			;1x (SAME AS 00)
	.word CODE_0EC151			;2x (SAME AS 00)
	.word CODE_0EC151			;3x (SAME AS 00)
	.word CODE_0EC151			;4x (SAME AS 00)
	.word CODE_0EC163			;5x Store bits x in ram_07A1
	.word CODE_0EC16E			;6x UNUSED Store bits x OR'd with $80 in ram_07F2, clear $40 bit in ram_07F1
	.word CODE_0EC187			;7x UNUSED Store bits x OR'd with $80 in ram_07F1, clear $40 bit in ram_07F2
	.word CODE_0EC1A0			;8x Delay from index x, delay+1 to trackNoteTimerSQ1
	.word CODE_0EC1BD			;9x Delay from index x, minus 2
	.word CODE_0EC1D5			;Ax Delay from index x, halved
	.word CODE_0EC1F6			;Bx Delay from index x, set trackNoteTimerSQ1 to zero

CODE_0EC151:
	LDA ram_079D,X				;C - - - - - 0x01C161 07:C151: BD 9D 07
	AND #$80					;C - - - - - 0x01C164 07:C154: 29 80
	ORA (musicReadAdr),Y			;C - - - - - 0x01C166 07:C156: 11 E6
	STA ram_079D,X				;C - - - - - 0x01C168 07:C158: 9D 9D 07
	JSR CODE_0EC4DA				;C - - - - - 0x01C16B 07:C15B: 20 DA C4
	LDY #$01					;C - - - - - 0x01C16E 07:C15E: A0 01
	JMP UpdateChannelSequence_OpRetC0				;C - - - - - 0x01C170 07:C160: 4C E3 C0

CODE_0EC163:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C173 07:C163: B1 E6
	AND #$0F					;C - - - - - 0x01C175 07:C165: 29 0F
	STA ram_07A1,X				;C - - - - - 0x01C177 07:C167: 9D A1 07
	INY							;C - - - - - 0x01C17A 07:C16A: C8
	JMP UpdateChannelSequence_OpRetC0				;C - - - - - 0x01C17B 07:C16B: 4C E3 C0

CODE_0EC16E:
	;Unreached
	LDA (musicReadAdr),Y			;- - - - - - 0x01C17E 07:C16E: B1
	AND #$0F					;- - - - - - 0x01C180 07:C170: 29
	ORA #$80					;- - - - - - 0x01C182 07:C172: 09
	STA ram_07F2				;- - - - - - 0x01C184 07:C174: 8D

	LDA ram_07F1				;- - - - - - 0x01C187 07:C177: AD
	AND #$40					;- - - - - - 0x01C18A 07:C17A: 29
	BEQ CODE_0EC183				;- - - - - - 0x01C18C 07:C17C: F0
		LDA #$00					;- - - - - - 0x01C18E 07:C17E: A9
		STA ram_07F1				;- - - - - - 0x01C190 07:C180: 8D
CODE_0EC183:
	INY							;- - - - - - 0x01C193 07:C183: C8
	JMP UpdateChannelSequence_OpRetC0				;- - - - - - 0x01C194 07:C184: 4C

CODE_0EC187:
	;Unreached
	LDA (musicReadAdr),Y			;- - - - - - 0x01C197 07:C187: B1
	AND #$0F					;- - - - - - 0x01C199 07:C189: 29
	ORA #$80					;- - - - - - 0x01C19B 07:C18B: 09
	STA ram_07F1				;- - - - - - 0x01C19D 07:C18D: 8D

	LDA ram_07F2				;- - - - - - 0x01C1A0 07:C190: AD
	AND #$40					;- - - - - - 0x01C1A3 07:C193: 29
	BEQ CODE_0EC19C				;- - - - - - 0x01C1A5 07:C195: F0
		LDA #$00					;- - - - - - 0x01C1A7 07:C197: A9
		STA ram_07F2				;- - - - - - 0x01C1A9 07:C199: 8D
CODE_0EC19C:
	INY							;- - - - - - 0x01C1AC 07:C19C: C8
	JMP UpdateChannelSequence_OpRetC0				;- - - - - - 0x01C1AD 07:C19D: 4C

CODE_0EC1A0:
	LDA trackNoteTimerSQ1,X				;C - - - - - 0x01C1B0 07:C1A0: BD 97 07
	BNE CODE_0EC1A8				;C - - - - - 0x01C1B3 07:C1A3: D0 03
		JSR CODE_0EC212				;C - - - - - 0x01C1B5 07:C1A5: 20 12 C2
CODE_0EC1A8:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C1B8 07:C1A8: B1 E6
	AND #$0F					;C - - - - - 0x01C1BA 07:C1AA: 29 0F
	TAY							;C - - - - - 0x01C1BC 07:C1AC: A8
	LDA (tempoDelaysAdr),Y			;C - - - - - 0x01C1BD 07:C1AD: B1 E3
	STA trackTimerSQ1,X				;C - - - - - 0x01C1BF 07:C1AF: 9D 96 07
	STA trackNoteTimerSQ1,X				;C - - - - - 0x01C1C2 07:C1B2: 9D 97 07
	INC trackNoteTimerSQ1,X				;C - - - - - 0x01C1C5 07:C1B5: FE 97 07
	LDA #$01					;C - - - - - 0x01C1C8 07:C1B8: A9 01
	JMP UpdateChannelSequence_OpRet00				;C - - - - - 0x01C1CA 07:C1BA: 4C 1B C1

CODE_0EC1BD:
	LDA trackNoteTimerSQ1,X				;C - - - - - 0x01C1CD 07:C1BD: BD 97 07
	BNE CODE_0EC1C5				;C - - - - - 0x01C1D0 07:C1C0: D0 03
		JSR CODE_0EC212				;C - - - - - 0x01C1D2 07:C1C2: 20 12 C2
CODE_0EC1C5:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C1D5 07:C1C5: B1 E6
	AND #$0F					;C - - - - - 0x01C1D7 07:C1C7: 29 0F
	TAY							;C - - - - - 0x01C1D9 07:C1C9: A8
	LDA (tempoDelaysAdr),Y			;C - - - - - 0x01C1DA 07:C1CA: B1 E3
	STA trackTimerSQ1,X				;C - - - - - 0x01C1DC 07:C1CC: 9D 96 07
	SEC							;C - - - - - 0x01C1DF 07:C1CF: 38
	SBC #$02					;C - - - - - 0x01C1E0 07:C1D0: E9 02
	JMP CODE_0EC1E8				;C - - - - - 0x01C1E2 07:C1D2: 4C E8 C1

CODE_0EC1D5:
	LDA trackNoteTimerSQ1,X				;C - - - - - 0x01C1E5 07:C1D5: BD 97 07
	BNE CODE_0EC1DD				;C - - - - - 0x01C1E8 07:C1D8: D0 03
		JSR CODE_0EC212				;C - - - - - 0x01C1EA 07:C1DA: 20 12 C2
CODE_0EC1DD:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C1ED 07:C1DD: B1 E6
	AND #$0F					;C - - - - - 0x01C1EF 07:C1DF: 29 0F
	TAY							;C - - - - - 0x01C1F1 07:C1E1: A8
	LDA (tempoDelaysAdr),Y			;C - - - - - 0x01C1F2 07:C1E2: B1 E3
	STA trackTimerSQ1,X				;C - - - - - 0x01C1F4 07:C1E4: 9D 96 07
	LSR							;C - - - - - 0x01C1F7 07:C1E7: 4A
CODE_0EC1E8:
	BEQ CODE_0EC1EC				;C - - - - - 0x01C1F8 07:C1E8: F0 02
	BPL CODE_0EC1EE				;C - - - - - 0x01C1FA 07:C1EA: 10 02
CODE_0EC1EC:
	;Unreached
	;Failsafe in case value became zero or negative
	LDA #$01					;- - - - - - 0x01C1FC 07:C1EC: A9
CODE_0EC1EE:
	STA trackNoteTimerSQ1,X				;C - - - - - 0x01C1FE 07:C1EE: 9D 97 07
	LDA #$01					;C - - - - - 0x01C201 07:C1F1: A9 01
	JMP UpdateChannelSequence_OpRet00				;C - - - - - 0x01C203 07:C1F3: 4C 1B C1

CODE_0EC1F6:
	LDA trackNoteTimerSQ1,X				;C - - - - - 0x01C206 07:C1F6: BD 97 07
	BEQ CODE_0EC1FE				;C - - - - - 0x01C209 07:C1F9: F0 03
		;Unreached
		JSR EndNote				;- - - - - - 0x01C20B 07:C1FB: 20
CODE_0EC1FE:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C20E 07:C1FE: B1 E6
	AND #$0F					;C - - - - - 0x01C210 07:C200: 29 0F
	TAY							;C - - - - - 0x01C212 07:C202: A8
	LDA (tempoDelaysAdr),Y			;C - - - - - 0x01C213 07:C203: B1 E3
	STA trackTimerSQ1,X				;C - - - - - 0x01C215 07:C205: 9D 96 07
	LDA #$00					;C - - - - - 0x01C218 07:C208: A9 00
	STA trackNoteTimerSQ1,X				;C - - - - - 0x01C21A 07:C20A: 9D 97 07
	LDA #$01					;C - - - - - 0x01C21D 07:C20D: A9 01
	JMP UpdateChannelSequence_OpRet00				;C - - - - - 0x01C21F 07:C20F: 4C 1B C1

CODE_0EC212:
	CPX #CHOFS_MUSIC_TRI					;C - - - - - 0x01C222 07:C212: E0 30
	BEQ @tri				;C - - - - - 0x01C224 07:C214: F0 32
	BCS @noise				;C - - - - - 0x01C226 07:C216: B0 34

	;SQ1 or SQ2
	LDA ram_07A2,X				;C - - - - - 0x01C228 07:C218: BD A2 07
	AND #$7F					;C - - - - - 0x01C22B 07:C21B: 29 7F
	BEQ @C230				;C - - - - - 0x01C22D 07:C21D: F0 11
		ORA #$80					;C - - - - - 0x01C22F 07:C21F: 09 80
		STA ram_07A3,X				;C - - - - - 0x01C231 07:C221: 9D A3 07

		LDA ram_07A6,X				;C - - - - - 0x01C234 07:C224: BD A6 07
		STA trackLoSQ1,X				;C - - - - - 0x01C237 07:C227: 9D 9B 07
		LDA ram_07A7,X				;C - - - - - 0x01C23A 07:C22A: BD A7 07
		STA trackHiSQ1,X				;C - - - - - 0x01C23D 07:C22D: 9D 9C 07
@C230:
	LDA #CHMASK_LO|CHMASK_HI					;C - - - - - 0x01C240 07:C230: A9 0C
	ORA trackRegMaskSQ1,X				;C - - - - - 0x01C242 07:C232: 1D 98 07
	STA trackRegMaskSQ1,X				;C - - - - - 0x01C245 07:C235: 9D 98 07

	;Volume 0
	LDA trackVolSQ1,X				;C - - - - - 0x01C248 07:C238: BD 99 07
	AND #$F0					;C - - - - - 0x01C24B 07:C23B: 29 F0
	STA trackVolSQ1,X				;C - - - - - 0x01C24D 07:C23D: 9D 99 07

	LDA ram_079F,X				;C - - - - - 0x01C250 07:C240: BD 9F 07
	AND #$FC					;C - - - - - 0x01C253 07:C243: 29 FC
	JMP EndNote_C29C				;C - - - - - 0x01C255 07:C245: 4C 9C C2
@tri:
	;TRI
	LDA #$81					;C - - - - - 0x01C258 07:C248: A9 81
	BNE EndNote_TRI_SET				;C - - - - - 0x01C25A 07:C24A: D0 5B
@noise:
	;Unreached
	;Music NOISE or sound effect channel
	STY musicTempA				;- - - - - - 0x01C25C 07:C24C: 84

	LDA soundAdrNOISE+1				;- - - - - - 0x01C25E 07:C24E: AD
	BNE @musicnoisechecked				;- - - - - - 0x01C261 07:C251: D0
	;Not overridden by sound

	;0-5 or FF for none
	LDA ram_07F1				;- - - - - - 0x01C263 07:C253: AD
	BPL @musicnoisechecked				;- - - - - - 0x01C266 07:C256: 10
		ORA #$40					;- - - - - - 0x01C268 07:C258: 09
		STA ram_07F1				;- - - - - - 0x01C26A 07:C25A: 8D
		ASL							;- - - - - - 0x01C26D 07:C25D: 0A
		ASL							;- - - - - - 0x01C26E 07:C25E: 0A
		TAY							;- - - - - - 0x01C26F 07:C25F: A8
		LDA DATA_0ECDDC,Y			;- - - - - - 0x01C270 07:C260: B9
		STA NOISE_VOL				;- - - - - - 0x01C273 07:C263: 8D
		LDA DATA_0ECDDC+1,Y			;- - - - - - 0x01C276 07:C266: B9
		STA $400D					;- - - - - - 0x01C279 07:C269: 8D
		LDA DATA_0ECDDC+2,Y			;- - - - - - 0x01C27C 07:C26C: B9
		STA NOISE_LO				;- - - - - - 0x01C27F 07:C26F: 8D
		LDA DATA_0ECDDC+3,Y			;- - - - - - 0x01C282 07:C272: B9
		STA NOISE_HI				;- - - - - - 0x01C285 07:C275: 8D
@musicnoisechecked:
	LDA ram_07F2				;- - - - - - 0x01C288 07:C278: AD
	BPL @ret				;- - - - - - 0x01C28B 07:C27B: 10
		ORA #$40					;- - - - - - 0x01C28D 07:C27D: 09
		STA ram_07F2				;- - - - - - 0x01C28F 07:C27F: 8D
		JSR PlayDMCSample				;- - - - - - 0x01C292 07:C282: 20
@ret:
	LDY musicTempA				;- - - - - - 0x01C295 07:C285: A4
	RTS							;- - - - - - 0x01C297 07:C287: 60

EndNote:
	CPX #CHOFS_MUSIC_TRI					;C - - - - - 0x01C298 07:C288: E0 30
	BEQ EndNote_TRI				;C - - - - - 0x01C29A 07:C28A: F0 19
	BCS EndNote_Ret				;C - - - - - 0x01C29C 07:C28C: B0 1C

	;Square
	LDA trackVolSQ1,X				;C - - - - - 0x01C29E 07:C28E: BD 99 07
	AND #$3F					;C - - - - - 0x01C2A1 07:C291: 29 3F
	CMP #$31					;C - - - - - 0x01C2A3 07:C293: C9 31
	BCC EndNote_Ret				;C - - - - - 0x01C2A5 07:C295: 90 13

	LDA ram_079F,X				;C - - - - - 0x01C2A7 07:C297: BD 9F 07
	ORA #$03					;C - - - - - 0x01C2AA 07:C29A: 09 03
EndNote_C29C:
	STA ram_079F,X				;C - - - - - 0x01C2AC 07:C29C: 9D 9F 07
	LDA #$00					;C - - - - - 0x01C2AF 07:C29F: A9 00
	STA ram_07A0,X				;C - - - - - 0x01C2B1 07:C2A1: 9D A0 07
	RTS							;C - - - - - 0x01C2B4 07:C2A4: 60
EndNote_TRI:
	LDA #$80					;C - - - - - 0x01C2B5 07:C2A5: A9 80
EndNote_TRI_SET:
	STA TRI_LINEAR				;C - - - - - 0x01C2B7 07:C2A7: 8D 08 40
EndNote_Ret:
	RTS							;C - - - - - 0x01C2BA 07:C2AA: 60

AudioOpHandlersC0:
	;- D 0 - - - 0x01C2BB 07:C2AB: E7
	.word CODE_0EC2E7			;C0 End
	.word CODE_0EC31A			;C2 xx Set number of loops for loop 1
	.word CODE_0EC323			;C4 xx Set number of loops for loop 2 (can be used within loop 1 or vice versa)
	.word CODE_0EC32C			;C6 xxxx Loop back to xxxx if loop 1 looped enough times
	.word CODE_0EC337			;C8 xxxx Loop back to xxxx if loop 2 looped enough times
	.word CODE_0EC344			;CA xxxx Store adr right after this command in trackRetSQ1 and jump to xxxx
	.word CODE_0EC353			;CC xxxx Jump
	.word CODE_0EC365			;CE Jump back to continue point stored by opcode CA
	.word CODE_0EC374			;D0 xx Wait exact amount of frames
	.word CODE_0EC37E			;D2 xx Set duty to xx AND $C0, replace $7c bits in ram_079F (supplied as $0-1f), also OR $02 into ram_079F
	.word CODE_0EC3A6			;D4 UNUSED Set $80 bit in ram_079D (Use upper 5 bits of ram_079E as index for value to subtract from LO,HI timer)
	.word CODE_0EC3B1			;D6 UNUSED Clear $80 bit in ram_079D
	.word CODE_0EC3BC			;D8 Set $80 bit in ram_079F
	.word CODE_0EC3C7			;DA UNUSED Clear $80 bit in ram_079F
	.word CODE_0EC3D2			;DC xx Bits below $40 to ram_07A2, higher bits used as index ($00-$06) ($00-$03)
	.word CODE_0EC3FA			;DE UNUSED xx yy Set ram_079E and trackTimerSQ1...
	.word CODE_0EC426			;E0 xxxx Set LO,HI timer
	.word CODE_0EC436			;E2 xxxx Add to LO,HI timer
	.word CODE_0EC457			;E4 xx Set VOL
	.word CODE_0EC45C			;E6 xx Add to VOL
	.word CODE_0EC46A			;E8 xx Set LO
	.word CODE_0EC46F			;EA xx Add to LO
	.word CODE_0EC47D			;EC xx Set SWEEP
	.word CODE_0EC48E			;EE xx UNUSED Play DMC sample, index xx
	.word CODE_0EC498			;F0 xx UNUSED Set ram_07A1
	.word CODE_0EC49D			;F2 xx UNUSED Add to ram_07A1
	.word CODE_0EC4AA			;F4 UNUSED Clear ram_07A2 and ram_07A5
	.word CODE_0EC4B5			;F6 xx UNUSED Add xx to ram_079E...
	.word CODE_0EC4C9			;F8 UNUSED Set CHMASK_LO|CHMASK_HI (load LO,HI values again)
	.word CODE_0EC4CD			;FA xx UNUSED Add to ram_07F5
	;FC FREE SLOT
	;FE FREE SLOT

CODE_0EC2E7:
	CPX #CHOFS_MUSIC_TRI					;C - - - - - 0x01C2F7 07:C2E7: E0 30
	BCC @square				;C - - - - - 0x01C2F9 07:C2E9: 90 08
	BEQ @tri				;C - - - - - 0x01C2FB 07:C2EB: F0 16

	CPX #CHOFS_SOUND_SQ2					;C - - - - - 0x01C2FD 07:C2ED: E0 47
	BEQ @soundsquare				;C - - - - - 0x01C2FF 07:C2EF: F0 16
	BCC @haltseq				;C - - - - - 0x01C301 07:C2F1: 90 0A
@square:
	LDA #$30					;C - - - - - 0x01C303 07:C2F3: A9 30
@setvol:
	STA trackVolSQ1,X				;C - - - - - 0x01C305 07:C2F5: 9D 99 07
	LDA #CHMASK_VOL					;C - - - - - 0x01C308 07:C2F8: A9 01
@setmask:
	STA trackRegMaskSQ1,X				;C - - - - - 0x01C30A 07:C2FA: 9D 98 07
@haltseq:
	LDA #$00					;C - - - - - 0x01C30D 07:C2FD: A9 00
	STA trackAdrSQ1+1,X				;C - - - - - 0x01C30F 07:C2FF: 9D 91 07
	RTS							;C - - - - - 0x01C312 07:C302: 60
@tri:
	LDA #$80					;C - - - - - 0x01C313 07:C303: A9 80
	BNE @setvol				;C - - - - - 0x01C315 07:C305: D0 EE
@soundsquare:
	LDA #CHMASK_LO|CHMASK_HI					;C - - - - - 0x01C317 07:C307: A9 0C
	STA trackRegMaskSQ2				;C - - - - - 0x01C319 07:C309: 8D B0 07
	LDA #$00					;C - - - - - 0x01C31C 07:C30C: A9 00
	STA soundSweepSQ2				;C - - - - - 0x01C31E 07:C30E: 8D E1 07
	LDA #$30					;C - - - - - 0x01C321 07:C311: A9 30
	STA trackVolSQ1,X				;C - - - - - 0x01C323 07:C313: 9D 99 07
	LDA #CHMASK_VOL|CHMASK_SWEEP					;C - - - - - 0x01C326 07:C316: A9 03
	BNE @setmask				;C - - - - - 0x01C328 07:C318: D0 E0

CODE_0EC31A:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C32A 07:C31A: B1 E6
	STA trackLoop1RemainingSQ1,X				;C - - - - - 0x01C32C 07:C31C: 9D 94 07
	INY							;C - - - - - 0x01C32F 07:C31F: C8
	JMP UpdateChannelSequence_OpRetC0				;C - - - - - 0x01C330 07:C320: 4C E3 C0

CODE_0EC323:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C333 07:C323: B1 E6
	STA trackLoop2RemainingSQ1,X				;C - - - - - 0x01C335 07:C325: 9D 95 07
	INY							;C - - - - - 0x01C338 07:C328: C8
	JMP UpdateChannelSequence_OpRetC0				;C - - - - - 0x01C339 07:C329: 4C E3 C0

CODE_0EC32C:
	DEC trackLoop1RemainingSQ1,X				;C - - - - - 0x01C33C 07:C32C: DE 94 07
	LDA trackLoop1RemainingSQ1,X				;C - - - - - 0x01C33F 07:C32F: BD 94 07
	BEQ CODE_0EC33F				;C - - - - - 0x01C342 07:C332: F0 0B
	JMP CODE_0EC353				;C - - - - - 0x01C344 07:C334: 4C 53 C3

CODE_0EC337:
	DEC trackLoop2RemainingSQ1,X				;C - - - - - 0x01C347 07:C337: DE 95 07
	LDA trackLoop2RemainingSQ1,X				;C - - - - - 0x01C34A 07:C33A: BD 95 07
	BNE CODE_0EC353				;C - - - - - 0x01C34D 07:C33D: D0 14
CODE_0EC33F:
	INY							;C - - - - - 0x01C34F 07:C33F: C8
	INY							;C - - - - - 0x01C350 07:C340: C8
	JMP UpdateChannelSequence_OpRetC0				;C - - - - - 0x01C351 07:C341: 4C E3 C0

CODE_0EC344:
	LDA #$03					;C - - - - - 0x01C354 07:C344: A9 03
	CLC							;C - - - - - 0x01C356 07:C346: 18
	ADC musicReadAdr				;C - - - - - 0x01C357 07:C347: 65 E6
	STA trackRetSQ1,X				;C - - - - - 0x01C359 07:C349: 9D 92 07
	LDA musicReadAdr+1				;C - - - - - 0x01C35C 07:C34C: A5 E7
	ADC #$00					;C - - - - - 0x01C35E 07:C34E: 69 00
	STA trackRetSQ1+1,X				;C - - - - - 0x01C360 07:C350: 9D 93 07
CODE_0EC353:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C363 07:C353: B1 E6
	STA musicTempA				;C - - - - - 0x01C365 07:C355: 85 E8
	INY							;C - - - - - 0x01C367 07:C357: C8
	LDA (musicReadAdr),Y			;C - - - - - 0x01C368 07:C358: B1 E6
	STA musicReadAdr+1				;C - - - - - 0x01C36A 07:C35A: 85 E7
	LDA musicTempA				;C - - - - - 0x01C36C 07:C35C: A5 E8
	STA musicReadAdr				;C - - - - - 0x01C36E 07:C35E: 85 E6
	LDY #$00					;C - - - - - 0x01C370 07:C360: A0 00
	JMP UpdateChannelSequence_OpRetC0				;C - - - - - 0x01C372 07:C362: 4C E3 C0

CODE_0EC365:
	LDA trackRetSQ1,X				;C - - - - - 0x01C375 07:C365: BD 92 07
	STA musicReadAdr				;C - - - - - 0x01C378 07:C368: 85 E6
	LDA trackRetSQ1+1,X				;C - - - - - 0x01C37A 07:C36A: BD 93 07
	STA musicReadAdr+1				;C - - - - - 0x01C37D 07:C36D: 85 E7
	LDY #$00					;C - - - - - 0x01C37F 07:C36F: A0 00
	JMP UpdateChannelSequence_OpRetC0				;C - - - - - 0x01C381 07:C371: 4C E3 C0

CODE_0EC374:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C384 07:C374: B1 E6
	STA trackTimerSQ1,X				;C - - - - - 0x01C386 07:C376: 9D 96 07
	LDA #$02					;C - - - - - 0x01C389 07:C379: A9 02
	JMP UpdateChannelSequence_OpRet00				;C - - - - - 0x01C38B 07:C37B: 4C 1B C1

CODE_0EC37E:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C38E 07:C37E: B1 E6
	AND #$C0					;C - - - - - 0x01C390 07:C380: 29 C0
	STA musicTempA				;C - - - - - 0x01C392 07:C382: 85 E8
	LDA trackVolSQ1,X				;C - - - - - 0x01C394 07:C384: BD 99 07
	AND #$3F					;C - - - - - 0x01C397 07:C387: 29 3F
	ORA musicTempA				;C - - - - - 0x01C399 07:C389: 05 E8
	STA trackVolSQ1,X				;C - - - - - 0x01C39B 07:C38B: 9D 99 07

	LDA (musicReadAdr),Y			;C - - - - - 0x01C39E 07:C38E: B1 E6
	AND #$1F					;C - - - - - 0x01C3A0 07:C390: 29 1F
	ASL							;C - - - - - 0x01C3A2 07:C392: 0A
	ASL							;C - - - - - 0x01C3A3 07:C393: 0A
	STA musicTempA				;C - - - - - 0x01C3A4 07:C394: 85 E8
	LDA ram_079F,X				;C - - - - - 0x01C3A6 07:C396: BD 9F 07
	AND #$80					;C - - - - - 0x01C3A9 07:C399: 29 80
	ORA musicTempA				;C - - - - - 0x01C3AB 07:C39B: 05 E8
	ORA #$02					;C - - - - - 0x01C3AD 07:C39D: 09 02
	STA ram_079F,X				;C - - - - - 0x01C3AF 07:C39F: 9D 9F 07

	INY							;C - - - - - 0x01C3B2 07:C3A2: C8
	JMP UpdateChannelSequence_OpRetC0				;C - - - - - 0x01C3B3 07:C3A3: 4C E3 C0

CODE_0EC3A6:
	;Unreached
	LDA ram_079D,X				;- - - - - - 0x01C3B6 07:C3A6: BD
	ORA #$80					;- - - - - - 0x01C3B9 07:C3A9: 09
	STA ram_079D,X				;- - - - - - 0x01C3BB 07:C3AB: 9D
	JMP UpdateChannelSequence_OpRetC0				;- - - - - - 0x01C3BE 07:C3AE: 4C

CODE_0EC3B1:
	;Unreached
	LDA ram_079D,X				;- - - - - - 0x01C3C1 07:C3B1: BD
	AND #$7F					;- - - - - - 0x01C3C4 07:C3B4: 29
	STA ram_079D,X				;- - - - - - 0x01C3C6 07:C3B6: 9D
	JMP UpdateChannelSequence_OpRetC0				;- - - - - - 0x01C3C9 07:C3B9: 4C

CODE_0EC3BC:
	LDA ram_079F,X				;C - - - - - 0x01C3CC 07:C3BC: BD 9F 07
	ORA #$80					;C - - - - - 0x01C3CF 07:C3BF: 09 80
	STA ram_079F,X				;C - - - - - 0x01C3D1 07:C3C1: 9D 9F 07
	JMP UpdateChannelSequence_OpRetC0				;C - - - - - 0x01C3D4 07:C3C4: 4C E3 C0

CODE_0EC3C7:
	;Unreached
	LDA ram_079F,X				;- - - - - - 0x01C3D7 07:C3C7: BD
	AND #$7F					;- - - - - - 0x01C3DA 07:C3CA: 29
	STA ram_079F,X				;- - - - - - 0x01C3DC 07:C3CC: 9D
	JMP UpdateChannelSequence_OpRetC0				;- - - - - - 0x01C3DF 07:C3CF: 4C

CODE_0EC3D2:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C3E2 07:C3D2: B1 E6
	AND #$3F					;C - - - - - 0x01C3E4 07:C3D4: 29 3F
	ASL							;C - - - - - 0x01C3E6 07:C3D6: 0A
	STA ram_07A2,X				;C - - - - - 0x01C3E7 07:C3D7: 9D A2 07

	LDA (musicReadAdr),Y			;C - - - - - 0x01C3EA 07:C3DA: B1 E6
	LSR							;C - - - - - 0x01C3EC 07:C3DC: 4A
	LSR							;C - - - - - 0x01C3ED 07:C3DD: 4A
	LSR							;C - - - - - 0x01C3EE 07:C3DE: 4A
	LSR							;C - - - - - 0x01C3EF 07:C3DF: 4A
	LSR							;C - - - - - 0x01C3F0 07:C3E0: 4A
	AND #$06					;C - - - - - 0x01C3F1 07:C3E1: 29 06
	TAY							;C - - - - - 0x01C3F3 07:C3E3: A8
	LDA DATA_0ECCB6,Y			;C - - - - - 0x01C3F4 07:C3E4: B9 B6 CC
	STA ram_07A4,X				;C - - - - - 0x01C3F7 07:C3E7: 9D A4 07
	LDA DATA_0ECCB6+1,Y			;C - - - - - 0x01C3FA 07:C3EA: B9 B7 CC
	STA ram_07A5,X				;C - - - - - 0x01C3FD 07:C3ED: 9D A5 07
	LDA #$00					;C - - - - - 0x01C400 07:C3F0: A9 00
	STA ram_07A3,X				;C - - - - - 0x01C402 07:C3F2: 9D A3 07
	LDY #$02					;C - - - - - 0x01C405 07:C3F5: A0 02
	JMP UpdateChannelSequence_OpRetC0				;C - - - - - 0x01C407 07:C3F7: 4C E3 C0

CODE_0EC3FA:
	;Unreached
	LDA (musicReadAdr),Y			;- - - - - - 0x01C40A 07:C3FA: B1
	STA ram_079E,X				;- - - - - - 0x01C40C 07:C3FC: 9D
	INY							;- - - - - - 0x01C40F 07:C3FF: C8
	LDA (musicReadAdr),Y			;- - - - - - 0x01C410 07:C400: B1
	STA trackTimerSQ1,X				;- - - - - - 0x01C412 07:C402: 9D
	BEQ CODE_E3C41B				;- - - - - - 0x01C415 07:C405: F0
		LDA ram_079D,X				;- - - - - - 0x01C417 07:C407: BD
		JSR CODE_0EC4DA				;- - - - - - 0x01C41A 07:C40A: 20

		LDA trackTimerSQ1,X				;- - - - - - 0x01C41D 07:C40D: BD
		STA trackNoteTimerSQ1,X				;- - - - - - 0x01C420 07:C410: 9D
		INC trackNoteTimerSQ1,X				;- - - - - - 0x01C423 07:C413: FE
		LDA #$03					;- - - - - - 0x01C426 07:C416: A9
		JMP UpdateChannelSequence_OpRet00				;- - - - - - 0x01C428 07:C418: 4C
CODE_E3C41B:
	;Unreached
	LDA ram_079D,X				;- - - - - - 0x01C42B 07:C41B: BD
	JSR CODE_0EC4DA				;- - - - - - 0x01C42E 07:C41E: 20
	LDY #$03					;- - - - - - 0x01C431 07:C421: A0
	JMP UpdateChannelSequence_OpRetC0				;- - - - - - 0x01C433 07:C423: 4C

CODE_0EC426:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C436 07:C426: B1 E6
	STA trackLoSQ1,X				;C - - - - - 0x01C438 07:C428: 9D 9B 07
	INY							;C - - - - - 0x01C43B 07:C42B: C8

	LDA (musicReadAdr),Y			;C - - - - - 0x01C43C 07:C42C: B1 E6
	STA trackHiSQ1,X				;C - - - - - 0x01C43E 07:C42E: 9D 9C 07
	INY							;C - - - - - 0x01C441 07:C431: C8

	LDA #CHMASK_LO|CHMASK_HI					;C - - - - - 0x01C442 07:C432: A9 0C
	BNE CODE_0EC485				;C - - - - - 0x01C444 07:C434: D0 4F
CODE_0EC436:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C446 07:C436: B1 E6
	INY							;C - - - - - 0x01C448 07:C438: C8
	CLC							;C - - - - - 0x01C449 07:C439: 18
	ADC trackLoSQ1,X				;C - - - - - 0x01C44A 07:C43A: 7D 9B 07
	STA trackLoSQ1,X				;C - - - - - 0x01C44D 07:C43D: 9D 9B 07
	LDA trackHiSQ1,X				;C - - - - - 0x01C450 07:C440: BD 9C 07
	ADC (musicReadAdr),Y			;C - - - - - 0x01C453 07:C443: 71 E6
	CMP trackHiSQ1,X				;C - - - - - 0x01C455 07:C445: DD 9C 07
	BEQ CODE_0EC452				;C - - - - - 0x01C458 07:C448: F0 08
		STA trackHiSQ1,X				;C - - - - - 0x01C45A 07:C44A: 9D 9C 07
		INY							;C - - - - - 0x01C45D 07:C44D: C8
		LDA #CHMASK_LO|CHMASK_HI					;C - - - - - 0x01C45E 07:C44E: A9 0C
		BNE CODE_0EC485				;C - - - - - 0x01C460 07:C450: D0 33
CODE_0EC452:
	INY							;C - - - - - 0x01C462 07:C452: C8
	LDA #CHMASK_LO					;C - - - - - 0x01C463 07:C453: A9 04
	BNE CODE_0EC485				;C - - - - - 0x01C465 07:C455: D0 2E
CODE_0EC457:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C467 07:C457: B1 E6
	JMP CODE_0EC462				;C - - - - - 0x01C469 07:C459: 4C 62 C4
CODE_0EC45C:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C46C 07:C45C: B1 E6
	CLC							;C - - - - - 0x01C46E 07:C45E: 18
	ADC trackVolSQ1,X				;C - - - - - 0x01C46F 07:C45F: 7D 99 07
CODE_0EC462:
	STA trackVolSQ1,X				;C - - - - - 0x01C472 07:C462: 9D 99 07
	INY							;C - - - - - 0x01C475 07:C465: C8
	LDA #CHMASK_VOL					;C - - - - - 0x01C476 07:C466: A9 01
	BNE CODE_0EC485				;C - - - - - 0x01C478 07:C468: D0 1B
CODE_0EC46A:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C47A 07:C46A: B1 E6
	JMP CODE_0EC475				;C - - - - - 0x01C47C 07:C46C: 4C 75 C4
CODE_0EC46F:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C47F 07:C46F: B1 E6
	CLC							;C - - - - - 0x01C481 07:C471: 18
	ADC trackLoSQ1,X				;C - - - - - 0x01C482 07:C472: 7D 9B 07
CODE_0EC475:
	STA trackLoSQ1,X				;C - - - - - 0x01C485 07:C475: 9D 9B 07
	INY							;C - - - - - 0x01C488 07:C478: C8
	LDA #CHMASK_LO|CHMASK_HI					;C - - - - - 0x01C489 07:C479: A9 0C
	BNE CODE_0EC485				;C - - - - - 0x01C48B 07:C47B: D0 08
CODE_0EC47D:
	LDA (musicReadAdr),Y			;C - - - - - 0x01C48D 07:C47D: B1 E6
	STA trackSweepSQ1,X				;C - - - - - 0x01C48F 07:C47F: 9D 9A 07
	INY							;C - - - - - 0x01C492 07:C482: C8
	LDA #CHMASK_SWEEP					;C - - - - - 0x01C493 07:C483: A9 02
CODE_0EC485:
	ORA trackRegMaskSQ1,X				;C - - - - - 0x01C495 07:C485: 1D 98 07
	STA trackRegMaskSQ1,X				;C - - - - - 0x01C498 07:C488: 9D 98 07
	JMP UpdateChannelSequence_OpRetC0				;C - - - - - 0x01C49B 07:C48B: 4C E3 C0

CODE_0EC48E:
	;Unreached
	LDA (musicReadAdr),Y			;- - - - - - 0x01C49E 07:C48E: B1
	JSR PlayDMCSample				;- - - - - - 0x01C4A0 07:C490: 20
	LDY #$02					;- - - - - - 0x01C4A3 07:C493: A0
	JMP UpdateChannelSequence_OpRetC0				;- - - - - - 0x01C4A5 07:C495: 4C

CODE_0EC498:
	;Unreached
	LDA (musicReadAdr),Y			;- - - - - - 0x01C4A8 07:C498: B1
	JMP CODE_0EC4A3				;- - - - - - 0x01C4AA 07:C49A: 4C

CODE_0EC49D:
	;Unreached
	LDA (musicReadAdr),Y			;- - - - - - 0x01C4AD 07:C49D: B1
	CLC							;- - - - - - 0x01C4AF 07:C49F: 18
	ADC ram_07A1,X				;- - - - - - 0x01C4B0 07:C4A0: 7D
CODE_0EC4A3:
	;Unreached
	STA ram_07A1,X				;- - - - - - 0x01C4B3 07:C4A3: 9D
	INY							;- - - - - - 0x01C4B6 07:C4A6: C8
	JMP UpdateChannelSequence_OpRetC0				;- - - - - - 0x01C4B7 07:C4A7: 4C

CODE_0EC4AA:
	;Unreached
	LDA #$00					;- - - - - - 0x01C4BA 07:C4AA: A9
	STA ram_07A2,X				;- - - - - - 0x01C4BC 07:C4AC: 9D
	STA ram_07A5,X				;- - - - - - 0x01C4BF 07:C4AF: 9D
	JMP UpdateChannelSequence_OpRetC0				;- - - - - - 0x01C4C2 07:C4B2: 4C

CODE_0EC4B5:
	;Unreached
	LDA (musicReadAdr),Y			;- - - - - - 0x01C4C5 07:C4B5: B1
	CLC							;- - - - - - 0x01C4C7 07:C4B7: 18
	ADC ram_079E,X				;- - - - - - 0x01C4C8 07:C4B8: 7D
	STA ram_079E,X				;- - - - - - 0x01C4CB 07:C4BB: 9D

	LDA ram_079D,X				;- - - - - - 0x01C4CE 07:C4BE: BD
	JSR CODE_0EC4DA				;- - - - - - 0x01C4D1 07:C4C1: 20
	LDY #$02					;- - - - - - 0x01C4D4 07:C4C4: A0
	JMP UpdateChannelSequence_OpRetC0				;- - - - - - 0x01C4D6 07:C4C6: 4C

CODE_0EC4C9:
	;Unreached
	LDA #CHMASK_LO|CHMASK_HI					;- - - - - - 0x01C4D9 07:C4C9: A9
	BNE CODE_0EC485				;- - - - - - 0x01C4DB 07:C4CB: D0
CODE_0EC4CD:
	;Unreached
	LDA (musicReadAdr),Y			;- - - - - - 0x01C4DD 07:C4CD: B1
	CLC							;- - - - - - 0x01C4DF 07:C4CF: 18
	ADC ram_07F5				;- - - - - - 0x01C4E0 07:C4D0: 6D
	STA ram_07F5				;- - - - - - 0x01C4E3 07:C4D3: 8D
	INY							;- - - - - - 0x01C4E6 07:C4D6: C8
	JMP UpdateChannelSequence_OpRetC0				;- - - - - - 0x01C4E7 07:C4D7: 4C

CODE_0EC4DA:
	ASL							;C - - - - - 0x01C4EA 07:C4DA: 0A
	CLC							;C - - - - - 0x01C4EB 07:C4DB: 18
	ADC ram_079E,X				;C - - - - - 0x01C4EC 07:C4DC: 7D 9E 07
	STA musicTempA				;C - - - - - 0x01C4EF 07:C4DF: 85 E8
	LDY #$00					;C - - - - - 0x01C4F1 07:C4E1: A0 00
CODE_0EC4E3:
	CMP #$18					;C - - - - - 0x01C4F3 07:C4E3: C9 18
	BCC CODE_0EC4EE				;C - - - - - 0x01C4F5 07:C4E5: 90 07

	SEC							;C - - - - - 0x01C4F7 07:C4E7: 38
	SBC #$18					;C - - - - - 0x01C4F8 07:C4E8: E9 18
	INY							;C - - - - - 0x01C4FA 07:C4EA: C8
	JMP CODE_0EC4E3				;C - - - - - 0x01C4FB 07:C4EB: 4C E3 C4
CODE_0EC4EE:
	STY musicTempB				;C - - - - - 0x01C4FE 07:C4EE: 84 E9
	ASL							;C - - - - - 0x01C500 07:C4F0: 0A
	TAX							;C - - - - - 0x01C501 07:C4F1: AA
	LDA DATA_0ECC71,X			;C - - - - - 0x01C502 07:C4F2: BD 71 CC
	STA musicAdr				;C - - - - - 0x01C505 07:C4F5: 85 EA
	LDA DATA_0ECC71+1,X			;C - - - - - 0x01C507 07:C4F7: BD 72 CC
	STA musicAdr+1				;C - - - - - 0x01C50A 07:C4FA: 85 EB
	;Y: Amount to shift word right
	CPY #$00					;C - - - - - 0x01C50C 07:C4FC: C0 00
	BEQ CODE_0EC507				;C - - - - - 0x01C50E 07:C4FE: F0 07
CODE_0EC500:
	LSR musicAdr+1				;C - - - - - 0x01C510 07:C500: 46 EB
	ROR musicAdr				;C - - - - - 0x01C512 07:C502: 66 EA
	DEY							;C - - - - - 0x01C514 07:C504: 88
	BNE CODE_0EC500				;C - - - - - 0x01C515 07:C505: D0 F9
CODE_0EC507:
	LDX currentChannelOfs				;C - - - - - 0x01C517 07:C507: A6 E5
	LDA ram_079D,X				;C - - - - - 0x01C519 07:C509: BD 9D 07
	BPL CODE_0EC526				;C - - - - - 0x01C51C 07:C50C: 10 18
		;Unreached
		LDA musicTempA				;- - - - - - 0x01C51E 07:C50E: A5
		LSR							;- - - - - - 0x01C520 07:C510: 4A
		LSR							;- - - - - - 0x01C521 07:C511: 4A
		LSR							;- - - - - - 0x01C522 07:C512: 4A
		AND #$1E					;- - - - - - 0x01C523 07:C513: 29
		TAY							;- - - - - - 0x01C525 07:C515: A8
		SEC							;- - - - - - 0x01C526 07:C516: 38
		LDA musicAdr				;- - - - - - 0x01C527 07:C517: A5
		SBC DATA_0ECCA1,Y			;- - - - - - 0x01C529 07:C519: F9
		STA trackLoSQ1,X				;- - - - - - 0x01C52C 07:C51C: 9D
		LDA musicAdr+1				;- - - - - - 0x01C52F 07:C51F: A5
		SBC #$00					;- - - - - - 0x01C531 07:C521: E9
		JMP CODE_0EC52D				;- - - - - - 0x01C533 07:C523: 4C
CODE_0EC526:
	LDA musicAdr				;C - - - - - 0x01C536 07:C526: A5 EA
	STA trackLoSQ1,X				;C - - - - - 0x01C538 07:C528: 9D 9B 07
	LDA musicAdr+1				;C - - - - - 0x01C53B 07:C52B: A5 EB
CODE_0EC52D:
	ORA #$30					;C - - - - - 0x01C53D 07:C52D: 09 30
	STA trackHiSQ1,X				;C - - - - - 0x01C53F 07:C52F: 9D 9C 07
	LDA #CHMASK_LO|CHMASK_HI					;C - - - - - 0x01C542 07:C532: A9 0C
	ORA trackRegMaskSQ1,X				;C - - - - - 0x01C544 07:C534: 1D 98 07
	STA trackRegMaskSQ1,X				;C - - - - - 0x01C547 07:C537: 9D 98 07
	CPX #CHOFS_MUSIC_TRI					;C - - - - - 0x01C54A 07:C53A: E0 30
	BCS CODE_0EC576				;C - - - - - 0x01C54C 07:C53C: B0 38

	LDA trackLoSQ1,X				;C - - - - - 0x01C54E 07:C53E: BD 9B 07
	STA ram_07A6,X				;C - - - - - 0x01C551 07:C541: 9D A6 07
	LDA trackHiSQ1,X				;C - - - - - 0x01C554 07:C544: BD 9C 07
	STA ram_07A7,X				;C - - - - - 0x01C557 07:C547: 9D A7 07
	LDA ram_07A5,X				;C - - - - - 0x01C55A 07:C54A: BD A5 07
	BEQ CODE_0EC576				;C - - - - - 0x01C55D 07:C54D: F0 27

	LDA ram_07A4,X				;C - - - - - 0x01C55F 07:C54F: BD A4 07
	STA musicAdr				;C - - - - - 0x01C562 07:C552: 85 EA
	LDA ram_07A5,X				;C - - - - - 0x01C564 07:C554: BD A5 07
	STA musicAdr+1				;C - - - - - 0x01C567 07:C557: 85 EB
	LDA musicTempB				;C - - - - - 0x01C569 07:C559: A5 E9
	ASL							;C - - - - - 0x01C56B 07:C55B: 0A
	TAY							;C - - - - - 0x01C56C 07:C55C: A8
	CPX #CHOFS_MUSIC_SQ1					;C - - - - - 0x01C56D 07:C55D: E0 00
	BEQ CODE_0EC563				;C - - - - - 0x01C56F 07:C55F: F0 02
		LDX #$02					;C - - - - - 0x01C571 07:C561: A2 02
CODE_0EC563:
	LDA (musicAdr),Y			;C - - - - - 0x01C573 07:C563: B1 EA
	STA musicUnkAdrA,X				;C - - - - - 0x01C575 07:C565: 95 EC
	INY							;C - - - - - 0x01C577 07:C567: C8
	LDA (musicAdr),Y			;C - - - - - 0x01C578 07:C568: B1 EA
	STA musicUnkAdrA+1,X				;C - - - - - 0x01C57A 07:C56A: 95 ED

	LDX currentChannelOfs				;C - - - - - 0x01C57C 07:C56C: A6 E5
	LDA ram_07A2,X				;C - - - - - 0x01C57E 07:C56E: BD A2 07
	ORA #$80					;C - - - - - 0x01C581 07:C571: 09 80
	STA ram_07A2,X				;C - - - - - 0x01C583 07:C573: 9D A2 07
CODE_0EC576:
	RTS							;C - - - - - 0x01C586 07:C576: 60

PlayDMCSample:
	;Unreached
	;A: Sample index
	ASL							;- - - - - - 0x01C587 07:C577: 0A
	ASL							;- - - - - - 0x01C588 07:C578: 0A
	TAY							;- - - - - - 0x01C589 07:C579: A8
	LDA #$0F					;- - - - - - 0x01C58A 07:C57A: A9
	STA SND_CHN					;- - - - - - 0x01C58C 07:C57C: 8D
	LDA DMCSampleTable,Y			;- - - - - - 0x01C58F 07:C57F: B9
	STA DMC_FREQ				;- - - - - - 0x01C592 07:C582: 8D
	LDA DMCSampleTable+1,Y			;- - - - - - 0x01C595 07:C585: B9
	STA DMC_RAW					;- - - - - - 0x01C598 07:C588: 8D
	LDA DMCSampleTable+2,Y			;- - - - - - 0x01C59B 07:C58B: B9
	STA DMC_START				;- - - - - - 0x01C59E 07:C58E: 8D
	LDA DMCSampleTable+3,Y			;- - - - - - 0x01C5A1 07:C591: B9
	STA DMC_LEN					;- - - - - - 0x01C5A4 07:C594: 8D
	LDA #$1F					;- - - - - - 0x01C5A7 07:C597: A9
	STA SND_CHN					;- - - - - - 0x01C5A9 07:C599: 8D
	RTS							;- - - - - - 0x01C5AC 07:C59C: 60

CODE_0EC59D:
	LDA #$10					;C - - - - - 0x01C5AD 07:C59D: A9 10
	CLC							;C - - - - - 0x01C5AF 07:C59F: 18
	ADC ram_07A0,X				;C - - - - - 0x01C5B0 07:C5A0: 7D A0 07
	STA ram_07A0,X				;C - - - - - 0x01C5B3 07:C5A3: 9D A0 07

	LDA ram_079F,X				;C - - - - - 0x01C5B6 07:C5A6: BD 9F 07
	AND #$7F					;C - - - - - 0x01C5B9 07:C5A9: 29 7F
	TAY							;C - - - - - 0x01C5BB 07:C5AB: A8
	LDA DATA_0ECE0F,Y			;C - - - - - 0x01C5BC 07:C5AC: B9 0F CE
	AND #$F0					;C - - - - - 0x01C5BF 07:C5AF: 29 F0
	CMP ram_07A0,X				;C - - - - - 0x01C5C1 07:C5B1: DD A0 07
	BNE CODE_0EC5CA				;C - - - - - 0x01C5C4 07:C5B4: D0 14
	LDA #$00					;C - - - - - 0x01C5C6 07:C5B6: A9 00
	STA ram_07A0,X				;C - - - - - 0x01C5C8 07:C5B8: 9D A0 07
	LDA ram_079F,X				;C - - - - - 0x01C5CB 07:C5BB: BD 9F 07
	AND #$03					;C - - - - - 0x01C5CE 07:C5BE: 29 03
	BEQ CODE_0EC62E				;C - - - - - 0x01C5D0 07:C5C0: F0 6C
	CMP #$01					;C - - - - - 0x01C5D2 07:C5C2: C9 01
	BEQ CODE_0EC5F6				;C - - - - - 0x01C5D4 07:C5C4: F0 30
	CMP #$03					;C - - - - - 0x01C5D6 07:C5C6: C9 03
	BEQ CODE_0EC5CB				;C - - - - - 0x01C5D8 07:C5C8: F0 01
CODE_0EC5CA:
	RTS							;C - - - - - 0x01C5DA 07:C5CA: 60

CODE_0EC5CB:
	LDA DATA_0ECE0F,Y			;C - - - - - 0x01C5DB 07:C5CB: B9 0F CE
	AND #$0F					;C - - - - - 0x01C5DE 07:C5CE: 29 0F
	STA musicTempA				;C - - - - - 0x01C5E0 07:C5D0: 85 E8
	LDA trackVolSQ1,X				;C - - - - - 0x01C5E2 07:C5D2: BD 99 07
	AND #$0F					;C - - - - - 0x01C5E5 07:C5D5: 29 0F
	SEC							;C - - - - - 0x01C5E7 07:C5D7: 38
	SBC musicTempA				;C - - - - - 0x01C5E8 07:C5D8: E5 E8
	BEQ CODE_0EC5DE				;C - - - - - 0x01C5EA 07:C5DA: F0 02
	BPL CODE_0EC648				;C - - - - - 0x01C5EC 07:C5DC: 10 6A
CODE_0EC5DE:
	LDA ram_079F,X				;C - - - - - 0x01C5EE 07:C5DE: BD 9F 07
	BPL CODE_0EC5E7				;C - - - - - 0x01C5F1 07:C5E1: 10 04
		LDA #$12					;C - - - - - 0x01C5F3 07:C5E3: A9 12
		BNE CODE_0EC5E9				;C - - - - - 0x01C5F5 07:C5E5: D0 02
CODE_0EC5E7:
	;Unreached
	LDA #$30					;- - - - - - 0x01C5F7 07:C5E7: A9
CODE_0EC5E9:
	STA musicTempA				;C - - - - - 0x01C5F9 07:C5E9: 85 E8
	DEC ram_079F,X				;C - - - - - 0x01C5FB 07:C5EB: DE 9F 07
	LDA trackVolSQ1,X				;C - - - - - 0x01C5FE 07:C5EE: BD 99 07
	AND #$C0					;C - - - - - 0x01C601 07:C5F1: 29 C0
	JMP CODE_0EC651				;C - - - - - 0x01C603 07:C5F3: 4C 51 C6
CODE_0EC5F6:
	INY							;C - - - - - 0x01C606 07:C5F6: C8
	LDA ram_07A1,X				;C - - - - - 0x01C607 07:C5F7: BD A1 07
	SEC							;C - - - - - 0x01C60A 07:C5FA: 38
	SBC DATA_0ECE0F,Y			;C - - - - - 0x01C60B 07:C5FB: F9 0F CE
	BPL CODE_0EC602				;C - - - - - 0x01C60E 07:C5FE: 10 02
		LDA #$00					;C - - - - - 0x01C610 07:C600: A9 00
CODE_0EC602:
	STA musicTempA				;C - - - - - 0x01C612 07:C602: 85 E8
	DEY							;C - - - - - 0x01C614 07:C604: 88
	LDA DATA_0ECE0F,Y			;C - - - - - 0x01C615 07:C605: B9 0F CE
	AND #$0F					;C - - - - - 0x01C618 07:C608: 29 0F
	STA musicTempB				;C - - - - - 0x01C61A 07:C60A: 85 E9
	LDA trackVolSQ1,X				;C - - - - - 0x01C61C 07:C60C: BD 99 07
	AND #$0F					;C - - - - - 0x01C61F 07:C60F: 29 0F
	SEC							;C - - - - - 0x01C621 07:C611: 38
	SBC musicTempB				;C - - - - - 0x01C622 07:C612: E5 E9
	BEQ CODE_0EC618				;C - - - - - 0x01C624 07:C614: F0 02
	BPL CODE_0EC620				;C - - - - - 0x01C626 07:C616: 10 08
CODE_0EC618:
	INC ram_079F,X				;C - - - - - 0x01C628 07:C618: FE 9F 07
	INC ram_079F,X				;C - - - - - 0x01C62B 07:C61B: FE 9F 07
	BNE CODE_0EC5DE				;C - - - - - 0x01C62E 07:C61E: D0 BE
CODE_0EC620:
	CMP musicTempA				;C - - - - - 0x01C630 07:C620: C5 E8
	BEQ CODE_0EC626				;C - - - - - 0x01C632 07:C622: F0 02
	BCS CODE_0EC648				;C - - - - - 0x01C634 07:C624: B0 22
CODE_0EC626:
	INC ram_079F,X				;C - - - - - 0x01C636 07:C626: FE 9F 07
	LDA musicTempA				;C - - - - - 0x01C639 07:C629: A5 E8
	JMP CODE_0EC648				;C - - - - - 0x01C63B 07:C62B: 4C 48 C6
CODE_0EC62E:
	LDA DATA_0ECE0F,Y			;C - - - - - 0x01C63E 07:C62E: B9 0F CE
	AND #$0F					;C - - - - - 0x01C641 07:C631: 29 0F
	STA musicTempA				;C - - - - - 0x01C643 07:C633: 85 E8
	LDA trackVolSQ1,X				;C - - - - - 0x01C645 07:C635: BD 99 07
	AND #$0F					;C - - - - - 0x01C648 07:C638: 29 0F
	CLC							;C - - - - - 0x01C64A 07:C63A: 18
	ADC musicTempA				;C - - - - - 0x01C64B 07:C63B: 65 E8
	CMP ram_07A1,X				;C - - - - - 0x01C64D 07:C63D: DD A1 07
	BCC CODE_0EC648				;C - - - - - 0x01C650 07:C640: 90 06
	INC ram_079F,X				;C - - - - - 0x01C652 07:C642: FE 9F 07
	LDA ram_07A1,X				;C - - - - - 0x01C655 07:C645: BD A1 07
CODE_0EC648:
	STA musicTempA				;C - - - - - 0x01C658 07:C648: 85 E8
	LDA trackVolSQ1,X				;C - - - - - 0x01C65A 07:C64A: BD 99 07
	AND #$C0					;C - - - - - 0x01C65D 07:C64D: 29 C0
	ORA #$30					;C - - - - - 0x01C65F 07:C64F: 09 30
CODE_0EC651:
	ORA musicTempA				;C - - - - - 0x01C661 07:C651: 05 E8
	STA trackVolSQ1,X				;C - - - - - 0x01C663 07:C653: 9D 99 07
	LDA #CHMASK_VOL					;C - - - - - 0x01C666 07:C656: A9 01
	ORA trackRegMaskSQ1,X				;C - - - - - 0x01C668 07:C658: 1D 98 07
	STA trackRegMaskSQ1,X				;C - - - - - 0x01C66B 07:C65B: 9D 98 07
	RTS							;C - - - - - 0x01C66E 07:C65E: 60

CODE_0EC65F:
	LDA trackRegMaskSQ1,X				;C - - - - - 0x01C66F 07:C65F: BD 98 07
	BEQ CODE_0EC686				;C - - - - - 0x01C672 07:C662: F0 22

	STA musicTempA				;C - - - - - 0x01C674 07:C664: 85 E8
	LDA #CHMASK_NONE					;C - - - - - 0x01C676 07:C666: A9 00
	STA trackRegMaskSQ1,X				;C - - - - - 0x01C678 07:C668: 9D 98 07
	LDA #4					;C - - - - - 0x01C67B 07:C66B: A9 04
	STA musicTempB				;C - - - - - 0x01C67D 07:C66D: 85 E9
CODE_0EC66F:
	;Write to the 4 registers of current channel, if corresponding bit set
	LSR musicTempA				;C - - - - - 0x01C67F 07:C66F: 46 E8
	BCC CODE_0EC680				;C - - - - - 0x01C681 07:C671: 90 0D

	LDA trackVolSQ1,X				;C - - - - - 0x01C683 07:C673: BD 99 07
	STA SQ1_VOL,Y			;C - - - - - 0x01C686 07:C676: 99 00 40
	CPY #$10					;C - - - - - 0x01C689 07:C679: C0 10
	BMI CODE_0EC680				;C - - - - - 0x01C68B 07:C67B: 30 03
CODE_0EC67D:
		;Unreached
		JMP CODE_0EC67D			;- - - - - - 0x01C68D 07:C67D: 4C
CODE_0EC680:
	INX							;C - - - - - 0x01C690 07:C680: E8
	INY							;C - - - - - 0x01C691 07:C681: C8
	DEC musicTempB				;C - - - - - 0x01C692 07:C682: C6 E9
	BNE CODE_0EC66F				;C - - - - - 0x01C694 07:C684: D0 E9
CODE_0EC686:
	RTS							;C - - - - - 0x01C696 07:C686: 60

PlayMusic:
	ORA #MUSIC_PLAYING					;C - - - - - 0x01C697 07:C687: 09 80
	STA musicTrigger				;C - - - - - 0x01C699 07:C689: 85 E0
	ASL							;C - - - - - 0x01C69B 07:C68B: 0A
	TAX							;C - - - - - 0x01C69C 07:C68C: AA

	LDA MusicTable,X			;C - - - - - 0x01C69D 07:C68D: BD 50 CE
	STA musicAdr				;C - - - - - 0x01C6A0 07:C690: 85 EA
	LDA MusicTable+1,X			;C - - - - - 0x01C6A2 07:C692: BD 51 CE
	STA musicAdr+1				;C - - - - - 0x01C6A5 07:C695: 85 EB

	;ram_07F5
	LDY #$09					;C - - - - - 0x01C6A7 07:C697: A0 09
	LDA (musicAdr),Y			;C - - - - - 0x01C6A9 07:C699: B1 EA
	STA ram_07F5				;C - - - - - 0x01C6AB 07:C69B: 8D F5 07

	;Tempo index
	LDY #$00					;C - - - - - 0x01C6AE 07:C69E: A0 00
	LDA (musicAdr),Y			;C - - - - - 0x01C6B0 07:C6A0: B1 EA
	ASL							;C - - - - - 0x01C6B2 07:C6A2: 0A
	TAX							;C - - - - - 0x01C6B3 07:C6A3: AA

	LDA TempoDelayLists,X			;C - - - - - 0x01C6B4 07:C6A4: BD 5F CC
	STA tempoDelaysAdr				;C - - - - - 0x01C6B7 07:C6A7: 85 E3
	LDA TempoDelayLists+1,X			;C - - - - - 0x01C6B9 07:C6A9: BD 60 CC
	STA tempoDelaysAdr+1				;C - - - - - 0x01C6BC 07:C6AC: 85 E4

	INY							;C - - - - - 0x01C6BE 07:C6AE: C8
	LDX #$00					;C - - - - - 0x01C6BF 07:C6AF: A2 00

	;SQ1 sequence
	LDA (musicAdr),Y			;C - - - - - 0x01C6C1 07:C6B1: B1 EA
	STA trackAdrSQ1				;C - - - - - 0x01C6C3 07:C6B3: 8D 90 07
	INY							;C - - - - - 0x01C6C6 07:C6B6: C8
	LDA (musicAdr),Y			;C - - - - - 0x01C6C7 07:C6B7: B1 EA
	STA trackAdrSQ1+1				;C - - - - - 0x01C6C9 07:C6B9: 8D 91 07
	STX trackTimerSQ1				;C - - - - - 0x01C6CC 07:C6BC: 8E 96 07
	STX trackNoteTimerSQ1				;C - - - - - 0x01C6CF 07:C6BF: 8E 97 07
	STX ram_07A1				;C - - - - - 0x01C6D2 07:C6C2: 8E A1 07
	STX ram_079F				;C - - - - - 0x01C6D5 07:C6C5: 8E 9F 07
	STX ram_079E				;C - - - - - 0x01C6D8 07:C6C8: 8E 9E 07
	STX ram_07A2				;C - - - - - 0x01C6DB 07:C6CB: 8E A2 07
	STX ram_07A5				;C - - - - - 0x01C6DE 07:C6CE: 8E A5 07
	INY							;C - - - - - 0x01C6E1 07:C6D1: C8

	;SQ2 sequence
	LDA (musicAdr),Y			;C - - - - - 0x01C6E2 07:C6D2: B1 EA
	STA trackAdrSQ2				;C - - - - - 0x01C6E4 07:C6D4: 8D A8 07
	INY							;C - - - - - 0x01C6E7 07:C6D7: C8
	LDA (musicAdr),Y			;C - - - - - 0x01C6E8 07:C6D8: B1 EA
	STA trackAdrSQ2+1				;C - - - - - 0x01C6EA 07:C6DA: 8D A9 07
	STX trackTimerSQ2				;C - - - - - 0x01C6ED 07:C6DD: 8E AE 07
	STX trackNoteTimerSQ2				;C - - - - - 0x01C6F0 07:C6E0: 8E AF 07
	STX ram_07B9				;C - - - - - 0x01C6F3 07:C6E3: 8E B9 07
	STX ram_07B7				;C - - - - - 0x01C6F6 07:C6E6: 8E B7 07
	STX ram_07B6				;C - - - - - 0x01C6F9 07:C6E9: 8E B6 07
	STX ram_07BA				;C - - - - - 0x01C6FC 07:C6EC: 8E BA 07
	STX ram_07BD				;C - - - - - 0x01C6FF 07:C6EF: 8E BD 07
	INY							;C - - - - - 0x01C702 07:C6F2: C8

	;TRI sequence
	LDA (musicAdr),Y			;C - - - - - 0x01C703 07:C6F3: B1 EA
	STA trackAdrTRI				;C - - - - - 0x01C705 07:C6F5: 8D C0 07
	INY							;C - - - - - 0x01C708 07:C6F8: C8
	LDA (musicAdr),Y			;C - - - - - 0x01C709 07:C6F9: B1 EA
	STA trackAdrTRI+1				;C - - - - - 0x01C70B 07:C6FB: 8D C1 07
	STX trackTimerTRI				;C - - - - - 0x01C70E 07:C6FE: 8E C6 07
	STX trackNoteTimerTRI				;C - - - - - 0x01C711 07:C701: 8E C7 07
	STX ram_07CE				;C - - - - - 0x01C714 07:C704: 8E CE 07
	INY							;C - - - - - 0x01C717 07:C707: C8

	;NOISE sequence
	LDA (musicAdr),Y			;C - - - - - 0x01C718 07:C708: B1 EA
	STA trackAdrNOISE				;C - - - - - 0x01C71A 07:C70A: 8D CF 07
	INY							;C - - - - - 0x01C71D 07:C70D: C8
	LDA (musicAdr),Y			;C - - - - - 0x01C71E 07:C70E: B1 EA
	STA trackAdrNOISE+1				;C - - - - - 0x01C720 07:C710: 8D D0 07
	STX trackTimerNOISE				;C - - - - - 0x01C723 07:C713: 8E D5 07
	STX trackNoteTimerNOISE				;C - - - - - 0x01C726 07:C716: 8E D6 07
	STX ram_07F2				;C - - - - - 0x01C729 07:C719: 8E F2 07
	STX ram_07F1				;C - - - - - 0x01C72C 07:C71C: 8E F1 07

	LDA #$30					;C - - - - - 0x01C72F 07:C71F: A9 30
	LDX #CHMASK_VOL					;C - - - - - 0x01C731 07:C721: A2 01
	STA trackVolSQ1				;C - - - - - 0x01C733 07:C723: 8D 99 07
	STX trackRegMaskSQ1				;C - - - - - 0x01C736 07:C726: 8E 98 07
	STA trackVolSQ2				;C - - - - - 0x01C739 07:C729: 8D B1 07
	STX trackRegMaskSQ2				;C - - - - - 0x01C73C 07:C72C: 8E B0 07

	LDA #$80					;C - - - - - 0x01C73F 07:C72F: A9 80
	STA TRI_LINEAR				;C - - - - - 0x01C741 07:C731: 8D 08 40
	RTS							;C - - - - - 0x01C744 07:C734: 60

PlaySound:
	ORA #SOUND_PLAYING					;C - - - - - 0x01C745 07:C735: 09 80
	STA soundTrigger				;C - - - - - 0x01C747 07:C737: 85 E1
PlaySound_AfterTrigger:
	ASL							;C - - - - - 0x01C749 07:C739: 0A
	ASL							;C - - - - - 0x01C74A 07:C73A: 0A
	TAX							;C - - - - - 0x01C74B 07:C73B: AA
	LDY #$00					;C - - - - - 0x01C74C 07:C73C: A0 00
	LDA SoundTable,X			;C - - - - - 0x01C74E 07:C73E: BD 80 CE
	ORA SoundTable+1,X			;C - - - - - 0x01C751 07:C741: 1D 81 CE
	BEQ CODE_0EC755				;C - - - - - 0x01C754 07:C744: F0 0F
		LDA SoundTable,X			;C - - - - - 0x01C756 07:C746: BD 80 CE
		STA soundAdrSQ2				;C - - - - - 0x01C759 07:C749: 8D D7 07
		LDA SoundTable+1,X			;C - - - - - 0x01C75C 07:C74C: BD 81 CE
		STA soundAdrSQ2+1				;C - - - - - 0x01C75F 07:C74F: 8D D8 07
		STY soundTimerSQ2				;C - - - - - 0x01C762 07:C752: 8C DD 07
CODE_0EC755:
	LDA SoundTable+2,X			;C - - - - - 0x01C765 07:C755: BD 82 CE
	ORA SoundTable+3,X			;C - - - - - 0x01C768 07:C758: 1D 83 CE
	BEQ CODE_0EC76C				;C - - - - - 0x01C76B 07:C75B: F0 0F
		LDA SoundTable+2,X			;C - - - - - 0x01C76D 07:C75D: BD 82 CE
		STA soundAdrNOISE				;C - - - - - 0x01C770 07:C760: 8D E4 07
		LDA SoundTable+3,X			;C - - - - - 0x01C773 07:C763: BD 83 CE
		STA soundAdrNOISE+1				;C - - - - - 0x01C776 07:C766: 8D E5 07
		STY soundTimerNOISE				;C - - - - - 0x01C779 07:C769: 8C EA 07
CODE_0EC76C:
	RTS							;C - - - - - 0x01C77C 07:C76C: 60

JingleUpdate:
	LDA jingleTrigger				;C - - - - - 0x01C77D 07:C76D: A5 E2
	BNE @nonzero				;C - - - - - 0x01C77F 07:C76F: D0 12
		;Zero
		LDA #snSilence_ID					;C - - - - - 0x01C781 07:C771: A9 00
		JSR PlaySound_AfterTrigger				;C - - - - - 0x01C783 07:C773: 20 39 C7

		LDA #CHMASK_VOL|CHMASK_SWEEP|CHMASK_LO|CHMASK_HI					;C - - - - - 0x01C786 07:C776: A9 0F
		STA trackRegMaskSQ1				;C - - - - - 0x01C788 07:C778: 8D 98 07
		STA trackRegMaskSQ2				;C - - - - - 0x01C78B 07:C77B: 8D B0 07
		STA trackRegMaskTRI				;C - - - - - 0x01C78E 07:C77E: 8D C8 07
		BNE @updatetrigger				;C - - - - - 0x01C791 07:C781: D0 29
@nonzero:
	CMP #jnPause_ID					;C - - - - - 0x01C793 07:C783: C9 01
	BNE @end				;C - - - - - 0x01C795 07:C785: D0 2B

	LDA #.LOBYTE(jnPause)					;C - - - - - 0x01C797 07:C787: A9 F4
	STA soundAdrSQ2				;C - - - - - 0x01C799 07:C789: 8D D7 07
	LDA #.HIBYTE(jnPause)					;C - - - - - 0x01C79C 07:C78C: A9 CD
	STA soundAdrSQ2+1				;C - - - - - 0x01C79E 07:C78E: 8D D8 07
	;Cancelled out by pause sound effect

	LDA #$00					;C - - - - - 0x01C7A1 07:C791: A9 00
	STA soundTimerSQ2				;C - - - - - 0x01C7A3 07:C793: 8D DD 07
	STA soundAdrNOISE				;C - - - - - 0x01C7A6 07:C796: 8D E4 07
	STA soundAdrNOISE+1				;C - - - - - 0x01C7A9 07:C799: 8D E5 07

	LDA #$30					;C - - - - - 0x01C7AC 07:C79C: A9 30
	STA SQ1_VOL				;C - - - - - 0x01C7AE 07:C79E: 8D 00 40
	STA SQ2_VOL				;C - - - - - 0x01C7B1 07:C7A1: 8D 04 40
	STA NOISE_VOL				;C - - - - - 0x01C7B4 07:C7A4: 8D 0C 40
	LDA #$80					;C - - - - - 0x01C7B7 07:C7A7: A9 80
	STA TRI_LINEAR				;C - - - - - 0x01C7B9 07:C7A9: 8D 08 40
@updatetrigger:
	LDA #JINGLE_PLAYING					;C - - - - - 0x01C7BC 07:C7AC: A9 80
	ORA jingleTrigger				;C - - - - - 0x01C7BE 07:C7AE: 05 E2
	STA jingleTrigger				;C - - - - - 0x01C7C0 07:C7B0: 85 E2
@end:
	RTS							;C - - - - - 0x01C7C2 07:C7B2: 60

CODE_0EC7B3:
	LDA ram_07A2,X				;C - - - - - 0x01C7C3 07:C7B3: BD A2 07
	BPL CODE_0EC822				;C - - - - - 0x01C7C6 07:C7B6: 10 6A
	LDY ram_07A3,X				;C - - - - - 0x01C7C8 07:C7B8: BC A3 07
	BMI CODE_0EC815				;C - - - - - 0x01C7CB 07:C7BB: 30 58

	CPX #$00					;C - - - - - 0x01C7CD 07:C7BD: E0 00
	BNE CODE_0EC7C9				;C - - - - - 0x01C7CF 07:C7BF: D0 08
		LDA musicUnkAdrA				;C - - - - - 0x01C7D1 07:C7C1: A5 EC
		STA musicAdr				;C - - - - - 0x01C7D3 07:C7C3: 85 EA
		LDA musicUnkAdrA+1				;C - - - - - 0x01C7D5 07:C7C5: A5 ED
		BNE CODE_0EC7CF				;C - - - - - 0x01C7D7 07:C7C7: D0 06
CODE_0EC7C9:
	LDA musicUnkAdrB				;C - - - - - 0x01C7D9 07:C7C9: A5 EE
	STA musicAdr				;C - - - - - 0x01C7DB 07:C7CB: 85 EA
	LDA musicUnkAdrB+1				;C - - - - - 0x01C7DD 07:C7CD: A5 EF
CODE_0EC7CF:
	STA musicAdr+1				;C - - - - - 0x01C7DF 07:C7CF: 85 EB

	LDA (musicAdr),Y			;C - - - - - 0x01C7E1 07:C7D1: B1 EA
	BMI CODE_0EC7E4				;C - - - - - 0x01C7E3 07:C7D3: 30 0F
		CLC							;C - - - - - 0x01C7E5 07:C7D5: 18
		ADC ram_07A6,X				;C - - - - - 0x01C7E6 07:C7D6: 7D A6 07
		STA trackLoSQ1,X				;C - - - - - 0x01C7E9 07:C7D9: 9D 9B 07
		LDA ram_07A7,X				;C - - - - - 0x01C7EC 07:C7DC: BD A7 07
		ADC #$00					;C - - - - - 0x01C7EF 07:C7DF: 69 00
		JMP CODE_0EC7F6				;C - - - - - 0x01C7F1 07:C7E1: 4C F6 C7
CODE_0EC7E4:
	AND #$7F					;C - - - - - 0x01C7F4 07:C7E4: 29 7F
	STA musicTempA				;C - - - - - 0x01C7F6 07:C7E6: 85 E8
	LDA ram_07A6,X				;C - - - - - 0x01C7F8 07:C7E8: BD A6 07
	SEC							;C - - - - - 0x01C7FB 07:C7EB: 38
	SBC musicTempA				;C - - - - - 0x01C7FC 07:C7EC: E5 E8
	STA trackLoSQ1,X				;C - - - - - 0x01C7FE 07:C7EE: 9D 9B 07
	LDA ram_07A7,X				;C - - - - - 0x01C801 07:C7F1: BD A7 07
	SBC #$00					;C - - - - - 0x01C804 07:C7F4: E9 00
CODE_0EC7F6:
	CMP trackHiSQ1,X				;C - - - - - 0x01C806 07:C7F6: DD 9C 07
	BEQ CODE_0EC802				;C - - - - - 0x01C809 07:C7F9: F0 07
		STA trackHiSQ1,X				;C - - - - - 0x01C80B 07:C7FB: 9D 9C 07
		LDA #CHMASK_LO|CHMASK_HI					;C - - - - - 0x01C80E 07:C7FE: A9 0C
		BNE CODE_0EC804				;C - - - - - 0x01C810 07:C800: D0 02
CODE_0EC802:
	LDA #CHMASK_LO					;C - - - - - 0x01C812 07:C802: A9 04
CODE_0EC804:
	ORA trackRegMaskSQ1,X				;C - - - - - 0x01C814 07:C804: 1D 98 07
	STA trackRegMaskSQ1,X				;C - - - - - 0x01C817 07:C807: 9D 98 07
	INY							;C - - - - - 0x01C81A 07:C80A: C8
	LDA (musicAdr),Y			;C - - - - - 0x01C81B 07:C80B: B1 EA
	CMP #$FF					;C - - - - - 0x01C81D 07:C80D: C9 FF
	BEQ CODE_0EC81D				;C - - - - - 0x01C81F 07:C80F: F0 0C
	TYA							;C - - - - - 0x01C821 07:C811: 98
	JMP CODE_0EC81F				;C - - - - - 0x01C822 07:C812: 4C 1F C8
CODE_0EC815:
	TYA							;C - - - - - 0x01C825 07:C815: 98
	SEC							;C - - - - - 0x01C826 07:C816: 38
	SBC #$01					;C - - - - - 0x01C827 07:C817: E9 01
	CMP #$80					;C - - - - - 0x01C829 07:C819: C9 80
	BNE CODE_0EC81F				;C - - - - - 0x01C82B 07:C81B: D0 02
CODE_0EC81D:
	LDA #$00					;C - - - - - 0x01C82D 07:C81D: A9 00
CODE_0EC81F:
	STA ram_07A3,X				;C - - - - - 0x01C82F 07:C81F: 9D A3 07
CODE_0EC822:
	RTS							;C - - - - - 0x01C832 07:C822: 60

DATA_0EC823:
	;DMC samples in here?
	;Size is $3B8 and the total size of samples should be around $340 according to the DMC table
	;Not placed at $C040, however
	.byte $00					;- - - - - - 0x01C833 07:C823: 00
	.byte $00					;- - - - - - 0x01C834 07:C824: 00
	.byte $00					;- - - - - - 0x01C835 07:C825: 00
	.byte $00					;- - - - - - 0x01C836 07:C826: 00
	.byte $00					;- - - - - - 0x01C837 07:C827: 00
	.byte $00					;- - - - - - 0x01C838 07:C828: 00
	.byte $00					;- - - - - - 0x01C839 07:C829: 00
	.byte $00					;- - - - - - 0x01C83A 07:C82A: 00
	.byte $AA					;- - - - - - 0x01C83B 07:C82B: AA
	.byte $AA					;- - - - - - 0x01C83C 07:C82C: AA
	.byte $AA					;- - - - - - 0x01C83D 07:C82D: AA
	.byte $AA					;- - - - - - 0x01C83E 07:C82E: AA
	.byte $AA					;- - - - - - 0x01C83F 07:C82F: AA
	.byte $AF					;- - - - - - 0x01C840 07:C830: AF
	.byte $F0					;- - - - - - 0x01C841 07:C831: F0
	.byte $9E					;- - - - - - 0x01C842 07:C832: 9E
	.byte $FE					;- - - - - - 0x01C843 07:C833: FE
	.byte $FF					;- - - - - - 0x01C844 07:C834: FF
	.byte $CD					;- - - - - - 0x01C845 07:C835: CD
	.byte $FF					;- - - - - - 0x01C846 07:C836: FF
	.byte $DF					;- - - - - - 0x01C847 07:C837: DF
	.byte $FF					;- - - - - - 0x01C848 07:C838: FF
	.byte $E7					;- - - - - - 0x01C849 07:C839: E7
	.byte $F7					;- - - - - - 0x01C84A 07:C83A: F7
	.byte $EF					;- - - - - - 0x01C84B 07:C83B: EF
	.byte $FD					;- - - - - - 0x01C84C 07:C83C: FD
	.byte $DF					;- - - - - - 0x01C84D 07:C83D: DF
	.byte $DF					;- - - - - - 0x01C84E 07:C83E: DF
	.byte $DF					;- - - - - - 0x01C84F 07:C83F: DF
	.byte $CF					;- - - - - - 0x01C850 07:C840: CF
	.byte $FF					;- - - - - - 0x01C851 07:C841: FF
	.byte $FF					;- - - - - - 0x01C852 07:C842: FF
	.byte $BF					;- - - - - - 0x01C853 07:C843: BF
	.byte $DF					;- - - - - - 0x01C854 07:C844: DF
	.byte $FF					;- - - - - - 0x01C855 07:C845: FF
	.byte $FF					;- - - - - - 0x01C856 07:C846: FF
	.byte $20					;- - - - - - 0x01C857 07:C847: 20
	.byte $32					;- - - - - - 0x01C858 07:C848: 32
	.byte $21					;- - - - - - 0x01C859 07:C849: 21
	.byte $10					;- - - - - - 0x01C85A 07:C84A: 10
	.byte $20					;- - - - - - 0x01C85B 07:C84B: 20
	.byte $10					;- - - - - - 0x01C85C 07:C84C: 10
	.byte $28					;- - - - - - 0x01C85D 07:C84D: 28
	.byte $09					;- - - - - - 0x01C85E 07:C84E: 09
	.byte $A0					;- - - - - - 0x01C85F 07:C84F: A0
	.byte $20					;- - - - - - 0x01C860 07:C850: 20
	.byte $11					;- - - - - - 0x01C861 07:C851: 11
	.byte $32					;- - - - - - 0x01C862 07:C852: 32
	.byte $12					;- - - - - - 0x01C863 07:C853: 12
	.byte $31					;- - - - - - 0x01C864 07:C854: 31
	.byte $02					;- - - - - - 0x01C865 07:C855: 02
	.byte $11					;- - - - - - 0x01C866 07:C856: 11
	.byte $23					;- - - - - - 0x01C867 07:C857: 23
	.byte $02					;- - - - - - 0x01C868 07:C858: 02
	.byte $01					;- - - - - - 0x01C869 07:C859: 01
	.byte $10					;- - - - - - 0x01C86A 07:C85A: 10
	.byte $FF					;- - - - - - 0x01C86B 07:C85B: FF
	.byte $ED					;- - - - - - 0x01C86C 07:C85C: ED
	.byte $7F					;- - - - - - 0x01C86D 07:C85D: 7F
	.byte $CE					;- - - - - - 0x01C86E 07:C85E: CE
	.byte $FF					;- - - - - - 0x01C86F 07:C85F: FF
	.byte $DF					;- - - - - - 0x01C870 07:C860: DF
	.byte $EE					;- - - - - - 0x01C871 07:C861: EE
	.byte $DD					;- - - - - - 0x01C872 07:C862: DD
	.byte $8C					;- - - - - - 0x01C873 07:C863: 8C
	.byte $A6					;- - - - - - 0x01C874 07:C864: A6
	.byte $55					;- - - - - - 0x01C875 07:C865: 55
	.byte $4D					;- - - - - - 0x01C876 07:C866: 4D
	.byte $16					;- - - - - - 0x01C877 07:C867: 16
	.byte $8C					;- - - - - - 0x01C878 07:C868: 8C
	.byte $A3					;- - - - - - 0x01C879 07:C869: A3
	.byte $45					;- - - - - - 0x01C87A 07:C86A: 45
	.byte $00					;- - - - - - 0x01C87B 07:C86B: 00
	.byte $00					;- - - - - - 0x01C87C 07:C86C: 00
	.byte $00					;- - - - - - 0x01C87D 07:C86D: 00
	.byte $00					;- - - - - - 0x01C87E 07:C86E: 00
	.byte $00					;- - - - - - 0x01C87F 07:C86F: 00
	.byte $00					;- - - - - - 0x01C880 07:C870: 00
	.byte $00					;- - - - - - 0x01C881 07:C871: 00
	.byte $00					;- - - - - - 0x01C882 07:C872: 00
	.byte $FE					;- - - - - - 0x01C883 07:C873: FE
	.byte $FF					;- - - - - - 0x01C884 07:C874: FF
	.byte $DE					;- - - - - - 0x01C885 07:C875: DE
	.byte $FF					;- - - - - - 0x01C886 07:C876: FF
	.byte $E3					;- - - - - - 0x01C887 07:C877: E3
	.byte $EF					;- - - - - - 0x01C888 07:C878: EF
	.byte $8C					;- - - - - - 0x01C889 07:C879: 8C
	.byte $44					;- - - - - - 0x01C88A 07:C87A: 44
	.byte $34					;- - - - - - 0x01C88B 07:C87B: 34
	.byte $12					;- - - - - - 0x01C88C 07:C87C: 12
	.byte $53					;- - - - - - 0x01C88D 07:C87D: 53
	.byte $21					;- - - - - - 0x01C88E 07:C87E: 21
	.byte $32					;- - - - - - 0x01C88F 07:C87F: 32
	.byte $33					;- - - - - - 0x01C890 07:C880: 33
	.byte $1C					;- - - - - - 0x01C891 07:C881: 1C
	.byte $21					;- - - - - - 0x01C892 07:C882: 21
	.byte $00					;- - - - - - 0x01C893 07:C883: 00
	.byte $23					;- - - - - - 0x01C894 07:C884: 23
	.byte $00					;- - - - - - 0x01C895 07:C885: 00
	.byte $20					;- - - - - - 0x01C896 07:C886: 20
	.byte $00					;- - - - - - 0x01C897 07:C887: 00
	.byte $12					;- - - - - - 0x01C898 07:C888: 12
	.byte $03					;- - - - - - 0x01C899 07:C889: 03
	.byte $00					;- - - - - - 0x01C89A 07:C88A: 00
	.byte $FE					;- - - - - - 0x01C89B 07:C88B: FE
	.byte $EF					;- - - - - - 0x01C89C 07:C88C: EF
	.byte $DF					;- - - - - - 0x01C89D 07:C88D: DF
	.byte $F7					;- - - - - - 0x01C89E 07:C88E: F7
	.byte $DE					;- - - - - - 0x01C89F 07:C88F: DE
	.byte $7F					;- - - - - - 0x01C8A0 07:C890: 7F
	.byte $FF					;- - - - - - 0x01C8A1 07:C891: FF
	.byte $FF					;- - - - - - 0x01C8A2 07:C892: FF
	.byte $FF					;- - - - - - 0x01C8A3 07:C893: FF
	.byte $67					;- - - - - - 0x01C8A4 07:C894: 67
	.byte $EE					;- - - - - - 0x01C8A5 07:C895: EE
	.byte $FF					;- - - - - - 0x01C8A6 07:C896: FF
	.byte $FF					;- - - - - - 0x01C8A7 07:C897: FF
	.byte $DD					;- - - - - - 0x01C8A8 07:C898: DD
	.byte $FF					;- - - - - - 0x01C8A9 07:C899: FF
	.byte $FF					;- - - - - - 0x01C8AA 07:C89A: FF
	.byte $21					;- - - - - - 0x01C8AB 07:C89B: 21
	.byte $50					;- - - - - - 0x01C8AC 07:C89C: 50
	.byte $23					;- - - - - - 0x01C8AD 07:C89D: 23
	.byte $32					;- - - - - - 0x01C8AE 07:C89E: 32
	.byte $10					;- - - - - - 0x01C8AF 07:C89F: 10
	.byte $21					;- - - - - - 0x01C8B0 07:C8A0: 21
	.byte $30					;- - - - - - 0x01C8B1 07:C8A1: 30
	.byte $80					;- - - - - - 0x01C8B2 07:C8A2: 80
	.byte $C3					;- - - - - - 0x01C8B3 07:C8A3: C3
	.byte $30					;- - - - - - 0x01C8B4 07:C8A4: 30
	.byte $20					;- - - - - - 0x01C8B5 07:C8A5: 20
	.byte $12					;- - - - - - 0x01C8B6 07:C8A6: 12
	.byte $03					;- - - - - - 0x01C8B7 07:C8A7: 03
	.byte $12					;- - - - - - 0x01C8B8 07:C8A8: 12
	.byte $10					;- - - - - - 0x01C8B9 07:C8A9: 10
	.byte $00					;- - - - - - 0x01C8BA 07:C8AA: 00
	.byte $DF					;- - - - - - 0x01C8BB 07:C8AB: DF
	.byte $E7					;- - - - - - 0x01C8BC 07:C8AC: E7
	.byte $DC					;- - - - - - 0x01C8BD 07:C8AD: DC
	.byte $FF					;- - - - - - 0x01C8BE 07:C8AE: FF
	.byte $BF					;- - - - - - 0x01C8BF 07:C8AF: BF
	.byte $DF					;- - - - - - 0x01C8C0 07:C8B0: DF
	.byte $BB					;- - - - - - 0x01C8C1 07:C8B1: BB
	.byte $FF					;- - - - - - 0x01C8C2 07:C8B2: FF
	.byte $CF					;- - - - - - 0x01C8C3 07:C8B3: CF
	.byte $DE					;- - - - - - 0x01C8C4 07:C8B4: DE
	.byte $FF					;- - - - - - 0x01C8C5 07:C8B5: FF
	.byte $EC					;- - - - - - 0x01C8C6 07:C8B6: EC
	.byte $FF					;- - - - - - 0x01C8C7 07:C8B7: FF
	.byte $CD					;- - - - - - 0x01C8C8 07:C8B8: CD
	.byte $FE					;- - - - - - 0x01C8C9 07:C8B9: FE
	.byte $FF					;- - - - - - 0x01C8CA 07:C8BA: FF
	.byte $10					;- - - - - - 0x01C8CB 07:C8BB: 10
	.byte $00					;- - - - - - 0x01C8CC 07:C8BC: 00
	.byte $12					;- - - - - - 0x01C8CD 07:C8BD: 12
	.byte $02					;- - - - - - 0x01C8CE 07:C8BE: 02
	.byte $80					;- - - - - - 0x01C8CF 07:C8BF: 80
	.byte $98					;- - - - - - 0x01C8D0 07:C8C0: 98
	.byte $A2					;- - - - - - 0x01C8D1 07:C8C1: A2
	.byte $00					;- - - - - - 0x01C8D2 07:C8C2: 00
	.byte $02					;- - - - - - 0x01C8D3 07:C8C3: 02
	.byte $32					;- - - - - - 0x01C8D4 07:C8C4: 32
	.byte $00					;- - - - - - 0x01C8D5 07:C8C5: 00
	.byte $10					;- - - - - - 0x01C8D6 07:C8C6: 10
	.byte $A0					;- - - - - - 0x01C8D7 07:C8C7: A0
	.byte $00					;- - - - - - 0x01C8D8 07:C8C8: 00
	.byte $21					;- - - - - - 0x01C8D9 07:C8C9: 21
	.byte $00					;- - - - - - 0x01C8DA 07:C8CA: 00
	.byte $EC					;- - - - - - 0x01C8DB 07:C8CB: EC
	.byte $FE					;- - - - - - 0x01C8DC 07:C8CC: FE
	.byte $DF					;- - - - - - 0x01C8DD 07:C8CD: DF
	.byte $FD					;- - - - - - 0x01C8DE 07:C8CE: FD
	.byte $CF					;- - - - - - 0x01C8DF 07:C8CF: CF
	.byte $EC					;- - - - - - 0x01C8E0 07:C8D0: EC
	.byte $BD					;- - - - - - 0x01C8E1 07:C8D1: BD
	.byte $DC					;- - - - - - 0x01C8E2 07:C8D2: DC
	.byte $BE					;- - - - - - 0x01C8E3 07:C8D3: BE
	.byte $DF					;- - - - - - 0x01C8E4 07:C8D4: DF
	.byte $FE					;- - - - - - 0x01C8E5 07:C8D5: FE
	.byte $FB					;- - - - - - 0x01C8E6 07:C8D6: FB
	.byte $DE					;- - - - - - 0x01C8E7 07:C8D7: DE
	.byte $FF					;- - - - - - 0x01C8E8 07:C8D8: FF
	.byte $BE					;- - - - - - 0x01C8E9 07:C8D9: BE
	.byte $DE					;- - - - - - 0x01C8EA 07:C8DA: DE
	.byte $1D					;- - - - - - 0x01C8EB 07:C8DB: 1D
	.byte $1E					;- - - - - - 0x01C8EC 07:C8DC: 1E
	.byte $7D					;- - - - - - 0x01C8ED 07:C8DD: 7D
	.byte $9E					;- - - - - - 0x01C8EE 07:C8DE: 9E
	.byte $7F					;- - - - - - 0x01C8EF 07:C8DF: 7F
	.byte $E7					;- - - - - - 0x01C8F0 07:C8E0: E7
	.byte $EF					;- - - - - - 0x01C8F1 07:C8E1: EF
	.byte $3F					;- - - - - - 0x01C8F2 07:C8E2: 3F
	.byte $7F					;- - - - - - 0x01C8F3 07:C8E3: 7F
	.byte $3F					;- - - - - - 0x01C8F4 07:C8E4: 3F
	.byte $87					;- - - - - - 0x01C8F5 07:C8E5: 87
	.byte $DC					;- - - - - - 0x01C8F6 07:C8E6: DC
	.byte $63					;- - - - - - 0x01C8F7 07:C8E7: 63
	.byte $18					;- - - - - - 0x01C8F8 07:C8E8: 18
	.byte $73					;- - - - - - 0x01C8F9 07:C8E9: 73
	.byte $0C					;- - - - - - 0x01C8FA 07:C8EA: 0C
	.byte $23					;- - - - - - 0x01C8FB 07:C8EB: 23
	.byte $18					;- - - - - - 0x01C8FC 07:C8EC: 18
	.byte $88					;- - - - - - 0x01C8FD 07:C8ED: 88
	.byte $53					;- - - - - - 0x01C8FE 07:C8EE: 53
	.byte $11					;- - - - - - 0x01C8FF 07:C8EF: 11
	.byte $06					;- - - - - - 0x01C900 07:C8F0: 06
	.byte $0D					;- - - - - - 0x01C901 07:C8F1: 0D
	.byte $62					;- - - - - - 0x01C902 07:C8F2: 62
	.byte $03					;- - - - - - 0x01C903 07:C8F3: 03
	.byte $3C					;- - - - - - 0x01C904 07:C8F4: 3C
	.byte $33					;- - - - - - 0x01C905 07:C8F5: 33
	.byte $24					;- - - - - - 0x01C906 07:C8F6: 24
	.byte $E7					;- - - - - - 0x01C907 07:C8F7: E7
	.byte $7C					;- - - - - - 0x01C908 07:C8F8: 7C
	.byte $AE					;- - - - - - 0x01C909 07:C8F9: AE
	.byte $F3					;- - - - - - 0x01C90A 07:C8FA: F3
	.byte $E7					;- - - - - - 0x01C90B 07:C8FB: E7
	.byte $1F					;- - - - - - 0x01C90C 07:C8FC: 1F
	.byte $F8					;- - - - - - 0x01C90D 07:C8FD: F8
	.byte $F0					;- - - - - - 0x01C90E 07:C8FE: F0
	.byte $F3					;- - - - - - 0x01C90F 07:C8FF: F3
	.byte $CF					;- - - - - - 0x01C910 07:C900: CF
	.byte $71					;- - - - - - 0x01C911 07:C901: 71
	.byte $AE					;- - - - - - 0x01C912 07:C902: AE
	.byte $1C					;- - - - - - 0x01C913 07:C903: 1C
	.byte $8E					;- - - - - - 0x01C914 07:C904: 8E
	.byte $CF					;- - - - - - 0x01C915 07:C905: CF
	.byte $08					;- - - - - - 0x01C916 07:C906: 08
	.byte $CE					;- - - - - - 0x01C917 07:C907: CE
	.byte $0C					;- - - - - - 0x01C918 07:C908: 0C
	.byte $CC					;- - - - - - 0x01C919 07:C909: CC
	.byte $18					;- - - - - - 0x01C91A 07:C90A: 18
	.byte $31					;- - - - - - 0x01C91B 07:C90B: 31
	.byte $C2					;- - - - - - 0x01C91C 07:C90C: C2
	.byte $40					;- - - - - - 0x01C91D 07:C90D: 40
	.byte $E1					;- - - - - - 0x01C91E 07:C90E: E1
	.byte $8E					;- - - - - - 0x01C91F 07:C90F: 8E
	.byte $18					;- - - - - - 0x01C920 07:C910: 18
	.byte $2C					;- - - - - - 0x01C921 07:C911: 2C
	.byte $D1					;- - - - - - 0x01C922 07:C912: D1
	.byte $91					;- - - - - - 0x01C923 07:C913: 91
	.byte $ED					;- - - - - - 0x01C924 07:C914: ED
	.byte $9F					;- - - - - - 0x01C925 07:C915: 9F
	.byte $0F					;- - - - - - 0x01C926 07:C916: 0F
	.byte $CF					;- - - - - - 0x01C927 07:C917: CF
	.byte $A7					;- - - - - - 0x01C928 07:C918: A7
	.byte $3C					;- - - - - - 0x01C929 07:C919: 3C
	.byte $FF					;- - - - - - 0x01C92A 07:C91A: FF
	.byte $93					;- - - - - - 0x01C92B 07:C91B: 93
	.byte $C7					;- - - - - - 0x01C92C 07:C91C: C7
	.byte $CC					;- - - - - - 0x01C92D 07:C91D: CC
	.byte $F5					;- - - - - - 0x01C92E 07:C91E: F5
	.byte $38					;- - - - - - 0x01C92F 07:C91F: 38
	.byte $39					;- - - - - - 0x01C930 07:C920: 39
	.byte $B8					;- - - - - - 0x01C931 07:C921: B8
	.byte $19					;- - - - - - 0x01C932 07:C922: 19
	.byte $47					;- - - - - - 0x01C933 07:C923: 47
	.byte $88					;- - - - - - 0x01C934 07:C924: 88
	.byte $46					;- - - - - - 0x01C935 07:C925: 46
	.byte $D6					;- - - - - - 0x01C936 07:C926: D6
	.byte $04					;- - - - - - 0x01C937 07:C927: 04
	.byte $76					;- - - - - - 0x01C938 07:C928: 76
	.byte $31					;- - - - - - 0x01C939 07:C929: 31
	.byte $85					;- - - - - - 0x01C93A 07:C92A: 85
	.byte $1C					;- - - - - - 0x01C93B 07:C92B: 1C
	.byte $58					;- - - - - - 0x01C93C 07:C92C: 58
	.byte $63					;- - - - - - 0x01C93D 07:C92D: 63
	.byte $9C					;- - - - - - 0x01C93E 07:C92E: 9C
	.byte $61					;- - - - - - 0x01C93F 07:C92F: 61
	.byte $79					;- - - - - - 0x01C940 07:C930: 79
	.byte $8C					;- - - - - - 0x01C941 07:C931: 8C
	.byte $F3					;- - - - - - 0x01C942 07:C932: F3
	.byte $98					;- - - - - - 0x01C943 07:C933: 98
	.byte $F7					;- - - - - - 0x01C944 07:C934: F7
	.byte $78					;- - - - - - 0x01C945 07:C935: 78
	.byte $27					;- - - - - - 0x01C946 07:C936: 27
	.byte $C7					;- - - - - - 0x01C947 07:C937: C7
	.byte $9F					;- - - - - - 0x01C948 07:C938: 9F
	.byte $64					;- - - - - - 0x01C949 07:C939: 64
	.byte $77					;- - - - - - 0x01C94A 07:C93A: 77
	.byte $39					;- - - - - - 0x01C94B 07:C93B: 39
	.byte $0F					;- - - - - - 0x01C94C 07:C93C: 0F
	.byte $8C					;- - - - - - 0x01C94D 07:C93D: 8C
	.byte $F5					;- - - - - - 0x01C94E 07:C93E: F5
	.byte $86					;- - - - - - 0x01C94F 07:C93F: 86
	.byte $2F					;- - - - - - 0x01C950 07:C940: 2F
	.byte $91					;- - - - - - 0x01C951 07:C941: 91
	.byte $8C					;- - - - - - 0x01C952 07:C942: 8C
	.byte $71					;- - - - - - 0x01C953 07:C943: 71
	.byte $C7					;- - - - - - 0x01C954 07:C944: C7
	.byte $21					;- - - - - - 0x01C955 07:C945: 21
	.byte $E1					;- - - - - - 0x01C956 07:C946: E1
	.byte $C4					;- - - - - - 0x01C957 07:C947: C4
	.byte $19					;- - - - - - 0x01C958 07:C948: 19
	.byte $8C					;- - - - - - 0x01C959 07:C949: 8C
	.byte $41					;- - - - - - 0x01C95A 07:C94A: 41
	.byte $66					;- - - - - - 0x01C95B 07:C94B: 66
	.byte $07					;- - - - - - 0x01C95C 07:C94C: 07
	.byte $A6					;- - - - - - 0x01C95D 07:C94D: A6
	.byte $2E					;- - - - - - 0x01C95E 07:C94E: 2E
	.byte $8A					;- - - - - - 0x01C95F 07:C94F: 8A
	.byte $E7					;- - - - - - 0x01C960 07:C950: E7
	.byte $43					;- - - - - - 0x01C961 07:C951: 43
	.byte $CF					;- - - - - - 0x01C962 07:C952: CF
	.byte $9E					;- - - - - - 0x01C963 07:C953: 9E
	.byte $1F					;- - - - - - 0x01C964 07:C954: 1F
	.byte $9E					;- - - - - - 0x01C965 07:C955: 9E
	.byte $71					;- - - - - - 0x01C966 07:C956: 71
	.byte $F3					;- - - - - - 0x01C967 07:C957: F3
	.byte $E3					;- - - - - - 0x01C968 07:C958: E3
	.byte $B7					;- - - - - - 0x01C969 07:C959: B7
	.byte $18					;- - - - - - 0x01C96A 07:C95A: 18
	.byte $FC					;- - - - - - 0x01C96B 07:C95B: FC
	.byte $63					;- - - - - - 0x01C96C 07:C95C: 63
	.byte $C3					;- - - - - - 0x01C96D 07:C95D: C3
	.byte $18					;- - - - - - 0x01C96E 07:C95E: 18
	.byte $C3					;- - - - - - 0x01C96F 07:C95F: C3
	.byte $B0					;- - - - - - 0x01C970 07:C960: B0
	.byte $E0					;- - - - - - 0x01C971 07:C961: E0
	.byte $E3					;- - - - - - 0x01C972 07:C962: E3
	.byte $0F					;- - - - - - 0x01C973 07:C963: 0F
	.byte $08					;- - - - - - 0x01C974 07:C964: 08
	.byte $E0					;- - - - - - 0x01C975 07:C965: E0
	.byte $71					;- - - - - - 0x01C976 07:C966: 71
	.byte $8C					;- - - - - - 0x01C977 07:C967: 8C
	.byte $C1					;- - - - - - 0x01C978 07:C968: C1
	.byte $8F					;- - - - - - 0x01C979 07:C969: 8F
	.byte $19					;- - - - - - 0x01C97A 07:C96A: 19
	.byte $C3					;- - - - - - 0x01C97B 07:C96B: C3
	.byte $39					;- - - - - - 0x01C97C 07:C96C: 39
	.byte $39					;- - - - - - 0x01C97D 07:C96D: 39
	.byte $99					;- - - - - - 0x01C97E 07:C96E: 99
	.byte $F1					;- - - - - - 0x01C97F 07:C96F: F1
	.byte $BC					;- - - - - - 0x01C980 07:C970: BC
	.byte $74					;- - - - - - 0x01C981 07:C971: 74
	.byte $76					;- - - - - - 0x01C982 07:C972: 76
	.byte $E2					;- - - - - - 0x01C983 07:C973: E2
	.byte $F3					;- - - - - - 0x01C984 07:C974: F3
	.byte $C7					;- - - - - - 0x01C985 07:C975: C7
	.byte $97					;- - - - - - 0x01C986 07:C976: 97
	.byte $19					;- - - - - - 0x01C987 07:C977: 19
	.byte $E3					;- - - - - - 0x01C988 07:C978: E3
	.byte $63					;- - - - - - 0x01C989 07:C979: 63
	.byte $39					;- - - - - - 0x01C98A 07:C97A: 39
	.byte $87					;- - - - - - 0x01C98B 07:C97B: 87
	.byte $C6					;- - - - - - 0x01C98C 07:C97C: C6
	.byte $37					;- - - - - - 0x01C98D 07:C97D: 37
	.byte $0F					;- - - - - - 0x01C98E 07:C97E: 0F
	.byte $09					;- - - - - - 0x01C98F 07:C97F: 09
	.byte $C6					;- - - - - - 0x01C990 07:C980: C6
	.byte $71					;- - - - - - 0x01C991 07:C981: 71
	.byte $23					;- - - - - - 0x01C992 07:C982: 23
	.byte $88					;- - - - - - 0x01C993 07:C983: 88
	.byte $E0					;- - - - - - 0x01C994 07:C984: E0
	.byte $A9					;- - - - - - 0x01C995 07:C985: A9
	.byte $83					;- - - - - - 0x01C996 07:C986: 83
	.byte $8B					;- - - - - - 0x01C997 07:C987: 8B
	.byte $19					;- - - - - - 0x01C998 07:C988: 19
	.byte $87					;- - - - - - 0x01C999 07:C989: 87
	.byte $66					;- - - - - - 0x01C99A 07:C98A: 66
	.byte $71					;- - - - - - 0x01C99B 07:C98B: 71
	.byte $8C					;- - - - - - 0x01C99C 07:C98C: 8C
	.byte $EF					;- - - - - - 0x01C99D 07:C98D: EF
	.byte $0D					;- - - - - - 0x01C99E 07:C98E: 0D
	.byte $DA					;- - - - - - 0x01C99F 07:C98F: DA
	.byte $F4					;- - - - - - 0x01C9A0 07:C990: F4
	.byte $73					;- - - - - - 0x01C9A1 07:C991: 73
	.byte $EE					;- - - - - - 0x01C9A2 07:C992: EE
	.byte $1C					;- - - - - - 0x01C9A3 07:C993: 1C
	.byte $DB					;- - - - - - 0x01C9A4 07:C994: DB
	.byte $8E					;- - - - - - 0x01C9A5 07:C995: 8E
	.byte $76					;- - - - - - 0x01C9A6 07:C996: 76
	.byte $1A					;- - - - - - 0x01C9A7 07:C997: 1A
	.byte $39					;- - - - - - 0x01C9A8 07:C998: 39
	.byte $0E					;- - - - - - 0x01C9A9 07:C999: 0E
	.byte $71					;- - - - - - 0x01C9AA 07:C99A: 71
	.byte $C6					;- - - - - - 0x01C9AB 07:C99B: C6
	.byte $2E					;- - - - - - 0x01C9AC 07:C99C: 2E
	.byte $31					;- - - - - - 0x01C9AD 07:C99D: 31
	.byte $C3					;- - - - - - 0x01C9AE 07:C99E: C3
	.byte $9C					;- - - - - - 0x01C9AF 07:C99F: 9C
	.byte $59					;- - - - - - 0x01C9B0 07:C9A0: 59
	.byte $07					;- - - - - - 0x01C9B1 07:C9A1: 07
	.byte $A1					;- - - - - - 0x01C9B2 07:C9A2: A1
	.byte $C0					;- - - - - - 0x01C9B3 07:C9A3: C0
	.byte $F1					;- - - - - - 0x01C9B4 07:C9A4: F1
	.byte $19					;- - - - - - 0x01C9B5 07:C9A5: 19
	.byte $9C					;- - - - - - 0x01C9B6 07:C9A6: 9C
	.byte $58					;- - - - - - 0x01C9B7 07:C9A7: 58
	.byte $CE					;- - - - - - 0x01C9B8 07:C9A8: CE
	.byte $2E					;- - - - - - 0x01C9B9 07:C9A9: 2E
	.byte $2D					;- - - - - - 0x01C9BA 07:C9AA: 2D
	.byte $6E					;- - - - - - 0x01C9BB 07:C9AB: 6E
	.byte $3C					;- - - - - - 0x01C9BC 07:C9AC: 3C
	.byte $E3					;- - - - - - 0x01C9BD 07:C9AD: E3
	.byte $39					;- - - - - - 0x01C9BE 07:C9AE: 39
	.byte $E3					;- - - - - - 0x01C9BF 07:C9AF: E3
	.byte $8E					;- - - - - - 0x01C9C0 07:C9B0: 8E
	.byte $B8					;- - - - - - 0x01C9C1 07:C9B1: B8
	.byte $E7					;- - - - - - 0x01C9C2 07:C9B2: E7
	.byte $1C					;- - - - - - 0x01C9C3 07:C9B3: 1C
	.byte $E3					;- - - - - - 0x01C9C4 07:C9B4: E3
	.byte $A7					;- - - - - - 0x01C9C5 07:C9B5: A7
	.byte $0D					;- - - - - - 0x01C9C6 07:C9B6: 0D
	.byte $8E					;- - - - - - 0x01C9C7 07:C9B7: 8E
	.byte $47					;- - - - - - 0x01C9C8 07:C9B8: 47
	.byte $94					;- - - - - - 0x01C9C9 07:C9B9: 94
	.byte $B7					;- - - - - - 0x01C9CA 07:C9BA: B7
	.byte $05					;- - - - - - 0x01C9CB 07:C9BB: 05
	.byte $C2					;- - - - - - 0x01C9CC 07:C9BC: C2
	.byte $39					;- - - - - - 0x01C9CD 07:C9BD: 39
	.byte $E6					;- - - - - - 0x01C9CE 07:C9BE: E6
	.byte $26					;- - - - - - 0x01C9CF 07:C9BF: 26
	.byte $36					;- - - - - - 0x01C9D0 07:C9C0: 36
	.byte $19					;- - - - - - 0x01C9D1 07:C9C1: 19
	.byte $8C					;- - - - - - 0x01C9D2 07:C9C2: 8C
	.byte $74					;- - - - - - 0x01C9D3 07:C9C3: 74
	.byte $98					;- - - - - - 0x01C9D4 07:C9C4: 98
	.byte $CD					;- - - - - - 0x01C9D5 07:C9C5: CD
	.byte $47					;- - - - - - 0x01C9D6 07:C9C6: 47
	.byte $38					;- - - - - - 0x01C9D7 07:C9C7: 38
	.byte $59					;- - - - - - 0x01C9D8 07:C9C8: 59
	.byte $E8					;- - - - - - 0x01C9D9 07:C9C9: E8
	.byte $D3					;- - - - - - 0x01C9DA 07:C9CA: D3
	.byte $53					;- - - - - - 0x01C9DB 07:C9CB: 53
	.byte $B8					;- - - - - - 0x01C9DC 07:C9CC: B8
	.byte $F2					;- - - - - - 0x01C9DD 07:C9CD: F2
	.byte $6E					;- - - - - - 0x01C9DE 07:C9CE: 6E
	.byte $AC					;- - - - - - 0x01C9DF 07:C9CF: AC
	.byte $B3					;- - - - - - 0x01C9E0 07:C9D0: B3
	.byte $B4					;- - - - - - 0x01C9E1 07:C9D1: B4
	.byte $E5					;- - - - - - 0x01C9E2 07:C9D2: E5
	.byte $71					;- - - - - - 0x01C9E3 07:C9D3: 71
	.byte $27					;- - - - - - 0x01C9E4 07:C9D4: 27
	.byte $8E					;- - - - - - 0x01C9E5 07:C9D5: 8E
	.byte $8C					;- - - - - - 0x01C9E6 07:C9D6: 8C
	.byte $8F					;- - - - - - 0x01C9E7 07:C9D7: 8F
	.byte $1A					;- - - - - - 0x01C9E8 07:C9D8: 1A
	.byte $3C					;- - - - - - 0x01C9E9 07:C9D9: 3C
	.byte $8A					;- - - - - - 0x01C9EA 07:C9DA: 8A
	.byte $73					;- - - - - - 0x01C9EB 07:C9DB: 73
	.byte $8E					;- - - - - - 0x01C9EC 07:C9DC: 8E
	.byte $1C					;- - - - - - 0x01C9ED 07:C9DD: 1C
	.byte $6B					;- - - - - - 0x01C9EE 07:C9DE: 6B
	.byte $29					;- - - - - - 0x01C9EF 07:C9DF: 29
	.byte $8E					;- - - - - - 0x01C9F0 07:C9E0: 8E
	.byte $1C					;- - - - - - 0x01C9F1 07:C9E1: 1C
	.byte $2C					;- - - - - - 0x01C9F2 07:C9E2: 2C
	.byte $68					;- - - - - - 0x01C9F3 07:C9E3: 68
	.byte $D9					;- - - - - - 0x01C9F4 07:C9E4: D9
	.byte $31					;- - - - - - 0x01C9F5 07:C9E5: 31
	.byte $E3					;- - - - - - 0x01C9F6 07:C9E6: E3
	.byte $55					;- - - - - - 0x01C9F7 07:C9E7: 55
	.byte $47					;- - - - - - 0x01C9F8 07:C9E8: 47
	.byte $39					;- - - - - - 0x01C9F9 07:C9E9: 39
	.byte $AB					;- - - - - - 0x01C9FA 07:C9EA: AB
	.byte $2D					;- - - - - - 0x01C9FB 07:C9EB: 2D
	.byte $97					;- - - - - - 0x01C9FC 07:C9EC: 97
	.byte $38					;- - - - - - 0x01C9FD 07:C9ED: 38
	.byte $D3					;- - - - - - 0x01C9FE 07:C9EE: D3
	.byte $B1					;- - - - - - 0x01C9FF 07:C9EF: B1
	.byte $CE					;- - - - - - 0x01CA00 07:C9F0: CE
	.byte $38					;- - - - - - 0x01CA01 07:C9F1: 38
	.byte $F1					;- - - - - - 0x01CA02 07:C9F2: F1
	.byte $D4					;- - - - - - 0x01CA03 07:C9F3: D4
	.byte $B3					;- - - - - - 0x01CA04 07:C9F4: B3
	.byte $4E					;- - - - - - 0x01CA05 07:C9F5: 4E
	.byte $A9					;- - - - - - 0x01CA06 07:C9F6: A9
	.byte $62					;- - - - - - 0x01CA07 07:C9F7: 62
	.byte $AD					;- - - - - - 0x01CA08 07:C9F8: AD
	.byte $54					;- - - - - - 0x01CA09 07:C9F9: 54
	.byte $B2					;- - - - - - 0x01CA0A 07:C9FA: B2
	.byte $38					;- - - - - - 0x01CA0B 07:C9FB: 38
	.byte $C9					;- - - - - - 0x01CA0C 07:C9FC: C9
	.byte $A8					;- - - - - - 0x01CA0D 07:C9FD: A8
	.byte $AC					;- - - - - - 0x01CA0E 07:C9FE: AC
	.byte $A9					;- - - - - - 0x01CA0F 07:C9FF: A9
	.byte $18					;- - - - - - 0x01CA10 07:CA00: 18
	.byte $E6					;- - - - - - 0x01CA11 07:CA01: E6
	.byte $51					;- - - - - - 0x01CA12 07:CA02: 51
	.byte $9A					;- - - - - - 0x01CA13 07:CA03: 9A
	.byte $73					;- - - - - - 0x01CA14 07:CA04: 73
	.byte $29					;- - - - - - 0x01CA15 07:CA05: 29
	.byte $9E					;- - - - - - 0x01CA16 07:CA06: 9E
	.byte $39					;- - - - - - 0x01CA17 07:CA07: 39
	.byte $9A					;- - - - - - 0x01CA18 07:CA08: 9A
	.byte $D5					;- - - - - - 0x01CA19 07:CA09: D5
	.byte $A7					;- - - - - - 0x01CA1A 07:CA0A: A7
	.byte $96					;- - - - - - 0x01CA1B 07:CA0B: 96
	.byte $D3					;- - - - - - 0x01CA1C 07:CA0C: D3
	.byte $65					;- - - - - - 0x01CA1D 07:CA0D: 65
	.byte $9D					;- - - - - - 0x01CA1E 07:CA0E: 9D
	.byte $58					;- - - - - - 0x01CA1F 07:CA0F: 58
	.byte $BA					;- - - - - - 0x01CA20 07:CA10: BA
	.byte $61					;- - - - - - 0x01CA21 07:CA11: 61
	.byte $DA					;- - - - - - 0x01CA22 07:CA12: DA
	.byte $46					;- - - - - - 0x01CA23 07:CA13: 46
	.byte $AA					;- - - - - - 0x01CA24 07:CA14: AA
	.byte $3C					;- - - - - - 0x01CA25 07:CA15: 3C
	.byte $52					;- - - - - - 0x01CA26 07:CA16: 52
	.byte $B1					;- - - - - - 0x01CA27 07:CA17: B1
	.byte $A5					;- - - - - - 0x01CA28 07:CA18: A5
	.byte $66					;- - - - - - 0x01CA29 07:CA19: 66
	.byte $63					;- - - - - - 0x01CA2A 07:CA1A: 63
	.byte $8D					;- - - - - - 0x01CA2B 07:CA1B: 8D
	.byte $31					;- - - - - - 0x01CA2C 07:CA1C: 31
	.byte $E0					;- - - - - - 0x01CA2D 07:CA1D: E0
	.byte $E5					;- - - - - - 0x01CA2E 07:CA1E: E5
	.byte $95					;- - - - - - 0x01CA2F 07:CA1F: 95
	.byte $2A					;- - - - - - 0x01CA30 07:CA20: 2A
	.byte $CC					;- - - - - - 0x01CA31 07:CA21: CC
	.byte $B2					;- - - - - - 0x01CA32 07:CA22: B2
	.byte $9C					;- - - - - - 0x01CA33 07:CA23: 9C
	.byte $AC					;- - - - - - 0x01CA34 07:CA24: AC
	.byte $AB					;- - - - - - 0x01CA35 07:CA25: AB
	.byte $39					;- - - - - - 0x01CA36 07:CA26: 39
	.byte $66					;- - - - - - 0x01CA37 07:CA27: 66
	.byte $A7					;- - - - - - 0x01CA38 07:CA28: A7
	.byte $4B					;- - - - - - 0x01CA39 07:CA29: 4B
	.byte $99					;- - - - - - 0x01CA3A 07:CA2A: 99
	.byte $5A					;- - - - - - 0x01CA3B 07:CA2B: 5A
	.byte $6A					;- - - - - - 0x01CA3C 07:CA2C: 6A
	.byte $CC					;- - - - - - 0x01CA3D 07:CA2D: CC
	.byte $AB					;- - - - - - 0x01CA3E 07:CA2E: AB
	.byte $8B					;- - - - - - 0x01CA3F 07:CA2F: 8B
	.byte $55					;- - - - - - 0x01CA40 07:CA30: 55
	.byte $A6					;- - - - - - 0x01CA41 07:CA31: A6
	.byte $A6					;- - - - - - 0x01CA42 07:CA32: A6
	.byte $AA					;- - - - - - 0x01CA43 07:CA33: AA
	.byte $3C					;- - - - - - 0x01CA44 07:CA34: 3C
	.byte $5A					;- - - - - - 0x01CA45 07:CA35: 5A
	.byte $39					;- - - - - - 0x01CA46 07:CA36: 39
	.byte $38					;- - - - - - 0x01CA47 07:CA37: 38
	.byte $E2					;- - - - - - 0x01CA48 07:CA38: E2
	.byte $A4					;- - - - - - 0x01CA49 07:CA39: A4
	.byte $B9					;- - - - - - 0x01CA4A 07:CA3A: B9
	.byte $30					;- - - - - - 0x01CA4B 07:CA3B: 30
	.byte $B9					;- - - - - - 0x01CA4C 07:CA3C: B9
	.byte $54					;- - - - - - 0x01CA4D 07:CA3D: 54
	.byte $AA					;- - - - - - 0x01CA4E 07:CA3E: AA
	.byte $95					;- - - - - - 0x01CA4F 07:CA3F: 95
	.byte $AA					;- - - - - - 0x01CA50 07:CA40: AA
	.byte $65					;- - - - - - 0x01CA51 07:CA41: 65
	.byte $5A					;- - - - - - 0x01CA52 07:CA42: 5A
	.byte $AA					;- - - - - - 0x01CA53 07:CA43: AA
	.byte $3C					;- - - - - - 0x01CA54 07:CA44: 3C
	.byte $5A					;- - - - - - 0x01CA55 07:CA45: 5A
	.byte $39					;- - - - - - 0x01CA56 07:CA46: 39
	.byte $38					;- - - - - - 0x01CA57 07:CA47: 38
	.byte $E2					;- - - - - - 0x01CA58 07:CA48: E2
	.byte $A4					;- - - - - - 0x01CA59 07:CA49: A4
	.byte $B9					;- - - - - - 0x01CA5A 07:CA4A: B9
	.byte $30					;- - - - - - 0x01CA5B 07:CA4B: 30
	.byte $B9					;- - - - - - 0x01CA5C 07:CA4C: B9
	.byte $54					;- - - - - - 0x01CA5D 07:CA4D: 54
	.byte $AA					;- - - - - - 0x01CA5E 07:CA4E: AA
	.byte $95					;- - - - - - 0x01CA5F 07:CA4F: 95
	.byte $AA					;- - - - - - 0x01CA60 07:CA50: AA
	.byte $65					;- - - - - - 0x01CA61 07:CA51: 65
	.byte $5A					;- - - - - - 0x01CA62 07:CA52: 5A
	.byte $9C					;- - - - - - 0x01CA63 07:CA53: 9C
	.byte $C7					;- - - - - - 0x01CA64 07:CA54: C7
	.byte $59					;- - - - - - 0x01CA65 07:CA55: 59
	.byte $B2					;- - - - - - 0x01CA66 07:CA56: B2
	.byte $AE					;- - - - - - 0x01CA67 07:CA57: AE
	.byte $6B					;- - - - - - 0x01CA68 07:CA58: 6B
	.byte $34					;- - - - - - 0x01CA69 07:CA59: 34
	.byte $DC					;- - - - - - 0x01CA6A 07:CA5A: DC
	.byte $B2					;- - - - - - 0x01CA6B 07:CA5B: B2
	.byte $D4					;- - - - - - 0x01CA6C 07:CA5C: D4
	.byte $B1					;- - - - - - 0x01CA6D 07:CA5D: B1
	.byte $D4					;- - - - - - 0x01CA6E 07:CA5E: D4
	.byte $63					;- - - - - - 0x01CA6F 07:CA5F: 63
	.byte $C5					;- - - - - - 0x01CA70 07:CA60: C5
	.byte $34					;- - - - - - 0x01CA71 07:CA61: 34
	.byte $6A					;- - - - - - 0x01CA72 07:CA62: 6A
	.byte $65					;- - - - - - 0x01CA73 07:CA63: 65
	.byte $69					;- - - - - - 0x01CA74 07:CA64: 69
	.byte $65					;- - - - - - 0x01CA75 07:CA65: 65
	.byte $4C					;- - - - - - 0x01CA76 07:CA66: 4C
	.byte $E3					;- - - - - - 0x01CA77 07:CA67: E3
	.byte $35					;- - - - - - 0x01CA78 07:CA68: 35
	.byte $4C					;- - - - - - 0x01CA79 07:CA69: 4C
	.byte $71					;- - - - - - 0x01CA7A 07:CA6A: 71
	.byte $A5					;- - - - - - 0x01CA7B 07:CA6B: A5
	.byte $54					;- - - - - - 0x01CA7C 07:CA6C: 54
	.byte $D6					;- - - - - - 0x01CA7D 07:CA6D: D6
	.byte $33					;- - - - - - 0x01CA7E 07:CA6E: 33
	.byte $4D					;- - - - - - 0x01CA7F 07:CA6F: 4D
	.byte $71					;- - - - - - 0x01CA80 07:CA70: 71
	.byte $92					;- - - - - - 0x01CA81 07:CA71: 92
	.byte $EA					;- - - - - - 0x01CA82 07:CA72: EA
	.byte $9A					;- - - - - - 0x01CA83 07:CA73: 9A
	.byte $AB					;- - - - - - 0x01CA84 07:CA74: AB
	.byte $56					;- - - - - - 0x01CA85 07:CA75: 56
	.byte $55					;- - - - - - 0x01CA86 07:CA76: 55
	.byte $5A					;- - - - - - 0x01CA87 07:CA77: 5A
	.byte $CA					;- - - - - - 0x01CA88 07:CA78: CA
	.byte $6A					;- - - - - - 0x01CA89 07:CA79: 6A
	.byte $CE					;- - - - - - 0x01CA8A 07:CA7A: CE
	.byte $33					;- - - - - - 0x01CA8B 07:CA7B: 33
	.byte $3A					;- - - - - - 0x01CA8C 07:CA7C: 3A
	.byte $3C					;- - - - - - 0x01CA8D 07:CA7D: 3C
	.byte $65					;- - - - - - 0x01CA8E 07:CA7E: 65
	.byte $56					;- - - - - - 0x01CA8F 07:CA7F: 56
	.byte $39					;- - - - - - 0x01CA90 07:CA80: 39
	.byte $8D					;- - - - - - 0x01CA91 07:CA81: 8D
	.byte $62					;- - - - - - 0x01CA92 07:CA82: 62
	.byte $30					;- - - - - - 0x01CA93 07:CA83: 30
	.byte $B9					;- - - - - - 0x01CA94 07:CA84: B9
	.byte $54					;- - - - - - 0x01CA95 07:CA85: 54
	.byte $AA					;- - - - - - 0x01CA96 07:CA86: AA
	.byte $95					;- - - - - - 0x01CA97 07:CA87: 95
	.byte $AA					;- - - - - - 0x01CA98 07:CA88: AA
	.byte $65					;- - - - - - 0x01CA99 07:CA89: 65
	.byte $5A					;- - - - - - 0x01CA9A 07:CA8A: 5A
	.byte $00					;- - - - - - 0x01CA9B 07:CA8B: 00
	.byte $00					;- - - - - - 0x01CA9C 07:CA8C: 00
	.byte $00					;- - - - - - 0x01CA9D 07:CA8D: 00
	.byte $00					;- - - - - - 0x01CA9E 07:CA8E: 00
	.byte $00					;- - - - - - 0x01CA9F 07:CA8F: 00
	.byte $00					;- - - - - - 0x01CAA0 07:CA90: 00
	.byte $00					;- - - - - - 0x01CAA1 07:CA91: 00
	.byte $00					;- - - - - - 0x01CAA2 07:CA92: 00
	.byte $FF					;- - - - - - 0x01CAA3 07:CA93: FF
	.byte $DF					;- - - - - - 0x01CAA4 07:CA94: DF
	.byte $FF					;- - - - - - 0x01CAA5 07:CA95: FF
	.byte $DF					;- - - - - - 0x01CAA6 07:CA96: DF
	.byte $ED					;- - - - - - 0x01CAA7 07:CA97: ED
	.byte $DF					;- - - - - - 0x01CAA8 07:CA98: DF
	.byte $EE					;- - - - - - 0x01CAA9 07:CA99: EE
	.byte $DE					;- - - - - - 0x01CAAA 07:CA9A: DE
	.byte $12					;- - - - - - 0x01CAAB 07:CA9B: 12
	.byte $01					;- - - - - - 0x01CAAC 07:CA9C: 01
	.byte $00					;- - - - - - 0x01CAAD 07:CA9D: 00
	.byte $10					;- - - - - - 0x01CAAE 07:CA9E: 10
	.byte $00					;- - - - - - 0x01CAAF 07:CA9F: 00
	.byte $10					;- - - - - - 0x01CAB0 07:CAA0: 10
	.byte $40					;- - - - - - 0x01CAB1 07:CAA1: 40
	.byte $11					;- - - - - - 0x01CAB2 07:CAA2: 11
	.byte $EF					;- - - - - - 0x01CAB3 07:CAA3: EF
	.byte $FD					;- - - - - - 0x01CAB4 07:CAA4: FD
	.byte $DF					;- - - - - - 0x01CAB5 07:CAA5: DF
	.byte $FF					;- - - - - - 0x01CAB6 07:CAA6: FF
	.byte $EF					;- - - - - - 0x01CAB7 07:CAA7: EF
	.byte $EE					;- - - - - - 0x01CAB8 07:CAA8: EE
	.byte $DD					;- - - - - - 0x01CAB9 07:CAA9: DD
	.byte $ED					;- - - - - - 0x01CABA 07:CAAA: ED
	.byte $8C					;- - - - - - 0x01CABB 07:CAAB: 8C
	.byte $A6					;- - - - - - 0x01CABC 07:CAAC: A6
	.byte $55					;- - - - - - 0x01CABD 07:CAAD: 55
	.byte $4D					;- - - - - - 0x01CABE 07:CAAE: 4D
	.byte $16					;- - - - - - 0x01CABF 07:CAAF: 16
	.byte $00					;- - - - - - 0x01CAC0 07:CAB0: 00
	.byte $10					;- - - - - - 0x01CAC1 07:CAB1: 10
	.byte $20					;- - - - - - 0x01CAC2 07:CAB2: 20
	.byte $DF					;- - - - - - 0x01CAC3 07:CAB3: DF
	.byte $7F					;- - - - - - 0x01CAC4 07:CAB4: 7F
	.byte $FC					;- - - - - - 0x01CAC5 07:CAB5: FC
	.byte $EE					;- - - - - - 0x01CAC6 07:CAB6: EE
	.byte $DE					;- - - - - - 0x01CAC7 07:CAB7: DE
	.byte $ED					;- - - - - - 0x01CAC8 07:CAB8: ED
	.byte $FD					;- - - - - - 0x01CAC9 07:CAB9: FD
	.byte $FF					;- - - - - - 0x01CACA 07:CABA: FF
	.byte $01					;- - - - - - 0x01CACB 07:CABB: 01
	.byte $22					;- - - - - - 0x01CACC 07:CABC: 22
	.byte $00					;- - - - - - 0x01CACD 07:CABD: 00
	.byte $10					;- - - - - - 0x01CACE 07:CABE: 10
	.byte $00					;- - - - - - 0x01CACF 07:CABF: 00
	.byte $88					;- - - - - - 0x01CAD0 07:CAC0: 88
	.byte $21					;- - - - - - 0x01CAD1 07:CAC1: 21
	.byte $30					;- - - - - - 0x01CAD2 07:CAC2: 30
	.byte $20					;- - - - - - 0x01CAD3 07:CAC3: 20
	.byte $EF					;- - - - - - 0x01CAD4 07:CAC4: EF
	.byte $FE					;- - - - - - 0x01CAD5 07:CAC5: FE
	.byte $DE					;- - - - - - 0x01CAD6 07:CAC6: DE
	.byte $FD					;- - - - - - 0x01CAD7 07:CAC7: FD
	.byte $ED					;- - - - - - 0x01CAD8 07:CAC8: ED
	.byte $DD					;- - - - - - 0x01CAD9 07:CAC9: DD
	.byte $7F					;- - - - - - 0x01CADA 07:CACA: 7F
	.byte $FF					;- - - - - - 0x01CADB 07:CACB: FF
	.byte $77					;- - - - - - 0x01CADC 07:CACC: 77
	.byte $12					;- - - - - - 0x01CADD 07:CACD: 12
	.byte $00					;- - - - - - 0x01CADE 07:CACE: 00
	.byte $00					;- - - - - - 0x01CADF 07:CACF: 00
	.byte $34					;- - - - - - 0x01CAE0 07:CAD0: 34
	.byte $11					;- - - - - - 0x01CAE1 07:CAD1: 11
	.byte $20					;- - - - - - 0x01CAE2 07:CAD2: 20
	.byte $21					;- - - - - - 0x01CAE3 07:CAD3: 21
	.byte $01					;- - - - - - 0x01CAE4 07:CAD4: 01
	.byte $10					;- - - - - - 0x01CAE5 07:CAD5: 10
	.byte $DF					;- - - - - - 0x01CAE6 07:CAD6: DF
	.byte $77					;- - - - - - 0x01CAE7 07:CAD7: 77
	.byte $FE					;- - - - - - 0x01CAE8 07:CAD8: FE
	.byte $FD					;- - - - - - 0x01CAE9 07:CAD9: FD
	.byte $DF					;- - - - - - 0x01CAEA 07:CADA: DF
	.byte $FE					;- - - - - - 0x01CAEB 07:CADB: FE
	.byte $E7					;- - - - - - 0x01CAEC 07:CADC: E7
	.byte $FF					;- - - - - - 0x01CAED 07:CADD: FF
	.byte $7F					;- - - - - - 0x01CAEE 07:CADE: 7F
	.byte $10					;- - - - - - 0x01CAEF 07:CADF: 10
	.byte $22					;- - - - - - 0x01CAF0 07:CAE0: 22
	.byte $01					;- - - - - - 0x01CAF1 07:CAE1: 01
	.byte $40					;- - - - - - 0x01CAF2 07:CAE2: 40
	.byte $00					;- - - - - - 0x01CAF3 07:CAE3: 00
	.byte $84					;- - - - - - 0x01CAF4 07:CAE4: 84
	.byte $04					;- - - - - - 0x01CAF5 07:CAE5: 04
	.byte $01					;- - - - - - 0x01CAF6 07:CAE6: 01
	.byte $22					;- - - - - - 0x01CAF7 07:CAE7: 22
	.byte $00					;- - - - - - 0x01CAF8 07:CAE8: 00
	.byte $ED					;- - - - - - 0x01CAF9 07:CAE9: ED
	.byte $FC					;- - - - - - 0x01CAFA 07:CAEA: FC
	.byte $FF					;- - - - - - 0x01CAFB 07:CAEB: FF
	.byte $EF					;- - - - - - 0x01CAFC 07:CAEC: EF
	.byte $DF					;- - - - - - 0x01CAFD 07:CAED: DF
	.byte $EE					;- - - - - - 0x01CAFE 07:CAEE: EE
	.byte $DC					;- - - - - - 0x01CAFF 07:CAEF: DC
	.byte $FD					;- - - - - - 0x01CB00 07:CAF0: FD
	.byte $EE					;- - - - - - 0x01CB01 07:CAF1: EE
	.byte $DF					;- - - - - - 0x01CB02 07:CAF2: DF
	.byte $10					;- - - - - - 0x01CB03 07:CAF3: 10
	.byte $20					;- - - - - - 0x01CB04 07:CAF4: 20
	.byte $11					;- - - - - - 0x01CB05 07:CAF5: 11
	.byte $00					;- - - - - - 0x01CB06 07:CAF6: 00
	.byte $00					;- - - - - - 0x01CB07 07:CAF7: 00
	.byte $03					;- - - - - - 0x01CB08 07:CAF8: 03
	.byte $03					;- - - - - - 0x01CB09 07:CAF9: 03
	.byte $00					;- - - - - - 0x01CB0A 07:CAFA: 00
	.byte $00					;- - - - - - 0x01CB0B 07:CAFB: 00
	.byte $02					;- - - - - - 0x01CB0C 07:CAFC: 02
	.byte $D7					;- - - - - - 0x01CB0D 07:CAFD: D7
	.byte $D7					;- - - - - - 0x01CB0E 07:CAFE: D7
	.byte $FE					;- - - - - - 0x01CB0F 07:CAFF: FE
	.byte $DC					;- - - - - - 0x01CB10 07:CB00: DC
	.byte $ED					;- - - - - - 0x01CB11 07:CB01: ED
	.byte $EF					;- - - - - - 0x01CB12 07:CB02: EF
	.byte $FE					;- - - - - - 0x01CB13 07:CB03: FE
	.byte $FD					;- - - - - - 0x01CB14 07:CB04: FD
	.byte $DC					;- - - - - - 0x01CB15 07:CB05: DC
	.byte $EE					;- - - - - - 0x01CB16 07:CB06: EE
	.byte $11					;- - - - - - 0x01CB17 07:CB07: 11
	.byte $20					;- - - - - - 0x01CB18 07:CB08: 20
	.byte $30					;- - - - - - 0x01CB19 07:CB09: 30
	.byte $10					;- - - - - - 0x01CB1A 07:CB0A: 10
	.byte $00					;- - - - - - 0x01CB1B 07:CB0B: 00
	.byte $00					;- - - - - - 0x01CB1C 07:CB0C: 00
	.byte $00					;- - - - - - 0x01CB1D 07:CB0D: 00
	.byte $00					;- - - - - - 0x01CB1E 07:CB0E: 00
	.byte $00					;- - - - - - 0x01CB1F 07:CB0F: 00
	.byte $00					;- - - - - - 0x01CB20 07:CB10: 00
	.byte $00					;- - - - - - 0x01CB21 07:CB11: 00
	.byte $00					;- - - - - - 0x01CB22 07:CB12: 00
	.byte $FF					;- - - - - - 0x01CB23 07:CB13: FF
	.byte $DF					;- - - - - - 0x01CB24 07:CB14: DF
	.byte $FF					;- - - - - - 0x01CB25 07:CB15: FF
	.byte $7F					;- - - - - - 0x01CB26 07:CB16: 7F
	.byte $EF					;- - - - - - 0x01CB27 07:CB17: EF
	.byte $FE					;- - - - - - 0x01CB28 07:CB18: FE
	.byte $FD					;- - - - - - 0x01CB29 07:CB19: FD
	.byte $FD					;- - - - - - 0x01CB2A 07:CB1A: FD
	.byte $FF					;- - - - - - 0x01CB2B 07:CB1B: FF
	.byte $DF					;- - - - - - 0x01CB2C 07:CB1C: DF
	.byte $FF					;- - - - - - 0x01CB2D 07:CB1D: FF
	.byte $FD					;- - - - - - 0x01CB2E 07:CB1E: FD
	.byte $12					;- - - - - - 0x01CB2F 07:CB1F: 12
	.byte $01					;- - - - - - 0x01CB30 07:CB20: 01
	.byte $00					;- - - - - - 0x01CB31 07:CB21: 00
	.byte $00					;- - - - - - 0x01CB32 07:CB22: 00
	.byte $01					;- - - - - - 0x01CB33 07:CB23: 01
	.byte $00					;- - - - - - 0x01CB34 07:CB24: 00
	.byte $22					;- - - - - - 0x01CB35 07:CB25: 22
	.byte $10					;- - - - - - 0x01CB36 07:CB26: 10
	.byte $12					;- - - - - - 0x01CB37 07:CB27: 12
	.byte $01					;- - - - - - 0x01CB38 07:CB28: 01
	.byte $21					;- - - - - - 0x01CB39 07:CB29: 21
	.byte $00					;- - - - - - 0x01CB3A 07:CB2A: 00
	.byte $FF					;- - - - - - 0x01CB3B 07:CB2B: FF
	.byte $EF					;- - - - - - 0x01CB3C 07:CB2C: EF
	.byte $FF					;- - - - - - 0x01CB3D 07:CB2D: FF
	.byte $DE					;- - - - - - 0x01CB3E 07:CB2E: DE
	.byte $FF					;- - - - - - 0x01CB3F 07:CB2F: FF
	.byte $FD					;- - - - - - 0x01CB40 07:CB30: FD
	.byte $FE					;- - - - - - 0x01CB41 07:CB31: FE
	.byte $EE					;- - - - - - 0x01CB42 07:CB32: EE
	.byte $7F					;- - - - - - 0x01CB43 07:CB33: 7F
	.byte $F7					;- - - - - - 0x01CB44 07:CB34: F7
	.byte $77					;- - - - - - 0x01CB45 07:CB35: 77
	.byte $7D					;- - - - - - 0x01CB46 07:CB36: 7D
	.byte $01					;- - - - - - 0x01CB47 07:CB37: 01
	.byte $20					;- - - - - - 0x01CB48 07:CB38: 20
	.byte $50					;- - - - - - 0x01CB49 07:CB39: 50
	.byte $20					;- - - - - - 0x01CB4A 07:CB3A: 20
	.byte $30					;- - - - - - 0x01CB4B 07:CB3B: 30
	.byte $08					;- - - - - - 0x01CB4C 07:CB3C: 08
	.byte $88					;- - - - - - 0x01CB4D 07:CB3D: 88
	.byte $20					;- - - - - - 0x01CB4E 07:CB3E: 20
	.byte $01					;- - - - - - 0x01CB4F 07:CB3F: 01
	.byte $20					;- - - - - - 0x01CB50 07:CB40: 20
	.byte $6C					;- - - - - - 0x01CB51 07:CB41: 6C
	.byte $13					;- - - - - - 0x01CB52 07:CB42: 13
	.byte $F7					;- - - - - - 0x01CB53 07:CB43: F7
	.byte $FD					;- - - - - - 0x01CB54 07:CB44: FD
	.byte $CD					;- - - - - - 0x01CB55 07:CB45: CD
	.byte $E7					;- - - - - - 0x01CB56 07:CB46: E7
	.byte $FF					;- - - - - - 0x01CB57 07:CB47: FF
	.byte $EE					;- - - - - - 0x01CB58 07:CB48: EE
	.byte $FD					;- - - - - - 0x01CB59 07:CB49: FD
	.byte $FF					;- - - - - - 0x01CB5A 07:CB4A: FF
	.byte $FE					;- - - - - - 0x01CB5B 07:CB4B: FE
	.byte $DF					;- - - - - - 0x01CB5C 07:CB4C: DF
	.byte $F7					;- - - - - - 0x01CB5D 07:CB4D: F7
	.byte $FF					;- - - - - - 0x01CB5E 07:CB4E: FF
	.byte $EF					;- - - - - - 0x01CB5F 07:CB4F: EF
	.byte $08					;- - - - - - 0x01CB60 07:CB50: 08
	.byte $08					;- - - - - - 0x01CB61 07:CB51: 08
	.byte $02					;- - - - - - 0x01CB62 07:CB52: 02
	.byte $02					;- - - - - - 0x01CB63 07:CB53: 02
	.byte $02					;- - - - - - 0x01CB64 07:CB54: 02
	.byte $11					;- - - - - - 0x01CB65 07:CB55: 11
	.byte $00					;- - - - - - 0x01CB66 07:CB56: 00
	.byte $32					;- - - - - - 0x01CB67 07:CB57: 32
	.byte $01					;- - - - - - 0x01CB68 07:CB58: 01
	.byte $02					;- - - - - - 0x01CB69 07:CB59: 02
	.byte $30					;- - - - - - 0x01CB6A 07:CB5A: 30
	.byte $00					;- - - - - - 0x01CB6B 07:CB5B: 00
	.byte $80					;- - - - - - 0x01CB6C 07:CB5C: 80
	.byte $ED					;- - - - - - 0x01CB6D 07:CB5D: ED
	.byte $EC					;- - - - - - 0x01CB6E 07:CB5E: EC
	.byte $7E					;- - - - - - 0x01CB6F 07:CB5F: 7E
	.byte $DE					;- - - - - - 0x01CB70 07:CB60: DE
	.byte $CE					;- - - - - - 0x01CB71 07:CB61: CE
	.byte $DD					;- - - - - - 0x01CB72 07:CB62: DD
	.byte $7D					;- - - - - - 0x01CB73 07:CB63: 7D
	.byte $DE					;- - - - - - 0x01CB74 07:CB64: DE
	.byte $E7					;- - - - - - 0x01CB75 07:CB65: E7
	.byte $7D					;- - - - - - 0x01CB76 07:CB66: 7D
	.byte $FE					;- - - - - - 0x01CB77 07:CB67: FE
	.byte $DD					;- - - - - - 0x01CB78 07:CB68: DD
	.byte $FE					;- - - - - - 0x01CB79 07:CB69: FE
	.byte $42					;- - - - - - 0x01CB7A 07:CB6A: 42
	.byte $56					;- - - - - - 0x01CB7B 07:CB6B: 56
	.byte $58					;- - - - - - 0x01CB7C 07:CB6C: 58
	.byte $23					;- - - - - - 0x01CB7D 07:CB6D: 23
	.byte $11					;- - - - - - 0x01CB7E 07:CB6E: 11
	.byte $32					;- - - - - - 0x01CB7F 07:CB6F: 32
	.byte $03					;- - - - - - 0x01CB80 07:CB70: 03
	.byte $82					;- - - - - - 0x01CB81 07:CB71: 82
	.byte $81					;- - - - - - 0x01CB82 07:CB72: 81
	.byte $84					;- - - - - - 0x01CB83 07:CB73: 84
	.byte $85					;- - - - - - 0x01CB84 07:CB74: 85
	.byte $19					;- - - - - - 0x01CB85 07:CB75: 19
	.byte $91					;- - - - - - 0x01CB86 07:CB76: 91
	.byte $FF					;- - - - - - 0x01CB87 07:CB77: FF
	.byte $85					;- - - - - - 0x01CB88 07:CB78: 85
	.byte $DF					;- - - - - - 0x01CB89 07:CB79: DF
	.byte $E7					;- - - - - - 0x01CB8A 07:CB7A: E7
	.byte $FE					;- - - - - - 0x01CB8B 07:CB7B: FE
	.byte $DE					;- - - - - - 0x01CB8C 07:CB7C: DE
	.byte $F7					;- - - - - - 0x01CB8D 07:CB7D: F7
	.byte $CE					;- - - - - - 0x01CB8E 07:CB7E: CE
	.byte $A6					;- - - - - - 0x01CB8F 07:CB7F: A6
	.byte $7F					;- - - - - - 0x01CB90 07:CB80: 7F
	.byte $CD					;- - - - - - 0x01CB91 07:CB81: CD
	.byte $3D					;- - - - - - 0x01CB92 07:CB82: 3D
	.byte $EF					;- - - - - - 0x01CB93 07:CB83: EF
	.byte $13					;- - - - - - 0x01CB94 07:CB84: 13
	.byte $20					;- - - - - - 0x01CB95 07:CB85: 20
	.byte $11					;- - - - - - 0x01CB96 07:CB86: 11
	.byte $20					;- - - - - - 0x01CB97 07:CB87: 20
	.byte $81					;- - - - - - 0x01CB98 07:CB88: 81
	.byte $21					;- - - - - - 0x01CB99 07:CB89: 21
	.byte $10					;- - - - - - 0x01CB9A 07:CB8A: 10
	.byte $00					;- - - - - - 0x01CB9B 07:CB8B: 00
	.byte $00					;- - - - - - 0x01CB9C 07:CB8C: 00
	.byte $00					;- - - - - - 0x01CB9D 07:CB8D: 00
	.byte $00					;- - - - - - 0x01CB9E 07:CB8E: 00
	.byte $00					;- - - - - - 0x01CB9F 07:CB8F: 00
	.byte $00					;- - - - - - 0x01CBA0 07:CB90: 00
	.byte $00					;- - - - - - 0x01CBA1 07:CB91: 00
	.byte $00					;- - - - - - 0x01CBA2 07:CB92: 00
	.byte $7F					;- - - - - - 0x01CBA3 07:CB93: 7F
	.byte $FD					;- - - - - - 0x01CBA4 07:CB94: FD
	.byte $FD					;- - - - - - 0x01CBA5 07:CB95: FD
	.byte $7F					;- - - - - - 0x01CBA6 07:CB96: 7F
	.byte $FE					;- - - - - - 0x01CBA7 07:CB97: FE
	.byte $FF					;- - - - - - 0x01CBA8 07:CB98: FF
	.byte $DF					;- - - - - - 0x01CBA9 07:CB99: DF
	.byte $F7					;- - - - - - 0x01CBAA 07:CB9A: F7
	.byte $EE					;- - - - - - 0x01CBAB 07:CB9B: EE
	.byte $DF					;- - - - - - 0x01CBAC 07:CB9C: DF
	.byte $EF					;- - - - - - 0x01CBAD 07:CB9D: EF
	.byte $F7					;- - - - - - 0x01CBAE 07:CB9E: F7
	.byte $FE					;- - - - - - 0x01CBAF 07:CB9F: FE
	.byte $D7					;- - - - - - 0x01CBB0 07:CBA0: D7
	.byte $F7					;- - - - - - 0x01CBB1 07:CBA1: F7
	.byte $F7					;- - - - - - 0x01CBB2 07:CBA2: F7
	.byte $02					;- - - - - - 0x01CBB3 07:CBA3: 02
	.byte $01					;- - - - - - 0x01CBB4 07:CBA4: 01
	.byte $03					;- - - - - - 0x01CBB5 07:CBA5: 03
	.byte $02					;- - - - - - 0x01CBB6 07:CBA6: 02
	.byte $02					;- - - - - - 0x01CBB7 07:CBA7: 02
	.byte $10					;- - - - - - 0x01CBB8 07:CBA8: 10
	.byte $91					;- - - - - - 0x01CBB9 07:CBA9: 91
	.byte $22					;- - - - - - 0x01CBBA 07:CBAA: 22
	.byte $11					;- - - - - - 0x01CBBB 07:CBAB: 11
	.byte $03					;- - - - - - 0x01CBBC 07:CBAC: 03
	.byte $04					;- - - - - - 0x01CBBD 07:CBAD: 04
	.byte $20					;- - - - - - 0x01CBBE 07:CBAE: 20
	.byte $03					;- - - - - - 0x01CBBF 07:CBAF: 03
	.byte $11					;- - - - - - 0x01CBC0 07:CBB0: 11
	.byte $88					;- - - - - - 0x01CBC1 07:CBB1: 88
	.byte $01					;- - - - - - 0x01CBC2 07:CBB2: 01
	.byte $EF					;- - - - - - 0x01CBC3 07:CBB3: EF
	.byte $7D					;- - - - - - 0x01CBC4 07:CBB4: 7D
	.byte $FE					;- - - - - - 0x01CBC5 07:CBB5: FE
	.byte $DD					;- - - - - - 0x01CBC6 07:CBB6: DD
	.byte $E7					;- - - - - - 0x01CBC7 07:CBB7: E7
	.byte $DE					;- - - - - - 0x01CBC8 07:CBB8: DE
	.byte $FE					;- - - - - - 0x01CBC9 07:CBB9: FE
	.byte $FF					;- - - - - - 0x01CBCA 07:CBBA: FF
	.byte $F7					;- - - - - - 0x01CBCB 07:CBBB: F7
	.byte $77					;- - - - - - 0x01CBCC 07:CBBC: 77
	.byte $FF					;- - - - - - 0x01CBCD 07:CBBD: FF
	.byte $DF					;- - - - - - 0x01CBCE 07:CBBE: DF
	.byte $FF					;- - - - - - 0x01CBCF 07:CBBF: FF
	.byte $FF					;- - - - - - 0x01CBD0 07:CBC0: FF
	.byte $ED					;- - - - - - 0x01CBD1 07:CBC1: ED
	.byte $FF					;- - - - - - 0x01CBD2 07:CBC2: FF
	.byte $CF					;- - - - - - 0x01CBD3 07:CBC3: CF
	.byte $01					;- - - - - - 0x01CBD4 07:CBC4: 01
	.byte $03					;- - - - - - 0x01CBD5 07:CBC5: 03
	.byte $02					;- - - - - - 0x01CBD6 07:CBC6: 02
	.byte $20					;- - - - - - 0x01CBD7 07:CBC7: 20
	.byte $00					;- - - - - - 0x01CBD8 07:CBC8: 00
	.byte $41					;- - - - - - 0x01CBD9 07:CBC9: 41
	.byte $01					;- - - - - - 0x01CBDA 07:CBCA: 01
	.byte $11					;- - - - - - 0x01CBDB 07:CBCB: 11
	.byte $80					;- - - - - - 0x01CBDC 07:CBCC: 80
	.byte $02					;- - - - - - 0x01CBDD 07:CBCD: 02
	.byte $01					;- - - - - - 0x01CBDE 07:CBCE: 01
	.byte $11					;- - - - - - 0x01CBDF 07:CBCF: 11
	.byte $20					;- - - - - - 0x01CBE0 07:CBD0: 20
	.byte $61					;- - - - - - 0x01CBE1 07:CBD1: 61
	.byte $22					;- - - - - - 0x01CBE2 07:CBD2: 22
	.byte $02					;- - - - - - 0x01CBE3 07:CBD3: 02
	.byte $20					;- - - - - - 0x01CBE4 07:CBD4: 20
	.byte $FF					;- - - - - - 0x01CBE5 07:CBD5: FF
	.byte $EF					;- - - - - - 0x01CBE6 07:CBD6: EF
	.byte $7F					;- - - - - - 0x01CBE7 07:CBD7: 7F
	.byte $8F					;- - - - - - 0x01CBE8 07:CBD8: 8F
	.byte $FE					;- - - - - - 0x01CBE9 07:CBD9: FE
	.byte $FF					;- - - - - - 0x01CBEA 07:CBDA: FF

DMCSampleTable:
	;Pointing to nonexistent samples at C240,C040,C2C0 and C340
	;(See DATA_0EC823)
	;00: FREQ
	;01: RAW
	;02: START
	;03: LEN
	.byte $0F					;- - - - - - 0x01CBEB 07:CBDB: 0F
	.byte $FF					;- - - - - - 0x01CBEC 07:CBDC: FF
	.byte $09					;- - - - - - 0x01CBED 07:CBDD: 09
	.byte $07					;- - - - - - 0x01CBEE 07:CBDE: 07

	.byte $0F					;- - - - - - 0x01CBEF 07:CBDF: 0F
	.byte $FF					;- - - - - - 0x01CBF0 07:CBE0: FF
	.byte $01					;- - - - - - 0x01CBF1 07:CBE1: 01
	.byte $21					;- - - - - - 0x01CBF2 07:CBE2: 21

	.byte $0F					;- - - - - - 0x01CBF3 07:CBE3: 0F
	.byte $FF					;- - - - - - 0x01CBF4 07:CBE4: FF
	.byte $0B					;- - - - - - 0x01CBF5 07:CBE5: 0B
	.byte $07					;- - - - - - 0x01CBF6 07:CBE6: 07

	.byte $0F					;- - - - - - 0x01CBF7 07:CBE7: 0F
	.byte $FF					;- - - - - - 0x01CBF8 07:CBE8: FF
	.byte $0D					;- - - - - - 0x01CBF9 07:CBE9: 0D
	.byte $04					;- - - - - - 0x01CBFA 07:CBEA: 04

CODE_0ECBEB:
	;Unreached
	STA musicTempA				;- - - - - - 0x01CBFB 07:CBEB: 85
	STX musicTempB				;- - - - - - 0x01CBFD 07:CBED: 86
	TAX							;- - - - - - 0x01CBFF 07:CBEF: AA
	LDA DATA_0ECC1F,X			;- - - - - - 0x01CC00 07:CBF0: BD
	AND #$7F					;- - - - - - 0x01CC03 07:CBF3: 29
	STA musicAdr				;- - - - - - 0x01CC05 07:CBF5: 85

	LDA soundTrigger			;- - - - - - 0x01CC07 07:CBF7: A5
	AND #$7F					;- - - - - - 0x01CC09 07:CBF9: 29
	CMP musicTempA				;- - - - - - 0x01CC0B 07:CBFB: C5
	BEQ CODE_0ECC0B				;- - - - - - 0x01CC0D 07:CBFD: F0
	TAX							;- - - - - - 0x01CC0F 07:CBFF: AA
	LDA DATA_0ECC1F,X			;- - - - - - 0x01CC10 07:CC00: BD
	AND #$7F					;- - - - - - 0x01CC13 07:CC03: 29
	CMP musicAdr				;- - - - - - 0x01CC15 07:CC05: C5
	BCC CODE_0ECC10				;- - - - - - 0x01CC17 07:CC07: 90
	BCS CODE_0ECC14				;- - - - - - 0x01CC19 07:CC09: B0
CODE_0ECC0B:
	LDA DATA_0ECC1F,X			;- - - - - - 0x01CC1B 07:CC0B: BD
	BPL CODE_0ECC14				;- - - - - - 0x01CC1E 07:CC0E: 10
CODE_0ECC10:
	LDA musicAdr+1				;- - - - - - 0x01CC20 07:CC10: A5
	BNE CODE_0ECC1C				;- - - - - - 0x01CC22 07:CC12: D0
CODE_0ECC14:
	LDA musicTempA				;- - - - - - 0x01CC24 07:CC14: A5
	STA soundTrigger				;- - - - - - 0x01CC26 07:CC16: 85
	LDA #$01					;- - - - - - 0x01CC28 07:CC18: A9
	STA musicAdr+1				;- - - - - - 0x01CC2A 07:CC1A: 85
CODE_0ECC1C:
	LDX musicTempB				;- - - - - - 0x01CC2C 07:CC1C: A6
	RTS							;- - - - - - 0x01CC2E 07:CC1E: 60

DATA_0ECC1F:
	.byte $00					;- - - - - - 0x01CC2F 07:CC1F: 00
	.byte $50					;- - - - - - 0x01CC30 07:CC20: 50
	.byte $3C					;- - - - - - 0x01CC31 07:CC21: 3C
	.byte $28					;- - - - - - 0x01CC32 07:CC22: 28
	.byte $28					;- - - - - - 0x01CC33 07:CC23: 28
	.byte $28					;- - - - - - 0x01CC34 07:CC24: 28
	.byte $28					;- - - - - - 0x01CC35 07:CC25: 28
	.byte $28					;- - - - - - 0x01CC36 07:CC26: 28
	.byte $50					;- - - - - - 0x01CC37 07:CC27: 50
	.byte $28					;- - - - - - 0x01CC38 07:CC28: 28
	.byte $50					;- - - - - - 0x01CC39 07:CC29: 50
	.byte $14					;- - - - - - 0x01CC3A 07:CC2A: 14
	.byte $00					;- - - - - - 0x01CC3B 07:CC2B: 00
	.byte $00					;- - - - - - 0x01CC3C 07:CC2C: 00
	.byte $00					;- - - - - - 0x01CC3D 07:CC2D: 00
	.byte $50					;- - - - - - 0x01CC3E 07:CC2E: 50
	.byte $50					;- - - - - - 0x01CC3F 07:CC2F: 50
	.byte $1E					;- - - - - - 0x01CC40 07:CC30: 1E
	.byte $1E					;- - - - - - 0x01CC41 07:CC31: 1E
	.byte $00					;- - - - - - 0x01CC42 07:CC32: 00
	.byte $00					;- - - - - - 0x01CC43 07:CC33: 00
	.byte $28					;- - - - - - 0x01CC44 07:CC34: 28
	.byte $1E					;- - - - - - 0x01CC45 07:CC35: 1E
	.byte $D0					;- - - - - - 0x01CC46 07:CC36: D0
	.byte $D0					;- - - - - - 0x01CC47 07:CC37: D0
	.byte $C6					;- - - - - - 0x01CC48 07:CC38: C6
	.byte $C6					;- - - - - - 0x01CC49 07:CC39: C6
	.byte $46					;- - - - - - 0x01CC4A 07:CC3A: 46
	.byte $50					;- - - - - - 0x01CC4B 07:CC3B: 50
	.byte $46					;- - - - - - 0x01CC4C 07:CC3C: 46
	.byte $46					;- - - - - - 0x01CC4D 07:CC3D: 46
	.byte $50					;- - - - - - 0x01CC4E 07:CC3E: 50
	.byte $50					;- - - - - - 0x01CC4F 07:CC3F: 50
	.byte $50					;- - - - - - 0x01CC50 07:CC40: 50
	.byte $50					;- - - - - - 0x01CC51 07:CC41: 50
	.byte $50					;- - - - - - 0x01CC52 07:CC42: 50
	.byte $50					;- - - - - - 0x01CC53 07:CC43: 50
	.byte $50					;- - - - - - 0x01CC54 07:CC44: 50
	.byte $50					;- - - - - - 0x01CC55 07:CC45: 50
	.byte $50					;- - - - - - 0x01CC56 07:CC46: 50
	.byte $D0					;- - - - - - 0x01CC57 07:CC47: D0
	.byte $4B					;- - - - - - 0x01CC58 07:CC48: 4B
	.byte $00					;- - - - - - 0x01CC59 07:CC49: 00
	.byte $50					;- - - - - - 0x01CC5A 07:CC4A: 50
	.byte $50					;- - - - - - 0x01CC5B 07:CC4B: 50
	.byte $50					;- - - - - - 0x01CC5C 07:CC4C: 50
	.byte $50					;- - - - - - 0x01CC5D 07:CC4D: 50
	.byte $46					;- - - - - - 0x01CC5E 07:CC4E: 46
	.byte $50					;- - - - - - 0x01CC5F 07:CC4F: 50
	.byte $50					;- - - - - - 0x01CC60 07:CC50: 50
	.byte $50					;- - - - - - 0x01CC61 07:CC51: 50
	.byte $4E					;- - - - - - 0x01CC62 07:CC52: 4E
	.byte $4B					;- - - - - - 0x01CC63 07:CC53: 4B
	.byte $50					;- - - - - - 0x01CC64 07:CC54: 50
	.byte $50					;- - - - - - 0x01CC65 07:CC55: 50
	.byte $1E					;- - - - - - 0x01CC66 07:CC56: 1E
	.byte $1E					;- - - - - - 0x01CC67 07:CC57: 1E
	.byte $1E					;- - - - - - 0x01CC68 07:CC58: 1E
	.byte $1E					;- - - - - - 0x01CC69 07:CC59: 1E
	.byte $1E					;- - - - - - 0x01CC6A 07:CC5A: 1E
	.byte $1E					;- - - - - - 0x01CC6B 07:CC5B: 1E
	.byte $1E					;- - - - - - 0x01CC6C 07:CC5C: 1E
	.byte $1E					;- - - - - - 0x01CC6D 07:CC5D: 1E
	.byte $1E					;- - - - - - 0x01CC6E 07:CC5E: 1E

TempoDelayLists:
	;- D 0 - - - 0x01CC6F 07:CC5F: 61
	;Struct will have delays for 16 types of note durations
	.word DefaultTempoDelays

DefaultTempoDelays:
	.byte $30					;- D 0 - - - 0x01CC71 07:CC61: 30
	.byte $24					;- D 0 - - - 0x01CC72 07:CC62: 24
	.byte $20					;- - - - - - 0x01CC73 07:CC63: 20
	.byte $18					;- D 0 - - - 0x01CC74 07:CC64: 18
	.byte $12					;- D 0 - - - 0x01CC75 07:CC65: 12
	.byte $10					;- - - - - - 0x01CC76 07:CC66: 10
	.byte $0C					;- D 0 - - - 0x01CC77 07:CC67: 0C
	.byte $09					;- - - - - - 0x01CC78 07:CC68: 09
	.byte $08					;- D 0 - - - 0x01CC79 07:CC69: 08
	.byte $06					;- D 0 - - - 0x01CC7A 07:CC6A: 06
	.byte $00					;- - - - - - 0x01CC7B 07:CC6B: 00
	.byte $04					;- D 0 - - - 0x01CC7C 07:CC6C: 04
	.byte $03					;- D 0 - - - 0x01CC7D 07:CC6D: 03
	.byte $00					;- - - - - - 0x01CC7E 07:CC6E: 00
	.byte $02					;- - - - - - 0x01CC7F 07:CC6F: 02
	.byte $00					;- - - - - - 0x01CC80 07:CC70: 00

DATA_0ECC71:
	;- D 0 - - - 0x01CC81 07:CC71: EC
	.word $03EC
	.word $03D0
	.word $03B3
	.word $0399
	.word $037E
	.word $0365
	.word $034C
	.word $0334
	.word $031D
	.word $0306
	.word $02F0
	.word $02DB
	.word $02C6
	.word $02B2
	.word $029E
	.word $028C
	.word $0278
	.word $0267
	.word $0255
	.word $0244
	.word $0233
	.word $0224
	.word $0214
	.word $0205

DATA_0ECCA1:
	.byte $08					;- - - - - - 0x01CCB1 07:CCA1: 08
	.byte $07					;- - - - - - 0x01CCB2 07:CCA2: 07
	.byte $06					;- - - - - - 0x01CCB3 07:CCA3: 06
	.byte $08					;- - - - - - 0x01CCB4 07:CCA4: 08
	.byte $07					;- - - - - - 0x01CCB5 07:CCA5: 07
	.byte $06					;- - - - - - 0x01CCB6 07:CCA6: 06
	.byte $05					;- - - - - - 0x01CCB7 07:CCA7: 05
	.byte $04					;- - - - - - 0x01CCB8 07:CCA8: 04
	.byte $03					;- - - - - - 0x01CCB9 07:CCA9: 03
	.byte $02					;- - - - - - 0x01CCBA 07:CCAA: 02
	.byte $01					;- - - - - - 0x01CCBB 07:CCAB: 01
	.byte $01					;- - - - - - 0x01CCBC 07:CCAC: 01
	.byte $01					;- - - - - - 0x01CCBD 07:CCAD: 01
	.byte $01					;- - - - - - 0x01CCBE 07:CCAE: 01
	.byte $01					;- - - - - - 0x01CCBF 07:CCAF: 01
	.byte $01					;- - - - - - 0x01CCC0 07:CCB0: 01
	.byte $00					;- - - - - - 0x01CCC1 07:CCB1: 00
	.byte $00					;- - - - - - 0x01CCC2 07:CCB2: 00
	.byte $00					;- - - - - - 0x01CCC3 07:CCB3: 00
	.byte $00					;- - - - - - 0x01CCC4 07:CCB4: 00
	.byte $00					;- - - - - - 0x01CCC5 07:CCB5: 00

DATA_0ECCB6:
	.word DATA_0ECCBE			;- D 0 - - - 0x01CCC6 07:CCB6: BE
	.word DATA_0ECD0D			;- D 0 - - - 0x01CCC8 07:CCB8: 0D
	.word DATA_0ECD5C			;- D 0 - - - 0x01CCCA 07:CCBA: 5C
	.word DATA_0ECD9C			;- D 0 - - - 0x01CCCC 07:CCBC: 9C

DATA_0ECCBE:
	;- D 0 - - - 0x01CCCE 07:CCBE: CC
	.word DATA_0ECCCC
	.word DATA_0ECCCC
	.word DATA_0ECCD9
	.word DATA_0ECCE6
	.word DATA_0ECCF3
	.word DATA_0ECD00
	.word DATA_0ECD00

DATA_0ECCCC:
	.byte $00					;- D 0 - - - 0x01CCDC 07:CCCC: 00
	.byte $84					;- D 0 - - - 0x01CCDD 07:CCCD: 84
	.byte $86					;- D 0 - - - 0x01CCDE 07:CCCE: 86
	.byte $88					;- D 0 - - - 0x01CCDF 07:CCCF: 88
	.byte $86					;- D 0 - - - 0x01CCE0 07:CCD0: 86
	.byte $84					;- D 0 - - - 0x01CCE1 07:CCD1: 84
	.byte $00					;- D 0 - - - 0x01CCE2 07:CCD2: 00
	.byte $04					;- D 0 - - - 0x01CCE3 07:CCD3: 04
	.byte $06					;- D 0 - - - 0x01CCE4 07:CCD4: 06
	.byte $08					;- D 0 - - - 0x01CCE5 07:CCD5: 08
	.byte $06					;- D 0 - - - 0x01CCE6 07:CCD6: 06
	.byte $04					;- D 0 - - - 0x01CCE7 07:CCD7: 04
	.byte $FF					;- D 0 - - - 0x01CCE8 07:CCD8: FF

DATA_0ECCD9:
	.byte $00					;- D 0 - - - 0x01CCE9 07:CCD9: 00
	.byte $82					;- D 0 - - - 0x01CCEA 07:CCDA: 82
	.byte $83					;- D 0 - - - 0x01CCEB 07:CCDB: 83
	.byte $84					;- D 0 - - - 0x01CCEC 07:CCDC: 84
	.byte $83					;- D 0 - - - 0x01CCED 07:CCDD: 83
	.byte $82					;- D 0 - - - 0x01CCEE 07:CCDE: 82
	.byte $00					;- D 0 - - - 0x01CCEF 07:CCDF: 00
	.byte $02					;- D 0 - - - 0x01CCF0 07:CCE0: 02
	.byte $03					;- D 0 - - - 0x01CCF1 07:CCE1: 03
	.byte $04					;- D 0 - - - 0x01CCF2 07:CCE2: 04
	.byte $03					;- D 0 - - - 0x01CCF3 07:CCE3: 03
	.byte $02					;- D 0 - - - 0x01CCF4 07:CCE4: 02
	.byte $FF					;- D 0 - - - 0x01CCF5 07:CCE5: FF

DATA_0ECCE6:
	.byte $00					;- D 0 - - - 0x01CCF6 07:CCE6: 00
	.byte $81					;- D 0 - - - 0x01CCF7 07:CCE7: 81
	.byte $81					;- D 0 - - - 0x01CCF8 07:CCE8: 81
	.byte $82					;- D 0 - - - 0x01CCF9 07:CCE9: 82
	.byte $81					;- D 0 - - - 0x01CCFA 07:CCEA: 81
	.byte $81					;- D 0 - - - 0x01CCFB 07:CCEB: 81
	.byte $00					;- D 0 - - - 0x01CCFC 07:CCEC: 00
	.byte $01					;- D 0 - - - 0x01CCFD 07:CCED: 01
	.byte $01					;- D 0 - - - 0x01CCFE 07:CCEE: 01
	.byte $02					;- D 0 - - - 0x01CCFF 07:CCEF: 02
	.byte $01					;- D 0 - - - 0x01CD00 07:CCF0: 01
	.byte $01					;- D 0 - - - 0x01CD01 07:CCF1: 01
	.byte $FF					;- D 0 - - - 0x01CD02 07:CCF2: FF

DATA_0ECCF3:
	.byte $00					;- - - - - - 0x01CD03 07:CCF3: 00
	.byte $00					;- - - - - - 0x01CD04 07:CCF4: 00
	.byte $81					;- - - - - - 0x01CD05 07:CCF5: 81
	.byte $81					;- - - - - - 0x01CD06 07:CCF6: 81
	.byte $81					;- - - - - - 0x01CD07 07:CCF7: 81
	.byte $00					;- - - - - - 0x01CD08 07:CCF8: 00
	.byte $00					;- - - - - - 0x01CD09 07:CCF9: 00
	.byte $00					;- - - - - - 0x01CD0A 07:CCFA: 00
	.byte $01					;- - - - - - 0x01CD0B 07:CCFB: 01
	.byte $01					;- - - - - - 0x01CD0C 07:CCFC: 01
	.byte $01					;- - - - - - 0x01CD0D 07:CCFD: 01
	.byte $00					;- - - - - - 0x01CD0E 07:CCFE: 00
	.byte $FF					;- - - - - - 0x01CD0F 07:CCFF: FF

DATA_0ECD00:
	.byte $00					;- - - - - - 0x01CD10 07:CD00: 00
	.byte $00					;- - - - - - 0x01CD11 07:CD01: 00
	.byte $00					;- - - - - - 0x01CD12 07:CD02: 00
	.byte $00					;- - - - - - 0x01CD13 07:CD03: 00
	.byte $00					;- - - - - - 0x01CD14 07:CD04: 00
	.byte $00					;- - - - - - 0x01CD15 07:CD05: 00
	.byte $00					;- - - - - - 0x01CD16 07:CD06: 00
	.byte $00					;- - - - - - 0x01CD17 07:CD07: 00
	.byte $00					;- - - - - - 0x01CD18 07:CD08: 00
	.byte $00					;- - - - - - 0x01CD19 07:CD09: 00
	.byte $00					;- - - - - - 0x01CD1A 07:CD0A: 00
	.byte $00					;- - - - - - 0x01CD1B 07:CD0B: 00
	.byte $FF					;- - - - - - 0x01CD1C 07:CD0C: FF

DATA_0ECD0D:
	;- - - - - - 0x01CD1D 07:CD0D: 1B
	.word DATA_0ECD1B
	.word DATA_0ECD1B
	.word DATA_0ECD28
	.word DATA_0ECD35
	.word DATA_0ECD42
	.word DATA_0ECD4F
	.word DATA_0ECD00

DATA_0ECD1B:
	.byte $00					;- - - - - - 0x01CD2B 07:CD1B: 00
	.byte $88					;- - - - - - 0x01CD2C 07:CD1C: 88
	.byte $8C					;- - - - - - 0x01CD2D 07:CD1D: 8C
	.byte $90					;- - - - - - 0x01CD2E 07:CD1E: 90
	.byte $8C					;- - - - - - 0x01CD2F 07:CD1F: 8C
	.byte $88					;- - - - - - 0x01CD30 07:CD20: 88
	.byte $00					;- - - - - - 0x01CD31 07:CD21: 00
	.byte $08					;- - - - - - 0x01CD32 07:CD22: 08
	.byte $0C					;- - - - - - 0x01CD33 07:CD23: 0C
	.byte $10					;- - - - - - 0x01CD34 07:CD24: 10
	.byte $0C					;- - - - - - 0x01CD35 07:CD25: 0C
	.byte $08					;- - - - - - 0x01CD36 07:CD26: 08
	.byte $FF					;- - - - - - 0x01CD37 07:CD27: FF

DATA_0ECD28:
	.byte $00					;- D 0 - - - 0x01CD38 07:CD28: 00
	.byte $84					;- D 0 - - - 0x01CD39 07:CD29: 84
	.byte $86					;- D 0 - - - 0x01CD3A 07:CD2A: 86
	.byte $88					;- D 0 - - - 0x01CD3B 07:CD2B: 88
	.byte $86					;- D 0 - - - 0x01CD3C 07:CD2C: 86
	.byte $84					;- D 0 - - - 0x01CD3D 07:CD2D: 84
	.byte $00					;- D 0 - - - 0x01CD3E 07:CD2E: 00
	.byte $04					;- D 0 - - - 0x01CD3F 07:CD2F: 04
	.byte $06					;- D 0 - - - 0x01CD40 07:CD30: 06
	.byte $08					;- D 0 - - - 0x01CD41 07:CD31: 08
	.byte $06					;- D 0 - - - 0x01CD42 07:CD32: 06
	.byte $04					;- D 0 - - - 0x01CD43 07:CD33: 04
	.byte $FF					;- D 0 - - - 0x01CD44 07:CD34: FF

DATA_0ECD35:
	.byte $00					;- D 0 - - - 0x01CD45 07:CD35: 00
	.byte $82					;- D 0 - - - 0x01CD46 07:CD36: 82
	.byte $83					;- D 0 - - - 0x01CD47 07:CD37: 83
	.byte $84					;- D 0 - - - 0x01CD48 07:CD38: 84
	.byte $83					;- D 0 - - - 0x01CD49 07:CD39: 83
	.byte $82					;- D 0 - - - 0x01CD4A 07:CD3A: 82
	.byte $00					;- D 0 - - - 0x01CD4B 07:CD3B: 00
	.byte $02					;- D 0 - - - 0x01CD4C 07:CD3C: 02
	.byte $03					;- D 0 - - - 0x01CD4D 07:CD3D: 03
	.byte $04					;- D 0 - - - 0x01CD4E 07:CD3E: 04
	.byte $03					;- D 0 - - - 0x01CD4F 07:CD3F: 03
	.byte $02					;- D 0 - - - 0x01CD50 07:CD40: 02
	.byte $FF					;- D 0 - - - 0x01CD51 07:CD41: FF

DATA_0ECD42:
	.byte $00					;- - - - - - 0x01CD52 07:CD42: 00
	.byte $81					;- - - - - - 0x01CD53 07:CD43: 81
	.byte $81					;- - - - - - 0x01CD54 07:CD44: 81
	.byte $82					;- - - - - - 0x01CD55 07:CD45: 82
	.byte $81					;- - - - - - 0x01CD56 07:CD46: 81
	.byte $81					;- - - - - - 0x01CD57 07:CD47: 81
	.byte $00					;- - - - - - 0x01CD58 07:CD48: 00
	.byte $01					;- - - - - - 0x01CD59 07:CD49: 01
	.byte $01					;- - - - - - 0x01CD5A 07:CD4A: 01
	.byte $02					;- - - - - - 0x01CD5B 07:CD4B: 02
	.byte $01					;- - - - - - 0x01CD5C 07:CD4C: 01
	.byte $01					;- - - - - - 0x01CD5D 07:CD4D: 01
	.byte $FF					;- - - - - - 0x01CD5E 07:CD4E: FF

DATA_0ECD4F:
	.byte $00					;- - - - - - 0x01CD5F 07:CD4F: 00
	.byte $00					;- - - - - - 0x01CD60 07:CD50: 00
	.byte $81					;- - - - - - 0x01CD61 07:CD51: 81
	.byte $81					;- - - - - - 0x01CD62 07:CD52: 81
	.byte $81					;- - - - - - 0x01CD63 07:CD53: 81
	.byte $00					;- - - - - - 0x01CD64 07:CD54: 00
	.byte $00					;- - - - - - 0x01CD65 07:CD55: 00
	.byte $00					;- - - - - - 0x01CD66 07:CD56: 00
	.byte $01					;- - - - - - 0x01CD67 07:CD57: 01
	.byte $01					;- - - - - - 0x01CD68 07:CD58: 01
	.byte $01					;- - - - - - 0x01CD69 07:CD59: 01
	.byte $00					;- - - - - - 0x01CD6A 07:CD5A: 00
	.byte $FF					;- - - - - - 0x01CD6B 07:CD5B: FF

DATA_0ECD5C:
	;- - - - - - 0x01CD6C 07:CD5C: 6A
	.word DATA_0ECD6A
	.word DATA_0ECD6A
	.word DATA_0ECD74
	.word DATA_0ECD7E
	.word DATA_0ECD88
	.word DATA_0ECD92
	.word DATA_0ECD92

DATA_0ECD6A:
	.byte $00					;- D 0 - - - 0x01CD7A 07:CD6A: 00
	.byte $84					;- D 0 - - - 0x01CD7B 07:CD6B: 84
	.byte $88					;- D 0 - - - 0x01CD7C 07:CD6C: 88
	.byte $84					;- D 0 - - - 0x01CD7D 07:CD6D: 84
	.byte $00					;- D 0 - - - 0x01CD7E 07:CD6E: 00
	.byte $04					;- D 0 - - - 0x01CD7F 07:CD6F: 04
	.byte $08					;- D 0 - - - 0x01CD80 07:CD70: 08
	.byte $04					;- - - - - - 0x01CD81 07:CD71: 04
	.byte $02					;- - - - - - 0x01CD82 07:CD72: 02
	.byte $FF					;- - - - - - 0x01CD83 07:CD73: FF

DATA_0ECD74:
	.byte $00					;- D 0 - - - 0x01CD84 07:CD74: 00
	.byte $82					;- D 0 - - - 0x01CD85 07:CD75: 82
	.byte $84					;- D 0 - - - 0x01CD86 07:CD76: 84
	.byte $82					;- D 0 - - - 0x01CD87 07:CD77: 82
	.byte $00					;- D 0 - - - 0x01CD88 07:CD78: 00
	.byte $02					;- D 0 - - - 0x01CD89 07:CD79: 02
	.byte $04					;- D 0 - - - 0x01CD8A 07:CD7A: 04
	.byte $02					;- D 0 - - - 0x01CD8B 07:CD7B: 02
	.byte $01					;- D 0 - - - 0x01CD8C 07:CD7C: 01
	.byte $FF					;- D 0 - - - 0x01CD8D 07:CD7D: FF

DATA_0ECD7E:
	.byte $00					;- - - - - - 0x01CD8E 07:CD7E: 00
	.byte $81					;- - - - - - 0x01CD8F 07:CD7F: 81
	.byte $82					;- - - - - - 0x01CD90 07:CD80: 82
	.byte $81					;- - - - - - 0x01CD91 07:CD81: 81
	.byte $00					;- - - - - - 0x01CD92 07:CD82: 00
	.byte $01					;- - - - - - 0x01CD93 07:CD83: 01
	.byte $02					;- - - - - - 0x01CD94 07:CD84: 02
	.byte $01					;- - - - - - 0x01CD95 07:CD85: 01
	.byte $00					;- - - - - - 0x01CD96 07:CD86: 00
	.byte $FF					;- - - - - - 0x01CD97 07:CD87: FF

DATA_0ECD88:
	.byte $00					;- - - - - - 0x01CD98 07:CD88: 00
	.byte $00					;- - - - - - 0x01CD99 07:CD89: 00
	.byte $81					;- - - - - - 0x01CD9A 07:CD8A: 81
	.byte $00					;- - - - - - 0x01CD9B 07:CD8B: 00
	.byte $00					;- - - - - - 0x01CD9C 07:CD8C: 00
	.byte $00					;- - - - - - 0x01CD9D 07:CD8D: 00
	.byte $01					;- - - - - - 0x01CD9E 07:CD8E: 01
	.byte $00					;- - - - - - 0x01CD9F 07:CD8F: 00
	.byte $00					;- - - - - - 0x01CDA0 07:CD90: 00
	.byte $FF					;- - - - - - 0x01CDA1 07:CD91: FF

DATA_0ECD92:
	.byte $00					;- - - - - - 0x01CDA2 07:CD92: 00
	.byte $00					;- - - - - - 0x01CDA3 07:CD93: 00
	.byte $00					;- - - - - - 0x01CDA4 07:CD94: 00
	.byte $00					;- - - - - - 0x01CDA5 07:CD95: 00
	.byte $00					;- - - - - - 0x01CDA6 07:CD96: 00
	.byte $00					;- - - - - - 0x01CDA7 07:CD97: 00
	.byte $00					;- - - - - - 0x01CDA8 07:CD98: 00
	.byte $00					;- - - - - - 0x01CDA9 07:CD99: 00
	.byte $00					;- - - - - - 0x01CDAA 07:CD9A: 00
	.byte $FF					;- - - - - - 0x01CDAB 07:CD9B: FF

DATA_0ECD9C:
	;- - - - - - 0x01CDAC 07:CD9C: AA
	.word DATA_0ECDAA
	.word DATA_0ECDAA
	.word DATA_0ECDB4
	.word DATA_0ECDBE
	.word DATA_0ECDC8
	.word DATA_0ECDD2
	.word DATA_0ECD92

DATA_0ECDAA:
	.byte $00					;- D 0 - - - 0x01CDBA 07:CDAA: 00
	.byte $88					;- D 0 - - - 0x01CDBB 07:CDAB: 88
	.byte $90					;- D 0 - - - 0x01CDBC 07:CDAC: 90
	.byte $88					;- D 0 - - - 0x01CDBD 07:CDAD: 88
	.byte $00					;- D 0 - - - 0x01CDBE 07:CDAE: 00
	.byte $08					;- D 0 - - - 0x01CDBF 07:CDAF: 08
	.byte $10					;- D 0 - - - 0x01CDC0 07:CDB0: 10
	.byte $08					;- D 0 - - - 0x01CDC1 07:CDB1: 08
	.byte $04					;- D 0 - - - 0x01CDC2 07:CDB2: 04
	.byte $FF					;- D 0 - - - 0x01CDC3 07:CDB3: FF

DATA_0ECDB4:
	.byte $00					;- D 0 - - - 0x01CDC4 07:CDB4: 00
	.byte $84					;- D 0 - - - 0x01CDC5 07:CDB5: 84
	.byte $88					;- D 0 - - - 0x01CDC6 07:CDB6: 88
	.byte $84					;- D 0 - - - 0x01CDC7 07:CDB7: 84
	.byte $00					;- D 0 - - - 0x01CDC8 07:CDB8: 00
	.byte $04					;- D 0 - - - 0x01CDC9 07:CDB9: 04
	.byte $08					;- D 0 - - - 0x01CDCA 07:CDBA: 08
	.byte $04					;- D 0 - - - 0x01CDCB 07:CDBB: 04
	.byte $02					;- D 0 - - - 0x01CDCC 07:CDBC: 02
	.byte $FF					;- D 0 - - - 0x01CDCD 07:CDBD: FF

DATA_0ECDBE:
	.byte $00					;- D 0 - - - 0x01CDCE 07:CDBE: 00
	.byte $82					;- D 0 - - - 0x01CDCF 07:CDBF: 82
	.byte $84					;- D 0 - - - 0x01CDD0 07:CDC0: 84
	.byte $82					;- D 0 - - - 0x01CDD1 07:CDC1: 82
	.byte $00					;- D 0 - - - 0x01CDD2 07:CDC2: 00
	.byte $02					;- D 0 - - - 0x01CDD3 07:CDC3: 02
	.byte $04					;- D 0 - - - 0x01CDD4 07:CDC4: 04
	.byte $02					;- D 0 - - - 0x01CDD5 07:CDC5: 02
	.byte $01					;- D 0 - - - 0x01CDD6 07:CDC6: 01
	.byte $FF					;- D 0 - - - 0x01CDD7 07:CDC7: FF

DATA_0ECDC8:
	.byte $00					;- - - - - - 0x01CDD8 07:CDC8: 00
	.byte $81					;- - - - - - 0x01CDD9 07:CDC9: 81
	.byte $82					;- - - - - - 0x01CDDA 07:CDCA: 82
	.byte $81					;- - - - - - 0x01CDDB 07:CDCB: 81
	.byte $00					;- - - - - - 0x01CDDC 07:CDCC: 00
	.byte $01					;- - - - - - 0x01CDDD 07:CDCD: 01
	.byte $02					;- - - - - - 0x01CDDE 07:CDCE: 02
	.byte $01					;- - - - - - 0x01CDDF 07:CDCF: 01
	.byte $00					;- - - - - - 0x01CDE0 07:CDD0: 00
	.byte $FF					;- - - - - - 0x01CDE1 07:CDD1: FF

DATA_0ECDD2:
	.byte $00					;- - - - - - 0x01CDE2 07:CDD2: 00
	.byte $00					;- - - - - - 0x01CDE3 07:CDD3: 00
	.byte $81					;- - - - - - 0x01CDE4 07:CDD4: 81
	.byte $00					;- - - - - - 0x01CDE5 07:CDD5: 00
	.byte $00					;- - - - - - 0x01CDE6 07:CDD6: 00
	.byte $00					;- - - - - - 0x01CDE7 07:CDD7: 00
	.byte $01					;- - - - - - 0x01CDE8 07:CDD8: 01
	.byte $00					;- - - - - - 0x01CDE9 07:CDD9: 00
	.byte $00					;- - - - - - 0x01CDEA 07:CDDA: 00
	.byte $FF					;- - - - - - 0x01CDEB 07:CDDB: FF

DATA_0ECDDC:
	;VOL, $400D, LO, HI
	.byte $00					;- - - - - - 0x01CDEC 07:CDDC: 00
	.byte $00					;- - - - - - 0x01CDED 07:CDDD: 00
	.byte $00					;- - - - - - 0x01CDEE 07:CDDE: 00
	.byte $00					;- - - - - - 0x01CDEF 07:CDDF: 00

	.byte $02					;- - - - - - 0x01CDF0 07:CDE0: 02
	.byte $00					;- - - - - - 0x01CDF1 07:CDE1: 00
	.byte $01					;- - - - - - 0x01CDF2 07:CDE2: 01
	.byte $30					;- - - - - - 0x01CDF3 07:CDE3: 30

	.byte $06					;- - - - - - 0x01CDF4 07:CDE4: 06
	.byte $00					;- - - - - - 0x01CDF5 07:CDE5: 00
	.byte $0A					;- - - - - - 0x01CDF6 07:CDE6: 0A
	.byte $C0					;- - - - - - 0x01CDF7 07:CDE7: C0

	.byte $0F					;- - - - - - 0x01CDF8 07:CDE8: 0F
	.byte $00					;- - - - - - 0x01CDF9 07:CDE9: 00
	.byte $80					;- - - - - - 0x01CDFA 07:CDEA: 80
	.byte $00					;- - - - - - 0x01CDFB 07:CDEB: 00

	.byte $24					;- - - - - - 0x01CDFC 07:CDEC: 24
	.byte $00					;- - - - - - 0x01CDFD 07:CDED: 00
	.byte $08					;- - - - - - 0x01CDFE 07:CDEE: 08
	.byte $00					;- - - - - - 0x01CDFF 07:CDEF: 00

	.byte $27					;- - - - - - 0x01CE00 07:CDF0: 27
	.byte $00					;- - - - - - 0x01CE01 07:CDF1: 00
	.byte $0B					;- - - - - - 0x01CE02 07:CDF2: 0B
	.byte $00					;- - - - - - 0x01CE03 07:CDF3: 00

jnPause:
	.byte $E4					;- - - - - - 0x01CE04 07:CDF4: E4
	.byte $B7					;- - - - - - 0x01CE05 07:CDF5: B7
	.byte $E0					;- - - - - - 0x01CE06 07:CDF6: E0
	.byte $D3					;- - - - - - 0x01CE07 07:CDF7: D3
	.byte $00					;- - - - - - 0x01CE08 07:CDF8: 00
	.byte $D0					;- - - - - - 0x01CE09 07:CDF9: D0
	.byte $05					;- - - - - - 0x01CE0A 07:CDFA: 05
	.byte $E0					;- - - - - - 0x01CE0B 07:CDFB: E0
	.byte $A7					;- - - - - - 0x01CE0C 07:CDFC: A7
	.byte $00					;- - - - - - 0x01CE0D 07:CDFD: 00
	.byte $D0					;- - - - - - 0x01CE0E 07:CDFE: D0
	.byte $05					;- - - - - - 0x01CE0F 07:CDFF: 05
	.byte $E0					;- - - - - - 0x01CE10 07:CE00: E0
	.byte $8C					;- - - - - - 0x01CE11 07:CE01: 8C
	.byte $00					;- - - - - - 0x01CE12 07:CE02: 00
	.byte $D0					;- - - - - - 0x01CE13 07:CE03: D0
	.byte $05					;- - - - - - 0x01CE14 07:CE04: 05
	.byte $E0					;- - - - - - 0x01CE15 07:CE05: E0
	.byte $69					;- - - - - - 0x01CE16 07:CE06: 69
	.byte $00					;- - - - - - 0x01CE17 07:CE07: 00
	.byte $D0					;- - - - - - 0x01CE18 07:CE08: D0
	.byte $05					;- - - - - - 0x01CE19 07:CE09: 05
	.byte $E4					;- - - - - - 0x01CE1A 07:CE0A: E4
	.byte $B2					;- - - - - - 0x01CE1B 07:CE0B: B2
	.byte $D0					;- - - - - - 0x01CE1C 07:CE0C: D0
	.byte $08					;- - - - - - 0x01CE1D 07:CE0D: 08
	.byte $C0					;- - - - - - 0x01CE1E 07:CE0E: C0

DATA_0ECE0F:
	.byte $15					;- D 0 - - - 0x01CE1F 07:CE0F: 15
	.byte $11					;- D 0 - - - 0x01CE20 07:CE10: 11
	.byte $03					;- D 0 - - - 0x01CE21 07:CE11: 03
	.byte $11					;- D 0 - - - 0x01CE22 07:CE12: 11
	.byte $1F					;- D 0 - - - 0x01CE23 07:CE13: 1F
	.byte $11					;- D 0 - - - 0x01CE24 07:CE14: 11
	.byte $0F					;- D 0 - - - 0x01CE25 07:CE15: 0F
	.byte $11					;- D 0 - - - 0x01CE26 07:CE16: 11
	.byte $12					;- D 0 - - - 0x01CE27 07:CE17: 12
	.byte $21					;- D 0 - - - 0x01CE28 07:CE18: 21
	.byte $02					;- D 0 - - - 0x01CE29 07:CE19: 02
	.byte $21					;- D 0 - - - 0x01CE2A 07:CE1A: 21
	.byte $1F					;- - - - - - 0x01CE2B 07:CE1B: 1F
	.byte $10					;- - - - - - 0x01CE2C 07:CE1C: 10
	.byte $00					;- - - - - - 0x01CE2D 07:CE1D: 00
	.byte $1F					;- - - - - - 0x01CE2E 07:CE1E: 1F
	.byte $1F					;- D 0 - - - 0x01CE2F 07:CE1F: 1F
	.byte $31					;- D 0 - - - 0x01CE30 07:CE20: 31
	.byte $0F					;- D 0 - - - 0x01CE31 07:CE21: 0F
	.byte $21					;- D 0 - - - 0x01CE32 07:CE22: 21
	.byte $13					;- D 0 - - - 0x01CE33 07:CE23: 13
	.byte $11					;- D 0 - - - 0x01CE34 07:CE24: 11
	.byte $02					;- D 0 - - - 0x01CE35 07:CE25: 02
	.byte $13					;- D 0 - - - 0x01CE36 07:CE26: 13
	.byte $15					;- D 0 - - - 0x01CE37 07:CE27: 15
	.byte $21					;- D 0 - - - 0x01CE38 07:CE28: 21
	.byte $01					;- D 0 - - - 0x01CE39 07:CE29: 01
	.byte $14					;- D 0 - - - 0x01CE3A 07:CE2A: 14
	.byte $12					;- - - - - - 0x01CE3B 07:CE2B: 12
	.byte $11					;- - - - - - 0x01CE3C 07:CE2C: 11
	.byte $01					;- - - - - - 0x01CE3D 07:CE2D: 01
	.byte $14					;- - - - - - 0x01CE3E 07:CE2E: 14
	.byte $12					;- - - - - - 0x01CE3F 07:CE2F: 12
	.byte $21					;- - - - - - 0x01CE40 07:CE30: 21
	.byte $03					;- - - - - - 0x01CE41 07:CE31: 03
	.byte $14					;- - - - - - 0x01CE42 07:CE32: 14
	.byte $15					;- - - - - - 0x01CE43 07:CE33: 15
	.byte $11					;- - - - - - 0x01CE44 07:CE34: 11
	.byte $02					;- - - - - - 0x01CE45 07:CE35: 02
	.byte $12					;- - - - - - 0x01CE46 07:CE36: 12
	.byte $1F					;- - - - - - 0x01CE47 07:CE37: 1F
	.byte $15					;- - - - - - 0x01CE48 07:CE38: 15
	.byte $0A					;- - - - - - 0x01CE49 07:CE39: 0A
	.byte $11					;- - - - - - 0x01CE4A 07:CE3A: 11
	.byte $12					;- - - - - - 0x01CE4B 07:CE3B: 12
	.byte $15					;- - - - - - 0x01CE4C 07:CE3C: 15
	.byte $0F					;- - - - - - 0x01CE4D 07:CE3D: 0F
	.byte $11					;- - - - - - 0x01CE4E 07:CE3E: 11
	.byte $15					;- - - - - - 0x01CE4F 07:CE3F: 15
	.byte $16					;- - - - - - 0x01CE50 07:CE40: 16
	.byte $0C					;- - - - - - 0x01CE51 07:CE41: 0C
	.byte $17					;- - - - - - 0x01CE52 07:CE42: 17
.ifdef REGION_JP
	.byte $D8					;- - - - - - 0x01CE53 07:CE43: D8
	.byte $40					;- - - - - - 0x01CE54 07:CE44: 40
	.byte $40					;- - - - - - 0x01CE55 07:CE45: 40
	.byte $E0					;- - - - - - 0x01CE56 07:CE46: E0
	.byte $F8					;- - - - - - 0x01CE57 07:CE47: F8
	.byte $00					;- - - - - - 0x01CE58 07:CE48: 00
	.byte $5F					;- D 0 - - - 0x01CE59 07:CE49: 5F
	.byte $3F					;- D 0 - - - 0x01CE5A 07:CE4A: 3F
	.byte $3F					;- D 0 - - - 0x01CE5B 07:CE4B: 3F
	.byte $3F					;- D 0 - - - 0x01CE5C 07:CE4C: 3F
	.byte $3F					;- - - - - - 0x01CE5D 07:CE4D: 3F
	.byte $5F					;- - - - - - 0x01CE5E 07:CE4E: 5F
	.byte $67					;- - - - - - 0x01CE5F 07:CE4F: 67
.else
	.byte $26					;- - - - - - 0x01CE53 07:CE43: 26
	.byte $11					;- - - - - - 0x01CE54 07:CE44: 11
	.byte $39					;- - - - - - 0x01CE55 07:CE45: 39
	.byte $07					;- - - - - - 0x01CE56 07:CE46: 07
	.byte $6F					;- - - - - - 0x01CE57 07:CE47: 6F
	.byte $00					;- - - - - - 0x01CE58 07:CE48: 00
	.byte $39					;- - - - - - 0x01CE59 07:CE49: 39
	.byte $07					;- - - - - - 0x01CE5A 07:CE4A: 07
	.byte $6F					;- - - - - - 0x01CE5B 07:CE4B: 6F
	.byte $00					;- - - - - - 0x01CE5C 07:CE4C: 00
	.byte $26					;- - - - - - 0x01CE5D 07:CE4D: 26
	.byte $11					;- - - - - - 0x01CE5E 07:CE4E: 11
	.byte $36					;- - - - - - 0x01CE5F 07:CE4F: 36
.endif

MusicTable:
	;- D 0 - - - 0x01CE60 07:CE50: 00
	;00: Tempo index (only 00 valid)
	;01-02: SQ1 sequence adr (zero if none)
	;03-04: SQ2 sequence adr (zero if none)
	;05-06: TRI sequence adr (zero if none)
	;07-08: NOISE sequence adr (zero if none)
	;09: To ram_07F5

	.word trSilence
	.word trTitle
	.word trEnding
	.word trGiantTower
	.word trBoomtown
	.word trShiningLake
	.word trFireCastle
	.word trBoss
	.word trBonusGame
	.word trIntro
	.word trVictory
	.word trFinalBoss
	.word trUNK0C
	.word trSkelWarning
	.word trSkelMonsta
	.word trGameOver

DATA_0ECE70:
.ifdef REGION_JP
	.byte $E0					;- - - - - - 0x01CE80 07:CE70: E0
	.byte $70					;- - - - - - 0x01CE81 07:CE71: 70
	.byte $28					;- - - - - - 0x01CE82 07:CE72: 28
	.byte $14					;- - - - - - 0x01CE83 07:CE73: 14
	.byte $0A					;- - - - - - 0x01CE84 07:CE74: 0A
	.byte $06					;- - - - - - 0x01CE85 07:CE75: 06
	.byte $00					;- - - - - - 0x01CE86 07:CE76: 00
	.byte $00					;- - - - - - 0x01CE87 07:CE77: 00
	.byte $40					;- - - - - - 0x01CE88 07:CE78: 40
	.byte $00					;- D 0 - - - 0x01CE89 07:CE79: 00
	.byte $10					;- D 0 - - - 0x01CE8A 07:CE7A: 10
	.byte $08					;- D 0 - - - 0x01CE8B 07:CE7B: 08
	.byte $04					;- D 0 - - - 0x01CE8C 07:CE7C: 04
	.byte $00					;- - - - - - 0x01CE8D 07:CE7D: 00
	.byte $00					;- - - - - - 0x01CE8E 07:CE7E: 00
	.byte $00					;- - - - - - 0x01CE8F 07:CE7F: 00
.else
	.byte $00					;- - - - - - 0x01CE80 07:CE70: 00
	.byte $3E					;- - - - - - 0x01CE81 07:CE71: 3E
	.byte $07					;- - - - - - 0x01CE82 07:CE72: 07
	.byte $6F					;- - - - - - 0x01CE83 07:CE73: 6F
	.byte $00					;- - - - - - 0x01CE84 07:CE74: 00
	.byte $DB					;- - - - - - 0x01CE85 07:CE75: DB
	.byte $26					;- - - - - - 0x01CE86 07:CE76: 26
	.byte $07					;- - - - - - 0x01CE87 07:CE77: 07
	.byte $6F					;- - - - - - 0x01CE88 07:CE78: 6F
	.byte $00					;- - - - - - 0x01CE89 07:CE79: 00
	.byte $2A					;- - - - - - 0x01CE8A 07:CE7A: 2A
	.byte $07					;- - - - - - 0x01CE8B 07:CE7B: 07
	.byte $6F					;- - - - - - 0x01CE8C 07:CE7C: 6F
	.byte $00					;- - - - - - 0x01CE8D 07:CE7D: 00
	.byte $2B					;- - - - - - 0x01CE8E 07:CE7E: 2B
	.byte $07					;- - - - - - 0x01CE8F 07:CE7F: 07
.endif

SoundTable:
	;- D 0 - - - 0x01CE90 07:CE80: 09
	;SQ2 sequence, NOISE sequence
	.word snSilence,snSilence
	.word snPause,0
	.word snMenuBrowse,0
	.word snMenuCont,0
	.word snUNK04,0
	.word snJump,0
	.word snShootBubble,0
	.word snUNK07,0
	.word snUNK08,0
	.word snDie,0
	.word snRoundItem,0
	.word snExtraLife,0
	.word snRoundSkip,0
	.word snHurt,0
	.word snFloat,0
	.word snBigReward,0
	.word snBigBell,0
	.word snThunder,DATA_0DB754
	.word snFlood,0
	.word snFire,DATA_0DB849
	.word snWind,0
	.word snSnow,0
	.word snStars,0
	.word 0,snUNK17
	.word snBonusFail,0
	.word snUNK19,0
	.word snHolyCup,DATA_0DB9C8
	.word snUNK1B,0
	.word snBasketFail,0
	.word snSnagger,0
	.word snNeedlerHit,0
	.word snInvader,0
	.word snDrunkThrow,0
	.word snUNK21,0
	.word snTrashFall,0
	.word snShoeCar,0
	.word snUNK24,0
	.word 0,snBall
	.word 0,snEnemyThrow
	.word snEnemyPop,0
	.word snReward,0
	.word snBomb,DATA_0DBD0E
	.word 0,snUNK2A
	.word snEnemyHurt,0
	.word snSnaggerDie,DATA_0DBD46
	.word snUNK2D,0
	.word 0,snMissileTractor
	.word 0,snClock

DATA_0ECF40:
.ifdef REGION_JP
	;- - - - - - 0x01CF50 07:CF40: 03
	.incbin "filler/fill0E_Engine_JP.bin"
.else
	;- - - - - - 0x01CF50 07:CF40: 07
	.incbin "filler/fill0E_Engine.bin"
.endif

.segment "PRG_BANK_E_TRACKS"

FixedBankTracks:

trTitle:
	;- D 0 - - - 0x01D310 07:D300: 00
	.byte $00
	.word trTitle_SQ1
	.word trTitle_SQ2
	.word trTitle_TRI
	.word 0
	.byte $F9					;- D 0 - - - 0x01D319 07:D309: F9

trTitle_SQ1:
	;- D 0 - - - 0x01D31A 07:D30A: DC
	.byte SO_UNKDC,$C9
	.byte SO_UNKD8
	.byte SO_UNKD2,$84
	.byte SO_BEGIN_LOOP1,$02
@sD311:
	.byte SO_UNK50|$E
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$24
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2C
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$29
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$24
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2C
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$29
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$24
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK00|$24
	.byte SO_UNK90|$9
	.byte SO_LOOP1
	.word @sD311
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$29
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$29
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$29
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$29
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$29
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNKD2,$86
	.byte SO_UNK00|$2B
	.byte SO_UNK80
	.byte SO_UNK90
	.byte SO_END

trTitle_SQ2:
	;- D 0 - - - 0x01D36B 07:D35B: DC
	.byte SO_UNKDC,$C9
	.byte SO_UNKD8
	.byte SO_UNKD2,$84
	.byte SO_BEGIN_LOOP1,$02
@sD362:
	.byte SO_UNK50|$E
	.byte SO_UNK00|$C
	.byte SO_UNK90|$9
	.byte SO_UNK00|$14
	.byte SO_UNK90|$9
	.byte SO_UNK00|$18
	.byte SO_UNK90|$9
	.byte SO_UNK00|$11
	.byte SO_UNK90|$9
	.byte SO_UNK00|$14
	.byte SO_UNK90|$9
	.byte SO_UNK00|$19
	.byte SO_UNK90|$9
	.byte SO_UNK00|$C
	.byte SO_UNK90|$9
	.byte SO_UNK00|$14
	.byte SO_UNK90|$9
	.byte SO_UNK00|$18
	.byte SO_UNK90|$9
	.byte SO_UNK00|$11
	.byte SO_UNK90|$9
	.byte SO_UNK00|$14
	.byte SO_UNK90|$9
	.byte SO_UNK00|$19
	.byte SO_UNK90|$9
	.byte SO_UNK00|$18
	.byte SO_UNK90|$9
	.byte SO_UNK00|$14
	.byte SO_UNK90|$9
	.byte SO_UNK00|$C
	.byte SO_UNK90|$9
	.byte SO_UNK00|$14
	.byte SO_UNK90|$9
	.byte SO_LOOP1
	.word @sD362
	.byte SO_UNK00|$13
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$9
	.byte SO_UNK00|$15
	.byte SO_UNK90|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$9
	.byte SO_UNK00|$17
	.byte SO_UNK90|$9
	.byte SO_UNK00|$18
	.byte SO_UNK90|$9
	.byte SO_UNK00|$19
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1A
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1C
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1E
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK00|$21
	.byte SO_UNK90|$9
	.byte SO_UNKD2,$86
	.byte SO_UNK00|$22
	.byte SO_UNK80
	.byte SO_UNK90
	.byte SO_END

trTitle_TRI:
	;- D 0 - - - 0x01D3BA 07:D3AA: DC
	.byte SO_UNKDC,$49
	.byte SO_BEGIN_LOOP1,$02
@sD3AE:
	.byte SO_UNK00|$14
	.byte SO_UNK90|$4
	.byte SO_UNK00|$19
	.byte SO_UNK90|$4
	.byte SO_UNK00|$14
	.byte SO_UNK90|$4
	.byte SO_UNK00|$19
	.byte SO_UNK90|$4
	.byte SO_UNK00|$14
	.byte SO_UNK90|$9
	.byte SO_UNKB0|$9
	.byte SO_UNK00|$F
	.byte SO_UNK90|$6
	.byte SO_LOOP1
	.word @sD3AE
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$4
	.byte SO_UNK00|$F
	.byte SO_UNK90|$4
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$4
	.byte SO_UNK00|$F
	.byte SO_UNK90|$4
	.byte SO_UNK00|$13
	.byte SO_UNK90|$9
	.byte SO_UNKB0|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK00|$F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$13
	.byte SO_UNK90|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$9
	.byte SO_UNK00|$13
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$9
	.byte SO_UNK00|$13
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$9
	.byte SO_UNK00|$13
	.byte SO_UNK90|$9
	.byte SO_END

trEnding:
	;- D 0 - - - 0x01D3FC 07:D3EC: 00
	.byte $00
	.word trEnding_SQ1
	.word trEnding_SQ2
	.word trEnding_TRI
	.word 0
	.byte $F0

trEnding_SQ1:
	;- D 0 - - - 0x01D406 07:D3F6: 5C
	.byte SO_UNK50|$C
	.byte SO_UNKDC,$C9
	.byte SO_UNKD8
	.byte SO_UNKD2,$81
@sD3FC:
	.byte SO_UNK50|$C
	.byte SO_BEGIN_LOOP1,$08
@sD3FF:
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_LOOP1
	.word @sD3FF
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$26
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$24
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK00|$24
	.byte SO_UNK90|$9
	.byte SO_UNK00|$22
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1A
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$22
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_BEGIN_LOOP1,$03
@sD42C:
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_LOOP1
	.word @sD42C
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$22
	.byte SO_UNK90|$9
	.byte SO_BEGIN_LOOP1,$02
@sD441:
	.byte SO_CALL
	.word @sD50C
	.byte SO_CALL
	.word @sD50C
	.byte SO_UNKD2,$81
	.byte SO_UNK50|$C
	.byte SO_UNK00|$17
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1E
	.byte SO_UNK90|$9
	.byte SO_UNK00|$23
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2A
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$27
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$23
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$20
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$23
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$27
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$19
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK00|$25
	.byte SO_UNK90|$9
	.byte SO_UNK00|$28
	.byte SO_UNK90|$9
	.byte SO_UNK00|$19
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK00|$25
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1C
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$23
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$22
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1E
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1C
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1E
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$22
	.byte SO_UNK80|$6
	.byte SO_UNK00|$22
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK00|$22
	.byte SO_UNK90|$9
	.byte SO_UNK00|$23
	.byte SO_UNK90|$9
	.byte SO_UNK00|$25
	.byte SO_UNK90|$9
	.byte SO_UNK00|$23
	.byte SO_UNK90|$9
	.byte SO_UNK00|$25
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$4
	.byte SO_UNK00|$23
	.byte SO_UNK90|$6
	.byte SO_UNK00|$25
	.byte SO_UNK90|$6
	.byte SO_UNK00|$27
	.byte SO_UNK80|$6
	.byte SO_UNK00|$27
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$28
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$27
	.byte SO_UNK90|$1
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$26
	.byte SO_UNK90|$1
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$24
	.byte SO_UNK90
	.byte SO_UNK00|$26
	.byte SO_UNK90
	.byte SO_LOOP1
	.word @sD441
	.byte SO_JUMP
	.word @sD3FC
	.byte SO_END
@sD50C:
	.byte SO_UNKD2,$86
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$1
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$8
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK00|$20
	.byte SO_UNK90|$4
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1F
	.byte SO_UNK80|$6
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$1
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$8
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK00|$20
	.byte SO_UNK90|$4
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1F
	.byte SO_UNK80|$6
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$1
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1F
	.byte SO_UNK80|$6
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$1
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$8
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1A
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$3
	.byte SO_UNK00|$18
	.byte SO_UNK80|$6
	.byte SO_UNK00|$18
	.byte SO_UNK90|$1
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$8
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$6
	.byte SO_UNK00|$24
	.byte SO_UNK90|$4
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$22
	.byte SO_UNK80|$6
	.byte SO_UNK00|$22
	.byte SO_UNK90|$1
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$21
	.byte SO_UNK90|$9
	.byte SO_UNK00|$22
	.byte SO_UNK90|$6
	.byte SO_UNK00|$20
	.byte SO_UNK90|$3
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$1
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$8
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$4
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$4
	.byte SO_UNK00|$20
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$1
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$8
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$1
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$8
	.byte SO_UNK90|$9
	.byte SO_RET
	.byte SO_END

trEnding_SQ2:
	;- D 0 - - - 0x01D593 07:D583: 5C
	.byte SO_UNK50|$C
	.byte SO_UNKDC,$C9
	.byte SO_UNKD8
@sD587:
	.byte SO_UNKD2,$81
	.byte SO_UNK50|$9
	.byte SO_UNKB0|$9
	.byte SO_BEGIN_LOOP1,$08
@sD58D:
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_LOOP1
	.word @sD58D
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$26
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK00|$24
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK00|$24
	.byte SO_UNK90|$9
	.byte SO_UNK00|$22
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1A
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$22
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$9
	.byte SO_BEGIN_LOOP1,$03
@sD5BA:
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_LOOP1
	.word @sD5BA
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$9
	.byte SO_BEGIN_LOOP1,$02
@sD5CD:
	.byte SO_CALL
	.word @sD61D
	.byte SO_CALL
	.word @sD61D
	.byte SO_UNKD2,$82
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1B
	.byte SO_UNK80
	.byte SO_UNK90|$6
	.byte SO_UNK00|$19
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$6
	.byte SO_UNK00|$17
	.byte SO_UNK80|$6
	.byte SO_UNK00|$17
	.byte SO_UNK80
	.byte SO_UNK90|$6
	.byte SO_UNK00|$19
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1C
	.byte SO_UNK80|$6
	.byte SO_UNK00|$1C
	.byte SO_UNK80
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1C
	.byte SO_UNK90|$6
	.byte SO_UNK00|$19
	.byte SO_UNK80|$6
	.byte SO_UNK00|$19
	.byte SO_UNK90
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1C
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1E
	.byte SO_UNK80|$6
	.byte SO_UNK00|$1E
	.byte SO_UNK90
	.byte SO_UNK90|$6
	.byte SO_UNK00|$20
	.byte SO_UNK90|$6
	.byte SO_UNK00|$22
	.byte SO_UNK90|$6
	.byte SO_UNK00|$23
	.byte SO_UNK80|$6
	.byte SO_UNK00|$23
	.byte SO_UNK80
	.byte SO_UNK90|$6
	.byte SO_UNK00|$22
	.byte SO_UNK90|$6
	.byte SO_UNK00|$23
	.byte SO_UNK90|$6
	.byte SO_UNK00|$20
	.byte SO_UNK80|$6
	.byte SO_UNK00|$20
	.byte SO_UNK80
	.byte SO_UNK90
	.byte SO_UNK00|$22
	.byte SO_UNK80
	.byte SO_UNK90
	.byte SO_UNK00|$20
	.byte SO_UNK90
	.byte SO_UNK00|$22
	.byte SO_UNK90
	.byte SO_LOOP1
	.word @sD5CD
	.byte SO_JUMP
	.word @sD587
	.byte SO_END
@sD61D:
	.byte SO_UNKD2,$86
	.byte SO_UNK50|$7
	.byte SO_UNK00|$1B
	.byte SO_UNK80
	.byte SO_UNK90|$1
	.byte SO_UNK00|$16
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$22
	.byte SO_UNK80
	.byte SO_UNK80
	.byte SO_UNK00|$22
	.byte SO_UNK90|$1
	.byte SO_UNK00|$24
	.byte SO_UNK90|$9
	.byte SO_UNK00|$26
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$6
	.byte SO_UNK00|$26
	.byte SO_UNK90|$6
	.byte SO_UNK00|$24
	.byte SO_UNK90|$6
	.byte SO_UNK00|$26
	.byte SO_UNK80|$6
	.byte SO_UNK00|$26
	.byte SO_UNK90
	.byte SO_UNK00|$1F
	.byte SO_UNK80
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$1
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1F
	.byte SO_UNK80
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1A
	.byte SO_UNK90|$3
	.byte SO_UNK00|$18
	.byte SO_UNK90|$3
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNK00|$18
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$6
	.byte SO_UNK00|$18
	.byte SO_UNK90|$9
	.byte SO_UNK00|$14
	.byte SO_UNK90|$9
	.byte SO_UNK00|$18
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1A
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$1
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1B
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1A
	.byte SO_UNK90
	.byte SO_RET
	.byte SO_END

trEnding_TRI:
	;- D 0 - - - 0x01D67C 07:D66C: DC
	.byte SO_UNKDC,$49
@sD66E:
	.byte SO_UNK00|$F
	.byte SO_UNK80
	.byte SO_UNK90|$3
	.byte SO_UNK00|$13
	.byte SO_UNK90|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$4
	.byte SO_UNK00|$1B
	.byte SO_UNK90
	.byte SO_UNKB0|$6
	.byte SO_UNK00|$F
	.byte SO_UNK90|$3
	.byte SO_UNK00|$F
	.byte SO_UNK90|$6
	.byte SO_UNK00|$24
	.byte SO_UNK90|$3
	.byte SO_UNK00|$20
	.byte SO_UNK90|$3
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$3
	.byte SO_UNK00|$16
	.byte SO_UNK90|$3
	.byte SO_UNK00|$F
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_BEGIN_LOOP2,$02
@sD68F:
	.byte SO_BEGIN_LOOP1,$02
@sD691:
	.byte SO_UNK00|$F
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$1A
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$18
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$13
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$11
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_LOOP1
	.word @sD691
	.byte SO_UNK00|$17
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNK00|$17
	.byte SO_UNK90|$6
	.byte SO_UNKB0|$6
	.byte SO_UNK00|$17
	.byte SO_UNK90|$6
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNK00|$F
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$F
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNKB0|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$9
	.byte SO_UNKB0|$9
	.byte SO_UNK00|$20
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNK00|$19
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNK00|$19
	.byte SO_UNK90|$6
	.byte SO_UNKB0|$6
	.byte SO_UNK00|$D
	.byte SO_UNK90|$6
	.byte SO_UNK00|$10
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$19
	.byte SO_UNK90|$6
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNKB0|$6
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNK00|$10
	.byte SO_UNK90|$6
	.byte SO_UNK00|$F
	.byte SO_UNK80|$6
	.byte SO_UNK00|$F
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$10
	.byte SO_UNK90|$6
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK80|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$D
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$19
	.byte SO_UNK90|$6
	.byte SO_UNK00|$D
	.byte SO_UNK90|$6
	.byte SO_UNK00|$10
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK90|$3
	.byte SO_UNK90|$3
	.byte SO_UNK90|$3
	.byte SO_UNK90|$6
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK00|$11
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1A
	.byte SO_UNK90|$6
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNK00|$11
	.byte SO_UNK90|$9
	.byte SO_UNK00|$E
	.byte SO_UNK90|$9
	.byte SO_UNK00|$A
	.byte SO_UNK90|$9
	.byte SO_UNK00|$16
	.byte SO_UNK90|$9
	.byte SO_UNK90|$4
	.byte SO_LOOP2
	.word @sD68F
	.byte SO_JUMP
	.word @sD66E
	.byte SO_END

trSkelWarning:
	;- D 0 - - - 0x01D767 07:D757: 00
	.byte $00
	.word trSkelWarning_SQ1
	.word trSkelWarning_SQ2
	.word 0
	.word 0
	.byte $FF

trSkelWarning_SQ1:
	;- D 0 - - - 0x01D771 07:D761: 5F
	.byte SO_UNK50|$F
	.byte SO_UNKDC,$0F
	.byte SO_UNKD8
	.byte SO_UNKD2,$80
	.byte SO_CALL
	.word trSkelWarning_SQ2_D776
	.byte SO_END

trSkelWarning_SQ2:
	;- D 0 - - - 0x01D77B 07:D76B: 59
	.byte SO_UNK50|$9
	.byte SO_UNKDC,$0F
	.byte SO_UNKD8
	.byte SO_UNKD2,$80
	.byte SO_UNKB0|$C
	.byte SO_CALL
	.word trSkelWarning_SQ2_D776
	.byte SO_END
trSkelWarning_SQ2_D776:
	.byte SO_BEGIN_LOOP1,$03
@sD778:
	.byte SO_UNK00|$1F
	.byte SO_UNK90|$C
	.byte SO_UNK00|$22
	.byte SO_UNK90|$C
	.byte SO_UNK00|$24
	.byte SO_UNK90|$C
	.byte SO_UNK00|$25
	.byte SO_UNK90|$C
	.byte SO_UNK00|$29
	.byte SO_UNK90|$C
	.byte SO_UNK00|$2B
	.byte SO_UNK90|$C
	.byte SO_LOOP1
	.word @sD778
	.byte SO_RET
	.byte SO_END

trSkelMonsta:
	;- D 0 - - - 0x01D799 07:D789: 00
	.byte $00
	.word trSkelMonsta_SQ1
	.word trSkelMonsta_SQ2
	.word trSkelMonsta_TRI
	.word 0
	.byte $E0

trSkelMonsta_SQ1:
	;- D 0 - - - 0x01D7A3 07:D793: D8
	.byte SO_UNKD8
	.byte SO_UNKDC,$05
	.byte SO_UNK50|$F
	.byte SO_UNKD2,$00
	.byte SO_UNK00|$12
	.byte SO_UNK90|$9
	.byte SO_UNK00|$11
	.byte SO_UNK90|$9
	.byte SO_UNK00|$12
	.byte SO_UNK80|$6
	.byte SO_UNK80|$3
	.byte SO_UNK90
	.byte SO_END

trSkelMonsta_SQ2:
	;- D 0 - - - 0x01D7B2 07:D7A2: D8
	.byte SO_UNKD8
	.byte SO_UNKDC,$05
	.byte SO_UNK50|$F
	.byte SO_UNKD2,$00
	.byte SO_UNK00|$9
	.byte SO_UNK90|$9
	.byte SO_UNK00|$8
	.byte SO_UNK90|$9
	.byte SO_UNK00|$9
	.byte SO_UNK80|$6
	.byte SO_UNK80|$3
	.byte SO_UNK90
	.byte SO_END

trSkelMonsta_TRI:
	;- D 0 - - - 0x01D7C1 07:D7B1: 12
	.byte SO_UNK00|$12
	.byte SO_UNK90|$9
	.byte SO_UNK00|$11
	.byte SO_UNK90|$9
	.byte SO_UNK00|$12
	.byte SO_UNK80|$6
	.byte SO_UNK80|$3
	.byte SO_UNK90
	.byte SO_END

trGameOver:
	;- D 0 - - - 0x01D7CA 07:D7BA: 00
	.byte $00
	.word trGameOver_SQ1
	.word trGameOver_SQ2
	.word trGameOver_TRI
	.word 0
	.byte $D0

trGameOver_SQ1:
	;- D 0 - - - 0x01D7D4 07:D7C4: DC
	.byte SO_UNKDC,$0F
	.byte SO_UNKD8
	.byte SO_UNKD2,$01
@sD7C9:
	.byte SO_UNK50|$C
	.byte SO_UNK00|$24
	.byte SO_UNK90|$9
	.byte SO_UNK00|$25
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$24
	.byte SO_UNK90|$9
	.byte SO_UNK00|$25
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$21
	.byte SO_UNK90|$9
	.byte SO_UNK00|$22
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$21
	.byte SO_UNK90|$9
	.byte SO_UNK00|$22
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$26
	.byte SO_UNK90|$9
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$26
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$27
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$20
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$25
	.byte SO_UNK90|$9
	.byte SO_UNK00|$29
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2C
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$35
	.byte SO_UNK90|$9
	.byte SO_UNK00|$33
	.byte SO_UNK90|$9
	.byte SO_UNK00|$31
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2F
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2E
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2C
	.byte SO_UNK90|$9
	.byte SO_UNK00|$2A
	.byte SO_UNK90|$9
	.byte SO_UNK00|$29
	.byte SO_UNK90|$9
	.byte SO_JUMP
	.word @sD7C9
	.byte SO_END

trGameOver_SQ2:
	;- D 0 - - - 0x01D858 07:D848: DC
	.byte SO_UNKDC,$0F
	.byte SO_UNKD8
	.byte SO_UNKD2,$01
@sD84D:
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1E
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1E
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1E
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$9
	.byte SO_UNK00|$1E
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$22
	.byte SO_UNK90|$9
	.byte SO_UNK00|$23
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$22
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$23
	.byte SO_UNK90|$9
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK50|$C
	.byte SO_UNK00|$1D
	.byte SO_UNK90|$6
	.byte SO_UNK50|$9
	.byte SO_UNK90|$9
	.byte SO_UNK90|$9
	.byte SO_UNKB0|$3
	.byte SO_UNK50|$C
	.byte SO_UNK00|$23
	.byte SO_UNK90|$9
	.byte SO_UNK00|$25
	.byte SO_UNK90|$9
	.byte SO_UNK00|$23
	.byte SO_UNK90|$9
	.byte SO_UNK00|$25
	.byte SO_UNK90|$9
	.byte SO_UNK00|$23
	.byte SO_UNK90|$9
	.byte SO_UNK00|$25
	.byte SO_UNK90|$9
	.byte SO_UNK00|$23
	.byte SO_UNK90|$9
	.byte SO_UNK00|$25
	.byte SO_UNK90|$9
	.byte SO_JUMP
	.word @sD84D
	.byte SO_END

trGameOver_TRI:
	;- D 0 - - - 0x01D8D5 07:D8C5: DC
	.byte SO_UNKDC,$49
@sD8C7:
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK00|$19
	.byte SO_UNK90|$6
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNKB0|$6
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK00|$19
	.byte SO_UNK90|$6
	.byte SO_UNK00|$F
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK00|$F
	.byte SO_UNK90|$6
	.byte SO_UNKB0|$6
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNK00|$16
	.byte SO_UNK90|$6
	.byte SO_UNK00|$B
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$F
	.byte SO_UNK90|$6
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNK00|$17
	.byte SO_UNK90|$6
	.byte SO_UNKB0|$6
	.byte SO_UNK00|$12
	.byte SO_UNK90|$6
	.byte SO_UNK00|$F
	.byte SO_UNK90|$6
	.byte SO_UNK00|$D
	.byte SO_UNK90|$6
	.byte SO_UNK90|$6
	.byte SO_UNK00|$11
	.byte SO_UNK90|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNK00|$19
	.byte SO_UNK90|$6
	.byte SO_UNKB0|$6
	.byte SO_UNK00|$14
	.byte SO_UNK90|$6
	.byte SO_UNK00|$11
	.byte SO_UNK90|$6
	.byte SO_JUMP
	.word @sD8C7
	.byte SO_END

;Filler data
.ifdef REGION_JP
	;- - - - - - 0x01D913 07:D903: 00
	.incbin "filler/fill0E_Tracks_JP.bin"
.else
	;- - - - - - 0x01D913 07:D903: 33
	.incbin "filler/fill0E_Tracks.bin"
.endif