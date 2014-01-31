if [ -z "$2" ]; then
    echo "sign-target-files-rel.sh project_name target_files.tar.gz"
else
    ./build/tools/releasetools/sign_target_files_apks -o -d device/acer/common/security/acer $2 out/dist/rel_target_files.zip && \
    ./build/tools/releasetools/img_from_target_files -y mediatek/custom/$1/security/image_auth out/dist/rel_target_files.zip out/dist/rel_image.zip && \
    ./build/tools/releasetools/ota_from_target_files -y mediatek/custom/$1/security/image_auth -k device/acer/common/security/acer/releasekey out/dist/rel_target_files.zip out/dist/rel_ota.zip
fi
