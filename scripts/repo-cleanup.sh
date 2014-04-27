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

repo forall -c "$prefix git reflog expire --expire=now --all"
repo forall -c "$prefix git fsck --full --unreachable"
repo forall -c "$prefix git repack -A -d"
repo forall -c "$prefix git gc --aggressive --prune=now"
