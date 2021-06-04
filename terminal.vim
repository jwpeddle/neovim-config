"load plugins
call plug#begin('~/.nvim/plugged')
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'preservim/nerdtree'
call plug#end()

source ~/.config/nvim/common.vim

set nonumber

noremap <C-d> :q<CR> " make vim behave a bit more like a terminal
autocmd TermClose * bd!|q " quit when a terminal closes instead of showing exit code and waiting
tnoremap <Esc> <C-\><C-n> " handy binding to get into normal mode from a terminal
" enter and leave terminal mode (insert mode) when switching between buffers
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

:startinsert
