@The branches have to be integers, and the f means forward, and the b means backward depending on where the branch is that were calling
.MACRO toupper message, FillBlock
	ldr r0, =\message	@The original value of r0 is the non uppercase string
	ldr r1, =\FillBlock	@r1 is the fillblock from the main file that is going to have the uppercase string in it
	mov r2, r1		@r2 is the original value of r1 for comparison later
1:
	ldrb r3, [r0], #1	@r3 is the current character of the string in r0 with a post-increment value of 1
	cmp r3, #'z'
	bgt 2f
	cmp r3, #'a'
	blt 2f
	sub r3, #('a'-'A')
2:
	strb r3, [r1], #1	@after branch 1, store the potentially converted character in r3 in r1 with a post increment value of 1
	cmp r3, #0		@Compare r3 to 0
	bne 1b			@if it's not equal to 0, then branch back to 1
	sub r0, r1, r2		@The return code is the length of the value in r0, which is the value stored in r1 minus the value of r2
.ENDM
