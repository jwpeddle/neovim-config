" load plugins
call plug#begin()
  Plug 'dracula/vim'
  Plug 'neoclide/coc.nvim'
  Plug 'justinmk/vim-dirvish'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()

"theme
set termguicolors
colorscheme dracula

"******************** options ********************
"line numbering
set number

"don't wrap lines
set nowrap

"extra room in cmd section
set cmdheight=2

"disable backups & swap
set nobackup
set nowritebackup
set noswapfile

"indenting
"enter spaces when tab is pressed:
set expandtab
"use 2 spaces to represent a tab
set softtabstop=2
"number of spaces to use for auto indent
set shiftwidth=2
"round shifted text to multiple of shiftwidth
set shiftround

"case insensitive search (unless caps provided)
set ignorecase
set smartcase

"briefly jump to matching brace on closing
set showmatch

"autohide buffers
set hidden

"use system clipboard
set clipboard^=unnamedplus

"disable folding
set nofoldenable

"don't continue comments automatically
set formatoptions-=cro

"******************** mappings ********************
"\ too hard to press
let mapleader=','

"use arrows to change buffer
map <Left> :tabp<cr>
map <Right> :tabn<cr>

"easier window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"forget to sudo?
cmap w!! w !sudo tee % >/dev/null

"******************** plugins ********************

"coc
set shortmess+=c
set signcolumn=yes

"fzf
nnoremap <Leader>f :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'fd --type file --follow --hidden --exclude .git'
