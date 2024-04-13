.global _start

_start:
	movt r1, #1
	b loop

loop:
	cmp r1, #1
	bleq rotate @after rotating right until getting to the lowest bit
	mov r3, #1
	ror r1, r3
	mov r2, #0x0100 @equal to the lowest bit of the second Byte
	cmp r1, r2 @Both are equal to the lowest bit of the second Byte
	add r5, r5, #1 @Counter of how many times rotated
	beq exit
	b loop

rotate: @only works if r1 and r2 are never equal, comment out r1, and r2 comparison to enable
	rrx r1, r1
	bx lr

exit:
	mov r0, #0
	mov r7, #1
	swi 0

