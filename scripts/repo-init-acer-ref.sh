if [ -z "$2" ]; then
    repo init -u ssh://derek.liu@mickey.acer.com.tw:29418/platform/manifest -b ${1} --reference=/opt/mickey_mirror
else
    repo init -u ssh://derek.liu@mickey.acer.com.tw:29418/platform/manifest -b ${1} -m ${2}.xml --reference=/opt/mickey_mirror
fi
