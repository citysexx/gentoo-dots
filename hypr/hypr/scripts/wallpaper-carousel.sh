#!/bin/bash

# Set the directory (or use the first argument)
DIR="/home/citysexx/Pictures/wallpapers"

# Check if the directory exists
if [[ ! -d "$DIR" ]]; then
    echo "Error: Directory not found!"
    exit 1
fi

# Get a random file
#FILE=$(find "$DIR" -type f | shuf -n 1)

# Get chosen file with rofi
FILE=$(bash $HOME/.config/hypr/scripts/wallpaper-manuchoose.sh)

# Check if a file was found
if [[ -z "$FILE" ]]; then
    echo "No file selected"
    exit 0
else
    notify-send "Style will be changed soon..."
    sleep 1
    killall hyprpaper
    sleep 1
    hyprpaper > /dev/null 2>&1 & disown
    sleep 1
    echo "Random file: $FILE"
    hyprctl hyprpaper reload ,"$FILE"
    sleep 1
    wal --cols16 -i $FILE -n # needs Pywal package or pywal16 in this case
    sleep 1
    echo "sending seds to the hyprpaper config..."
    sleep 1
    echo "preload = $FILE" > /home/citysexx/.config/hypr/hyprpaper.conf
    echo "wallpaper = , $FILE" >> /home/citysexx/.config/hypr/hyprpaper.conf
    echo "splash = false" >> /home/citysexx/.config/hypr/hyprpaper.conf
fi
source ~/.cache/wal/colors.sh

# Lowercase the color variables on the fly
color0_lower="${color0,,}"
color1_lower="${color1,,}"
color2_lower="${color2,,}"
color3_lower="${color3,,}"
color4_lower="${color4,,}"
color5_lower="${color5,,}"
color6_lower="${color6,,}"
color7_lower="${color7,,}"
color8_lower="${color8,,}"
color9_lower="${color9,,}"
color10_lower="${color10,,}"
color11_lower="${color11,,}"
color12_lower="${color12,,}"
color13_lower="${color13,,}"
color14_lower="${color14,,}"
color15_lower="${color15,,}"

background_lower="${background,,}"
foreground_lower="${foreground,,}"

# Print all the color variables in lowercase
echo "color0 = $color0_lower"
echo "color1 = $color1_lower"
echo "color2 = $color2_lower"
echo "color3 = $color3_lower"
echo "color4 = $color4_lower"
echo "color5 = $color5_lower"
echo "color6 = $color6_lower"
echo "color7 = $color7_lower"
echo "color8 = $color8_lower"
echo "color9 = $color9_lower"
echo "color10 = $color10_lower"
echo "color11 = $color11_lower"
echo "color12 = $color12_lower"
echo "color13 = $color13_lower"
echo "color14 = $color14_lower"
echo "color15 = $color15_lower"

echo "background = $background_lower"
echo "foreground = $foreground_lower"

# tricky update of waybar from template
sed -e "s|\$color_templ0\([^a-zA-Z0-9_]\)|${color0_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ1\([^a-zA-Z0-9_]\)|${color1_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ2\([^a-zA-Z0-9_]\)|${color2_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ3\([^a-zA-Z0-9_]\)|${color3_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ4\([^a-zA-Z0-9_]\)|${color4_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ5\([^a-zA-Z0-9_]\)|${color5_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ6\([^a-zA-Z0-9_]\)|${color6_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ7\([^a-zA-Z0-9_]\)|${color7_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ8\([^a-zA-Z0-9_]\)|${color8_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ9\([^a-zA-Z0-9_]\)|${color9_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ10\([^a-zA-Z0-9_]\)|${color10_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ11\([^a-zA-Z0-9_]\)|${color11_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ12\([^a-zA-Z0-9_]\)|${color12_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ13\([^a-zA-Z0-9_]\)|${color13_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ14\([^a-zA-Z0-9_]\)|${color14_lower//\#/\\#}\1|g" \
    -e "s|\$color_templ15\([^a-zA-Z0-9_]\)|${color15_lower//\#/\\#}\1|g" \
    -e "s|\$background\([^a-zA-Z0-9_]\)|${background_lower}\1|g" \
    -e "s|\$foreground\([^a-zA-Z0-9_]\)|${foreground_lower}\1|g" \
    /home/citysexx/.config/waybar/style.css.template > /home/citysexx/.config/waybar/style.css
