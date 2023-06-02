return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").pylsp.setup({
        settings = {
          pylsp = {
            configurationSources = { "pyproject.toml" },
            plugins = {
              ruff = { enabled = true, },
            }
          }
        }
      })
    end
  }
}
