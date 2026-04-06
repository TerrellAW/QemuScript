## Creating Bootable Media

A simple `dd` command can be used to create bootable media from an ISO image onto a USB drive.

First find out what your USB drive as known as to Linux. This can be determined by using the `lsblk` command
and comparing the sizes of the drives. Usually a USB drive is at `/dev/sda` or `/dev/sdb`, though it depends on how 
your filesystem organizes itself.

```bash
# Replace 'sdX' with the actual USB drive
sudo dd if=/path/to/image.iso of=/dev/sdX bs=8M status=progress
```
