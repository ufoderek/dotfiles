#!/bin/bash
sudo btrfs filesystem show /mnt/dnas
sudo btrfs subvolume show /mnt/dnas
#sudo btrfs subvolume snapshot -r /mnt/dnas/main /mnt/dnas/snapshots/20250120
#sudo btrfs subvolume delete /mnt/dnas/snapshots/20250120
#duperemove -dr --hashfile=/mnt/dnas/main/Nextcloud.hash /mnt/dnas/snapshots/20250120/Nextcloud
