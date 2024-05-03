.include "toupper.s"
.include "writeFile.s"

.equ stdin, 0
.equ stdout, 1
.equ readWrite, 0766

.global _start

_start:
	toupper message, FillBlock
	mov r8, r0 @r0 returned the length of the newly capitalised string, move r0 into r8 to preserve the length value
	Create inFile, stdin, readWrite
	mov r9, r0
	Write r9, message, r8
	Fsync r9
	Close r9

.data
message:
        .asciz "Oi Lads.\n"
len = .-message
inFile:
        .asciz "StringFle.txt"
FillBlock:
        .fill 255, 1, 0
