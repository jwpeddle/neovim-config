--fuzzy find anything
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "debugloop/telescope-undo.nvim",
      "folke/trouble.nvim",
      "gbprod/yanky.nvim",
      "kkharji/sqlite.lua",
      "kyazdani42/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          height = 0.5,
          prompt_position = "top",
        },
      },
      extensions = {
        undo = {
          side_by_side = true,
          layout_config = {
            preview_height = 0.8,
          },
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("file_browser")
      telescope.load_extension("yank_history")
      telescope.load_extension("undo")

      local actions = require("telescope.actions")
      local trouble = require("trouble.sources.telescope")

      telescope.setup {
        defaults = {
          mappings = {
            i = {
              ["<c-t>"] = trouble.open(),
              ["<C-h>"] = "which_key",
            },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
      }
    end,
  }
}
