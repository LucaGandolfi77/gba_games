DEVKITPRO ?= /opt/devkitpro
PREFIX := arm-none-eabi-
# Use devkitPro-provided toolchain to ensure correct startup files/libs are used
CC := /opt/devkitpro/devkitARM/bin/arm-none-eabi-gcc
OBJCOPY := /opt/devkitpro/devkitARM/bin/arm-none-eabi-objcopy
CFLAGS := -Wall -mthumb -mthumb-interwork -O2 -fomit-frame-pointer
# Add devkitPro include paths so libgba headers are found
CFLAGS += -I$(DEVKITPRO)/libgba/include -I$(DEVKITPRO)/devkitarm/arm-none-eabi/include
LDFLAGS := -L$(DEVKITPRO)/libgba/lib -L$(DEVKITPRO)/devkitARM/arm-none-eabi/lib -T$(DEVKITPRO)/devkitARM/arm-none-eabi/lib/gba_cart.ld
LIBS := -lgba -lm

TARGET := game02
SOURCES := src/main.c
OBJECTS := $(SOURCES:src/%.c=build/%.o)

all: $(TARGET).gba

build/%.o: src/%.c
	@mkdir -p build
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET).elf: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@ $(LDFLAGS) $(LIBS)
	$(OBJCOPY) -O binary $@ $(TARGET).gba

$(TARGET).gba: $(TARGET).elf

clean:
	rm -rf build $(TARGET).elf $(TARGET).gba

.PHONY: all clean
