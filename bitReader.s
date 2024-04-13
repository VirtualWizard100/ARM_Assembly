.global _start

_start:
	mov r1, #128
	mov r2, #1
	b loop

loop:
	cmp r1, r2
	beq exit
	lsl r2, #1
	b loop

exit:
	mov r0, #0
	mov r7, #1
	swi 0
