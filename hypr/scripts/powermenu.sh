#!/usr/bin/env bash

op=$( echo -e " Poweroff\n Reboot\n Suspend\n Lock\n Hibernate\n  Hybrid-sleep" | wofi -i --dmenu | awk '{print tolower($2)}' )

case $op in 
        poweroff)
                ;&
        hibernate)
                ;&
        reboot)
                ;&
        hybrid-sleep)
                ;&
        suspend)
                grim -s 1.5 -l 0 ~/.cache/screenlock.png && hyprlock &
                sleep 3
                loginctl $op
                ;;
        lock)
		hyprlock
                ;;
esac
