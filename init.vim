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
  Plug 'machakann/vim-sandwich'
  Plug 'neoclide/coc.nvim'
  Plug 'preservim/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-fugitive'
call plug#end()

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
map <Leader><C-v><F5> :source ~/.config/nvim/init.vim<CR>

"clear search
nmap <silent> <C-L> :nohlsearch<CR>

"******************** plugins ********************

"buftabline
let g:buftabline_numbers = 2
nmap <a-1> <Plug>BufTabLine.Go(1)
nmap <a-2> <Plug>BufTabLine.Go(2)
nmap <a-3> <Plug>BufTabLine.Go(3)
nmap <a-4> <Plug>BufTabLine.Go(4)
nmap <a-5> <Plug>BufTabLine.Go(5)
nmap <a-6> <Plug>BufTabLine.Go(6)
nmap <a-7> <Plug>BufTabLine.Go(7)
nmap <a-8> <Plug>BufTabLine.Go(8)
nmap <a-9> <Plug>BufTabLine.Go(9)
nmap <a-0> <Plug>BufTabLine.Go(10)

"coc
set shortmess+=c
set signcolumn=yes
set updatetime=300
source ~/.config/nvim/coc.vim

"fzf
let g:fzf_command_prefix = 'Fzf'
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []
nnoremap <Leader>o :FzfFiles<CR>
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

"vimtex
let g:vimtex_view_method = 'zathura'
