return {
  {
    "nvim-telescope/telescope.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "kkharji/sqlite.lua",
        "gbprod/yanky.nvim",
        "debugloop/telescope-undo.nvim",
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
            extensions = {
            undo = {
            side_by_side = true,
            layout_config = {
              preview_height = 0.8,
            },
            },
            },
        })

    require("telescope").load_extension("file_browser")

      require("yanky").setup()
      require("telescope").load_extension("yank_history")
      require("telescope").load_extension("undo")

      end
  }
}
