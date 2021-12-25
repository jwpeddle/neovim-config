local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
local g = vim.g

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

require("packer").startup(function(use)
  use({ "akinsho/bufferline.nvim" })
  use({ "dracula/vim", as = "dracula" })
  use({ "folke/which-key.nvim" })
  use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
  use({ "junegunn/fzf.vim" })
  use({ "nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"} })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "voldikss/vim-floaterm" })
  use({ "wbthomason/packer.nvim" })
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

--floaterm
g.floaterm_title = ""

--fzf
g.fzf_command_prefix = "Fzf"

--telescope
require('telescope').setup{
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      height = 0.5,
      prompt_position = "top",
    },
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close,
      },
    },
  },
}

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
    o = { "<Cmd>lua require('telescope.builtin').find_files()<CR>", "Open file" },
    w = { "<Cmd>bwipeout<CR>", "Close buffer" },
    W = { "<Cmd>%bwipeout<CR>", "Close all buffers" },
    q = { "<Cmd>quit<cr>", "Quit" },
    t = { "<C-Space>", "Open terminal" },

  },
  ["<Leader>f"] = {
    name = "+telescope",
      f = { "<Cmd>lua require('telescope.builtin').find_files()<CR>", "Files" },
      b = { "<Cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
      c = { "<Cmd>lua require('telescope.builtin').commands()<CR>", "Commands" },
      h = { "<Cmd>lua require('telescope.builtin').help_tags()<CR>", "Help" },
      g = { "<Cmd>lua require('telescope.builtin').live_grep()<CR>", "Search" },
  },
  ["<Leader><Leader>"] = {
    name = "+prefix",
    e = { "<Cmd>edit $MYVIMRC<CR>", "Edit config" },
    r = { "<Cmd>source $MYVIMRC<CR>", "Reload config" },
    p = { "<Cmd>PackerSync<CR>", "Sync packages" },
    h = { "<Cmd>checkhealth<CR>", "Check health" },
  },
  ["<Left>"] = { "<Cmd>BufferLineCyclePrev<CR>", "Previous buffer" },
  ["<Right>"] = { "<Cmd>BufferLineCycleNext<CR>", "Next buffer" },
  ["<C-Space>"] = { "<Cmd>FloatermToggle<CR>", "Open terminal" },
})

wk.register({
  ["<C-Space>"] = { "<Cmd>FloatermToggle<CR>", "Close terminal" },
}, {
  mode = "t",
})
