# Setup for windows

## Settings

Write-Host "Writing default settings for windows..."
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions
Set-TaskbarOptions -Size Small -Dock Bottom -Combine Full -Lock
Set-TaskbarOptions -Size Small -Dock Bottom -Combine Full -AlwaysShowIconsOn
Write-host "Applied settings for windows"

## Install Chocolatey

Write-Host "Installing chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Host "Finished installing chocolatey"

## Remove unnecessary programms

Write-Host "Remove default Microsoft Store applications..."
# TODO
Write-Host "Removed all default applications"

## WSL

Write-Host "Enabling system for WSL..."
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Write-Host "WSL is now enabled"

## Install programms with chocolatey

Write-Host "Installing Tools via chocolatey..."

### Individual troubleshooting tools and help files

choco install sysinternals -y

### Browsers

choco install googlechrome
choco install firefox
choco install brave

### Tools

choco install hyper
choco install vscode
choco install rambox
choco install docker-for-windows
choco install sharex
#choco install vcxsrv

### Games (optional)
$games = Read-Host -Prompt 'Do you want to play on this device? (y|n)'
if ($input -eq "y") {
  Write-Host "Installing steam and teamspeak"
  choco install steam
  choco install teamspeak
} else {
  Write-Host "Skip game installation"
}

Write-Host "All windows programs have been installed."

### Finish

Write-Host "For installing WSL visit the Microsoft Store."
Write-Host "Or visit https://docs.microsoft.com/en-us/windows/wsl/install-win10#install-your-linux-distribution-of-choice"
