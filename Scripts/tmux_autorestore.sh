tmux new-session -d -s _hidden
tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh
tmux kill-session -t _hidden
