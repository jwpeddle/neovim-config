return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              autopep8 = { enabled = false },
              flake8 = { enabled = false },
              pydocstyle = { enabled = false },
              pycodestyle = { enabled = false },
              pyflakes = { enabled = false },
              pylint = { enabled = false },
              rope_completion = { enabled = false },
              rope_rename = { enabled = false },
              yapf = { enabled = false },
              ruff = { enabled = true, },
            }
          }
        }
      })
    end
  }
}
