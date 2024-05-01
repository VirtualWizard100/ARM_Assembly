.include "fileMacros.s"
.include "toupper.s"

.equ bufferLength, 250

.global _start
_start:
	fileOpen inFile, readOnly	@The string name of the file (This one is fileExecutions.s) with read only permissions
	movs r8, r0		@Save the positive file descriptor created to be able to keep interacting with the instance of the open session movs will test to see if it's positiive, if not, it will set the zero flag
	bpl nextFile		@If the previous instruction resulted in a positive value, then branch to nextFile

	@Else, raise an Error
	ldr r2, =inpErrsz	@The length of the Error Message
	mov r1, #1		@stdout
	ldr r2, [r2]		@The length in the address of the Error Message
	writeFile r1, inpErr, r2@r1 takes the file descriptors place to write the string out into terminal, the Fill Block is replaced with the string of the error, and r2 is the length
	b exit

nextFile:
	fileOpen outFile, Create+readOnly	@The outFile (Which is upper.txt), with create to create the new file, and read only permissions combined to put into the second parameter
	movs r9, r0		@Save the file descriptor to preserve the instance of the file being open for further use
	bpl loop

	mov r1, #1		@stdout
	ldr r2, =outErrsz	@The length of the Error Message
	ldr r2, [r2]		@The value in the address of the Error Message
	writeFile r1, outErr, r2
	b exit

loop:
	fileRead FillBlock, bufferLength
	mov r10, r0		@Preserve the length of the string
        mov r1, #0		@Move zero into r1 to put at the end of the string
	strb r1, [r0, r10]	@Move zero into r0 with the offset of the string to put it at the end of the string
	ldr r1, =outFill	@Load the string in r1
	toupper r1, FillBlock
	writeFile r9, outFill, r10

	cmp r10, #bufferLength	@Compare r10 to 250
	beq loop
	@Save file descriptors r8, and r9, then delete them, closing the sessions/files
	flushClose r8
	flushClose r9
.data
inFile:
	.asciz "fileExecutions.s"
outFile:
	.asciz "upper.txt"
FillBlock:
	.fill bufferLength + 1, 1, 0
outFill:
	.fill bufferLength + 1, 1, 0
inpErr:
	.asciz "Failed to open input file"
inpErrsz:
	.word .-inpErr
outErr:
	.asciz "Failed to open output file"
outErrsz:
	.word .-outErr
