return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              ruff = { enabled = true, },
            }
          }
        }
      })
    end
  }
}
