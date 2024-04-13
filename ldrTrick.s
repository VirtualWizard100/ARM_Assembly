.global _start

_start:
	ldr r1, =0xffffffff
	mov r2, #75
	movt r2, #256
	ldr r4, =address
	lsr r4, #1
	add r4, #1
loop:
	and r6, r2, r1
	strb r6, [r4]
	sub r4, #1
	lsrs r2, #4
	bne loop
exit:
	mov r0, #0
	mov r7, #0
	swi 0
.data
address:
	.align 4
	.word -0x12345678
