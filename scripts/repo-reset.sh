if [ -z "$1" ]; then
    echo "`basename $0` base_branch_name {branch_name_to_del} {sync}"
else
    for i in mediatek build kernel system/core bootable/bootloader/lk bootable/recovery; do
        echo "target directory: $i"
        if [[ "$2" = "sync" || "$3" = "sync" ]]; then
            echo "syncing ..."
            (cd $i && repo sync .) > /dev/null 2>&1
        fi
        (cd $i && git reset --hard && git checkout -b _dev $1) > /dev/null 2>&1
        (cd $i && git branch -D dev; git branch -D dev2; git branch -D dev3; git branch -D dev4) > /dev/null 2>&1
        (cd $i && git branch -D tb; git branch -D tb2; git branch -D tb3; git branch -D tb4) > /dev/null 2>&1
        if [[ -n "$2" && "$2" != "sync" ]]; then
            (cd $i && git branch -D $2) > /dev/null 2>&1
        fi
        if [[ -n "$3" && "$3" != "sync" ]]; then
            (cd $i && git branch -D $3) > /dev/null 2>&1
        fi
        (cd $i && git checkout -b dev $1 && git branch -D _dev && git reset --hard)
    done
fi
