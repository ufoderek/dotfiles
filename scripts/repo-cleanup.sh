repo forall -c "git reflog expire --expire=now --all"
repo forall -c "git fsck --full --unreachable"
repo forall -c "git repack -A -d"
repo forall -c "git gc --aggressive --prune=now"

