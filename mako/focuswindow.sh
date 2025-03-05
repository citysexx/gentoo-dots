#!/bin/bash

# Get notification details
window_class=$(makoctl list | jq -r --arg id "$1" '.[] | select(.id == ($id|tonumber)) | .app_name')

# Focus the corresponding window
if [[ -n "$window_class" ]]; then
    hyprctl dispatch focuswindow "$window_class"
fi

