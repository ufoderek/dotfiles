adb shell 'pm list packages' | sed -n "s/^package://p" | sort
