kernel_version=$(uname -r | cut -d'.' -f1,2)
if [[ "$kernel_version" < "6.11" ]]; then
    python3 ~/.local/share/dell-power-tray/main.py
else
    echo "6.11 Kernel has moved smbios commands for thermal control to /sys/firmware/acpi/platform_profile"
    echo "Please edit that file manually or use the dell-thermal-ctl.sh provided in the Scripts folder of the dotfiles"
fi
