#!/bin/bash
# Clipboard manager with wofi

case $1 in
    copy)
        wl-paste --watch cliphist store
        ;;
    menu)
        selection=$(cliphist list | wofi --dmenu)
        if [ -n "$selection" ]; then
            content=$(echo "$selection" | cliphist decode)
            echo "$content" | wl-copy
            # Type the content directly
            sleep 0.1
            wtype "$content"
        fi
        ;;
    clear)
        cliphist wipe
        ;;
esac
