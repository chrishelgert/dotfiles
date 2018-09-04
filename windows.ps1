# Setup for windows

## Settings

Write-Host "> Writing default settings for windows..."
Write-Host "> Show Hidden files and show file extensions..."
$Advanced = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $Advanced Hidden 1
Set-ItemProperty $Advanced HideFileExt 0
Set-ItemProperty $Advanced ShowSuperHidden 1

Write-Host "> Configure Taskbar..."
Set-ItemProperty $Advanced TaskbarSmallIcons 1

Write-Host "> Restart Explorer..."
Stop-Process -processName: Explorer -force

Write-host "> Applied settings for windows"

## Install Chocolatey

Write-Host "> Installing chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Host "> Finished installing chocolatey"

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
choco install postman -y
choco install docker-for-windows -y
choco install sharex -y
#choco install vcxsrv

#### PDF-Reader
$pdf = Read-Host -Prompt '> Do you need a PDF Viewer? (y|n)'
if ($pdf -eq "y") {
  Write-Host "> Installing the PDF Viewer"
  choco install adobereader -y
} else {
  Write-Host "> Skip PDF Viewer installation"
}

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

if ($wsl -eq "y") {
  Write-Host "> Restart your PC for further WSL installation."
  Write-Host "> After restarting, download your favorit Linux distribution from the Microsoft Store."
  Write-Host "> Visit https://docs.microsoft.com/en-us/windows/wsl/install-win10#install-your-linux-distribution-of-choice  for more informations"
} else {
  Write-Host "> Finished windows setup."
}
