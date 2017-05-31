#!/bin/bash

package=(
  n
  yo
  np
  now
  vtop
  serve
  micro
  release
  git-open
  speedracer
  speed-test
  diff-so-fancy
  react-native-cli
  create-react-app
  create-react-native-app
)

## Install mostly used npm-packages
## remove them if they already exists
for i in ${package[@]}; do
  yarn global remove $i
  yarn global add $i
done


# Tiny care don´t work currently with yarn
npm install -g tiny-care-terminal
