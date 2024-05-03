.include "toupper.s"
.include "writeFile.s"

.equ stdin, 0
.equ stdout, 1
.equ readWrite, 0766

.global _start

_start:
	toupper message, FillBlock
	mov r9, r0 @r0 returned the length of the newly capitalised string, move r0 into r8 to preserve the length value
	Create inFile, stdin, readWrite
	mov r8, r0
	@Write r8, FillBlock, r9
	Fsync r8
	Close r8
	Chmod inFile, readWrite
.data
message:
        .asciz "Oi Lads.\n"
len = .-message
inFile:
        .asciz "StringFle.txt"
FillBlock:
        .fill 250, 1, 0
