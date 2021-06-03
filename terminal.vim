" load plugins
"call plug#begin('~/.nvim/plugged')
"  Plug 'dracula/vim', { 'as': 'dracula' }
"  Plug 'preservim/nerdtree'
"call plug#end()

"source ~/.config/nvim/common.vim

:startinsert
let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'

"******************** options ********************
"line numbering
set number

"don't wrap lines
set nowrap

"make autocomplete only use what I've typed
set wildmode=longest:full,full

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
