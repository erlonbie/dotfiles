#!/bin/sh

xset r rate 250 45 &
picom &
flameshot &
start-pulseaudio-x11 &
copyq &

