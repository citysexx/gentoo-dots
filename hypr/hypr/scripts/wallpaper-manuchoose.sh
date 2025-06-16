#!/usr/bin/env bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Function to show rofi with the current selected wallpaper
show_rofi() {
    local prompt="$1"
    local selected_wallpaper="$2"
    
    # Extract the filename from the path
    local filename=$(basename "$selected_wallpaper")

    # List all image files in the directory, pass them to rofi, and show current wallpaper in the prompt
    SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | while read file; do
        echo "$(basename "$file")"  # Show only filenames in rofi
    done | rofi -dmenu -i --prompt "$prompt" --no-custom -theme /home/citysexx/.config/rofi/launchers/type-1/style-1.rasi<<< "$filename"$'\nConfirm\nContinue\nExit')

    # If the user selects "Exit", return
    if [ "$SELECTED_WALLPAPER" == "Exit" ]; then
        exit 0
    fi

    # If the user selects "Confirm", print the path and exit
    if [ "$SELECTED_WALLPAPER" == "Confirm" ]; then
        echo $selected_wallpaper
        exit 0
    fi

    # If the user selects "Continue", return to the loop to keep choosing wallpapers
    if [ "$SELECTED_WALLPAPER" == "Continue" ]; then
        return
    fi
}

# Start with an empty selected wallpaper
current_wallpaper=""

while true; do
    # List all image files in the directory and pass them to rofi
    SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | while read file; do
        echo "$(basename "$file")"  # Show only filenames in rofi
    done | rofi -dmenu -i --prompt "Select Wallpaper: $current_wallpaper" --no-custom -theme /home/citysexx/.config/rofi/launchers/type-1/style-1.rasi)

    # If a wallpaper was selected, open it with an image viewer
    if [ -n "$SELECTED_WALLPAPER" ]; then
        # Find the full path of the selected wallpaper by matching the filename
        selected_wallpaper=$(find "$WALLPAPER_DIR" -type f -name "$SELECTED_WALLPAPER")

        current_wallpaper="$selected_wallpaper"  # Save the selected wallpaper

        # Open the selected wallpaper using feh, 800x600 window, scaled to fill while maintaining aspect ratio
        feh --geometry 800x600 --zoom fill --scale-down "$selected_wallpaper" &
        
        # Wait for feh to exit before proceeding
        wait $!
        
        # After feh closes, show rofi again with the current wallpaper in the prompt
        show_rofi "$current_wallpaper" "$selected_wallpaper"
    else
        # Exit the loop if no wallpaper is selected (rofi closed without selecting)
        break
    fi
done
