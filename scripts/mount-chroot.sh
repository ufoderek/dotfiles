sudo mount -t proc proc /mnt/$1/proc
sudo mount -t sysfs sys /mnt/$1/sys
sudo mount -o bind /dev /mnt/$1/dev
