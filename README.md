# My Dotfiles

## Installation

1. Open PowerShell with Admin privileges
2. Run setup script for windows with:
```ps1
[System.Net.ServicePointManager]::SecurityProtocol=[System.Net.SecurityProtocolType]'Tls11,Tls12';Set-ExecutionPolicy Bypass -Scope Process; iex((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/chrishelgert/dotfiles/master/windows.ps1'))
```
3. Restart your PC
4. Install WSL from Microsoft Store
5. Open WSL and run setup script for Linux
```bash
wget https://raw.githubusercontent.com/chrishelgert/dotfiles/master/unix.sh && sh ./unix.sh && rm -rf ./unix.sh
```
6. Create Symlinks for windows
```ps1
TODO
```
7. Get coding


## Update

```bash
TODO
```

## Tools / Configuration

### Kubernetes

1. Open docker settings
2. Go to `Kubernetes` tab
3. Enable `Kubernetes` and set `Kubernetes` as default orchestrator
