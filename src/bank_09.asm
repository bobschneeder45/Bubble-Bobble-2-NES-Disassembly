.segment "PRG_BANK_9"
; 0x012010-0x01400F

;Contents: Bubbles behavior, Projectile behavior

UpdateBubbles:
	LDX #$00					;C - - - - - 0x012010 04:8000: A2 00
	STX playerHazardTrigger				;C - - - - - 0x012012 04:8002: 86 7E
	STX ram_007D				;C - - - - - 0x012014 04:8004: 86 7D
	STX playerHazardSlot				;C - - - - - 0x012016 04:8006: 86 7F
CODE_098008:
	LDA #$00					;C - - - - - 0x012018 04:8008: A9 00
	STA terrainResult				;C - - - - - 0x01201A 04:800A: 8D E9 04
	LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x01201D 04:800D: BD 77 05
	BNE CODE_098015				;C - - - - - 0x012020 04:8010: D0 03
		JMP CODE_09815D				;C - - - - - 0x012022 04:8012: 4C 5D 81
CODE_098015:
	CMP #BUBBLE_RISING					;C - - - - - 0x012025 04:8015: C9 01
	BNE CODE_09803C				;C - - - - - 0x012027 04:8017: D0 23
		LDA globalTimer				;C - - - - - 0x012029 04:8019: A5 14
		AND #$0E					;C - - - - - 0x01202B 04:801B: 29 0E
		BNE CODE_098039				;C - - - - - 0x01202D 04:801D: D0 1A
			INC bubbleProgress,X				;C - - - - - 0x01202F 04:801F: FE D5 04
			LDA bubbleProgress,X				;C - - - - - 0x012032 04:8022: BD D5 04
			CMP bubbleLifespan				;C - - - - - 0x012035 04:8025: CD 1C 05
			BNE CODE_098039				;C - - - - - 0x012038 04:8028: D0 0F
				LDA #BUBBLE_EXPIRING					;C - - - - - 0x01203A 04:802A: A9 02
				STA scratch0				;C - - - - - 0x01203C 04:802C: 85 00
				LDA #.LOBYTE(anBubbleWeak_ID)					;C - - - - - 0x01203E 04:802E: A9 30
				STA scratch1				;C - - - - - 0x012040 04:8030: 85 01
				LDA #.HIBYTE(anBubbleWeak_ID)					;C - - - - - 0x012042 04:8032: A9 00
				STA scratch2				;C - - - - - 0x012044 04:8034: 85 02
				JSR ReplaceBubble				;C - - - - - 0x012046 04:8036: 20 CE 8A
	CODE_098039:
		JMP CODE_098149				;C - - - - - 0x012049 04:8039: 4C 49 81
CODE_09803C:
	CMP #BUBBLE_EXPIRING					;C - - - - - 0x01204C 04:803C: C9 02
	BNE CODE_098052				;C - - - - - 0x01204E 04:803E: D0 12
		INC bubbleProgress,X				;C - - - - - 0x012050 04:8040: FE D5 04
		LDA bubbleProgress,X				;C - - - - - 0x012053 04:8043: BD D5 04
		CMP #$FF					;C - - - - - 0x012056 04:8046: C9 FF
		BNE CODE_09804F				;C - - - - - 0x012058 04:8048: D0 05
			LDA #BUBBLE_EXPIRED					;C - - - - - 0x01205A 04:804A: A9 19
			STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x01205C 04:804C: 9D 77 05
	CODE_09804F:
		JMP CODE_098149				;C - - - - - 0x01205F 04:804F: 4C 49 81
CODE_098052:
	CMP #BUBBLE_ENEMY					;C - - - - - 0x012062 04:8052: C9 03
	BNE CODE_098079				;C - - - - - 0x012064 04:8054: D0 23
		LDA globalTimer				;C - - - - - 0x012066 04:8056: A5 14
		AND #$0E					;C - - - - - 0x012068 04:8058: 29 0E
		BNE CODE_098076				;C - - - - - 0x01206A 04:805A: D0 1A
			INC bubbleProgress,X				;C - - - - - 0x01206C 04:805C: FE D5 04
			LDA bubbleProgress,X				;C - - - - - 0x01206F 04:805F: BD D5 04
			CMP bubbleLifespan				;C - - - - - 0x012072 04:8062: CD 1C 05
			BNE CODE_098076				;C - - - - - 0x012075 04:8065: D0 0F
				LDA #BUBBLE_ENEMY_EXPIRING					;C - - - - - 0x012077 04:8067: A9 04
				STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x012079 04:8069: 9D 77 05
				LDA #$03					;C - - - - - 0x01207C 04:806C: A9 03
				STA objAttr+OSLOT_BUBBLE,X				;C - - - - - 0x01207E 04:806E: 9D 07 07
				LDA #$00					;C - - - - - 0x012081 04:8071: A9 00
				STA bubbleProgress,X				;C - - - - - 0x012083 04:8073: 9D D5 04
	CODE_098076:
		JMP CODE_098149				;C - - - - - 0x012086 04:8076: 4C 49 81
CODE_098079:
	CMP #BUBBLE_ENEMY_EXPIRING					;C - - - - - 0x012089 04:8079: C9 04
	BNE CODE_0980B5				;C - - - - - 0x01208B 04:807B: D0 38
		INC bubbleProgress,X				;C - - - - - 0x01208D 04:807D: FE D5 04
		LDA bubbleProgress,X				;C - - - - - 0x012090 04:8080: BD D5 04
		CMP #$80					;C - - - - - 0x012093 04:8083: C9 80
		BCC CODE_0980B2				;C - - - - - 0x012095 04:8085: 90 2B
			STX scratch1				;C - - - - - 0x012097 04:8087: 86 01
			LDA bubbleTrappedSlot,X				;C - - - - - 0x012099 04:8089: BD FF 04
			TAX							;C - - - - - 0x01209C 04:808C: AA
			TAY							;C - - - - - 0x01209D 04:808D: A8

			LDA #$01					;C - - - - - 0x01209E 04:808E: A9 01
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x0120A0 04:8090: 9D 6C 05
			STA enemyMad,X				;C - - - - - 0x0120A3 04:8093: 95 63

			LDX scratch1				;C - - - - - 0x0120A5 04:8095: A6 01
			LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0120A7 04:8097: BD 9F 05
			STA objY+OSLOT_ENEMY,Y				;C - - - - - 0x0120AA 04:809A: 99 94 05
			LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x0120AD 04:809D: BD C7 05
			STA objX+OSLOT_ENEMY,Y				;C - - - - - 0x0120B0 04:80A0: 99 BC 05

			LDA #3					;C - - - - - 0x0120B3 04:80A3: A9 03
			STA objAttr+OSLOT_ENEMY,Y				;C - - - - - 0x0120B5 04:80A5: 99 FC 06
			LDA #BUBBLE_EXPIRED					;C - - - - - 0x0120B8 04:80A8: A9 19
			STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x0120BA 04:80AA: 9D 77 05

			LDA #$00					;C - - - - - 0x0120BD 04:80AD: A9 00
			STA bubbleTrappedSlot,X				;C - - - - - 0x0120BF 04:80AF: 9D FF 04
	CODE_0980B2:
		JMP CODE_098149				;C - - - - - 0x0120C2 04:80B2: 4C 49 81
CODE_0980B5:
	CMP #BUBBLE_POWER					;C - - - - - 0x0120C5 04:80B5: C9 05
	BNE CODE_0980BC				;C - - - - - 0x0120C7 04:80B7: D0 03
		JMP CODE_098149				;C - - - - - 0x0120C9 04:80B9: 4C 49 81
CODE_0980BC:
	CMP #BUBBLE_POWER_POPPED					;C - - - - - 0x0120CC 04:80BC: C9 06
	BNE CODE_0980C6				;C - - - - - 0x0120CE 04:80BE: D0 06
		JSR CODE_098339				;C - - - - - 0x0120D0 04:80C0: 20 39 83
		JMP CODE_09815D				;C - - - - - 0x0120D3 04:80C3: 4C 5D 81
CODE_0980C6:
	CMP #BUBBLE_EXPIRED					;C - - - - - 0x0120D6 04:80C6: C9 19
	BNE CODE_0980DC				;C - - - - - 0x0120D8 04:80C8: D0 12
		LDA #$20					;C - - - - - 0x0120DA 04:80CA: A9 20
		STA scratch0				;C - - - - - 0x0120DC 04:80CC: 85 00
		LDA #.LOBYTE(anBubblePop_ID)					;C - - - - - 0x0120DE 04:80CE: A9 2E
		STA scratch1				;C - - - - - 0x0120E0 04:80D0: 85 01
		LDA #.HIBYTE(anBubblePop_ID)					;C - - - - - 0x0120E2 04:80D2: A9 00
		STA scratch2				;C - - - - - 0x0120E4 04:80D4: 85 02
		JSR ReplaceBubble				;C - - - - - 0x0120E6 04:80D6: 20 CE 8A
		JMP CODE_09815D				;C - - - - - 0x0120E9 04:80D9: 4C 5D 81
CODE_0980DC:
	CMP #BUBBLE_EXPIRED_POP					;C - - - - - 0x0120EC 04:80DC: C9 20
	BNE CODE_0980F8				;C - - - - - 0x0120EE 04:80DE: D0 18

	INC bubbleProgress,X				;C - - - - - 0x0120F0 04:80E0: FE D5 04
	LDA bubbleProgress,X				;C - - - - - 0x0120F3 04:80E3: BD D5 04
	CMP #$04					;C - - - - - 0x0120F6 04:80E6: C9 04
	BCC CODE_09815D				;C - - - - - 0x0120F8 04:80E8: 90 73

	LDA #$00					;C - - - - - 0x0120FA 04:80EA: A9 00
	STA scratch0				;C - - - - - 0x0120FC 04:80EC: 85 00
	STA scratch1				;C - - - - - 0x0120FE 04:80EE: 85 01
	STA scratch2				;C - - - - - 0x012100 04:80F0: 85 02
	JSR ReplaceBubble				;C - - - - - 0x012102 04:80F2: 20 CE 8A
	JMP CODE_09815D				;C - - - - - 0x012105 04:80F5: 4C 5D 81
CODE_0980F8:
	CMP #BUBBLE_POPPING					;C - - - - - 0x012108 04:80F8: C9 22
	BNE CODE_098119				;C - - - - - 0x01210A 04:80FA: D0 1D
		LDA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x01210C 04:80FC: BD 2F 07
		BEQ CODE_098107				;C - - - - - 0x01210F 04:80FF: F0 06
			JSR CODE_0981F8				;C - - - - - 0x012111 04:8101: 20 F8 81
			JMP CODE_09815D				;C - - - - - 0x012114 04:8104: 4C 5D 81
	CODE_098107:
		LDA #BUBBLE_POPPED					;C - - - - - 0x012117 04:8107: A9 23
		STA scratch0				;C - - - - - 0x012119 04:8109: 85 00
		LDA #.LOBYTE(anBubblePop_ID)					;C - - - - - 0x01211B 04:810B: A9 2E
		STA scratch1				;C - - - - - 0x01211D 04:810D: 85 01
		LDA #.HIBYTE(anBubblePop_ID)					;C - - - - - 0x01211F 04:810F: A9 00
		STA scratch2				;C - - - - - 0x012121 04:8111: 85 02
		JSR ReplaceBubble				;C - - - - - 0x012123 04:8113: 20 CE 8A
		JMP CODE_09815D				;C - - - - - 0x012126 04:8116: 4C 5D 81
CODE_098119:
	CMP #BUBBLE_POPPED					;C - - - - - 0x012129 04:8119: C9 23
	BNE CODE_098135				;C - - - - - 0x01212B 04:811B: D0 18
		INC bubbleProgress,X				;C - - - - - 0x01212D 04:811D: FE D5 04
		LDA bubbleProgress,X				;C - - - - - 0x012130 04:8120: BD D5 04
		CMP #$04					;C - - - - - 0x012133 04:8123: C9 04
		BCC CODE_09815D				;C - - - - - 0x012135 04:8125: 90 36
			LDA #$00					;C - - - - - 0x012137 04:8127: A9 00
			STA scratch0				;C - - - - - 0x012139 04:8129: 85 00
			STA scratch1				;C - - - - - 0x01213B 04:812B: 85 01
			STA scratch2				;C - - - - - 0x01213D 04:812D: 85 02
			JSR ReplaceBubble				;C - - - - - 0x01213F 04:812F: 20 CE 8A
			JMP CODE_09815D				;C - - - - - 0x012142 04:8132: 4C 5D 81
CODE_098135:
	CMP #BUBBLE_EMERGING					;C - - - - - 0x012145 04:8135: C9 80
.ifdef REGION_JP
	BNE CODE_09815D					;- - - - - - 0x012147 04:8137: D0
.else
	BNE CODE_09813F				;C - - - - - 0x012147 04:8137: D0 06
.endif
		JSR BubbleEmergingUpdate				;C - - - - - 0x012149 04:8139: 20 9C 8B
		JMP CODE_09815D				;C - - - - - 0x01214C 04:813C: 4C 5D 81
CODE_09813F:
.ifndef REGION_JP
	TXA							;C - - - - - 0x01214F 04:813F: 8A
	PHA							;C - - - - - 0x012150 04:8140: 48
	JSR CODE_0FFAB9				;C - - - - - 0x012151 04:8141: 20 B9 FA
	PLA							;C - - - - - 0x012154 04:8144: 68
	TAX							;C - - - - - 0x012155 04:8145: AA
	JMP CODE_09815D				;C - - - - - 0x012156 04:8146: 4C 5D 81
.endif
CODE_098149:
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012159 04:8149: BD C7 05
	STA scratch4				;C - - - - - 0x01215C 04:814C: 85 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01215E 04:814E: BD 9F 05
	STA scratch5				;C - - - - - 0x012161 04:8151: 85 05
	JSR CODE_098932				;C - - - - - 0x012163 04:8153: 20 32 89
	TXA							;C - - - - - 0x012166 04:8156: 8A
	PHA							;C - - - - - 0x012167 04:8157: 48
	JSR CODE_098258				;C - - - - - 0x012168 04:8158: 20 58 82
	PLA							;C - - - - - 0x01216B 04:815B: 68
	TAX							;C - - - - - 0x01216C 04:815C: AA
CODE_09815D:
	INX							;C - - - - - 0x01216D 04:815D: E8
	CPX #20					;C - - - - - 0x01216E 04:815E: E0 14
	BEQ CODE_098165				;C - - - - - 0x012170 04:8160: F0 03
		JMP CODE_098008				;C - - - - - 0x012172 04:8162: 4C 08 80
CODE_098165:
	LDA roundFlags				;C - - - - - 0x012175 04:8165: AD 71 04
	AND #$1F					;C - - - - - 0x012178 04:8168: 29 1F
	BEQ CODE_09816F				;C - - - - - 0x01217A 04:816A: F0 03
		JMP CODE_0981DC				;C - - - - - 0x01217C 04:816C: 4C DC 81
CODE_09816F:
	LDA roundBubbleVariant				;C - - - - - 0x01217F 04:816F: A5 82
	BEQ CODE_0981DC				;C - - - - - 0x012181 04:8171: F0 69

	CMP #BUBV_DRINK					;C - - - - - 0x012183 04:8173: C9 80
	BCC CODE_09817A				;C - - - - - 0x012185 04:8175: 90 03
		JMP CODE_0981DC				;C - - - - - 0x012187 04:8177: 4C DC 81
CODE_09817A:
	LDA globalTimer				;C - - - - - 0x01218A 04:817A: A5 14
	CMP #$1F					;C - - - - - 0x01218C 04:817C: C9 1F
	BNE CODE_0981DC				;C - - - - - 0x01218E 04:817E: D0 5C

	LDX #$0E					;C - - - - - 0x012190 04:8180: A2 0E
CODE_098182:
	STX scratch0				;C - - - - - 0x012192 04:8182: 86 00
	LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x012194 04:8184: BD 77 05
	BEQ CODE_098191				;C - - - - - 0x012197 04:8187: F0 08
		INX							;C - - - - - 0x012199 04:8189: E8
		CPX #$14					;C - - - - - 0x01219A 04:818A: E0 14
		BCS CODE_0981DC				;C - - - - - 0x01219C 04:818C: B0 4E
		JMP CODE_098182				;C - - - - - 0x01219E 04:818E: 4C 82 81
CODE_098191:
	LDA scratch0				;C - - - - - 0x0121A1 04:8191: A5 00
	TAX							;C - - - - - 0x0121A3 04:8193: AA
	LDA #$05					;C - - - - - 0x0121A4 04:8194: A9 05
	STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x0121A6 04:8196: 9D 77 05
	LDA #$00					;C - - - - - 0x0121A9 04:8199: A9 00
	STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0121AB 04:819B: 9D 9F 05
	LDY ram_0083				;C - - - - - 0x0121AE 04:819E: A4 83
	CPY #$03					;C - - - - - 0x0121B0 04:81A0: C0 03
	BCC CODE_0981A7				;C - - - - - 0x0121B2 04:81A2: 90 03
	LDA playerDir				;C - - - - - 0x0121B4 04:81A4: A5 77
	TAY							;C - - - - - 0x0121B6 04:81A6: A8
CODE_0981A7:
	LDA DATA_0981ED,Y			;C - - - - - 0x0121B7 04:81A7: B9 ED 81
	STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x0121BA 04:81AA: 9D C7 05
	LDY roundBubbleVariant				;C - - - - - 0x0121BD 04:81AD: A4 82
	LDA DATA_0981F0,Y			;C - - - - - 0x0121BF 04:81AF: B9 F0 81
	STA objChrSlot+OSLOT_BUBBLE,X				;C - - - - - 0x0121C2 04:81B2: 9D 3F 06
	LDA roundBubbleVariant				;C - - - - - 0x0121C5 04:81B5: A5 82
	CLC							;C - - - - - 0x0121C7 04:81B7: 18
	ASL							;C - - - - - 0x0121C8 04:81B8: 0A
	TAY							;C - - - - - 0x0121C9 04:81B9: A8
	LDA BubbleVariantAnims,Y			;C - - - - - 0x0121CA 04:81BA: B9 29 83
	STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x0121CD 04:81BD: 9D 8F 06
	LDA BubbleVariantAnims+1,Y			;C - - - - - 0x0121D0 04:81C0: B9 2A 83
	STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x0121D3 04:81C3: 9D 2F 07
	LDA roundBubbleVariant				;C - - - - - 0x0121D6 04:81C6: A5 82
	AND #$07					;C - - - - - 0x0121D8 04:81C8: 29 07
	TAY							;C - - - - - 0x0121DA 04:81CA: A8
	LDA BubbleVariantAttr,Y			;C - - - - - 0x0121DB 04:81CB: B9 DD 81
	STA objAttr+OSLOT_BUBBLE,X				;C - - - - - 0x0121DE 04:81CE: 9D 07 07
	LDA #$00					;C - - - - - 0x0121E1 04:81D1: A9 00
	STA objAnimProgress+OSLOT_BUBBLE,X				;C - - - - - 0x0121E3 04:81D3: 9D DF 06
	STA objAnimTimer+OSLOT_BUBBLE,X				;C - - - - - 0x0121E6 04:81D6: 9D B7 06
	STA bubbleProgress,X				;C - - - - - 0x0121E9 04:81D9: 9D D5 04
CODE_0981DC:
	RTS							;C - - - - - 0x0121EC 04:81DC: 60

BubbleVariantAttr:
	;- - - - - - 0x0121ED 04:81DD: 00
	.byte $00					;Regular
	.byte $00					;Thunder
	.byte $03					;Fire
	.byte $00					;Water
	.byte $03					;Snow
	.byte $00					;Wind
	.byte $03					;Star
	.byte $03					;Bomb

DATA_0981E5:
	.byte $00					;- - - - - - 0x0121F5 04:81E5: 00
	.byte $01					;- D 0 - - - 0x0121F6 04:81E6: 01
	.byte $00					;- D 0 - - - 0x0121F7 04:81E7: 00
	.byte $03					;- D 0 - - - 0x0121F8 04:81E8: 03
	.byte $00					;- D 0 - - - 0x0121F9 04:81E9: 00
	.byte $05					;- D 0 - - - 0x0121FA 04:81EA: 05
	.byte $00					;- D 0 - - - 0x0121FB 04:81EB: 00
	.byte $00					;- D 0 - - - 0x0121FC 04:81EC: 00

DATA_0981ED:
	.byte $00					;- - - - - - 0x0121FD 04:81ED: 00
	.byte $B0					;- D 0 - - - 0x0121FE 04:81EE: B0
	.byte $50					;- D 0 - - - 0x0121FF 04:81EF: 50

DATA_0981F0:
	.byte $01					;- - - - - - 0x012200 04:81F0: 01
	.byte $01					;- D 0 - - - 0x012201 04:81F1: 01
	.byte $01					;- D 0 - - - 0x012202 04:81F2: 01
	.byte $01					;- D 0 - - - 0x012203 04:81F3: 01
	.byte $01					;- D 0 - - - 0x012204 04:81F4: 01
	.byte $01					;- D 0 - - - 0x012205 04:81F5: 01
	.byte $01					;- D 0 - - - 0x012206 04:81F6: 01
	.byte $03					;- D 0 - - - 0x012207 04:81F7: 03

CODE_0981F8:
	LDA roundBubbleVariant				;C - - - - - 0x012208 04:81F8: A5 82
	AND #$7F					;C - - - - - 0x01220A 04:81FA: 29 7F
	TAY							;C - - - - - 0x01220C 04:81FC: A8
	LDA DATA_0981E5,Y			;C - - - - - 0x01220D 04:81FD: B9 E5 81
	BEQ CODE_09820D				;C - - - - - 0x012210 04:8200: F0 0B
		LDA playerDir				;C - - - - - 0x012212 04:8202: A5 77
		CMP #$01					;C - - - - - 0x012214 04:8204: C9 01
		BEQ CODE_09820D				;C - - - - - 0x012216 04:8206: F0 05
			LDA #$80					;C - - - - - 0x012218 04:8208: A9 80
			JMP CODE_09820F				;C - - - - - 0x01221A 04:820A: 4C 0F 82
CODE_09820D:
	LDA #$00					;C - - - - - 0x01221D 04:820D: A9 00
CODE_09820F:
	STA bubbleProgress,X				;C - - - - - 0x01221F 04:820F: 9D D5 04
	LDA #$06					;C - - - - - 0x012222 04:8212: A9 06
	STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x012224 04:8214: 9D 77 05
	LDA roundBubbleVariant				;C - - - - - 0x012227 04:8217: A5 82
	AND #$7F					;C - - - - - 0x012229 04:8219: 29 7F
	TAY							;C - - - - - 0x01222B 04:821B: A8
	LDA BubblePopAttr,Y			;C - - - - - 0x01222C 04:821C: B9 EB 82
	STA objAttr+OSLOT_BUBBLE,X				;C - - - - - 0x01222F 04:821F: 9D 07 07
	LDA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x012232 04:8222: BD 8F 06
	CLC							;C - - - - - 0x012235 04:8225: 18
	ADC #6					;C - - - - - 0x012236 04:8226: 69 06
	STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x012238 04:8228: 9D 8F 06
	CMP #.LOBYTE(anBombBubble_ID)					;C - - - - - 0x01223B 04:822B: C9 2D
	BCC CODE_098234				;C - - - - - 0x01223D 04:822D: 90 05
	LDA #$01					;C - - - - - 0x01223F 04:822F: A9 01
	STA objChrSlot+OSLOT_BUBBLE,X				;C - - - - - 0x012241 04:8231: 9D 3F 06
CODE_098234:
	LDA roundBubbleVariant				;C - - - - - 0x012244 04:8234: A5 82
	AND #$7F					;C - - - - - 0x012246 04:8236: 29 7F
	TAY							;C - - - - - 0x012248 04:8238: A8
	LDA BubblePopSounds,Y			;C - - - - - 0x012249 04:8239: B9 F3 82
	STA a:soundTrigger				;C - - - - - 0x01224C 04:823C: 8D E1 00
	LDA #.HIBYTE(anThunder_ID)					;C - - - - - 0x01224F 04:823F: A9 01
	STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x012251 04:8241: 9D 2F 07
	LDA #$00					;C - - - - - 0x012254 04:8244: A9 00
	STA objAnimProgress+OSLOT_BUBBLE,X				;C - - - - - 0x012256 04:8246: 9D DF 06
	STA objAnimTimer+OSLOT_BUBBLE,X				;C - - - - - 0x012259 04:8249: 9D B7 06
	LDA roundBubbleVariant				;C - - - - - 0x01225C 04:824C: A5 82
	AND #$7F					;C - - - - - 0x01225E 04:824E: 29 7F
	CMP #BUBV_WATER					;C - - - - - 0x012260 04:8250: C9 03
	BNE CODE_098257				;C - - - - - 0x012262 04:8252: D0 03
		JSR CODE_0988EC				;C - - - - - 0x012264 04:8254: 20 EC 88
CODE_098257:
	RTS							;C - - - - - 0x012267 04:8257: 60

CODE_098258:
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012268 04:8258: BD 9F 05
	STA scratch0				;C - - - - - 0x01226B 04:825B: 85 00
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01226D 04:825D: BD C7 05
	STA scratch1				;C - - - - - 0x012270 04:8260: 85 01
	JSR CODE_0FF5E6				;C - - - - - 0x012272 04:8262: 20 E6 F5
	LDA scratch4				;C - - - - - 0x012275 04:8265: A5 04
	STA ram_04EA				;C - - - - - 0x012277 04:8267: 8D EA 04
	LDA ram_04EA				;C - - - - - 0x01227A 04:826A: AD EA 04
	AND #$03					;C - - - - - 0x01227D 04:826D: 29 03
	CLC							;C - - - - - 0x01227F 04:826F: 18
	ADC ram_0476				;C - - - - - 0x012280 04:8270: 6D 76 04
	STA ram_04EA				;C - - - - - 0x012283 04:8273: 8D EA 04
	LDY ram_04EA				;C - - - - - 0x012286 04:8276: AC EA 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012289 04:8279: BD 9F 05
	CLC							;C - - - - - 0x01228C 04:827C: 18
	ADC DATA_098309,Y			;C - - - - - 0x01228D 04:827D: 79 09 83
	STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012290 04:8280: 9D 9F 05
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012293 04:8283: BD C7 05
	CLC							;C - - - - - 0x012296 04:8286: 18
	ADC DATA_098319,Y			;C - - - - - 0x012297 04:8287: 79 19 83
	STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01229A 04:828A: 9D C7 05
	LDA globalTimer				;C - - - - - 0x01229D 04:828D: A5 14
	AND #$03					;C - - - - - 0x01229F 04:828F: 29 03
	CMP #$03					;C - - - - - 0x0122A1 04:8291: C9 03
	BEQ CODE_0982B4				;C - - - - - 0x0122A3 04:8293: F0 1F
		LDY bubbleDir,X				;C - - - - - 0x0122A5 04:8295: BC EB 04
		LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x0122A8 04:8298: BD C7 05
		CLC							;C - - - - - 0x0122AB 04:829B: 18
		ADC DATA_0982FB,Y			;C - - - - - 0x0122AC 04:829C: 79 FB 82
		CMP #$18					;C - - - - - 0x0122AF 04:829F: C9 18
		BCC CODE_0982AA				;C - - - - - 0x0122B1 04:82A1: 90 07
		CMP #$E8					;C - - - - - 0x0122B3 04:82A3: C9 E8
		BCS CODE_0982AA				;C - - - - - 0x0122B5 04:82A5: B0 03
			STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x0122B7 04:82A7: 9D C7 05
	CODE_0982AA:
		LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0122BA 04:82AA: BD 9F 05
		CLC							;C - - - - - 0x0122BD 04:82AD: 18
		ADC DATA_098302,Y			;C - - - - - 0x0122BE 04:82AE: 79 02 83
		STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0122C1 04:82B1: 9D 9F 05
CODE_0982B4:
	LDA currentRound				;C - - - - - 0x0122C4 04:82B4: A5 D8
	CMP #50					;C - - - - - 0x0122C6 04:82B6: C9 32
.ifndef REGION_JP
	BNE CODE_0982C1				;C - - - - - 0x0122C8 04:82B8: D0 07

	LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x0122CA 04:82BA: BD 77 05
	CMP #$05					;C - - - - - 0x0122CD 04:82BD: C9 05
.endif
	BEQ CODE_0982EA				;C - - - - - 0x0122CF 04:82BF: F0 29
CODE_0982C1:
	LDA roundSkelDelay				;C - - - - - 0x0122D1 04:82C1: A5 6D
	BEQ CODE_0982CC				;C - - - - - 0x0122D3 04:82C3: F0 07
		LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x0122D5 04:82C5: BD 77 05
		CMP #$03					;C - - - - - 0x0122D8 04:82C8: C9 03
		BCS CODE_0982EA				;C - - - - - 0x0122DA 04:82CA: B0 1E
CODE_0982CC:
	LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x0122DC 04:82CC: BD 77 05
	CMP #$03					;C - - - - - 0x0122DF 04:82CF: C9 03
	BEQ CODE_0982EA				;C - - - - - 0x0122E1 04:82D1: F0 17

	CMP #$04					;C - - - - - 0x0122E3 04:82D3: C9 04
	BEQ CODE_0982EA				;C - - - - - 0x0122E5 04:82D5: F0 13

	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0122E7 04:82D7: BD 9F 05
	CMP #$20					;C - - - - - 0x0122EA 04:82DA: C9 20
	BCC CODE_0982E2				;C - - - - - 0x0122EC 04:82DC: 90 04
	CMP #$EC					;C - - - - - 0x0122EE 04:82DE: C9 EC
	BCC CODE_0982EA				;C - - - - - 0x0122F0 04:82E0: 90 08
CODE_0982E2:
	LDA #$00					;C - - - - - 0x0122F2 04:82E2: A9 00
	STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x0122F4 04:82E4: 9D 77 05
	STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x0122F7 04:82E7: 9D 2F 07
CODE_0982EA:
	RTS							;C - - - - - 0x0122FA 04:82EA: 60

BubblePopAttr:
	;- - - - - - 0x0122FB 04:82EB: 00
	.byte $00					;Regular
	.byte $03					;Thunder
	.byte $03					;Fire
	.byte $00					;Water
	.byte $00					;Snow
	.byte $00					;Wind
	.byte $03					;Star
	.byte $03					;Bomb

BubblePopSounds:
	.byte snSilence_ID			;Regular
	.byte snThunder_ID			;Thunder
	.byte snSilence_ID			;Fire
	.byte snFlood_ID			;Water
	.byte snSnow_ID				;Snow
	.byte snWind_ID				;Wind
	.byte snStars_ID			;Star
	.byte snBomb_ID				;Bomb

DATA_0982FB:
	.byte $00					;- D 0 - - - 0x01230B 04:82FB: 00
	.byte $00					;- D 0 - - - 0x01230C 04:82FC: 00
	.byte $00					;- D 0 - - - 0x01230D 04:82FD: 00
	.byte $FA					;- D 0 - - - 0x01230E 04:82FE: FA
	.byte $06					;- D 0 - - - 0x01230F 04:82FF: 06
	.byte $FC					;- D 0 - - - 0x012310 04:8300: FC
	.byte $04					;- D 0 - - - 0x012311 04:8301: 04

DATA_098302:
	.byte $00					;- D 0 - - - 0x012312 04:8302: 00
	.byte $FA					;- D 0 - - - 0x012313 04:8303: FA
	.byte $06					;- D 0 - - - 0x012314 04:8304: 06
	.byte $00					;- D 0 - - - 0x012315 04:8305: 00
	.byte $00					;- D 0 - - - 0x012316 04:8306: 00
	.byte $00					;- D 0 - - - 0x012317 04:8307: 00
	.byte $00					;- D 0 - - - 0x012318 04:8308: 00

DATA_098309:
	.byte $FF					;- D 0 - - - 0x012319 04:8309: FF
	.byte $01					;- D 0 - - - 0x01231A 04:830A: 01
	.byte $00					;- D 0 - - - 0x01231B 04:830B: 00
	.byte $00					;- D 0 - - - 0x01231C 04:830C: 00
	.byte $FE					;- D 0 - - - 0x01231D 04:830D: FE
	.byte $02					;- D 0 - - - 0x01231E 04:830E: 02
	.byte $00					;- D 0 - - - 0x01231F 04:830F: 00
	.byte $00					;- D 0 - - - 0x012320 04:8310: 00
	.byte $FD					;- D 0 - - - 0x012321 04:8311: FD
	.byte $03					;- D 0 - - - 0x012322 04:8312: 03
	.byte $00					;- D 0 - - - 0x012323 04:8313: 00
	.byte $00					;- D 0 - - - 0x012324 04:8314: 00
	.byte $FC					;- D 0 - - - 0x012325 04:8315: FC
	.byte $04					;- D 0 - - - 0x012326 04:8316: 04
	.byte $00					;- D 0 - - - 0x012327 04:8317: 00
	.byte $00					;- D 0 - - - 0x012328 04:8318: 00

DATA_098319:
	.byte $00					;- D 0 - - - 0x012329 04:8319: 00
	.byte $00					;- D 0 - - - 0x01232A 04:831A: 00
	.byte $FF					;- D 0 - - - 0x01232B 04:831B: FF
	.byte $01					;- D 0 - - - 0x01232C 04:831C: 01
	.byte $00					;- D 0 - - - 0x01232D 04:831D: 00
	.byte $00					;- D 0 - - - 0x01232E 04:831E: 00
	.byte $FE					;- D 0 - - - 0x01232F 04:831F: FE
	.byte $02					;- D 0 - - - 0x012330 04:8320: 02
	.byte $00					;- D 0 - - - 0x012331 04:8321: 00
	.byte $00					;- D 0 - - - 0x012332 04:8322: 00
	.byte $FD					;- D 0 - - - 0x012333 04:8323: FD
	.byte $03					;- D 0 - - - 0x012334 04:8324: 03
	.byte $00					;- D 0 - - - 0x012335 04:8325: 00
	.byte $00					;- D 0 - - - 0x012336 04:8326: 00
	.byte $FC					;- D 0 - - - 0x012337 04:8327: FC
	.byte $04					;- D 0 - - - 0x012338 04:8328: 04

BubbleVariantAnims:
	;- - - - - - 0x012339 04:8329: 00
	.word $0000					;Regular
	.word anThunderBubble_ID	;Thunder
	.word anFireBubble_ID		;Fire
	.word anFloodBubble_ID		;Flood
	.word anSnowBubble_ID		;Snow
	.word anWindBubble_ID		;Wind
	.word anStarBubble_ID		;Star
	.word anBombBubble_ID		;Bomb

CODE_098339:
	LDA roundBubbleVariant				;C - - - - - 0x012349 04:8339: A5 82
	CMP #BUBV_BOMB					;C - - - - - 0x01234B 04:833B: C9 07
	BNE CODE_098342				;C - - - - - 0x01234D 04:833D: D0 03
		JMP CODE_09873C				;C - - - - - 0x01234F 04:833F: 4C 3C 87
CODE_098342:
	LDA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x012352 04:8342: BD 8F 06
	CMP #$07					;C - - - - - 0x012355 04:8345: C9 07
	BNE CODE_0983A3				;C - - - - - 0x012357 04:8347: D0 5A

	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012359 04:8349: BD C7 05
	STA scratch4				;C - - - - - 0x01235C 04:834C: 85 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01235E 04:834E: BD 9F 05
	STA scratch5				;C - - - - - 0x012361 04:8351: 85 05

	LDA #$08					;C - - - - - 0x012363 04:8353: A9 08
	STA scratch2				;C - - - - - 0x012365 04:8355: 85 02
	LDA #$08					;C - - - - - 0x012367 04:8357: A9 08
	STA scratch3				;C - - - - - 0x012369 04:8359: 85 03
	JSR HazardCheckEnemies				;C - - - - - 0x01236B 04:835B: 20 1D 8A
	JSR HazardCheckPlayer				;C - - - - - 0x01236E 04:835E: 20 DA 89

	LDA bubbleProgress,X				;C - - - - - 0x012371 04:8361: BD D5 04
	ASL							;C - - - - - 0x012374 04:8364: 0A
	BCS CODE_098385				;C - - - - - 0x012375 04:8365: B0 1E
		LDA #$07					;C - - - - - 0x012377 04:8367: A9 07
		CLC							;C - - - - - 0x012379 04:8369: 18
		ADC objX+OSLOT_BUBBLE,X				;C - - - - - 0x01237A 04:836A: 7D C7 05
		STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01237D 04:836D: 9D C7 05
		CMP #$F8					;C - - - - - 0x012380 04:8370: C9 F8
		BCS CODE_098377				;C - - - - - 0x012382 04:8372: B0 03
			JMP CODE_09876A				;C - - - - - 0x012384 04:8374: 4C 6A 87
	CODE_098377:
		LDA #$00					;C - - - - - 0x012387 04:8377: A9 00
		STA bubbleProgress,X				;C - - - - - 0x012389 04:8379: 9D D5 04
		STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x01238C 04:837C: 9D 77 05
		STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x01238F 04:837F: 9D 2F 07
		JMP CODE_09876A				;C - - - - - 0x012392 04:8382: 4C 6A 87
CODE_098385:
	LDA #$F9					;C - - - - - 0x012395 04:8385: A9 F9
	CLC							;C - - - - - 0x012397 04:8387: 18
	ADC objX+OSLOT_BUBBLE,X				;C - - - - - 0x012398 04:8388: 7D C7 05
	STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01239B 04:838B: 9D C7 05
	CMP #$08					;C - - - - - 0x01239E 04:838E: C9 08
	BCC CODE_098395				;C - - - - - 0x0123A0 04:8390: 90 03
		JMP CODE_09876A				;C - - - - - 0x0123A2 04:8392: 4C 6A 87
CODE_098395:
	LDA #$00					;C - - - - - 0x0123A5 04:8395: A9 00
	STA bubbleProgress,X				;C - - - - - 0x0123A7 04:8397: 9D D5 04
	STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x0123AA 04:839A: 9D 77 05
	STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x0123AD 04:839D: 9D 2F 07
	JMP CODE_09876A				;C - - - - - 0x0123B0 04:83A0: 4C 6A 87
CODE_0983A3:
	CMP #$28					;C - - - - - 0x0123B3 04:83A3: C9 28
	BCC CODE_0983AE				;C - - - - - 0x0123B5 04:83A5: 90 07
	CMP #$2C					;C - - - - - 0x0123B7 04:83A7: C9 2C
	BCS CODE_0983AE				;C - - - - - 0x0123B9 04:83A9: B0 03
		JMP CODE_09842A				;C - - - - - 0x0123BB 04:83AB: 4C 2A 84
CODE_0983AE:
	CMP #$25					;C - - - - - 0x0123BE 04:83AE: C9 25
	BEQ CODE_09842A				;C - - - - - 0x0123C0 04:83B0: F0 78

	CMP #$08					;C - - - - - 0x0123C2 04:83B2: C9 08
	BEQ CODE_0983B9				;C - - - - - 0x0123C4 04:83B4: F0 03
		JMP CODE_09845E				;C - - - - - 0x0123C6 04:83B6: 4C 5E 84
CODE_0983B9:
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0123C9 04:83B9: BD 9F 05
	JSR CODE_098781				;C - - - - - 0x0123CC 04:83BC: 20 81 87
	LDA terrainResult				;C - - - - - 0x0123CF 04:83BF: AD E9 04
	BNE CODE_0983D5				;C - - - - - 0x0123D2 04:83C2: D0 11
		LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0123D4 04:83C4: BD 9F 05
		CLC							;C - - - - - 0x0123D7 04:83C7: 18
		ADC #$02					;C - - - - - 0x0123D8 04:83C8: 69 02
		STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0123DA 04:83CA: 9D 9F 05
		LDA #$00					;C - - - - - 0x0123DD 04:83CD: A9 00
		STA bubbleProgress,X				;C - - - - - 0x0123DF 04:83CF: 9D D5 04
		JMP CODE_09876A				;C - - - - - 0x0123E2 04:83D2: 4C 6A 87
CODE_0983D5:
	AND #$07					;C - - - - - 0x0123E5 04:83D5: 29 07
	STA scratch0				;C - - - - - 0x0123E7 04:83D7: 85 00
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0123E9 04:83D9: BD 9F 05
	SEC							;C - - - - - 0x0123EC 04:83DC: 38
	SBC scratch0				;C - - - - - 0x0123ED 04:83DD: E5 00
	STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0123EF 04:83DF: 9D 9F 05
	LDA #snFire_ID					;C - - - - - 0x0123F2 04:83E2: A9 13
	STA a:soundTrigger				;C - - - - - 0x0123F4 04:83E4: 8D E1 00
	LDA terrainResult				;C - - - - - 0x0123F7 04:83E7: AD E9 04
	AND #$F0					;C - - - - - 0x0123FA 04:83EA: 29 F0
	CMP #$40					;C - - - - - 0x0123FC 04:83EC: C9 40
	BEQ CODE_098404				;C - - - - - 0x0123FE 04:83EE: F0 14
	CMP #$C0					;C - - - - - 0x012400 04:83F0: C9 C0
	BEQ CODE_098409				;C - - - - - 0x012402 04:83F2: F0 15
	CMP #$60					;C - - - - - 0x012404 04:83F4: C9 60
	BEQ CODE_09840E				;C - - - - - 0x012406 04:83F6: F0 16
	CMP #$E0					;C - - - - - 0x012408 04:83F8: C9 E0
	BEQ CODE_098413				;C - - - - - 0x01240A 04:83FA: F0 17
	CMP #$70					;C - - - - - 0x01240C 04:83FC: C9 70
	BEQ CODE_098418				;C - - - - - 0x01240E 04:83FE: F0 18
	CMP #$F0					;C - - - - - 0x012410 04:8400: C9 F0
	BEQ CODE_09841D				;C - - - - - 0x012412 04:8402: F0 19
CODE_098404:
	LDA #.LOBYTE(anFlame_ID)					;C - - - - - 0x012414 04:8404: A9 08
	JMP CODE_09841F				;C - - - - - 0x012416 04:8406: 4C 1F 84
CODE_098409:
	LDA #.LOBYTE(anFlames2_ID)					;C - - - - - 0x012419 04:8409: A9 28
	JMP CODE_09841F				;C - - - - - 0x01241B 04:840B: 4C 1F 84
CODE_09840E:
	LDA #.LOBYTE(anFlames2L_ID)					;C - - - - - 0x01241E 04:840E: A9 29
	JMP CODE_09841F				;C - - - - - 0x012420 04:8410: 4C 1F 84
CODE_098413:
	LDA #.LOBYTE(anFlames3_ID)					;C - - - - - 0x012423 04:8413: A9 2A
	JMP CODE_09841F				;C - - - - - 0x012425 04:8415: 4C 1F 84
CODE_098418:
	LDA #.LOBYTE(anFlames3R_ID)					;C - - - - - 0x012428 04:8418: A9 2B
	JMP CODE_09841F				;C - - - - - 0x01242A 04:841A: 4C 1F 84
CODE_09841D:
	LDA #.LOBYTE(anFlames4_ID)					;C - - - - - 0x01242D 04:841D: A9 25
CODE_09841F:
	STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x01242F 04:841F: 9D 8F 06
	LDA #$00					;C - - - - - 0x012432 04:8422: A9 00
	STA objAnimProgress+OSLOT_BUBBLE,X				;C - - - - - 0x012434 04:8424: 9D DF 06
	STA objAnimTimer+OSLOT_BUBBLE,X				;C - - - - - 0x012437 04:8427: 9D B7 06
CODE_09842A:
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01243A 04:842A: BD C7 05
	STA scratch4				;C - - - - - 0x01243D 04:842D: 85 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01243F 04:842F: BD 9F 05
	STA scratch5				;C - - - - - 0x012442 04:8432: 85 05
	LDA #$10					;C - - - - - 0x012444 04:8434: A9 10
	STA scratch2				;C - - - - - 0x012446 04:8436: 85 02
	LDA #$04					;C - - - - - 0x012448 04:8438: A9 04
	STA scratch3				;C - - - - - 0x01244A 04:843A: 85 03
	JSR HazardCheckEnemies				;C - - - - - 0x01244C 04:843C: 20 1D 8A
	LDA #$04					;C - - - - - 0x01244F 04:843F: A9 04
	STA scratch2				;C - - - - - 0x012451 04:8441: 85 02
	JSR HazardCheckPlayer				;C - - - - - 0x012453 04:8443: 20 DA 89
	INC bubbleProgress,X				;C - - - - - 0x012456 04:8446: FE D5 04
	LDA bubbleProgress,X				;C - - - - - 0x012459 04:8449: BD D5 04
	CMP #$A0					;C - - - - - 0x01245C 04:844C: C9 A0
	BNE CODE_09845B				;C - - - - - 0x01245E 04:844E: D0 0B
		LDA #$00					;C - - - - - 0x012460 04:8450: A9 00
		STA bubbleProgress,X				;C - - - - - 0x012462 04:8452: 9D D5 04
		STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x012465 04:8455: 9D 77 05
		STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x012468 04:8458: 9D 2F 07
CODE_09845B:
	JMP CODE_09876A				;C - - - - - 0x01246B 04:845B: 4C 6A 87
CODE_09845E:
	CMP #.LOBYTE(anFloodV_ID)					;C - - - - - 0x01246E 04:845E: C9 09
	BEQ CODE_098470				;C - - - - - 0x012470 04:8460: F0 0E
	CMP #.LOBYTE(anFloodHAlt_ID)					;C - - - - - 0x012472 04:8462: C9 3F
	BEQ CODE_0984C8				;C - - - - - 0x012474 04:8464: F0 62
	CMP #.LOBYTE(anFloodH_ID)					;C - - - - - 0x012476 04:8466: C9 2C
	BEQ CODE_09846D				;C - - - - - 0x012478 04:8468: F0 03
		JMP CODE_09857E				;C - - - - - 0x01247A 04:846A: 4C 7E 85
CODE_09846D:
	JMP CODE_0984FA				;C - - - - - 0x01247D 04:846D: 4C FA 84
CODE_098470:
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012480 04:8470: BD C7 05
	STA scratch4				;C - - - - - 0x012483 04:8473: 85 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012485 04:8475: BD 9F 05
	STA scratch5				;C - - - - - 0x012488 04:8478: 85 05
	LDA #$08					;C - - - - - 0x01248A 04:847A: A9 08
	STA scratch2				;C - - - - - 0x01248C 04:847C: 85 02
	LDA #$0C					;C - - - - - 0x01248E 04:847E: A9 0C
	STA scratch3				;C - - - - - 0x012490 04:8480: 85 03
	JSR HazardCheckEnemies				;C - - - - - 0x012492 04:8482: 20 1D 8A
	JSR HazardCheckPlayer				;C - - - - - 0x012495 04:8485: 20 DA 89
	JSR CODE_098839				;C - - - - - 0x012498 04:8488: 20 39 88
	LDA terrainResult				;C - - - - - 0x01249B 04:848B: AD E9 04
	BNE CODE_09849C				;C - - - - - 0x01249E 04:848E: D0 0C
		LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0124A0 04:8490: BD 9F 05
		CLC							;C - - - - - 0x0124A3 04:8493: 18
		ADC #$06					;C - - - - - 0x0124A4 04:8494: 69 06
		STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0124A6 04:8496: 9D 9F 05
		JMP CODE_09857B				;C - - - - - 0x0124A9 04:8499: 4C 7B 85
CODE_09849C:
	AND #$0F					;C - - - - - 0x0124AC 04:849C: 29 0F
	STA scratch2				;C - - - - - 0x0124AE 04:849E: 85 02
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0124B0 04:84A0: BD 9F 05
	SEC							;C - - - - - 0x0124B3 04:84A3: 38
	SBC scratch2				;C - - - - - 0x0124B4 04:84A4: E5 02
	STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0124B6 04:84A6: 9D 9F 05
	LDA bubbleProgress,X				;C - - - - - 0x0124B9 04:84A9: BD D5 04
	AND #$80					;C - - - - - 0x0124BC 04:84AC: 29 80
	BNE CODE_0984B8				;C - - - - - 0x0124BE 04:84AE: D0 08
		LDA #.LOBYTE(anFloodHAlt_ID)					;C - - - - - 0x0124C0 04:84B0: A9 3F
		STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x0124C2 04:84B2: 9D 8F 06
		JMP CODE_0984BD				;C - - - - - 0x0124C5 04:84B5: 4C BD 84
CODE_0984B8:
	LDA #.LOBYTE(anFloodH_ID)					;C - - - - - 0x0124C8 04:84B8: A9 2C
	STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x0124CA 04:84BA: 9D 8F 06
CODE_0984BD:
	LDA #$00					;C - - - - - 0x0124CD 04:84BD: A9 00
	STA objAnimProgress+OSLOT_BUBBLE,X				;C - - - - - 0x0124CF 04:84BF: 9D DF 06
	STA objAnimTimer+OSLOT_BUBBLE,X				;C - - - - - 0x0124D2 04:84C2: 9D B7 06
	JMP CODE_09857B				;C - - - - - 0x0124D5 04:84C5: 4C 7B 85
CODE_0984C8:
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x0124D8 04:84C8: BD C7 05
	STA scratch4				;C - - - - - 0x0124DB 04:84CB: 85 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0124DD 04:84CD: BD 9F 05
	STA scratch5				;C - - - - - 0x0124E0 04:84D0: 85 05
	LDA #$0C					;C - - - - - 0x0124E2 04:84D2: A9 0C
	STA scratch2				;C - - - - - 0x0124E4 04:84D4: 85 02
	LDA #$08					;C - - - - - 0x0124E6 04:84D6: A9 08
	STA scratch3				;C - - - - - 0x0124E8 04:84D8: 85 03
	JSR HazardCheckEnemies				;C - - - - - 0x0124EA 04:84DA: 20 1D 8A
	JSR HazardCheckPlayer				;C - - - - - 0x0124ED 04:84DD: 20 DA 89
	JSR CODE_098839				;C - - - - - 0x0124F0 04:84E0: 20 39 88
	LDA terrainResult				;C - - - - - 0x0124F3 04:84E3: AD E9 04
	AND #$F0					;C - - - - - 0x0124F6 04:84E6: 29 F0
	BEQ CODE_09852C				;C - - - - - 0x0124F8 04:84E8: F0 42

	CMP #$90					;C - - - - - 0x0124FA 04:84EA: C9 90
	BEQ CODE_098545				;C - - - - - 0x0124FC 04:84EC: F0 57

	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x0124FE 04:84EE: BD C7 05
	CLC							;C - - - - - 0x012501 04:84F1: 18
	ADC #$05					;C - - - - - 0x012502 04:84F2: 69 05
	STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012504 04:84F4: 9D C7 05
	JMP CODE_098564				;C - - - - - 0x012507 04:84F7: 4C 64 85
CODE_0984FA:
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01250A 04:84FA: BD C7 05
	STA scratch4				;C - - - - - 0x01250D 04:84FD: 85 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01250F 04:84FF: BD 9F 05
	STA scratch5				;C - - - - - 0x012512 04:8502: 85 05
	LDA #$0C					;C - - - - - 0x012514 04:8504: A9 0C
	STA scratch2				;C - - - - - 0x012516 04:8506: 85 02
	LDA #$08					;C - - - - - 0x012518 04:8508: A9 08
	STA scratch3				;C - - - - - 0x01251A 04:850A: 85 03
	JSR HazardCheckEnemies				;C - - - - - 0x01251C 04:850C: 20 1D 8A
	JSR HazardCheckPlayer				;C - - - - - 0x01251F 04:850F: 20 DA 89
	JSR CODE_098839				;C - - - - - 0x012522 04:8512: 20 39 88
	LDA terrainResult				;C - - - - - 0x012525 04:8515: AD E9 04
	AND #$F0					;C - - - - - 0x012528 04:8518: 29 F0
	BEQ CODE_09852C				;C - - - - - 0x01252A 04:851A: F0 10
		CMP #$50					;C - - - - - 0x01252C 04:851C: C9 50
		BEQ CODE_098545				;C - - - - - 0x01252E 04:851E: F0 25
			LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012530 04:8520: BD C7 05
			SEC							;C - - - - - 0x012533 04:8523: 38
			SBC #$05					;C - - - - - 0x012534 04:8524: E9 05
			STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012536 04:8526: 9D C7 05
			JMP CODE_098564				;C - - - - - 0x012539 04:8529: 4C 64 85
CODE_09852C:
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01253C 04:852C: BD 9F 05
	CLC							;C - - - - - 0x01253F 04:852F: 18
	ADC #$06					;C - - - - - 0x012540 04:8530: 69 06
	STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012542 04:8532: 9D 9F 05
	LDA #.LOBYTE(anFloodV_ID)					;C - - - - - 0x012545 04:8535: A9 09
	STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x012547 04:8537: 9D 8F 06
	LDA #$00					;C - - - - - 0x01254A 04:853A: A9 00
	STA objAnimProgress+OSLOT_BUBBLE,X				;C - - - - - 0x01254C 04:853C: 9D DF 06
	STA objAnimTimer+OSLOT_BUBBLE,X				;C - - - - - 0x01254F 04:853F: 9D B7 06
	JMP CODE_098564				;C - - - - - 0x012552 04:8542: 4C 64 85
CODE_098545:
	LDA terrainResult				;C - - - - - 0x012555 04:8545: AD E9 04
	AND #$0F					;C - - - - - 0x012558 04:8548: 29 0F
	STA scratch0				;C - - - - - 0x01255A 04:854A: 85 00
	LDA bubbleProgress,X				;C - - - - - 0x01255C 04:854C: BD D5 04
	EOR #$80					;C - - - - - 0x01255F 04:854F: 49 80
	STA bubbleProgress,X				;C - - - - - 0x012561 04:8551: 9D D5 04
	ASL							;C - - - - - 0x012564 04:8554: 0A
	BCC CODE_09855F				;C - - - - - 0x012565 04:8555: 90 08
		LDA #.LOBYTE(anFloodH_ID)					;C - - - - - 0x012567 04:8557: A9 2C
		STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x012569 04:8559: 9D 8F 06
		JMP CODE_098564				;C - - - - - 0x01256C 04:855C: 4C 64 85
CODE_09855F:
	LDA #.LOBYTE(anFloodHAlt_ID)					;C - - - - - 0x01256F 04:855F: A9 3F
	STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x012571 04:8561: 9D 8F 06
CODE_098564:
	INC bubbleProgress,X				;C - - - - - 0x012574 04:8564: FE D5 04
	LDA bubbleProgress,X				;C - - - - - 0x012577 04:8567: BD D5 04
	AND #$7F					;C - - - - - 0x01257A 04:856A: 29 7F
	CMP #$7F					;C - - - - - 0x01257C 04:856C: C9 7F
	BCC CODE_09857B				;C - - - - - 0x01257E 04:856E: 90 0B
		LDA #$00					;C - - - - - 0x012580 04:8570: A9 00
		STA bubbleProgress,X				;C - - - - - 0x012582 04:8572: 9D D5 04
		STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x012585 04:8575: 9D 77 05
		STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x012588 04:8578: 9D 2F 07
CODE_09857B:
	JMP CODE_09876A				;C - - - - - 0x01258B 04:857B: 4C 6A 87
CODE_09857E:
	CMP #.LOBYTE(anSnowRelease_ID)					;C - - - - - 0x01258E 04:857E: C9 0A
	BNE CODE_098592				;C - - - - - 0x012590 04:8580: D0 10
		LDA #.LOBYTE(anSnowSpread_ID)					;C - - - - - 0x012592 04:8582: A9 3D
		STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x012594 04:8584: 9D 8F 06
		LDA #$00					;C - - - - - 0x012597 04:8587: A9 00
		STA objAnimProgress+OSLOT_BUBBLE,X				;C - - - - - 0x012599 04:8589: 9D DF 06
		STA objAnimTimer+OSLOT_BUBBLE,X				;C - - - - - 0x01259C 04:858C: 9D B7 06
		JMP CODE_0985D9				;C - - - - - 0x01259F 04:858F: 4C D9 85
CODE_098592:
	CMP #.LOBYTE(anSnowSpread_ID)					;C - - - - - 0x0125A2 04:8592: C9 3D
	BNE CODE_0985BD				;C - - - - - 0x0125A4 04:8594: D0 27
		LDY bubbleProgress,X				;C - - - - - 0x0125A6 04:8596: BC D5 04
		LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0125A9 04:8599: BD 9F 05
		CLC							;C - - - - - 0x0125AC 04:859C: 18
		ADC DATA_0985F1,Y			;C - - - - - 0x0125AD 04:859D: 79 F1 85
		STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0125B0 04:85A0: 9D 9F 05
		INC bubbleProgress,X				;C - - - - - 0x0125B3 04:85A3: FE D5 04
		LDA bubbleProgress,X				;C - - - - - 0x0125B6 04:85A6: BD D5 04
		CMP #$0F					;C - - - - - 0x0125B9 04:85A9: C9 0F
		BNE CODE_0985D9				;C - - - - - 0x0125BB 04:85AB: D0 2C
			LDA #.LOBYTE(anSnowFall_ID)					;C - - - - - 0x0125BD 04:85AD: A9 3E
			STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x0125BF 04:85AF: 9D 8F 06
			LDA #$00					;C - - - - - 0x0125C2 04:85B2: A9 00
			STA objAnimProgress+OSLOT_BUBBLE,X				;C - - - - - 0x0125C4 04:85B4: 9D DF 06
			STA objAnimTimer+OSLOT_BUBBLE,X				;C - - - - - 0x0125C7 04:85B7: 9D B7 06
			JMP CODE_0985D9				;C - - - - - 0x0125CA 04:85BA: 4C D9 85
CODE_0985BD:
	CMP #.LOBYTE(anSnowFall_ID)					;C - - - - - 0x0125CD 04:85BD: C9 3E
	BNE CODE_098601				;C - - - - - 0x0125CF 04:85BF: D0 40

	LDA #$02					;C - - - - - 0x0125D1 04:85C1: A9 02
	CLC							;C - - - - - 0x0125D3 04:85C3: 18
	ADC objY+OSLOT_BUBBLE,X				;C - - - - - 0x0125D4 04:85C4: 7D 9F 05
	STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0125D7 04:85C7: 9D 9F 05
	CMP #$F0					;C - - - - - 0x0125DA 04:85CA: C9 F0
	BCC CODE_0985D9				;C - - - - - 0x0125DC 04:85CC: 90 0B
		LDA #$00					;C - - - - - 0x0125DE 04:85CE: A9 00
		STA bubbleProgress,X				;C - - - - - 0x0125E0 04:85D0: 9D D5 04
		STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x0125E3 04:85D3: 9D 77 05
		STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x0125E6 04:85D6: 9D 2F 07
CODE_0985D9:
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x0125E9 04:85D9: BD C7 05
	STA scratch4				;C - - - - - 0x0125EC 04:85DC: 85 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0125EE 04:85DE: BD 9F 05
	STA scratch5				;C - - - - - 0x0125F1 04:85E1: 85 05
	LDA #$28					;C - - - - - 0x0125F3 04:85E3: A9 28
	STA scratch2				;C - - - - - 0x0125F5 04:85E5: 85 02
	LDA #$00					;C - - - - - 0x0125F7 04:85E7: A9 00
	STA scratch3				;C - - - - - 0x0125F9 04:85E9: 85 03
	JSR HazardCheckEnemies				;C - - - - - 0x0125FB 04:85EB: 20 1D 8A
	JMP CODE_09876A				;C - - - - - 0x0125FE 04:85EE: 4C 6A 87

DATA_0985F1:
	.byte $00					;- D 0 - - - 0x012601 04:85F1: 00
	.byte $FB					;- D 0 - - - 0x012602 04:85F2: FB
	.byte $FC					;- D 0 - - - 0x012603 04:85F3: FC
	.byte $FC					;- D 0 - - - 0x012604 04:85F4: FC
	.byte $FD					;- D 0 - - - 0x012605 04:85F5: FD
	.byte $FD					;- D 0 - - - 0x012606 04:85F6: FD
	.byte $FD					;- D 0 - - - 0x012607 04:85F7: FD
	.byte $FE					;- D 0 - - - 0x012608 04:85F8: FE
	.byte $FE					;- D 0 - - - 0x012609 04:85F9: FE
	.byte $FE					;- D 0 - - - 0x01260A 04:85FA: FE
	.byte $FE					;- D 0 - - - 0x01260B 04:85FB: FE
	.byte $FF					;- D 0 - - - 0x01260C 04:85FC: FF
	.byte $FF					;- D 0 - - - 0x01260D 04:85FD: FF
	.byte $FF					;- D 0 - - - 0x01260E 04:85FE: FF
	.byte $FF					;- D 0 - - - 0x01260F 04:85FF: FF
	.byte $FF					;- - - - - - 0x012610 04:8600: FF

CODE_098601:
	CMP #$0B					;C - - - - - 0x012611 04:8601: C9 0B
	BEQ CODE_098608				;C - - - - - 0x012613 04:8603: F0 03
		JMP CODE_0986A4				;C - - - - - 0x012615 04:8605: 4C A4 86
CODE_098608:
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012618 04:8608: BD C7 05
	STA scratch4				;C - - - - - 0x01261B 04:860B: 85 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01261D 04:860D: BD 9F 05
	STA scratch5				;C - - - - - 0x012620 04:8610: 85 05
	LDA #$08					;C - - - - - 0x012622 04:8612: A9 08
	STA scratch2				;C - - - - - 0x012624 04:8614: 85 02
	STA scratch3				;C - - - - - 0x012626 04:8616: 85 03
	JSR HazardCheckEnemies				;C - - - - - 0x012628 04:8618: 20 1D 8A
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01262B 04:861B: BD 9F 05
	JSR CODE_09888E				;C - - - - - 0x01262E 04:861E: 20 8E 88
	LDA terrainResult				;C - - - - - 0x012631 04:8621: AD E9 04
	BEQ CODE_098681				;C - - - - - 0x012634 04:8624: F0 5B

	AND #$F0					;C - - - - - 0x012636 04:8626: 29 F0
	BEQ CODE_09868A				;C - - - - - 0x012638 04:8628: F0 60

	LDA terrainResult				;C - - - - - 0x01263A 04:862A: AD E9 04
	AND #$0F					;C - - - - - 0x01263D 04:862D: 29 0F
	STA scratch0				;C - - - - - 0x01263F 04:862F: 85 00
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012641 04:8631: BD 9F 05
	CLC							;C - - - - - 0x012644 04:8634: 18
	ADC scratch0				;C - - - - - 0x012645 04:8635: 65 00
	STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012647 04:8637: 9D 9F 05
	DEC objY+OSLOT_BUBBLE,X				;C - - - - - 0x01264A 04:863A: DE 9F 05
	LDA terrainResult				;C - - - - - 0x01264D 04:863D: AD E9 04
	AND #$C0					;C - - - - - 0x012650 04:8640: 29 C0
	BEQ CODE_098662				;C - - - - - 0x012652 04:8642: F0 1E
		CMP #$80					;C - - - - - 0x012654 04:8644: C9 80
		BNE CODE_09865A				;C - - - - - 0x012656 04:8646: D0 12
			LDA bubbleProgress,X				;C - - - - - 0x012658 04:8648: BD D5 04
			AND #$7F					;C - - - - - 0x01265B 04:864B: 29 7F
			STA scratch0				;C - - - - - 0x01265D 04:864D: 85 00
			LDA scratch0				;C - - - - - 0x01265F 04:864F: A5 00
			CLC							;C - - - - - 0x012661 04:8651: 18
			ADC #$80					;C - - - - - 0x012662 04:8652: 69 80
			STA bubbleProgress,X				;C - - - - - 0x012664 04:8654: 9D D5 04
			JMP CODE_098662				;C - - - - - 0x012667 04:8657: 4C 62 86
	CODE_09865A:
		LDA bubbleProgress,X				;C - - - - - 0x01266A 04:865A: BD D5 04
		AND #$7F					;C - - - - - 0x01266D 04:865D: 29 7F
		STA bubbleProgress,X				;C - - - - - 0x01266F 04:865F: 9D D5 04
CODE_098662:
	LDA bubbleProgress,X				;C - - - - - 0x012672 04:8662: BD D5 04
	AND #$80					;C - - - - - 0x012675 04:8665: 29 80
	BEQ CODE_098675				;C - - - - - 0x012677 04:8667: F0 0C
		LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012679 04:8669: BD C7 05
		SEC							;C - - - - - 0x01267C 04:866C: 38
		SBC #$06					;C - - - - - 0x01267D 04:866D: E9 06
		STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01267F 04:866F: 9D C7 05
		JMP CODE_09868A				;C - - - - - 0x012682 04:8672: 4C 8A 86
CODE_098675:
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012685 04:8675: BD C7 05
	CLC							;C - - - - - 0x012688 04:8678: 18
	ADC #$06					;C - - - - - 0x012689 04:8679: 69 06
	STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01268B 04:867B: 9D C7 05
	JMP CODE_09868A				;C - - - - - 0x01268E 04:867E: 4C 8A 86
CODE_098681:
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012691 04:8681: BD 9F 05
	SEC							;C - - - - - 0x012694 04:8684: 38
	SBC #$06					;C - - - - - 0x012695 04:8685: E9 06
	STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012697 04:8687: 9D 9F 05
CODE_09868A:
	INC bubbleProgress,X				;C - - - - - 0x01269A 04:868A: FE D5 04
	LDA bubbleProgress,X				;C - - - - - 0x01269D 04:868D: BD D5 04
	AND #$7F					;C - - - - - 0x0126A0 04:8690: 29 7F
	CMP #$70					;C - - - - - 0x0126A2 04:8692: C9 70
	BNE CODE_0986A1				;C - - - - - 0x0126A4 04:8694: D0 0B
		LDA #$00					;C - - - - - 0x0126A6 04:8696: A9 00
		STA bubbleProgress,X				;C - - - - - 0x0126A8 04:8698: 9D D5 04
		STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x0126AB 04:869B: 9D 77 05
		STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x0126AE 04:869E: 9D 2F 07
CODE_0986A1:
	JMP CODE_09876A				;C - - - - - 0x0126B1 04:86A1: 4C 6A 87
CODE_0986A4:
	CMP #$0C					;C - - - - - 0x0126B4 04:86A4: C9 0C
.ifdef REGION_JP
	BNE CODE_098723					;- - - - - - 0x0126A5 04:8695: D0
.else
	BEQ CODE_0986AB				;C - - - - - 0x0126B6 04:86A6: F0 03
		;Unreached
		JMP CODE_098723				;- - - - - - 0x0126B8 04:86A8: 4C
.endif
CODE_0986AB:
	;Runs when popping star bubble
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x0126BB 04:86AB: BD C7 05
	STA scratch4				;C - - - - - 0x0126BE 04:86AE: 85 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0126C0 04:86B0: BD 9F 05
	STA scratch5				;C - - - - - 0x0126C3 04:86B3: 85 05
	LDA #$18					;C - - - - - 0x0126C5 04:86B5: A9 18
	STA scratch2				;C - - - - - 0x0126C7 04:86B7: 85 02
	STA scratch3				;C - - - - - 0x0126C9 04:86B9: 85 03
	JSR HazardCheckEnemies				;C - - - - - 0x0126CB 04:86BB: 20 1D 8A

.ifdef REGION_JP
	LDA #.BANK(DATA_04BF88)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x0126CE 04:86BE: A9 00
	ORA #$07					;C - - - - - 0x0126D0 04:86C0: 09 07
	STA $8000				;C - - - - - 0x0126D2 04:86C2: 8D 00 80
	LDA #.BANK(DATA_04BF88)					;C - - - - - 0x0126D5 04:86C5: A9 04
	STA $8001				;C - - - - - 0x0126D7 04:86C7: 8D 01 80
	STA prgBankB				;C - - - - - 0x0126DA 04:86CA: 85 53

	LDA #$00					;C - - - - - 0x0126DC 04:86CC: A9 00
	ORA #$07					;C - - - - - 0x0126DE 04:86CE: 09 07
	STA $8000				;C - - - - - 0x0126E0 04:86D0: 8D 00 80
	LDA #.BANK(DATA_04BF88)					;C - - - - - 0x0126E3 04:86D3: A9 04
	STA $8001				;C - - - - - 0x0126E5 04:86D5: 8D 01 80
	STA prgBankB				;C - - - - - 0x0126E8 04:86D8: 85 53
.endif

	LDY bubbleProgress,X				;C - - - - - 0x0126EA 04:86DA: BC D5 04
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x0126ED 04:86DD: BD C7 05
	SEC							;C - - - - - 0x0126F0 04:86E0: 38
	SBC DATA_04BF88,Y			;C - - - - - 0x0126F1 04:86E1: F9 88 BF
	STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x0126F4 04:86E4: 9D C7 05
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0126F7 04:86E7: BD 9F 05
	SEC							;C - - - - - 0x0126FA 04:86EA: 38
	SBC DATA_04BFBC,Y			;C - - - - - 0x0126FB 04:86EB: F9 BC BF
	STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0126FE 04:86EE: 9D 9F 05

.ifdef REGION_JP
	LDA nmiPrgBankB					;- - - - - - 0x0126D8 04:86C8: A5
.endif

	INC bubbleProgress,X				;C - - - - - 0x012701 04:86F1: FE D5 04
	LDA bubbleProgress,X				;C - - - - - 0x012704 04:86F4: BD D5 04
	CMP #$33					;C - - - - - 0x012707 04:86F7: C9 33
	BCS CODE_098715				;C - - - - - 0x012709 04:86F9: B0 1A
		LDY bubbleProgress,X				;C - - - - - 0x01270B 04:86FB: BC D5 04
		LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01270E 04:86FE: BD C7 05
		CLC							;C - - - - - 0x012711 04:8701: 18
		ADC DATA_04BF88,Y			;C - - - - - 0x012712 04:8702: 79 88 BF
		STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012715 04:8705: 9D C7 05
		LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012718 04:8708: BD 9F 05
		CLC							;C - - - - - 0x01271B 04:870B: 18
		ADC DATA_04BFBC,Y			;C - - - - - 0x01271C 04:870C: 79 BC BF
		STA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01271F 04:870F: 9D 9F 05
		JMP CODE_098720				;C - - - - - 0x012722 04:8712: 4C 20 87
CODE_098715:
	LDA #$00					;C - - - - - 0x012725 04:8715: A9 00
	STA bubbleProgress,X				;C - - - - - 0x012727 04:8717: 9D D5 04
	STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x01272A 04:871A: 9D 77 05
	STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x01272D 04:871D: 9D 2F 07
CODE_098720:
	JMP CODE_098780				;C - - - - - 0x012730 04:8720: 4C 80 87
CODE_098723:
	;Unreached
	CMP #$33					;- - - - - - 0x012733 04:8723: C9
	BNE CODE_09876A				;- - - - - - 0x012735 04:8725: D0
		INC bubbleProgress,X				;- - - - - - 0x012737 04:8727: FE
		LDA bubbleProgress,X				;- - - - - - 0x01273A 04:872A: BD
		CMP #$10					;- - - - - - 0x01273D 04:872D: C9
		BNE CODE_098739				;- - - - - - 0x01273F 04:872F: D0
			LDA #$00					;- - - - - - 0x012741 04:8731: A9
			STA objState+OSLOT_BUBBLE,X				;- - - - - - 0x012743 04:8733: 9D
			STA objAnimHI+OSLOT_BUBBLE,X				;- - - - - - 0x012746 04:8736: 9D
	CODE_098739:
		JMP CODE_09876A				;- - - - - - 0x012749 04:8739: 4C
CODE_09873C:
	INC bubbleProgress,X				;C - - - - - 0x01274C 04:873C: FE D5 04
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01274F 04:873F: BD C7 05
	STA scratch4				;C - - - - - 0x012752 04:8742: 85 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012754 04:8744: BD 9F 05
	STA scratch5				;C - - - - - 0x012757 04:8747: 85 05
	LDA #$18					;C - - - - - 0x012759 04:8749: A9 18
	STA scratch2				;C - - - - - 0x01275B 04:874B: 85 02
	STA scratch3				;C - - - - - 0x01275D 04:874D: 85 03
	JSR HazardCheckEnemies				;C - - - - - 0x01275F 04:874F: 20 1D 8A
	JSR HazardCheckPlayer				;C - - - - - 0x012762 04:8752: 20 DA 89
	LDA bubbleProgress,X				;C - - - - - 0x012765 04:8755: BD D5 04
	CMP #$10					;C - - - - - 0x012768 04:8758: C9 10
	BNE CODE_098780				;C - - - - - 0x01276A 04:875A: D0 24
		LDA #$00					;C - - - - - 0x01276C 04:875C: A9 00
		STA bubbleProgress,X				;C - - - - - 0x01276E 04:875E: 9D D5 04
		STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x012771 04:8761: 9D 77 05
		STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x012774 04:8764: 9D 2F 07
		JMP CODE_098780				;C - - - - - 0x012777 04:8767: 4C 80 87
	CODE_09876A:
		LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x01277A 04:876A: BD 77 05
		CMP #$06					;C - - - - - 0x01277D 04:876D: C9 06
		BNE CODE_098780				;C - - - - - 0x01277F 04:876F: D0 0F
			LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012781 04:8771: BD 9F 05
			CMP #$F0					;C - - - - - 0x012784 04:8774: C9 F0
			BCC CODE_098780				;C - - - - - 0x012786 04:8776: 90 08
				LDA #$00					;C - - - - - 0x012788 04:8778: A9 00
				STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x01278A 04:877A: 9D 77 05
				STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x01278D 04:877D: 9D 2F 07
CODE_098780:
	RTS							;C - - - - - 0x012790 04:8780: 60

CODE_098781:
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012791 04:8781: BD 9F 05
	CLC							;C - - - - - 0x012794 04:8784: 18
	ADC #$08					;C - - - - - 0x012795 04:8785: 69 08
	STA scratch0				;C - - - - - 0x012797 04:8787: 85 00
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012799 04:8789: BD C7 05
	STA scratch1				;C - - - - - 0x01279C 04:878C: 85 01
	JSR GetTile				;C - - - - - 0x01279E 04:878E: 20 CB F4
	JSR CODE_0FF852				;C - - - - - 0x0127A1 04:8791: 20 52 F8
	LDA scratch4				;C - - - - - 0x0127A4 04:8794: A5 04
	BNE CODE_09879B				;C - - - - - 0x0127A6 04:8796: D0 03
		JMP CODE_098838				;C - - - - - 0x0127A8 04:8798: 4C 38 88
CODE_09879B:
	AND #$07					;C - - - - - 0x0127AB 04:879B: 29 07
	ORA #$40					;C - - - - - 0x0127AD 04:879D: 09 40
	STA terrainResult				;C - - - - - 0x0127AF 04:879F: 8D E9 04
	LDA scratch1				;C - - - - - 0x0127B2 04:87A2: A5 01
	SEC							;C - - - - - 0x0127B4 04:87A4: 38
	SBC #$08					;C - - - - - 0x0127B5 04:87A5: E9 08
	STA scratch1				;C - - - - - 0x0127B7 04:87A7: 85 01
	JSR GetTile				;C - - - - - 0x0127B9 04:87A9: 20 CB F4
	LDA scratch3				;C - - - - - 0x0127BC 04:87AC: A5 03
	EOR #$07					;C - - - - - 0x0127BE 04:87AE: 49 07
	STA scratch3				;C - - - - - 0x0127C0 04:87B0: 85 03
	JSR CODE_0FF852				;C - - - - - 0x0127C2 04:87B2: 20 52 F8
	LDA scratch4				;C - - - - - 0x0127C5 04:87B5: A5 04
	BEQ CODE_0987D8				;C - - - - - 0x0127C7 04:87B7: F0 1F
		LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0127C9 04:87B9: BD 9F 05
		STA scratch0				;C - - - - - 0x0127CC 04:87BC: 85 00
		JSR GetTile				;C - - - - - 0x0127CE 04:87BE: 20 CB F4
		LDA scratch3				;C - - - - - 0x0127D1 04:87C1: A5 03
		EOR #$07					;C - - - - - 0x0127D3 04:87C3: 49 07
		STA scratch3				;C - - - - - 0x0127D5 04:87C5: 85 03
		JSR CheckWall				;C - - - - - 0x0127D7 04:87C7: 20 E2 F7
		LDA scratch4				;C - - - - - 0x0127DA 04:87CA: A5 04
		BNE CODE_0987D8				;C - - - - - 0x0127DC 04:87CC: D0 0A
			LDA terrainResult				;C - - - - - 0x0127DE 04:87CE: AD E9 04
			ORA #$80					;C - - - - - 0x0127E1 04:87D1: 09 80
			STA terrainResult				;C - - - - - 0x0127E3 04:87D3: 8D E9 04
			LDY #$02					;C - - - - - 0x0127E6 04:87D6: A0 02
CODE_0987D8:
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0127E8 04:87D8: BD 9F 05
	CLC							;C - - - - - 0x0127EB 04:87DB: 18
	ADC #$08					;C - - - - - 0x0127EC 04:87DC: 69 08
	STA scratch0				;C - - - - - 0x0127EE 04:87DE: 85 00
	LDA scratch1				;C - - - - - 0x0127F0 04:87E0: A5 01
	CLC							;C - - - - - 0x0127F2 04:87E2: 18
	ADC #$10					;C - - - - - 0x0127F3 04:87E3: 69 10
	STA scratch1				;C - - - - - 0x0127F5 04:87E5: 85 01
	JSR GetTile				;C - - - - - 0x0127F7 04:87E7: 20 CB F4
	JSR CODE_0FF852				;C - - - - - 0x0127FA 04:87EA: 20 52 F8
	LDA scratch4				;C - - - - - 0x0127FD 04:87ED: A5 04
	BEQ CODE_098838				;C - - - - - 0x0127FF 04:87EF: F0 47

	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012801 04:87F1: BD 9F 05
	STA scratch0				;C - - - - - 0x012804 04:87F4: 85 00
	JSR GetTile				;C - - - - - 0x012806 04:87F6: 20 CB F4
	JSR CheckFloor				;C - - - - - 0x012809 04:87F9: 20 1A F8
	LDA scratch4				;C - - - - - 0x01280C 04:87FC: A5 04
	BNE CODE_098838				;C - - - - - 0x01280E 04:87FE: D0 38

	LDA terrainResult				;C - - - - - 0x012810 04:8800: AD E9 04
	ORA #$20					;C - - - - - 0x012813 04:8803: 09 20
	STA terrainResult				;C - - - - - 0x012815 04:8805: 8D E9 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012818 04:8808: BD 9F 05
	CLC							;C - - - - - 0x01281B 04:880B: 18
	ADC #$08					;C - - - - - 0x01281C 04:880C: 69 08
	STA scratch0				;C - - - - - 0x01281E 04:880E: 85 00
	LDA scratch1				;C - - - - - 0x012820 04:8810: A5 01
	CLC							;C - - - - - 0x012822 04:8812: 18
	ADC #$08					;C - - - - - 0x012823 04:8813: 69 08
	STA scratch1				;C - - - - - 0x012825 04:8815: 85 01
	JSR GetTile				;C - - - - - 0x012827 04:8817: 20 CB F4
	JSR CODE_0FF852				;C - - - - - 0x01282A 04:881A: 20 52 F8
	LDA scratch4				;C - - - - - 0x01282D 04:881D: A5 04
	BEQ CODE_098838				;C - - - - - 0x01282F 04:881F: F0 17

	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012831 04:8821: BD 9F 05
	STA scratch0				;C - - - - - 0x012834 04:8824: 85 00
	JSR GetTile				;C - - - - - 0x012836 04:8826: 20 CB F4
	JSR CheckFloor				;C - - - - - 0x012839 04:8829: 20 1A F8
	LDA scratch4				;C - - - - - 0x01283C 04:882C: A5 04
	BNE CODE_098838				;C - - - - - 0x01283E 04:882E: D0 08
		LDA terrainResult				;C - - - - - 0x012840 04:8830: AD E9 04
		ORA #$10					;C - - - - - 0x012843 04:8833: 09 10
		STA terrainResult				;C - - - - - 0x012845 04:8835: 8D E9 04
CODE_098838:
	RTS							;C - - - - - 0x012848 04:8838: 60

CODE_098839:
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012849 04:8839: BD 9F 05
	CLC							;C - - - - - 0x01284C 04:883C: 18
	ADC #$08					;C - - - - - 0x01284D 04:883D: 69 08
	STA scratch0				;C - - - - - 0x01284F 04:883F: 85 00
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012851 04:8841: BD C7 05
	STA scratch1				;C - - - - - 0x012854 04:8844: 85 01
	JSR GetTile				;C - - - - - 0x012856 04:8846: 20 CB F4
	JSR CODE_0FF852				;C - - - - - 0x012859 04:8849: 20 52 F8
	LDA scratch4				;C - - - - - 0x01285C 04:884C: A5 04
	STA terrainResult				;C - - - - - 0x01285E 04:884E: 8D E9 04
	BEQ CODE_09888D				;C - - - - - 0x012861 04:8851: F0 3A

	AND #$07					;C - - - - - 0x012863 04:8853: 29 07
	ORA #$10					;C - - - - - 0x012865 04:8855: 09 10
	STA terrainResult				;C - - - - - 0x012867 04:8857: 8D E9 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01286A 04:885A: BD 9F 05
	STA scratch0				;C - - - - - 0x01286D 04:885D: 85 00
	LDA scratch1				;C - - - - - 0x01286F 04:885F: A5 01
	SEC							;C - - - - - 0x012871 04:8861: 38
	SBC #$08					;C - - - - - 0x012872 04:8862: E9 08
	STA scratch1				;C - - - - - 0x012874 04:8864: 85 01
	JSR GetTile				;C - - - - - 0x012876 04:8866: 20 CB F4
	LDA scratch3				;C - - - - - 0x012879 04:8869: A5 03
	EOR #$07					;C - - - - - 0x01287B 04:886B: 49 07
	STA scratch3				;C - - - - - 0x01287D 04:886D: 85 03
	JSR CheckWall				;C - - - - - 0x01287F 04:886F: 20 E2 F7
	LDA scratch4				;C - - - - - 0x012882 04:8872: A5 04
	BNE CODE_098883				;C - - - - - 0x012884 04:8874: D0 0D
		LDA scratch1				;C - - - - - 0x012886 04:8876: A5 01
		CLC							;C - - - - - 0x012888 04:8878: 18
		ADC #$10					;C - - - - - 0x012889 04:8879: 69 10
		STA scratch1				;C - - - - - 0x01288B 04:887B: 85 01
		JSR GetTile				;C - - - - - 0x01288D 04:887D: 20 CB F4
		JSR CheckFloor				;C - - - - - 0x012890 04:8880: 20 1A F8
CODE_098883:
	LDA scratch4				;C - - - - - 0x012893 04:8883: A5 04
	AND #$C0					;C - - - - - 0x012895 04:8885: 29 C0
	ORA terrainResult				;C - - - - - 0x012897 04:8887: 0D E9 04
	STA terrainResult				;C - - - - - 0x01289A 04:888A: 8D E9 04
CODE_09888D:
	RTS							;C - - - - - 0x01289D 04:888D: 60

CODE_09888E:
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x01289E 04:888E: BD 9F 05
	SEC							;C - - - - - 0x0128A1 04:8891: 38
	SBC #$08					;C - - - - - 0x0128A2 04:8892: E9 08
	STA scratch0				;C - - - - - 0x0128A4 04:8894: 85 00
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x0128A6 04:8896: BD C7 05
	STA scratch1				;C - - - - - 0x0128A9 04:8899: 85 01
	JSR GetTile				;C - - - - - 0x0128AB 04:889B: 20 CB F4
	LDA scratch2				;C - - - - - 0x0128AE 04:889E: A5 02
	EOR #$07					;C - - - - - 0x0128B0 04:88A0: 49 07
	STA scratch2				;C - - - - - 0x0128B2 04:88A2: 85 02
	JSR CODE_0FF8F3				;C - - - - - 0x0128B4 04:88A4: 20 F3 F8
	LDA scratch4				;C - - - - - 0x0128B7 04:88A7: A5 04
	AND #$07					;C - - - - - 0x0128B9 04:88A9: 29 07
	STA terrainResult				;C - - - - - 0x0128BB 04:88AB: 8D E9 04
	BEQ CODE_0988EB				;C - - - - - 0x0128BE 04:88AE: F0 3B

	LDA terrainResult				;C - - - - - 0x0128C0 04:88B0: AD E9 04
	ORA #$10					;C - - - - - 0x0128C3 04:88B3: 09 10
	STA terrainResult				;C - - - - - 0x0128C5 04:88B5: 8D E9 04
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x0128C8 04:88B8: BD 9F 05
	STA scratch0				;C - - - - - 0x0128CB 04:88BB: 85 00
	LDA scratch1				;C - - - - - 0x0128CD 04:88BD: A5 01
	SEC							;C - - - - - 0x0128CF 04:88BF: 38
	SBC #$08					;C - - - - - 0x0128D0 04:88C0: E9 08
	STA scratch1				;C - - - - - 0x0128D2 04:88C2: 85 01
	JSR GetTile				;C - - - - - 0x0128D4 04:88C4: 20 CB F4
	LDA scratch3				;C - - - - - 0x0128D7 04:88C7: A5 03
	EOR #$07					;C - - - - - 0x0128D9 04:88C9: 49 07
	STA scratch3				;C - - - - - 0x0128DB 04:88CB: 85 03
	JSR CheckWall				;C - - - - - 0x0128DD 04:88CD: 20 E2 F7
	LDA scratch4				;C - - - - - 0x0128E0 04:88D0: A5 04
	BNE CODE_0988E1				;C - - - - - 0x0128E2 04:88D2: D0 0D
		LDA scratch1				;C - - - - - 0x0128E4 04:88D4: A5 01
		CLC							;C - - - - - 0x0128E6 04:88D6: 18
		ADC #$10					;C - - - - - 0x0128E7 04:88D7: 69 10
		STA scratch1				;C - - - - - 0x0128E9 04:88D9: 85 01
		JSR GetTile				;C - - - - - 0x0128EB 04:88DB: 20 CB F4
		JSR CheckFloor				;C - - - - - 0x0128EE 04:88DE: 20 1A F8
CODE_0988E1:
	LDA scratch4				;C - - - - - 0x0128F1 04:88E1: A5 04
	AND #$C0					;C - - - - - 0x0128F3 04:88E3: 29 C0
	ORA terrainResult				;C - - - - - 0x0128F5 04:88E5: 0D E9 04
	STA terrainResult				;C - - - - - 0x0128F8 04:88E8: 8D E9 04
CODE_0988EB:
	RTS							;C - - - - - 0x0128FB 04:88EB: 60

CODE_0988EC:
	LDY #$00					;C - - - - - 0x0128FC 04:88EC: A0 00
CODE_0988EE:
	LDA objState+OSLOT_BUBBLE,Y				;C - - - - - 0x0128FE 04:88EE: B9 77 05
	BEQ CODE_0988FB				;C - - - - - 0x012901 04:88F1: F0 08
		INY							;C - - - - - 0x012903 04:88F3: C8
		CPY #20					;C - - - - - 0x012904 04:88F4: C0 14
		BNE CODE_0988EE				;C - - - - - 0x012906 04:88F6: D0 F6
			;Unreached
			JMP CODE_098931				;- - - - - - 0x012908 04:88F8: 4C
CODE_0988FB:
	LDA #$06					;C - - - - - 0x01290B 04:88FB: A9 06
	STA objState+OSLOT_BUBBLE,Y				;C - - - - - 0x01290D 04:88FD: 99 77 05
	LDA #.LOBYTE(anFloodV_ID)					;C - - - - - 0x012910 04:8900: A9 09
	STA objAnim+OSLOT_BUBBLE,Y				;C - - - - - 0x012912 04:8902: 99 8F 06
	LDA #.HIBYTE(anFloodV_ID)					;C - - - - - 0x012915 04:8905: A9 01
	STA objAnimHI+OSLOT_BUBBLE,Y				;C - - - - - 0x012917 04:8907: 99 2F 07
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x01291A 04:890A: BD C7 05
	STA objX+OSLOT_BUBBLE,Y				;C - - - - - 0x01291D 04:890D: 99 C7 05
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012920 04:8910: BD 9F 05
	SEC							;C - - - - - 0x012923 04:8913: 38
	SBC #$10					;C - - - - - 0x012924 04:8914: E9 10
	STA objY+OSLOT_BUBBLE,Y				;C - - - - - 0x012926 04:8916: 99 9F 05
	LDA #$00					;C - - - - - 0x012929 04:8919: A9 00
	STA objAnimProgress+OSLOT_BUBBLE,Y				;C - - - - - 0x01292B 04:891B: 99 DF 06
	STA objAnimTimer+OSLOT_BUBBLE,Y				;C - - - - - 0x01292E 04:891E: 99 B7 06
	LDA bubbleProgress,X				;C - - - - - 0x012931 04:8921: BD D5 04
	STA bubbleProgress,Y				;C - - - - - 0x012934 04:8924: 99 D5 04
	LDA #$00					;C - - - - - 0x012937 04:8927: A9 00
	STA objAttr+OSLOT_BUBBLE,Y				;C - - - - - 0x012939 04:8929: 99 07 07
	LDA #$01					;C - - - - - 0x01293C 04:892C: A9 01
	STA objChrSlot+OSLOT_BUBBLE,Y				;C - - - - - 0x01293E 04:892E: 99 3F 06
CODE_098931:
	RTS							;C - - - - - 0x012941 04:8931: 60

CODE_098932:
	LDA objY				;C - - - - - 0x012942 04:8932: AD 8B 05
	CLC							;C - - - - - 0x012945 04:8935: 18
	ADC #$02					;C - - - - - 0x012946 04:8936: 69 02
	STA scratch3				;C - - - - - 0x012948 04:8938: 85 03
	LDA objX				;C - - - - - 0x01294A 04:893A: AD B3 05
	STA scratch2				;C - - - - - 0x01294D 04:893D: 85 02
	LDA #$01					;C - - - - - 0x01294F 04:893F: A9 01
	STA scratch6				;C - - - - - 0x012951 04:8941: 85 06
	LDA #$00					;C - - - - - 0x012953 04:8943: A9 00
	STA scratch7				;C - - - - - 0x012955 04:8945: 85 07
	LDA scratch2				;C - - - - - 0x012957 04:8947: A5 02
	CMP scratch4				;C - - - - - 0x012959 04:8949: C5 04
	BCC CODE_098954				;C - - - - - 0x01295B 04:894B: 90 07
		SBC scratch4				;C - - - - - 0x01295D 04:894D: E5 04
		INC scratch6				;C - - - - - 0x01295F 04:894F: E6 06
		JMP CODE_098959				;C - - - - - 0x012961 04:8951: 4C 59 89
CODE_098954:
	LDA scratch4				;C - - - - - 0x012964 04:8954: A5 04
	SEC							;C - - - - - 0x012966 04:8956: 38
	SBC scratch2				;C - - - - - 0x012967 04:8957: E5 02
CODE_098959:
	CMP #$10					;C - - - - - 0x012969 04:8959: C9 10
	BCS CODE_0989C2				;C - - - - - 0x01296B 04:895B: B0 65

	STA scratch2				;C - - - - - 0x01296D 04:895D: 85 02
	LDA scratch3				;C - - - - - 0x01296F 04:895F: A5 03
	CMP scratch5				;C - - - - - 0x012971 04:8961: C5 05
	BCC CODE_09896A				;C - - - - - 0x012973 04:8963: 90 05
	SBC scratch5				;C - - - - - 0x012975 04:8965: E5 05
	JMP CODE_098971				;C - - - - - 0x012977 04:8967: 4C 71 89
CODE_09896A:
	INC scratch7				;C - - - - - 0x01297A 04:896A: E6 07
	LDA scratch5				;C - - - - - 0x01297C 04:896C: A5 05
	SEC							;C - - - - - 0x01297E 04:896E: 38
	SBC scratch3				;C - - - - - 0x01297F 04:896F: E5 03
CODE_098971:
	CMP #$10					;C - - - - - 0x012981 04:8971: C9 10
	BCS CODE_0989C2				;C - - - - - 0x012983 04:8973: B0 4D

	STA scratch3				;C - - - - - 0x012985 04:8975: 85 03
	LDA scratch7				;C - - - - - 0x012987 04:8977: A5 07
	BNE CODE_098984				;C - - - - - 0x012989 04:8979: D0 09
		LDA scratch2				;C - - - - - 0x01298B 04:897B: A5 02
		CMP #$0C					;C - - - - - 0x01298D 04:897D: C9 0C
		BCC CODE_0989BD				;C - - - - - 0x01298F 04:897F: 90 3C
		JMP CODE_0989AB				;C - - - - - 0x012991 04:8981: 4C AB 89
CODE_098984:
	LDA playerHeld				;C - - - - - 0x012994 04:8984: A5 72
	AND #KEY_A					;C - - - - - 0x012996 04:8986: 29 01
	BEQ CODE_0989BD				;C - - - - - 0x012998 04:8988: F0 33

	LDA playerState				;C - - - - - 0x01299A 04:898A: A5 75
	CMP #PLAYER_STATE_FLOATING	;C - - - - - 0x01299C 04:898C: C9 02
	BCS CODE_0989BD				;C - - - - - 0x01299E 04:898E: B0 2D

	LDY ram_0076				;C - - - - - 0x0129A0 04:8990: A4 76
	LDA DATA_0989C3,Y			;C - - - - - 0x0129A2 04:8992: B9 C3 89
	BEQ CODE_0989BD				;C - - - - - 0x0129A5 04:8995: F0 26

	AND #$01					;C - - - - - 0x0129A7 04:8997: 29 01
	BEQ CODE_0989A2				;C - - - - - 0x0129A9 04:8999: F0 07
	LDA ram_047B				;C - - - - - 0x0129AB 04:899B: AD 7B 04
	CMP #$04					;C - - - - - 0x0129AE 04:899E: C9 04
	BCS CODE_0989BD				;C - - - - - 0x0129B0 04:89A0: B0 1B
CODE_0989A2:
	LDA ram_007D				;C - - - - - 0x0129B2 04:89A2: A5 7D
	ORA #$80					;C - - - - - 0x0129B4 04:89A4: 09 80
	STA ram_007D				;C - - - - - 0x0129B6 04:89A6: 85 7D
	JMP CODE_0989C2				;C - - - - - 0x0129B8 04:89A8: 4C C2 89
CODE_0989AB:
	LDA scratch6				;C - - - - - 0x0129BB 04:89AB: A5 06
	CMP playerDir				;C - - - - - 0x0129BD 04:89AD: C5 77
	BEQ CODE_0989BD				;C - - - - - 0x0129BF 04:89AF: F0 0C
		JSR CODE_0989D1				;C - - - - - 0x0129C1 04:89B1: 20 D1 89
		LDA ram_007D				;C - - - - - 0x0129C4 04:89B4: A5 7D
		ORA #$40					;C - - - - - 0x0129C6 04:89B6: 09 40
		STA ram_007D				;C - - - - - 0x0129C8 04:89B8: 85 7D
		JMP CODE_0989C2				;C - - - - - 0x0129CA 04:89BA: 4C C2 89
CODE_0989BD:
	STX scratch1				;C - - - - - 0x0129CD 04:89BD: 86 01
	JSR PopBubble				;C - - - - - 0x0129CF 04:89BF: 20 7B FC
CODE_0989C2:
	RTS							;C - - - - - 0x0129D2 04:89C2: 60

DATA_0989C3:
	.byte $00					;- - - - - - 0x0129D3 04:89C3: 00
	.byte $00					;- - - - - - 0x0129D4 04:89C4: 00
	.byte $00					;- - - - - - 0x0129D5 04:89C5: 00
	.byte $01					;- D 0 - - - 0x0129D6 04:89C6: 01
	.byte $02					;- D 0 - - - 0x0129D7 04:89C7: 02
	.byte $02					;- D 0 - - - 0x0129D8 04:89C8: 02
	.byte $00					;- - - - - - 0x0129D9 04:89C9: 00
	.byte $00					;- - - - - - 0x0129DA 04:89CA: 00
	.byte $00					;- - - - - - 0x0129DB 04:89CB: 00
	.byte $02					;- D 0 - - - 0x0129DC 04:89CC: 02
	.byte $00					;- - - - - - 0x0129DD 04:89CD: 00
	.byte $00					;- - - - - - 0x0129DE 04:89CE: 00
	.byte $01					;- - - - - - 0x0129DF 04:89CF: 01
	.byte $02					;- D 0 - - - 0x0129E0 04:89D0: 02

CODE_0989D1:
	LDA playerDir				;C - - - - - 0x0129E1 04:89D1: A5 77
	CLC							;C - - - - - 0x0129E3 04:89D3: 18
	ADC #$04					;C - - - - - 0x0129E4 04:89D4: 69 04
	STA bubbleDir,X				;C - - - - - 0x0129E6 04:89D6: 9D EB 04
	RTS							;C - - - - - 0x0129E9 04:89D9: 60

HazardCheckPlayer:
	;02: W
	;03: H
	;04: X
	;05: Y

	LDA #16					;C - - - - - 0x0129EA 04:89DA: A9 10
	CLC							;C - - - - - 0x0129EC 04:89DC: 18
	ADC scratch2				;C - - - - - 0x0129ED 04:89DD: 65 02
	STA collW				;C - - - - - 0x0129EF 04:89DF: 85 D0

	LDA #16					;C - - - - - 0x0129F1 04:89E1: A9 10
	CLC							;C - - - - - 0x0129F3 04:89E3: 18
	ADC scratch3				;C - - - - - 0x0129F4 04:89E4: 65 03
	STA collH				;C - - - - - 0x0129F6 04:89E6: 85 D1

	LDA objX				;C - - - - - 0x0129F8 04:89E8: AD B3 05
	CMP scratch4				;C - - - - - 0x0129FB 04:89EB: C5 04
	BCC @xless				;C - - - - - 0x0129FD 04:89ED: 90 05
		SBC scratch4				;C - - - - - 0x0129FF 04:89EF: E5 04
		JMP @checkwidth				;C - - - - - 0x012A01 04:89F1: 4C FA 89
@xless:
	LDA scratch4				;C - - - - - 0x012A04 04:89F4: A5 04
	SEC							;C - - - - - 0x012A06 04:89F6: 38
	SBC objX				;C - - - - - 0x012A07 04:89F7: ED B3 05
@checkwidth:
	CMP collW				;C - - - - - 0x012A0A 04:89FA: C5 D0
	BCS @end				;C - - - - - 0x012A0C 04:89FC: B0 1E
		LDA objY				;C - - - - - 0x012A0E 04:89FE: AD 8B 05
		CMP scratch5				;C - - - - - 0x012A11 04:8A01: C5 05
		BCC @yless				;C - - - - - 0x012A13 04:8A03: 90 05
			SBC scratch5				;C - - - - - 0x012A15 04:8A05: E5 05
			JMP @checkheight				;C - - - - - 0x012A17 04:8A07: 4C 10 8A
	@yless:
		LDA scratch5				;C - - - - - 0x012A1A 04:8A0A: A5 05
		SEC							;C - - - - - 0x012A1C 04:8A0C: 38
		SBC objY				;C - - - - - 0x012A1D 04:8A0D: ED 8B 05
	@checkheight:
		CMP collH				;C - - - - - 0x012A20 04:8A10: C5 D1
		BCS @end				;C - - - - - 0x012A22 04:8A12: B0 08
			LDA #$F0					;C - - - - - 0x012A24 04:8A14: A9 F0
			ORA roundBubbleVariant				;C - - - - - 0x012A26 04:8A16: 05 82
			STA playerHazardTrigger				;C - - - - - 0x012A28 04:8A18: 85 7E
			STX playerHazardSlot				;C - - - - - 0x012A2A 04:8A1A: 86 7F
@end:
	RTS							;C - - - - - 0x012A2C 04:8A1C: 60

HazardCheckEnemies:
	;Used for things like fire, stars
	;02: W
	;03: H
	;04: X
	;05: Y

	TXA							;C - - - - - 0x012A2D 04:8A1D: 8A
	PHA							;C - - - - - 0x012A2E 04:8A1E: 48
	LDX #$00					;C - - - - - 0x012A2F 04:8A1F: A2 00
@checkslot:
	LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x012A31 04:8A21: BD 6C 05
	BEQ @next				;C - - - - - 0x012A34 04:8A24: F0 52
	CMP #$0B					;C - - - - - 0x012A36 04:8A26: C9 0B
	BEQ @next				;C - - - - - 0x012A38 04:8A28: F0 4E
	CMP #$0C					;C - - - - - 0x012A3A 04:8A2A: C9 0C
	BEQ @next				;C - - - - - 0x012A3C 04:8A2C: F0 4A
	CMP #$0D					;C - - - - - 0x012A3E 04:8A2E: C9 0D
	BEQ @next				;C - - - - - 0x012A40 04:8A30: F0 46

	LDY enemyType,X				;C - - - - - 0x012A42 04:8A32: B4 98
	LDA EnemyWidths,Y			;C - - - - - 0x012A44 04:8A34: B9 84 8A
	CLC							;C - - - - - 0x012A47 04:8A37: 18
	ADC scratch2				;C - - - - - 0x012A48 04:8A38: 65 02
	STA collW				;C - - - - - 0x012A4A 04:8A3A: 85 D0

	LDA EnemyHeights,Y			;C - - - - - 0x012A4C 04:8A3C: B9 A9 8A
	CLC							;C - - - - - 0x012A4F 04:8A3F: 18
	ADC scratch3				;C - - - - - 0x012A50 04:8A40: 65 03
	STA collH				;C - - - - - 0x012A52 04:8A42: 85 D1

	LDA objX+OSLOT_ENEMY,X				;C - - - - - 0x012A54 04:8A44: BD BC 05
	CMP scratch4				;C - - - - - 0x012A57 04:8A47: C5 04
	BCC @xless				;C - - - - - 0x012A59 04:8A49: 90 05
		SBC scratch4				;C - - - - - 0x012A5B 04:8A4B: E5 04
		JMP @checkwidth				;C - - - - - 0x012A5D 04:8A4D: 4C 56 8A
@xless:
	LDA scratch4				;C - - - - - 0x012A60 04:8A50: A5 04
	SEC							;C - - - - - 0x012A62 04:8A52: 38
	SBC objX+OSLOT_ENEMY,X				;C - - - - - 0x012A63 04:8A53: FD BC 05
@checkwidth:
	CMP collW				;C - - - - - 0x012A66 04:8A56: C5 D0
	BCS @next				;C - - - - - 0x012A68 04:8A58: B0 1E
		LDA objY+OSLOT_ENEMY,X				;C - - - - - 0x012A6A 04:8A5A: BD 94 05
		CMP scratch5				;C - - - - - 0x012A6D 04:8A5D: C5 05
		BCC @yless				;C - - - - - 0x012A6F 04:8A5F: 90 05
			SBC scratch5				;C - - - - - 0x012A71 04:8A61: E5 05
			JMP @checkheight				;C - - - - - 0x012A73 04:8A63: 4C 6C 8A
	@yless:
		LDA scratch5				;C - - - - - 0x012A76 04:8A66: A5 05
		SEC							;C - - - - - 0x012A78 04:8A68: 38
		SBC objY+OSLOT_ENEMY,X				;C - - - - - 0x012A79 04:8A69: FD 94 05
	@checkheight:
		CMP collH				;C - - - - - 0x012A7C 04:8A6C: C5 D1
		BCS @next				;C - - - - - 0x012A7E 04:8A6E: B0 08
			LDA objState+OSLOT_ENEMY,X				;C - - - - - 0x012A80 04:8A70: BD 6C 05
			ORA #$C0					;C - - - - - 0x012A83 04:8A73: 09 C0
			STA objState+OSLOT_ENEMY,X				;C - - - - - 0x012A85 04:8A75: 9D 6C 05
@next:
	INX							;C - - - - - 0x012A88 04:8A78: E8
	CPX roundEnemies				;C - - - - - 0x012A89 04:8A79: EC A8 04
	BEQ @end				;C - - - - - 0x012A8C 04:8A7C: F0 03
		JMP @checkslot				;C - - - - - 0x012A8E 04:8A7E: 4C 21 8A
@end:
	PLA							;C - - - - - 0x012A91 04:8A81: 68
	TAX							;C - - - - - 0x012A92 04:8A82: AA
	RTS							;C - - - - - 0x012A93 04:8A83: 60

EnemyWidths:
	.byte $00					;- D 0 - - - 0x012A94 04:8A84: 00
	.byte $0A					;- D 0 - - - 0x012A95 04:8A85: 0A
	.byte $09					;- D 0 - - - 0x012A96 04:8A86: 09
	.byte $0A					;- D 0 - - - 0x012A97 04:8A87: 0A
	.byte $0B					;- D 0 - - - 0x012A98 04:8A88: 0B
	.byte $08					;- D 0 - - - 0x012A99 04:8A89: 08
	.byte $0A					;- D 0 - - - 0x012A9A 04:8A8A: 0A
	.byte $0A					;- D 0 - - - 0x012A9B 04:8A8B: 0A
	.byte $0A					;- D 0 - - - 0x012A9C 04:8A8C: 0A
	.byte $16					;- - - - - - 0x012A9D 04:8A8D: 16
	.byte $14					;- D 0 - - - 0x012A9E 04:8A8E: 14
	.byte $12					;- - - - - - 0x012A9F 04:8A8F: 12
	.byte $12					;- D 0 - - - 0x012AA0 04:8A90: 12
	.byte $12					;- D 0 - - - 0x012AA1 04:8A91: 12
	.byte $16					;- D 0 - - - 0x012AA2 04:8A92: 16
	.byte $12					;- D 0 - - - 0x012AA3 04:8A93: 12
	.byte $12					;- D 0 - - - 0x012AA4 04:8A94: 12
	.byte $08					;- D 0 - - - 0x012AA5 04:8A95: 08
	.byte $18					;- - - - - - 0x012AA6 04:8A96: 18
	.byte $1A					;- - - - - - 0x012AA7 04:8A97: 1A
	.byte $1A					;- - - - - - 0x012AA8 04:8A98: 1A
	.byte $14					;- D 0 - - - 0x012AA9 04:8A99: 14
	.byte $1A					;- - - - - - 0x012AAA 04:8A9A: 1A
	.byte $0A					;- D 0 - - - 0x012AAB 04:8A9B: 0A
	.byte $0A					;- D 0 - - - 0x012AAC 04:8A9C: 0A
	.byte $1E					;- D 0 - - - 0x012AAD 04:8A9D: 1E
	.byte $1E					;- D 0 - - - 0x012AAE 04:8A9E: 1E
	.byte $18					;- D 0 - - - 0x012AAF 04:8A9F: 18
	.byte $1E					;- D 0 - - - 0x012AB0 04:8AA0: 1E
	.byte $10					;- D 0 - - - 0x012AB1 04:8AA1: 10
	.byte $10					;- D 0 - - - 0x012AB2 04:8AA2: 10
	.byte $10					;- D 0 - - - 0x012AB3 04:8AA3: 10
	.byte $26					;- D 0 - - - 0x012AB4 04:8AA4: 26
	.byte $0A					;- - - - - - 0x012AB5 04:8AA5: 0A
	.byte $00					;- - - - - - 0x012AB6 04:8AA6: 00
	.byte $00					;- - - - - - 0x012AB7 04:8AA7: 00
	.byte $0A					;- D 0 - - - 0x012AB8 04:8AA8: 0A

EnemyHeights:
	.byte $00					;- D 0 - - - 0x012AB9 04:8AA9: 00
	.byte $0B					;- D 0 - - - 0x012ABA 04:8AAA: 0B
	.byte $0B					;- D 0 - - - 0x012ABB 04:8AAB: 0B
	.byte $0B					;- D 0 - - - 0x012ABC 04:8AAC: 0B
	.byte $0A					;- D 0 - - - 0x012ABD 04:8AAD: 0A
	.byte $0E					;- D 0 - - - 0x012ABE 04:8AAE: 0E
	.byte $0A					;- D 0 - - - 0x012ABF 04:8AAF: 0A
	.byte $09					;- D 0 - - - 0x012AC0 04:8AB0: 09
	.byte $0B					;- D 0 - - - 0x012AC1 04:8AB1: 0B
	.byte $12					;- - - - - - 0x012AC2 04:8AB2: 12
	.byte $16					;- D 0 - - - 0x012AC3 04:8AB3: 16
	.byte $1E					;- - - - - - 0x012AC4 04:8AB4: 1E
	.byte $12					;- D 0 - - - 0x012AC5 04:8AB5: 12
	.byte $1E					;- D 0 - - - 0x012AC6 04:8AB6: 1E
	.byte $16					;- D 0 - - - 0x012AC7 04:8AB7: 16
	.byte $1E					;- D 0 - - - 0x012AC8 04:8AB8: 1E
	.byte $12					;- D 0 - - - 0x012AC9 04:8AB9: 12
	.byte $08					;- D 0 - - - 0x012ACA 04:8ABA: 08
	.byte $10					;- - - - - - 0x012ACB 04:8ABB: 10
	.byte $14					;- - - - - - 0x012ACC 04:8ABC: 14
	.byte $14					;- - - - - - 0x012ACD 04:8ABD: 14
	.byte $18					;- D 0 - - - 0x012ACE 04:8ABE: 18
	.byte $14					;- - - - - - 0x012ACF 04:8ABF: 14
	.byte $0B					;- D 0 - - - 0x012AD0 04:8AC0: 0B
	.byte $10					;- D 0 - - - 0x012AD1 04:8AC1: 10
	.byte $1E					;- D 0 - - - 0x012AD2 04:8AC2: 1E
	.byte $1E					;- D 0 - - - 0x012AD3 04:8AC3: 1E
	.byte $18					;- D 0 - - - 0x012AD4 04:8AC4: 18
	.byte $1E					;- D 0 - - - 0x012AD5 04:8AC5: 1E
	.byte $10					;- D 0 - - - 0x012AD6 04:8AC6: 10
	.byte $10					;- D 0 - - - 0x012AD7 04:8AC7: 10
	.byte $10					;- D 0 - - - 0x012AD8 04:8AC8: 10
	.byte $26					;- D 0 - - - 0x012AD9 04:8AC9: 26
	.byte $0B					;- - - - - - 0x012ADA 04:8ACA: 0B
	.byte $00					;- - - - - - 0x012ADB 04:8ACB: 00
	.byte $00					;- - - - - - 0x012ADC 04:8ACC: 00
	.byte $09					;- D 0 - - - 0x012ADD 04:8ACD: 09

ReplaceBubble:
	;X: Bubble slot
	;00: State
	;01-02: Anim

	LDA scratch0				;C - - - - - 0x012ADE 04:8ACE: A5 00
	STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x012AE0 04:8AD0: 9D 77 05
	LDA scratch1				;C - - - - - 0x012AE3 04:8AD3: A5 01
	STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x012AE5 04:8AD5: 9D 8F 06
	LDA scratch2				;C - - - - - 0x012AE8 04:8AD8: A5 02
	STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x012AEA 04:8ADA: 9D 2F 07

	LDA #$00					;C - - - - - 0x012AED 04:8ADD: A9 00
	STA objAnimProgress+OSLOT_BUBBLE,X				;C - - - - - 0x012AEF 04:8ADF: 9D DF 06
	STA objAnimTimer+OSLOT_BUBBLE,X				;C - - - - - 0x012AF2 04:8AE2: 9D B7 06
	STA bubbleProgress,X				;C - - - - - 0x012AF5 04:8AE5: 9D D5 04
	STA objChrSlot+OSLOT_BUBBLE,X				;C - - - - - 0x012AF8 04:8AE8: 9D 3F 06
	STA objAttr+OSLOT_BUBBLE,X				;C - - - - - 0x012AFB 04:8AEB: 9D 07 07
	RTS							;C - - - - - 0x012AFE 04:8AEE: 60

HandleShooting:
	LDA shootTrigger				;C - - - - - 0x012AFF 04:8AEF: AD 15 05
	BNE @shoot				;C - - - - - 0x012B02 04:8AF2: D0 03
		JMP @end				;C - - - - - 0x012B04 04:8AF4: 4C 9B 8B
@shoot:
.ifdef REGION_JP
	LDA #$00					;- - - - - - 0x012AE0 04:8AD0: A9
	STA scratch1					;- - - - - - 0x012AE2 04:8AD2: 85
	STA scratch2					;- - - - - - 0x012AE4 04:8AD4: 85
	LDX #$00					;- - - - - - 0x012AE6 04:8AD6: A2
.else
	LDX #$00					;C - - - - - 0x012B07 04:8AF7: A2 00
	STX scratch1				;C - - - - - 0x012B09 04:8AF9: 86 01
	STX scratch2				;C - - - - - 0x012B0B 04:8AFB: 86 02
.endif
	;01: Slot first alternative (expiring bubble)
	;02: Slot second alternative (vacant or rising)
@findslot:
	LDA objState+OSLOT_BUBBLE,X				;C - - - - - 0x012B0D 04:8AFD: BD 77 05
	BEQ @foundslot				;C - - - - - 0x012B10 04:8B00: F0 2E

	CMP #BUBBLE_EXPIRING					;C - - - - - 0x012B12 04:8B02: C9 02
	BNE @expiringchecked				;C - - - - - 0x012B14 04:8B04: D0 02
		STX scratch1				;C - - - - - 0x012B16 04:8B06: 86 01
@expiringchecked:
	CMP #BUBBLE_EXPIRING					;C - - - - - 0x012B18 04:8B08: C9 02
	BCS @nonexpiringchecked				;C - - - - - 0x012B1A 04:8B0A: B0 09
		;Free or rising
		LDA bubbleProgress,X				;C - - - - - 0x012B1C 04:8B0C: BD D5 04
		CMP #16					;C - - - - - 0x012B1F 04:8B0F: C9 10
		BCC @nonexpiringchecked				;C - - - - - 0x012B21 04:8B11: 90 02
			STX scratch2				;C - - - - - 0x012B23 04:8B13: 86 02
@nonexpiringchecked:
	INX							;C - - - - - 0x012B25 04:8B15: E8
	CPX #20					;C - - - - - 0x012B26 04:8B16: E0 14
	BNE @findslot				;C - - - - - 0x012B28 04:8B18: D0 E3

	LDX scratch1				;C - - - - - 0x012B2A 04:8B1A: A6 01
.ifdef REGION_JP
	LDA scratch1				;- - - - - - 0x012B07 04:8AF7: A5
.endif
	BNE @foundslot				;C - - - - - 0x012B2C 04:8B1C: D0 12

	LDX scratch2				;C - - - - - 0x012B2E 04:8B1E: A6 02
.ifdef REGION_JP
	LDA scratch2					;- - - - - - 0x012B0D 04:8AFD: A5
.endif
	BNE @foundslot				;C - - - - - 0x012B30 04:8B20: D0 0E
		;No valid slot found, cancel
		LDA #$00					;C - - - - - 0x012B32 04:8B22: A9 00
		STA shootQueuedBubbles				;C - - - - - 0x012B34 04:8B24: 8D 16 05
		STA shootTrigger				;C - - - - - 0x012B37 04:8B27: 8D 15 05
		STA shooting				;C - - - - - 0x012B3A 04:8B2A: 8D 17 05
		JMP @end				;C - - - - - 0x012B3D 04:8B2D: 4C 9B 8B
@foundslot:
	STX shootInitialSlot				;C - - - - - 0x012B40 04:8B30: 8E 18 05
	LDA #$01					;C - - - - - 0x012B43 04:8B33: A9 01
	STA shooting				;C - - - - - 0x012B45 04:8B35: 8D 17 05
	LDA #$00					;C - - - - - 0x012B48 04:8B38: A9 00
	STA bubbleProgress,X				;C - - - - - 0x012B4A 04:8B3A: 9D D5 04
	STX shootSlot				;C - - - - - 0x012B4D 04:8B3D: 8E 13 05

	LDA shootQueuedBubbles				;C - - - - - 0x012B50 04:8B40: AD 16 05
	BEQ @queuechecked				;C - - - - - 0x012B53 04:8B43: F0 09
		CMP #1					;C - - - - - 0x012B55 04:8B45: C9 01
		BEQ @queuechecked				;C - - - - - 0x012B57 04:8B47: F0 05
			LDA #2					;C - - - - - 0x012B59 04:8B49: A9 02
			STA shootQueuedBubbles				;C - - - - - 0x012B5B 04:8B4B: 8D 16 05
@queuechecked:
	LDA #snShootBubble_ID					;C - - - - - 0x012B5E 04:8B4E: A9 06
	STA a:soundTrigger				;C - - - - - 0x012B60 04:8B50: 8D E1 00

	LDA shootSlot				;C - - - - - 0x012B63 04:8B53: AD 13 05
	CLC							;C - - - - - 0x012B66 04:8B56: 18
	ADC #$14					;C - - - - - 0x012B67 04:8B57: 69 14
	STA bubbleSpawnSlot				;C - - - - - 0x012B69 04:8B59: 8D 43 07

	LDA #BUBBLE_EMERGING					;C - - - - - 0x012B6C 04:8B5C: A9 80
	STA bubbleSpawnState				;C - - - - - 0x012B6E 04:8B5E: 8D 44 07

	LDA objY				;C - - - - - 0x012B71 04:8B61: AD 8B 05
	STA bubbleSpawnY				;C - - - - - 0x012B74 04:8B64: 8D 45 07

	LDY shootDir				;C - - - - - 0x012B77 04:8B67: AC 14 05
	LDA objX				;C - - - - - 0x012B7A 04:8B6A: AD B3 05
	CLC							;C - - - - - 0x012B7D 04:8B6D: 18
	ADC BubbleEmergingXOfs,Y			;C - - - - - 0x012B7E 04:8B6E: 79 30 8C
	STA bubbleSpawnX				;C - - - - - 0x012B81 04:8B71: 8D 46 07

	LDA #$00					;C - - - - - 0x012B84 04:8B74: A9 00
	STA bubbleSpawnChrSlot				;C - - - - - 0x012B86 04:8B76: 8D 49 07
	LDY shootQueuedBubbles				;C - - - - - 0x012B89 04:8B79: AC 16 05

	LDA BubbleEmergingAnims,Y			;C - - - - - 0x012B8C 04:8B7C: B9 36 8C
	STA bubbleSpawnAnim				;C - - - - - 0x012B8F 04:8B7F: 8D 4A 07

	LDA #.HIBYTE(anBubbleEmerge_ID)					;C - - - - - 0x012B92 04:8B82: A9 00
	STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x012B94 04:8B84: 9D 2F 07

	TYA							;C - - - - - 0x012B97 04:8B87: 98
	PHA							;C - - - - - 0x012B98 04:8B88: 48
	LDY shootSlot				;C - - - - - 0x012B99 04:8B89: AC 13 05
	LDA #$00					;C - - - - - 0x012B9C 04:8B8C: A9 00
	STA objAttr+OSLOT_BUBBLE,Y				;C - - - - - 0x012B9E 04:8B8E: 99 07 07

	PLA							;C - - - - - 0x012BA1 04:8B91: 68
	TAY							;C - - - - - 0x012BA2 04:8B92: A8
	JSR SpawnBubbleVariant				;C - - - - - 0x012BA3 04:8B93: 20 BA 8C

	LDA #$00					;C - - - - - 0x012BA6 04:8B96: A9 00
	STA shootTrigger				;C - - - - - 0x012BA8 04:8B98: 8D 15 05
@end:
	RTS							;C - - - - - 0x012BAB 04:8B9B: 60

BubbleEmergingUpdate:
	;X: Bubble slot
	JSR BubbleEmergingCheckTerrain				;C - - - - - 0x012BAC 04:8B9C: 20 68 F4
	LDY shootDir				;C - - - - - 0x012BAF 04:8B9F: AC 14 05
	INC bubbleProgress,X				;C - - - - - 0x012BB2 04:8BA2: FE D5 04

	LDA powerUps				;C - - - - - 0x012BB5 04:8BA5: A5 DE
	AND #POWERUP_CANDY					;C - - - - - 0x012BB7 04:8BA7: 29 01
	BNE @far				;C - - - - - 0x012BB9 04:8BA9: D0 09
		LDA bubbleProgress,X				;C - - - - - 0x012BBB 04:8BAB: BD D5 04
		CMP #8					;C - - - - - 0x012BBE 04:8BAE: C9 08
		BEQ @ready				;C - - - - - 0x012BC0 04:8BB0: F0 1B
		BNE @checkterrain				;C - - - - - 0x012BC2 04:8BB2: D0 07
@far:
	LDA bubbleProgress,X				;C - - - - - 0x012BC4 04:8BB4: BD D5 04
	CMP #16					;C - - - - - 0x012BC7 04:8BB7: C9 10
	BEQ @ready				;C - - - - - 0x012BC9 04:8BB9: F0 12
@checkterrain:
	LDA terrainResult				;C - - - - - 0x012BCB 04:8BBB: AD E9 04
	BNE @ready				;C - - - - - 0x012BCE 04:8BBE: D0 0D
		LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012BD0 04:8BC0: BD C7 05
		CLC							;C - - - - - 0x012BD3 04:8BC3: 18
		ADC BubbleEmergingHSpeeds,Y			;C - - - - - 0x012BD4 04:8BC4: 79 33 8C
		STA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012BD7 04:8BC7: 9D C7 05
		JMP CODE_098C2F				;C - - - - - 0x012BDA 04:8BCA: 4C 2F 8C
@ready:
	;Hit wall or flew long enough
	LDA bubbleVariant				;C - - - - - 0x012BDD 04:8BCD: AD 19 05
	BEQ @regular				;C - - - - - 0x012BE0 04:8BD0: F0 39
		LDA #BUBBLE_POWER					;C - - - - - 0x012BE2 04:8BD2: A9 05
		STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x012BE4 04:8BD4: 9D 77 05

		LDY bubbleVariant				;C - - - - - 0x012BE7 04:8BD7: AC 19 05
		LDA BubbleReadyAnims,Y			;C - - - - - 0x012BEA 04:8BDA: B9 00 8D
		STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x012BED 04:8BDD: 9D 8F 06
		LDA BubbleReadyAnimsHI,Y			;C - - - - - 0x012BF0 04:8BE0: B9 07 8D
		STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x012BF3 04:8BE3: 9D 2F 07
		JSR SpawnExtraBubbles				;C - - - - - 0x012BF6 04:8BE6: 20 39 8C

		LDA #$01					;C - - - - - 0x012BF9 04:8BE9: A9 01
		STA objChrSlot+OSLOT_BUBBLE,X				;C - - - - - 0x012BFB 04:8BEB: 9D 3F 06

		LDA #$00					;C - - - - - 0x012BFE 04:8BEE: A9 00
		STA bubbleProgress,X				;C - - - - - 0x012C00 04:8BF0: 9D D5 04
		STA shootSlot				;C - - - - - 0x012C03 04:8BF3: 8D 13 05
		STA shooting				;C - - - - - 0x012C06 04:8BF6: 8D 17 05
		STA shootQueuedBubbles				;C - - - - - 0x012C09 04:8BF9: 8D 16 05
		STA objAnimProgress+OSLOT_BUBBLE,X				;C - - - - - 0x012C0C 04:8BFC: 9D DF 06
		STA objAnimTimer+OSLOT_BUBBLE,X				;C - - - - - 0x012C0F 04:8BFF: 9D B7 06

		LDA BubbleReadyAttr,Y			;C - - - - - 0x012C12 04:8C02: B9 F8 8C
		STA objAttr+OSLOT_BUBBLE,X				;C - - - - - 0x012C15 04:8C05: 9D 07 07
		JMP CODE_098C2F				;C - - - - - 0x012C18 04:8C08: 4C 2F 8C
@regular:
	LDA #$01					;C - - - - - 0x012C1B 04:8C0B: A9 01
	STA objState+OSLOT_BUBBLE,X				;C - - - - - 0x012C1D 04:8C0D: 9D 77 05
	LDA #anBubble_ID					;C - - - - - 0x012C20 04:8C10: A9 27
	STA objAnim+OSLOT_BUBBLE,X				;C - - - - - 0x012C22 04:8C12: 9D 8F 06
	JSR SpawnExtraBubbles				;C - - - - - 0x012C25 04:8C15: 20 39 8C

	LDA #$00					;C - - - - - 0x012C28 04:8C18: A9 00
	STA bubbleProgress,X				;C - - - - - 0x012C2A 04:8C1A: 9D D5 04
	STA shootSlot				;C - - - - - 0x012C2D 04:8C1D: 8D 13 05
	STA shooting				;C - - - - - 0x012C30 04:8C20: 8D 17 05
	STA shootQueuedBubbles				;C - - - - - 0x012C33 04:8C23: 8D 16 05
	STA objAnimProgress+OSLOT_BUBBLE,X				;C - - - - - 0x012C36 04:8C26: 9D DF 06
	STA objAnimTimer+OSLOT_BUBBLE,X				;C - - - - - 0x012C39 04:8C29: 9D B7 06
	STA objAnimHI+OSLOT_BUBBLE,X				;C - - - - - 0x012C3C 04:8C2C: 9D 2F 07
CODE_JP_098C0E:
.ifdef REGION_JP
	JMP CODE_098C2F					;- - - - - - 0x012C1E 04:8C0E: 4C
	CMP #$FF					;- - - - - - 0x012C21 04:8C11: C9
	BNE	CODE_JP_098C25				;- - - - - - 0x012C23 04:8C13: D0
		LDA #$19					;- - - - - - 0x012C25 04:8C15: A9
		STA objState+OSLOT_BUBBLE,X					;- - - - - - 0x012C27 04:8C17: 9D
		LDA #$00					;- - - - - - 0x012C2A 04:8C1A: A9
		STA shooting					;- - - - - - 0x012C2C 04:8C1C: 8D
		STA shootQueuedBubbles					;- - - - - - 0x012C2F 04:8C1F: 8D
		JMP CODE_098C2F					;- - - - - - 0x012C32 04:8C22: 4C
CODE_JP_098C25:
	AND #$0F					;- - - - - - 0x012C35 04:8C25: 29
	STA scratch0					;- - - - - - 0x012C37 04:8C27: 85
	LDA shootDir					;- - - - - - 0x012C39 04:8C29: AD
	CMP #$01					;- - - - - - 0x012C3C 04:8C2C: C9
	BEQ CODE_JP_098C34				;- - - - - - 0x012C3E 04:8C2E: F0
		CMP #$02					;- - - - - - 0x012C40 04:8C30: C9
		BEQ CODE_JP_098C3D			;- - - - - - 0x012C42 04:8C32: F0
CODE_JP_098C34:
	LDA objX+OSLOT_BUBBLE,X					;- - - - - - 0x012C44 04:8C34: BD
	CLC							;- - - - - - 0x012C47 04:8C37: 18
	ADC scratch0				;- - - - - - 0x012C48 04:8C38: 65
	JMP CODE_JP_098C43				;- - - - - - 0x012C4A 04:8C3A: 4C
CODE_JP_098C3D:
	LDA objX+OSLOT_BUBBLE,X					;- - - - - - 0x012C4D 04:8C3D: BD
	SEC							;- - - - - - 0x012C50 04:8C40: 38
	SBC scratch0				;- - - - - - 0x012C51 04:8C41: E5
CODE_JP_098C43:
	STA objX+OSLOT_BUBBLE,X					;- - - - - - 0x012C53 04:8C43: 9D
.endif
CODE_098C2F:
	RTS							;C - - - - - 0x012C3F 04:8C2F: 60

BubbleEmergingXOfs:
	.byte 0					;- - - - - - 0x012C40 04:8C30: 00
	.byte 0					;- D 0 - - - 0x012C41 04:8C31: 00
	.byte 0					;- D 0 - - - 0x012C42 04:8C32: 00

BubbleEmergingHSpeeds:
	.byte 0					;- - - - - - 0x012C43 04:8C33: 00
	.byte -7					;- D 0 - - - 0x012C44 04:8C34: F9
	.byte 7					;- D 0 - - - 0x012C45 04:8C35: 07

BubbleEmergingAnims:
	.byte anBubbleEmerge_ID					;- D 0 - - - 0x012C46 04:8C36: 2F
	.byte anDoubleBubble_ID					;- D 0 - - - 0x012C47 04:8C37: 31
	.byte anTripleBubble_ID					;- D 0 - - - 0x012C48 04:8C38: 32

SpawnExtraBubbles:
@checkremaining:
	LDA shootQueuedBubbles				;C - - - - - 0x012C49 04:8C39: AD 16 05
	BEQ @end				;C - - - - - 0x012C4C 04:8C3C: F0 7B
@findslot:
	INC shootSlot				;C - - - - - 0x012C4E 04:8C3E: EE 13 05
	LDA shootSlot				;C - - - - - 0x012C51 04:8C41: AD 13 05
	CMP #20					;C - - - - - 0x012C54 04:8C44: C9 14
	BEQ @end				;C - - - - - 0x012C56 04:8C46: F0 71

	LDY shootSlot				;C - - - - - 0x012C58 04:8C48: AC 13 05
	LDA objState+OSLOT_BUBBLE,Y				;C - - - - - 0x012C5B 04:8C4B: B9 77 05
	BNE @findslot				;C - - - - - 0x012C5E 04:8C4E: D0 EE

	LDA shootSlot				;C - - - - - 0x012C60 04:8C50: AD 13 05
	CLC							;C - - - - - 0x012C63 04:8C53: 18
	ADC #OSLOT_BUBBLE					;C - - - - - 0x012C64 04:8C54: 69 14
	STA bubbleSpawnSlot				;C - - - - - 0x012C66 04:8C56: 8D 43 07

	LDA bubbleVariant				;C - - - - - 0x012C69 04:8C59: AD 19 05
	BEQ @regular				;C - - - - - 0x012C6C 04:8C5C: F0 2C
		LDA #BUBBLE_POWER					;C - - - - - 0x012C6E 04:8C5E: A9 05
		STA bubbleSpawnState				;C - - - - - 0x012C70 04:8C60: 8D 44 07
		LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012C73 04:8C63: BD 9F 05
		STA bubbleSpawnY				;C - - - - - 0x012C76 04:8C66: 8D 45 07
		LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012C79 04:8C69: BD C7 05
		STA bubbleSpawnX				;C - - - - - 0x012C7C 04:8C6C: 8D 46 07
		LDA #$01					;C - - - - - 0x012C7F 04:8C6F: A9 01
		STA bubbleSpawnChrSlot				;C - - - - - 0x012C81 04:8C71: 8D 49 07

		TXA							;C - - - - - 0x012C84 04:8C74: 8A
		PHA							;C - - - - - 0x012C85 04:8C75: 48
		LDX bubbleVariant				;C - - - - - 0x012C86 04:8C76: AE 19 05
		LDA BubbleReadyAnims,X			;C - - - - - 0x012C89 04:8C79: BD 00 8D
		STA bubbleSpawnAnim				;C - - - - - 0x012C8C 04:8C7C: 8D 4A 07
		LDA BubbleReadyAnimsHI,X			;C - - - - - 0x012C8F 04:8C7F: BD 07 8D
		STA objAnimHI+OSLOT_BUBBLE,Y				;C - - - - - 0x012C92 04:8C82: 99 2F 07
		PLA							;C - - - - - 0x012C95 04:8C85: 68
		TAX							;C - - - - - 0x012C96 04:8C86: AA
		JMP @anim				;C - - - - - 0x012C97 04:8C87: 4C A5 8C
@regular:
	LDA #BUBBLE_RISING					;C - - - - - 0x012C9A 04:8C8A: A9 01
	STA bubbleSpawnState				;C - - - - - 0x012C9C 04:8C8C: 8D 44 07
	LDA objY+OSLOT_BUBBLE,X				;C - - - - - 0x012C9F 04:8C8F: BD 9F 05
	STA bubbleSpawnY				;C - - - - - 0x012CA2 04:8C92: 8D 45 07
	LDA objX+OSLOT_BUBBLE,X				;C - - - - - 0x012CA5 04:8C95: BD C7 05
	STA bubbleSpawnX				;C - - - - - 0x012CA8 04:8C98: 8D 46 07
	LDA #$00					;C - - - - - 0x012CAB 04:8C9B: A9 00
	STA bubbleSpawnChrSlot				;C - - - - - 0x012CAD 04:8C9D: 8D 49 07
	LDA #anBubble_ID					;C - - - - - 0x012CB0 04:8CA0: A9 27
	STA bubbleSpawnAnim				;C - - - - - 0x012CB2 04:8CA2: 8D 4A 07
@anim:
	LDA #$00					;C - - - - - 0x012CB5 04:8CA5: A9 00
	STA objAttr+OSLOT_BUBBLE,Y				;C - - - - - 0x012CB7 04:8CA7: 99 07 07
	STA objAnimProgress+OSLOT_BUBBLE,Y				;C - - - - - 0x012CBA 04:8CAA: 99 DF 06
	STA objAnimTimer+OSLOT_BUBBLE,Y				;C - - - - - 0x012CBD 04:8CAD: 99 B7 06
	JSR SpawnBubbleVariant				;C - - - - - 0x012CC0 04:8CB0: 20 BA 8C
	DEC shootQueuedBubbles				;C - - - - - 0x012CC3 04:8CB3: CE 16 05
	JMP @checkremaining				;C - - - - - 0x012CC6 04:8CB6: 4C 39 8C
@end:
	RTS							;C - - - - - 0x012CC9 04:8CB9: 60

SpawnBubbleVariant:
	;Spawn bubble, taking variant into account
	;X: Obj slot
	TXA							;C - - - - - 0x012CCA 04:8CBA: 8A
	PHA							;C - - - - - 0x012CCB 04:8CBB: 48
	LDX bubbleSpawnSlot				;C - - - - - 0x012CCC 04:8CBC: AE 43 07
	LDA bubbleSpawnState				;C - - - - - 0x012CCF 04:8CBF: AD 44 07
	STA objState,X				;C - - - - - 0x012CD2 04:8CC2: 9D 63 05
	LDA bubbleSpawnY				;C - - - - - 0x012CD5 04:8CC5: AD 45 07
	STA objY,X				;C - - - - - 0x012CD8 04:8CC8: 9D 8B 05
	LDA bubbleSpawnX				;C - - - - - 0x012CDB 04:8CCB: AD 46 07
	STA objX,X				;C - - - - - 0x012CDE 04:8CCE: 9D B3 05
	LDA bubbleSpawnChrSlot				;C - - - - - 0x012CE1 04:8CD1: AD 49 07
	STA objChrSlot,X				;C - - - - - 0x012CE4 04:8CD4: 9D 2B 06
	LDA bubbleSpawnAnim				;C - - - - - 0x012CE7 04:8CD7: AD 4A 07
	STA objAnim,X				;C - - - - - 0x012CEA 04:8CDA: 9D 7B 06
	LDA #$00					;C - - - - - 0x012CED 04:8CDD: A9 00
	STA objAnimTimer,X				;C - - - - - 0x012CEF 04:8CDF: 9D A3 06
	STA objAnimProgress,X				;C - - - - - 0x012CF2 04:8CE2: 9D CB 06

	LDA bubbleVariant				;C - - - - - 0x012CF5 04:8CE5: AD 19 05
	BEQ @variantchecked				;C - - - - - 0x012CF8 04:8CE8: F0 0B
		LDA roundBubbleVariant				;C - - - - - 0x012CFA 04:8CEA: A5 82
		AND #$07					;C - - - - - 0x012CFC 04:8CEC: 29 07
		TAY							;C - - - - - 0x012CFE 04:8CEE: A8
		LDA BubbleReadyAttr,Y			;C - - - - - 0x012CFF 04:8CEF: B9 F8 8C
		STA objAttr,X				;C - - - - - 0x012D02 04:8CF2: 9D F3 06
@variantchecked:
	PLA							;C - - - - - 0x012D05 04:8CF5: 68
	TAX							;C - - - - - 0x012D06 04:8CF6: AA
	RTS							;C - - - - - 0x012D07 04:8CF7: 60

BubbleReadyAttr:
	.byte $00					;- - - - - - 0x012D08 04:8CF8: 00
	.byte $00					;- D 0 - - - 0x012D09 04:8CF9: 00
	.byte $03					;- - - - - - 0x012D0A 04:8CFA: 03
	.byte $00					;- - - - - - 0x012D0B 04:8CFB: 00
	.byte $03					;- D 0 - - - 0x012D0C 04:8CFC: 03
	.byte $00					;- D 0 - - - 0x012D0D 04:8CFD: 00
	.byte $03					;- D 0 - - - 0x012D0E 04:8CFE: 03
	.byte $03					;- - - - - - 0x012D0F 04:8CFF: 03
BubbleReadyAnims:
	.byte $00								;- - - - - - 0x012D10 04:8D00: 00
	.byte .LOBYTE(anThunderBubble_ID)		;- D 0 - - - 0x012D11 04:8D01: 01
	.byte .LOBYTE(anFireBubble_ID)			;- - - - - - 0x012D12 04:8D02: 02
	.byte .LOBYTE(anFloodBubble_ID)			;- - - - - - 0x012D13 04:8D03: 03
	.byte .LOBYTE(anSnowBubble_ID)			;- D 0 - - - 0x012D14 04:8D04: 04
	.byte .LOBYTE(anWindBubble_ID)			;- D 0 - - - 0x012D15 04:8D05: 05
	.byte .LOBYTE(anStarBubble_ID)			;- D 0 - - - 0x012D16 04:8D06: 06
BubbleReadyAnimsHI:
	.byte $00								;- - - - - - 0x012D17 04:8D07: 00
	.byte .HIBYTE(anThunderBubble_ID)		;- D 0 - - - 0x012D18 04:8D08: 01
	.byte .HIBYTE(anFireBubble_ID)			;- - - - - - 0x012D19 04:8D09: 01
	.byte .HIBYTE(anFloodBubble_ID)			;- - - - - - 0x012D1A 04:8D0A: 01
	.byte .HIBYTE(anSnowBubble_ID)			;- D 0 - - - 0x012D1B 04:8D0B: 01
	.byte .HIBYTE(anWindBubble_ID)			;- D 0 - - - 0x012D1C 04:8D0C: 01
	.byte .HIBYTE(anStarBubble_ID)			;- D 0 - - - 0x012D1D 04:8D0D: 01

CODE_098D0E:
	;Unreached
	LDA objY+OSLOT_BUBBLE,X					;- - - - - - 0x012D1E 04:8D0E: BD
	STA scratch0					;- - - - - - 0x012D21 04:8D11: 85
	LDA objX+OSLOT_BUBBLE,X					;- - - - - - 0x012D23 04:8D13: BD
	STA scratch1					;- - - - - - 0x012D26 04:8D16: 85
	JSR CODE_0FF5E6					;- - - - - - 0x012D28 04:8D18: 20

	LDA scratch4					;- - - - - - 0x012D2B 04:8D1B: A5
	STA ram_04EA					;- - - - - - 0x012D2D 04:8D1D: 8D
	RTS								;- - - - - - 0x012D30 04:8D20: 60

DATA_098D21:
	;Unreached
	.byte $F8					;- - - - - - 0x012D31 04:8D21: F8
	.byte $08					;- - - - - - 0x012D32 04:8D22: 08
	.byte $00					;- - - - - - 0x012D33 04:8D23: 00
	.byte $00					;- - - - - - 0x012D34 04:8D24: 00
	.byte $00					;- - - - - - 0x012D35 04:8D25: 00
	.byte $00					;- - - - - - 0x012D36 04:8D26: 00
	.byte $F8					;- - - - - - 0x012D37 04:8D27: F8
	.byte $08					;- - - - - - 0x012D38 04:8D28: 08

LoadEnemyPalettes:
	LDA currentRound				;C - - - - - 0x012D39 04:8D29: A5 D8
	ASL							;C - - - - - 0x012D3B 04:8D2B: 0A
	STA scratch4				;C - - - - - 0x012D3C 04:8D2C: 85 04
	LDA #$00					;C - - - - - 0x012D3E 04:8D2E: A9 00
	STA scratch5				;C - - - - - 0x012D40 04:8D30: 85 05
CODE_098D32:
	LDA #.BANK(RoundsEnemyPalettes)					;C - - - - - 0x012D42 04:8D32: A9 04
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x012D44 04:8D34: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x012D46 04:8D36: 20 56 FF
.endif

	LDY scratch4				;C - - - - - 0x012D49 04:8D39: A4 04
	LDA RoundsEnemyPalettes,Y			;C - - - - - 0x012D4B 04:8D3B: B9 97 B9
	LSR							;C - - - - - 0x012D4E 04:8D3E: 4A
	TAX							;C - - - - - 0x012D4F 04:8D3F: AA

	;Write transparent color
	LDY scratch5				;C - - - - - 0x012D50 04:8D40: A4 05
	LDA #$0F					;C - - - - - 0x012D52 04:8D42: A9 0F
	STA colorBuffer+$14,Y		;C - - - - - 0x012D54 04:8D44: 99 14 03
	INY							;C - - - - - 0x012D57 04:8D47: C8

	;Write outline color
	LDA #$0F					;C - - - - - 0x012D58 04:8D48: A9 0F
	STA colorBuffer+$14,Y		;C - - - - - 0x012D5A 04:8D4A: 99 14 03
	INY							;C - - - - - 0x012D5D 04:8D4D: C8
CODE_098D4E:
	LDA #.BANK(EnemyPalettes)					;C - - - - - 0x012D5E 04:8D4E: A9 0C
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x012D60 04:8D50: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x012D62 04:8D52: 20 56 FF
.endif

	LDA EnemyPalettes,X			;C - - - - - 0x012D65 04:8D55: BD 0C B3
	STA colorBuffer+$14,Y		;C - - - - - 0x012D68 04:8D58: 99 14 03
	INX							;C - - - - - 0x012D6B 04:8D5B: E8
	INY							;C - - - - - 0x012D6C 04:8D5C: C8
	CPY #$08					;C - - - - - 0x012D6D 04:8D5D: C0 08
	BEQ CODE_098D6C				;C - - - - - 0x012D6F 04:8D5F: F0 0B

	CPY #$04					;C - - - - - 0x012D71 04:8D61: C0 04
	BNE CODE_098D4E				;C - - - - - 0x012D73 04:8D63: D0 E9

	STY scratch5				;C - - - - - 0x012D75 04:8D65: 84 05
	INC scratch4				;C - - - - - 0x012D77 04:8D67: E6 04
	JMP CODE_098D32				;C - - - - - 0x012D79 04:8D69: 4C 32 8D
CODE_098D6C:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif

	LDA #.BANK(CODE_0B8000)					;C - - - - - 0x012D7C 04:8D6C: A9 0B
	STA nmiPrgBankA				;C - - - - - 0x012D7E 04:8D6E: 85 51
	LDA #.LOBYTE(CODE_0B8000)	;C - - - - - 0x012D80 04:8D70: A9 00
	STA nmiBankedSub			;C - - - - - 0x012D82 04:8D72: 85 16
	LDA #.HIBYTE(CODE_0B8000)	;C - - - - - 0x012D84 04:8D74: A9 80
	STA nmiBankedSub+1			;C - - - - - 0x012D86 04:8D76: 85 17

	LDA #.LOBYTE(ColorBufferToVRAM)	;C - - - - - 0x012D88 04:8D78: A9 8A
	STA nmiUnbankedSub				;C - - - - - 0x012D8A 04:8D7A: 85 35
	LDA #.HIBYTE(ColorBufferToVRAM)	;C - - - - - 0x012D8C 04:8D7C: A9 E3
	STA nmiUnbankedSub+1				;C - - - - - 0x012D8E 04:8D7E: 85 36
	RTS							;C - - - - - 0x012D90 04:8D80: 60

UpdateProjectiles:
	LDA #.BANK(ProjScriptTable)					;C - - - - - 0x012D91 04:8D81: A9 0A
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x012D93 04:8D83: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x012D95 04:8D85: 20 56 FF
.endif

	LDX #$00					;C - - - - - 0x012D98 04:8D88: A2 00
UpdateProjectiles_CheckProj:
	LDA objState+OSLOT_PROJ,X				;C - - - - - 0x012D9A 04:8D8A: BD 64 05
	BNE @active				;C - - - - - 0x012D9D 04:8D8D: D0 03
		JMP UpdateProjectiles_NextProj				;C - - - - - 0x012D9F 04:8D8F: 4C 1B 8E
@active:
	ASL							;C - - - - - 0x012DA2 04:8D92: 0A
	TAY							;C - - - - - 0x012DA3 04:8D93: A8
	LDA ProjScriptTable,Y			;C - - - - - 0x012DA4 04:8D94: B9 88 BA
	STA scratch6				;C - - - - - 0x012DA7 04:8D97: 85 06
	LDA ProjScriptTable+1,Y			;C - - - - - 0x012DA9 04:8D99: B9 89 BA
	STA scratch7				;C - - - - - 0x012DAC 04:8D9C: 85 07

	LDA #.BANK(EnemyProjSizeIndexes)					;C - - - - - 0x012DAE 04:8D9E: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x012DB0 04:8DA0: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x012DB2 04:8DA2: 20 56 FF
.endif

	LDA #$00					;C - - - - - 0x012DB5 04:8DA5: A9 00
	STA projTouchingPlayer				;C - - - - - 0x012DB7 04:8DA7: 85 CE

	LDA objState+OSLOT_PROJ,X				;C - - - - - 0x012DB9 04:8DA9: BD 64 05
	TAY							;C - - - - - 0x012DBC 04:8DAC: A8
	LDA EnemyProjSizeIndexes,Y			;C - - - - - 0x012DBD 04:8DAD: B9 BA BE
	ASL							;C - - - - - 0x012DC0 04:8DB0: 0A
	TAY							;C - - - - - 0x012DC1 04:8DB1: A8
	LDA EnemyProjSizeTable,Y			;C - - - - - 0x012DC2 04:8DB2: B9 EA BE
	STA collW				;C - - - - - 0x012DC5 04:8DB5: 85 D0
	LDA EnemyProjSizeTable+1,Y			;C - - - - - 0x012DC7 04:8DB7: B9 EB BE
	STA collH				;C - - - - - 0x012DCA 04:8DBA: 85 D1
	JSR PlayerCheckProjCollision				;C - - - - - 0x012DCC 04:8DBC: 20 EF FB

	LDA objState+OSLOT_PROJ,X				;C - - - - - 0x012DCF 04:8DBF: BD 64 05
	AND #PROJ_HIT					;C - - - - - 0x012DD2 04:8DC2: 29 80
	BEQ @hitchecked				;C - - - - - 0x012DD4 04:8DC4: F0 0C
		;Clear PROJ_HIT bit
		ASL objState+OSLOT_PROJ,X				;C - - - - - 0x012DD6 04:8DC6: 1E 64 05
		LSR objState+OSLOT_PROJ,X				;C - - - - - 0x012DD9 04:8DC9: 5E 64 05

		LDA #$01					;C - - - - - 0x012DDC 04:8DCC: A9 01
		STA projTouchingPlayer				;C - - - - - 0x012DDE 04:8DCE: 85 CE
		STA ram_0071				;C - - - - - 0x012DE0 04:8DD0: 85 71
@hitchecked:
	LDA #$00					;C - - - - - 0x012DE2 04:8DD2: A9 00
	STA projScriptOfs				;C - - - - - 0x012DE4 04:8DD4: 85 5D
UpdateProjectiles_ReadOp:
	LDA #.BANK(ProjScriptTable)					;C - - - - - 0x012DE6 04:8DD6: A9 0A
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x012DE8 04:8DD8: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x012DEA 04:8DDA: 20 56 FF
.endif

	LDY projScriptOfs				;C - - - - - 0x012DED 04:8DDD: A4 5D
	LDA (scratch6),Y			;C - - - - - 0x012DEF 04:8DDF: B1 06
	ASL							;C - - - - - 0x012DF1 04:8DE1: 0A
	TAY							;C - - - - - 0x012DF2 04:8DE2: A8
	LDA ProjOpHandlers,Y			;C - - - - - 0x012DF3 04:8DE3: B9 98 96
	STA scratch8				;C - - - - - 0x012DF6 04:8DE6: 85 08
	LDA ProjOpHandlers+1,Y			;C - - - - - 0x012DF8 04:8DE8: B9 99 96
	STA scratch9				;C - - - - - 0x012DFB 04:8DEB: 85 09
	LDY projScriptOfs				;C - - - - - 0x012DFD 04:8DED: A4 5D
	INY							;C - - - - - 0x012DFF 04:8DEF: C8
	LDA (scratch6),Y			;C - - - - - 0x012E00 04:8DF0: B1 06
	INY							;C - - - - - 0x012E02 04:8DF2: C8
	JMP (scratch8)				;C - - - - - 0x012E03 04:8DF3: 6C 08 00
UpdateProjectiles_OpRet:
	CMP #$FF					;C - - - - - 0x012E06 04:8DF6: C9 FF
	BEQ @trymove				;C - - - - - 0x012E08 04:8DF8: F0 08
		;Not FF, amount to jump ahead and keep reading next op
		CLC							;C - - - - - 0x012E0A 04:8DFA: 18
		ADC projScriptOfs				;C - - - - - 0x012E0B 04:8DFB: 65 5D
		STA projScriptOfs				;C - - - - - 0x012E0D 04:8DFD: 85 5D
		JMP UpdateProjectiles_ReadOp				;C - - - - - 0x012E0F 04:8DFF: 4C D6 8D
@trymove:
	LDA objState+OSLOT_PROJ,X				;C - - - - - 0x012E12 04:8E02: BD 64 05
	BEQ UpdateProjectiles_NextProj				;C - - - - - 0x012E15 04:8E05: F0 14
		;Move
		LDA objX+OSLOT_PROJ,X				;C - - - - - 0x012E17 04:8E07: BD B4 05
		CLC							;C - - - - - 0x012E1A 04:8E0A: 18
		ADC projHSpeed,X				;C - - - - - 0x012E1B 04:8E0B: 7D 2D 05
		STA objX+OSLOT_PROJ,X				;C - - - - - 0x012E1E 04:8E0E: 9D B4 05

		LDA objY+OSLOT_PROJ,X				;C - - - - - 0x012E21 04:8E11: BD 8C 05
		CLC							;C - - - - - 0x012E24 04:8E14: 18
		ADC projVSpeed,X				;C - - - - - 0x012E25 04:8E15: 7D 35 05
		STA objY+OSLOT_PROJ,X				;C - - - - - 0x012E28 04:8E18: 9D 8C 05
UpdateProjectiles_NextProj:
	INX							;C - - - - - 0x012E2B 04:8E1B: E8
	CPX #$08					;C - - - - - 0x012E2C 04:8E1C: E0 08
	BCS @end				;C - - - - - 0x012E2E 04:8E1E: B0 03
		JMP UpdateProjectiles_CheckProj				;C - - - - - 0x012E30 04:8E20: 4C 8A 8D
@end:
	RTS							;C - - - - - 0x012E33 04:8E23: 60

ProjOp_Break:
	;Unreached
	NOP							;- - - - - - 0x012E34 04:8E24: EA
@hang:
	JMP @hang				;- - - - - - 0x012E35 04:8E25: 4C

ProjOp_Type:
	STA objState+OSLOT_PROJ,X				;C - - - - - 0x012E38 04:8E28: 9D 64 05
	LDA #$02					;C - - - - - 0x012E3B 04:8E2B: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012E3D 04:8E2D: 4C F6 8D

ProjOp_NextType:
	INC objState+OSLOT_PROJ,X				;C - - - - - 0x012E40 04:8E30: FE 64 05
	LDA #$01					;C - - - - - 0x012E43 04:8E33: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012E45 04:8E35: 4C F6 8D

ProjOp_HSpeed:
	STA projHSpeed,X				;C - - - - - 0x012E48 04:8E38: 9D 2D 05
	LDA #$02					;C - - - - - 0x012E4B 04:8E3B: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012E4D 04:8E3D: 4C F6 8D

ProjOp_VSpeed:
	STA projVSpeed,X				;C - - - - - 0x012E50 04:8E40: 9D 35 05
	LDA #$02					;C - - - - - 0x012E53 04:8E43: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012E55 04:8E45: 4C F6 8D

ProjOp_Speed:
	STA projHSpeed,X				;C - - - - - 0x012E58 04:8E48: 9D 2D 05
	LDA (scratch6),Y			;C - - - - - 0x012E5B 04:8E4B: B1 06
	STA projVSpeed,X				;C - - - - - 0x012E5D 04:8E4D: 9D 35 05
	LDA #$03					;C - - - - - 0x012E60 04:8E50: A9 03
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012E62 04:8E52: 4C F6 8D

ProjOp_Angle:
	;Unreached
	STA homingAngle				;- - - - - - 0x012E65 04:8E55: 8D
	STA scratch5				;- - - - - - 0x012E68 04:8E58: 85
	LDA #$02					;- - - - - - 0x012E6A 04:8E5A: A9
	JMP UpdateProjectiles_OpRet				;- - - - - - 0x012E6C 04:8E5C: 4C

ProjOp_GetPlayerContact:
	LDA projTouchingPlayer				;C - - - - - 0x012E6F 04:8E5F: A5 CE
	STA scratch5				;C - - - - - 0x012E71 04:8E61: 85 05
	LDA #$01					;C - - - - - 0x012E73 04:8E63: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012E75 04:8E65: 4C F6 8D

ProjOp_GetOffscreen:
	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x012E78 04:8E68: BD B4 05
	CMP #$08					;C - - - - - 0x012E7B 04:8E6B: C9 08
	BCC CODE_098E82				;C - - - - - 0x012E7D 04:8E6D: 90 13
	CMP #$F8					;C - - - - - 0x012E7F 04:8E6F: C9 F8
	BCS CODE_098E82				;C - - - - - 0x012E81 04:8E71: B0 0F
	LDA objY+OSLOT_PROJ,X				;C - - - - - 0x012E83 04:8E73: BD 8C 05
	CMP #$08					;C - - - - - 0x012E86 04:8E76: C9 08
	BCC CODE_098E82				;C - - - - - 0x012E88 04:8E78: 90 08
	CMP #$E8					;C - - - - - 0x012E8A 04:8E7A: C9 E8
	BCS CODE_098E82				;C - - - - - 0x012E8C 04:8E7C: B0 04
		LDA #$00					;C - - - - - 0x012E8E 04:8E7E: A9 00
		BEQ CODE_098E84				;C - - - - - 0x012E90 04:8E80: F0 02
CODE_098E82:
	LDA #$01					;C - - - - - 0x012E92 04:8E82: A9 01
CODE_098E84:
	STA scratch5				;C - - - - - 0x012E94 04:8E84: 85 05
	LDA #$01					;C - - - - - 0x012E96 04:8E86: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012E98 04:8E88: 4C F6 8D

ProjOp_Anim:
	STA objAnim+OSLOT_PROJ,X				;C - - - - - 0x012E9B 04:8E8B: 9D 7C 06
	LDA (scratch6),Y			;C - - - - - 0x012E9E 04:8E8E: B1 06
	STA objAnimHI+OSLOT_PROJ,X				;C - - - - - 0x012EA0 04:8E90: 9D 1C 07
	LDA #$00					;C - - - - - 0x012EA3 04:8E93: A9 00
	STA objAnimTimer+OSLOT_PROJ,X				;C - - - - - 0x012EA5 04:8E95: 9D A4 06
	STA objAnimProgress+OSLOT_PROJ,X				;C - - - - - 0x012EA8 04:8E98: 9D CC 06
	LDA #$03					;C - - - - - 0x012EAB 04:8E9B: A9 03
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012EAD 04:8E9D: 4C F6 8D

ProjOp_Despawn:
	JSR DespawnProj				;C - - - - - 0x012EB0 04:8EA0: 20 71 FE
	LDA #$01					;C - - - - - 0x012EB3 04:8EA3: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012EB5 04:8EA5: 4C F6 8D

ProjOp_End:
	LDA #$FF					;C - - - - - 0x012EB8 04:8EA8: A9 FF
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012EBA 04:8EAA: 4C F6 8D

ProjOp_GetParentDir:
	STA scratch8				;C - - - - - 0x012EBD 04:8EAD: 85 08
	LDA #$00					;C - - - - - 0x012EBF 04:8EAF: A9 00
	STA scratch9				;C - - - - - 0x012EC1 04:8EB1: 85 09
	STX scratch0				;C - - - - - 0x012EC3 04:8EB3: 86 00
	LDA projParent,X				;C - - - - - 0x012EC5 04:8EB5: BD 25 05
	TAX							;C - - - - - 0x012EC8 04:8EB8: AA
	LDA enemyDir,X				;C - - - - - 0x012EC9 04:8EB9: B5 A2
	STA scratch5				;C - - - - - 0x012ECB 04:8EBB: 85 05
	LDX scratch0				;C - - - - - 0x012ECD 04:8EBD: A6 00
	LDA #$01					;C - - - - - 0x012ECF 04:8EBF: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012ED1 04:8EC1: 4C F6 8D

ProjOp_Jump:
	PHA							;C - - - - - 0x012ED4 04:8EC4: 48
	LDA (scratch6),Y			;C - - - - - 0x012ED5 04:8EC5: B1 06
	STA scratch7				;C - - - - - 0x012ED7 04:8EC7: 85 07
	PLA							;C - - - - - 0x012ED9 04:8EC9: 68
	STA scratch6				;C - - - - - 0x012EDA 04:8ECA: 85 06
	LDA #$00					;C - - - - - 0x012EDC 04:8ECC: A9 00
	STA projScriptOfs				;C - - - - - 0x012EDE 04:8ECE: 85 5D
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012EE0 04:8ED0: 4C F6 8D

ProjOp_JumpCount:
	STA scratch0				;C - - - - - 0x012EE3 04:8ED3: 85 00
	INC projCounter,X				;C - - - - - 0x012EE5 04:8ED5: FE 1D 05
	LDA projCounter,X				;C - - - - - 0x012EE8 04:8ED8: BD 1D 05
	CMP scratch0				;C - - - - - 0x012EEB 04:8EDB: C5 00
	BCC @timeout				;C - - - - - 0x012EED 04:8EDD: 90 04
		LDA #$04					;C - - - - - 0x012EEF 04:8EDF: A9 04
		BNE CODE_098EF2				;C - - - - - 0x012EF1 04:8EE1: D0 0F
@timeout:
	LDA (scratch6),Y			;C - - - - - 0x012EF3 04:8EE3: B1 06
	PHA							;C - - - - - 0x012EF5 04:8EE5: 48
	INY							;C - - - - - 0x012EF6 04:8EE6: C8
	LDA (scratch6),Y			;C - - - - - 0x012EF7 04:8EE7: B1 06
	STA scratch7				;C - - - - - 0x012EF9 04:8EE9: 85 07
	PLA							;C - - - - - 0x012EFB 04:8EEB: 68
	STA scratch6				;C - - - - - 0x012EFC 04:8EEC: 85 06
	LDA #$00					;C - - - - - 0x012EFE 04:8EEE: A9 00
	STA projScriptOfs				;C - - - - - 0x012F00 04:8EF0: 85 5D
CODE_098EF2:
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012F02 04:8EF2: 4C F6 8D

ProjOp_HTurn:
	LDA #$00					;C - - - - - 0x012F05 04:8EF5: A9 00
	SEC							;C - - - - - 0x012F07 04:8EF7: 38
	SBC projHSpeed,X				;C - - - - - 0x012F08 04:8EF8: FD 2D 05
	STA projHSpeed,X				;C - - - - - 0x012F0B 04:8EFB: 9D 2D 05
	LDA #$01					;C - - - - - 0x012F0E 04:8EFE: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012F10 04:8F00: 4C F6 8D

ProjOp_VTurn:
	LDA #$00					;C - - - - - 0x012F13 04:8F03: A9 00
	SEC							;C - - - - - 0x012F15 04:8F05: 38
	SBC projVSpeed,X				;C - - - - - 0x012F16 04:8F06: FD 35 05
	STA projVSpeed,X				;C - - - - - 0x012F19 04:8F09: 9D 35 05
	LDA #$01					;C - - - - - 0x012F1C 04:8F0C: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012F1E 04:8F0E: 4C F6 8D

ProjOp_Gravity:
	INC projVSpeed,X				;C - - - - - 0x012F21 04:8F11: FE 35 05
	BMI CODE_098F1E				;C - - - - - 0x012F24 04:8F14: 30 08
		CMP projVSpeed,X				;C - - - - - 0x012F26 04:8F16: DD 35 05
		BCS CODE_098F1E				;C - - - - - 0x012F29 04:8F19: B0 03
			STA projVSpeed,X				;C - - - - - 0x012F2B 04:8F1B: 9D 35 05
CODE_098F1E:
	LDA #$02					;C - - - - - 0x012F2E 04:8F1E: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012F30 04:8F20: 4C F6 8D

ProjOp_ParentState:
	STA scratch0				;C - - - - - 0x012F33 04:8F23: 85 00
	LDA projParent,X				;C - - - - - 0x012F35 04:8F25: BD 25 05
	TAY							;C - - - - - 0x012F38 04:8F28: A8
	LDA scratch0				;C - - - - - 0x012F39 04:8F29: A5 00
	STA objState+OSLOT_ENEMY,Y				;C - - - - - 0x012F3B 04:8F2B: 99 6C 05
	LDA #$02					;C - - - - - 0x012F3E 04:8F2E: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012F40 04:8F30: 4C F6 8D

ProjOp_GetParentState:
	LDA projParent,X				;C - - - - - 0x012F43 04:8F33: BD 25 05
	TAY							;C - - - - - 0x012F46 04:8F36: A8
	LDA objState+OSLOT_ENEMY,Y				;C - - - - - 0x012F47 04:8F37: B9 6C 05
	LDY #$00					;C - - - - - 0x012F4A 04:8F3A: A0 00
	STA scratch5				;C - - - - - 0x012F4C 04:8F3C: 85 05
	LDA #$01					;C - - - - - 0x012F4E 04:8F3E: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012F50 04:8F40: 4C F6 8D

ProjOp_JumpEqual:
	STA scratch8				;C - - - - - 0x012F53 04:8F43: 85 08
	LDA #$00					;C - - - - - 0x012F55 04:8F45: A9 00
	STA scratch9				;C - - - - - 0x012F57 04:8F47: 85 09
	LDA (scratch6),Y			;C - - - - - 0x012F59 04:8F49: B1 06
	STY scratch0				;C - - - - - 0x012F5B 04:8F4B: 84 00
	LDY #$00					;C - - - - - 0x012F5D 04:8F4D: A0 00
	CMP (scratch8),Y			;C - - - - - 0x012F5F 04:8F4F: D1 08
	BNE CODE_098F67				;C - - - - - 0x012F61 04:8F51: D0 14
CODE_098F53:
	LDY scratch0				;C - - - - - 0x012F63 04:8F53: A4 00
	INY							;C - - - - - 0x012F65 04:8F55: C8
	LDA (scratch6),Y			;C - - - - - 0x012F66 04:8F56: B1 06
	PHA							;C - - - - - 0x012F68 04:8F58: 48
	INY							;C - - - - - 0x012F69 04:8F59: C8
	LDA (scratch6),Y			;C - - - - - 0x012F6A 04:8F5A: B1 06
	STA scratch7				;C - - - - - 0x012F6C 04:8F5C: 85 07
	PLA							;C - - - - - 0x012F6E 04:8F5E: 68
	STA scratch6				;C - - - - - 0x012F6F 04:8F5F: 85 06
	LDA #$00					;C - - - - - 0x012F71 04:8F61: A9 00
	STA projScriptOfs				;C - - - - - 0x012F73 04:8F63: 85 5D
	BEQ CODE_098F69				;C - - - - - 0x012F75 04:8F65: F0 02
CODE_098F67:
	LDA #$05					;C - - - - - 0x012F77 04:8F67: A9 05
CODE_098F69:
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012F79 04:8F69: 4C F6 8D

ProjOp_JumpNotEqual:
	STA scratch8				;C - - - - - 0x012F7C 04:8F6C: 85 08
	LDA #$00					;C - - - - - 0x012F7E 04:8F6E: A9 00
	STA scratch9				;C - - - - - 0x012F80 04:8F70: 85 09
	LDA (scratch6),Y			;C - - - - - 0x012F82 04:8F72: B1 06
	STY scratch0				;C - - - - - 0x012F84 04:8F74: 84 00
	LDY #$00					;C - - - - - 0x012F86 04:8F76: A0 00
	CMP (scratch8),Y			;C - - - - - 0x012F88 04:8F78: D1 08
	BEQ CODE_098F67				;C - - - - - 0x012F8A 04:8F7A: F0 EB

	JMP CODE_098F53				;C - - - - - 0x012F8C 04:8F7C: 4C 53 8F

ProjOp_Set:
	;Unreached
	STA scratch8				;- - - - - - 0x012F8F 04:8F7F: 85
	lda #$00					;- - - - - - 0x012F91 04:8F81: A9
	STA scratch9				;- - - - - - 0x012F93 04:8F83: 85
	LDA (scratch6),Y			;- - - - - - 0x012F95 04:8F85: B1
	LDY #$00					;- - - - - - 0x012F97 04:8F87: A0
	STA (scratch8),Y			;- - - - - - 0x012F99 04:8F89: 91
	LDA #$03					;- - - - - - 0x012F9B 04:8F8B: A9
	JMP UpdateProjectiles_OpRet				;- - - - - - 0x012F9D 04:8F8D: 4C

ProjOp_HomingPlayer:
	TXA							;C - - - - - 0x012FA0 04:8F90: 8A
	PHA							;C - - - - - 0x012FA1 04:8F91: 48
	CLC							;C - - - - - 0x012FA2 04:8F92: 18
	ADC #$01					;C - - - - - 0x012FA3 04:8F93: 69 01
	TAX							;C - - - - - 0x012FA5 04:8F95: AA
	LDY #$00					;C - - - - - 0x012FA6 04:8F96: A0 00
	JSR ProjGetNewHomingAngle				;C - - - - - 0x012FA8 04:8F98: 20 C2 93

	PLA							;C - - - - - 0x012FAB 04:8F9B: 68
	TAX							;C - - - - - 0x012FAC 04:8F9C: AA
	LDA newHomingAngle				;C - - - - - 0x012FAD 04:8F9D: AD CB 04
	STA scratch5				;C - - - - - 0x012FB0 04:8FA0: 85 05
	LDA #$01					;C - - - - - 0x012FB2 04:8FA2: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012FB4 04:8FA4: 4C F6 8D

ProjOp_HomingEnemy:
	STA scratch8				;C - - - - - 0x012FB7 04:8FA7: 85 08
	LDA #$00					;C - - - - - 0x012FB9 04:8FA9: A9 00
	STA scratch9				;C - - - - - 0x012FBB 04:8FAB: 85 09
	TXA							;C - - - - - 0x012FBD 04:8FAD: 8A
	PHA							;C - - - - - 0x012FBE 04:8FAE: 48
	CLC							;C - - - - - 0x012FBF 04:8FAF: 18
	ADC #$01					;C - - - - - 0x012FC0 04:8FB0: 69 01
	TAX							;C - - - - - 0x012FC2 04:8FB2: AA
	LDY #$00					;C - - - - - 0x012FC3 04:8FB3: A0 00

	LDA (scratch8),Y			;C - - - - - 0x012FC5 04:8FB5: B1 08
	CLC							;C - - - - - 0x012FC7 04:8FB7: 18
	ADC #OSLOT_ENEMY					;C - - - - - 0x012FC8 04:8FB8: 69 09
	TAY							;C - - - - - 0x012FCA 04:8FBA: A8
	JSR ProjGetNewHomingAngle				;C - - - - - 0x012FCB 04:8FBB: 20 C2 93

	PLA							;C - - - - - 0x012FCE 04:8FBE: 68
	TAX							;C - - - - - 0x012FCF 04:8FBF: AA
	LDA newHomingAngle				;C - - - - - 0x012FD0 04:8FC0: AD CB 04
	STA scratch5				;C - - - - - 0x012FD3 04:8FC3: 85 05
	LDA #$02					;C - - - - - 0x012FD5 04:8FC5: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012FD7 04:8FC7: 4C F6 8D

ProjOp_GetCount:
	STA scratch8				;C - - - - - 0x012FDA 04:8FCA: 85 08
	LDA #$00					;C - - - - - 0x012FDC 04:8FCC: A9 00
	STA scratch9				;C - - - - - 0x012FDE 04:8FCE: 85 09

	LDA projCounter,X				;C - - - - - 0x012FE0 04:8FD0: BD 1D 05
	STA scratch5				;C - - - - - 0x012FE3 04:8FD3: 85 05
	LDA #$01					;C - - - - - 0x012FE5 04:8FD5: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x012FE7 04:8FD7: 4C F6 8D

ProjOp_GetPlayerDist:
	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x012FEA 04:8FDA: BD B4 05
	SEC							;C - - - - - 0x012FED 04:8FDD: 38
	SBC objX				;C - - - - - 0x012FEE 04:8FDE: ED B3 05
	STA scratch0				;C - - - - - 0x012FF1 04:8FE1: 85 00
	BCS CODE_098FEA				;C - - - - - 0x012FF3 04:8FE3: B0 05
		LDA #$00					;C - - - - - 0x012FF5 04:8FE5: A9 00
		SEC							;C - - - - - 0x012FF7 04:8FE7: 38
		SBC scratch0				;C - - - - - 0x012FF8 04:8FE8: E5 00
CODE_098FEA:
	STA scratch4				;C - - - - - 0x012FFA 04:8FEA: 85 04

	LDA objY+OSLOT_PROJ,X				;C - - - - - 0x012FFC 04:8FEC: BD 8C 05
	SEC							;C - - - - - 0x012FFF 04:8FEF: 38
	SBC objY				;C - - - - - 0x013000 04:8FF0: ED 8B 05
	STA scratch0				;C - - - - - 0x013003 04:8FF3: 85 00
	BCS CODE_098FFC				;C - - - - - 0x013005 04:8FF5: B0 05
		LDA #$00					;C - - - - - 0x013007 04:8FF7: A9 00
		SEC							;C - - - - - 0x013009 04:8FF9: 38
		SBC scratch0				;C - - - - - 0x01300A 04:8FFA: E5 00
CODE_098FFC:
	STA scratch5				;C - - - - - 0x01300C 04:8FFC: 85 05

	LDA #$01					;C - - - - - 0x01300E 04:8FFE: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013010 04:9000: 4C F6 8D

ProjOp_MultiProj:
	ASL							;C - - - - - 0x013013 04:9003: 0A
	TAY							;C - - - - - 0x013014 04:9004: A8
	LDA #$00					;C - - - - - 0x013015 04:9005: A9 00
	STA objState+OSLOT_PROJ,X				;C - - - - - 0x013017 04:9007: 9D 64 05
	LDA scratch6				;C - - - - - 0x01301A 04:900A: A5 06
	PHA							;C - - - - - 0x01301C 04:900C: 48
	LDA scratch7				;C - - - - - 0x01301D 04:900D: A5 07
	PHA							;C - - - - - 0x01301F 04:900F: 48
	LDA #$00					;C - - - - - 0x013020 04:9010: A9 00
	STA otherDirAnim				;C - - - - - 0x013022 04:9012: 8D C9 04

	LDA #.BANK(MultiProjTable)					;C - - - - - 0x013025 04:9015: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x013027 04:9017: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x013029 04:9019: 20 56 FF
.endif

	LDA MultiProjTable,Y			;C - - - - - 0x01302C 04:901C: B9 02 BF
	STA scratch8				;C - - - - - 0x01302F 04:901F: 85 08
	LDA MultiProjTable+1,Y			;C - - - - - 0x013031 04:9021: B9 03 BF
	STA scratch9				;C - - - - - 0x013034 04:9024: 85 09

	LDA projParent,X				;C - - - - - 0x013036 04:9026: BD 25 05
	TAY							;C - - - - - 0x013039 04:9029: A8
	LDA objX+OSLOT_ENEMY,Y				;C - - - - - 0x01303A 04:902A: B9 BC 05
	STA scratch0				;C - - - - - 0x01303D 04:902D: 85 00
	LDA objY+OSLOT_ENEMY,Y				;C - - - - - 0x01303F 04:902F: B9 94 05
	STA scratch1				;C - - - - - 0x013042 04:9032: 85 01
	LDA objChrSlot+OSLOT_ENEMY,Y				;C - - - - - 0x013044 04:9034: B9 34 06
	STA scratch2				;C - - - - - 0x013047 04:9037: 85 02
	STX scratch3				;C - - - - - 0x013049 04:9039: 86 03

	LDA projParent,X				;C - - - - - 0x01304B 04:903B: BD 25 05
	TAX							;C - - - - - 0x01304E 04:903E: AA
	LDA enemyDir,X				;C - - - - - 0x01304F 04:903F: B5 A2
	EOR #DIR_LEFT|DIR_RIGHT					;C - - - - - 0x013051 04:9041: 49 03
	STA scratch4				;C - - - - - 0x013053 04:9043: 85 04
	DEC scratch4				;C - - - - - 0x013055 04:9045: C6 04
	LDY #$00					;C - - - - - 0x013057 04:9047: A0 00
	;Amount of projectiles
	LDA (scratch8),Y			;C - - - - - 0x013059 04:9049: B1 08
	STA scratch3				;C - - - - - 0x01305B 04:904B: 85 03
	INY							;C - - - - - 0x01305D 04:904D: C8
	;Proj ID
	LDA (scratch8),Y			;C - - - - - 0x01305E 04:904E: B1 08
	STA scratch5				;C - - - - - 0x013060 04:9050: 85 05
	INY							;C - - - - - 0x013062 04:9052: C8
	;Other dir anim
	LDA (scratch8),Y			;C - - - - - 0x013063 04:9053: B1 08
	CMP #$02					;C - - - - - 0x013065 04:9055: C9 02
	BCC CODE_09905E				;C - - - - - 0x013067 04:9057: 90 05
		STA otherDirAnim				;C - - - - - 0x013069 04:9059: 8D C9 04
		LDA #$01					;C - - - - - 0x01306C 04:905C: A9 01
CODE_09905E:
	AND scratch4				;C - - - - - 0x01306E 04:905E: 25 04
	STA scratch4				;C - - - - - 0x013070 04:9060: 85 04
	INY							;C - - - - - 0x013072 04:9062: C8
	;Attr
	LDA (scratch8),Y			;C - - - - - 0x013073 04:9063: B1 08
	STA openingCounter				;C - - - - - 0x013075 04:9065: 8D CC 04
CODE_099068:
	TXA							;C - - - - - 0x013078 04:9068: 8A
	PHA							;C - - - - - 0x013079 04:9069: 48
	INY							;C - - - - - 0x01307A 04:906A: C8
	;Anim to 06-07
	LDA (scratch8),Y			;C - - - - - 0x01307B 04:906B: B1 08
	STA scratch6				;C - - - - - 0x01307D 04:906D: 85 06
	INY							;C - - - - - 0x01307F 04:906F: C8
	LDA (scratch8),Y			;C - - - - - 0x013080 04:9070: B1 08
	STA scratch7				;C - - - - - 0x013082 04:9072: 85 07
	TYA							;C - - - - - 0x013084 04:9074: 98
	PHA							;C - - - - - 0x013085 04:9075: 48
	LDA scratch0				;C - - - - - 0x013086 04:9076: A5 00
	PHA							;C - - - - - 0x013088 04:9078: 48
	JSR SpawnProj				;C - - - - - 0x013089 04:9079: 20 82 FE
	PLA							;C - - - - - 0x01308C 04:907C: 68
	STA scratch0				;C - - - - - 0x01308D 04:907D: 85 00
	TYA							;C - - - - - 0x01308F 04:907F: 98
	TAX							;C - - - - - 0x013090 04:9080: AA
	PLA							;C - - - - - 0x013091 04:9081: 68
	TAY							;C - - - - - 0x013092 04:9082: A8
	LDA openingCounter				;C - - - - - 0x013093 04:9083: AD CC 04
	STA objAttr+OSLOT_PROJ,X				;C - - - - - 0x013096 04:9086: 9D F4 06
	INY							;C - - - - - 0x013099 04:9089: C8
	LDA (scratch8),Y			;C - - - - - 0x01309A 04:908A: B1 08
	STA projHSpeed,X				;C - - - - - 0x01309C 04:908C: 9D 2D 05
	LDA scratch4				;C - - - - - 0x01309F 04:908F: A5 04
	BEQ CODE_0990A4				;C - - - - - 0x0130A1 04:9091: F0 11
		LDA #$00					;C - - - - - 0x0130A3 04:9093: A9 00
		SEC							;C - - - - - 0x0130A5 04:9095: 38
		SBC projHSpeed,X				;C - - - - - 0x0130A6 04:9096: FD 2D 05
		STA projHSpeed,X				;C - - - - - 0x0130A9 04:9099: 9D 2D 05
		LDA otherDirAnim				;C - - - - - 0x0130AC 04:909C: AD C9 04
		BEQ CODE_0990A4				;C - - - - - 0x0130AF 04:909F: F0 03
			STA objAnim+OSLOT_PROJ,X				;C - - - - - 0x0130B1 04:90A1: 9D 7C 06
CODE_0990A4:
	INY							;C - - - - - 0x0130B4 04:90A4: C8
	LDA (scratch8),Y			;C - - - - - 0x0130B5 04:90A5: B1 08
	STA projVSpeed,X				;C - - - - - 0x0130B7 04:90A7: 9D 35 05
	PLA							;C - - - - - 0x0130BA 04:90AA: 68
	TAX							;C - - - - - 0x0130BB 04:90AB: AA
	DEC scratch3				;C - - - - - 0x0130BC 04:90AC: C6 03
	BNE CODE_099068				;C - - - - - 0x0130BE 04:90AE: D0 B8

	PLA							;C - - - - - 0x0130C0 04:90B0: 68
	STA scratch7				;C - - - - - 0x0130C1 04:90B1: 85 07
	PLA							;C - - - - - 0x0130C3 04:90B3: 68
	STA scratch6				;C - - - - - 0x0130C4 04:90B4: 85 06
	LDA #$02					;C - - - - - 0x0130C6 04:90B6: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x0130C8 04:90B8: 4C F6 8D

ProjOp_GetEnemyReached:
	LDY scratch5				;C - - - - - 0x0130CB 04:90BB: A4 05
	JSR CODE_099632				;C - - - - - 0x0130CD 04:90BD: 20 32 96

	LDA #$00					;C - - - - - 0x0130D0 04:90C0: A9 00
	ROL							;C - - - - - 0x0130D2 04:90C2: 2A
	STA scratch5				;C - - - - - 0x0130D3 04:90C3: 85 05

	LDA #$01					;C - - - - - 0x0130D5 04:90C5: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x0130D7 04:90C7: 4C F6 8D

ProjOp_HomingTurn:
	;Get next 0-15 direction, targeting the supplied direction
	LDA homingAngle				;C - - - - - 0x0130DA 04:90CA: AD 3D 05
	STA scratch1				;C - - - - - 0x0130DD 04:90CD: 85 01
	LDA #$00					;C - - - - - 0x0130DF 04:90CF: A9 00
	STA scratch0				;C - - - - - 0x0130E1 04:90D1: 85 00
	LDA scratch1				;C - - - - - 0x0130E3 04:90D3: A5 01
	SEC							;C - - - - - 0x0130E5 04:90D5: 38
	SBC newHomingAngle				;C - - - - - 0x0130E6 04:90D6: ED CB 04
	BEQ @haveresult				;C - - - - - 0x0130E9 04:90D9: F0 23
	BCC @neg				;C - - - - - 0x0130EB 04:90DB: 90 06
		CMP #9					;C - - - - - 0x0130ED 04:90DD: C9 09
		BCS @forward				;C - - - - - 0x0130EF 04:90DF: B0 0C
		BCC @backwards				;C - - - - - 0x0130F1 04:90E1: 90 12
@neg:
	LDA newHomingAngle				;C - - - - - 0x0130F3 04:90E3: AD CB 04
	SEC							;C - - - - - 0x0130F6 04:90E6: 38
	SBC scratch1				;C - - - - - 0x0130F7 04:90E7: E5 01
	CMP #9					;C - - - - - 0x0130F9 04:90E9: C9 09
	BCS @backwards				;C - - - - - 0x0130FB 04:90EB: B0 08
@forward:
	LDA scratch1				;C - - - - - 0x0130FD 04:90ED: A5 01
	CLC							;C - - - - - 0x0130FF 04:90EF: 18
	ADC #1					;C - - - - - 0x013100 04:90F0: 69 01
	JMP @wrap				;C - - - - - 0x013102 04:90F2: 4C FA 90
@backwards:
	LDA scratch1				;C - - - - - 0x013105 04:90F5: A5 01
	SEC							;C - - - - - 0x013107 04:90F7: 38
	SBC #1					;C - - - - - 0x013108 04:90F8: E9 01
@wrap:
	AND #$0F					;C - - - - - 0x01310A 04:90FA: 29 0F
	STA scratch1				;C - - - - - 0x01310C 04:90FC: 85 01
@haveresult:
	LDA scratch1				;C - - - - - 0x01310E 04:90FE: A5 01
	LDY #$00					;C - - - - - 0x013110 04:9100: A0 00
	STA homingAngle				;C - - - - - 0x013112 04:9102: 8D 3D 05
	STA scratch5				;C - - - - - 0x013115 04:9105: 85 05
	LDA #$01					;C - - - - - 0x013117 04:9107: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013119 04:9109: 4C F6 8D

ProjOp_WideScroll:
	;Unreached
	;Scroll projectile 4px if wide round scrolled
	LDA wideScrollDir				;- - - - - - 0x01311C 04:910C: A5
	BEQ @end				;- - - - - - 0x01311E 04:910E: F0
		CMP #DIR_LEFT					;- - - - - - 0x013120 04:9110: C9
		BEQ @left				;- - - - - - 0x013122 04:9112: F0
			LDA objX+OSLOT_PROJ,X				;- - - - - - 0x013124 04:9114: BD
			SEC							;- - - - - - 0x013127 04:9117: 38
			SBC #4					;- - - - - - 0x013128 04:9118: E9
			JMP @newx				;- - - - - - 0x01312A 04:911A: 4C
	@left:
		LDA objX+OSLOT_PROJ,X				;- - - - - - 0x01312D 04:911D: BD
		CLC							;- - - - - - 0x013130 04:9120: 18
		ADC #4					;- - - - - - 0x013131 04:9121: 69
	@newx:
		STA objX+OSLOT_PROJ,X				;- - - - - - 0x013133 04:9123: 9D
@end:
	LDA #$01					;- - - - - - 0x013136 04:9126: A9
	JMP UpdateProjectiles_OpRet				;- - - - - - 0x013138 04:9128: 4C

ProjOp_NOP:
	;Unreached
	LDA #$01					;- - - - - - 0x01313B 04:912B: A9
	JMP UpdateProjectiles_OpRet				;- - - - - - 0x01313D 04:912D: 4C

ProjOp_ApplyAngle:
	LDA #.BANK(HomingSpeedTable_H)					;C - - - - - 0x013140 04:9130: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x013142 04:9132: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x013144 04:9134: 20 56 FF
.endif

	LDY scratch5				;C - - - - - 0x013147 04:9137: A4 05
	LDA HomingSpeedTable_H,Y			;C - - - - - 0x013149 04:9139: B9 AA BE
	STA projHSpeed,X				;C - - - - - 0x01314C 04:913C: 9D 2D 05
	LDA HomingSpeedTable,Y			;C - - - - - 0x01314F 04:913F: B9 A6 BE
	STA projVSpeed,X				;C - - - - - 0x013152 04:9142: 9D 35 05

	LDA #$01					;C - - - - - 0x013155 04:9145: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013157 04:9147: 4C F6 8D

ProjOp_Copy:
	;Unreached
	STA scratch8				;- - - - - - 0x01315A 04:914A: 85
	LDA (scratch6),Y			;- - - - - - 0x01315C 04:914C: B1
	STA scratch0				;- - - - - - 0x01315E 04:914E: 85
	LDY #$00					;- - - - - - 0x013160 04:9150: A0
	STY scratch9				;- - - - - - 0x013162 04:9152: 84

	LDA (scratch8),Y			;- - - - - - 0x013164 04:9154: B1
	STA scratch1				;- - - - - - 0x013166 04:9156: 85

	LDA scratch0				;- - - - - - 0x013168 04:9158: A5
	STA scratch8				;- - - - - - 0x01316A 04:915A: 85
	LDA scratch1				;- - - - - - 0x01316C 04:915C: A5
	STA (scratch8),Y			;- - - - - - 0x01316E 04:915E: 91
	LDA #$03					;- - - - - - 0x013170 04:9160: A9
	JMP UpdateProjectiles_OpRet				;- - - - - - 0x013172 04:9162: 4C

ProjOp_HurtPlayer:
	LDA #DMG_ENEMY					;C - - - - - 0x013175 04:9165: A9 80
	STA playerDmgType				;C - - - - - 0x013177 04:9167: 85 7C
	LDA #$01					;C - - - - - 0x013179 04:9169: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x01317B 04:916B: 4C F6 8D

ProjOp_CatchPlayer:
	LDA #DMG_STUCK					;C - - - - - 0x01317E 04:916E: A9 C0
	STA playerDmgType				;C - - - - - 0x013180 04:9170: 85 7C
	LDA #$01					;C - - - - - 0x013182 04:9172: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013184 04:9174: 4C F6 8D

ProjOp_JumpNotLarger:
	STA scratch8				;C - - - - - 0x013187 04:9177: 85 08
	LDA #$00					;C - - - - - 0x013189 04:9179: A9 00
	STA scratch9				;C - - - - - 0x01318B 04:917B: 85 09

	LDA (scratch6),Y			;C - - - - - 0x01318D 04:917D: B1 06
	STY scratch0				;C - - - - - 0x01318F 04:917F: 84 00

	LDY #$00					;C - - - - - 0x013191 04:9181: A0 00
	CMP (scratch8),Y			;C - - - - - 0x013193 04:9183: D1 08
	BEQ CODE_09918C				;C - - - - - 0x013195 04:9185: F0 05
	BCC CODE_09918C				;C - - - - - 0x013197 04:9187: 90 03
		JMP CODE_098F67				;C - - - - - 0x013199 04:9189: 4C 67 8F
CODE_09918C:
	JMP CODE_098F53				;C - - - - - 0x01319C 04:918C: 4C 53 8F

ProjOp_JumpLarger:
	STA scratch8				;C - - - - - 0x01319F 04:918F: 85 08
	LDA #$00					;C - - - - - 0x0131A1 04:9191: A9 00
	STA scratch9				;C - - - - - 0x0131A3 04:9193: 85 09

	LDA (scratch6),Y			;C - - - - - 0x0131A5 04:9195: B1 06
	STY scratch0				;C - - - - - 0x0131A7 04:9197: 84 00

	LDY #$00					;C - - - - - 0x0131A9 04:9199: A0 00
	CMP (scratch8),Y			;C - - - - - 0x0131AB 04:919B: D1 08
	BEQ CODE_0991A4				;C - - - - - 0x0131AD 04:919D: F0 05
	BCC CODE_0991A4				;C - - - - - 0x0131AF 04:919F: 90 03
		JMP CODE_098F53				;C - - - - - 0x0131B1 04:91A1: 4C 53 8F
CODE_0991A4:
	JMP CODE_098F67				;C - - - - - 0x0131B4 04:91A4: 4C 67 8F

ProjOp_GetPos:
	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x0131B7 04:91A7: BD B4 05
	STA scratch4				;C - - - - - 0x0131BA 04:91AA: 85 04
	LDA objY+OSLOT_PROJ,X				;C - - - - - 0x0131BC 04:91AC: BD 8C 05
	STA scratch5				;C - - - - - 0x0131BF 04:91AF: 85 05
	LDA #$01					;C - - - - - 0x0131C1 04:91B1: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x0131C3 04:91B3: 4C F6 8D

ProjOp_Count:
	STA projCounter,X				;C - - - - - 0x0131C6 04:91B6: 9D 1D 05
	LDA #$02					;C - - - - - 0x0131C9 04:91B9: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x0131CB 04:91BB: 4C F6 8D

ProjOp_Terrain:
	LDA scratch6				;C - - - - - 0x0131CE 04:91BE: A5 06
	PHA							;C - - - - - 0x0131D0 04:91C0: 48
	LDA scratch7				;C - - - - - 0x0131D1 04:91C1: A5 07
	PHA							;C - - - - - 0x0131D3 04:91C3: 48

	LDA objY+OSLOT_PROJ,X				;C - - - - - 0x0131D4 04:91C4: BD 8C 05
	CLC							;C - - - - - 0x0131D7 04:91C7: 18
	ADC #$02					;C - - - - - 0x0131D8 04:91C8: 69 02
	STA scratch0				;C - - - - - 0x0131DA 04:91CA: 85 00

	LDA projHSpeed,X				;C - - - - - 0x0131DC 04:91CC: BD 2D 05
	AND #$80					;C - - - - - 0x0131DF 04:91CF: 29 80
	ASL							;C - - - - - 0x0131E1 04:91D1: 0A
	ROL							;C - - - - - 0x0131E2 04:91D2: 2A
	TAY							;C - - - - - 0x0131E3 04:91D3: A8

	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x0131E4 04:91D4: BD B4 05
	CLC							;C - - - - - 0x0131E7 04:91D7: 18
	ADC DATA_099209,Y			;C - - - - - 0x0131E8 04:91D8: 79 09 92
	STA scratch1				;C - - - - - 0x0131EB 04:91DB: 85 01

	JSR GetTile				;C - - - - - 0x0131ED 04:91DD: 20 CB F4
	CPX #$00					;C - - - - - 0x0131F0 04:91E0: E0 00
	BNE CODE_0991F4				;C - - - - - 0x0131F2 04:91E2: D0 10
		LDA scratch3				;C - - - - - 0x0131F4 04:91E4: A5 03
		EOR #$07					;C - - - - - 0x0131F6 04:91E6: 49 07
		STA scratch3				;C - - - - - 0x0131F8 04:91E8: 85 03
		LDA projHSpeed,X				;C - - - - - 0x0131FA 04:91EA: BD 2D 05
		BMI CODE_0991F4				;C - - - - - 0x0131FD 04:91ED: 30 05
			JSR CheckWall				;C - - - - - 0x0131FF 04:91EF: 20 E2 F7
			BNE CODE_0991F7				;C - - - - - 0x013202 04:91F2: D0 03
CODE_0991F4:
	JSR CheckFloor				;C - - - - - 0x013204 04:91F4: 20 1A F8
CODE_0991F7:
	PLA							;C - - - - - 0x013207 04:91F7: 68
	STA scratch7				;C - - - - - 0x013208 04:91F8: 85 07
	PLA							;C - - - - - 0x01320A 04:91FA: 68
	STA scratch6				;C - - - - - 0x01320B 04:91FB: 85 06

	;Should be $0A? (For ProjScriptTable access at 0x012DA4?)
	LDA #$08					;C - - - - - 0x01320D 04:91FD: A9 08
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x01320F 04:91FF: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x013211 04:9201: 20 56 FF
.endif

	LDA #$01					;C - - - - - 0x013214 04:9204: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013216 04:9206: 4C F6 8D

DATA_099209:
	.byte 8					;- D 0 - - - 0x013219 04:9209: 08
	.byte -8					;- D 0 - - - 0x01321A 04:920A: F8

ProjOp_GetParent:
	LDA projParent,X				;C - - - - - 0x01321B 04:920B: BD 25 05
	STA scratch5				;C - - - - - 0x01321E 04:920E: 85 05
	LDA #$01					;C - - - - - 0x013220 04:9210: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013222 04:9212: 4C F6 8D

ProjOp_JumpFrame:
	STA scratch0				;C - - - - - 0x013225 04:9215: 85 00

	LDA (scratch6),Y			;C - - - - - 0x013227 04:9217: B1 06
	STA scratch1				;C - - - - - 0x013229 04:9219: 85 01
	INY							;C - - - - - 0x01322B 04:921B: C8
	LDA (scratch6),Y			;C - - - - - 0x01322C 04:921C: B1 06
	STA scratch2				;C - - - - - 0x01322E 04:921E: 85 02

	LDA globalTimer				;C - - - - - 0x013230 04:9220: A5 14
	AND scratch0				;C - - - - - 0x013232 04:9222: 25 00
	BEQ CODE_099234				;C - - - - - 0x013234 04:9224: F0 0E
		LDA scratch1				;C - - - - - 0x013236 04:9226: A5 01
		STA scratch6				;C - - - - - 0x013238 04:9228: 85 06
		LDA scratch2				;C - - - - - 0x01323A 04:922A: A5 02
		STA scratch7				;C - - - - - 0x01323C 04:922C: 85 07
		LDA #$00					;C - - - - - 0x01323E 04:922E: A9 00
		STA projScriptOfs				;C - - - - - 0x013240 04:9230: 85 5D
		BEQ CODE_099236				;C - - - - - 0x013242 04:9232: F0 02
CODE_099234:
	LDA #$04					;C - - - - - 0x013244 04:9234: A9 04
CODE_099236:
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013246 04:9236: 4C F6 8D

ProjOp_GetSpeed:
	LDA projHSpeed,X				;C - - - - - 0x013249 04:9239: BD 2D 05
	STA scratch4				;C - - - - - 0x01324C 04:923C: 85 04
	LDA projVSpeed,X				;C - - - - - 0x01324E 04:923E: BD 35 05
	STA scratch5				;C - - - - - 0x013251 04:9241: 85 05
	LDA #$01					;C - - - - - 0x013253 04:9243: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013255 04:9245: 4C F6 8D

ProjOp_ParentAnim:
	STA scratch0				;C - - - - - 0x013258 04:9248: 85 00
	LDA (scratch6),Y			;C - - - - - 0x01325A 04:924A: B1 06
	STA scratch1				;C - - - - - 0x01325C 04:924C: 85 01
	LDA projParent,X				;C - - - - - 0x01325E 04:924E: BD 25 05

	TAY							;C - - - - - 0x013261 04:9251: A8
	LDA scratch0				;C - - - - - 0x013262 04:9252: A5 00
	STA objAnim+OSLOT_ENEMY,Y				;C - - - - - 0x013264 04:9254: 99 84 06
	LDA scratch1				;C - - - - - 0x013267 04:9257: A5 01
	STA objAnimHI+OSLOT_ENEMY,Y				;C - - - - - 0x013269 04:9259: 99 24 07
	LDA #$00					;C - - - - - 0x01326C 04:925C: A9 00
	STA objAnimTimer+OSLOT_ENEMY,Y				;C - - - - - 0x01326E 04:925E: 99 AC 06
	STA objAnimProgress+OSLOT_ENEMY,Y				;C - - - - - 0x013271 04:9261: 99 D4 06
	LDA #$03					;C - - - - - 0x013274 04:9264: A9 03
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013276 04:9266: 4C F6 8D

ProjOp_CopyPlayerState:
	STA scratch8				;C - - - - - 0x013279 04:9269: 85 08
	LDY #$00					;C - - - - - 0x01327B 04:926B: A0 00
	STY scratch9				;C - - - - - 0x01327D 04:926D: 84 09

	LDA playerState				;C - - - - - 0x01327F 04:926F: A5 75
	STA (scratch8),Y			;C - - - - - 0x013281 04:9271: 91 08
	LDA #$02					;C - - - - - 0x013283 04:9273: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013285 04:9275: 4C F6 8D

ProjOp_MissileAnim:
	LDA scratch5				;C - - - - - 0x013288 04:9278: A5 05
	LSR							;C - - - - - 0x01328A 04:927A: 4A
	TAY							;C - - - - - 0x01328B 04:927B: A8
	LDA MissileAnimTable,Y			;C - - - - - 0x01328C 04:927C: B9 92 92
	STA objAnim+OSLOT_PROJ,X				;C - - - - - 0x01328F 04:927F: 9D 7C 06
	LDA #$00					;C - - - - - 0x013292 04:9282: A9 00
	STA objAnimHI+OSLOT_PROJ,X				;C - - - - - 0x013294 04:9284: 9D 1C 07
	STA objAnimTimer+OSLOT_PROJ,X				;C - - - - - 0x013297 04:9287: 9D A4 06
	STA objAnimProgress+OSLOT_PROJ,X				;C - - - - - 0x01329A 04:928A: 9D CC 06
	LDA #$01					;C - - - - - 0x01329D 04:928D: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x01329F 04:928F: 4C F6 8D

MissileAnimTable:
	;- D 0 - - - 0x0132A2 04:9292: B6
	.byte anRoboZenMissileUp_ID
	.byte anRoboZenMissileUpRight_ID
	.byte anRoboZenMissileRight_ID
	.byte anRoboZenMissileDownRight_ID
	.byte anRoboZenMissileDown_ID
	.byte anRoboZenMissileDownLeft_ID
	.byte anRoboZenMissileLeft_ID
	.byte anRoboZenMissileUpLeft_ID

ProjOp_Slow:
	LDA projHSpeed,X				;C - - - - - 0x0132AA 04:929A: BD 2D 05
	BEQ CODE_0992AA				;C - - - - - 0x0132AD 04:929D: F0 0B
	BMI CODE_0992A7				;C - - - - - 0x0132AF 04:929F: 30 06
		DEC projHSpeed,X				;C - - - - - 0x0132B1 04:92A1: DE 2D 05
		JMP CODE_0992AA				;C - - - - - 0x0132B4 04:92A4: 4C AA 92
CODE_0992A7:
	INC projHSpeed,X				;C - - - - - 0x0132B7 04:92A7: FE 2D 05
CODE_0992AA:
	LDA #$01					;C - - - - - 0x0132BA 04:92AA: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x0132BC 04:92AC: 4C F6 8D

ProjOp_Sound:
	STA a:soundTrigger			;C - - - - - 0x0132BF 04:92AF: 8D E1 00
	LDA #$02					;C - - - - - 0x0132C2 04:92B2: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x0132C4 04:92B4: 4C F6 8D

ProjOp_CountType:
	STA scratch0				;C - - - - - 0x0132C7 04:92B7: 85 00
	LDY #$00					;C - - - - - 0x0132C9 04:92B9: A0 00
	STY scratch5				;C - - - - - 0x0132CB 04:92BB: 84 05
CODE_0992BD:
	LDA objState+OSLOT_PROJ,Y				;C - - - - - 0x0132CD 04:92BD: B9 64 05
	CMP scratch0				;C - - - - - 0x0132D0 04:92C0: C5 00
	BNE CODE_0992C6				;C - - - - - 0x0132D2 04:92C2: D0 02
		INC scratch5				;C - - - - - 0x0132D4 04:92C4: E6 05
CODE_0992C6:
	INY							;C - - - - - 0x0132D6 04:92C6: C8
	CPY #$08					;C - - - - - 0x0132D7 04:92C7: C0 08
	BCC CODE_0992BD				;C - - - - - 0x0132D9 04:92C9: 90 F2

	LDA #$02					;C - - - - - 0x0132DB 04:92CB: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x0132DD 04:92CD: 4C F6 8D

ProjOp_TractorMissile:
	PHA							;C - - - - - 0x0132E0 04:92D0: 48
	LDA (scratch6),Y			;C - - - - - 0x0132E1 04:92D1: B1 06
	PHA							;C - - - - - 0x0132E3 04:92D3: 48

	LDA scratch6				;C - - - - - 0x0132E4 04:92D4: A5 06
	PHA							;C - - - - - 0x0132E6 04:92D6: 48
	LDA scratch7				;C - - - - - 0x0132E7 04:92D7: A5 07
	PHA							;C - - - - - 0x0132E9 04:92D9: 48

	;Proj ID
	LDA #psGravityProj_ID					;C - - - - - 0x0132EA 04:92DA: A9 0C
	STA scratch5				;C - - - - - 0x0132EC 04:92DC: 85 05

	;Anim
	LDA #.LOBYTE(anTractorMissile_ID)					;C - - - - - 0x0132EE 04:92DE: A9 21
	STA scratch6				;C - - - - - 0x0132F0 04:92E0: 85 06
	LDA #.HIBYTE(anTractorMissile_ID)					;C - - - - - 0x0132F2 04:92E2: A9 01
	STA scratch7				;C - - - - - 0x0132F4 04:92E4: 85 07

	;CHR slot
	LDA #$02					;C - - - - - 0x0132F6 04:92E6: A9 02
	STA scratch2				;C - - - - - 0x0132F8 04:92E8: 85 02

	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x0132FA 04:92EA: BD B4 05
	STA scratch0				;C - - - - - 0x0132FD 04:92ED: 85 00
	LDA #152					;C - - - - - 0x0132FF 04:92EF: A9 98
	STA scratch1				;C - - - - - 0x013301 04:92F1: 85 01
	JSR SpawnProj				;C - - - - - 0x013303 04:92F3: 20 82 FE

	PLA							;C - - - - - 0x013306 04:92F6: 68
	STA scratch7				;C - - - - - 0x013307 04:92F7: 85 07
	PLA							;C - - - - - 0x013309 04:92F9: 68
	STA scratch6				;C - - - - - 0x01330A 04:92FA: 85 06

	PLA							;C - - - - - 0x01330C 04:92FC: 68
	STA projVSpeed,Y				;C - - - - - 0x01330D 04:92FD: 99 35 05
	PLA							;C - - - - - 0x013310 04:9300: 68
	STA projHSpeed,Y				;C - - - - - 0x013311 04:9301: 99 2D 05
	LDA #$03					;C - - - - - 0x013314 04:9304: A9 03
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013316 04:9306: 4C F6 8D

ProjOp_AdjustHits:
	STA scratch8				;C - - - - - 0x013319 04:9309: 85 08
	LDA #$00					;C - - - - - 0x01331B 04:930B: A9 00
	STA scratch9				;C - - - - - 0x01331D 04:930D: 85 09

	LDA (scratch6),Y			;C - - - - - 0x01331F 04:930F: B1 06
	STA scratch0				;C - - - - - 0x013321 04:9311: 85 00

	LDY #$00					;C - - - - - 0x013323 04:9313: A0 00
	LDA (scratch8),Y			;C - - - - - 0x013325 04:9315: B1 08
	TAY							;C - - - - - 0x013327 04:9317: A8
	LDA enemyHits,Y				;C - - - - - 0x013328 04:9318: B9 BE 04
	CLC							;C - - - - - 0x01332B 04:931B: 18
	ADC scratch0				;C - - - - - 0x01332C 04:931C: 65 00
	CMP #$FF					;C - - - - - 0x01332E 04:931E: C9 FF
	BNE CODE_099324				;C - - - - - 0x013330 04:9320: D0 02
		LDA #$00					;C - - - - - 0x013332 04:9322: A9 00
CODE_099324:
	STA enemyHits,Y				;C - - - - - 0x013334 04:9324: 99 BE 04

	LDA #$03					;C - - - - - 0x013337 04:9327: A9 03
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013339 04:9329: 4C F6 8D

ProjOp_WarpParent:
	LDA projParent,X				;C - - - - - 0x01333C 04:932C: BD 25 05
	TAY							;C - - - - - 0x01333F 04:932F: A8
	LDA objX+OSLOT_ENEMY,Y				;C - - - - - 0x013340 04:9330: B9 BC 05
	STA objX+OSLOT_PROJ,X				;C - - - - - 0x013343 04:9333: 9D B4 05
	LDA objY+OSLOT_ENEMY,Y				;C - - - - - 0x013346 04:9336: B9 94 05
	STA objY+OSLOT_PROJ,X				;C - - - - - 0x013349 04:9339: 9D 8C 05
	LDA #$01					;C - - - - - 0x01334C 04:933C: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x01334E 04:933E: 4C F6 8D

ProjOp_BonusBall:
	JSR CODE_09945B				;C - - - - - 0x013351 04:9341: 20 5B 94
	LDA #$01					;C - - - - - 0x013354 04:9344: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013356 04:9346: 4C F6 8D

ProjOp_DespawnAll:
	LDY #$00					;C - - - - - 0x013359 04:9349: A0 00
	TYA							;C - - - - - 0x01335B 04:934B: 98
CODE_09934C:
	STA objState+OSLOT_PROJ,Y				;C - - - - - 0x01335C 04:934C: 99 64 05
	INY							;C - - - - - 0x01335F 04:934F: C8
	CPY #$08					;C - - - - - 0x013360 04:9350: C0 08
	BCC CODE_09934C				;C - - - - - 0x013362 04:9352: 90 F8

	LDA #$01					;C - - - - - 0x013364 04:9354: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x013366 04:9356: 4C F6 8D

ProjOp_Parent:
	STA projParent,X				;C - - - - - 0x013369 04:9359: 9D 25 05
	LDA #$02					;C - - - - - 0x01336C 04:935C: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x01336E 04:935E: 4C F6 8D

ProjOp_GetPlayerSide:
	LDY #$01					;C - - - - - 0x013371 04:9361: A0 01
	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x013373 04:9363: BD B4 05
	CMP objX				;C - - - - - 0x013376 04:9366: CD B3 05
	BCC CODE_09936D				;C - - - - - 0x013379 04:9369: 90 02
		LDY #$00					;C - - - - - 0x01337B 04:936B: A0 00
CODE_09936D:
	STY scratch4				;C - - - - - 0x01337D 04:936D: 84 04

	LDY #$01					;C - - - - - 0x01337F 04:936F: A0 01
	LDA objY+OSLOT_PROJ,X				;C - - - - - 0x013381 04:9371: BD 8C 05
	CMP objY				;C - - - - - 0x013384 04:9374: CD 8B 05
	BCC CODE_09937B				;C - - - - - 0x013387 04:9377: 90 02
		LDY #$00					;C - - - - - 0x013389 04:9379: A0 00
CODE_09937B:
	STY scratch5				;C - - - - - 0x01338B 04:937B: 84 05

	LDA #$01					;C - - - - - 0x01338D 04:937D: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x01338F 04:937F: 4C F6 8D

ProjOp_PlayerState:
	STA playerState				;C - - - - - 0x013392 04:9382: 85 75
	LDA #$00					;C - - - - - 0x013394 04:9384: A9 00
	STA inflateTime				;C - - - - - 0x013396 04:9386: 8D 7C 04
	STA extraBubbles				;C - - - - - 0x013399 04:9389: 8D 7D 04
	STA ram_0076				;C - - - - - 0x01339C 04:938C: 85 76
	STA objAnimProgress				;C - - - - - 0x01339E 04:938E: 8D CB 06
	STA objAnimTimer				;C - - - - - 0x0133A1 04:9391: 8D A3 06
	LDA #$02					;C - - - - - 0x0133A4 04:9394: A9 02
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x0133A6 04:9396: 4C F6 8D

ProjOp_Heart:
	LDA playerHearts				;C - - - - - 0x0133A9 04:9399: AD 78 04
	CMP #$05					;C - - - - - 0x0133AC 04:939C: C9 05
	BCS CODE_0993AF				;C - - - - - 0x0133AE 04:939E: B0 0F
		INC playerHearts				;C - - - - - 0x0133B0 04:93A0: EE 78 04
		LDA #$02					;C - - - - - 0x0133B3 04:93A3: A9 02
		STA livesCurrentPos				;C - - - - - 0x0133B5 04:93A5: 8D 98 04
		TXA							;C - - - - - 0x0133B8 04:93A8: 8A
		PHA							;C - - - - - 0x0133B9 04:93A9: 48
		JSR AddScore				;C - - - - - 0x0133BA 04:93AA: 20 C7 FE
		PLA							;C - - - - - 0x0133BD 04:93AD: 68
		TAX							;C - - - - - 0x0133BE 04:93AE: AA
CODE_0993AF:
	LDA #$01					;C - - - - - 0x0133BF 04:93AF: A9 01
	JMP UpdateProjectiles_OpRet				;C - - - - - 0x0133C1 04:93B1: 4C F6 8D

.ifndef REGION_JP
ProjOp_GetParentHits:
	;Unreached
	LDA projParent,X				;- - - - - - 0x0133C4 04:93B4: BD
	TAY							;- - - - - - 0x0133C7 04:93B7: A8
	LDA enemyHits,Y				;- - - - - - 0x0133C8 04:93B8: B9
	STA scratch5				;- - - - - - 0x0133CB 04:93BB: 85

	LDA #$01					;- - - - - - 0x0133CD 04:93BD: A9
	JMP UpdateProjectiles_OpRet				;- - - - - - 0x0133CF 04:93BF: 4C
.endif

ProjGetNewHomingAngle:
	;X: Projectile object index
	;Y: Target object index
	LDA #.BANK(HomingAngleTable)					;C - - - - - 0x0133D2 04:93C2: A9 06
.ifdef REGION_JP
	STA prgBankB
	STA $8001
.else
	STA newPrgBank				;C - - - - - 0x0133D4 04:93C4: 85 3B
	JSR SwapPrgBankB				;C - - - - - 0x0133D6 04:93C6: 20 56 FF
.endif

	LDA #$00					;C - - - - - 0x0133D9 04:93C9: A9 00
	STA scratch3				;C - - - - - 0x0133DB 04:93CB: 85 03
	LDA objX,X				;C - - - - - 0x0133DD 04:93CD: BD B3 05
	SEC							;C - - - - - 0x0133E0 04:93D0: 38
	SBC objX,Y				;C - - - - - 0x0133E1 04:93D1: F9 B3 05
	ROL scratch3				;C - - - - - 0x0133E4 04:93D4: 26 03
	STA scratch0				;C - - - - - 0x0133E6 04:93D6: 85 00
	LDA #$01					;C - - - - - 0x0133E8 04:93D8: A9 01
	STA scratch1				;C - - - - - 0x0133EA 04:93DA: 85 01
	LDA scratch3				;C - - - - - 0x0133EC 04:93DC: A5 03
	BNE CODE_0993E9				;C - - - - - 0x0133EE 04:93DE: D0 09
		LDA #$00					;C - - - - - 0x0133F0 04:93E0: A9 00
		STA scratch1				;C - - - - - 0x0133F2 04:93E2: 85 01
		SEC							;C - - - - - 0x0133F4 04:93E4: 38
		SBC scratch0				;C - - - - - 0x0133F5 04:93E5: E5 00
		STA scratch0				;C - - - - - 0x0133F7 04:93E7: 85 00
CODE_0993E9:
	LDA #$00					;C - - - - - 0x0133F9 04:93E9: A9 00
	STA scratch3				;C - - - - - 0x0133FB 04:93EB: 85 03
	LDA objY,X				;C - - - - - 0x0133FD 04:93ED: BD 8B 05
	SEC							;C - - - - - 0x013400 04:93F0: 38
	SBC objY,Y				;C - - - - - 0x013401 04:93F1: F9 8B 05
	ROL scratch3				;C - - - - - 0x013404 04:93F4: 26 03
	STA scratch2				;C - - - - - 0x013406 04:93F6: 85 02
	LDA scratch3				;C - - - - - 0x013408 04:93F8: A5 03
	BNE CODE_099406				;C - - - - - 0x01340A 04:93FA: D0 0A
		LDA #$00					;C - - - - - 0x01340C 04:93FC: A9 00
		SEC							;C - - - - - 0x01340E 04:93FE: 38
		SBC scratch2				;C - - - - - 0x01340F 04:93FF: E5 02
		STA scratch2				;C - - - - - 0x013411 04:9401: 85 02
		JMP CODE_09940C				;C - - - - - 0x013413 04:9403: 4C 0C 94
CODE_099406:
	LDA scratch1				;C - - - - - 0x013416 04:9406: A5 01
	ORA #$02					;C - - - - - 0x013418 04:9408: 09 02
	STA scratch1				;C - - - - - 0x01341A 04:940A: 85 01
CODE_09940C:
	LDA scratch2				;C - - - - - 0x01341C 04:940C: A5 02
	STA scratch3				;C - - - - - 0x01341E 04:940E: 85 03
	LDA scratch0				;C - - - - - 0x013420 04:9410: A5 00
	STA scratch4				;C - - - - - 0x013422 04:9412: 85 04
	LDA scratch0				;C - - - - - 0x013424 04:9414: A5 00
	CMP scratch2				;C - - - - - 0x013426 04:9416: C5 02
	BCC CODE_099428				;C - - - - - 0x013428 04:9418: 90 0E
		LDA scratch0				;C - - - - - 0x01342A 04:941A: A5 00
		STA scratch3				;C - - - - - 0x01342C 04:941C: 85 03
		LDA scratch2				;C - - - - - 0x01342E 04:941E: A5 02
		STA scratch4				;C - - - - - 0x013430 04:9420: 85 04
		LDA scratch1				;C - - - - - 0x013432 04:9422: A5 01
		ORA #$04					;C - - - - - 0x013434 04:9424: 09 04
		STA scratch1				;C - - - - - 0x013436 04:9426: 85 01
CODE_099428:
	LDA scratch4				;C - - - - - 0x013438 04:9428: A5 04
	ASL							;C - - - - - 0x01343A 04:942A: 0A
	BCS CODE_099434				;C - - - - - 0x01343B 04:942B: B0 07
	ASL							;C - - - - - 0x01343D 04:942D: 0A
	BCS CODE_099434				;C - - - - - 0x01343E 04:942E: B0 04
		CMP scratch3				;C - - - - - 0x013440 04:9430: C5 03
		BCC CODE_099452				;C - - - - - 0x013442 04:9432: 90 1E
CODE_099434:
	LDA scratch3				;C - - - - - 0x013444 04:9434: A5 03
	SEC							;C - - - - - 0x013446 04:9436: 38
	SBC scratch4				;C - - - - - 0x013447 04:9437: E5 04
	STA scratch5				;C - - - - - 0x013449 04:9439: 85 05
	LDA scratch3				;C - - - - - 0x01344B 04:943B: A5 03
	LSR							;C - - - - - 0x01344D 04:943D: 4A
	LSR							;C - - - - - 0x01344E 04:943E: 4A
	CMP scratch5				;C - - - - - 0x01344F 04:943F: C5 05
	BCC CODE_09944C				;C - - - - - 0x013451 04:9441: 90 09
		LDA scratch1				;C - - - - - 0x013453 04:9443: A5 01
		ORA #$10					;C - - - - - 0x013455 04:9445: 09 10
		STA scratch1				;C - - - - - 0x013457 04:9447: 85 01
		JMP CODE_099452				;C - - - - - 0x013459 04:9449: 4C 52 94
CODE_09944C:
	LDA scratch1				;C - - - - - 0x01345C 04:944C: A5 01
	ORA #$08					;C - - - - - 0x01345E 04:944E: 09 08
	STA scratch1				;C - - - - - 0x013460 04:9450: 85 01
CODE_099452:
	LDY scratch1				;C - - - - - 0x013462 04:9452: A4 01
	LDA HomingAngleTable,Y			;C - - - - - 0x013464 04:9454: B9 8E BE
	STA newHomingAngle				;C - - - - - 0x013467 04:9457: 8D CB 04
	RTS							;C - - - - - 0x01346A 04:945A: 60

CODE_09945B:
	LDA #164					;C - - - - - 0x01346B 04:945B: A9 A4
	CMP objY+OSLOT_PROJ,X				;C - - - - - 0x01346D 04:945D: DD 8C 05
	BCS CODE_099489				;C - - - - - 0x013470 04:9460: B0 27
		;Cap Y and invert VSpeed
		STA objY+OSLOT_PROJ,X				;C - - - - - 0x013472 04:9462: 9D 8C 05

		LDA projVSpeed,X				;C - - - - - 0x013475 04:9465: BD 35 05
		EOR #$FF					;C - - - - - 0x013478 04:9468: 49 FF
		CLC							;C - - - - - 0x01347A 04:946A: 18
		ADC #$01					;C - - - - - 0x01347B 04:946B: 69 01
		STA projVSpeed,X				;C - - - - - 0x01347D 04:946D: 9D 35 05

		LDA #snBall_ID					;C - - - - - 0x013480 04:9470: A9 25
		STA a:soundTrigger				;C - - - - - 0x013482 04:9472: 8D E1 00
		LDA #$00					;C - - - - - 0x013485 04:9475: A9 00
		STA enemyReward+4				;C - - - - - 0x013487 04:9477: 85 92
		STA projCounter,X				;C - - - - - 0x013489 04:9479: 9D 1D 05
		LDY #$01					;C - - - - - 0x01348C 04:947C: A0 01
		LDA objX+OSLOT_PROJ,X				;C - - - - - 0x01348E 04:947E: BD B4 05
		CMP #128					;C - - - - - 0x013491 04:9481: C9 80
		BCC CODE_099487				;C - - - - - 0x013493 04:9483: 90 02
			LDY #$02					;C - - - - - 0x013495 04:9485: A0 02
	CODE_099487:
		STY enemyReward+5				;C - - - - - 0x013497 04:9487: 84 93
CODE_099489:
	LDA objY+OSLOT_PROJ,X				;C - - - - - 0x013499 04:9489: BD 8C 05
	CMP #7					;C - - - - - 0x01349C 04:948C: C9 07
	BCS CODE_099499				;C - - - - - 0x01349E 04:948E: B0 09
		;Unreached
		;Invert VSpeed
		LDA #$00					;- - - - - - 0x0134A0 04:9490: A9
		SEC							;- - - - - - 0x0134A2 04:9492: 38
		SBC projVSpeed,X				;- - - - - - 0x0134A3 04:9493: FD
		STA projVSpeed,X				;- - - - - - 0x0134A6 04:9496: 9D
CODE_099499:
	LDA globalTimer				;C - - - - - 0x0134A9 04:9499: A5 14
	AND #$02					;C - - - - - 0x0134AB 04:949B: 29 02
	BEQ CODE_0994B1				;C - - - - - 0x0134AD 04:949D: F0 12
		INC projVSpeed,X				;C - - - - - 0x0134AF 04:949F: FE 35 05
		BPL CODE_0994A7				;C - - - - - 0x0134B2 04:94A2: 10 03
			JMP CODE_0994ED				;C - - - - - 0x0134B4 04:94A4: 4C ED 94
	CODE_0994A7:
		LDA #$07					;C - - - - - 0x0134B7 04:94A7: A9 07
		CMP projVSpeed,X				;C - - - - - 0x0134B9 04:94A9: DD 35 05
		BCS CODE_0994B1				;C - - - - - 0x0134BC 04:94AC: B0 03
			STA projVSpeed,X				;C - - - - - 0x0134BE 04:94AE: 9D 35 05
CODE_0994B1:
	LDY #$00					;C - - - - - 0x0134C1 04:94B1: A0 00
	JSR CODE_09956F				;C - - - - - 0x0134C3 04:94B3: 20 6F 95
	LDA scratch0				;C - - - - - 0x0134C6 04:94B6: A5 00
	BEQ CODE_0994ED				;C - - - - - 0x0134C8 04:94B8: F0 33

	LDA #snBall_ID					;C - - - - - 0x0134CA 04:94BA: A9 25
	STA a:soundTrigger			;C - - - - - 0x0134CC 04:94BC: 8D E1 00
	LDA enemyHits+4				;C - - - - - 0x0134CF 04:94BF: AD C2 04
	BEQ CODE_0994ED				;C - - - - - 0x0134D2 04:94C2: F0 29

	LDA #snEnemyThrow_ID					;C - - - - - 0x0134D4 04:94C4: A9 26
	STA a:soundTrigger			;C - - - - - 0x0134D6 04:94C6: 8D E1 00
	LDA enemyReward+1				;C - - - - - 0x0134D9 04:94C9: A5 8F
	CMP #$03					;C - - - - - 0x0134DB 04:94CB: C9 03
	BEQ CODE_0994E3				;C - - - - - 0x0134DD 04:94CD: F0 14
		LDA projHSpeed,X				;C - - - - - 0x0134DF 04:94CF: BD 2D 05
		CLC							;C - - - - - 0x0134E2 04:94D2: 18
		ADC #$03					;C - - - - - 0x0134E3 04:94D3: 69 03
		BMI CODE_0994DD				;C - - - - - 0x0134E5 04:94D5: 30 06
		CMP #$06					;C - - - - - 0x0134E7 04:94D7: C9 06
		BCC CODE_0994DD				;C - - - - - 0x0134E9 04:94D9: 90 02
		LDA #$06					;C - - - - - 0x0134EB 04:94DB: A9 06
	CODE_0994DD:
		STA projHSpeed,X				;C - - - - - 0x0134ED 04:94DD: 9D 2D 05
		JMP CODE_0994ED				;C - - - - - 0x0134F0 04:94E0: 4C ED 94
CODE_0994E3:
	LDA #-8					;C - - - - - 0x0134F3 04:94E3: A9 F8
	STA projVSpeed,X				;C - - - - - 0x0134F5 04:94E5: 9D 35 05
	LDA #0					;C - - - - - 0x0134F8 04:94E8: A9 00
	STA projHSpeed,X				;C - - - - - 0x0134FA 04:94EA: 9D 2D 05
CODE_0994ED:
	LDY #$01					;C - - - - - 0x0134FD 04:94ED: A0 01
	JSR CODE_09956F				;C - - - - - 0x0134FF 04:94EF: 20 6F 95
	LDA scratch0				;C - - - - - 0x013502 04:94F2: A5 00
	BEQ CODE_099524				;C - - - - - 0x013504 04:94F4: F0 2E

	LDA #snEnemyThrow_ID					;C - - - - - 0x013506 04:94F6: A9 26
	STA a:soundTrigger				;C - - - - - 0x013508 04:94F8: 8D E1 00
	LDA enemyHits+5				;C - - - - - 0x01350B 04:94FB: AD C3 04
	BEQ CODE_099524				;C - - - - - 0x01350E 04:94FE: F0 24

	LDA enemyReward+1				;C - - - - - 0x013510 04:9500: A5 8F
	CMP #$03					;C - - - - - 0x013512 04:9502: C9 03
	BEQ CODE_09951A				;C - - - - - 0x013514 04:9504: F0 14
		LDA projHSpeed,X				;C - - - - - 0x013516 04:9506: BD 2D 05
		SEC							;C - - - - - 0x013519 04:9509: 38
		SBC #3					;C - - - - - 0x01351A 04:950A: E9 03
		BPL CODE_099514				;C - - - - - 0x01351C 04:950C: 10 06
		CMP #-6					;C - - - - - 0x01351E 04:950E: C9 FA
		BCS CODE_099514				;C - - - - - 0x013520 04:9510: B0 02
			;Unreached
			LDA #-6					;- - - - - - 0x013522 04:9512: A9
	CODE_099514:
		STA projHSpeed,X				;C - - - - - 0x013524 04:9514: 9D 2D 05
		JMP CODE_099524				;C - - - - - 0x013527 04:9517: 4C 24 95
CODE_09951A:
	LDA #-8					;C - - - - - 0x01352A 04:951A: A9 F8
	STA projVSpeed,X				;C - - - - - 0x01352C 04:951C: 9D 35 05
	LDA #0					;C - - - - - 0x01352F 04:951F: A9 00
	STA projHSpeed,X				;C - - - - - 0x013531 04:9521: 9D 2D 05
CODE_099524:
	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x013534 04:9524: BD B4 05
	CMP #17					;C - - - - - 0x013537 04:9527: C9 11
	BCC CODE_09952F				;C - - - - - 0x013539 04:9529: 90 04
	CMP #-16					;C - - - - - 0x01353B 04:952B: C9 F0
	BCC CODE_09956B				;C - - - - - 0x01353D 04:952D: 90 3C
CODE_09952F:
	LDA ram_00B5				;C - - - - - 0x01353F 04:952F: A5 B5
	BEQ CODE_09953B				;C - - - - - 0x013541 04:9531: F0 08
		LDA #$00					;C - - - - - 0x013543 04:9533: A9 00
		STA objState+OSLOT_PROJ,X				;C - - - - - 0x013545 04:9535: 9D 64 05
		JMP CODE_09956B				;C - - - - - 0x013548 04:9538: 4C 6B 95
CODE_09953B:
	LDA enemyReward+1				;C - - - - - 0x01354B 04:953B: A5 8F
	CMP #$03					;C - - - - - 0x01354D 04:953D: C9 03
	BEQ CODE_09954C				;C - - - - - 0x01354F 04:953F: F0 0B
		LDA #$00					;C - - - - - 0x013551 04:9541: A9 00
		STA objState+OSLOT_PROJ,X				;C - - - - - 0x013553 04:9543: 9D 64 05
		JSR CODE_09962A				;C - - - - - 0x013556 04:9546: 20 2A 96
		JMP CODE_09956B				;C - - - - - 0x013559 04:9549: 4C 6B 95
CODE_09954C:
	LDA projHSpeed,X				;C - - - - - 0x01355C 04:954C: BD 2D 05
	BPL CODE_09955B				;C - - - - - 0x01355F 04:954F: 10 0A
		LDA objX+OSLOT_PROJ,X				;C - - - - - 0x013561 04:9551: BD B4 05
		CMP #128					;C - - - - - 0x013564 04:9554: C9 80
		BCS CODE_09956E				;C - - - - - 0x013566 04:9556: B0 16
			JMP CODE_099562				;C - - - - - 0x013568 04:9558: 4C 62 95
CODE_09955B:
	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x01356B 04:955B: BD B4 05
	CMP #128					;C - - - - - 0x01356E 04:955E: C9 80
	BCC CODE_09956E				;C - - - - - 0x013570 04:9560: 90 0C
CODE_099562:
	LDA #$00					;C - - - - - 0x013572 04:9562: A9 00
	SEC							;C - - - - - 0x013574 04:9564: 38
	SBC projHSpeed,X				;C - - - - - 0x013575 04:9565: FD 2D 05
	STA projHSpeed,X				;C - - - - - 0x013578 04:9568: 9D 2D 05
CODE_09956B:
	JSR CODE_099667				;C - - - - - 0x01357B 04:956B: 20 67 96
CODE_09956E:
	RTS							;C - - - - - 0x01357E 04:956E: 60

CODE_09956F:
	LDA objY+OSLOT_BUBBLE+10,X				;C - - - - - 0x01357F 04:956F: BD A9 05
	BEQ CODE_09957A				;C - - - - - 0x013582 04:9572: F0 06
		DEC objY+OSLOT_BUBBLE+10,X				;C - - - - - 0x013584 04:9574: DE A9 05
		JMP CODE_0995FC				;C - - - - - 0x013587 04:9577: 4C FC 95
CODE_09957A:
	JSR CODE_099632				;C - - - - - 0x01358A 04:957A: 20 32 96
	BCS CODE_099582				;C - - - - - 0x01358D 04:957D: B0 03
		JMP CODE_0995FC				;C - - - - - 0x01358F 04:957F: 4C FC 95
CODE_099582:
	CPY enemyReward+3				;C - - - - - 0x013592 04:9582: C4 91
	BEQ CODE_09958A				;C - - - - - 0x013594 04:9584: F0 04
		LDA #$00					;C - - - - - 0x013596 04:9586: A9 00
		STA enemyReward+4				;C - - - - - 0x013598 04:9588: 85 92
CODE_09958A:
	LDA enemyReward+1				;C - - - - - 0x01359A 04:958A: A5 8F
	CMP #$03					;C - - - - - 0x01359C 04:958C: C9 03
	BNE CODE_099597				;C - - - - - 0x01359E 04:958E: D0 07
		LDA #$00					;C - - - - - 0x0135A0 04:9590: A9 00
		STA projCounter,X				;C - - - - - 0x0135A2 04:9592: 9D 1D 05
		STA enemyReward+4				;C - - - - - 0x0135A5 04:9595: 85 92
CODE_099597:
	TYA							;C - - - - - 0x0135A7 04:9597: 98
	CMP objChrSlot+OSLOT_BUBBLE,X				;C - - - - - 0x0135A8 04:9598: DD 3F 06
	BEQ CODE_0995A1				;C - - - - - 0x0135AB 04:959B: F0 04
		LDA #$00					;C - - - - - 0x0135AD 04:959D: A9 00
		STA enemyReward+2				;C - - - - - 0x0135AF 04:959F: 85 90
CODE_0995A1:
	TYA							;C - - - - - 0x0135B1 04:95A1: 98
	STA objChrSlot+OSLOT_BUBBLE,X				;C - - - - - 0x0135B2 04:95A2: 9D 3F 06
	LDY enemyReward+4				;C - - - - - 0x0135B5 04:95A5: A4 92
	INC enemyReward+2				;C - - - - - 0x0135B7 04:95A7: E6 90
	LDA enemyReward+2				;C - - - - - 0x0135B9 04:95A9: A5 90
	CMP DATA_099601,Y			;C - - - - - 0x0135BB 04:95AB: D9 01 96
	BCC CODE_0995B3				;C - - - - - 0x0135BE 04:95AE: 90 03
		JSR CODE_09962A				;C - - - - - 0x0135C0 04:95B0: 20 2A 96
CODE_0995B3:
	LDA objChrSlot+OSLOT_BUBBLE,X				;C - - - - - 0x0135C3 04:95B3: BD 3F 06
	TAY							;C - - - - - 0x0135C6 04:95B6: A8
	LDA enemyHits+4,Y				;C - - - - - 0x0135C7 04:95B7: B9 C2 04
	BEQ CODE_0995C4				;C - - - - - 0x0135CA 04:95BA: F0 08
	LDA objX+OSLOT_BUBBLE,Y				;C - - - - - 0x0135CC 04:95BC: B9 C7 05
	BEQ CODE_0995C4				;C - - - - - 0x0135CF 04:95BF: F0 03
		;Unreached
		JMP CODE_099603				;- - - - - - 0x0135D1 04:95C1: 4C
CODE_0995C4:
	LDA #$08					;C - - - - - 0x0135D4 04:95C4: A9 08
	STA objY+OSLOT_BUBBLE+10,X				;C - - - - - 0x0135D6 04:95C6: 9D A9 05
	LDA projVSpeed,X				;C - - - - - 0x0135D9 04:95C9: BD 35 05
	STA scratch0				;C - - - - - 0x0135DC 04:95CC: 85 00
	BPL CODE_0995D4				;C - - - - - 0x0135DE 04:95CE: 10 04
		LDA #$00					;C - - - - - 0x0135E0 04:95D0: A9 00
		STA scratch0				;C - - - - - 0x0135E2 04:95D2: 85 00
CODE_0995D4:
	LDA bubbleProgress+2,Y				;C - - - - - 0x0135E4 04:95D4: B9 D7 04
	SEC							;C - - - - - 0x0135E7 04:95D7: 38
	SBC scratch0				;C - - - - - 0x0135E8 04:95D8: E5 00
	STA projVSpeed,X				;C - - - - - 0x0135EA 04:95DA: 9D 35 05
	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x0135ED 04:95DD: BD B4 05
	SEC							;C - - - - - 0x0135F0 04:95E0: 38
	SBC objX+OSLOT_ENEMY,Y				;C - - - - - 0x0135F1 04:95E1: F9 BC 05
	STA scratch0				;C - - - - - 0x0135F4 04:95E4: 85 00
	LSR							;C - - - - - 0x0135F6 04:95E6: 4A
	LSR							;C - - - - - 0x0135F7 04:95E7: 4A
	STA projHSpeed,X				;C - - - - - 0x0135F8 04:95E8: 9D 2D 05
	LDA scratch0				;C - - - - - 0x0135FB 04:95EB: A5 00
	BPL CODE_0995F7				;C - - - - - 0x0135FD 04:95ED: 10 08
		LDA projHSpeed,X				;C - - - - - 0x0135FF 04:95EF: BD 2D 05
		ORA #$C0					;C - - - - - 0x013602 04:95F2: 09 C0
		STA projHSpeed,X				;C - - - - - 0x013604 04:95F4: 9D 2D 05
CODE_0995F7:
	LDA #$01					;C - - - - - 0x013607 04:95F7: A9 01
	JMP CODE_0995FE				;C - - - - - 0x013609 04:95F9: 4C FE 95
CODE_0995FC:
	LDA #$00					;C - - - - - 0x01360C 04:95FC: A9 00
CODE_0995FE:
	STA scratch0				;C - - - - - 0x01360E 04:95FE: 85 00
	RTS							;C - - - - - 0x013610 04:9600: 60

DATA_099601:
	.byte $04					;- D 0 - - - 0x013611 04:9601: 04
	.byte $02					;- D 0 - - - 0x013612 04:9602: 02

CODE_099603:
	;Unreached
	LDA #snEnemyThrow_ID					;- - - - - - 0x013613 04:9603: A9
	STA a:soundTrigger			;- - - - - - 0x013615 04:9605: 8D
	LDA #$04					;- - - - - - 0x013618 04:9608: A9
	STA objY+OSLOT_BUBBLE+10,X				;- - - - - - 0x01361A 04:960A: 9D
	LDA #$09					;- - - - - - 0x01361D 04:960D: A9
	STA projHSpeed,X				;- - - - - - 0x01361F 04:960F: 9D
	LDA #$02					;- - - - - - 0x013622 04:9612: A9
	STA projVSpeed,X				;- - - - - - 0x013624 04:9614: 9D
	LDA enemyHits+2,Y				;- - - - - - 0x013627 04:9617: B9
	BNE CODE_099625				;- - - - - - 0x01362A 04:961A: D0
		LDA #$00					;- - - - - - 0x01362C 04:961C: A9
		SEC							;- - - - - - 0x01362E 04:961E: 38
		SBC projHSpeed,X				;- - - - - - 0x01362F 04:961F: FD
		STA projHSpeed,X				;- - - - - - 0x013632 04:9622: 9D
CODE_099625:
	LDA #$00					;- - - - - - 0x013635 04:9625: A9
	STA scratch0				;- - - - - - 0x013637 04:9627: 85
	RTS							;- - - - - - 0x013639 04:9629: 60

CODE_09962A:
	LDA objChrSlot+OSLOT_BUBBLE,X				;C - - - - - 0x01363A 04:962A: BD 3F 06
	STA enemyReward+5				;C - - - - - 0x01363D 04:962D: 85 93
	INC enemyReward+5				;C - - - - - 0x01363F 04:962F: E6 93
	RTS							;C - - - - - 0x013641 04:9631: 60

CODE_099632:
	;X: Projectile index
	;Y: Enemy index
	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x013642 04:9632: BD B4 05
	SEC							;C - - - - - 0x013645 04:9635: 38
	SBC objX+OSLOT_ENEMY,Y				;C - - - - - 0x013646 04:9636: F9 BC 05
	BCS @poshdist				;C - - - - - 0x013649 04:9639: B0 09
		EOR #$FF					;C - - - - - 0x01364B 04:963B: 49 FF
		STA scratch4				;C - - - - - 0x01364D 04:963D: 85 04
		INC scratch4				;C - - - - - 0x01364F 04:963F: E6 04
		JMP @havehdist				;C - - - - - 0x013651 04:9641: 4C 46 96
@poshdist:
	STA scratch4				;C - - - - - 0x013654 04:9644: 85 04
@havehdist:
	LDA #14					;C - - - - - 0x013656 04:9646: A9 0E
	CMP scratch4				;C - - - - - 0x013658 04:9648: C5 04
	BCC @end				;C - - - - - 0x01365A 04:964A: 90 1A
		LDA objY+OSLOT_PROJ,X				;C - - - - - 0x01365C 04:964C: BD 8C 05
		SEC							;C - - - - - 0x01365F 04:964F: 38
		SBC objY+OSLOT_ENEMY,Y				;C - - - - - 0x013660 04:9650: F9 94 05
		BCS @posvdist				;C - - - - - 0x013663 04:9653: B0 09
			EOR #$FF					;C - - - - - 0x013665 04:9655: 49 FF
			STA scratch5				;C - - - - - 0x013667 04:9657: 85 05
			INC scratch5				;C - - - - - 0x013669 04:9659: E6 05
			JMP @havevdist				;C - - - - - 0x01366B 04:965B: 4C 60 96
	@posvdist:
		STA scratch5				;C - - - - - 0x01366E 04:965E: 85 05
	@havevdist:
		LDA #14					;C - - - - - 0x013670 04:9660: A9 0E
		CMP scratch5				;C - - - - - 0x013672 04:9662: C5 05
		BCC @end				;C - - - - - 0x013674 04:9664: 90 00
@end:
	;04: HDist
	;05: VDist (only if HDist was low enough)
	;Carry: 1 if collision
	RTS							;C - - - - - 0x013676 04:9666: 60

CODE_099667:
	LDA enemyReward+1				;C - - - - - 0x013677 04:9667: A5 8F
	CMP #$01					;C - - - - - 0x013679 04:9669: C9 01
	BNE CODE_099697				;C - - - - - 0x01367B 04:966B: D0 2A

	LDA objY+OSLOT_PROJ,X				;C - - - - - 0x01367D 04:966D: BD 8C 05
	CMP #$8C					;C - - - - - 0x013680 04:9670: C9 8C
	BCC CODE_099697				;C - - - - - 0x013682 04:9672: 90 23

	LDA objX+OSLOT_PROJ,X				;C - - - - - 0x013684 04:9674: BD B4 05
	CMP #$89					;C - - - - - 0x013687 04:9677: C9 89
	BCS CODE_099697				;C - - - - - 0x013689 04:9679: B0 1C

	CMP #$78					;C - - - - - 0x01368B 04:967B: C9 78
	BCC CODE_099697				;C - - - - - 0x01368D 04:967D: 90 18

	LDA projHSpeed,X				;C - - - - - 0x01368F 04:967F: BD 2D 05
	BPL CODE_099689				;C - - - - - 0x013692 04:9682: 10 05
		LDA #$89					;C - - - - - 0x013694 04:9684: A9 89
		JMP CODE_09968B				;C - - - - - 0x013696 04:9686: 4C 8B 96
CODE_099689:
	LDA #$78					;C - - - - - 0x013699 04:9689: A9 78
CODE_09968B:
	STA objX+OSLOT_PROJ,X				;C - - - - - 0x01369B 04:968B: 9D B4 05
	LDA #$00					;C - - - - - 0x01369E 04:968E: A9 00
	SEC							;C - - - - - 0x0136A0 04:9690: 38
	SBC projHSpeed,X				;C - - - - - 0x0136A1 04:9691: FD 2D 05
	STA projHSpeed,X				;C - - - - - 0x0136A4 04:9694: 9D 2D 05
CODE_099697:
	RTS							;C - - - - - 0x0136A7 04:9697: 60

ProjOpHandlers:
	;- - - - - - 0x0136A8 04:9698: 24
	.word ProjOp_Break					;00 Hang
	.word ProjOp_Type					;01 xx Set state (proj ID)
	.word ProjOp_NextType				;02 Inc state (proj ID)
	.word ProjOp_HSpeed					;03 xx Set HSpeed
	.word ProjOp_VSpeed					;04 xx Set VSpeed
	.word ProjOp_Speed					;05 xx yy Set HSpeed & VSpeed
	.word ProjOp_Angle					;06 xx (UNUSED) Set $05 and homingAngle to xx (used by opcode 1D)
	.word ProjOp_GetPlayerContact		;07 Get 01 if colliding with player
	.word ProjOp_GetOffscreen			;08 Get 01 if near edge of screen
	.word ProjOp_Anim					;09 xxxx Start anim
	.word ProjOp_Despawn				;0A Despawn
	.word ProjOp_End					;0B End (proceed to move using HSpeed and VSpeed, usually re-run the same script from the beginning on next update)
	.word ProjOp_GetParentDir			;0C Get shooter dir
	.word ProjOp_Jump					;0D xxxx Jump
	.word ProjOp_JumpCount				;0E xx yyyy Inc counter and jump to yyyy if it has reached xx
	.word ProjOp_HTurn					;0F Invert HSpeed
	.word ProjOp_VTurn					;10 Invert VSpeed
	.word ProjOp_Gravity				;11 xx Apply gravity. Inc VSpeed, stopping at xx (must be positive)
	.word ProjOp_ParentState			;12 xx Set shooter state
	.word ProjOp_GetParentState			;13 Get shooter state
	.word ProjOp_JumpEqual				;14 xx yy zzzz Jump to zzzz if RAM 00xx = yy
	.word ProjOp_JumpNotEqual			;15 xx yy zzzz Jump to zzzz if RAM 00xx != yy
	.word ProjOp_Set					;16 xx yy Set RAM 00xx to yy
	.word ProjOp_HomingPlayer			;17 Get homing direction towards player (clockwise 0-15)
	.word ProjOp_HomingEnemy			;18 xx Target enemy with homing, enemy index from RAM 00xx
	.word ProjOp_GetCount				;19 Get counter (also takes next byte to read RAM 00xx but never does that. Do not place an operand)
	.word ProjOp_GetPlayerDist			;1A Get HDist and VDist to player in $04 and $05
	.word ProjOp_MultiProj				;1B xx Spawn multiple projectiles (such as Roc lightning circle), variant xx
	.word ProjOp_GetEnemyReached		;1C Get HDist to enemy (index from $05) to $04. If HDist and VDist meant collision, get 1 to $05 (otherwise 0).
	.word ProjOp_HomingTurn				;1D Turn towards new homing direction
	.word ProjOp_WideScroll				;1E (UNUSED) Adjust X by 4px if wide round BG just scrolled
	.word ProjOp_NOP					;1F No operation
	.word ProjOp_ApplyAngle				;20 Translate direction (clockwise 0-15) from $05 to HSpeed and VSpeed
	.word ProjOp_Copy					;21 xx yy Copy value from RAM 00xx to 00yy
	.word ProjOp_HurtPlayer				;22 Set player dmg type 80 (enemy)
	.word ProjOp_CatchPlayer			;23 Set player dmg type C0 (stuck) (Needler)
	.word ProjOp_JumpNotLarger			;24 xx yy zzzz Jump to zzzz if RAM 00xx <= yy
	.word ProjOp_JumpLarger				;25 xx yy zzzz Jump to zzzz if RAM 00xx > yy
	.word ProjOp_GetPos					;26 Get X and Y to $04 and $05
	.word ProjOp_Count					;27 xx Set counter
	.word ProjOp_Terrain				;28 Check terrain collision (non-zero value in $04 if colliding with wall or floor)
	.word ProjOp_GetParent				;29 Get shooter
	.word ProjOp_JumpFrame				;2A xx yyyy Jump to yyyy if any of xx bits set in global timer
	.word ProjOp_GetSpeed				;2B Get HSpeed and VSpeed to $04 and $05
	.word ProjOp_ParentAnim				;2C xxxx Set shooter anim
	.word ProjOp_CopyPlayerState		;2D xx Player state to RAM 00xx
	.word ProjOp_MissileAnim			;2E Use homing angle in $05 (0-15 becomes 0-7) to start missile anim
	.word ProjOp_Slow					;2F Slow down HSpeed by 1 in current direction, stopping at zero
	.word ProjOp_Sound					;30 xx Play sound
	.word ProjOp_CountType				;31 xx Count how many projectiles of type xx are spawned
	.word ProjOp_TractorMissile			;32 xx yy Spawn Missile Tractor missile with HSpeed xx and VSpeed yy
	.word ProjOp_AdjustHits				;33 xx yy Adjust enemy (index from RAM 00xx) hits by yy
	.word ProjOp_WarpParent				;34 Warp to shooter X, Y
	.word ProjOp_BonusBall				;35 Bonus ball update (bouncing)
	.word ProjOp_DespawnAll				;36 Despawn all projectiles
	.word ProjOp_Parent					;37 xx Set shooter
	.word ProjOp_GetPlayerSide			;38 Get 1 to $04 if X >= player X, 0 otherwise. Same for $05 and Y
	.word ProjOp_PlayerState			;39 xx Set player state
	.word ProjOp_Heart					;3A Add player heart
.ifndef REGION_JP
	.word ProjOp_GetParentHits			;3B (UNUSED) Get hit count from parent
.endif

RoundUpdate:
	LDA ram_04D1				;C - - - - - 0x013720 04:9710: AD D1 04
	BEQ CODE_099728				;C - - - - - 0x013723 04:9713: F0 13
		LDA #.LOBYTE(CODE_078247)					;C - - - - - 0x013725 04:9715: A9 47
		STA bankedSub				;C - - - - - 0x013727 04:9717: 85 55
		LDA #.HIBYTE(CODE_078247)					;C - - - - - 0x013729 04:9719: A9 82
		STA bankedSub+1				;C - - - - - 0x01372B 04:971B: 85 56
		LDA #.BANK(CODE_078247)					;C - - - - - 0x01372D 04:971D: A9 07
		STA bankedSubBank				;C - - - - - 0x01372F 04:971F: 85 57
		LDA #.BANK(*)					;C - - - - - 0x013731 04:9721: A9 09
		STA bankedSubRetBank				;C - - - - - 0x013733 04:9723: 85 58
		JSR RunBankedSub				;C - - - - - 0x013735 04:9725: 20 72 E7
CODE_099728:
	LDA #.LOBYTE(CODE_058E83)					;C - - - - - 0x013738 04:9728: A9 83
	STA bankedSub				;C - - - - - 0x01373A 04:972A: 85 55
	LDA #.HIBYTE(CODE_058E83)					;C - - - - - 0x01373C 04:972C: A9 8E
	STA bankedSub+1				;C - - - - - 0x01373E 04:972E: 85 56
	LDA #.BANK(CODE_058E83)					;C - - - - - 0x013740 04:9730: A9 05
	STA bankedSubBank				;C - - - - - 0x013742 04:9732: 85 57
	LDA #.BANK(*)					;C - - - - - 0x013744 04:9734: A9 09
	STA bankedSubRetBank				;C - - - - - 0x013746 04:9736: 85 58
	JSR RunBankedSub				;C - - - - - 0x013748 04:9738: 20 72 E7

	LDA globalTimer				;C - - - - - 0x01374B 04:973B: A5 14
	AND #$01					;C - - - - - 0x01374D 04:973D: 29 01
	BEQ CODE_099750				;C - - - - - 0x01374F 04:973F: F0 0F
		JSR BubblesTravelUpdate				;C - - - - - 0x013751 04:9741: 20 9A 9D
		JSR HandleShooting				;C - - - - - 0x013754 04:9744: 20 EF 8A
		JSR UpdateBubbles				;C - - - - - 0x013757 04:9747: 20 00 80
		JSR AnimateObjects				;C - - - - - 0x01375A 04:974A: 20 1E ED
		JMP CODE_099785				;C - - - - - 0x01375D 04:974D: 4C 85 97
CODE_099750:
	JSR PlayerCheckEnemyCollision				;C - - - - - 0x013760 04:9750: 20 1A FB
	INC ram_04AA				;C - - - - - 0x013763 04:9753: EE AA 04

	LDA #.LOBYTE(CODE_0B81B6)					;C - - - - - 0x013766 04:9756: A9 B6
	STA bankedSub				;C - - - - - 0x013768 04:9758: 85 55
	LDA #.HIBYTE(CODE_0B81B6)					;C - - - - - 0x01376A 04:975A: A9 81
	STA bankedSub+1				;C - - - - - 0x01376C 04:975C: 85 56
	LDA #.BANK(CODE_0B81B6)					;C - - - - - 0x01376E 04:975E: A9 0B
	STA bankedSubBank				;C - - - - - 0x013770 04:9760: 85 57
	LDA #.BANK(*)					;C - - - - - 0x013772 04:9762: A9 09
	STA bankedSubRetBank				;C - - - - - 0x013774 04:9764: 85 58
	JSR RunBankedSub				;C - - - - - 0x013776 04:9766: 20 72 E7

	JSR CODE_0FFD89				;C - - - - - 0x013779 04:9769: 20 89 FD
	JSR UpdateProjectiles				;C - - - - - 0x01377C 04:976C: 20 81 8D

	LDA #.LOBYTE(CODE_078916)					;C - - - - - 0x01377F 04:976F: A9 16
	STA bankedSub				;C - - - - - 0x013781 04:9771: 85 55
	LDA #.HIBYTE(CODE_078916)					;C - - - - - 0x013783 04:9773: A9 89
	STA bankedSub+1				;C - - - - - 0x013785 04:9775: 85 56
	LDA #.BANK(CODE_078916)					;C - - - - - 0x013787 04:9777: A9 07
	STA bankedSubBank				;C - - - - - 0x013789 04:9779: 85 57
	LDA #.BANK(*)					;C - - - - - 0x01378B 04:977B: A9 09
	STA bankedSubRetBank				;C - - - - - 0x01378D 04:977D: 85 58
	JSR RunBankedSub				;C - - - - - 0x01378F 04:977F: 20 72 E7

	JSR AnimateNonBubbles				;C - - - - - 0x013792 04:9782: 20 5C EE
CODE_099785:
	LDA objState				;C - - - - - 0x013795 04:9785: AD 63 05
	STA scratch6				;C - - - - - 0x013798 04:9788: 85 06
	LDA playerInvFrames				;C - - - - - 0x01379A 04:978A: AD 77 04
	AND #$02					;C - - - - - 0x01379D 04:978D: 29 02
	BEQ CODE_099796				;C - - - - - 0x01379F 04:978F: F0 05
		LDA #$00					;C - - - - - 0x0137A1 04:9791: A9 00
		STA objState				;C - - - - - 0x0137A3 04:9793: 8D 63 05
CODE_099796:
	JSR DrawObjects				;C - - - - - 0x0137A6 04:9796: 20 E2 EE
	LDA scratch6				;C - - - - - 0x0137A9 04:9799: A5 06
	STA objState				;C - - - - - 0x0137AB 04:979B: 8D 63 05
	LDA #.HIBYTE(@bganimret-1)					;C - - - - - 0x0137AE 04:979E: A9 97
	PHA							;C - - - - - 0x0137B0 04:97A0: 48
	LDA #.LOBYTE(@bganimret-1)					;C - - - - - 0x0137B1 04:97A1: A9 A6
	PHA							;C - - - - - 0x0137B3 04:97A3: 48
	JMP (roundAnimSub)				;C - - - - - 0x0137B4 04:97A4: 6C 59 00
@bganimret:
	JSR CODE_099D3B				;C - - - - - 0x0137B7 04:97A7: 20 3B 9D
	JSR CODE_099BE7				;C - - - - - 0x0137BA 04:97AA: 20 E7 9B
	JSR CheckPause				;C - - - - - 0x0137BD 04:97AD: 20 58 9A
	LDA playerState				;C - - - - - 0x0137C0 04:97B0: A5 75
	CMP #PLAYER_STATE_DEAD		;C - - - - - 0x0137C2 04:97B2: C9 03
	BNE CODE_0997B9				;C - - - - - 0x0137C4 04:97B4: D0 03
		JMP CODE_09983C				;C - - - - - 0x0137C6 04:97B6: 4C 3C 98
CODE_0997B9:
	LDA roundFlags				;C - - - - - 0x0137C9 04:97B9: AD 71 04
	AND #$20					;C - - - - - 0x0137CC 04:97BC: 29 20
	BEQ CODE_0997C6				;C - - - - - 0x0137CE 04:97BE: F0 06
		JSR CODE_09983D				;C - - - - - 0x0137D0 04:97C0: 20 3D 98
		JMP CODE_09983C				;C - - - - - 0x0137D3 04:97C3: 4C 3C 98
CODE_0997C6:
	LDA playerLives				;C - - - - - 0x0137D6 04:97C6: AD 79 04
	BNE CODE_099819				;C - - - - - 0x0137D9 04:97C9: D0 4E

	LDA playerState				;C - - - - - 0x0137DB 04:97CB: A5 75
	BNE CODE_099819				;C - - - - - 0x0137DD 04:97CD: D0 4A

	JSR CODE_0FEC8C				;C - - - - - 0x0137DF 04:97CF: 20 8C EC
	LDA #.BANK(CODE_058B5A)					;C - - - - - 0x0137E2 04:97D2: A9 05
	STA nmiPrgBankA				;C - - - - - 0x0137E4 04:97D4: 85 51
	LDA #snSilence_ID					;C - - - - - 0x0137E6 04:97D6: A9 00
	STA a:soundTrigger				;C - - - - - 0x0137E8 04:97D8: 8D E1 00

	LDA #.LOBYTE(ColorBufferToVRAM)	;C - - - - - 0x0137EB 04:97DB: A9 8A
	STA nmiUnbankedSub				;C - - - - - 0x0137ED 04:97DD: 85 35
	LDA #.HIBYTE(ColorBufferToVRAM)	;C - - - - - 0x0137EF 04:97DF: A9 E3
	STA nmiUnbankedSub+1				;C - - - - - 0x0137F1 04:97E1: 85 36

	LDA #FADE_OUT					;C - - - - - 0x0137F3 04:97E3: A9 00
	STA fadeMode				;C - - - - - 0x0137F5 04:97E5: 8D 53 05
	LDA #$40					;C - - - - - 0x0137F8 04:97E8: A9 40
	STA fadeUnk0556				;C - - - - - 0x0137FA 04:97EA: 8D 56 05
	LDA #$03					;C - - - - - 0x0137FD 04:97ED: A9 03
	STA fadeSpeedMask				;C - - - - - 0x0137FF 04:97EF: 8D 57 05
	LDA #.LOBYTE(colorBuffer)				;C - - - - - 0x013802 04:97F2: A9 00
	STA fadeColorsAdr				;C - - - - - 0x013804 04:97F4: 8D 5A 05
	LDA #.HIBYTE(colorBuffer)				;C - - - - - 0x013807 04:97F7: A9 03
	STA fadeColorsAdr+1				;C - - - - - 0x013809 04:97F9: 8D 5B 05
	LDA #4					;C - - - - - 0x01380C 04:97FC: A9 04
	STA fadePasses				;C - - - - - 0x01380E 04:97FE: 8D 54 05
	LDA #32					;C - - - - - 0x013811 04:9801: A9 20
	STA fadeColorsAmount				;C - - - - - 0x013813 04:9803: 8D 55 05

	LDA #.LOBYTE(CODE_058B5A)	;C - - - - - 0x013816 04:9806: A9 5A
	STA updateSub				;C - - - - - 0x013818 04:9808: 85 19
	LDA #.HIBYTE(CODE_058B5A)	;C - - - - - 0x01381A 04:980A: A9 8B
	STA updateSub+1				;C - - - - - 0x01381C 04:980C: 85 1A

	LDA #.LOBYTE(RunColorFader)	;C - - - - - 0x01381E 04:980E: A9 50
	STA nmiBankedSub				;C - - - - - 0x013820 04:9810: 85 16
	LDA #.HIBYTE(RunColorFader)	;C - - - - - 0x013822 04:9812: A9 E8
	STA nmiBankedSub+1				;C - - - - - 0x013824 04:9814: 85 17

	JMP CODE_09983C				;C - - - - - 0x013826 04:9816: 4C 3C 98
CODE_099819:
	LDA roundFlags				;C - - - - - 0x013829 04:9819: AD 71 04
	AND #$10					;C - - - - - 0x01382C 04:981C: 29 10
	BEQ CODE_099826				;C - - - - - 0x01382E 04:981E: F0 06
	JSR CODE_09985D				;C - - - - - 0x013830 04:9820: 20 5D 98
	JMP CODE_09983C				;C - - - - - 0x013833 04:9823: 4C 3C 98
CODE_099826:
	LDA roundFlags				;C - - - - - 0x013836 04:9826: AD 71 04
	AND #$07					;C - - - - - 0x013839 04:9829: 29 07
	BEQ CODE_09983C				;C - - - - - 0x01383B 04:982B: F0 0F
		DEC roundFlags				;C - - - - - 0x01383D 04:982D: CE 71 04
		LDA #.BANK(CODE_089CEA)					;C - - - - - 0x013840 04:9830: A9 08
		STA nmiPrgBankA				;C - - - - - 0x013842 04:9832: 85 51

		LDA #.LOBYTE(CODE_089CEA)	;C - - - - - 0x013844 04:9834: A9 EA
		STA nmiBankedSub			;C - - - - - 0x013846 04:9836: 85 16
		LDA #.HIBYTE(CODE_089CEA)	;C - - - - - 0x013848 04:9838: A9 9C
		STA nmiBankedSub+1			;C - - - - - 0x01384A 04:983A: 85 17
CODE_09983C:
	RTS							;C - - - - - 0x01384C 04:983C: 60

CODE_09983D:
.ifndef REGION_JP
	LDA #$00					;C - - - - - 0x01384D 04:983D: A9 00
	STA a:jingleTrigger			;C - - - - - 0x01384F 04:983F: 8D E2 00
	STA roundPaused				;C - - - - - 0x013852 04:9842: 8D 74 04
.endif

	LDA #$03					;C - - - - - 0x013855 04:9845: A9 03
	STA scratch0				;C - - - - - 0x013857 04:9847: 85 00
	LDA #.LOBYTE(CODE_089E1A)	;C - - - - - 0x013859 04:9849: A9 1A
	STA bankedSub				;C - - - - - 0x01385B 04:984B: 85 55
	LDA #.HIBYTE(CODE_089E1A)					;C - - - - - 0x01385D 04:984D: A9 9E
	STA bankedSub+1				;C - - - - - 0x01385F 04:984F: 85 56
	LDA #.BANK(CODE_089E1A)					;C - - - - - 0x013861 04:9851: A9 08
	STA bankedSubBank				;C - - - - - 0x013863 04:9853: 85 57
	LDA #.BANK(*)					;C - - - - - 0x013865 04:9855: A9 09
	STA bankedSubRetBank				;C - - - - - 0x013867 04:9857: 85 58
	JSR RunBankedSub				;C - - - - - 0x013869 04:9859: 20 72 E7
	RTS							;C - - - - - 0x01386C 04:985C: 60

CODE_09985D:
	;Runs while dropping prizes after bonus game
	LDA roundFlags				;C - - - - - 0x01386D 04:985D: AD 71 04
	AND #$08					;C - - - - - 0x013870 04:9860: 29 08
	BNE CODE_099871				;C - - - - - 0x013872 04:9862: D0 0D
		LDA roundFlags				;C - - - - - 0x013874 04:9864: AD 71 04
		ORA #$08					;C - - - - - 0x013877 04:9867: 09 08
		STA roundFlags				;C - - - - - 0x013879 04:9869: 8D 71 04

		LDA #20					;C - - - - - 0x01387C 04:986C: A9 14
		STA roundNumberDuration				;C - - - - - 0x01387E 04:986E: 8D 73 04
CODE_099871:
	LDA globalTimer				;C - - - - - 0x013881 04:9871: A5 14
	AND #$01					;C - - - - - 0x013883 04:9873: 29 01
	BNE CODE_09989D				;C - - - - - 0x013885 04:9875: D0 26

	DEC roundNumberDuration				;C - - - - - 0x013887 04:9877: CE 73 04
	BNE CODE_09989D				;C - - - - - 0x01388A 04:987A: D0 21

	LDA roundFlags				;C - - - - - 0x01388C 04:987C: AD 71 04
	AND #$C0					;C - - - - - 0x01388F 04:987F: 29 C0
	BEQ CODE_099893				;C - - - - - 0x013891 04:9881: F0 10
		CMP ram_0472				;C - - - - - 0x013893 04:9883: CD 72 04
		BEQ CODE_099893				;C - - - - - 0x013896 04:9886: F0 0B
			STA ram_0472				;C - - - - - 0x013898 04:9888: 8D 72 04
			LDA #$C0					;C - - - - - 0x01389B 04:988B: A9 C0
			STA roundNumberDuration				;C - - - - - 0x01389D 04:988D: 8D 73 04
			JMP CODE_09989D				;C - - - - - 0x0138A0 04:9890: 4C 9D 98
CODE_099893:
	LDA #$09					;C - - - - - 0x0138A3 04:9893: A9 09
	STA roundFlags				;C - - - - - 0x0138A5 04:9895: 8D 71 04
	LDA #$00					;C - - - - - 0x0138A8 04:9898: A9 00
	STA roundPaused				;C - - - - - 0x0138AA 04:989A: 8D 74 04
CODE_09989D:
	RTS							;C - - - - - 0x0138AD 04:989D: 60

PickRoundAnimSub:
	LDA currentRound				;C - - - - - 0x0138AE 04:989E: A5 D8
	ASL							;C - - - - - 0x0138B0 04:98A0: 0A
	TAY							;C - - - - - 0x0138B1 04:98A1: A8
	LDA RoundsAnimTable,Y			;C - - - - - 0x0138B2 04:98A2: B9 AD 98
	STA roundAnimSub				;C - - - - - 0x0138B5 04:98A5: 85 59
	LDA RoundsAnimTable+1,Y			;C - - - - - 0x0138B7 04:98A7: B9 AE 98
	STA roundAnimSub+1				;C - - - - - 0x0138BA 04:98AA: 85 5A
	RTS							;C - - - - - 0x0138BC 04:98AC: 60

RoundsAnimTable:
	;- - - - - - 0x0138BD 04:98AD: 4F
	.word NoRoundAnimation		;Round 00
	.word NoRoundAnimation		;Round 01
	.word NoRoundAnimation		;Round 02
	.word NoRoundAnimation		;Round 03
	.word NoRoundAnimation		;Round 04
	.word NoRoundAnimation		;Round 05
	.word NoRoundAnimation		;Round 06
	.word NoRoundAnimation		;Round 07
	.word NoRoundAnimation		;Round 08
	.word NoRoundAnimation		;Round 09
	.word NoRoundAnimation		;Round 10
	.word NoRoundAnimation		;Round 11
	.word NoRoundAnimation		;Round 12
	.word NoRoundAnimation		;Round 13
	.word NoRoundAnimation		;Round 14
	.word NoRoundAnimation		;Round 15
	.word NoRoundAnimation		;Round 16
	.word NoRoundAnimation		;Round 17
	.word NoRoundAnimation		;Round 18
	.word NoRoundAnimation		;Round 19
	.word NoRoundAnimation		;Round 20
	.word NoRoundAnimation		;Round 21
	.word NoRoundAnimation		;Round 22
	.word NoRoundAnimation		;Round 23
	.word NoRoundAnimation		;Round 24
	.word NoRoundAnimation		;Round 25
	.word NoRoundAnimation		;Round 26
	.word NoRoundAnimation		;Round 27
	.word NoRoundAnimation		;Round 28
	.word NoRoundAnimation		;Round 29
	.word RoundAnimateFans		;Round 30
	.word NoRoundAnimation		;Round 31
	.word RoundAnimateFans		;Round 32
	.word NoRoundAnimation		;Round 33
	.word RoundAnimateFans		;Round 34
	.word NoRoundAnimation		;Round 35
	.word RoundAnimateFans		;Round 36
	.word RoundAnimateFans		;Round 37
	.word NoRoundAnimation		;Round 38
	.word RoundAnimateFans		;Round 39
	.word NoRoundAnimation		;Round 40
	.word AnimateWaterColors	;Round 41
	.word AnimateWaterColors	;Round 42
	.word AnimateWaterColors	;Round 43
	.word AnimateWaterColors	;Round 44
	.word AnimateWaterColors	;Round 45
	.word AnimateWaterColors	;Round 46
	.word AnimateWaterColors	;Round 47
	.word AnimateWaterColors	;Round 48
	.word AnimateWaterColors	;Round 49
	.word AnimateWaterColors	;Round 50
	.word AnimateWaterColors	;Round 51
	.word AnimateWaterColors	;Round 52
	.word AnimateWaterColors	;Round 53
	.word AnimateWaterColors	;Round 54
	.word AnimateWaterColors	;Round 55
	.word AnimateWaterColors	;Round 56
	.word AnimateWaterColors	;Round 57
	.word AnimateWaterColors	;Round 58
	.word AnimateWaterColors	;Round 59
	.word AnimateWaterColors	;Round 60
	.word RoundAnimateEarlyFireCastle		;Round 61
	.word RoundAnimateEarlyFireCastle		;Round 62
	.word RoundAnimateEarlyFireCastle		;Round 63
	.word RoundAnimateEarlyFireCastle		;Round 64
	.word RoundAnimateEarlyFireCastle		;Round 65
	.word RoundAnimateEarlyFireCastle		;Round 66
	.word RoundAnimateEarlyFireCastle		;Round 67
	.word RoundAnimateEarlyFireCastle		;Round 68
	.word RoundAnimateEarlyFireCastle		;Round 69
	.word RoundAnimateEarlyFireCastle		;Round 70
	.word RoundAnimateLateFireCastle		;Round 71
	.word RoundAnimateLateFireCastle		;Round 72
	.word RoundAnimateLateFireCastle		;Round 73
	.word RoundAnimateLateFireCastle		;Round 74
	.word RoundAnimateLateFireCastle		;Round 75
	.word RoundAnimateLateFireCastle		;Round 76
	.word RoundAnimateLateFireCastle		;Round 77
	.word RoundAnimateLateFireCastle		;Round 78
	.word NoRoundAnimation					;Round 79
	.word NoRoundAnimation					;Round 80

NoRoundAnimation:
	RTS							;C - - - - - 0x01395F 04:994F: 60

CODE_099950:
	;Unreached
	LDA globalTimer				;- - - - - - 0x013960 04:9950: A5
	AND #$1F					;- - - - - - 0x013962 04:9952: 29
	BNE CODE_099966				;- - - - - - 0x013964 04:9954: D0
		LDA colorBuffer+5				;- - - - - - 0x013966 04:9956: AD
		STA scratch0				;- - - - - - 0x013969 04:9959: 85
		LDA colorBuffer+6				;- - - - - - 0x01396B 04:995B: AD
		STA colorBuffer+5				;- - - - - - 0x01396E 04:995E: 8D
		LDA scratch0				;- - - - - - 0x013971 04:9961: A5
		STA colorBuffer+6				;- - - - - - 0x013973 04:9963: 8D
CODE_099966:
	JSR CODE_09996A				;- - - - - - 0x013976 04:9966: 20
	RTS							;- - - - - - 0x013979 04:9969: 60

CODE_09996A:
	LDA globalTimer				;- - - - - - 0x01397A 04:996A: A5
	AND #$07					;- - - - - - 0x01397C 04:996C: 29
	BNE CODE_09998A				;- - - - - - 0x01397E 04:996E: D0
		LDY ram_005E				;- - - - - - 0x013980 04:9970: A4
		LDA DATA_09998B,Y			;- - - - - - 0x013982 04:9972: B9
		STA colorBuffer+5				;- - - - - - 0x013985 04:9975: 8D
		LDA DATA_09998E,Y			;- - - - - - 0x013988 04:9978: B9
		STA colorBuffer+7				;- - - - - - 0x01398B 04:997B: 8D
		STA colorBuffer+15				;- - - - - - 0x01398E 04:997E: 8D
		INY							;- - - - - - 0x013991 04:9981: C8
		CPY #$03					;- - - - - - 0x013992 04:9982: C0
		BNE CODE_099988					;- - - - - - 0x013994 04:9984: D0
			LDY #$00						;- - - - - - 0x013996 04:9986: A0
	CODE_099988:
		STY ram_005E				;- - - - - - 0x013998 04:9988: 84
CODE_09998A:
	RTS							;- - - - - - 0x01399A 04:998A: 60


DATA_09998B:
	.byte $26					;- - - - - - 0x01399B 04:998B: 26
	.byte $06					;- - - - - - 0x01399C 04:998C: 06
	.byte $16					;- - - - - - 0x01399D 04:998D: 16

DATA_09998E:
	.byte $06					;- - - - - - 0x01399E 04:998E: 06
	.byte $05					;- - - - - - 0x01399F 04:998F: 05
	.byte $07					;- - - - - - 0x0139A0 04:9990: 07

RoundAnimateFans:
	JSR AnimateFans				;C - - - - - 0x0139A1 04:9991: 20 E0 99
	RTS							;C - - - - - 0x0139A4 04:9994: 60

CODE_099995:
	;Unreached
	;Animate dark to bright gold colors for spr pal slot 1
	LDA globalTimer				;- - - - - - 0x0139A5 04:9995: A5
	AND #$0F					;- - - - - - 0x0139A7 04:9997: 29
	BNE CODE_0999B7				;- - - - - - 0x0139A9 04:9999: D0
		LDA globalTimer				;- - - - - - 0x0139AB 04:999B: A5
		AND #$30					;- - - - - - 0x0139AD 04:999D: 29
		STA scratch0				;- - - - - - 0x0139AF 04:999F: 85
		LSR scratch0				;- - - - - - 0x0139B1 04:99A1: 46
		LSR scratch0				;- - - - - - 0x0139B3 04:99A3: 46
		LSR scratch0				;- - - - - - 0x0139B5 04:99A5: 46
		LSR scratch0				;- - - - - - 0x0139B7 04:99A7: 46

		LDY scratch0				;- - - - - - 0x0139B9 04:99A9: A4
		LDA DATA_0999BB,Y			;- - - - - - 0x0139BB 04:99AB: B9
		STA colorBuffer+COL_SPR+6				;- - - - - - 0x0139BE 04:99AE: 8D
		LDA DATA_0999BF,Y			;- - - - - - 0x0139C1 04:99B1: B9
		STA colorBuffer+COL_SPR+7				;- - - - - - 0x0139C4 04:99B4: 8D
CODE_0999B7:
	JSR AnimateFans				;- - - - - - 0x0139C7 04:99B7: 20
	RTS							;- - - - - - 0x0139CA 04:99BA: 60

DATA_0999BB:
	.byte $17					;- - - - - - 0x0139CB 04:99BB: 17
	.byte $27					;- - - - - - 0x0139CC 04:99BC: 27
	.byte $37					;- - - - - - 0x0139CD 04:99BD: 37
	.byte $27					;- - - - - - 0x0139CE 04:99BE: 27

DATA_0999BF:
	.byte $07					;- - - - - - 0x0139CF 04:99BF: 07
	.byte $17					;- - - - - - 0x0139D0 04:99C0: 17
	.byte $27					;- - - - - - 0x0139D1 04:99C1: 27
	.byte $17					;- - - - - - 0x0139D2 04:99C2: 17

AnimateWaterColors:
	;Rotate water colors
	LDA globalTimer				;C - - - - - 0x0139D3 04:99C3: A5 14
	AND #$07					;C - - - - - 0x0139D5 04:99C5: 29 07
	BNE CODE_0999DF				;C - - - - - 0x0139D7 04:99C7: D0 16
		LDA colorBuffer+6				;C - - - - - 0x0139D9 04:99C9: AD 06 03
		STA scratch0				;C - - - - - 0x0139DC 04:99CC: 85 00
		LDA colorBuffer+7				;C - - - - - 0x0139DE 04:99CE: AD 07 03
		STA colorBuffer+6				;C - - - - - 0x0139E1 04:99D1: 8D 06 03
		LDA colorBuffer+5				;C - - - - - 0x0139E4 04:99D4: AD 05 03
		STA colorBuffer+7				;C - - - - - 0x0139E7 04:99D7: 8D 07 03
		LDA scratch0				;C - - - - - 0x0139EA 04:99DA: A5 00
		STA colorBuffer+5				;C - - - - - 0x0139EC 04:99DC: 8D 05 03
CODE_0999DF:
	RTS							;C - - - - - 0x0139EF 04:99DF: 60

AnimateFans:
	;Swap BG CHR bank for fan hazards
	LDA globalTimer				;C - - - - - 0x0139F0 04:99E0: A5 14
	AND #$03					;C - - - - - 0x0139F2 04:99E2: 29 03
	BNE @end				;C - - - - - 0x0139F4 04:99E4: D0 22

	LDX #$00					;C - - - - - 0x0139F6 04:99E6: A2 00
@checkround:
	LDA currentRound				;C - - - - - 0x0139F8 04:99E8: A5 D8
	CMP FanRounds,X			;C - - - - - 0x0139FA 04:99EA: DD 09 9A
	BEQ @swapgfx				;C - - - - - 0x0139FD 04:99ED: F0 08
		INX							;C - - - - - 0x0139FF 04:99EF: E8
		CPX #$06					;C - - - - - 0x013A00 04:99F0: E0 06
		BEQ @end				;C - - - - - 0x013A02 04:99F2: F0 14

		JMP @checkround				;C - - - - - 0x013A04 04:99F4: 4C E8 99
	@swapgfx:
		LDA vNametable				;C - - - - - 0x013A07 04:99F7: A5 2D
		TAX							;C - - - - - 0x013A09 04:99F9: AA
		INC chrBankA,X				;C - - - - - 0x013A0A 04:99FA: F6 4B
		INC chrBankA,X				;C - - - - - 0x013A0C 04:99FC: F6 4B
		LDA chrBankA,X				;C - - - - - 0x013A0E 04:99FE: B5 4B
		CMP #chrFans_CB_ID					;C - - - - - 0x013A10 04:9A00: C9 1D
		BCC @end				;C - - - - - 0x013A12 04:9A02: 90 04
			LDA #chrFans_AA_ID					;C - - - - - 0x013A14 04:9A04: A9 18
			STA chrBankA,X				;C - - - - - 0x013A16 04:9A06: 95 4B
@end:
	RTS							;C - - - - - 0x013A18 04:9A08: 60

FanRounds:
	.byte 30					;- D 0 - - - 0x013A19 04:9A09: 1E
	.byte 32					;- D 0 - - - 0x013A1A 04:9A0A: 20
	.byte 34					;- D 0 - - - 0x013A1B 04:9A0B: 22
	.byte 36					;- D 0 - - - 0x013A1C 04:9A0C: 24
	.byte 37					;- D 0 - - - 0x013A1D 04:9A0D: 25
	.byte 39					;- D 0 - - - 0x013A1E 04:9A0E: 27

RoundAnimateEarlyFireCastle:
	JSR AnimateFireCastle				;C - - - - - 0x013A1F 04:9A0F: 20 13 9A
	RTS							;C - - - - - 0x013A22 04:9A12: 60

AnimateFireCastle:
	;Swap BG CHR banks for the Castle of Fire levels
	LDA globalTimer				;C - - - - - 0x013A23 04:9A13: A5 14
	AND #$07					;C - - - - - 0x013A25 04:9A15: 29 07
	BNE @end				;C - - - - - 0x013A27 04:9A17: D0 13
		LDA vNametable				;C - - - - - 0x013A29 04:9A19: A5 2D
		EOR #$01					;C - - - - - 0x013A2B 04:9A1B: 49 01
		TAX							;C - - - - - 0x013A2D 04:9A1D: AA
		INC chrBankA,X				;C - - - - - 0x013A2E 04:9A1E: F6 4B
		INC chrBankA,X				;C - - - - - 0x013A30 04:9A20: F6 4B
		LDA chrBankA,X				;C - - - - - 0x013A32 04:9A22: B5 4B
		CMP #chrFireCastle_BA_ID+2					;C - - - - - 0x013A34 04:9A24: C9 2A
		BCC @end				;C - - - - - 0x013A36 04:9A26: 90 04
			LDA #chrFireCastle_AA_ID					;C - - - - - 0x013A38 04:9A28: A9 26
			STA chrBankA,X				;C - - - - - 0x013A3A 04:9A2A: 95 4B
@end:
	RTS							;C - - - - - 0x013A3C 04:9A2C: 60

RoundAnimateLateFireCastle:
	JSR AnimateFireCastle				;C - - - - - 0x013A3D 04:9A2D: 20 13 9A
	RTS							;C - - - - - 0x013A40 04:9A30: 60

CODE_099A31:
	;Unreached
	LDA globalTimer				;- - - - - - 0x013A41 04:9A31: A5
	AND #$07					;- - - - - - 0x013A43 04:9A33: 29
	BNE CODE_099A51				;- - - - - - 0x013A45 04:9A35: D0
		LDY ram_005E				;- - - - - - 0x013A47 04:9A37: A4
		LDA DATA_099A52,Y			;- - - - - - 0x013A49 04:9A39: B9
		STA colorBuffer+5				;- - - - - - 0x013A4C 04:9A3C: 8D
		LDA DATA_099A55,Y			;- - - - - - 0x013A4F 04:9A3F: B9
		STA colorBuffer+7				;- - - - - - 0x013A52 04:9A42: 8D
		STA colorBuffer+15				;- - - - - - 0x013A55 04:9A45: 8D
		INY							;- - - - - - 0x013A58 04:9A48: C8
		CPY #$03					;- - - - - - 0x013A59 04:9A49: C0
		BNE CODE_099A4F				;- - - - - - 0x013A5B 04:9A4B: D0
			LDY #$00					;- - - - - - 0x013A5D 04:9A4D: A0
	CODE_099A4F:
		STY ram_005E				;- - - - - - 0x013A5F 04:9A4F: 84
CODE_099A51:
	RTS							;- - - - - - 0x013A61 04:9A51: 60

DATA_099A52:
	.byte $36					;- - - - - - 0x013A62 04:9A52: 36
	.byte $16					;- - - - - - 0x013A63 04:9A53: 16
	.byte $26					;- - - - - - 0x013A64 04:9A54: 26

DATA_099A55:
	.byte $33					;- - - - - - 0x013A65 04:9A55: 33
	.byte $13					;- - - - - - 0x013A66 04:9A56: 13
	.byte $23					;- - - - - - 0x013A67 04:9A57: 23

CheckPause:
	LDA pressedP1				;C - - - - - 0x013A68 04:9A58: A5 0E
	AND #KEY_START				;C - - - - - 0x013A6A 04:9A5A: 29 08
	BNE @toggle				;C - - - - - 0x013A6C 04:9A5C: D0 03
		JMP @end				;C - - - - - 0x013A6E 04:9A5E: 4C 9F 9A
@toggle:
	LDA ram_0475				;C - - - - - 0x013A71 04:9A61: AD 75 04
	EOR #$02					;C - - - - - 0x013A74 04:9A64: 49 02
	STA ram_0475				;C - - - - - 0x013A76 04:9A66: 8D 75 04

	LDA roundPaused				;C - - - - - 0x013A79 04:9A69: AD 74 04
	EOR #$01					;C - - - - - 0x013A7C 04:9A6C: 49 01
	STA roundPaused				;C - - - - - 0x013A7E 04:9A6E: 8D 74 04
	BEQ @restoreobj				;C - - - - - 0x013A81 04:9A71: F0 06
		JSR StorePauseObj				;C - - - - - 0x013A83 04:9A73: 20 AD 9A
		JMP @objswapped				;C - - - - - 0x013A86 04:9A76: 4C 7C 9A
@restoreobj:
	JSR RestorePauseObj				;C - - - - - 0x013A89 04:9A79: 20 0F 9B
@objswapped:
	LDA roundPaused				;C - - - - - 0x013A8C 04:9A7C: AD 74 04
	BEQ @play				;C - - - - - 0x013A8F 04:9A7F: F0 0B
		LDA #.LOBYTE(CheckPause)	;C - - - - - 0x013A91 04:9A81: A9 58
		STA nmiBankedSub				;C - - - - - 0x013A93 04:9A83: 85 16
		LDA #.HIBYTE(CheckPause)		;C - - - - - 0x013A95 04:9A85: A9 9A
		STA nmiBankedSub+1				;C - - - - - 0x013A97 04:9A87: 85 17
		JMP @subchosen				;C - - - - - 0x013A99 04:9A89: 4C 94 9A
@play:
	LDA #.LOBYTE(RoundUpdate)	;C - - - - - 0x013A9C 04:9A8C: A9 10
	STA nmiBankedSub				;C - - - - - 0x013A9E 04:9A8E: 85 16
	LDA #.HIBYTE(RoundUpdate)	;C - - - - - 0x013AA0 04:9A90: A9 97
	STA nmiBankedSub+1				;C - - - - - 0x013AA2 04:9A92: 85 17
@subchosen:
	LDA #snPause_ID					;C - - - - - 0x013AA4 04:9A94: A9 01
	STA a:soundTrigger			;C - - - - - 0x013AA6 04:9A96: 8D E1 00
	LDA roundPaused				;C - - - - - 0x013AA9 04:9A99: AD 74 04
	STA a:jingleTrigger			;C - - - - - 0x013AAC 04:9A9C: 8D E2 00
.ifdef REGION_JP
	JMP @end					;- - - - - - 0x013AB5 04:9AA5: 4C
.endif
@end:
	RTS							;C - - - - - 0x013AAF 04:9A9F: 60

ClearScoreAddition:
	LDY #$00					;C - - - - - 0x013AB0 04:9AA0: A0 00
@clear:
	LDA #$00					;C - - - - - 0x013AB2 04:9AA2: A9 00
	STA scoreAdditionDigits,Y				;C - - - - - 0x013AB4 04:9AA4: 99 A1 04
	INY							;C - - - - - 0x013AB7 04:9AA7: C8
	CPY #$07					;C - - - - - 0x013AB8 04:9AA8: C0 07
	BNE @clear				;C - - - - - 0x013ABA 04:9AAA: D0 F6

	RTS							;C - - - - - 0x013ABC 04:9AAC: 60

StorePauseObj:
	LDA objState+OSLOT_PROJ				;C - - - - - 0x013ABD 04:9AAD: AD 64 05
	STA pauseObjState				;C - - - - - 0x013AC0 04:9AB0: 8D 00 01
	LDA objAnim+OSLOT_PROJ				;C - - - - - 0x013AC3 04:9AB3: AD 7C 06
	STA pauseObjAnim				;C - - - - - 0x013AC6 04:9AB6: 8D 01 01
	LDA objAnimHI+OSLOT_PROJ				;C - - - - - 0x013AC9 04:9AB9: AD 1C 07
	STA pauseObjAnimHI				;C - - - - - 0x013ACC 04:9ABC: 8D 02 01
	LDA objChrSlot+OSLOT_PROJ				;C - - - - - 0x013ACF 04:9ABF: AD 2C 06
	STA pauseObjChrSlot				;C - - - - - 0x013AD2 04:9AC2: 8D 03 01
	LDA objAttr+OSLOT_PROJ				;C - - - - - 0x013AD5 04:9AC5: AD F4 06
	STA pauseObjAttr				;C - - - - - 0x013AD8 04:9AC8: 8D 04 01
	LDA objX+OSLOT_PROJ				;C - - - - - 0x013ADB 04:9ACB: AD B4 05
	STA pauseObjX				;C - - - - - 0x013ADE 04:9ACE: 8D 05 01
	LDA objY+OSLOT_PROJ				;C - - - - - 0x013AE1 04:9AD1: AD 8C 05
	STA pauseObjY				;C - - - - - 0x013AE4 04:9AD4: 8D 06 01
	LDA objChrBank+OSLOT_PROJ				;C - - - - - 0x013AE7 04:9AD7: AD 54 06
	STA pauseObjChrBank				;C - - - - - 0x013AEA 04:9ADA: 8D 07 01
	LDA chrBankE				;C - - - - - 0x013AED 04:9ADD: A5 4F
	STA pauseChrBankE				;C - - - - - 0x013AEF 04:9ADF: 8D 08 01
	LDA chrBankF				;C - - - - - 0x013AF2 04:9AE2: A5 50
	STA pauseChrBankF				;C - - - - - 0x013AF4 04:9AE4: 8D 09 01

	LDA sprPrgBank				;C - - - - - 0x013AF7 04:9AE7: AD 61 05
	STA announceOrigSprBank				;C - - - - - 0x013AFA 04:9AEA: 8D 62 05
	LDA #ANNOUNCE_PAUSE					;C - - - - - 0x013AFD 04:9AED: A9 02
	STA scratch0				;C - - - - - 0x013AFF 04:9AEF: 85 00
	LDA #$01					;C - - - - - 0x013B01 04:9AF1: A9 01
	STA scratch4				;C - - - - - 0x013B03 04:9AF3: 85 04

	LDA #.LOBYTE(SpawnAnnounceObj)					;C - - - - - 0x013B05 04:9AF5: A9 76
	STA bankedSub				;C - - - - - 0x013B07 04:9AF7: 85 55
	LDA #.HIBYTE(SpawnAnnounceObj)					;C - - - - - 0x013B09 04:9AF9: A9 9C
	STA bankedSub+1				;C - - - - - 0x013B0B 04:9AFB: 85 56
	LDA #.BANK(SpawnAnnounceObj)					;C - - - - - 0x013B0D 04:9AFD: A9 08
	STA bankedSubBank				;C - - - - - 0x013B0F 04:9AFF: 85 57
	LDA #.BANK(*)					;C - - - - - 0x013B11 04:9B01: A9 09
	STA bankedSubRetBank				;C - - - - - 0x013B13 04:9B03: 85 58
	JSR RunBankedSub				;C - - - - - 0x013B15 04:9B05: 20 72 E7

	JSR AnimateNonBubbles				;C - - - - - 0x013B18 04:9B08: 20 5C EE
	JSR DrawObjects				;C - - - - - 0x013B1B 04:9B0B: 20 E2 EE
	RTS							;C - - - - - 0x013B1E 04:9B0E: 60

RestorePauseObj:
	LDA pauseObjState				;C - - - - - 0x013B1F 04:9B0F: AD 00 01
	STA objState+OSLOT_PROJ				;C - - - - - 0x013B22 04:9B12: 8D 64 05
	LDA pauseObjAnim				;C - - - - - 0x013B25 04:9B15: AD 01 01
	STA objAnim+OSLOT_PROJ				;C - - - - - 0x013B28 04:9B18: 8D 7C 06
	LDA pauseObjAnimHI				;C - - - - - 0x013B2B 04:9B1B: AD 02 01
	STA objAnimHI+OSLOT_PROJ				;C - - - - - 0x013B2E 04:9B1E: 8D 1C 07
	LDA pauseObjChrSlot				;C - - - - - 0x013B31 04:9B21: AD 03 01
	STA objChrSlot+OSLOT_PROJ				;C - - - - - 0x013B34 04:9B24: 8D 2C 06
	LDA pauseObjAttr				;C - - - - - 0x013B37 04:9B27: AD 04 01
	STA objAttr+OSLOT_PROJ				;C - - - - - 0x013B3A 04:9B2A: 8D F4 06
	LDA pauseObjX				;C - - - - - 0x013B3D 04:9B2D: AD 05 01
	STA objX+OSLOT_PROJ				;C - - - - - 0x013B40 04:9B30: 8D B4 05
	LDA pauseObjY				;C - - - - - 0x013B43 04:9B33: AD 06 01
	STA objY+OSLOT_PROJ				;C - - - - - 0x013B46 04:9B36: 8D 8C 05
	LDA pauseObjChrBank				;C - - - - - 0x013B49 04:9B39: AD 07 01
	STA objChrBank+OSLOT_PROJ				;C - - - - - 0x013B4C 04:9B3C: 8D 54 06
	LDA pauseChrBankE				;C - - - - - 0x013B4F 04:9B3F: AD 08 01
	STA chrBankE				;C - - - - - 0x013B52 04:9B42: 85 4F
	LDA pauseChrBankF				;C - - - - - 0x013B54 04:9B44: AD 09 01
	STA chrBankF				;C - - - - - 0x013B57 04:9B47: 85 50
	LDA #$00					;C - - - - - 0x013B59 04:9B49: A9 00
	STA objAnimTimer+OSLOT_PROJ				;C - - - - - 0x013B5B 04:9B4B: 8D A4 06

	JSR ClearScoreAddition				;C - - - - - 0x013B5E 04:9B4E: 20 A0 9A
	LDA announceOrigSprBank				;C - - - - - 0x013B61 04:9B51: AD 62 05
	STA sprPrgBank				;C - - - - - 0x013B64 04:9B54: 8D 61 05
	LDA #$0F					;C - - - - - 0x013B67 04:9B57: A9 0F
	STA colorBuffer+COL_SPR+13				;C - - - - - 0x013B69 04:9B59: 8D 1D 03
	LDA #$26					;C - - - - - 0x013B6C 04:9B5C: A9 26
	STA colorBuffer+COL_SPR+14				;C - - - - - 0x013B6E 04:9B5E: 8D 1E 03
	LDA #$16					;C - - - - - 0x013B71 04:9B61: A9 16
	STA colorBuffer+COL_SPR+15				;C - - - - - 0x013B73 04:9B63: 8D 1F 03
	RTS							;C - - - - - 0x013B76 04:9B66: 60

RefreshLivesDigits:
	LDX currentPlayer				;C - - - - - 0x013B77 04:9B67: AE 99 04
	LDA LivesDigitsPlayerOfs,X			;C - - - - - 0x013B7A 04:9B6A: BD E5 9B
	STA scratch1				;C - - - - - 0x013B7D 04:9B6D: 85 01
	LDA scratch3				;C - - - - - 0x013B7F 04:9B6F: A5 03
	CLC							;C - - - - - 0x013B81 04:9B71: 18
	ADC scratch1				;C - - - - - 0x013B82 04:9B72: 65 01
	STA scratch3				;C - - - - - 0x013B84 04:9B74: 85 03
	LDA scratch4				;C - - - - - 0x013B86 04:9B76: A5 04
	CLC							;C - - - - - 0x013B88 04:9B78: 18
	ADC scratch1				;C - - - - - 0x013B89 04:9B79: 65 01
	STA scratch4				;C - - - - - 0x013B8B 04:9B7B: 85 04
	LDY #$00					;C - - - - - 0x013B8D 04:9B7D: A0 00
	LDX scratch1				;C - - - - - 0x013B8F 04:9B7F: A6 01

	LDA playerLives				;C - - - - - 0x013B91 04:9B81: AD 79 04
CODE_099B84:
	CMP #10					;C - - - - - 0x013B94 04:9B84: C9 0A
	BCC CODE_099B8F				;C - - - - - 0x013B96 04:9B86: 90 07
		SEC							;C - - - - - 0x013B98 04:9B88: 38
		SBC #10					;C - - - - - 0x013B99 04:9B89: E9 0A
		INY							;C - - - - - 0x013B9B 04:9B8B: C8
		JMP CODE_099B84				;C - - - - - 0x013B9C 04:9B8C: 4C 84 9B
CODE_099B8F:
	STA livesDigits+1,X				;C - - - - - 0x013B9F 04:9B8F: 9D 80 04
	CPY #10					;C - - - - - 0x013BA2 04:9B92: C0 0A
	BCC CODE_099B9C				;C - - - - - 0x013BA4 04:9B94: 90 06
		;Unreached
		LDA #$09					;- - - - - - 0x013BA6 04:9B96: A9
		STA livesDigits+1,X				;- - - - - - 0x013BA8 04:9B98: 9D
		TAY							;- - - - - - 0x013BAB 04:9B9B: A8
CODE_099B9C:
	TYA							;C - - - - - 0x013BAC 04:9B9C: 98
	STA livesDigits,X				;C - - - - - 0x013BAD 04:9B9D: 9D 7F 04
	LDX scratch3				;C - - - - - 0x013BB0 04:9BA0: A6 03

.ifdef REGION_JP
	LDY #$00					;- - - - - - 0x013BBB 04:9BAB: A0
.else
	LDY livesCurrentPos				;C - - - - - 0x013BB2 04:9BA2: AC 98 04
	BEQ CODE_099BC3				;C - - - - - 0x013BB5 04:9BA5: F0 1C
	DEY							;C - - - - - 0x013BB7 04:9BA7: 88
	BEQ CODE_099BC3				;C - - - - - 0x013BB8 04:9BA8: F0 19
		;Print X char
		LDA #$5C					;C - - - - - 0x013BBA 04:9BAA: A9 5C
		CLC							;C - - - - - 0x013BBC 04:9BAC: 18
		ADC scratch0				;C - - - - - 0x013BBD 04:9BAD: 65 00
		STA mapBuffer				;C - - - - - 0x013BBF 04:9BAF: 8D 68 03
		CLC							;C - - - - - 0x013BC2 04:9BB2: 18
		ADC #$01					;C - - - - - 0x013BC3 04:9BB3: 69 01
		STA mapBuffer+32				;C - - - - - 0x013BC5 04:9BB5: 8D 88 03

		;Print blank char
		LDA #$7F					;C - - - - - 0x013BC8 04:9BB8: A9 7F
		CLC							;C - - - - - 0x013BCA 04:9BBA: 18
		ADC scratch0				;C - - - - - 0x013BCB 04:9BBB: 65 00
		STA mapBuffer+1				;C - - - - - 0x013BCD 04:9BBD: 8D 69 03
		STA mapBuffer+32+1				;C - - - - - 0x013BD0 04:9BC0: 8D 89 03
.endif
CODE_099BC3:
	;Print first digit
	LDA livesDigits,X				;C - - - - - 0x013BD3 04:9BC3: BD 7F 04
	ASL							;C - - - - - 0x013BD6 04:9BC6: 0A
	CLC							;C - - - - - 0x013BD7 04:9BC7: 18
	ADC #$6A					;C - - - - - 0x013BD8 04:9BC8: 69 6A
	CLC							;C - - - - - 0x013BDA 04:9BCA: 18
	ADC scratch0				;C - - - - - 0x013BDB 04:9BCB: 65 00
	STA mapBuffer,Y				;C - - - - - 0x013BDD 04:9BCD: 99 68 03
	CLC							;C - - - - - 0x013BE0 04:9BD0: 18
	ADC #$01					;C - - - - - 0x013BE1 04:9BD1: 69 01
	STA mapBuffer+32,Y				;C - - - - - 0x013BE3 04:9BD3: 99 88 03
	INY							;C - - - - - 0x013BE6 04:9BD6: C8
	INX							;C - - - - - 0x013BE7 04:9BD7: E8
	CPX scratch4				;C - - - - - 0x013BE8 04:9BD8: E4 04
	BNE CODE_099BC3				;C - - - - - 0x013BEA 04:9BDA: D0 E7

	LDA #$00					;C - - - - - 0x013BEC 04:9BDC: A9 00
	STA mapBuffer,Y				;C - - - - - 0x013BEE 04:9BDE: 99 68 03
	STA mapBuffer+32,Y				;C - - - - - 0x013BF1 04:9BE1: 99 88 03
	RTS							;C - - - - - 0x013BF4 04:9BE4: 60

LivesDigitsPlayerOfs:
	.byte $00					;- D 0 - - - 0x013BF5 04:9BE5: 00
	.byte $09					;- D 0 - - - 0x013BF6 04:9BE6: 09

CODE_099BE7:
	LDA livesCurrentPos				;C - - - - - 0x013BF7 04:9BE7: AD 98 04
	BEQ CODE_099C53				;C - - - - - 0x013BFA 04:9BEA: F0 67

	AND #$C0					;C - - - - - 0x013BFC 04:9BEC: 29 C0
	BNE CODE_099C53				;C - - - - - 0x013BFE 04:9BEE: D0 63

	LDA livesCurrentPos				;C - - - - - 0x013C00 04:9BF0: AD 98 04
	AND #$07					;C - - - - - 0x013C03 04:9BF3: 29 07
	STA livesCurrentPos				;C - - - - - 0x013C05 04:9BF5: 8D 98 04
	BEQ CODE_099C53				;C - - - - - 0x013C08 04:9BF8: F0 59

	;0-3: Blank, Score, Lives, Hearts
	LDY livesCurrentPos				;C - - - - - 0x013C0A 04:9BFA: AC 98 04
	LDA vNametable				;C - - - - - 0x013C0D 04:9BFD: A5 2D
	ASL							;C - - - - - 0x013C0F 04:9BFF: 0A
	ASL							;C - - - - - 0x013C10 04:9C00: 0A
	ASL							;C - - - - - 0x013C11 04:9C01: 0A
	STA scratch0				;C - - - - - 0x013C12 04:9C02: 85 00
	LDA currentRound				;C - - - - - 0x013C14 04:9C04: A5 D8
	CMP #20						;C - - - - - 0x013C16 04:9C06: C9 14
	BNE CODE_099C0E				;C - - - - - 0x013C18 04:9C08: D0 04
		LDA #$04					;C - - - - - 0x013C1A 04:9C0A: A9 04
		STA scratch0				;C - - - - - 0x013C1C 04:9C0C: 85 00
CODE_099C0E:
	LDA HUDMapTargetsLO,Y			;C - - - - - 0x013C1E 04:9C0E: B9 5E 9C
	STA mapTargetAdr				;C - - - - - 0x013C21 04:9C11: 85 49
	LDA #$20					;C - - - - - 0x013C23 04:9C13: A9 20
	ORA scratch0				;C - - - - - 0x013C25 04:9C15: 05 00
	STA mapTargetAdr+1				;C - - - - - 0x013C27 04:9C17: 85 4A
	LDA #$C1					;C - - - - - 0x013C29 04:9C19: A9 C1
	STA ram_03AA				;C - - - - - 0x013C2B 04:9C1B: 8D AA 03
	LDA #$23					;C - - - - - 0x013C2E 04:9C1E: A9 23
	ORA scratch0				;C - - - - - 0x013C30 04:9C20: 05 00
	STA ram_03AB				;C - - - - - 0x013C32 04:9C22: 8D AB 03
	LDA #$00					;C - - - - - 0x013C35 04:9C25: A9 00
	STA ram_03AE				;C - - - - - 0x013C37 04:9C27: 8D AE 03

	LDX vNametable				;C - - - - - 0x013C3A 04:9C2A: A6 2D
	LDA DATA_099C54,X			;C - - - - - 0x013C3C 04:9C2C: BD 54 9C
	STA scratch0				;C - - - - - 0x013C3F 04:9C2F: 85 00
	LDA DATA_099C56,Y			;C - - - - - 0x013C41 04:9C31: B9 56 9C
	STA scratch3				;C - - - - - 0x013C44 04:9C34: 85 03
	LDA DATA_099C5A,Y			;C - - - - - 0x013C46 04:9C36: B9 5A 9C
	STA scratch4				;C - - - - - 0x013C49 04:9C39: 85 04
	CPY #$02					;C - - - - - 0x013C4B 04:9C3B: C0 02
	BEQ CODE_099C45				;C - - - - - 0x013C4D 04:9C3D: F0 06
		JSR RefreshLivesDigits				;C - - - - - 0x013C4F 04:9C3F: 20 67 9B
		JMP CODE_099C48				;C - - - - - 0x013C52 04:9C42: 4C 48 9C
CODE_099C45:
	JSR DrawHearts				;C - - - - - 0x013C55 04:9C45: 20 62 9C
CODE_099C48:
	DEC livesCurrentPos				;C - - - - - 0x013C58 04:9C48: CE 98 04
	LDA #.LOBYTE(CODE_0FE93B)	;C - - - - - 0x013C5B 04:9C4B: A9 3B
	STA nmiUnbankedSub				;C - - - - - 0x013C5D 04:9C4D: 85 35
	LDA #.HIBYTE(CODE_0FE93B)	;C - - - - - 0x013C5F 04:9C4F: A9 E9
	STA nmiUnbankedSub+1				;C - - - - - 0x013C61 04:9C51: 85 36
CODE_099C53:
	RTS							;C - - - - - 0x013C63 04:9C53: 60

DATA_099C54:
	.byte $00					;- D 0 - - - 0x013C64 04:9C54: 00
	.byte $80					;- D 0 - - - 0x013C65 04:9C55: 80
;Blank, Score, Lives, Hearts
DATA_099C56:
	.byte $00					;- - - - - - 0x013C66 04:9C56: 00
	.byte $02					;- D 0 - - - 0x013C67 04:9C57: 02
	.byte $00					;- D 0 - - - 0x013C68 04:9C58: 00
	.byte $00					;- D 0 - - - 0x013C69 04:9C59: 00
DATA_099C5A:
	.byte $00					;- - - - - - 0x013C6A 04:9C5A: 00
	.byte $09					;- D 0 - - - 0x013C6B 04:9C5B: 09
	.byte $00					;- D 0 - - - 0x013C6C 04:9C5C: 00
	.byte $02					;- D 0 - - - 0x013C6D 04:9C5D: 02
HUDMapTargetsLO:
.ifdef REGION_JP
	.byte $00					;- - - - - - 0x013C58 04:9C48: 00
	.byte $55					;- - - - - - 0x013C59 04:9C49: 55
	.byte $4A					;- - - - - - 0x013C5A 04:9C4A: 4A
	.byte $47					;- - - - - - 0x013C5B 04:9C4B: 47
.else
	.byte $00					;- - - - - - 0x013C6E 04:9C5E: 00
	.byte $55					;- D 0 - - - 0x013C6F 04:9C5F: 55
	.byte $4A					;- D 0 - - - 0x013C70 04:9C60: 4A
	.byte $46					;- D 0 - - - 0x013C71 04:9C61: 46
.endif

DrawHearts:
	LDA #$66					;C - - - - - 0x013C72 04:9C62: A9 66
	CLC							;C - - - - - 0x013C74 04:9C64: 18
	ADC scratch0				;C - - - - - 0x013C75 04:9C65: 65 00
	STA scratch1				;C - - - - - 0x013C77 04:9C67: 85 01
	LDX #$00					;C - - - - - 0x013C79 04:9C69: A2 00
CODE_099C6B:
	CLC							;C - - - - - 0x013C7B 04:9C6B: 18
	ADC #$01					;C - - - - - 0x013C7C 04:9C6C: 69 01
	STA scratch2,X				;C - - - - - 0x013C7E 04:9C6E: 95 02
	INX							;C - - - - - 0x013C80 04:9C70: E8
	CPX #$03					;C - - - - - 0x013C81 04:9C71: E0 03
	BCC CODE_099C6B				;C - - - - - 0x013C83 04:9C73: 90 F6

	LDX #$00					;C - - - - - 0x013C85 04:9C75: A2 00
	LDY #$00					;C - - - - - 0x013C87 04:9C77: A0 00
	LDA playerHearts				;C - - - - - 0x013C89 04:9C79: AD 78 04
	BEQ CODE_099C9E				;C - - - - - 0x013C8C 04:9C7C: F0 20
CODE_099C7E:
	LDA scratch1				;C - - - - - 0x013C8E 04:9C7E: A5 01
	STA mapBuffer,Y				;C - - - - - 0x013C90 04:9C80: 99 68 03
	LDA scratch2				;C - - - - - 0x013C93 04:9C83: A5 02
	STA mapBuffer+32,Y				;C - - - - - 0x013C95 04:9C85: 99 88 03
	INY							;C - - - - - 0x013C98 04:9C88: C8
	LDA scratch3				;C - - - - - 0x013C99 04:9C89: A5 03
	STA mapBuffer,Y				;C - - - - - 0x013C9B 04:9C8B: 99 68 03
	LDA scratch4				;C - - - - - 0x013C9E 04:9C8E: A5 04
	STA mapBuffer+32,Y				;C - - - - - 0x013CA0 04:9C90: 99 88 03
	INY							;C - - - - - 0x013CA3 04:9C93: C8
	INX							;C - - - - - 0x013CA4 04:9C94: E8
	CPX playerHearts				;C - - - - - 0x013CA5 04:9C95: EC 78 04
	BCC CODE_099C7E				;C - - - - - 0x013CA8 04:9C98: 90 E4

	CPX #$05					;C - - - - - 0x013CAA 04:9C9A: E0 05
	BCS CODE_099CAE				;C - - - - - 0x013CAC 04:9C9C: B0 10
CODE_099C9E:
	LDA #$7F					;C - - - - - 0x013CAE 04:9C9E: A9 7F
	CLC							;C - - - - - 0x013CB0 04:9CA0: 18
	ADC scratch0				;C - - - - - 0x013CB1 04:9CA1: 65 00
	STA scratch1				;C - - - - - 0x013CB3 04:9CA3: 85 01
	STA scratch2				;C - - - - - 0x013CB5 04:9CA5: 85 02
	STA scratch3				;C - - - - - 0x013CB7 04:9CA7: 85 03
	STA scratch4				;C - - - - - 0x013CB9 04:9CA9: 85 04
	JMP CODE_099C7E				;C - - - - - 0x013CBB 04:9CAB: 4C 7E 9C
CODE_099CAE:
	LDA #$00					;C - - - - - 0x013CBE 04:9CAE: A9 00
	STA mapBuffer,Y				;C - - - - - 0x013CC0 04:9CB0: 99 68 03
	STA mapBuffer+32,Y				;C - - - - - 0x013CC3 04:9CB3: 99 88 03
	RTS							;C - - - - - 0x013CC6 04:9CB6: 60

CODE_099CB7:
.ifdef REGION_JP
	LDA #.BANK(DATA_06B8B6)
	STA prgBankB
	STA $8001
.else
	LDA #$00					;C - - - - - 0x013CC7 04:9CB7: A9 00
	ORA #$07					;C - - - - - 0x013CC9 04:9CB9: 09 07
	STA $8000				;C - - - - - 0x013CCB 04:9CBB: 8D 00 80
	LDA #.BANK(DATA_06B8B6)					;C - - - - - 0x013CCE 04:9CBE: A9 06
	STA $8001				;C - - - - - 0x013CD0 04:9CC0: 8D 01 80
	STA prgBankB				;C - - - - - 0x013CD3 04:9CC3: 85 53

	LDA #$00					;C - - - - - 0x013CD5 04:9CC5: A9 00
	ORA #$07					;C - - - - - 0x013CD7 04:9CC7: 09 07
	STA $8000				;C - - - - - 0x013CD9 04:9CC9: 8D 00 80
	LDA #.BANK(DATA_06B8B6)					;C - - - - - 0x013CDC 04:9CCC: A9 06
	STA $8001				;C - - - - - 0x013CDE 04:9CCE: 8D 01 80
	STA prgBankB				;C - - - - - 0x013CE1 04:9CD1: 85 53
.endif

	LDA #.LOBYTE(DATA_06B8B6)					;C - - - - - 0x013CE3 04:9CD3: A9 B6
	STA scratch8				;C - - - - - 0x013CE5 04:9CD5: 85 08
	LDA #.HIBYTE(DATA_06B8B6)					;C - - - - - 0x013CE7 04:9CD7: A9 B8
	STA scratch9				;C - - - - - 0x013CE9 04:9CD9: 85 09
	LDA scratch4				;C - - - - - 0x013CEB 04:9CDB: A5 04
	ASL							;C - - - - - 0x013CED 04:9CDD: 0A
	ADC scratch8				;C - - - - - 0x013CEE 04:9CDE: 65 08
	STA scratch8				;C - - - - - 0x013CF0 04:9CE0: 85 08
	LDA scratch9				;C - - - - - 0x013CF2 04:9CE2: A5 09
	ADC #$00					;C - - - - - 0x013CF4 04:9CE4: 69 00
	STA scratch9				;C - - - - - 0x013CF6 04:9CE6: 85 09
	LDY #$00					;C - - - - - 0x013CF8 04:9CE8: A0 00
	LDA (scratch8),Y			;C - - - - - 0x013CFA 04:9CEA: B1 08
	STA scratch6				;C - - - - - 0x013CFC 04:9CEC: 85 06
	INY							;C - - - - - 0x013CFE 04:9CEE: C8
	LDA (scratch8),Y			;C - - - - - 0x013CFF 04:9CEF: B1 08
	STA scratch7				;C - - - - - 0x013D01 04:9CF1: 85 07
	LDY #$00					;C - - - - - 0x013D03 04:9CF3: A0 00
CODE_099CF5:
	LDA (scratch6),Y			;C - - - - - 0x013D05 04:9CF5: B1 06
	BEQ CODE_099D11				;C - - - - - 0x013D07 04:9CF7: F0 18
		TAX							;C - - - - - 0x013D09 04:9CF9: AA
		LDA DATA_06B858,X			;C - - - - - 0x013D0A 04:9CFA: BD 58 B8
		CLC							;C - - - - - 0x013D0D 04:9CFD: 18
		ADC scratch5				;C - - - - - 0x013D0E 04:9CFE: 65 05
		STA mapBuffer,Y				;C - - - - - 0x013D10 04:9D00: 99 68 03
		CLC							;C - - - - - 0x013D13 04:9D03: 18
		ADC #$01					;C - - - - - 0x013D14 04:9D04: 69 01
		STA mapBuffer+32,Y				;C - - - - - 0x013D16 04:9D06: 99 88 03
		INY							;C - - - - - 0x013D19 04:9D09: C8
		CPY #$20					;C - - - - - 0x013D1A 04:9D0A: C0 20
		BNE CODE_099CF5				;C - - - - - 0x013D1C 04:9D0C: D0 E7

		;Unreached
		JMP CODE_099D19				;- - - - - - 0x013D1E 04:9D0E: 4C
CODE_099D11:
	LDA #$00					;C - - - - - 0x013D21 04:9D11: A9 00
	STA mapBuffer,Y				;C - - - - - 0x013D23 04:9D13: 99 68 03
	STA mapBuffer+32,Y				;C - - - - - 0x013D26 04:9D16: 99 88 03
CODE_099D19:
.ifdef REGION_JP
	LDA nmiPrgBankB
	STA prgBankB
	STA $8001
.endif
	RTS							;C - - - - - 0x013D29 04:9D19: 60

.ifdef INCLUDE_DEBUG_MENU
StartDebugMenu:
	JSR CODE_0FEC8C					;- - - - - - 0x013D06 04:9CF6: 20
	LDA #FADE_OUT					;- - - - - - 0x013D09 04:9CF9: A9
	STA fadeMode				;- - - - - - 0x013D0B 04:9CFB: 8D
	LDA #$40					;- - - - - - 0x013D0E 04:9CFE: A9
	STA fadeUnk0556					;- - - - - - 0x013D10 04:9D00: 8D
	LDA #$03					;- - - - - - 0x013D13 04:9D03: A9
	STA fadeSpeedMask					;- - - - - - 0x013D15 04:9D05: 8D
	LDA #.LOBYTE(colorBuffer)					;- - - - - - 0x013D18 04:9D08: A9
	STA fadeColorsAdr					;- - - - - - 0x013D1A 04:9D0A: 8D
	LDA #.HIBYTE(colorBuffer)					;- - - - - - 0x013D1D 04:9D0D: A9
	STA fadeColorsAdr+1					;- - - - - - 0x013D1F 04:9D0F: 8D
	LDA #4					;- - - - - - 0x013D22 04:9D12: A9
	STA fadePasses					;- - - - - - 0x013D24 04:9D14: 8D
	LDA #32					;- - - - - - 0x013D27 04:9D17: A9
	STA fadeColorsAmount					;- - - - - - 0x013D29 04:9D19: 8D
	LDA #.LOBYTE(DebugMenuMapSetup)					;- - - - - - 0x013D2C 04:9D1C: A9
	STA updateSub					;- - - - - - 0x013D2E 04:9D1E: 85
	LDA #.HIBYTE(DebugMenuMapSetup)					;- - - - - - 0x013D30 04:9D20: A9
	STA updateSub+1					;- - - - - - 0x013D32 04:9D22: 85
	LDA #.LOBYTE(RunColorFader)					;- - - - - - 0x013D34 04:9D24: A9
	STA nmiBankedSub					;- - - - - - 0x013D36 04:9D26: 85
	LDA #.HIBYTE(RunColorFader)					;- - - - - - 0x013D38 04:9D28: A9
	STA nmiBankedSub+1					;- - - - - - 0x013D3A 04:9D2A: 85
	RTS					;- - - - - - 0x013D3C 04:9D2C: 60
.endif

.ifdef INCLUDE_DEBUG_MENU
DebugMenuMapSetup:
	LDA #$00					;- - - - - - 0x013D3D 04:9D2D: A9
	STA mapTargetAdr					;- - - - - - 0x013D3F 04:9D2F: 85
	LDX vNametable					;- - - - - - 0x013D41 04:9D31: A6
	LDA DebugMenuMapTargets,X					;- - - - - - 0x013D43 04:9D33: BD
	STA mapTargetAdr+1					;- - - - - - 0x013D46 04:9D36: 85
	LDA #mapBlank_ID					;- - - - - - 0x013D48 04:9D38: A9
	STA mapID					;- - - - - - 0x013D4A 04:9D3A: 8D
	JSR LoadMap					;- - - - - - 0x013D4D 04:9D3D: 20

	LDA #.LOBYTE(DebugMenuDigitsSetup)					;- - - - - - 0x013D50 04:9D40: A9
	STA updateSub					;- - - - - - 0x013D52 04:9D42: 85
	LDA #.HIBYTE(DebugMenuDigitsSetup)					;- - - - - - 0x013D54 04:9D44: A9
	STA updateSub+1					;- - - - - - 0x013D56 04:9D46: 85
	RTS					;- - - - - - 0x013D58 04:9D48: 60
.endif

.ifdef INCLUDE_DEBUG_MENU
DebugMenuMapTargets:
	.byte $20					;- - - - - - 0x013D59 04:9D49: 20
	.byte $28					;- - - - - - 0x013D5A 04:9D4A: 28
.endif

.ifdef INCLUDE_DEBUG_MENU
DebugMenuDigitsSetup:
	LDA #$0F					;- - - - - - 0x013D5B 04:9D4B: A9
	STA colorBuffer+(4*2)					;- - - - - - 0x013D5D 04:9D4D: 8D
	STA colorBuffer+(4*2)+1					;- - - - - - 0x013D60 04:9D50: 8D
	LDA #$30					;- - - - - - 0x013D63 04:9D53: A9
	STA colorBuffer+(4*2)+2					;- - - - - - 0x013D65 04:9D55: 8D
	LDA #$10					;- - - - - - 0x013D68 04:9D58: A9
	STA colorBuffer+(4*2)+3					;- - - - - - 0x013D6A 04:9D5A: 8D

	LDA currentRound					;- - - - - - 0x013D6D 04:9D5D: A5
	STA ram_00B6					;- - - - - - 0x013D6F 04:9D5F: 85
	LDA #chrShoeCar_A_ID					;- - - - - - 0x013D71 04:9D61: A9
	STA chrBankA					;- - - - - - 0x013D73 04:9D63: 85
	LDA #.LOBYTE(DebugPrintDigits)					;- - - - - - 0x013D75 04:9D65: A9
	STA nmiUnbankedSub					;- - - - - - 0x013D77 04:9D67: 85
	LDA #.HIBYTE(DebugPrintDigits)					;- - - - - - 0x013D79 04:9D69: A9
	STA nmiUnbankedSub+1					;- - - - - - 0x013D7B 04:9D6B: 85
	LDA #.LOBYTE(DebugMenuUpdate)					;- - - - - - 0x013D7D 04:9D6D: A9
	STA nmiBankedSub					;- - - - - - 0x013D7F 04:9D6F: 85
	LDA #.HIBYTE(DebugMenuUpdate)					;- - - - - - 0x013D81 04:9D71: A9
	STA nmiBankedSub+1					;- - - - - - 0x013D83 04:9D73: 85
	RTS					;- - - - - - 0x013D85 04:9D75: 60
.endif

.ifdef INCLUDE_DEBUG_MENU
DebugMenuUpdate:
	LDA globalTimer					;- - - - - - 0x013D86 04:9D76: A5
	AND #$07					;- - - - - - 0x013D88 04:9D78: 29
	BNE @inputchecked					;- - - - - - 0x013D8A 04:9D7A: D0

	LDA heldP2					;- - - - - - 0x013D8C 04:9D7C: A5
	CMP #KEY_UP					;- - - - - - 0x013D8E 04:9D7E: C9
	BEQ	@inc				;- - - - - - 0x013D90 04:9D80: F0
	CMP #KEY_DOWN					;- - - - - - 0x013D92 04:9D82: C9
	BEQ @dec					;- - - - - - 0x013D94 04:9D84: F0
	CMP #KEY_A					;- - - - - - 0x013D96 04:9D86: C9
	BEQ @startround					;- - - - - - 0x013D98 04:9D88: F0

	LDA heldP1					;- - - - - - 0x013D9A 04:9D8A: A5
	CMP #KEY_A					;- - - - - - 0x013D9C 04:9D8C: C9
	BEQ @playsound					;- - - - - - 0x013D9E 04:9D8E: F0
	CMP #KEY_B					;- - - - - - 0x013DA0 04:9D90: C9
	BEQ @playmusic					;- - - - - - 0x013DA2 04:9D92: F0

	JMP @inputchecked					;- - - - - - 0x013DA4 04:9D94: 4C
@inc:
	LDA #1					;- - - - - - 0x013DA7 04:9D97: A9
	STA scratch0					;- - - - - - 0x013DA9 04:9D99: 85
	JMP @browse					;- - - - - - 0x013DAB 04:9D9B: 4C
@dec:
	LDA #-1					;- - - - - - 0x013DAE 04:9D9E: A9
	STA scratch0					;- - - - - - 0x013DB0 04:9DA0: 85
@browse:
	LDA #snMenuBrowse_ID					;- - - - - - 0x013DB2 04:9DA2: A9
	STA a:soundTrigger					;- - - - - - 0x013DB4 04:9DA4: 8D
	LDA ram_00B6					;- - - - - - 0x013DB7 04:9DA7: A5
	CLC					;- - - - - - 0x013DB9 04:9DA9: 18
	ADC scratch0					;- - - - - - 0x013DBA 04:9DAA: 65
	STA ram_00B6					;- - - - - - 0x013DBC 04:9DAC: 85
	BNE	@notzero				;- - - - - - 0x013DBE 04:9DAE: D0
		LDA #80					;- - - - - - 0x013DC0 04:9DB0: A9
		STA ram_00B6					;- - - - - - 0x013DC2 04:9DB2: 85
		JMP @updatedigits					;- - - - - - 0x013DC4 04:9DB4: 4C
@notzero:
	CMP #81					;- - - - - - 0x013DC7 04:9DB7: C9
	BCC @updatedigits			;- - - - - - 0x013DC9 04:9DB9: 90
		LDA #1					;- - - - - - 0x013DCB 04:9DBB: A9
		STA ram_00B6					;- - - - - - 0x013DCD 04:9DBD: 85
@updatedigits:
	LDA #.LOBYTE(DebugPrintDigits)					;- - - - - - 0x013DCF 04:9DBF: A9
	STA nmiUnbankedSub					;- - - - - - 0x013DD1 04:9DC1: 85
	LDA #.HIBYTE(DebugPrintDigits)					;- - - - - - 0x013DD3 04:9DC3: A9
	STA nmiUnbankedSub+1					;- - - - - - 0x013DD5 04:9DC5: 85
	JMP @end					;- - - - - - 0x013DD7 04:9DC7: 4C
@startround:
	LDA #snMenuCont_ID					;- - - - - - 0x013DDA 04:9DCA: A9
	STA a:soundTrigger					;- - - - - - 0x013DDC 04:9DCC: 8D
	JSR DebugStartRound					;- - - - - - 0x013DDF 04:9DCF: 20
	JMP @end					;- - - - - - 0x013DE2 04:9DD2: 4C
@playsound:
	LDA ram_00B6					;- - - - - - 0x013DE5 04:9DD5: A5
	STA a:soundTrigger					;- - - - - - 0x013DE7 04:9DD7: 8D
	JMP @end					;- - - - - - 0x013DEA 04:9DDA: 4C
@playmusic:
	LDA #$00					;- - - - - - 0x013DED 04:9DDD: A9
	STA a:jingleTrigger					;- - - - - - 0x013DEF 04:9DDF: 8D
	LDA ram_00B6					;- - - - - - 0x013DF2 04:9DE2: A5
	STA a:musicTrigger					;- - - - - - 0x013DF4 04:9DE4: 8D
	JMP @end					;- - - - - - 0x013DF7 04:9DE7: 4C
@inputchecked:
	LDA #.LOBYTE(ColorBufferToVRAM)					;- - - - - - 0x013DFA 04:9DEA: A9
	STA nmiUnbankedSub					;- - - - - - 0x013DFC 04:9DEC: 85
	LDA #.HIBYTE(ColorBufferToVRAM)					;- - - - - - 0x013DFE 04:9DEE: A9
	STA nmiUnbankedSub+1					;- - - - - - 0x013E00 04:9DF0: 85
@end:
	RTS					;- - - - - - 0x013E02 04:9DF2: 60
.endif

.ifdef INCLUDE_DEBUG_MENU
DebugStartRound:
	LDY #$00					;- - - - - - 0x013E03 04:9DF3: A0
@findworld:
	LDA ram_00B6					;- - - - - - 0x013E05 04:9DF5: A5
	CMP DebugNewWorldRounds,Y					;- - - - - - 0x013E07 04:9DF7: D9
	BCC	@haveworld				;- - - - - - 0x013E0A 04:9DFA: 90
		INY					;- - - - - - 0x013E0C 04:9DFC: C8
		CPY #4					;- - - - - - 0x013E0D 04:9DFD: C0
		BNE @findworld					;- - - - - - 0x013E0F 04:9DFF: D0
@haveworld:
	;Y: World
	LDA DebugBonusProgress,Y					;- - - - - - 0x013E11 04:9E01: B9
	STA bonusGameProgress					;- - - - - - 0x013E14 04:9E04: 85
	LDA ram_00B6					;- - - - - - 0x013E16 04:9E06: A5
	STA currentRound					;- - - - - - 0x013E18 04:9E08: 85
	LDA #.BANK(CODE_088000)					;- - - - - - 0x013E1A 04:9E0A: A9
	STA nmiPrgBankA					;- - - - - - 0x013E1C 04:9E0C: 85
	LDA #$00					;- - - - - - 0x013E1E 04:9E0E: A9
	STA fadeMode					;- - - - - - 0x013E20 04:9E10: 8D
	LDA #$40					;- - - - - - 0x013E23 04:9E13: A9
	STA fadeUnk0556					;- - - - - - 0x013E25 04:9E15: 8D
	LDA #$03					;- - - - - - 0x013E28 04:9E18: A9
	STA fadeSpeedMask					;- - - - - - 0x013E2A 04:9E1A: 8D
	LDA #$00					;- - - - - - 0x013E2D 04:9E1D: A9
	STA fadeColorsAdr					;- - - - - - 0x013E2F 04:9E1F: 8D
	LDA #$03					;- - - - - - 0x013E32 04:9E22: A9
	STA fadeColorsAdr+1					;- - - - - - 0x013E34 04:9E24: 8D
	LDA #4					;- - - - - - 0x013E37 04:9E27: A9
	STA fadePasses					;- - - - - - 0x013E39 04:9E29: 8D
	LDA #32					;- - - - - - 0x013E3C 04:9E2C: A9
	STA fadeColorsAmount					;- - - - - - 0x013E3E 04:9E2E: 8D
	LDA #.LOBYTE(CODE_088000)					;- - - - - - 0x013E41 04:9E31: A9
	STA updateSub					;- - - - - - 0x013E43 04:9E33: 85
	LDA #.HIBYTE(CODE_088000)					;- - - - - - 0x013E45 04:9E35: A9
	STA updateSub+1					;- - - - - - 0x013E47 04:9E37: 85
	LDA #.LOBYTE(RunColorFader)					;- - - - - - 0x013E49 04:9E39: A9
	STA nmiBankedSub					;- - - - - - 0x013E4B 04:9E3B: 85
	LDA #.HIBYTE(RunColorFader)					;- - - - - - 0x013E4D 04:9E3D: A9
	STA nmiBankedSub+1					;- - - - - - 0x013E4F 04:9E3F: 85
	LDA #$00					;- - - - - - 0x013E51 04:9E41: A9
	STA roundPaused					;- - - - - - 0x013E53 04:9E43: 8D
	STA ram_0475					;- - - - - - 0x013E56 04:9E46: 8D
	STA a:jingleTrigger					;- - - - - - 0x013E59 04:9E49: 8D
	RTS					;- - - - - - 0x013E5C 04:9E4C: 60
.endif

.ifdef INCLUDE_DEBUG_MENU
DebugNewWorldRounds:
	.byte 21					;- - - - - - 0x013E5D 04:9E4D: 15
	.byte 41					;- - - - - - 0x013E5E 04:9E4E: 29
	.byte 61					;- - - - - - 0x013E5F 04:9E4F: 3D
	.byte 81					;- - - - - - 0x013E60 04:9E50: 51

DebugBonusProgress:
	.byte 1					;- - - - - - 0x013E61 04:9E51: 01
	.byte 2					;- - - - - - 0x013E62 04:9E52: 02
	.byte 3					;- - - - - - 0x013E63 04:9E53: 03
	.byte 4					;- - - - - - 0x013E64 04:9E54: 04
	.byte 1					;- - - - - - 0x013E65 04:9E55: 01
.endif

.ifdef INCLUDE_DEBUG_MENU
DebugPrintDigits:
	JSR DebugGetDigits					;- - - - - - 0x013E66 04:9E56: 20

	LDX vNametable					;- - - - - - 0x013E69 04:9E59: A6
	LDA PPUSTATUS					;- - - - - - 0x013E6B 04:9E5B: AD
	LDA DebugDigitsTargetHI,X					;- - - - - - 0x013E6E 04:9E5E: BD
	STA PPUADDR					;- - - - - - 0x013E71 04:9E61: 8D
	LDA #$90					;- - - - - - 0x013E74 04:9E64: A9
	STA PPUADDR					;- - - - - - 0x013E76 04:9E66: 8D

	LDX scratch0					;- - - - - - 0x013E79 04:9E69: A6
	LDA DebugDigitsUpperTile,X					;- - - - - - 0x013E7B 04:9E6B: BD
	STA PPUDATA					;- - - - - - 0x013E7E 04:9E6E: 8D
	LDX scratch1					;- - - - - - 0x013E81 04:9E71: A6
	LDA DebugDigitsUpperTile,X					;- - - - - - 0x013E83 04:9E73: BD
	STA PPUDATA					;- - - - - - 0x013E86 04:9E76: 8D

	LDX vNametable					;- - - - - - 0x013E89 04:9E79: A6
	LDA PPUSTATUS					;- - - - - - 0x013E8B 04:9E7B: AD
	LDA DebugDigitsTargetHI,X					;- - - - - - 0x013E8E 04:9E7E: BD
	STA PPUADDR					;- - - - - - 0x013E91 04:9E81: 8D
	LDA #$B0					;- - - - - - 0x013E94 04:9E84: A9
	STA PPUADDR					;- - - - - - 0x013E96 04:9E86: 8D

	LDX scratch0					;- - - - - - 0x013E99 04:9E89: A6
	LDA DebugDigitsLowerTile,X					;- - - - - - 0x013E9B 04:9E8B: BD
	STA PPUDATA					;- - - - - - 0x013E9E 04:9E8E: 8D
	LDX scratch1					;- - - - - - 0x013EA1 04:9E91: A6
	LDA DebugDigitsLowerTile,X					;- - - - - - 0x013EA3 04:9E93: BD
	STA PPUDATA					;- - - - - - 0x013EA6 04:9E96: 8D

	JMP NMISubRet					;- - - - - - 0x013EA9 04:9E99: 4C
.endif

.ifdef INCLUDE_DEBUG_MENU
DebugDigitsUpperTile:
	.byte $6A					;- - - - - - 0x013EAC 04:9E9C: 6A
	.byte $6C					;- - - - - - 0x013EAD 04:9E9D: 6C
	.byte $6E					;- - - - - - 0x013EAE 04:9E9E: 6E
	.byte $70					;- - - - - - 0x013EAF 04:9E9F: 70
	.byte $72					;- - - - - - 0x013EB0 04:9EA0: 72
	.byte $74					;- - - - - - 0x013EB1 04:9EA1: 74
	.byte $76					;- - - - - - 0x013EB2 04:9EA2: 76
	.byte $78					;- - - - - - 0x013EB3 04:9EA3: 78
	.byte $7A					;- - - - - - 0x013EB4 04:9EA4: 7A
	.byte $7C					;- - - - - - 0x013EB5 04:9EA5: 7C
DebugDigitsLowerTile:
	.byte $6B					;- - - - - - 0x013EB6 04:9EA6: 6B
	.byte $6D					;- - - - - - 0x013EB7 04:9EA7: 6D
	.byte $6F					;- - - - - - 0x013EB8 04:9EA8: 6F
	.byte $71					;- - - - - - 0x013EB9 04:9EA9: 71
	.byte $73					;- - - - - - 0x013EBA 04:9EAA: 73
	.byte $75					;- - - - - - 0x013EBB 04:9EAB: 75
	.byte $77					;- - - - - - 0x013EBC 04:9EAC: 77
	.byte $79					;- - - - - - 0x013EBD 04:9EAD: 79
	.byte $7B					;- - - - - - 0x013EBE 04:9EAE: 7B
	.byte $7D					;- - - - - - 0x013EBF 04:9EAF: 7D

DebugDigitsTargetHI:
	.byte $21					;- - - - - - 0x013EC0 04:9EB0: 21
	.byte $29					;- - - - - - 0x013EC1 04:9EB1: 29
.endif

DebugGetDigits:
	;Unreached
	;Used in JP-only debug menu
	;Return first and second digits of debug number in $00 and $01
	LDY #$00					;- - - - - - 0x013D2A 04:9D1A: A0
	LDA ram_00B6				;- - - - - - 0x013D2C 04:9D1C: A5
@check10:
	CMP #10					;- - - - - - 0x013D2E 04:9D1E: C9
	BCC @result				;- - - - - - 0x013D30 04:9D20: 90
		INY							;- - - - - - 0x013D32 04:9D22: C8
		SEC							;- - - - - - 0x013D33 04:9D23: 38
		SBC #10					;- - - - - - 0x013D34 04:9D24: E9
		JMP @check10				;- - - - - - 0x013D36 04:9D26: 4C
@result:
	STY scratch0				;- - - - - - 0x013D39 04:9D29: 84
	STA scratch1				;- - - - - - 0x013D3B 04:9D2B: 85
	RTS							;- - - - - - 0x013D3D 04:9D2D: 60

CODE_099D2E:
	LDA #.HIBYTE(@ret-1)					;C - - - - - 0x013D3E 04:9D2E: A9 9D
	PHA							;C - - - - - 0x013D40 04:9D30: 48
	LDA #.LOBYTE(@ret-1)					;C - - - - - 0x013D41 04:9D31: A9 36
	PHA							;C - - - - - 0x013D43 04:9D33: 48
	JMP (roundAnimSub)				;C - - - - - 0x013D44 04:9D34: 6C 59 00
@ret:
	JSR CODE_099BE7				;C - - - - - 0x013D47 04:9D37: 20 E7 9B
	RTS							;C - - - - - 0x013D4A 04:9D3A: 60

CODE_099D3B:
	LDY currentPlayer				;C - - - - - 0x013D4B 04:9D3B: AC 99 04
	LDX LivesDigitsPlayerOfs,Y			;C - - - - - 0x013D4E 04:9D3E: BE E5 9B
CODE_099D41:
	LDA ram_0491,X				;C - - - - - 0x013D51 04:9D41: BD 91 04
	BNE CODE_099D52				;C - - - - - 0x013D54 04:9D44: D0 0C
	LDA ram_0492,X				;C - - - - - 0x013D56 04:9D46: BD 92 04
	BNE CODE_099D52				;C - - - - - 0x013D59 04:9D49: D0 07
		LDA ram_0493,X				;C - - - - - 0x013D5B 04:9D4B: BD 93 04
		CMP #$03					;C - - - - - 0x013D5E 04:9D4E: C9 03
		BCC CODE_099D99				;C - - - - - 0x013D60 04:9D50: 90 47
CODE_099D52:
	LDA ram_0493,X				;C - - - - - 0x013D62 04:9D52: BD 93 04
	CMP #$03					;C - - - - - 0x013D65 04:9D55: C9 03
CODE_099D57:
	BCS CODE_099D70				;C - - - - - 0x013D67 04:9D57: B0 17
		LDA ram_0492,X				;C - - - - - 0x013D69 04:9D59: BD 92 04
		BNE CODE_099D6B				;C - - - - - 0x013D6C 04:9D5C: D0 0D
			;Unreached
			LDA ram_0491,X				;- - - - - - 0x013D6E 04:9D5E: BD
			BEQ CODE_099D99				;- - - - - - 0x013D71 04:9D61: F0
				DEC ram_0491,X				;- - - - - - 0x013D73 04:9D63: DE
				LDA #$0A					;- - - - - - 0x013D76 04:9D66: A9
				STA ram_0492,X				;- - - - - - 0x013D78 04:9D68: 9D
	CODE_099D6B:
		DEC ram_0492,X				;C - - - - - 0x013D7B 04:9D6B: DE 92 04
		LDA #$0A					;C - - - - - 0x013D7E 04:9D6E: A9 0A
CODE_099D70:
	SEC							;C - - - - - 0x013D80 04:9D70: 38
	SBC #$03					;C - - - - - 0x013D81 04:9D71: E9 03
	STA ram_0493,X				;C - - - - - 0x013D83 04:9D73: 9D 93 04
	LDA #snExtraLife_ID					;C - - - - - 0x013D86 04:9D76: A9 0B
	STA a:soundTrigger			;C - - - - - 0x013D88 04:9D78: 8D E1 00
	LDA playerLives				;C - - - - - 0x013D8B 04:9D7B: AD 79 04
	CMP #99					;C - - - - - 0x013D8E 04:9D7E: C9 63
	BCS CODE_099D85				;C - - - - - 0x013D90 04:9D80: B0 03
		INC playerLives				;C - - - - - 0x013D92 04:9D82: EE 79 04
CODE_099D85:
	INC bubblesLifespanLevel				;C - - - - - 0x013D95 04:9D85: E6 DA
	LDA bubblesLifespanLevel				;C - - - - - 0x013D97 04:9D87: A5 DA
	CMP #$0F					;C - - - - - 0x013D99 04:9D89: C9 0F
	BCC CODE_099D91				;C - - - - - 0x013D9B 04:9D8B: 90 04
		LDA #$0F					;C - - - - - 0x013D9D 04:9D8D: A9 0F
		STA bubblesLifespanLevel				;C - - - - - 0x013D9F 04:9D8F: 85 DA
CODE_099D91:
	LDA #$03					;C - - - - - 0x013DA1 04:9D91: A9 03
	STA livesCurrentPos				;C - - - - - 0x013DA3 04:9D93: 8D 98 04
	JMP CODE_099D41				;C - - - - - 0x013DA6 04:9D96: 4C 41 9D
CODE_099D99:
	RTS							;C - - - - - 0x013DA9 04:9D99: 60

.ifdef REGION_JP
DATA_JP_099F32:
	.byte $04					;- - - - - - 0x013F42 04:9F32: 04

CODE_JP_099F33:
	INC bubblesLifespanLevel	;- - - - - - 0x013F43 04:9F33: E6
	LDA bubblesLifespanLevel	;- - - - - - 0x013F45 04:9F35: A5
	CMP #15					;- - - - - - 0x013F47 04:9F37: C9
	BCC	CODE_JP_099F3F				;- - - - - - 0x013F49 04:9F39: 90
		LDA #15					;- - - - - - 0x013F4B 04:9F3B: A9
		STA bubblesLifespanLevel	;- - - - - - 0x013F4D 04:9F3D: 85
CODE_JP_099F3F:
	LDA #3					;- - - - - - 0x013F4F 04:9F3F: A9
	STA livesCurrentPos					;- - - - - - 0x013F51 04:9F41: 8D
	JMP CODE_099D57					;- - - - - - 0x013F54 04:9F44: 4C
	RTS					;- - - - - - 0x013F57 04:9F47: 60
.endif

.ifndef REGION_JP
;For JP, this is located in bank 0F instead
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
	BCS CODE_099DDF				;C - - - - - 0x013DD5 04:9DC5: B0 18
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
	BCS CODE_099E6E				;C - - - - - 0x013E10 04:9E00: B0 6C

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
	LDA #$00					;C - - - - - 0x013EB5 04:9EA5: A9 00
	ORA #$07					;C - - - - - 0x013EB7 04:9EA7: 09 07
	STA $8000				;C - - - - - 0x013EB9 04:9EA9: 8D 00 80
	LDA #.BANK(DATA_04BF6D)					;C - - - - - 0x013EBC 04:9EAC: A9 04
	STA $8001				;C - - - - - 0x013EBE 04:9EAE: 8D 01 80
	STA prgBankB				;C - - - - - 0x013EC1 04:9EB1: 85 53

	LDA #$00					;C - - - - - 0x013EC3 04:9EB3: A9 00
	ORA #$07					;C - - - - - 0x013EC5 04:9EB5: 09 07
	STA $8000				;C - - - - - 0x013EC7 04:9EB7: 8D 00 80
	LDA #.BANK(DATA_04BF6D)					;C - - - - - 0x013ECA 04:9EBA: A9 04
	STA $8001				;C - - - - - 0x013ECC 04:9EBC: 8D 01 80
	STA prgBankB				;C - - - - - 0x013ECF 04:9EBF: 85 53

	LDY ram_051A				;C - - - - - 0x013ED1 04:9EC1: AC 1A 05
	BEQ CODE_099EF0				;C - - - - - 0x013ED4 04:9EC4: F0 2A
		CPY #$03					;C - - - - - 0x013ED6 04:9EC6: C0 03
		BCC CODE_099EDB				;C - - - - - 0x013ED8 04:9EC8: 90 11
			LDA #$01					;C - - - - - 0x013EDA 04:9ECA: A9 01
			STA bonusRewardEarned				;C - - - - - 0x013EDC 04:9ECC: 8D 51 05

			LDA roundSkelDelay				;C - - - - - 0x013EDF 04:9ECF: A5 6D
			BEQ CODE_099EDB				;C - - - - - 0x013EE1 04:9ED1: F0 08
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
	LDA #$00					;C - - - - - 0x013F00 04:9EF0: A9 00
	STA ram_051A				;C - - - - - 0x013F02 04:9EF2: 8D 1A 05
	STA ram_0549				;C - - - - - 0x013F05 04:9EF5: 8D 49 05
CODE_099EF8:
	RTS							;C - - - - - 0x013F08 04:9EF8: 60
.endif

.ifdef REGION_JP
;Filler data
	;- - - - - - 0x013F58 04:9F48: F2
	.incbin "filler/fill09_JP.bin"
.endif