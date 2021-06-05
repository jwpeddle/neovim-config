"load plugins
call plug#begin('~/.nvim/plugged')
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'preservim/nerdtree'
call plug#end()

source ~/.config/nvim/common.vim

set nonumber
set noshowmode  
set noshowcmd  
set noruler  
set cmdheight=1
set laststatus=1

"quit when a terminal closes instead of showing exit code and waiting
autocmd TermClose * bd!|q

"get into normal mode from a terminal
tnoremap <Leader><Esc> <C-\><C-n>

"enter and leave terminal mode (insert mode) when switching between buffers
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
