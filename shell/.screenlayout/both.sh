#!/bin/sh
xrandr --output DP-2-1 --off \
  --output DP-2-2 --primary --mode 1920x1200 --pos 0x600 --rotate normal --scale 2x2 \
  --output DP-2-3 --off \
  --output eDP-1 --mode 3840x2160 --pos 3840x0 --rotate normal \
  --output HDMI-2 --off \
  --output HDMI-1 --off \
  --output DP-2 --off \
  --output DP-1 --off
