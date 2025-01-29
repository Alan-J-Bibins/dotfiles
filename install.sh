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
    yay -S --needed hyprland hyprlock cpio xorg-xhost hyprwayland-scanner xdg-desktop-portal xdg-desktop-portal-hyprland wl-clipboard nwg-look qt5-wayland qt6-wayland qt5ct qt6ct kvantum swaync kvantum-theme-materia materia-kde materia-gtk-theme kvantum-qt5 cliphist swww unzip ripgrep fd atuin fzf lazygit python-pip bluez bluez-utils pamixer brightnessctl blueman pavucontrol grim vlc waybar wofi waypaper bibata-cursor-theme oh-my-posh wlogout kitty zsh papirus-icon-theme thunar python-pywalfox tumbler ffmpegthumbnailer hyprpicker jq slurp libsmbios yt-dlp aria2 zathura zathura-pdf-mupdf pacman-contrib mpd playerctl wev thunar-archive-plugin xarchiver ttf-jetbrains-mono-nerd ttf-dejavu ttf-liberation noto-fonts freetype2 less python-pywal sddm eza zoxide blueman network-manager-applet btop satty cmake meson fuse polkit-kde-agent stow getnf tmux zsh-completions zsh-autosuggestions swayosd-git

    echo "Checking if everything was installed properly using the '--needed' flag of yay"
    sleep 1
    echo "..."
    yay -S --needed hyprland hyprlock cpio xorg-xhost hyprwayland-scanner xdg-desktop-portal xdg-desktop-portal-hyprland wl-clipboard nwg-look qt5-wayland qt6-wayland qt5ct qt6ct kvantum swaync kvantum-theme-materia materia-kde materia-gtk-theme kvantum-qt5 cliphist swww unzip ripgrep fd atuin fzf lazygit python-pip bluez bluez-utils pamixer brightnessctl blueman pavucontrol grim vlc waybar wofi waypaper bibata-cursor-theme oh-my-posh wlogout kitty zsh papirus-icon-theme thunar python-pywalfox tumbler ffmpegthumbnailer hyprpicker jq slurp libsmbios yt-dlp aria2 zathura zathura-pdf-mupdf pacman-contrib mpd playerctl wev thunar-archive-plugin xarchiver ttf-jetbrains-mono-nerd ttf-dejavu ttf-liberation noto-fonts freetype2 less python-pywal sddm eza zoxide blueman network-manager-applet btop satty cmake meson fuse polkit-kde-agent stow getnf tmux zsh-completions zsh-autosuggestions swayosd-git
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
    stow swayosd fastfetch Hyprland kitty satty swaync Thunar wal waybar waypaper wlogout wofi zathura zsh tmux lazygit
    cp config.ini ~/.config/waypaper
else
    sleep 2
    echo "Config files have not been stowed!"
fi

read -r -p "Create initial pywal colorscheme using the provided wallpaper? (Please make sure that all config files have been stowed before running this) [y/N]: " -n 1
echo ""

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

read -r -p "Run Post Installation Commands? [y/N]: " -n 1
echo ""

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    echo "Enabling sddm..."
    sleep 1
    sudo systemctl enable sddm.service
    echo "Installing pywalfox daemon ..."
    sleep 1
    sudo pywalfox install

    echo "Installing the Inter font provided with the dotfiles"
    sleep 1
    mkdir -p ~/.local/share/fonts/Inter
    cd "$PWD"
    cp ./fonts/Inter.zip ~/.local/share/fonts/
    cd ~/.local/share/fonts/
    unzip Inter.zip -d Inter/
    fc-cache -v -f
    rm Inter.zip
    cd ~

    echo "Installing CascadiaCode and JetBrainsMono Nerd fonts using getnf"
    sleep 1
    getnf -i "CascadiaCode,JetBrainsMono"

    echo "Setting up zsh plugins..."
    sleep
    mkdir -p ~/.zsh/plugins/fsh
    mkdir -p ~/.zsh/plugins/zsh-autosuggestions
    mkdir -p ~/.zsh/plugins/zsh-completions
    git clone https://github.com/zdharma/fast-syntax-highlighting ~/.zsh/plugins/fsh
    # git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
    # git clone https://github.com/zsh-users/zsh-completions ~/.zsh/plugins/zsh-completions
    curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/fzf/fzf.plugin.zsh >~/.zsh/plugins/fzf.plugin.zsh

    echo "Setting up tmux"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux new-session -d
    sleep 2
    tmux send-keys -t 0 "C-b I" C-m
    tmux kill-server

    echo "Setting up Qt theming"
    kvantummanager --set MateriaDark
    # TODO: Figure out how to set qt5 and qt6 to use kvantum-dark
else
    sleep 2
    echo "Skipping Post Installation Commands"
fi

echo "ENJOY!"
