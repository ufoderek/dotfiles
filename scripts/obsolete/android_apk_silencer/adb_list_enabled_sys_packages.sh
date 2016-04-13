adb shell 'pm list packages -e -s' | sed -n "s/^package://p" | sort
