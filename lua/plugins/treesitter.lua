return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = :TSUpdate,
    opts = {
      highlight = {
        enable = true,
      },
    }
  }
}
