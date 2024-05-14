.include "writeFile.s"

@.equ 0_9, 0x3f200000
@.equ 10_19, 0x3f200004
@.equ 20_29, 0x3f200008
@.equ 30_39, 0x3f20000c
@.equ 40_49, 0x3f200010
@.equ 50_53, 0x3f200014
@.equ GPSET_0_31, 0x3f20001c
@.equ GPSET_32_53, 0x3f200020
@.equ GPCLR_0_31, 0x3f200028
.equ gpset_0_31_offset, 28
.equ gpclr_0_31_offset, 40
@.equ GPCLR_32_53, 0x3f20002c
.equ pagelen, 4096
.equ readWrite, 0766
.equ protectedRead, 1
.equ protectedWrite, 2
.equ MAP_SHARED, 1

.macro Mmap2
	Open fileDescriptor, RW
	mov r4, r0 		@fd for Mmap2
	mov r1, #pagelen
	ldr r5, =gpioAddr	@Load into r5 the memory address for pins 0-9
	ldr r5, [r5]		@Load into r5 the value in the memory address
	mov r2, #(protectedRead + protectedWrite)		@Protected Read (1) + Protected Write (2)
	mov r3, #MAP_SHARED	@Map Shared value
	mov r0, #0
	mov r7, #0xc0
	svc 0
	mov r8, r0		@The address of the gpio pins
.endm

.macro nanoSleep
	ldr r0, =timespecsec
	ldr r1, =timespecsec
	mov r7, #0xa2
	svc 0
.endm

.macro gpioDirectionOut pin
	ldr r2, =\pin		@Load the first word from the Pin into r2, which is the offset address
	ldr r2, [r2]		@Obtain the value to offset from r2
	ldr r1, [r8, r2]	@Offset the gpio access address by the amount of the pin you want to use to access the pin
	ldr r3, =\pin
	add r3, #4
	ldr r3, [r3]		@Load from second word address in the pin data to get the value
	mov r0, #0b111		@Load a mask to clear 3 bits
	lsl r0, r3		@Offset the amount of the second word to shift the clear bits into position
	bic r1, r0		@clear the bits of the pin address for in or out direction
	mov r0, #1		@Load the bit into r0 for writing to the pin
	lsl r0, r3		@shift the bit into position
	orr r1, r0		@set the bit
	str r1, [r8, r2]	@store the new value in the address of the pin to write
.endm

.macro gpioTurnOn pin, value
	mov r2, r8
	add r2, #gpset_0_31_offset
	mov r0, #1
	ldr r3, =\pin
	add r3, #8
	ldr r3, [r3]
	lsl r0, r3
	str r0, [r2]
.endm

.macro gpioTurnOff pin, value
        mov r2, r8
        add r2, #gpclr_0_31_offset
        mov r0, #1
        ldr r3, =\pin
        add r3, #8
        ldr r3, [r3]
        lsl r0, r3
        str r0, [r2]
.endm

.data
gpioAddr:
	.word 0x3f200
Pin17:
	.word 4
	.word 21
	.word 17
timespecsec:
	.word 0
timespecnano:
	.word 10000000
fileDescriptor:
	.asciz "/dev/mem"
