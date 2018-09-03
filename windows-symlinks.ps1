# Creates Symlinks for the windows tools

New-Item -ItemType directory -Path C:\Tools
New-Item -Path C:\Tools\git.bat -ItemType SymbolicLink -Value C:\Users\$($env:UserName)\workspace\dotfiles\windows\git.bat