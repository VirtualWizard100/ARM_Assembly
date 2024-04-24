.global _start
.equ num, 0xfe5
_start:
	ldr r9, =num		@The number that were trying to find the square root of
	mov r4, #1		@The perfect square square root incrementor

loop:
	mul r3, r4, r4		@r3 is r4 squared
	cmp r3, r9		@Compare the squared number to r9
	bgt Subtraction		@If r3 is greater than r9, then branch to subtraction
	beq Congrats		@Else if r3 is equal to r9, branch to Congrats
	add r4, #1		@Else add 1 to r4
	eor r3, r3		@Clear r3
	b loop			@Branch to loop

Subtraction:
	sub r4, #1		@Subtract 1 from r4
	eor r3, r3		@Clear r3
	mul r3, r4, r4		@r3 is r4 squared
	sub r8, r9, r3		@Put into r8 r9 minus r3
	lsl r5, r4, #1		@r5 is r4 multiplied by 2 
	b Congrats

Congrats:
	mov r0, r4
	mov r7, #1
	svc 0
