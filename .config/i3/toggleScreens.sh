#!/usr/bin/env bash

# Find all connected screens
connectedScreens=$(xrandr | grep " connected " | awk '{ print$1 }')

# DP2-2 is the screen on the docking station
if [[ $connectedScreens == *"DP-2-2" ]];then
  # Docking station mode
  sh "$HOME/.config/i3/dockingStation.sh"
elif [[ $connectedScreens == *"DVI-I-" ]];then
  # Display link (2 screens)
  sh "$HOME/.config/i3/displayLink.sh"
else
  # Only laptop
  sh "$HOME/.config/i3/laptop.sh"
fi

# Restart i3, so the new screen setup is known (else some windows are gone wild)
i3-msg restart
