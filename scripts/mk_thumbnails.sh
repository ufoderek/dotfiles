#!/bin/bash

top=/mnt/dnas/Nextcloud/Autumn
src_base=iPhone\ Photos
dst_base=iPhone\ Thumbnails

params="-sampling-factor 4:2:0 -quality 85"

(cd "$top/$src_base" && find * -type f -print0) |
while IFS= read -r -d '' src_name; do
	src="$top/$src_base/$src_name"
	dst="$top/$dst_base/$src_name"

	echo "-----"
	if file "$src" | grep -qi HEIF; then
		dst="${dst%.*}.JPG"
		action="convert"
		echo "[I-HEIF] $src"
		echo "[O-JPEG] $dst"
	elif file "$src" | grep -qi JPEG; then
		dst="${dst%.*}.JPG"
		action="convert"
		echo "[I-JPEG] $src"
		echo "[O-JPEG] $dst"
	elif file "$src" | grep -qi PNG; then
		dst="${dst%.*}.JPG"
		action="convert"
		echo "[I-PNG ] $src"
		echo "[O-JPEG] $dst"
	elif file "$src" | grep -qi AAE; then
		dst="$dst"
		action="skip"
		echo "[I-OTHR] $src"
		echo "[O-OTHR] SKIP"
	else
		dst="$dst"
		action="copy"
		echo "[I-OTHR] $src"
		echo "[O-OTHR] $dst"
	fi

	mkdir -p "$(dirname "$dst")"
	if [ "$action" = "convert" ]; then
		/home/ufoderek/Downloads/ImageMagick.AppImage convert "$src" $params "$dst"
	elif [ "$action" = "copy" ]; then
		cp "$src" "$dst"
	fi
done
