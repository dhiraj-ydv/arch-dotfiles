#!/bin/bash

option=$(echo -e "⏻ Shutdown\n Reboot\n⏾ Suspend\n Lock\n Logout" | wofi --dmenu --prompt "Power Menu")

case $option in
    "⏻ Shutdown")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    "⏾ Suspend")
        systemctl suspend
        ;;
    " Lock")
        hyprlock
        ;;
    " Logout")
        hyprctl dispatch exit
        ;;
esac
