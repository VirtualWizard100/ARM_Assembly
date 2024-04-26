.include "closestSquareRootMacro.s"
.global _start

.equ num, 0xf

_start:
	squareRoot num

exit:
	mov r0, #0
	mov r7, #1
	svc 0
