call plug#begin('~/.local/share/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'kien/ctrlp.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme', {'do': './install.py'}
call plug#end()

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

"use 2 spaces to represent a tab
set softtabstop=2

"number of spaces to use for auto indent
set shiftwidth=2

"make backspace key intelligently delete indents
set backspace=indent,eol,start

"highlight search
set hls

"shows the search match while typing
set incsearch

"case insensitive search (unless caps provided)
set ignorecase
set smartcase

"show autocomplete options in status bar
set wildmenu
set wildmode=list:longest,full

"ignore files
set wildignore=
    \*.ai,
    \*.bmp,
    \*.doc,
    \*.docx,
    \*.gz,
    \*.jfif,
    \*.jpeg,
    \*.jpg,
    \*.log,
    \*.min.js,
    \*.mov,
    \*.otf,
    \*.pdf,
    \*.png,
    \*.psd,
    \*.pyc,
    \*.sassc,
    \*.swf,
    \*.tar,
    \*.tiff,
    \*.ttf,
    \*.wmv,
    \*.xls,
    \*.xml,
    \*.zip,
    \.git,
    \.sass-cache,
    \__pycache__,
    \CACHE,
    \node_modules,
    \media,
    \tiny_mce
    
"briefly jump to matching brace on closing
set showmatch

"round shifted text to multiple of shiftwidth
set shiftround

"set filetype on
filetype on
filetype indent on
filetype plugin on

"indent python parens with one tab (vs default two?)
let g:pyindent_open_paren=4

"theme
set background=dark
set termguicolors
colorscheme base16-seti

"hilight current line
set cursorline
hi CursorLine ctermbg=233

"\ is impossible to press
let mapleader=','

"easier escape
imap jj <Esc>

"longer history
set history=9999

"autohide buffers
set hidden

"arrow buffer changing
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
"set t_Co=256 " makes csapprox work properly in gnome's terminal

"nerdtree
map <Leader>n :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$']

"ctrlp
map <Leader>p :CtrlP<cr>
map <Leader>b :CtrlPBuffer<cr>
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>', '<MiddleMouse>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_follow_symlinks = 1

"syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501'
" highlight the 80th column instead of E501
"let &colorcolumn=join(range(81,999),",")

"indentguides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
