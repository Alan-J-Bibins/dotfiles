#!/bin/bash

echo "Starting tmux session restoration at $(date)"
tmux new-session -d -s _hidden
sleep 3

echo "Restoring Sessions..."
tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh

echo "Killing temporary session..."
sleep 1
tmux kill-session -t _hidden
echo "DONE!!"
