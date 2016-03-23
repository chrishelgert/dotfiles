#!/bin/bash
echo '/usr/local/bin/zsh' >> /etc/shells
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/code/antigen/antigen.zsh
