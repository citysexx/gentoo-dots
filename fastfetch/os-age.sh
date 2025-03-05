#!/bin/bash

# Get the filesystem creation (birth) date of the root directory
install_date=$(stat / | awk '/Birth: /{print $2 " " substr($3,1,5)}')

# If `install_date` is empty, exit with an error
if [ -z "$install_date" ]; then
    echo "Could not determine installation date. Unsupported filesystem or missing birth info."
    exit 1
fi

# Convert the install date to seconds since epoch
install_date_epoch=$(date -d "$install_date" +%s)

# Get the current date in seconds since epoch
current_date=$(date +%s)

# Calculate the difference in seconds
os_age_seconds=$((current_date - install_date_epoch))

# Convert OS age to years, months, weeks, days, hours, minutes, and seconds
years=$((os_age_seconds / 31536000))
months=$(( (os_age_seconds % 31536000) / 2592000))
weeks=$(( (os_age_seconds % 2592000) / 604800))
days=$(( (os_age_seconds % 604800) / 86400))
hours=$(( (os_age_seconds % 86400) / 3600))
minutes=$(( (os_age_seconds % 3600) / 60))
seconds=$((os_age_seconds % 60))

# Prepare output string with conditional formatting
output=""
[[ $years -gt 0 ]] && output+="$years y, "
[[ $months -gt 0 ]] && output+="$months m, "
[[ $weeks -gt 0 ]] && output+="$weeks w, "
[[ $days -gt 0 ]] && output+="$days d, "
[[ $hours -gt 0 ]] && output+="$hours h, "
[[ $minutes -gt 0 ]] && output+="$minutes m, "
output+="$seconds s"

# Display the result
echo "$output"
