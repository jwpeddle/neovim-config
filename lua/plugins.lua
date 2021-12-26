local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

require("packer").startup(function(use)
  use({
    --bufferline
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

  use({
    "dracula/vim",
    as = "dracula",
  })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  })

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
          name = "+prefix",
          o = { "<Cmd>lua require('telescope.builtin').find_files()<CR>", "Open file" },
          w = { "<Cmd>bwipeout<CR>", "Close buffer" },
          W = { "<Cmd>%bwipeout<CR>", "Close all buffers" },
          q = { "<Cmd>quit<cr>", "Quit" },
          t = { "<C-Space>", "Open terminal" },

        },
        --code
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
        --search
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
        --neovim
        ["<Leader><Leader>"] = {
          name = "+prefix",
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

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    config = {
      require("telescope").setup{
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
    }
  })

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

  use({
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_title = ""
    end
  })

  use("wbthomason/packer.nvim")
end)
