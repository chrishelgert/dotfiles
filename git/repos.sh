#!/bin/bash

# disable itunes opening on media keys
git clone https://github.com/thebitguru/play-button-itunes-patch ~/code/play-button-itunes-patch

# show commits from the last day
git clone https://github.com/kamranahmedse/git-standup ~/code/git-standup
cd ~/code/git-standup
sudo make install

# git autocomplete
sudo -H pip3 install gitsome
git clone https://github.com/donnemartin/gitsome ~/code/gitsome
