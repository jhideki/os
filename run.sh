#!/bin/bash

# Assemble the bootloader
nasm -f bin bootloader.asm -o bootloader.bin

# Create floppy image
dd if=/dev/zero of=floppy.img bs=1024 count=1440
dd if=bootloader.bin of=floppy.img conv=notrunc

# Run in QEMU
qemu-system-x86_64 -fda floppy.img
