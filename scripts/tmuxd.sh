# if $TMUX is set the tmux is currently running
if [ -n "${TMUX}" ]; then
    echo "tmux is already running, now exit."
    exit 0;
fi

# the name of your primary tmux session
if [ -n "$1" ]; then
    SESSION=$1
else
    SESSION=$USER
fi

# if the session is already running, just attach to it.
tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
    echo "tmux: attach to session: $SESSION"
    tmux -2 detach-client -a -s $SESSION #detach all other clients
	tmux -2 attach -t $SESSION
    echo "tmux: detatch from session: $SESSION"
	exit 0;
else
    # create a new session, named $SESSION, and detach from it
    tmux -2 new-session -d -s $SESSION

    # all done. select starting window and get to work
    # you may need to cycle through windows and type in passwords
    # if you don't use ssh keys
    #tmux select-window -t $SESSION:0
    echo "tmux: attach to new session: $SESSION"
    tmux -2 attach -t $SESSION
    echo "tmux: detatch from new session: $SESSION"
fi
