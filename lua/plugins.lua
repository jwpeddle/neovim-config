--auto-install packer
local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

--recompile packages when changing this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require("packer").startup(function(use)
  use({
    --bufferline - tabs
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          show_buffer_icons = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
        }
      })
    end
  })

  --dracula - theme
  use({
    "dracula/vim",
    as = "dracula",
  })

  --trouble - diagnostics
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  })

  --which-key - shortcut suggestions
  use({
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")
      wk.setup()
      vim.opt.timeoutlen = 500

      --normal mode
      wk.register({
        --common
        ["<Leader>"] = {
          name = "+Prefix",
          o = { "<Cmd>lua require('telescope.builtin').find_files()<CR>", "Open file" },
          w = { "<Cmd>bwipeout<CR>", "Close buffer" },
          W = { "<Cmd>%bwipeout<CR>", "Close all buffers" },
          q = { "<Cmd>quit<cr>", "Quit" },
          t = { "<C-Space>", "Open terminal" },
        },
        --lists
        ["<Leader>l"] = {
          name = "+Diagnostics",
          c = { "<Cmd>TroubleToggle<cr>", "Toggle Trouble" },
          w = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace" },
          b = { "<Cmd>TroubleToggle document_diagnostics<CR>", "Buffer" },
          q = { "<Cmd>TroubleToggle quickfix<CR>", "Quickfix" },
          l = { "<Cmd>TroubleToggle loclist<CR>", "Location list" },
          r = { "<Cmd>TroubleToggle lsp_references<CR>", "References" },
          d = { "<Cmd>TroubleToggle lsp_definitions<CR>", "Definitions" },
        },
        --find
        ["<Leader>f"] = {
          name = "+Telescope",
          f = { "<Cmd>lua require('telescope.builtin').find_files()<CR>", "Files" },
          b = { "<Cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
          c = { "<Cmd>lua require('telescope.builtin').commands()<CR>", "Commands" },
          h = { "<Cmd>lua require('telescope.builtin').help_tags()<CR>", "Help" },
          g = { "<Cmd>lua require('telescope.builtin').live_grep()<CR>", "Search workspace" },
          e = { "<Cmd>lua require('telescope.builtin').file_browser()<CR>", "Explore" },
          r = { "<Cmd>lua require('telescope.builtin').lsp_references()<CR>", "References" },
          s = { "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document symbols" },
          S = { "<Cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", "Workspace symbols" },
          ["/"] = { "<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Search buffer" },
          ["?"] = { "<Cmd>lua require('telescope.builtin').builtin()<CR>", "Pickers" },
        },
        --neovim
        ["<Leader><Leader>"] = {
          name = "+Neovim",
          e = { "<Cmd>edit $MYVIMRC<CR>", "Edit config" },
          r = { "<Cmd>source $MYVIMRC<CR>", "Reload config" },
          p = { "<Cmd>PackerSync<CR>", "Sync packages" },
          h = { "<Cmd>checkhealth<CR>", "Check health" },
        },
        --unleadered
        ["<Left>"] = { "<Cmd>BufferLineCyclePrev<CR>", "Previous buffer" },
        ["<Right>"] = { "<Cmd>BufferLineCycleNext<CR>", "Next buffer" },
        ["<C-Space>"] = { "<Cmd>FloatermToggle<CR>", "Open terminal" },
      })

      --terminal mode
      wk.register({
        ["<C-Space>"] = { "<Cmd>FloatermToggle<CR>", "Close terminal" },
      }, {
        mode = "t",
      })
    end
  })

  --nvim-lspconfig - lsp
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").pyright.setup({
        settings = {
          pyright = {
          }
        }
      })
    end
  })

  --telescope - fuzzy finding
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_config = {
            height = 0.5,
            prompt_position = "top",
          },
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
              ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
            },
            n = {
              ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
            }
          },
        },
      })
    end
  })

  --treesitter - AST highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
      })
    end
  })

  --floaterm - floating terminal
  use({
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_title = ""
    end
  })

  --packer - plugin management
  use("wbthomason/packer.nvim")
end)
