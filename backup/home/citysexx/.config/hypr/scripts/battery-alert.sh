#!/bin/bash

# Set the threshold value (5% in this case)
THRESHOLD=10

while true;
do
  # wait
  sleep 60
  # Get the current battery percentage using acpi
  BATTERY_PERCENT=$(acpi -b | awk '{print $4}' | sed 's/%,//')
  BATTERY_STATE=$(acpi -b | awk '{print $3}' | sed 's/,//')
  if [ -z "${BATTERY_PERCENT}" ];
  then
    echo exiting...
    exit
  fi

  # Check if the battery level is below the threshold
  if [ $BATTERY_PERCENT -le $THRESHOLD ] && [ $BATTERY_STATE = 'Discharging' ] ; then
      # Notify the user using notify-send
      sleep 30

      # Suspend the laptop (replace with your preferred suspend command)
      systemctl suspend
  fi
done
