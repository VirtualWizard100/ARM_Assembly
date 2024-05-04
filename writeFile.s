@.equ stdin, 0
@.equ stdout, 1
@.equ Create, 0100
@.equ filePermissions, 0666

.macro Create fileName, flags, filePermissions
	ldr r0, =\fileName		@Load the file name into r0
	mov r1, #\flags
	ldr r2, =\filePermissions@Read/Write
	mov r7, #8		@The Creat Syscall FUnction
	svc 0
.endm

.macro Open fileName, flags, filePermissions
	ldr r0, =\fileName
	mov r1, #\flags
	ldr r2, =\filePermissions
	mov r7, #5
	svc 0
.endm

.macro Write fileDescriptor, message, length
	ldr r0, =\fileDescriptor
	ldr r1, =\message	@The now capitalised message
	ldr r2,	\length		@Move the length of the message into r2 for linux function services
	mov r7, #4
	svc 0
.endm

.macro Fsync fileDescriptor
	mov r0, \fileDescriptor
	mov r7, #0x76		@The Fsync Syscall Function
	svc 0
.endm

.macro Close fileDescriptor
	mov r0, \fileDescriptor
	mov r7, #3		@The Close Syscall Function
	svc 0
.endm

.macro Chmod fileName, filePermissions
	ldr r0, =\fileName
	ldr r1, =\filePermissions
	mov r7, #0xf		@The Chmod Syscall Function
	svc 0
.endm

