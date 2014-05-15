# if $TMUX is set the tmux is currently running
if [ -n "${TMUX}" ]; then
    exit 0;
fi

# the name of your primary tmux session
if [ -n "$1" ]; then
    SESSION=$1
else
    SESSION=$USER
fi

# if the session is already running, just attach to it.
if [ tmux has-session -t $SESSION ]; then
#if [ $? -eq 0 ]; then
    tmux detach-client -a -s $SESSION #detach all other clients
	tmux -2 attach -t $SESSION
	exit 0;
else
    # create a new session, named $SESSION, and detach from it
    tmux -2 new-session -d -s $SESSION

    # all done. select starting window and get to work
    # you may need to cycle through windows and type in passwords
    # if you don't use ssh keys
    #tmux select-window -t $SESSION:0
    tmux -2 attach -t $SESSION
fi
