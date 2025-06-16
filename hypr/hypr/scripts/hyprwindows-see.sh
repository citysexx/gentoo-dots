#!/usr/bin/env bash

# Get the current state of all clients and the active window
echo "Fetching the current state of all clients and the active window..."
state="$(hyprctl -j clients)"
active_window="$(hyprctl -j activewindow)"

# Extract the address and class (application name) of the currently active window
current_addr="$(echo "$active_window" | gojq -r '.address')"
current_class="$(echo "$active_window" | gojq -r '.class // "Unknown Class"')"  # Fallback to "Unknown Class" if class is null
echo "Current active window: Address: $current_addr, Class: $current_class"

# Select the window to focus (with workspace, title, and class), sorting the list and marking the focused one
echo "Selecting a window to focus based on the current state..."
window="$(echo "$state" | 
    gojq -r '.[] | select(.monitor != -1) | "\(.address)    \(.workspace.name)    \(.title)    \(.class // "Unknown Class")"' |  # Fallback to "Unknown Class" if class is null
    sed "s|$current_addr|focused ->|" |
    sort -r |
    tofi --fuzzy-match true --prompt-text ' ' --font-size=12
)"

# Extract the address, workspace, title, and class (appname) of the selected window
addr="$(echo "$window" | awk '{print $1}')"
ws="$(echo "$window" | awk '{print $2}')"
title="$(echo "$window" | awk '{print $3}')"
class="$(echo "$window" | awk '{print $4}')"

# Check if the selected window is already focused
if [[ "$addr" =~ focused* ]]; then
    echo "Window '$title' ($class) is already focused, exiting..."
    exit 0
fi

# Check if there is a fullscreen window on the same workspace
fullscreen_on_same_ws="$(echo "$state" | 
    gojq -r ".[] | select(.fullscreen == true) | select(.workspace.name == \"$ws\") | .address"
)"

# Focus the selected window, handling fullscreen states accordingly
if [[ -n "$window" ]]; then
    echo "Window selected: '$title' ($class) on Workspace: $ws"
    if [[ -z "$fullscreen_on_same_ws" ]]; then
        # If no fullscreen window exists on the same workspace, focus the window
        echo "No fullscreen window on the same workspace. Focusing the selected window '$title' ($class)..."
        hyprctl dispatch focuswindow address:"$addr"
    else
        # If a fullscreen window exists, first un-focus it, then focus the target window
        echo "Fullscreen window detected on the same workspace: $fullscreen_on_same_ws. Switching focus..."
        notify-send 'Complex Window Switch' "Switching focus to: '$title' ($class). Fullscreen window on the same workspace will be re-focused on top."
        hyprctl --batch "
            dispatch focuswindow address:$fullscreen_on_same_ws;
            dispatch fullscreen 1;
            dispatch focuswindow address:$addr;
            dispatch fullscreen 1
        "
    fi
else
    echo "No valid window selected, exiting..."
    exit 1
fi

