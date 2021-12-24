"install vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"load plugins
call plug#begin('~/.nvim/plugged')
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'folke/which-key.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
call plug#end()

let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'

"******************** options ********************

"theme
set termguicolors
colorscheme dracula

"line numbering
set number

"don't wrap lines
set nowrap

"make autocomplete only use what I've typed
set wildmode=longest:full,full

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
nnoremap <SPACE> <Nop>
let mapleader=' '

"reload vimrc
nnoremap <silent> <Leader><Leader> :source $MYVIMRC<cr>

"******************** plugins ********************

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
