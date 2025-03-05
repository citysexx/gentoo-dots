#!/bin/bash

pipe="/tmp/cava.fifo"
audio_status_file="/tmp/audio_status"
config_file="/tmp/waybar_cava_config"

# Kill existing cava process before starting a new one
pkill -x cava 2>/dev/null

bar="⡀⣀⣠⣤⣦⣶⣷⣿"
dict="s/;//g;"

# Creating a dictionary for character replacement
for i in {0..7}; do
    dict="${dict}s/$i/${bar:$i:1}/g;"
done

# Ensure a clean FIFO
[ -p "$pipe" ] && rm "$pipe"
mkfifo "$pipe"

# Ensure the audio status file exists
rm $audio_status_file
touch "$audio_status_file"
echo 0 > "$audio_status_file"

# Generate cava config
cat > "$config_file" <<EOF
[general]
bars = 8
[output]
method = raw
raw_target = $pipe
data_format = ascii
ascii_max_range = 7
EOF

# Start the audio status checker in the background (ensure it writes to audio_status_pipe)
~/.config/waybar/check_audio_status.sh &
child_pid=$!  # Get the PID of the background process

# Set a trap to kill the child process if the main script exits
trap "kill $child_pid" EXIT

# Start cava in the background
cava -p "$config_file" &


# Read and process cava output, then format it for Waybar
while true; do
    # Check if the FIFO pipe has output
    if read -r cmd < "$pipe"; then
        AUDIO_STATUS=$(cat $audio_status_file)
        
        if [ "$AUDIO_STATUS" -eq 1 ]; then
            visual=$(echo "$cmd" | sed "$dict")
            echo " $visual"
        else
            echo " Silent"
        fi
    else
        # If no output, sleep for a longer period before checking again
        sleep 5
    fi
done
