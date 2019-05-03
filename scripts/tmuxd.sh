# if $TMUX is set the tmux is currently running
if [ -n "${TMUX}" ]; then
    echo "tmux is already running, abort..."
    exit 0;
fi

# the name of your primary tmux session
if [ -n "$1" ]; then
    SESSION_NAME=$1
else
    SESSION_NAME=$USER
fi

tmux has-session -t $SESSION_NAME > /dev/null 2>&1
if [ $? -eq 0 ]; then
    # if the session is already running
    echo "tmux: detach other clients: $SESSION_NAME"
    tmux -2 detach-client -a -s $SESSION_NAME
else
    # create a new session
    echo "tmux: create a new session: $SESSION_NAME"
    tmux -2 new-session -d -s $SESSION_NAME -c ~/wk
fi
echo "tmux: attach to session: $SESSION_NAME"
tmux -2 attach -t $SESSION_NAME
