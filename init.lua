local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
local g = vim.g

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "akinsho/bufferline.nvim" })
  use({ "dracula/vim", as = "dracula" })
  use({ "folke/which-key.nvim" })
  use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
  use({ "junegunn/fzf.vim" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ 'voldikss/vim-floaterm' })
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
opt.wildmode = { "longest:full", "full" }

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
opt.timeoutlen = 500

wk.register({
  ["<Leader>"] = {
    name = "+prefix",
    o = { "<Cmd>FzfFiles<CR>", "Open file" },
    w = { "<Cmd>bwipeout<CR>", "Close buffer" },
    W = { "<Cmd>%bwipeout<CR>", "Close all buffers" },
    q = { "<Cmd>quit<cr>", "Quit" },
    t = { "<Cmd>FloatermToggle<CR>", "Terminal" },
--nnoremap <silent> <C-Space> :FloatermToggle<CR>
--tnoremap <silent> <C-Space> <C-\><C-N>:FloatermToggle<CR>
--"tnoremap <silent> <C-d> <C-\><C-N>:FloatermToggle<CR>
--tnoremap <silent> <Leader><Esc> <C-\><C-N>

  },
  ["<Leader>f"] = {
    name = "+fzf",
    b = { "<Cmd>FzfBuffers<CR>", "Buffers" },
    c = { "<Cmd>FzfCommands<CR>", "Commands" },
    h = { "<Cmd>FzfHistory<CR>", "History" },
  },
  ["<Leader><Leader>"] = {
    name = "+prefix",
    e = { "<Cmd>edit $MYVIMRC<CR>", "Edit config" },
    r = { "<Cmd>source $MYVIMRC<CR>", "Reload config" },
    h = { "<Cmd>checkhealth<CR>", "Check health" },
  },
  ["<Left>"] = { "<Cmd>BufferLineCyclePrev<CR>", "Previous buffer" },
  ["<Right>"] = { "<Cmd>BufferLineCycleNext<CR>", "Next buffer" },
})

wk.register({
  ["<c-space>"] = {"<C-\><C-N><cmd>FloatermToggle<CR>" },
}, {
  mode: "t",
})
