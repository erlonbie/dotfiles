#!/bin/sh

xset r rate 200 60 &
picom &
flameshot &
# start-pulseaudio-x11 &
# pipewire &
# pipewire-pulse &
# wireplumber &
dunst &
nm-applet &
copyq &
fcitx5 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# setxkbmap -layout br,us
# setxkbmap -option 'grp:alt_shift_toggle'
