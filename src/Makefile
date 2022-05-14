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
# include sources.mk <----
# Add your Source files to this variable
SOURCES = main.c \
		memory.c \


# Add your include paths to this variable
INCLUDES = 
# <-------

# Platform Overrides
PLATFORM = HOST \
		MSP432

# Architectures Specific Flags
LINKER_FILE = 
CPU = cortex-m4
ARCH = armv7e-m
SPECS = nosys.specs

# Compiler Flags and Defines
TARGET = c1m2
CC = 
LD = 
LDFLAGS = 
CFLAGS = 
CPPFLAGs = 

# **************
# **************

ifeq ($(PLATFORM),HOST)
	CC = gcc
	
else
	CC = arm-none-eabi-gcc
	CFLAGFS = -mcpu=$(CPU) -m$(ARCH) --specs=$(SPECS) -Wall
endif

OBJS = $(SRCS:.c=.o)

%.o : %.c
	$(CC) -c $< $(CFLAGS) -o $@

%.i : %.c
	$(CC) -c $< $(CFLAGS) -o $@

%.asm : %.c
	$(CC) -c $< $(CFLAGS) -o $@

.PHONY: build
build: all

.PHONY: all
all: $(TARGET).out

$(TARGET).out: $(OBJS)
	$(CC) $(OBJS) $(CFLAGS) $(LDFLAGS) -o $@

.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET).out $(TARGET).map $(TARGET).asm

