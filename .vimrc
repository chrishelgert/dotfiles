set nocompatible

call plug#begin('~/.vim/plugged')

" utils
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'

Plug 'pangloss/vim-javascript'
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support

Plug 'janko-m/vim-test' " run tests within vim

call plug#end()

" Settings
set encoding=utf-8
set clipboard=unnamed
set autoread
syntax on

" Indentation
set nowrap
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
