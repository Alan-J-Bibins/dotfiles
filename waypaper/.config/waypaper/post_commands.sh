#!/bin/bash

echo "Wallpaper being used is $1"
wallust run $1
# wal -i $1
cp $1 ~/Pictures/wallpaper.png
killall -SIGUSR2 waybar 
swaync-client -rs
notify-send -i dialog-information-symbolic "Changing wallpaper and colorscheme" "Waypaper at work"
pywalfox update
# spicetify apply
killall swayosd-server
sleep 0.5
swayosd-server
