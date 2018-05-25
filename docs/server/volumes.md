## Volumes status

`lsblk -f`, `findmnt` or `df -h`.


## Mount volume

Determine whether to create a file system on the volume.

```
$ sudo file -s /dev/xvdf
/dev/xvdf: data
```

If the output of the command shows simply data for the device, then
there is no file system on the device and you must create one.

Create new filesystem

```bash
sudo mkfs -t ext4 device_name
```
Final mount step

```bash
sudo mkdir mount_point
sudo mount device_name mount_point
```

Then edit `/etc/fstab`

```bash
# device_name  mount_point  file_system_type  fs_mntops  fs_freq  fs_passno
/dev/xvdf       /data   ext4    defaults,nofail        0       2
```

You can check is the fstab is valid using `sudo mount -a`.

## Extend volume

```bash
$ sudo growpart /dev/xvdf 1
CHANGED: disk=/dev/xvdf partition=1: start=4096 old: size=16773086,end=16777182 new: size=73396190,end=73400286

$ sudo resize2fs /dev/xvdf1
```

```bash
# List device
ls /sys/class/scsi_device/
# Send new scan
sudo sh -c 'echo 1 > /sys/class/scsi_device/0\:0\:0\:0/device/rescan'
# Increase partition size
sudo growpart /dev/xvdf 1
# Resize FS
sudo resize2fs /dev/xvdf1
```

