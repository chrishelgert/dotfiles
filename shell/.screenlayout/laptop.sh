#!/bin/sh
xrandr --output DP-2-1 --off --output DP-2-2 --off --output DP-2-3 --off --output eDP-1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output HDMI-2 --off --output HDMI-1 --off --output DP-2 --off --output DP-1 --off

i3-msg restart
