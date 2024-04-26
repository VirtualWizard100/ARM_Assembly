.include "toupper.s"
.global _start

_start:
	toupper message, FillBlock
	mov r2, r0		@Move the length returned in r0 into r2
	ldr r1, =FillBlock	@Move the string stored in the Fill Block into r1
	mov r0, #1
	mov r7, #4
	svc 0
	mov r0, #0
	mov r7, #1
	svc 0
.data
message:
	.asciz "The string that will be converted to uppercase\n"
FillBlock:
	.fill 255, 4, 0
