.global _start

_start:
	ldr r1, =Address	@Address for ASCII
	add r1, #9		@Address number plus 9 is the Address
	ldr r4, =0x5e2de3a5	@All 4 Bytes of ASCII characters
	mov r5, #8		@Amount of letters in total

loop:
	and r6, r4, #0xf	@Adding the least signifigant ASCII hex into r6
	cmp r6, #10		@Compare r6 to 10
	bgt letter		@if r6 is greater than 10, then it's a letter
	add r6, #'0'		@else it's a number, so add ascii decimal value of 0 to get number
	b cont			@ Branch straight to cont so that it doesn't go to letter

letter:
	add r6, #('A'-10)	@65 - 10 ensures that if r6 is greater than 10, then it adds the necessary number to make it an ascii character

cont:
	strb r6, [r1]		@Store the current ASCII character in the current Address of r1
	sub r1, #1		@Decrement the Address for the ASCII by 1
	lsr r4, #4		@Shift r4 to the next ASCII character
	subs r5, #1 		@subtract 1 from r5
	bne loop		@If r5 is not equal to zero, continue looping
	ldr r1, =Address	@Reload the start of the ASCII Address
	mov r2, #11		@The length of the ASCII
	mov r7, #4		@Syscall Linux to Write
	swi 0			@System Interrupt
	mov r0, #0		@Return zero
	mov r7, #1		@Syscall to exit
	swi 0			@System Interrupt

.data
Address:
	.asciz "0x12345678 \n"
