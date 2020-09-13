#!/bin/bash

base_dir=/mnt/ufoderek/Nextcloud
src_dir=Photos
dst_dir=Thumbs

params="-sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -resize 25%"

(cd $base_dir/$src_dir && find . -type f -iname *.jpg -print0) |
while IFS= read -r -d '' jpg_path; do
	echo "$jpg_path"
	(cd $base_dir && mkdir -p $(dirname "$dst_dir/$jpg_path") && convert "$src_dir/$jpg_path" $params "$dst_dir/$jpg_path")
done
