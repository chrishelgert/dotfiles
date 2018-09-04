# Creates Symlinks for the windows tools

New-Item -ItemType directory -Path C:\Tools
New-Item -Path C:\Tools\git.bat -ItemType SymbolicLink -Value C:\Users\$($env:UserName)\workspace\dotfiles\windows\git.bat
Remove-Item C:\Users\$($env:UserName)\.hyper.js
New-Item -Path C:\Users\$($env:UserName)\.hyper.js -ItemType SymbolicLink -Value C:\Users\$($env:UserName)\workspace\dotfiles\windows\.hyper.js