LOG_DIR=~/wk/tmp/mtklog/`date +%H%M`
if [ ! -d $LOG_DIR ]; then
    mkdir -p $LOG_DIR
fi
mkdir -p $LOG_DIR/aee_exp
mkdir -p $LOG_DIR/mtklog/aee_exp
adb pull /data/aee_exp $LOG_DIR/aee_exp
adb pull /sdcard/mtklog/aee_exp $LOG_DIR/mtklog/aee_exp
echo "destination: $LOG_DIR"
