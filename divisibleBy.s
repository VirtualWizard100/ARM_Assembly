.global _start

_start:
	add r1, #2
	cmp r1, #256
	bgt exit
	beq congrats
	b _start

congrats:
	mov r0, #1
	ldr r1, =message
	ldr r2, =equalLen
	mov r7, #4
	swi 0
	mov r7, #1
	swi 0

exit:
	mov r0, #1
	ldr r1, =nemessage
	ldr r2, =neLen
	mov r7, #4
	swi 0
	mov r7, #1
	swi 0

.data
message:
	.asciz "256 is divisible by r1 \n"
equalLen = .-message
nemessage:
	.asciz "256 is not divisible by r1 \n"
neLen = .-nemessage
