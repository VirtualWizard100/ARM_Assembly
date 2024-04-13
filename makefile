OBJS=adc.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS = 
endif

%.o: %.s
	as $(DEBUGFLGS) $< -o $@

adc: $(OBJS)
	ld -o adc $(OBJS)
