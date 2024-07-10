#!/bin/bash
#  ___           _        _ _   _   _                     _       _       
# |_ _|_ __  ___| |_ __ _| | | | | | |_   _ _ __  _ __ __| | ___ | |_ ___ 
#  | || '_ \/ __| __/ _` | | | | |_| | | | | '_ \| '__/ _` |/ _ \| __/ __|
#  | || | | \__ \ || (_| | | | |  _  | |_| | |_) | | | (_| | (_) | |_\__ \
# |___|_| |_|___/\__\__,_|_|_| |_| |_|\__, | .__/|_|  \__,_|\___/ \__|___/
#                                     |___/|_|                            

read -r -p "Proceed with Installation? [y/N]" -n 1

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    sleep 2
    echo "Operation continues"
    yay -S --needed hyprland hyprlock cpio xorg-xhost hyprwayland-scanner xdg-desktop-portal xdg-desktop-portal-hyprland wl-clipboard nwg-look qt5-wayland qt6-wayland qt5ct qt6ct kvantum swaync kvantum-theme-materia materia-kde materia-gtk-theme kvantum-qt5 cliphist swww unzip ripgrep fd atuin fzf lazygit python-pip bluez bluez-utils pamixer brightnessctl blueman pavucontrol grim vlc waybar wofi waypaper bibata-cursor-theme oh-my-posh satty-bin avizo wlogout kitty zsh papirus-icon-theme thunar python-pywalfox tumbler ffmpegthumbnailer hyprpicker jq

    
    echo "Checking if everything was installed properly using the '--needed' flag of yay"
    sleep 2
    echo "..."
    sleep 2
    echo "..."
    yay -S --needed hyprland 
    sleep 2
    echo "..."
    yay -S --needed hyprlock
    sleep 2
    echo "..."
    yay -S --needed cpio
    sleep 2
    echo "..."
    yay -S --needed xorg-xhost
    sleep 2
    echo "..."
    yay -S --needed hyprwayland-scanner
    sleep 2
    echo "..."
    yay -S --needed xdg-desktop-portal
    sleep 2
    echo "..."
    yay -S --needed xdg-desktop-portal-hyprland
    sleep 2
    echo "..."
    yay -S --needed wl-clipboard
    sleep 2
    echo "..."
    yay -S --needed nwg-look
    sleep 2
    echo "..."
    yay -S --needed qt5-wayland
    sleep 2
    echo "..."
    yay -S --needed qt6-wayland
    sleep 2
    echo "..."
    yay -S --needed qt5ct
    sleep 2
    echo "..."
    yay -S --needed qt6ct
    sleep 2
    echo "..."
    yay -S --needed kvantum
    sleep 2
    echo "..."
    yay -S --needed swaync
    sleep 2
    echo "..."
    yay -S --needed kvantum-theme-materia
    sleep 2
    echo "..."
    yay -S --needed materia-kde
    sleep 2
    echo "..."
    yay -S --needed materia-gtk-theme
    sleep 2
    echo "..."
    yay -S --needed kvantum-qt5
    sleep 2
    echo "..."
    yay -S --needed cliphist
    sleep 2
    echo "..."
    yay -S --needed swww
    sleep 2
    echo "..."
    yay -S --needed unzip
    sleep 2
    echo "..."
    yay -S --needed ripgrep
    sleep 2
    echo "..."
    yay -S atuin 
    sleep 2
    echo "..."
    yay -S fzf 
    sleep 2
    echo "..."
    yay -S lazygit 
    sleep 2
    echo "..."
    yay -S python-pip
    sleep 2
    echo "..."
    yay -S --needed bluez
    sleep 2
    echo "..."
    yay -S --needed bluez-utils
    sleep 2
    echo "..."
    yay -S --needed pamixer
    sleep 2
    echo "..."
    yay -S --needed brightnessctl
    sleep 2
    echo "..."
    yay -S --needed blueman
    sleep 2
    echo "..."
    yay -S --needed pavucontrol
    sleep 2
    echo "..."
    yay -S --needed grim
    sleep 2
    echo "..."
    yay -S --needed vlc
    sleep 2
    echo "..."
    yay -S --needed waybar
    sleep 2
    echo "..."
    yay -S --needed wofi
    sleep 2
    echo "..."
    yay -S --needed waypaper
    sleep 2
    echo "..."
    yay -S --needed bibata-cursor-theme
    sleep 2
    echo "..."
    yay -S --needed oh-my-posh
    sleep 2
    echo "..."
    yay -S --needed satty-bin
    sleep 2
    echo "..."
    yay -S --needed avizo
    sleep 2
    echo "..."
    yay -S --needed wlogout
    sleep 2
    echo "..."
    yay -S --needed kitty
    sleep 2
    echo "..."
    yay -S --needed zsh
    sleep 2
    echo "..."
    yay -S --needed papirus-icon-theme
    sleep 2
    echo "..."
    yay -S --needed thunar
    sleep 2
    echo "..."
    yay -S --needed python-pywalfox
    sleep 2
    echo "..."
    yay -S --needed fd
    sleep 2
    echo "..."
    yay -S --needed sddm
    sleep 2
    echo "..."
    yay -S --needed thunar 
    sleep 2
    echo "..."
    yay -S python-pywalfox
    sleep 2
    echo "..."
    yay -S tumbler
    sleep 2
    echo "..."
    yay -S ffmpegthumbnailer
    sleep 2
    echo "..."
    yay -S hyprpicker
    sleep 2
    echo "..."
    yay -S jq
    sleep 2
    echo "..."
    echo "Checking completed!!! Please set SDDM as the display manager using 'sudo systemctl enable sddm.service'!!!"
else
    echo "Installation did not proceed. Nothing has been installed!"
    sleep 2
fi

read -r -p "Create initial pywal colorscheme using the provided wallpaper? (Please make sure that all config files have been stowed before running this) [y/N]" -n 1

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    sleep 2
    echo "..."
    sleep 2
    echo "Creating pywal colorscheme"
    wal -i ./City-Rain.png
else
    sleep 2
    echo "Colorscheme has not been generated!"
fi
