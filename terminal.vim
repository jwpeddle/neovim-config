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

