#!/bin/bash

# disable itunes opening on media keys
git clone https://github.com/thebitguru/play-button-itunes-patch ~/code/play-button-itunes-patch

git clone https://github.com/kamranahmedse/git-standup.git ~/code/git-standup
cd ~/code/git-standup
sudo make install
