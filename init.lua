local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
local g = vim.g

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
print(install_path)
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

require("packer").startup(function(use)
  use({"wbthomason/packer.nvim"})
  use({"akinsho/bufferline.nvim"})
  use({"dracula/vim", as = "dracula"})
  use({"folke/which-key.nvim"})
  use({"junegunn/fzf", dir = "~/.fzf", run = "./install --all"})
  use({"junegunn/fzf.vim"})
  use({"nvim-treesitter/nvim-treesitter", run = ':TSUpdate'})
end)

g.python_host_prog = "$HOME/.pyenv/versions/neovim2/bin/python"
g.python3_host_prog = "$HOME/.pyenv/versions/neovim3/bin/python"

--******************** options ********************

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
cmd("autocmd FileType * set formatoptions-=o")

--******************** mappings ********************
--\ too hard to press
g.mapleader = " " 

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
g.fzf_command_prefix = "Fzf"

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
