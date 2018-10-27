# Creates Symlinks for the windows tools

New-Item -ItemType directory -Path C:\Tools
New-Item -Path C:\Tools\git.bat -ItemType SymbolicLink -Value C:\Users\$($env:UserName)\workspace\dotfiles\windows\git.bat
Remove-Item C:\Users\$($env:UserName)\.hyper.js
New-Item -Path C:\Users\$($env:UserName)\.hyper.js -ItemType SymbolicLink -Value C:\Users\$($env:UserName)\workspace\dotfiles\windows\.hyper.js

# Add exclusions for windows defender

Add-MpPreference -ExclusionPath C:\Users\$($env:UserName)\workspace
App-MpPreference -ExclusionPath C:\Users\$($env:UserName)\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs

# Add shortcut for wsl start file

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\i3.lnk")
$Shortcut.TargetPath = "C:\Tools\i3\i3.vbs"
$shortcut.IconLocation="C:\Tools\i3\icon.ico"
$shortcut.WorkingDirectory="C:\Tools\i3"
$Shortcut.Save()
