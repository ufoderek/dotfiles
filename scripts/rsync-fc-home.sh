#!/bin/bash

DATE_TIME=`date +%Y_%m%d_%H%M_%S`

SRC_DIR=/mnt/dnas
BASE=/run/media/ufoderek/SamsungM3

DEST_MAIN_DIR=$BASE/MainBackup
DEST_DIFF_DIR=$BASE/DiffBackup/$DATE_TIME

LOG_FILE=$DEST_DIFF_DIR/$DATE_TIME.log

pushd `dirname $0` > /dev/null
SRC_LIST_FILE=`pwd`/rsync-fc-home-backup-list.txt
popd > /dev/null

mkdir -p $DEST_DIFF_DIR

OPTS=" \
	--archive \
	--checksum \
	--inplace \
	--recursive \
	--relative \
	--backup \
	--backup-dir=$DEST_DIFF_DIR \
	--links \
	--keep-dirlinks \
	--hard-links \
	--perms \
	--executability \
	--acls \
	--xattrs \
	--owner \
	--group \
	--times \
	--whole-file \
	--delete \
	--force \
	--files-from=$SRC_LIST_FILE \
	--human-readable \
	--itemize-changes \
	--log-file=$LOG_FILE \
	--quiet \
	"

nice -n 19 rsync $OPTS $SRC_DIR $DEST_MAIN_DIR
