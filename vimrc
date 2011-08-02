"pathogen (plugin management)
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"turn off gui
set guioptions=a

"no backups, I hate .swp files
set nobackup
set nowritebackup
set noswapfile

"syntax highlighting
syntax on

"line numbering
set number

"no word wrapping
set nowrap

"enter spaces when tab is pressed:
set expandtab

"use 4 spaces to represent a tab
set tabstop=8
set softtabstop=4

"number of space to use for auto indent
set shiftwidth=4

"tabs only for indenting
"set smarttab

"copy indent from current line when starting a new line.
set autoindent

autocmd FileType javascript setlocal sts=2 sw=2
autocmd FileType python setlocal sts=4 sw=4

"makes backspace key more powerful.
set backspace=indent,eol,start

"highlight search
set hls

"shows the search match while typing
set incsearch

"case insensitive search (unless caps provided)
set ignorecase
set smartcase

"don't need /g after :s or :g
set gdefault

"show autocomplete options in status bar
set wildmenu
set wildmode=list:longest,full

"set filetype on
filetype on
filetype indent on
filetype plugin on

"easier escape
imap jj <esc>

"theme/font
set background=dark
set gfn=Monaco\ 11
colorscheme jellybeans

"` is totally more useful (go to mark)
nnoremap ' `
nnoremap ` '

"\ is impossible to press
let mapleader=','

"longer history
set history=9999

"********** plugins **********

"csapprox
set runtimepath+=~/.vim/plugins/csapprox
set t_Co=256 " makes csapprox work properly in gnome's terminal

"nerdtree
set runtimepath+=~/.vim/plugins/nerdtree
"autoload nerdtree
"autocmd VimEnter * if argc() == 0 | NERDTreeToggle | endif
"autocmd VimEnter * if argc() == 0 | wincmd p | endif

let NERDTreeIgnore=['\.vim$', '\.pyc$', 'manage.py']
noremap <Leader>n :NERDTreeToggle<cr>

"nerdcommenter
set runtimepath+=~/.vim/plugins/nerdcommenter
