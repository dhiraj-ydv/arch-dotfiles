#!/bin/bash
options="⏻ Shutdown\n⭮ Reboot\n⏾ Suspend\n Lock"
chosen=$(echo -e "$options" | wofi --dmenu --prompt "Power Menu" --width 300 --height 200)

case "$chosen" in
    "⏻ Shutdown") systemctl poweroff ;;
    "⭮ Reboot") systemctl reboot ;;
    "⏾ Suspend") systemctl suspend ;;
    " Lock") swaylock ;;
esac
