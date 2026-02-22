.include "bank_00.asm"
.include "bank_01.asm"
.include "bank_02.asm"
.include "bank_03.asm"
.include "bank_04.asm"
.include "bank_05.asm"
.include "bank_06.asm"
.include "bank_07.asm"
.include "bank_08.asm"
.include "bank_09.asm"
.include "bank_0A.asm"
.include "bank_0B.asm"
.include "bank_0C.asm"
.include "bank_0D.asm"
.include "bank_0E.asm"
.include "bank_0F.asm"

.segment "HEADER"

.ifdef REGION_US
	.incbin "../header_us.bin"
.endif

.ifdef REGION_JP
	.incbin "../header_jp.bin"
.endif