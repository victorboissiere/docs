## Create custom iso

```bash
sudo apt-get install squashfs-tools genisoimage
mkdir custom-img
cp original-iso ./custom-img
cd ./custom-img
mkdir mnt
sudo mount -o loop original.iso mnt
mkdir extract
sudo rsync --exclude=/casper/filesystem.squashfs -a mnt/ extract
sudo unsquashfs mnt/casper/filesystem.squashfs
sudo mv squashfs-root edit
# Network access
sudo cp /etc/resolv.conf edit/etc/
# Mount important working dirs
sudo mount --bind /dev/ edit/dev
sudo chroot edit /bin/bash
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devpts none /dev/pts
# Better safe than sorry
export HOME=/root
export LC_ALL=C
dbus-uuidgen > /var/lib/dbus/machine-id
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl
apt-get purge package1 package2 ...
apt-get update && apt-get upgrade
apt-get install package1 package2 package3
# Clean up
apt-get autoremove && apt-get autoclean
rm -rf /tmp/* ~/.bash_history
rm /var/lib/dbus/machine-id
rm /sbin/initctl
dpkg-divert --rename --remove /sbin/initctl
# Unmount main dirs
umount /proc || umount -lf /proc
umount /sys
umount /dev/pts
exit
sudo umount edit/dev
# Generate new manifest
sudo chmod +w extract/casper/filesystem.manifest
sudo chroot edit dpkg-query -W --showformat='${Package} ${Version}\n' | sudo tee extract/casper/filesystem.manifest
sudo cp extract/casper/filesystem.manifest extract/casper/filesystem.manifest-desktop
sudo sed -i '/casper/d' extract/casper/filesystem.manifest-desktop
# Compress fs
sudo mksquashfs edit extract/casper/filesystem.squashfs -b 1048576
# Update fs size
printf $(sudo du -sx --block-size=1 edit | cut -f1) | sudo tee extract/casper/filesystem.size
# Delete old md5sum
cd extract
sudo rm md5sum.txt
# Generate a fres one
find -type f -print0 | sudo xargs -0 md5sum | grep -v isolinux/boot.cat | sudo tee md5sum.txt
# Create iso
sudo genisoimage -D -r -V "$IMAGE_NAME" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../name-of-your-custom-image.iso .
```


