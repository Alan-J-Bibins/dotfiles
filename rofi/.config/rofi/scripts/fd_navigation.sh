#!/bin/bash

# Use fd to find directories and pipe the list to rofi in dmenu mode
selected_dir=$(fd -H -t d . $HOME | rofi -no-show-icons -keep-right -dmenu -i -p "Select directory:")

# Check if a directory was selected
if [ -n "$selected_dir" ]; then
    # Open the selected directory in Thunar
    thunar "$selected_dir"
fi

