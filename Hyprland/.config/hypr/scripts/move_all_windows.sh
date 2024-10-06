#!/bin/bash

target_workspace=$1

# Get the current workspace
current_workspace=$(hyprctl activeworkspace -j | jq '.id')

# Get all windows in the current workspace
windows=$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == $current_workspace) | .address")

# Move each window to the target workspace
for window in $windows; do
    hyprctl dispatch movetoworkspace "$target_workspace,address:$window"
done
