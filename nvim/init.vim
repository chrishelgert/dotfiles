" ~/.config/nvim/init.vim
call plug#begin('~/.local/share/nvim/plugged')

" https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'

" https://github.com/w0rp/ale
Plug 'w0rp/ale'

" https://github.com/tpope/vim-markdown
Plug 'tpope/vim-markdown'

" https://github.com/elzr/vim-json
Plug 'elzr/vim-json'

" https://github.com/leafgarland/typescript-vim
Plug 'leafgarland/typescript-vim'

" https://github.com/fatih/vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Initialize plugin system
call plug#end()

" True colors
set termguicolors

" Use ag instead of ack
if executable('ag')
	 let g:ackprg = 'ag --vimgrep'
endif
