" ~/.config/nvim/init.vim

" zplug
" =====================================
call plug#begin('~/.local/share/nvim/plugged')

" Theme
" https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'

" Statusbar with onedark theme
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tree explorer with git status
" https://github.com/scrooloose/nerdtree & https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" Automatic close quotes, paranthesis, brackets, etc.
" https://github.com/raimondi/delimitMate
Plug 'raimondi/delimitMate'

" Dark powered asynchronous completion framework for neovim
" https://github.com/Shougo/deoplete.nvim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" Highlight whitespace
" https://github.com/ntpeters/vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'

" Git
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" https:/github.com/airblade/vim-gitgutter
 Plug 'airblade/vim-gitgutter'

" https://github.com/mileszs/ack.vim
" Plug 'mileszs/ack.vim'

" Surrounding parentheses, brackes, ...
" "HelloWorld" -> cs"' -> 'Hello World'
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

" Multiple cursors like in Sublime
" https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" https://github.com/vim-syntastic/syntastic
Plug 'vim-syntastic/syntastic'

" https://github.com/godlygeek/tabular
" Line up text with `:Tab`, example: `Tab /:`
Plug 'godlygeek/tabular'

"https://github.com/plasticboy/vim-markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" https://github.com/elzr/vim-json
Plug 'elzr/vim-json', { 'for': 'json' }

" https://github.com/stephphy/vim-yaml
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }

" TypeScript
" https://github.com/leafgarland/typescript-vim
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" https://github.com/Quramy/tsuquyomi
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

" https://github.com/jparise/vim-graphql
Plug 'jparise/vim-graphql', { 'for': 'graphql' }

" https://github.com/rust-lang/rust.vim
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" https://github.com/fatih/vim-go
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }

" Initialize plugin system
call plug#end()

" Configuration for vim
" =====================================

" True colors
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if (has("termguicolors"))
    set termguicolors
   endif
endif

set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode."

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set hidden

set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case chara

set ruler                       " Show the cursor position all the time"

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
set re=1

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

set autoindent
set complete-=i
set showmatch
set smarttab

set et
set tabstop=4
set shiftwidth=4
set expandtab

set nrformats-=octal
set shiftround

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

if &history < 1000
  set history=50
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

if !&scrolloff
  set scrolloff=1
endif

if !&sidescrolloff
  set sidescrolloff=5
endif

set display+=lastline

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" If linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif

" Theming
syntax on
set background=dark
colorscheme onedark

" Identation
set nowrap
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Center the screen
nnoremap <space> zz

" dont save .netrwhist history
let g:netrw_dirhistmax=0

" Configuration for plugins
" =====================================

" One dark
" =====================================
let g:onedark_termcolors=256

" Airline
" =====================================
let g:airline_theme = "onedark"
let g:airline_powerline_fonts=1

" NerdTree
" =====================================
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_STORE']

" Close nerdtre and vim on close file
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Completion
" =====================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']

" partial fuzzy matches
call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#source('_', 'converters', ['converter_remove_paren'])
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" vim-better-whitespace
" =====================================

"auto strip whitespace except for files that are blacklisted
let blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | StripWhitespace

" vim-multiple-cursors
" =====================================
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-i>'
let g:multi_cursor_prev_key='<C-y>'
let g:multi_cursor_skip_key='<C-b>'
let g:multi_cursor_quit_key='<Esc>'

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" auto strip whitespace except for file with extention blacklisted
let blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | StripWhitespace

" vim-markdown
" =====================================

" disable folding
 let g:vim_markdown_folding_disabled = 1

" Allow for the TOC window to auto-fit when it's possible for it to shrink.
" It never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1

" Disable conceal
let g:vim_markdown_conceal = 0

" Allow the ge command to follow named anchors in links of the form
" file#anchor or just #anchor, where file may omit the .md extension as usual
let g:vim_markdown_follow_anchor = 1

" " highlight frontmatter
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1


" vim-syntastic
" =====================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wg = 0

let g:syntastic_typescript_checkers = ['tsuquyomi', 'eslint']
let g:syntastic_typescript_exlint_exe = 'npm run lint --'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:tsuquyomi_disable_quickfix = 1

