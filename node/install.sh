#!/bin/bash

# Install node via nvm
nvm install node

# install yarn
curl -o- -L https://yarnpkg.com/install.sh | bash

## Install mostly used npm-packages
sudo npm install --global speed-test git-open diff-so-fancy pm2 npm-check greenkeeper now create-react-app yo vtop