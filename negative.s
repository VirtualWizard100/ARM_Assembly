.global _start

_start:
	mvn r1, #1
	adds r1, #1
	b exit
exit:
	mov r0, #0
	mov r7, #1
	swi 0
