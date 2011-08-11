"pathogen (plugin management)
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

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
set tabstop=4
set softtabstop=4

"number of space to use for auto indent
set shiftwidth=4

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

"ignore files (ie, for command-t)
set wildignore=.git,migrations,tiny_mce,*.pyc,*.jpg,*.jpeg,*.png,*.bmp,*.doc,*.xls,*.txt,*.swf,*.pdf,*.psd,*.ai,*.mov,*.gz,*.jfif,*.tiff,*.docx,*.xml,*.wmv,*.otf,*.ttf,*.min.js

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

"\ is impossible to press
let mapleader=','

"longer history
set history=9999

"autohide buffers
set hidden

"arrow buffer changing
map <Left> :bp<cr>
map <Right> :bn<cr>

"********** plugins **********

"csapprox
set t_Co=256 " makes csapprox work properly in gnome's terminal

"nerdtree
let NERDTreeIgnore=['\.vim$', '\.pyc$', 'manage.py']
noremap <Leader>n :NERDTreeToggle<cr>
