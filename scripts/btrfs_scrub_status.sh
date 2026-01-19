#!/bin/bash

while true; do
	sudo btrfs scrub status -d /mnt/dnas
	echo "---"
	sleep 60
done
