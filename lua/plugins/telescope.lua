--fuzzy find anything
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "debugloop/telescope-undo.nvim",
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
        mappings = {
          i = {
            ["<C-h>"] = "which_key"
          },
          n = {
          }
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
    end,
  }
}
