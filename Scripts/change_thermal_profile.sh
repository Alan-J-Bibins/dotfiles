#!/bin/bash

# Check kernel version
kernel_version=$(uname -r | cut -d'.' -f1,2)
if [[ "$kernel_version" < "6.11" ]]; then
    echo "This script requires Linux kernel version 6.11 or later."
    exit 1
fi

# Get the current thermal profile
current_profile=$(cat /sys/firmware/acpi/platform_profile)
echo "Current thermal profile: $current_profile"

# Prompt the user to select a new profile
echo "Select a new thermal profile:"
echo "1. Balanced"
echo "2. Performance"
echo "3. Cool"
echo "4. Quiet"
read -p "Enter 1, 2, 3, or 4: " profile_choice

# Set the new thermal profile
case $profile_choice in
  1)
    new_profile="balanced"
    ;;
  2)
    new_profile="performance"
    ;;
  3)
    new_profile="cool"
    ;;
  4)
    new_profile="quiet"
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

echo "Changing thermal profile to: $new_profile"
echo "$new_profile" | sudo tee /sys/firmware/acpi/platform_profile
echo "Thermal profile changed successfully."
