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
profile_choice="$1"

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
  "b")
    new_profile="balanced"
    ;;
  "p")
    new_profile="performance"
    ;;
  "c")
    new_profile="cool"
    ;;
  "q")
    new_profile="quiet"
    ;;
  *)
    echo "Usage:'dell-thermal-ctl.sh <Mode>', where <Mode> is:"
    echo "1. Balanced(b)"
    echo "2. Performance(p)"
    echo "3. Cool(c)"
    echo "4. Quiet(q)"
    exit 0
    ;;
esac

echo "Changing thermal profile to: $new_profile"
echo "$new_profile" | sudo tee /sys/firmware/acpi/platform_profile
echo "Thermal profile changed successfully."
