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

  --cmp
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        completion = {
          autocomplete = false,
          completeopt = "menu,menuone,preview,noinsert",
        },

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),

        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      })

      cmp.setup.cmdline("/", {
        sources = {
          { name = "buffer" }
        }
      })

      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })

      local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
      require("lspconfig")["pylsp"].setup {
        capabilities = capabilities,
      }
    end
  })

  --comment
  use({
    "numToStr/Comment.nvim",
    config = function()
        require('Comment').setup()
    end
  })

  --dracula - theme
  use({
    "dracula/vim",
    as = "dracula",
  })

  --floaterm - floating terminal
  use({
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_title = ""
    end
  })

  --lspconfig - lsp
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              flake8 = { enabled = true },
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
            }
          }
        }
      })
    end
  })

  --nvim-tree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()
    end
  })

  --sandwich
  use("machakann/vim-sandwich")

  --targets
  use("wellle/targets.vim")
  
  --telescope - fuzzy finding
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
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
      require("telescope").load_extension("file_browser")
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

  --treesitter-textobjects
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require("nvim-treesitter.configs").setup({})
    end
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
          n = { "<Cmd>NvimTreeToggle<CR>", "Explore" },
          w = { "<Cmd>bwipeout<CR>", "Close buffer" },
          W = { "<Cmd>%bwipeout<CR>", "Close all buffers" },
          q = { "<Cmd>quit<cr>", "Quit" },
          t = { "<C-Space>", "Open terminal" },
        },
        --lists
        ["<Leader>d"] = {
          name = "+Diagnostics",
          d = { "<Cmd>TroubleToggle<cr>", "Toggle Trouble" },
          w = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace" },
          b = { "<Cmd>TroubleToggle document_diagnostics<CR>", "Buffer" },
          q = { "<Cmd>TroubleToggle quickfix<CR>", "Quickfix" },
          l = { "<Cmd>TroubleToggle loclist<CR>", "Location list" },
        },
        --find
        ["<Leader>f"] = {
          name = "+Telescope",
          f = { "<Cmd>lua require('telescope.builtin').find_files()<CR>", "Files" },
          b = { "<Cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
          c = { "<Cmd>lua require('telescope.builtin').commands()<CR>", "Commands" },
          h = { "<Cmd>lua require('telescope.builtin').help_tags()<CR>", "Help" },
          g = { "<Cmd>lua require('telescope.builtin').live_grep()<CR>", "Search workspace" },
          e = { "<Cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>", "Explore" },
          -- r = { "<Cmd>lua require('telescope.builtin').lsp_references()<CR>", "References" },
          -- s = { "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document symbols" },
          -- S = { "<Cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", "Workspace symbols" },
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

  --packer - plugin management
  use("wbthomason/packer.nvim")
end)
