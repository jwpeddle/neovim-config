return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").ruff_lsp.setup({})
    end
  }
}
