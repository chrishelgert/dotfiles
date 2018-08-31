# Setup for windows

## Settings

Write-Host "> Writing default settings for windows..."
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions
Set-TaskbarOptions -Size Small -Dock Bottom -Combine Full -Lock
Set-TaskbarOptions -Size Small -Dock Bottom -Combine Full -AlwaysShowIconsOn
Write-host "Applied settings for windows"

## Install Chocolatey

Write-Host "> Installing chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Host "Finished installing chocolatey"

## Remove unnecessary programms

Write-Host "> Remove default Microsoft Store applications..."
# TODO
Write-Host "> Removed all default applications"

## WSL
$wsl = Read-Host -Prompt '> Do you want to use WSL? (y|n)'
if ($wsl -eq "y") {
  Write-Host "> Enabling WSL - please do not restart after this step"
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
  Write-Host "> WSL is now enabled"
} else {
  Write-Host "> Skip WSL enabling"
}

## Install programms with chocolatey

Write-Host "> Installing Tools via chocolatey..."

### Individual troubleshooting tools and help files

choco install sysinternals -y

### Browsers

choco install googlechrome -y
choco install firefox -y
choco install brave -y

### Tools

choco install hyper -y
choco install vscode -y
choco install rambox -y
choco install docker-for-windows -y
choco install sharex -y
#choco install vcxsrv

### Games (optional)
$games = Read-Host -Prompt '> Do you want to play on this device? (y|n)'
if ($games -eq "y") {
  Write-Host "> Installing steam and teamspeak"
  choco install steam -y
  choco install teamspeak -y
} else {
  Write-Host "> Skip game installation"
}

Write-Host "> All windows programs have been installed."

### Finish

Write-Host "> Restart your PC for further WSL installation."
Write-Host "> After restarting, download your favorit Linux distribution from the Microsoft Store."
Write-Host "> Visit https://docs.microsoft.com/en-us/windows/wsl/install-win10#install-your-linux-distribution-of-choice  for more informations"
