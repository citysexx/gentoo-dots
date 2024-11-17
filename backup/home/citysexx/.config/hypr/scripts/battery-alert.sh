#!/bin/bash

# Set the threshold value (5% in this case)
THRESHOLD=10

while true;
do
  # wait
  sleep 60
  # Get the current battery percentage using acpi
  BATTERY_PERCENT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i 'percentage' | awk '{print $2}' | sed 's/%//')
  BATTERY_STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i 'state' | awk '{print $2}')
  if [ -z "${BATTERY_PERCENT}" ];
  then
    echo exiting...
    exit
  fi

  # Check if the battery level is below the threshold
  if [ $BATTERY_PERCENT -le $THRESHOLD ] && [ $BATTERY_STATE = 'discharging' ] ; then
      # Notify the user using notify-send
      notify-send -c urgent "The battery is low, the laptop will hibernate in 60 seconds..."
      sleep 60

      # Suspend the laptop (replace with your preferred suspend command)
      # systemctl suspend

      # openrc loginctl
      loginctl suspend
  fi
done
