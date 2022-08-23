#!/bin/sh

xset r rate 200 60 &
# picom &
flameshot &
# start-pulseaudio-x11 &
# pipewire &
# pipewire-pulse &
# wireplumber &
nm-applet &
copyq &
setxkbmap -layout br,us
setxkbmap -option 'grp:alt_shift_toggle'
