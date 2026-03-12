DEVKITPRO ?= /opt/devkitpro
PREFIX := arm-none-eabi-
CC := $(PREFIX)gcc
OBJCOPY := $(PREFIX)objcopy
CFLAGS := -Wall -mthumb -mthumb-interwork -O2 -fomit-frame-pointer
LDFLAGS := -T$(DEVKITPRO)/libgba/template.ld
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
