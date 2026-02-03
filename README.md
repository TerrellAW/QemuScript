## Qemu Virtual Machine Configuration Script

This bash script is a template that can be used to configure [Qemu](https://www.qemu.org/) virtual machines for installation and running.

To start working with a Qemu virtual machine create a directory for it and add:

- The Operating System's [ISO](#ISO-File) file or the [CD/DVD](#CD-or-DVD)
- [Create the virtual hard disk](#Create-Hard-Disk)
- This script template, modified for your needs

### Getting an Operating System

An operating system can be found online or installed from a CD or DVD. 

#### ISO File

If the OS was downloaded as an ISO file from the internet
simply put the file in your virtual machine's directory and give it a shorter name. In the script change `-cdrom install.iso \` to
use the actual file name, such as `-cdrom debian.iso \`.

#### CD or DVD

If you have a physical disk for the OS comment out the `-cdrom install.iso \` like so `#-cdrom install.iso \`.
Next uncomment the command that creates a variable that allows Qemu to access your drive.

``` bash
CDROM=""
[[ -b "/dev/sr0" ]] && CDROM="-cdrom /dev/sr0"
```

The above script assumes your drive is called `sr0`. This might not be the case, check with the `lsblk` command.

In the script there is another commend section, uncomment it `$CDROM \`

### Create Hard Disk

To create the virtual hard disk drive for the virtual machine, run this command:

``` bash
qemu-img create -f qcow2 osname.qcow2 50G
```

The `-f qcow2` flag specifies the format of the virtual drive. In this case the format is `qcow2`.

The `osname.qcow2` is the filename. Change osname to the name of your virtual machine's operating system for simplicity.

The `50G` specifies the size of the drive. Decrease or increase the number as needed.

### Post-Installation

After the OS has been installed to your virtual machine, find `-boot order=d \` in the script and change it to
`-boot order=c \` so the VM boots directly into the OS. Some operating systems require you to keep the install disk for booting
so be sure to keep either the `-cdrom osname.iso \` line or the `$CDROM \` line uncommented.
