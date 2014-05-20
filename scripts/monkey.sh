adb shell "monkey --ignore-crashes --ignore-timeouts --kill-process-after-error --ignore-security-exceptions --throttle 1000 -v 390000 > /sdcard/monkey.log 2>&1 &"
