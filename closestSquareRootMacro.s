.MACRO squareRoot num
	push {r4-r12}
	ldr r0, =\num		@The number that were trying to find the square root of
	mov r4, #1		@The perfect square square root incrementor

1:
	mul r5, r4, r4		@r5 is r4 squared
	cmp r5, r0		@Compare the squared number to r9
	bgt 2f          	@If r3 is greater than r9, then branch to subtraction
	beq 3f   		@Else if r3 is equal to r9, branch to Congrats
	add r4, #1		@Else add 1 to r4
	eor r5, r5		@Clear r3
	b 1b 			@Branch to loop

2:
	sub r4, #1		@Subtract 1 from r4
	eor r5, r5		@Clear r3
	mul r5, r4, r4		@r3 is r4 squared
	sub r8, r0, r5		@Put into r8 r9 minus r3
	lsl r9, r4, #1		@r5 is r4 multiplied by 2
3:
	mov r0, r4
	pop {r4-r12}
.ENDM
