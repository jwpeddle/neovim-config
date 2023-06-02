return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").pylsp.setup({
        settings = {
          pylsp = {
            configurationSources = { "flake8" },
            plugins = {
              ruff = { enabled = true, },
            }
          }
        }
      })
    end
  }
}
