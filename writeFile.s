.include "toupper.s"
.global _start

.equ filePermissions, 0766

_start:
	toupper message, FillBlock
	mov r8, r0
	ldr r0, =inFile
	mov r1, #0
	ldr r2, =filePermissions
	mov r7, #8
	svc 0
	ldr r1, =FillBlock
	mov r2,	r8
	mov r7, #4
	svc 0
	mov r7, #0x76
	svc 0
	mov r7, #3
	svc 0
	ldr r0, =inFile
	ldr r1, =filePermissions
	mov r7, #0xf
	svc 0
	mov r7, #1
	svc 0

.data
message:
	.asciz "Oi Lads.\n"
len = .-message
inFile:
	.asciz "Oi_Lads.txt"
FillBlock:
	.fill 255, 1, 0
