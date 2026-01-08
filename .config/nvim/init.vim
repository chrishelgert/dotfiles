set scrolloff=8
set number
set relativenumber

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

set timeoutlen=300        " Faster mapping timeout (default is 1000ms)
set ttimeoutlen=0         " No terminal keycode timeout
set updatetime=200        " Quicker CursorHold events

" Only apply these tweaks when running inside VSCode-Neovim
if exists('g:vscode')
  " Don’t load netrw in VSCode; use VSCode’s Explorer instead
  let g:loaded_netrw = 1
  let g:loaded_netrwPlugin = 1

  " Remap your <leader>pv to focus the VSCode File Explorer (faster than :Vex)
  nnoremap <silent> <leader>pv :<C-u>call VSCodeNotify('workbench.view.explorer')<CR>

  " Optional: smoother UI during macros/long ops
  set lazyredraw
endif


