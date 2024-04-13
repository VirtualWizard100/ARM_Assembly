.global _start

.equ max, 0xffffffff
_start:
	ldr r1, =max
	movt r2, #0xff
	adcs r1, r1, r2
	b exit
exit:
	mov r0, #0
	mov r7, #1
	swi 0

