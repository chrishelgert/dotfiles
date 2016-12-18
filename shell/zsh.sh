#!/bin/bash
sudo echo '/usr/local/bin/zsh' >> /etc/shells
mkdir ~/code/antigen
curl https://cdn.rawgit.com/zsh-users/antigen/v1.3.1/bin/antigen.zsh > ~/code/antigen/antigen.zsh
source ~/code/antigen/antigen.zsh
