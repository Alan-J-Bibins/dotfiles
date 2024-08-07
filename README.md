# Alan's Dotfiles

### Applications that I use:

1. Hyprland as the window manager
1. SDDM as my display manager
1. Waybar as the status bar
1. Swaync as the  notification daemon (Previously Used Mako, config for that will be included too, but only use either mako or swaync, not both at the same time)
1. Avizo as a notification daemon for when volume or brightness is changed
1. kitty as my terminal
1. Pywal for generating colorschemes
1. Waybar as the status bar
1. Overskride for bluetooth
1. Neovim as my code editor, but its configuration will not be included in my dotfiles
1. yay as my package manager / aur helper
1. wlogout
1. lazygit for using git
1. Waypaper for managing wallpapers along with swww as the backend
1. nwg-look to control look of gtk3 applications

### Files to be added to dotfiles
- [X] Hyprland
- [X] Kitty
- [X] Zsh
- [X] Pywal
- [X] Waybar
- [X] Mako
- [X] Swaync
- [X] Avizo
- [X] Wlogout
- [X] Wofi
- [ ] Wallpapers
- [X] Waypaper (NOTE: DO NOT USE STOW ON THIS, CONFIG.INI IS SUPPOSED TO BE COPIED MANUALLY)

Small Note to myself if I have to install this on endeavouros again: Make sure locale has utf 8, if not, make sure it is there in /etc/locale.conf, then run
```
unset lang
source /etc/profile.d/locale.sh
```

Another Note: Post command used in waypaper 
```
post_command = wal -i $wallpaper && cp ~/.cache/wal/colors-btop-pywal.theme ~/.config/btop/themes/ && killall -SIGUSR2 waybar && swaync-client -rs && notify-send "Testing.." && pywalfox update && cp $wallpaper /home/alan/Pictures/wallpaper.png

```


## Instructions to myself after fresh install

