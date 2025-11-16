#!/bin/bash
# Clipboard manager with wofi

case $1 in
    copy)
        wl-paste --watch cliphist store
        ;;
    menu)
        selection=$(cliphist list | wofi --dmenu --cache-file=/dev/null)
        if [ -n "$selection" ]; then
            cliphist decode <<< "$selection" | wl-copy
            wtype -M ctrl -M shift v
        fi
        ;;
    clear)
        cliphist wipe
        ;;
esac
