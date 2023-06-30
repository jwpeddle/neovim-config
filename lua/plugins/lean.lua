--lean lsp
return {
  {
    "Julian/lean.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      abbreviations = { builtin = true},
      --lsp = { on_attach = on_attach},
      mappings = true,
    }
  }
}