sleep 1
#update neovim colors
sed -e "s/\$color0/$color0/g" \
    -e "s/\$color1/$color1/g" \
    -e "s/\$color2/$color2/g" \
    -e "s/\$color3/$color3/g" \
    -e "s/\$color4/$color4/g" \
    -e "s/\$color5/$color5/g" \
    -e "s/\$color6/$color6/g" \
    -e "s/\$color7/$color7/g" \
    -e "s/\$color8/$color8/g" \
    -e "s/\$color9/$color9/g" \
    -e "s/\$colora/$color10/g" \
    -e "s/\$colorb/$color11/g" \
    -e "s/\$colorc/$color12/g" \
    -e "s/\$colord/$color13/g" \
    -e "s/\$colore/$color14/g" \
    -e "s/\$colorf/$color15/g" \
    /home/citysexx/.config/nvim/colors/customcurrent.vim.template > /home/citysexx/.config/nvim/colors/customcurrent.vim
sleep 1
#restart waybar
killall waybar
sleep 5
waybar > /dev/null 2>&1 & disown

# Update Rofi config with colors
sed -e "s/\$color0/$color0/g" \
    -e "s/\$color1/$color1/g" \
    -e "s/\$color2/$color2/g" \
    -e "s/\$color3/$color3/g" \
    -e "s/\$color4/$color4/g" \
    -e "s/\$color5/$color5/g" \
    -e "s/\$color6/$color6/g" \
    -e "s/\$color7/$color7/g" \
    -e "s/\$color8/$color8/g" \
    -e "s/\$color9/$color9/g" \
    -e "s/\$colora/$color10/g" \
    -e "s/\$colorb/$color11/g" \
    -e "s/\$colorc/$color12/g" \
    -e "s/\$colord/$color13/g" \
    -e "s/\$colore/$color14/g" \
    -e "s/\$colorf/$color15/g" \
    -e "s/\$background/$background/g" \
    -e "s/\$foreground/$foreground/g" \
    /home/citysexx/.config/rofi/colors/pywal_custom_skin.rasi.template > /home/citysexx/.config/rofi/colors/pywal_custom_skin.rasi
sleep 1

# update kitty colors
cp /home/citysexx/.cache/wal/colors-kitty.conf /home/citysexx/.config/kitty/current-theme.conf
sleep 1

# update hyprland colors dynamically
sed -e "s/\$color0/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color0)/g" \
    -e "s/\$color1/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color1)/g" \
    -e "s/\$color2/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color2)/g" \
    -e "s/\$color3/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color3)/g" \
    -e "s/\$color4/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color4)/g" \
    -e "s/\$color5/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color5)/g" \
    -e "s/\$color6/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color6)/g" \
    -e "s/\$color7/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color7)/g" \
    -e "s/\$color8/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color8)/g" \
    -e "s/\$color9/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color9)/g" \
    -e "s/\$colora/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color10)/g" \
    -e "s/\$colorb/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color11)/g" \
    -e "s/\$colorc/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color12)/g" \
    -e "s/\$colord/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color13)/g" \
    -e "s/\$colore/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color14)/g" \
    -e "s/\$colorf/$(/home/citysexx/.config/hypr/scripts/hex-to-rgb.sh $color15)/g" \
    /home/citysexx/.config/hypr/hyprcolors.conf.template > /home/citysexx/.config/hypr/hyprcolors.conf
sleep 1
hyprctl reload

# updating notification daemon with colors and reload it
sed -e "s/\$color0/$color0/g" \
    -e "s/\$color1/$color1/g" \
    -e "s/\$color2/$color2/g" \
    -e "s/\$color3/$color3/g" \
    -e "s/\$color4/$color4/g" \
    -e "s/\$color5/$color5/g" \
    -e "s/\$color6/$color6/g" \
    -e "s/\$color7/$color7/g" \
    -e "s/\$color8/$color8/g" \
    -e "s/\$color9/$color9/g" \
    -e "s/\$colora/$color10/g" \
    -e "s/\$colorb/$color11/g" \
    -e "s/\$colorc/$color12/g" \
    -e "s/\$colord/$color13/g" \
    -e "s/\$colore/$color14/g" \
    -e "s/\$colorf/$color15/g" \
    -e "s/\$background/$background/g" \
    -e "s/\$foreground/$foreground/g" \
    /home/citysexx/.config/swaync/style.css.template > /home/citysexx/.config/swaync/style.css
killall swaync
sleep 5
swaync > /dev/null 2>&1 & disown
sleep 5
notify-send "Style has been changed! Moooo..."

#mkdir -p /home/citysexx/Documents/anacron
#touch /home/citysexx/Documents/anacron/.anacron.log
#echo "Anacron ran at $(date)" >> /home/citysexx/Documents/anacron/.anacron.log
