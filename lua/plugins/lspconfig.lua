return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").ruff_lsp.setup({
        init_options = {
          settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
          }
        }
      })
    end
  }
}
