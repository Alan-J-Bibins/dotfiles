#!/usr/bin/env bash

selected_dir=$(fd . ~/ \
    --type d \
    --exclude ".git" \
    --exclude "Music" | \
    wofi --dmenu -i -p "Open directory:")

# If a directory is selected, open in Thunar
if [ -n "$selected_dir" ]; then
    xdg-open "$selected_dir"
fi
