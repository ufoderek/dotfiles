LOG_DIR=~/wk/tmp/mtklog/`date +%H%M`
if [ ! -d $LOG_DIR ]; then
    mkdir $LOG_DIR
fi
adb pull /sdcard/mtklog $LOG_DIR
cd $LOG_DIR
