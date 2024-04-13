.global _start

_start:
	ldr r3, =messageLower
	ldr r4, =messageUpper

loop:
	ldrb r5, [r3], #1	@load the character from r3 with an post decrement offset of 1 to eventually go through the whole string of characters until you reach 0
	cmp r5, #'z'
	bgt cont		@If the character currently loaded in r5's value is greater than the value of z, then go to cont
	cmp r5, #'a'
	blt cont		@If the character currently loaded in r5's value is less than the value of a, then go to cont
	sub r5, #('a'-'A')	@Else, subtract from r5 the value of a - A, then go to cont
cont:
	strb r5, [r4], #1	@Store the now potentially uppercase characte in r5 in the current address of the Fill Block in r4 with a post decrement offset of 1 to go to the next address of r4 after
	cmp r5, #0
	bne loop		@If r5's value currently isn't 0, then continue
	mov r0, #1
	ldr r1, =messageUpper
	sub r2, r4, r1		@since r4 is the address of the fill block, and r1 is the fill block with the string being printed, subtracting r1 by r4 will give us the length of the string
	mov r7, #4
	swi 0
	mov r0, #0
	mov r7, #1
	swi 0
.data
messageLower:
	.asciz "The string that will be converted\n"
messageUpper:
	.fill 255, 1, 0
