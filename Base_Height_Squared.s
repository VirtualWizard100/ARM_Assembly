.global _start
_start:
	mov r3, #5		@Base
	mov r4, #7		@Height
	mul r4, r4, r4	@Squared
	mul r3, r3, r3	@Squared
	add r5, r4, r3	@Find the square root of this number
	mov r0, #0
	mov r7, #1
	svc 0
