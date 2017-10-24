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
  flow-bin
  git-open
  pwmetrics
  preact-cli
  serverless
  speedracer
  speed-test
  diff-so-fancy
  create-react-app
)

## Install mostly used npm-packages
## remove them if they already exists
for i in ${package[@]}; do
  yarn global remove $i
  yarn global add $i
done
