#!/bin/bash

# Input: Hex color (e.g., #635F68)
HEX="$1"

# Remove '#' if present
HEX="${HEX#\#}"

# Convert to RGB
R=$((16#${HEX:0:2}))
G=$((16#${HEX:2:2}))
B=$((16#${HEX:4:2}))

# Output in rgb(x, y, z) format
echo "rgb($R,$G,$B)"
