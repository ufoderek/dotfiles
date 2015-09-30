if [ -z "$1" ]; then
    echo "`basename $0` target_files.tar.gz"
else
    ./build/tools/releasetools/sign_target_files_apks -o -d device/acer/common/security/acer $1 out/dist/rel_target_files.zip && \
    ./build/tools/releasetools/img_from_target_files out/dist/rel_target_files.zip out/dist/rel_image.zip && \
    ./build/tools/releasetools/ota_from_target_files -k device/acer/common/security/acer/releasekey out/dist/rel_target_files.zip out/dist/rel_ota.zip
fi
