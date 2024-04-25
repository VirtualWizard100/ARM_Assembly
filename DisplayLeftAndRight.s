.global _start
@Just put a value into the switch before executing.
@Also make sure that you're on ARMv7 DE1-SoC
.equ SWITCH, 0xff200040
.equ SevenDisplays, 0xff200020
_start:
	ldr r0, =SWITCH
	ldr r1, =SevenDisplays
	ldr r3, =0x01000000
	ldr r2, [r0]
	
ShiftLeft:
	str r2, [r1]
	ldr r2, [r1]
	cmp r2, r3
	blge ShiftRight
	lsl r2, #8
	b ShiftLeft
	
ShiftRight:
	lsr r2, #8
	str r2, [r1]
	cmp r2, #0x80
	bgt ShiftRight
	add r9, #1
	cmp r9, #5
	beq exit
	b ShiftLeft
	
exit:
	mov r0, #0
	mov r7, #1
	swi 0