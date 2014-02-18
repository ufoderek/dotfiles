if [ -n "$1" ]; then
    SESSION=$1
else
    SESSION=tmux_session_derek
fi

tmux -2 kill-session -t $SESSION

