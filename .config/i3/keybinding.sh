#!/usr/bin/env bash

# Utility for inserting any character with the compose key.
# This is useful for writing umlauts with an ANSI keyboard.
#
# Examples:
# super + a         -->     ä
# super + shift + a -->     Ä
# super + s         -->     ß
xdotool keyup "Super_L+$1" && xdotool type "$2"