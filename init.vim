"install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" load plugins
call plug#begin('~/.nvim/plugged')
  Plug 'antoinemadec/coc-fzf'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'lervag/vimtex'
  Plug 'neoclide/coc.nvim'
  Plug 'preservim/nerdtree'
  Plug 'puremourning/vimspector'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
call plug#end()

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

"don't continue comments automatically
set formatoptions-=r formatoptions-=c formatoptions-=o

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
set updatetime=300
source ~/.config/nvim/coc.vim

"fzf
let $FZF_DEFAULT_COMMAND = 'fd --type file --follow --hidden --exclude .git'
let g:fzf_command_prefix = 'Fzf'
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []
nnoremap <Leader>fo :FzfFiles<CR>
nnoremap <Leader>f/ :FzfRg<CR>
nnoremap <Leader>ff :FzfBLines<CR>
nnoremap <Leader>fh :FzfHistory/<CR>
nnoremap <Leader>fc :FzfCommands<CR>

"lightline
set noshowmode
let g:lightline = {
  \   'colorscheme': 'dracula',
  \   'active': {
  \     'left': [
  \       ['mode'],
  \       ['readonly', 'modified', 'relativepath'],
  \     ],
  \     'right': [
  \       ['filetype'],
  \       ['gitbranch'],
  \       [],
  \     ],
  \   },
  \   'component_function': {
  \     'gitbranch': 'FugitiveHead'
  \   },
  \ }

"nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>

"vimspector
let g:vimspector_enable_mappings = 'HUMAN'
