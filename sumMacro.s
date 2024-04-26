.MACRO sum var1, var2
	ldr r0, =\var1
	ldr r1, =\var2
	add r2, r0, r1
	mov r0, r2
.ENDM
