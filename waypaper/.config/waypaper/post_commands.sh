#!/bin/bash

echo "Wallpaper being used is $1"
wal -i $1
cp ~/.cache/wal/colors-btop-pywal.theme ~/.config/btop/themes/
cp $1 ~/Pictures/wallpaper.png
killall -SIGUSR2 waybar 
swaync-client -rs
notify-send -i "/usr/share/icons/Papirus/symbolic/status/dialog-information-symbolic.svg" "Changing wallpaper and colorscheme" "Waypaper at work"
pywalfox update
bash ~/.config/spicetify/Themes/Pywal/update-colors.sh 
spicetify apply
cp ~/.cache/wal/colors-vesktop.css ~/.config/vesktop/themes/pywal-vesktop.theme.css
python3 ~/dotfiles/VesktopTheme/accentValVesktop.py
