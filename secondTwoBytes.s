.global _start

_start:
	mov r1, #0xff
	movt r1, #0xffee
	rrx r1, r1
	lsl r2, r1, #1
	mov r0, #0
	mov r7, #1
	swi 0
