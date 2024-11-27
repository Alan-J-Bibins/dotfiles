#!/bin/bash

RESURRECT_DIR="${HOME}/.local/share/tmux/resurrect/"

# Store the current good save file (if it exists and isn't empty)
current_save=$(readlink -f "${RESURRECT_DIR}/last")
if [ -s "$current_save" ]; then
    ln -sf "$current_save" "${RESURRECT_DIR}/last.backup"
fi

# Kill the server
tmux kill-server

# Restore the good save if new one is empty
new_save=$(readlink -f "${RESURRECT_DIR}/last")
if [ ! -s "$new_save" ] && [ -f "${RESURRECT_DIR}/last.backup" ]; then
    ln -sf "$(readlink -f ${RESURRECT_DIR}/last.backup)" "${RESURRECT_DIR}/last"
    # rm "${RESURRECT_DIR}/last.backup"
fi
