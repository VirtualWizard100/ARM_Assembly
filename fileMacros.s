
.equ readOnly, 0
.equ writeOnly, 1
.equ Create, 0100	@This value is to be placed in the call parameters to create a new file
.equ readWrite, 0666	@read/write for ugo in chmod

.macro fileOpen fileName, Flags	@Linux needs the file name, stdin or stdout, and the  file permissions before opening to create the file descriptor
	ldr r0, =\fileName
	ldr r1, #\Flags		@If it's a 1, then it would be stdout, otherwise it's stdin
	mov r2, #readWrite	@Load the 0666 in r2 for read/write
	mov r7, #5		@Open Syscall Function
	svc 0
.endm

.macro fileRead fd, FillBlock, Length
	mov r0, #\fd
	ldr r1, =\FillBlock	@The read Syscall needs a FillBlock to read the ascii to
	mov r2, #\Length	@The read syscall function needs the Length of the Text being read
	mov r7, #3		@Read Syscall Function
	svc 0
.endm

.macro writeFile fd, FillBlock, Length
        mov r0, \fd
        ldr r1, =\FillBlock	@The Write syscall function needs a Fill Block to Write the processed information to
        mov r2, \Length		@The Write syscall function needs the Length of the Fill Block to write the information to
        mov r7, #4		@Write Syscall Function
        svc 0
.endm

.macro flushClose fd
	mov r0, \fd	@Put the file Descriptor in r0 for linux services
	mov r7, #76	@Fsync (Short for File Sync) Syscall Function, save the current version of the file from the file descriptor (Commit)
	svc 0
	mov r0, \fd	@Reload the File Descriptor
	mov r7, #6	@Close Syscall Function, close the file deleting the File Descriptor
	svc 0
.endm
