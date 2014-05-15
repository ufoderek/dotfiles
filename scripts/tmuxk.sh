if [ -n "$1" ]; then
    SESSION=$1
else
    SESSION=$USER
fi

tmux -2 kill-session -t $SESSION

