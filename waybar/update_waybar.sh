# This script will change your waybar colors using pywal colors
# Usage ./update_waybar.sh (don't forget to `sudo chmod +x ./update_waybar.sh`)

# Path to the Pywal colors
PYWAL_COLORS="$HOME/.cache/wal/colors.json"

# Path to the Waybar style file
WAYBAR="$HOME/.config/waybar/style.css"

# Default colors (will be used if Pywal colors are not generated/available)
DEFAULT_WAYBAR_BACKGROUND="rgba(0, 0, 0, 0.7)"

# Function to extract value from JSON
get_json_value() {
    echo "$1" | grep -oP '"'"$2"'": *"\K[^"]*'
}

# Function to convert hex color to rgba with transparency
hex_to_rgba() {
    hex=$1
    r=$(echo $hex | cut -c2-3)
    g=$(echo $hex | cut -c4-5)
    b=$(echo $hex | cut -c6-7)

    # Convert hex to decimal
    r=$((16#${r}))
    g=$((16#${g}))
    b=$((16#${b}))

    # Return rgba format with alpha set to 0.4 for transparency
    echo "rgba($r, $g, $b, 0.4)"
}

echo "Looking for pywal colors..."

if [ ! -f "$PYWAL_COLORS" ]; then
    echo "Pywal colors not found, using default colors."
    WAYBAR_BACKGROUND=$DEFAULT_WAYBAR_BACKGROUND
else
    echo "Pywal colors found, reading colors."
    WAYBAR_BACKGROUND=$(get_json_value "$(cat $PYWAL_COLORS)" "color8")
    echo "Using color8: $WAYBAR_BACKGROUND"

    # If the color is in hex format, convert it to rgba
    if [[ "$WAYBAR_BACKGROUND" =~ ^#[0-9a-fA-F]{6}$ ]]; then
        WAYBAR_BACKGROUND=$(hex_to_rgba $WAYBAR_BACKGROUND)
        echo "Converted hex to rgba: $WAYBAR_BACKGROUND"
    fi
fi

# Update Waybar's style.css with the new background color
echo "Updating Waybar colors..."

# Check if the style.css already contains a rgba or hex for the background-color
if grep -q "background-color" "$WAYBAR"; then
    # Replace the background-color line inside window#waybar
    sed -i "/window#waybar {/,/}/s|background-color: .*;|background-color: $WAYBAR_BACKGROUND;|" "$WAYBAR"
else
    # If there's no background-color, add the background-color property
    sed -i "/window#waybar {/a background-color: $WAYBAR_BACKGROUND;" "$WAYBAR"
fi

# Restart Waybar to apply changes
echo "Restarting Waybar..."
killall waybar
waybar > /dev/null 2>&1 & disown

echo "Waybar colors updated!"

