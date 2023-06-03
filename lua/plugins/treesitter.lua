return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
      },
    }
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  }
}
