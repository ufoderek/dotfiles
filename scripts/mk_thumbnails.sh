#!/bin/bash

src_dir=/home/ufoderek/ufoderek/Nextcloud/Photos
dst_dir=/home/ufoderek/ufoderek/Nextcloud/Thumbs

params="-sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -resize 25%"

for src in `find $src_dir -type f -iname *.jpg -print`
do
	rel_src=$(realpath --relative-to="$src_dir" "$src")
	dst="$dst_dir/$rel_src"
	mkdir -p $(dirname "$dst")
	convert "$src" $params "$dst"
done
