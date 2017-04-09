CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy
ARCH = cortex-a7
ASM_FLAGS = -fpic -ffreestanding -mcpu=$(ARCH)
C_FLAGS = -fpic -ffreestanding -std=gnu99 -O2 -Wall -Wextra -mcpu=$(ARCH)
LD_FLAGS = -ffreestanding -O2 -nostdlib
OBJCOPY_FLAGS = -O binary

ODIR = out

_ELF = kernel.elf
ELF = $(patsubst %,$(ODIR)/%,$(_ELF))

_BIN = kernel.bin
BIN = $(patsubst %,$(ODIR)/%,$(_BIN))

_ASM_OBJ = boot.o
ASM_OBJ = $(patsubst %,$(ODIR)/%,$(_ASM_OBJ))

_C_OBJ = kernel.o
C_OBJ = $(patsubst %,$(ODIR)/%,$(_C_OBJ))

OBJ = $(C_OBJ) $(ASM_OBJ)

out/%.o: %.c
	$(CC) -c -o $@ $< $(C_FLAGS)

out/%.o: %.S
	$(CC) -c -o $@ $< $(ASM_FLAGS)

#out/%.elf: $(OBJ)
#	$(CC) -T linker.ld -o $@ $(OBJ) $(LD_FLAGS)

kernel: $(OBJ)
	$(CC) -T linker.ld -o $(ODIR)/$@.elf $(OBJ) $(LD_FLAGS)


.PHONY: clean
clean: 
	rm -rf $(ODIR)/*
