:: use neovim from wsl

@echo off
wsl wslpath -aw $(nvim %*) 2> nul 
if not %errorlevel% == 0 (
    wsl nvim %*
)
@echo on
