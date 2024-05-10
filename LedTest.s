.include "Mmap2Macro.s"

.global _start

_start:
	Mmap2
	nanoSleep
	gpioDirectionOut Pin17
	mov r9, #10
loop:
	gpioTurnOn Pin17
	nanoSleep
	gpioTurnOff Pin17
	subs r9, #1
	bne loop
	mov r0, #0
	mov r7, #1
	svc 0
