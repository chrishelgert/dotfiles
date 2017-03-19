#!/bin/bash

package=(
  n
  yo
  np
  now
  vtop
  micro
  release
  git-open
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
