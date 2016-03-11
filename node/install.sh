#!/bin/bash

# Install node via nvm
nvm install node

# Install mostly used npm-packages
sudo npm install --global \
  gulp webpack webpack-dev-server \
  node-sass babel \
  eslint xo \
  ava karma phantomjs \
  git-open diff-so-fancy \
  npm-update-notifer
