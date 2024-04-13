.global _start

_start:
	ldr r3, =block
 
loop:
	strb r5, [r3], #1
	add r5, #1
	cmp r5, #128
	bne loop
	mov r0, #1
	ldr r1, =block
	sub r2, r3, r1
	mov r7, #4
	swi 0
	mov r0, #0
	mov r7, #1
	swi 0

.data
block:
	.fill 128, 1, 0

