function is_buildfarm {
    local HOSTNAME=`hostname`
    if [[ "$HOSTNAME" = ws* ]]; then
        return 0
    else
        return 1
    fi
}

if is_buildfarm; then
    prefix="rcmd.sh"
else
    prefix=""
fi

if [ -z "$1" ]; then
    echo "`basename $0` base_branch_name {branch_name_to_del} {sync}"
else
    for i in mediatek build kernel system/core bootable/bootloader/lk bootable/recovery; do
        echo "target directory: $i"
        if [[ "$2" = "sync" || "$3" = "sync" ]]; then
            echo "syncing ..."
            (cd $i && $prefix repo sync .) > /dev/null 2>&1
        fi
        (cd $i && $prefix git reset --hard && $prefix git checkout -b _dev $1) > /dev/null 2>&1
        (cd $i && $prefix git branch -D dev; $prefix git branch -D dev2; $prefix git branch -D dev3; $prefix git branch -D dev4) > /dev/null 2>&1
        (cd $i && $prefix git branch -D tb; $prefix git branch -D tb2; $prefix git branch -D tb3; $prefix git branch -D tb4) > /dev/null 2>&1
        (cd $i && $prefix git checkout -b dev $1 && $prefix git branch -D _dev && $prefix git reset --hard)
    done
fi
