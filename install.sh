#!/bin/bash
#  ___           _        _ _   _   _                     _       _
# |_ _|_ __  ___| |_ __ _| | | | | | |_   _ _ __  _ __ __| | ___ | |_ ___
#  | || '_ \/ __| __/ _` | | | | |_| | | | | '_ \| '__/ _` |/ _ \| __/ __|
#  | || | | \__ \ || (_| | | | |  _  | |_| | |_) | | | (_| | (_) | |_\__ \
# |___|_| |_|___/\__\__,_|_|_| |_| |_|\__, | .__/|_|  \__,_|\___/ \__|___/
#                                     |___/|_|

read -r -p "Proceed with Installation? [y/N]: " -n 1
echo ""

# TODO: Make nvidia envs for hyprland optional, rn its just always present so it might cause problems

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    sleep 1
    echo "Operation continues"
    sleep 1
    echo "Please make sure that you pay close attention to what is happening as the applications and packages are installed.."
    sleep 1
    yay -S --needed hyprland hyprlock cpio xorg-xhost hyprwayland-scanner xdg-desktop-portal xdg-desktop-portal-hyprland wl-clipboard nwg-look qt5-wayland qt6-wayland qt5ct qt6ct kvantum swaync kvantum-theme-materia materia-kde materia-gtk-theme kvantum-qt5 cliphist swww unzip ripgrep fd atuin fzf lazygit python-pip bluez bluez-utils pamixer brightnessctl blueman pavucontrol grim vlc waybar rofi-wayland waypaper bibata-cursor-theme oh-my-posh wlogout kitty zsh papirus-icon-theme thunar python-pywalfox tumbler ffmpegthumbnailer hyprpicker jq slurp libsmbios yt-dlp aria2 zathura zathura-pdf-mupdf pacman-contrib mpd playerctl wev thunar-archive-plugin xarchiver ttf-jetbrains-mono-nerd ttf-dejavu ttf-liberation noto-fonts freetype2 less python-pywal sddm eza zoxide blueman network-manager-applet btop satty cmake meson fuse polkit-kde-agent stow getnf tmux zsh-completions zsh-autosuggestions zsh-fast-syntax-highlighting swayosd-git rofimoji

    echo "Checking if everything was installed properly using the '--needed' flag of yay"
    sleep 1
    echo "..."
    yay -S --needed hyprland hyprlock cpio xorg-xhost hyprwayland-scanner xdg-desktop-portal xdg-desktop-portal-hyprland wl-clipboard nwg-look qt5-wayland qt6-wayland qt5ct qt6ct kvantum swaync kvantum-theme-materia materia-kde materia-gtk-theme kvantum-qt5 cliphist swww unzip ripgrep fd atuin fzf lazygit python-pip bluez bluez-utils pamixer brightnessctl blueman pavucontrol grim vlc waybar rofi-wayland waypaper bibata-cursor-theme oh-my-posh wlogout kitty zsh papirus-icon-theme thunar python-pywalfox tumbler ffmpegthumbnailer hyprpicker jq slurp libsmbios yt-dlp aria2 zathura zathura-pdf-mupdf pacman-contrib mpd playerctl wev thunar-archive-plugin xarchiver ttf-jetbrains-mono-nerd ttf-dejavu ttf-liberation noto-fonts freetype2 less python-pywal sddm eza zoxide blueman network-manager-applet btop satty cmake meson fuse polkit-kde-agent stow getnf tmux zsh-completions zsh-autosuggestions zsh-fast-syntax-highlighting swayosd-git rofimoji
    echo "Checking completed!!!"
else
    echo "Installation did not proceed. Nothing has been installed!"
    sleep 2
fi

read -r -p "Stow config files using gnu stow? [y/N]: " -n 1
echo ""

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    sleep 2
    echo "..."
    cd "$PWD"
    sleep 2
    echo "Stowing config file"
    stow swayosd fastfetch Hyprland kitty satty swaync Thunar wallust waybar waypaper wlogout zathura zsh tmux lazygit rofi
    cp config.ini ~/.config/waypaper

    mkdir -p ~/Public
    mkdir -p ~/Pictures/Wallpapers
    mkdir -p ~/Pictures/Screenshots
    mkdir -p ~/Downloads
    mkdir -p ~/AppImages
    mkdir -p ~/Videos
else
    sleep 2
    echo "Config files have not been stowed!"
fi

read -r -p "Create initial wallust colorscheme using the provided wallpaper? (Please make sure that all config files have been stowed before running this) [y/N]: " -n 1
echo ""

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    sleep 2
    echo "..."
    sleep 2
    echo "Creating wallust colorscheme"
    wallust run ./City-Rain.png
else
    sleep 2
    echo "Colorscheme has not been generated!"
fi

read -r -p "Run Post Installation Commands? [y/N]: " -n 1
echo ""

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    echo "Enabling sddm..."
    sleep 1
    sudo systemctl enable sddm.service
    echo "Installing pywalfox daemon ..."
    sleep 1
    sudo pywalfox install

    echo "Installing the fonts provided with the dotfiles"
    sleep 1
    cp -r ~/dotfiles/fonts/ProductSans/ ~/.local/share/fonts/
    cp -r ~/dotfiles/fonts/Inter/ ~/.local/share/fonts/
    fc-cache -v -f

    echo "Installing CascadiaCode and JetBrainsMono Nerd fonts using getnf"
    sleep 1
    getnf -i "CascadiaCode,JetBrainsMono"

    echo "Setting up zsh plugins..."
    sleep
    curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/fzf/fzf.plugin.zsh >~/.zsh/plugins/fzf.plugin.zsh

    echo "Setting up tmux"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux new-session -d
    sleep 2
    tmux send-keys -t 0 "C-b I" C-m
    tmux kill-server

    # TODO: Figure out how to set qt5 and qt6 to use kvantum-dark

    # echo "Setting up Qt theming"
    # kvantummanager --set MateriaDark
else
    sleep 2
    echo "Skipping Post Installation Commands"
fi

echo "ENJOY!"
