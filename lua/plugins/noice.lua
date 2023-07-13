--ui overhaul
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
}

    event = 
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
