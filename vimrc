"vi mode sucks
set nocompatible

"pathogen (plugin management)
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
let g:pathogen_disabled = []
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
set wildignore=.git,*.pyc,*.jpg,*.jpeg,*.png,*.bmp,*.doc,*.xls,*.txt,*.swf,*.pdf,*.psd,*.ai,*.mov,*.gz,*.jfif,*.tiff,*.docx,*.xml,*.wmv,*.otf,*.ttf,*.min.js
set wildignore+=migrations,tiny_mce

"set filetype on
filetype on
filetype indent on
filetype plugin on

"theme/font
set background=dark
colorscheme jellybeans
set gfn=Monaco\ 11

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
map <Left> :bp<cr>
map <Right> :bn<cr>

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
set clipboard^=unnamed

"always reload changed file
set autoread

"********** plugins **********

"csapprox
set t_Co=256 " makes csapprox work properly in gnome's terminal

"nerdtree
map <Leader>n :NERDTreeToggle<cr>

"command-t
let g:CommandTMatchWindowAtTop=1

map <Leader>s :TagbarToggle<CR>

"ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsSnippetDirectories=['snippets']

"coffeescript
let g:coffee_make_options=''
map <Leader>r :CoffeeRun<CR>
map <Leader>m :CoffeeMake<CR>
