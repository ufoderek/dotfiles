if [ -z "$2" ]; then
    echo "insert-lk.sh lk.bin update.zip"
else
    cp "$2" "lk_$2"
    unzip -p "lk_$2" META-INF/com/google/android/updater-script > updater-script
    echo "assert(package_extract_file("lk.bin", "/tmp/uboot.img")," >> updater-script
    echo "write_raw_image("/tmp/uboot.img", "uboot")," >> updater-script
    echo "delete("/tmp/uboot.img"));" >> updater-script
    mkdir -p _tmp/META-INF/com/google/android
    mv updater-script _tmp/META-INF/com/google/android
    cd _tmp
    zip -g "../lk_$2" META-INF/com/google/android/updater-script
    cd ..
    zip -g -j "lk_$2" "$1"
    rm -rf _tmp
fi
