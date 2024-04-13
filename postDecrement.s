.global _start
_start:
        ldr r2, =block
        ldr r1, =0x100074
	mov r5, #-4
	mov r9, r2
	sub r9, #40 @r9 is the final word location in the block stored in r2
loop:
        @str r1, [r2, r5]! @r5 is going to be the offset from the original addre
        str r1, [r2], r5 @r1 will store it's value in the current address of r2, then r2 will decrement by 4 afterward due to r5
        ldr r1, [r2]
        cmp r2, r9 @If r2 and r9 aren't equal, then it will continue to loop
        bne loop
        mov r7, #1
        swi 0

.data
block:
        .fill 10, 4, 0
