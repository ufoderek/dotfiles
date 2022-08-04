#!/bin/bash

base=/mnt/dnas/Nextcloud/Cherry
src_base=Cherry\ 1990
dst_base=Cherry\ 1990\ JPG

params="-sampling-factor 4:2:0 -quality 85 -interlace JPEG -resize 50%"

(cd "$base/$src_base" && find . -type f -iname *_a.tif -print0) |
while IFS= read -r -d '' src_name; do
	src_path="$src_base/$src_name"
	dst_path="$dst_base/${src_name%.tif}.jpg"
	dst_dir="$(dirname "$dst_path")"

	echo "$src_name"
	#echo "(cd $base && mkdir -p \"$dst_dir\" && convert \"$src_path\" $params \"$dst_path\")"
	(cd $base && mkdir -p "$dst_dir" && convert "$src_path" $params "$dst_path")
done
