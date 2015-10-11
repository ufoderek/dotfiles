#!/bin/bash

DATE_TIME=`date +%Y_%m%d_%H%M_%S`

SRC_DIR="/Volumes/Dolphin"

BASE=/Volumes/SamsungM3
DEST_MAIN_DIR=$BASE/MainBackup
DEST_DIFF_DIR=$BASE/DiffBackup/$DATE_TIME

LOG_FILE=$DEST_DIFF_DIR/$DATE_TIME.log

pushd `dirname $0` > /dev/null
SRC_LIST_FILE=`pwd`/rsync-mac-home-backup-list.txt
popd > /dev/null

mkdir -p $DEST_DIFF_DIR

OPTS=" \
	--recursive \
	--relative \
	--perms \
	--links \
	--keep-dirlinks \
	--executability \
	--times \
	--crtimes \
	--delete \
	--human-readable \
	--progress \
	--ignore-errors \
	--delete \
	--force-delete \
	--backup \
	--backup-dir=$DEST_DIFF_DIR \
	--log-file=$LOG_FILE \
	--files-from=$SRC_LIST_FILE "

nice -n 19 rsync $OPTS $SRC_DIR $DEST_MAIN_DIR
