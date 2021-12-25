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

