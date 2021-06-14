"install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" load plugins
call plug#begin('~/.nvim/plugged')
  Plug 'preservim/nerdtree'
call plug#end()

"use system clipboard
set clipboard^=unnamedplus

"\ too hard to press
let mapleader=';'
nmap , ;

"redo with U
noremap U <C-R>

"escape from jupyter
nmap <Esc><Esc> <Cmd>call VSCodeNotify('notebook.cell.quitEdit')<CR>

"nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>