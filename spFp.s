.global _start

@Each variable is going to be an offset of a multiple of 4 of the sp register
.equ var1, 0x0
.equ var2, 0x4
.equ var3, 0x8

_start:
	mov r1, #0xff
	mov r2, #0xaa
	mov r3, #0xcc
	str r1, [sp]
	str r1, [sp, #var2]
	str r3, [sp, #var3]
 
        @adding 12 to the sp Register to point to the next available address of memory
	add sp, #12
        @making it to where r9 points to the next available address of memory
	sub r9, sp, #4
        @subtracting 12 from the sp register to align with the variables
	sub sp, #12
        @Loading variable 1 into r5
	ldr r5, [sp, #var1]
	mov r0, #0
	mov r7, #1
	swi 0
