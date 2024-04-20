.global _start

.equ var1, 0x0
.equ var2, 0x4
.equ var3, 0x8

_start:
	mov r1, #0xff
	mov r2, #0xaa
	mov r3, #0xcc
	str r1, [sp]
	str r1, [sp, #var2]
	str r3, [sp, #var3]
	add sp, #12
	sub r9, sp, #4
	sub sp, #12
	ldr r5, [sp, #var1]
	mov r0, #0
	mov r7, #1
	swi 0
