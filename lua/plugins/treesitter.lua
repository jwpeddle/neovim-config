return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
      },
    }
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  }
}
