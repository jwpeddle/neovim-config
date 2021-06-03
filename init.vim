"install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" load plugins
call plug#begin('~/.nvim/plugged')
  Plug 'antoinemadec/coc-fzf'
  Plug 'ap/vim-buftabline'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'idbrii/vim-endoscope'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'lervag/vimtex'
  Plug 'liuchengxu/vista.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'neoclide/coc.nvim'
  Plug 'preservim/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'svermeulen/vim-yoink'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'voldikss/vim-floaterm'
call plug#end()

source ~/.config/nvim/common.vim
