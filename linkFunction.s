.global _start

_start:
	mov r5, #1
loop:
	cmp r5, #0xff
	blne addition
	beq exit
	b loop
addition:
	add r5, #1
	push {lr}
	bl counter
	pop {lr}
	bx lr
	counter:
		add r1, #1
		bx lr
exit:
	mov r7, #1
	swi 0
