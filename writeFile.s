.include "toupper.s"
.global _start

.equ filePermissions, 0766

_start:
	toupper message, FillBlock
	mov r8, r0		@r0 returned the length of the newly capitalised string, move r0 into r8 to preserve the length value
	ldr r0, =inFile		@Load the file name into r0
	mov r1, #0		@0 for stdin
	ldr r2, =filePermissions@Read/Write
	mov r7, #8		@The Creat Syscall FUnction
	svc 0
	ldr r1, =FillBlock	@The now capitalised message
	mov r2,	r8		@Move the length of the message into r2 for linux function services
	mov r7, #4		@The write Syscall Function
	svc 0
	mov r7, #0x76		@The Fsync Syscall Function
	svc 0
	mov r7, #3		@The Close Syscall Function
	svc 0
	ldr r0, =inFile
	ldr r1, =filePermissions
	mov r7, #0xf		@The Chmod Syscall Function
	svc 0
	mov r7, #1		@The Exit Syscall Function
	svc 0

.data
message:
	.asciz "Oi Lads.\n"
len = .-message
inFile:
	.asciz "Oi_Lads.txt"
FillBlock:
	.fill 255, 1, 0
