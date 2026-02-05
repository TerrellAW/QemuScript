#!/bin/bash

# Uncomment for piping in actual CD/DVD drive
#CDROM=""
#[[ -b "/dev/sr0" ]] && CDROM="-cdrom /dev/sr0"

qemu-system-x86_64 \
  -m 4096 \
  -cpu host \
  -smp 2 \
  -enable-kvm \
  -cdrom install.iso \
  # Uses commented CDROM variable
  #$CDROM \
  # Change to order=c after successful install
  -boot order=d \
  # Generate 50G Virtual HDD with qemu-img create -f qcow2 osname.qcow2 50G
  -drive file=osname.qcow2,format=qcow2 \
  -machine type=pc \
  -vga std \
  -net nic \
  -net user \
  -device AC97 \
  -usb -device usb-tablet \
  -name "OSName VM"
