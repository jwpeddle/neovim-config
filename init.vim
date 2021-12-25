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
  Plug 'akinsho/bufferline.nvim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'folke/which-key.nvim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'

"******************** options ********************

lua <<EOF
local opt = require("vim.opt")
local cmd = require("vim.cmd")

--theme
vim.opt.termguicolors = true
vim.cmd("colorscheme dracula")

--line numbering
vim.opt.number = true

--don't wrap lines
vim.opt.wrap = false

--make autocomplete only use what I've typed
vim.opt.wildmode = {"longest:full", "full"}

--disable backups & swap
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

--indenting
--enter spaces when tab is pressed:
vim.opt.expandtab = true
--use 2 spaces to represent a tab
vim.opt.softtabstop = 2
--number of spaces to use for auto indent
vim.opt.shiftwidth = 2
--round shifted text to multiple of shiftwidth
vim.opt.shiftround = true

--case insensitive search (unless caps provided)
vim.opt.ignorecase = true
vim.opt.smartcase = true

--briefly jump to matching brace on closing
vim.opt.showmatch = true

--autohide buffers
set hidden

"use system clipboard
set clipboard^=unnamedplus

"disable folding
set nofoldenable

"open splits on right side
set splitright

"don't continue comments when using o
autocmd FileType * set formatoptions-=o
EOF

"******************** mappings ********************
"\ too hard to press
let mapleader = " " 

"******************** plugins ********************

"bufferline
lua <<EOF
require("bufferline").setup({
  options = {
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
  }
})
EOF


"fzf
lua <<EOF
vim.g.fzf_command_prefix = "Fzf"
EOF

"treesitter
lua <<EOF
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
})
EOF

"which-key
lua << EOF
local wk = require("which-key")
wk.setup()

wk.register({
  ["<leader>"] = {
    name = "+prefix",
    o = { "<cmd>FzfFiles<cr>", "Open file" },
    b = { "<cmd>FzfBuffers<cr>", "Open buffer" },
    w = { "<cmd>bwipeout<cr>", "Close buffer" },
    W = { "<cmd>%bwipeout<cr>", "Close all buffers" },
    q = { "<cmd>quit<cr>", "Quit" },
  },
  ["<leader><leader>"] = {
    name = "+prefix",
    e = { "<cmd>edit $MYVIMRC<cr>", "Edit config" },
    r = { "<cmd>source $MYVIMRC<cr>", "Reload config" },
    h = { "<cmd>checkhealth<cr>", "Check health" },
  },
  ["<left>"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous buffer" },
  ["<right>"] = {"<cmd>BufferLineCycleNext<cr>", "Next buffer" },
})
EOF
