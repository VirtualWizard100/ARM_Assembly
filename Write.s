.global _start

_start:
	MOV r0, #1
	LDR r1, =Message
	LDR r2, =len
	MOV r7, #4
	SWI 0
	MOV r0, #0
	MOV r7, #1
	SWI 0

.data

Message:
	.align 4
	.asciz "Asher Harris \n"

len = .-Message
