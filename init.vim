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

lua <<EOF
--load plugins
vim.call("plug#begin", "~/.nvim/plugged")
  Plug("akinsho/bufferline.nvim")
  Plug("dracula/vim", {as = "dracula"})
  Plug("folke/which-key.nvim")
  Plug("junegunn/fzf", {dir = "~/.fzf", ["do"] = "./install --all" })
  Plug("junegunn/fzf.vim")
  Plug("nvim-treesitter/nvim-treesitter", ["do"] = ":TSUpdate"})
vim.call("plug#end")

let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'

"******************** options ********************

local opt = require("vim.opt")
local cmd = require("vim.cmd")

--theme
opt.termguicolors = true
cmd("colorscheme dracula")

--line numbering
opt.number = true

--don't wrap lines
opt.wrap = false

--make autocomplete only use what I've typed
opt.wildmode = {"longest:full", "full"}

--disable backups & swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false

--indenting
--enter spaces when tab is pressed:
opt.expandtab = true
--use 2 spaces to represent a tab
opt.softtabstop = 2
--number of spaces to use for auto indent
opt.shiftwidth = 2
--round shifted text to multiple of shiftwidth
opt.shiftround = true

--case insensitive search (unless caps provided)
opt.ignorecase = true
opt.smartcase = true

--briefly jump to matching brace on closing
opt.showmatch = true

--autohide buffers
opt.hidden = true

--use system clipboard
opt.clipboard:prepend("unnamedplus")

--disable folding
opt.foldenable = false

--open splits on right side
opt.splitright = true

--don't continue comments when using o
autocmd FileType * set formatoptions-=o

--******************** mappings ********************
--\ too hard to press
vim.g.mapleader = " " 

--******************** plugins ********************

--bufferline
require("bufferline").setup({
  options = {
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
  }
})

--fzf
vim.g.fzf_command_prefix = "Fzf"

--treesitter
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
})

--which-key
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
