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
  use({ "folke/trouble.nvim", requires = {
    "kyazdani42/nvim-web-devicons",
  }})
  use({ "folke/which-key.nvim" })
  use({ "neovim/nvim-lspconfig" })
  use({ "nvim-telescope/telescope.nvim", requires = {
    "kyazdani42/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  }})
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "voldikss/vim-floaterm" })
  use({ "wbthomason/packer.nvim" })
end)

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

--lspconfig
require'lspconfig'.pyright.setup{
  settings = {
    pyright = {
    }
  }
}

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

--trouble
require("trouble").setup({
  icons = false,
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
      g = { "<Cmd>lua require('telescope.builtin').live_grep()<CR>", "Search workspace" },
      e = { "<Cmd>lua require('telescope.builtin').file_browser()<CR>", "Explore" },
      ["/"] = { "<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Search buffer" },
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
