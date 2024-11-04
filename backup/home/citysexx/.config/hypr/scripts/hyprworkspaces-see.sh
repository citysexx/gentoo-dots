#!/usr/bin/env bash
# rofi -show window for Hyprland, basically

workspaces="$(hyprctl -j workspaces)"

# get active workspace properties
active_workspace="$(hyprctl -j activeworkspace)"
active_ws_id="$(echo $active_workspace | gojq -r '.id')"

workspace_list="$(echo "$workspaces" |
  gojq -r '.[] | select(.monitor != -1 ) | " \(.id):    :\(.monitor)(id:\(.monitorID))      :\(.windows)      :\(.hasfullscreen)      :\(.lastwindowtitle)"' |
  sed "s| $active_ws_id|\(active\)  $active_ws_id|" |
    sort -r | 
    tofi --fuzzy-match true --prompt-text ' ' --font-size=14
)"

# current chosen workspace
choice="$(echo "$workspace_list" | awk '{print $2}')"

# user chooses current one
if [[ "$choice" =~ *active* ]]; then
    echo 'chosen active workspace, nothing to do'
    exit 0
fi

# user chooses another one
ws_pure=$(echo "$choice" | sed 's/[^0-9]*//g' )
hyprctl dispatch workspace $ws_pure

