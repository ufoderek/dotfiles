if [ -z "$3" ]; then
    echo "`basename $0` target_files_v1.zip target_files_v2.zip ota_diff.zip"
else
    ./build/tools/releasetools/ota_from_target_files -p ./out/host/linux-x86 -k ./device/acer/common/security/acer/releasekey -y ./device/acer/common/security/acer/releasekey -v -i $1 $2 $3
fi
