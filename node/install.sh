#!/bin/bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

# Install node via nvm
nvm install node

# Install mostly used npm-packages
sudo npm install --global \
  gulp webpack webpack-dev-server \
  node-sass babel \
  eslint xo \
  ava karma phantomjs-prebuilt \
  git-open diff-so-fancy
