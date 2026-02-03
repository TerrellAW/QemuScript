## Qemu Virtual Machine Configuration Script

This bash script is a template that can be used to configure [Qemu](https://www.qemu.org/) virtual machines for installation and running.

To start working with a Qemu virtual machine create a directory for it and add:

- The Operating System's ISO file
- [Create the virtual hard disk](#Create-Hard-Disk)
- This script template, modified for your needs

### Create Hard Disk

To create the virtual hard disk drive for the virtual machine, run this command:

``` bash
qemu-img create -f qcow2 osname.qcow2 50G
```

The `-f qcow2` flag specifies the format of the virtual drive. In this case the format is `qcow2`.

The `osname.qcow2` is the filename. Change osname to the name of your virtual machine's operating system for simplicity.

The `50G` specifies the size of the drive. Decrease or increase the number as needed.
