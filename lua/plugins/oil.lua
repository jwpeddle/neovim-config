return {
  {
    "stevearc/oil.nvim",
    opts = {
      keymaps = {
        ["<Esc>"] = "actions.close",
      },
      float = {
        padding = 5,
        win_options = {
          winblend = 0,
        },
      },
    }
  }
}
