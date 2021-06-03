" load plugins
"call plug#begin('~/.nvim/plugged')
"  Plug 'dracula/vim', { 'as': 'dracula' }
"  Plug 'preservim/nerdtree'
"call plug#end()

"source ~/.config/nvim/common.vim

:startinsert
let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'

"theme
set termguicolors
colorscheme dracula

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

"open splits on right side
set splitright

"don't continue comments when using o
autocmd FileType * set formatoptions-=o

"******************** mappings ********************
"\ too hard to press
let mapleader=';'

"use arrows to change buffer
map <Left> :bprevious<cr>
map <Right> :bnext<cr>

"easier window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"forget to sudo?
cmap w!! w !sudo tee % >/dev/null

"close buffers/vim, save
map <Leader>w :bd<CR>
map <Leader>W :bd!<CR>
map <Leader>q :q<CR>
map <Leader>Q :qall!<CR>
map <Leader>s :w<CR>
imap <Leader>s <Esc>:w<CR>

"paste last yank
map <Leader>p "0p

"reload init.nvim
map <Leader><F5> :source ~/.config/nvim/init.vim<CR>

"clear search
"TODO pick another shortcut
"nmap <silent> <C-L> :nohlsearch<CR>

"******************** plugins ********************

"nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
