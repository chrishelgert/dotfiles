#!/bin/bash
sudo echo '/usr/local/bin/zsh' >> /etc/shells

# load antigen
mkdir ~/code/antigen
curl -L git.io/antigen > ~/code/antigen/antigen.zsh
