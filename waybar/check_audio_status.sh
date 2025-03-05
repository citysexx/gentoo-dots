#!/bin/bash

audio_status_file="/tmp/audio_status"

audio_active() {
    # Check if any sink input is active and uncorked
    if pactl list sink-inputs | grep -q "Corked: no"; then
        return 0
    fi

    # Check all sinks for peak levels (track any active audio output)
    pactl list sinks | while read -r line; do
        if echo "$line" | grep -q "Name:"; then
            SINK_NAME=$(echo "$line" | awk '{print $2}')
            PEAK=$(pactl list sinks | awk -v sink="$SINK_NAME" '
                $0 ~ "Sink #" {current_sink=$3}
                /Peak:/ && current_sink == sink {print $2; exit}
            ')

            if [ -n "$PEAK" ] && [[ "$PEAK" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] && (( $(echo "$PEAK > -50" | bc -l) )); then
                return 0
            fi
        fi
    done

    return 1
}

while true; do
    if audio_active; then
        echo 1 > "$audio_status_file"  # Write 1 if audio is playing
        sleep 60
    else
        echo 0 > "$audio_status_file"  # Write 0 if no audio
        sleep 5
    fi
done

