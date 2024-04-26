.include "sumMacro.s"
.equ var1, 0xf
.equ var2, 0xe5
.global _start

_start:
	sum var1, var2
exit:
	mov r5, r0
	mov r0, #0
	mov r7, #1
	svc 0
