"load plugins
call plug#begin('~/.nvim/plugged')
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'preservim/nerdtree'
call plug#end()

source ~/.config/nvim/common.vim

set nonumber

autocmd InsertEnter * echo foo
autocmd InsertEnter * set laststatus=1

:startinsert
