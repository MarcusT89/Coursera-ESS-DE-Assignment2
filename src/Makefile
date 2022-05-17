#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************

#------------------------------------------------------------------------------
# <Put a Description Here>
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      <Put a description of the supported targets here>
#
# Platform Overrides:
#      <Put a description of the supported Overrides here
#
#------------------------------------------------------------------------------

include sources.mk

# Platform Overrides
PLATFORM = HOST 

# General Flags / VAriables
GEN_CFLAGS = -Wall Werror -g -O0 -std=c99

TARGET = c1m2

ifeq ($(PLATFORM),MSP432)
# MSP432 Flags	
# Architectures Specific Flags
	LINKER_FILE = msp432p401r.lds
	CPU = cortex-m4
	ARCH = armv7e-m
	SPECS = nosys.specs
	ARM_FLAGS = -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16
	
# Compiler Flags and Defines
	CC = arm-none-eabi-gcc
	LD = arm-none-eabi-ld
	CFLAGFS = $(GEN_CFLAGS) -mcpu=$(CPU) -march=$(ARCH) --specs=$(SPECS) $(ARM_FLAGS)
	LDFLAGS = -Wl,-Map=$(TARGET).map -T ../$(LINKER_FILE)
	CPPFLAGS = -DMSP432 $(INCLUDES)
	
	OBJDUMP = arm-none-eabi-objdump
	SIZE = arm-none-eabi-size
	
else 
# HOST Flags
# Compiler Flags and Defines
	CC = gcc
	LD = ld
	LDFLAGS = -Wl,-Map=$(TARGET).map
	CPPFLAGS = -DHOST $(INCLUDES)
	OBJDUMP = objdump
	SIZE = size

endif


OBJS = $(SOURCES:.c=.o)
PREP = $(SOURCES:.c=.i)
ASM = $(SOURCES:.c=.asm)
DEPS = $(SOURCES:.c=.d)

%.o : %.c
	$(CC) $(CPPFLAGS) -c $< $(CFLAGS) -o $@

%.i : %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -E $< -o $@ 

%.d : %.c
	$(CC) -E -M $< -o $@ $(CPPFLAGS)

%.asm : %.c | $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -S $< -o $@
	$(CC) $(OBJS) -o $(TARGET).out $(CFLAGS) $(LDFLAGS) $(CPPFLAGS)
	$(OBJDUMP) -S $(TARGET).out -D > objdump.txt
	rm -f $(OBJS) $(TARGET).map

$(TARGET).out: $(OBJS) $(DEPS)
	$(CC) $(OBJS) -o $@ $(CFLAGS) $(LDFLAGS) $(CPPFLAGS)
	$(SIZE) -Atd $@ > size.txt


.PHONY: build compile-all clean

build: $(TARGET).out

compile-all: $(OBJS)

clean:
	rm -f $(OBJS) $(PREP) $(ASM) $(DEPS) $(TARGET).out $(TARGET).map objdump.txt size.txt

