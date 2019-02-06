" ~/.config/nvim/init.vim
call plug#begin('~/.local/share/nvim/plugged')

" https://github.com/kristijanhusak/vim-hybrid-material
Plug 'kristijanhusak/vim-hybrid-material'
let g:hybrid_transparent_background = 1
let g:enable_italic_font = 1

" https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'

" https://github.com/w0rp/ale
Plug 'w0rp/ale'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https:/github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

" https://github.com/valloric/youcompleteme
Plug 'valloric/youcompleteme'
" Requires installation afterwards
" python ~/.local/share/nvim/plugged/youcompleteme/install.py

" https://github.com/raimondi/delimitMate
Plug 'raimondi/delimitMate'

" Snippets
" https://github.com/sirver/ultisnips
Plug 'sirver/ultisnips'
" https://github.com/honza/vim-snippets
Plug 'honza/vim-snippets'

" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

" https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" https://github.com/vim-syntastic/syntastic
Plug 'vim-syntastic/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = "hybrid"

"https://github.com/tpope/vim-markdown
Plug 'tpope/vim-markdown'

" https://github.com/elzr/vim-json
Plug 'elzr/vim-json'

" https://github.com/leafgarland/typescript-vim
Plug 'leafgarland/typescript-vim'

" https://github.com/jparise/vim-graphql
Plug 'jparise/vim-graphql'

" Initialize plugin system
call plug#end()

" True colors
if (has("termguicolors"))
	set termguicolors
endif

" Theme
syntax enable
set background=dark
colorscheme hybrid_material

" Use ag instead of ack
if executable('ag')
	 let g:ackprg = 'ag --vimgrep'
endif

" Indentation
set nowrap
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Line numbers
set number

