#!/bin/bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.6/install.sh | bash

# Install node via nvm
nvm install node

## Install mostly used npm-packages
sudo npm install --global speed-test git-open diff-so-fancy pm2
