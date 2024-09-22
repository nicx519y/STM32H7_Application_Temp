##########################################################################################################################
# File automatically-generated by tool: [projectgenerator] version: [4.4.0-B60] date: [Mon Aug 19 20:10:20 HKT 2024] 
##########################################################################################################################

# ------------------------------------------------
# Generic Makefile (based on gcc)
#
# ChangeLog :
#	2017-02-10 - Several enhancements + project update mode
#   2015-07-22 - first version
# ------------------------------------------------

######################################
# target
######################################
TARGET = HBox


######################################
# building variables
######################################
# debug build?
DEBUG = 1
# optimization
OPT = -Og


#######################################
# paths
#######################################
# Build path
BUILD_DIR = build

######################################
# source
######################################

# C source dir
C_SOURCE_DIRS = \
Core/Src \
Drivers/STM32H7xx_HAL_Driver/Src \
Drivers/QSPI-W25Q64 \
Libs/tinyusb/src \
Libs/tinyusb/src/device \
Libs/tinyusb/src/common \
Libs/tinyusb/lib/networking \
Libs/tinyusb/src/portable/synopsys/dwc2 \
Libs/rndis \
TinyusbUser \
USB_DEVICE/App \
USB_DEVICE/Target \
Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src \
Middlewares/ST/STM32_USB_Device_Library/Core/Src \
Libs/stm32_mw_lwip/src/apps \
Libs/stm32_mw_lwip/src/core \
Libs/stm32_mw_lwip/src/netif \
Libs/stm32_mw_lwip/src/core/ipv4 \
Libs/FatFS \
# Libs/httpd \


# CPP sources
# CPP_SOURCES = \
# Cpp_Core/Src/cpp_main.cpp \

# Cpp cource dir
CPP_SOURCE_DIRS = \
Cpp_Core/Src \
Cpp_Core/Src/drivers/net \
Cpp_Core/Src/configs \

# ASM sources
ASM_SOURCES =  \
startup_stm32h750xx.s

# ASM sources
ASMM_SOURCES = 


#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
CXX = $(GCC_PATH)/$(PREFIX)g++      #C++
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
CXX = $(PREFIX)g++					#C++
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S
 
#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m7

# fpu
FPU = -mfpu=fpv5-d16

# float-abi
FLOAT-ABI = -mfloat-abi=hard

# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# macros for gcc
# AS defines
AS_DEFS = 

# C defines
C_DEFS =  \
-DUSE_HAL_DRIVER \
-DSTM32H750xx


# AS includes
AS_INCLUDES = 

# C includes
C_INCLUDES =  \
-ICore/Inc \
-IDrivers/STM32H7xx_HAL_Driver/Inc \
-IDrivers/STM32H7xx_HAL_Driver/Inc/Legacy \
-IDrivers/CMSIS/Device/ST/STM32H7xx/Include \
-IDrivers/CMSIS/Include \
-IDrivers/QSPI-W25Q64 \
-ICpp_Core/Inc \
-ILibs/tinyusb/src \
-ILibs/tinyusb/hw \
-ILibs/tinyusb/lib/networking \
-IMiddlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc \
-IMiddlewares/ST/STM32_USB_Device_Library/Core/Inc \
-ILibs/rndis \
-ILibs/httpd \
-ILibs/lwip-port \
-ITinyusbUser \
-IUSB_DEVICE/App \
-IUSB_DEVICE/Target \
-ICpp_Core/Inc \
-ILibs/stm32_mw_lwip/src/include \
-ILibs/FatFS \

# -ILibs/stm32_mw_lwip/src/include/lwip/apps \
# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CFLAGS += $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
endif


# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"


#######################################
# LDFLAGS
#######################################
# link script
LDSCRIPT = STM32H750XBHx_FLASH.ld	

# libraries
LIBS = -lc -lm -lnosys -lstdc++
LIBDIR = 
# D:/VscodeTools/WpdPack/Lib \  #wincap
# LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections
LDFLAGS = $(MCU) -specs=nano.specs -specs=nosys.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections -Wl,-V

#######################################
# build the application
#######################################
# list of objects

C_SOURCES = $(foreach dir, $(C_SOURCE_DIRS), $(wildcard $(dir)/*.c))
CPP_SOURCES = $(foreach dir, $(CPP_SOURCE_DIRS), $(wildcard $(dir)/*.cpp))

C_SOURCES += \
Libs/stm32_mw_lwip/src/apps/http/httpd.c \
# Libs/httpd/fs.c \
# Libs/stm32_mw_lwip/src/apps/http/fs.c \


# $(info $(C_SOURCES))
# $(info $(CPP_SOURCES))

OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))	
vpath %.c $(sort $(dir $(C_SOURCES)))
# C++
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(CPP_SOURCES:.cpp=.o)))
vpath %.cpp $(sort $(dir $(CPP_SOURCES)))

# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASMM_SOURCES:.S=.o)))
vpath %.S $(sort $(dir $(ASMM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@
# C++
$(BUILD_DIR)/%.o: %.cpp Makefile | $(BUILD_DIR) 
	$(CXX) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.cpp=.lst)) $< -o $@	
	
$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)	
	$(AS) -c $(CFLAGS) $< -o $@
$(BUILD_DIR)/%.o: %.S Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin

# openocdinit:
# 	openocd -f interface/stlink-v2-1.cfg -f target/stm32h7x.cfg -c init -c "reset halt" -c "stm32h7x unlock 0" -c "reset halt" -c "exit"

openocd:
	openocd -f ST-LINK.cfg -c "tcl_port disabled" -c "gdb_port disabled" -c "tcl_port disabled" -c "program $(BUILD_DIR)/$(TARGET).elf" -c reset -c shutdown


#######################################
# clean up
#######################################
clean:
	rmdir /s /q $(BUILD_DIR)
  
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***
