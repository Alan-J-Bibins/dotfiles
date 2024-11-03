# Alan's Dotfiles

> [!NOTE]
> Install script provided is still a WIP

### Applications that I use:

1. Hyprland as the window manager
1. SDDM as my display manager
1. Waybar as the status bar
1. Swaync as the  notification daemon (Previously Used Mako, config for that will be included too, but only use either mako or swaync, not both at the same time)
1. Avizo as a notification daemon for when volume or brightness is changed
1. kitty as my terminal
1. Pywal for generating colorschemes
1. Waybar as the status bar
1. Blueman applet for bluetooth
1. Neovim as my code editor, but its configuration will not be included in my dotfiles
1. yay as my package manager / aur helper
1. wlogout
1. lazygit for using git
1. Waypaper for managing wallpapers along with swww as the backend
1. nwg-look to control look of gtk3 applications

Small Note to myself if I have to install this on endeavouros again: Make sure locale has utf 8, if not, make sure it is there in /etc/locale.conf, then run
```
unset lang
source /etc/profile.d/locale.sh
```

Another Note: Post command used in waypaper 
```
post_command = bash ~/.config/waypaper/post_commands.sh $wallpaper

```
Removed the previously used stupidly-long post_command and moved all of it to a bash script file which i can modify more easily

## Instructions after a fresh install

1. Setup yay
1. `git clone https://github.com/Alan-J-Bibins/dotfiles`
1. `cd dotfiles`
1. Run `./install.sh` and follow the instructions (basically say yes to everything)
1. Reboot
1. Copy wallpapers from `https://drive.google.com/drive/folders/13c9e27zigqFp0Hj9F0mF-VDx1KBscWS1?usp=sharing` into `~/Pictures/Wallpapers`
