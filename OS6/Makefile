##################################################
# Makefile
##################################################
ASM:=nasm
CC:=gcc
LD:=ld
DASM:=ndisasm
DASMOUTPUT:=kernel.bin.asm

ENTRYPOINT:=0x30400
AKFLAGS_F:=-f elf32
AKFLAGS_FI:=-f elf32 -I kernel/include/
ABFLAGS_I:=-I boot/include/
CFLAGS:=-m32 -c
CFLAGS_I:=-I kernel/include/ -fno-builtin
CFLAGS_IL:=-I lib/include/ -fno-builtin
LDFLAGS:=-m elf_i386 -s
KERNEL_INC:=kernel/include/kernel.h  kernel/include/global.h kernel/include/interrupt.h kernel/include/klib.h kernel/include/protect.h kernel/include/process.h
KERNEL_BIN:=kernel.bin
OBJS:=kernel/kernel.o lib/kliba.o  kernel/start.o kernel/interrupt.o lib/klibc.o kernel/global.o kernel/kmain.o kernel/protect.o

IMG:=a.img
FLOPPY:=/mnt/img/
image:all buildimg
all : clean
#.PHONY : everything
disasm:
	$(DASM) -u -o 0x30400 -e 0x400 kernel.bin >$(DASMOUTPUT)

buildimg : boot/boot.bin boot/loader.bin $(KERNEL_BIN)
	dd if=boot/boot.bin of=$(IMG) bs=512 count=1 conv=notrunc
	sudo mount -o loop $(IMG) $(FLOPPY)
	sudo cp -fv boot/loader.bin $(FLOPPY)
	sudo cp -fv $(KERNEL_BIN) $(FLOPPY)
	sudo umount $(FLOPPY)

clean :
	rm -f boot/boot.bin boot/loader.bin $(KERNEL_BIN) $(OBJS)
boot/boot.bin : boot/boot.asm
	$(ASM)  $< -o $@
boot/loader.bin : boot/loader.asm boot/include/pm.inc boot/include/lib.inc
	$(ASM) $(ABFLAGS_I) $< -o $@
kernel/kernel.o :kernel/kernel.asm kernel/include/kernel.inc
	$(ASM) $(AKFLAGS_FI) $< -o $@
lib/kliba.o:lib/kliba.asm
	$(ASM) $(AKFLAGS_F) $< -o $@
kernel/start.o:kernel/start.c $(KERNEL_INC)
	$(CC) $(CFLAGS_I) $(CFLAGS) $< -o $@
kernel/interrupt.o:kernel/interrupt.c $(KERNEL_INC)
	$(CC) $(CFLAGS_I) $(CFLAGS) $< -o $@
kernel/global.o:kernel/global.c $(KERNEL_INC)
	$(CC) $(CFLAGS_I) $(CFLAGS) $< -o $@
kernel/protect.o:kernel/protect.c $(KERNEL_INC)
	$(CC) $(CFLAGS_I) $(CFLAGS) $< -o $@
kernel/kmain.o:kernel/kmain.c $(KERNEL_INC)
	$(CC) $(CFLAGS_I) $(CFLAGS) $< -o $@
lib/klibc.o:lib/klibc.c $(KERNEL_INC)
	$(CC) $(CFLAGS_I) $(CFLAGS) $< -o $@
$(KERNEL_BIN):$(OBJS)
	$(LD) $(LDFLAGS) -Ttext $(ENTRYPOINT) $(OBJS) -o $@



