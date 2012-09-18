"vi mode sucks
set nocompatible

"pathogen (plugin management)
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
let g:pathogen_disabled = []
call pathogen#infect()
call pathogen#helptags()

"turn off gui
set guioptions=a

"enable mouse
set mouse=a

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
set softtabstop=2

"number of space to use for auto indent
set shiftwidth=2

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

"ignore files
set wildignore=.git,*.pyc,*.jpg,*.jpeg,*.png,*.bmp,*.doc,*.xls,*.swf,*.pdf,*.psd,*.ai,*.mov,*.gz,*.jfif,*.tiff,*.docx,*.xml,*.wmv,*.otf,*.ttf,*.min.js,*.sassc
set wildignore+=tiny_mce,media,.sass-cache

"set filetype on
filetype on
filetype indent on
filetype plugin on

"theme/font
set background=dark
colorscheme jellybeans
set gfn=Monaco\ 10

"hilight current line
set cursorline

"\ is impossible to press
let mapleader=','

"easier escape
imap jj <Esc>

"longer history
set history=9999

"autohide buffers
set hidden

"arrow buffer changing
"map <Left> :bp<cr>
"map <Right> :bn<cr>
map <Left> :tabp<cr>
map <Right> :tabn<cr>

"easier window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"custom status line
if has('statusline')
    set laststatus=2
    set statusline=%{fugitive#statusline()} "git repo
    set statusline+=\ %{getcwd()}/%f        "current dir/file
endif

"forget to sudo?
cmap w!! w !sudo tee % >/dev/null

"use system clipboard
set clipboard^=unnamedplus

"always reload changed file
set autoread

"********** plugins **********

"csapprox
set t_Co=256 " makes csapprox work properly in gnome's terminal

"nerdtree
map <Leader>n :NERDTreeToggle<cr>

"ctrlp
map <Leader>p :CtrlP<cr>
map <Leader>b :CtrlPBuffer<cr>
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>', '<MiddleMouse>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

"syntastic
let g:syntastic_python_checker = 'flake8'
let g:syntastic_python_checker_args = '--ignore=E124,E128,E501,E701,E702'
