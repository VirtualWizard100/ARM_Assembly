.global _start

_start:
	MOV r1, #1
	RRX r1, r1
	MOV r7, #1
	SWI 0
