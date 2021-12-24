"install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"autoinstall missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

"load plugins
call plug#begin('~/.nvim/plugged')
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'folke/which-key.nvim'
  Plug 'romgrk/barbar.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
let mapleader = " " 

"******************** plugins ********************

"barbar
-- Set barbar's options
vim.g.bufferline = {
  animation = false,
  closable = false,
  icons = false,
}

"treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

"which-key
lua << EOF
local wk = require("which-key")
wk.setup()

wk.register({
  ["<leader><leader>"] = {
    name = "+prefix",
    e = { "<cmd>edit $MYVIMRC<cr>", "Edit config" },
    r = { "<cmd>source $MYVIMRC<cr>", "Reload config" },
    h = { "<cmd>checkhealth<cr>", "Check health" },
  },
  ["<left>"] = { "<cmd>BufferPrevious<cr>", "Previous buffer" },
  ["<right>"] = {"<cmd>BufferNext<cr>", "Next buffer" },
})
EOF
