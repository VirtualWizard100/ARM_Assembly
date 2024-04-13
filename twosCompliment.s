.global _start

_start:
	ldr r1, =0x10030405
	mvn r1, r1
	ldr r2, =twosCompliment
	add r2, #1
	eor r3, r1, r2
exit:
	mov r7, #1
	swi 0

.data
twosCompliment:
	.word -0x100074
