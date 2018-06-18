#!/bin/bash

package=(
  diff-so-fancy
  git-open
  micro
  n
  now
  np
  npx
  pwmetrics
  release
  serve
  serverless
  speedracer
  speed-test
  vtop
  yo
)

## Install mostly used npm-packages
## remove them if they already exists
for i in ${package[@]}; do
  npm uninstall --global $i
  npm install --global $i
done
