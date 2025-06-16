#!/bin/bash

# Operation kind passed as first argument
OPERATION="$1"

# Create lockscreen background
grim -s 1.5 -l 0 ~/.cache/screenlock.png

# Start Hyprlock
~/.config/hypr/scripts/lockscreen-aggressive.sh &

# Wait to ensure the lock is active before proceeding
sleep 3

# Act based on operation
case "$OPERATION" in
  suspend)
    loginctl suspend
    ;;
  hibernate)
    loginctl hibernate
    ;;
  hybrid-sleep)
    loginctl hybrid-sleep
    ;;
  reboot)
    loginctl reboot
    ;;
  poweroff)
    loginctl poweroff
    ;;
  lock-only)
    # Do nothing more — just lock
    ;;
  *)
    echo "❌ Unknown operation: '$OPERATION'" >&2
    echo "Usage: $0 [suspend|hibernate|hybrid-sleep|reboot|poweroff|lock-only]" >&2
    exit 1
    ;;
esac
