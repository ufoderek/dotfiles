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
    echo "`basename $0` base_branch_name"
else
    repo forall -c "$prefix git branch -D _dev; $prefix git checkout -b _dev $1; $prefix git branch -D dev; $prefix git checkout -b dev $1; $prefix git branch -D _dev"
fi
