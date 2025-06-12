#!/bin/bash

grim ~/Pictures/Screenshots/screenshot-$(date '+%Y%m%d-%H:%M:%S')
notify-send -i image "Saved Screenshot" "Grim at work"

