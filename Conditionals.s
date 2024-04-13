.global _start
_start:
	mvn r1, #45
	add r1, #1
	mov r2, #55
	cmn r2, r1 @Assuming that were starting from the negative value of r1, and were adding r2 to r1, if the result is greater than 0, then it's greater than, if it's 0, then it's equal, and if it's negative, then it's less than
	blt exit
	bgt loop
	b congrats
loop:
	mov r0, #1
	ldr r1, =message3
	ldr r2, =len3
	mov r7, #4
	swi 0
	b Exit

congrats:
	mov r0, #1
	ldr r1, =message1
	ldr r2, =len1
	mov r7, #4
	swi 0
	b Exit

exit:
	mov r0, #1
	ldr r1, =message2
	ldr r2, =len2
	mov r7, #4
	swi 0
Exit:
	mov r7, #1
	swi 0
.data

message1:
	.asciz "congrats \n"

message2:
	.asciz "Less than. \n"

message3:
	.asciz "Greater than. \n"

len1 = .-message1

len2 = .-message2

len3 = .-message3
