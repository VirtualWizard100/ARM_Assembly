.global _start

_start:
        mov r1, #1
        sub r1, #10
        b loop

loop:
        lsr r1, #1
	cmp r1, #3
	beq exit
	addne r5, r5, #1
	b loop

exit:
	mov r0, #0
	mov r7, #1
	swi 0
