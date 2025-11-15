#!/bin/bash
# Clipboard manager with wofi

case $1 in
    copy)
        wl-paste --watch cliphist store
        ;;
    menu)
        cliphist list | wofi --dmenu | cliphist decode | wl-copy
        ;;
    clear)
        cliphist wipe
        ;;
esac
