if [ -z "$1" ]; then
    echo "fake-ota.sh update.zip"
else
adb push "$1" /cache/update.zip && \
adb shell "echo \"--update_package=/cache/update.zip\" > /cache/recovery/command" && \
adb reboot recovery
fi
