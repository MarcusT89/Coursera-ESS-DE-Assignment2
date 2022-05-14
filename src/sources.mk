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

# General Files
GEN_SOURCES = main.c \
            memory.c
            
GEN_INCLUDES = -I ../include/common           


#Platform Variables
ifeq ($(PLATFORM),MSP432)
    SOURCES = GEN_SOURCES \
              interrupts_msp432p401r_gcc.c \
              startup_msp432p401r_gcc.c \
              system_msp432p401r.c 

    INCLUDES = GEN_INCLUDES \
               -I ../include/CMSIS \
               -I ../include/msp432
               
else
    SOURCES = GEN_SOURCES

    INCLUDES = GEN_INCLUDES

endif

