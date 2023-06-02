return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      settings = {
        pylsp = {
          configurationSources = { "flake8" },
          plugins = {
            autopep8 = { enabled = false },
            flake8 = { enabled = false },
            pydocstyle = { enabled = false },
            pycodestyle = { enabled = false },
            pyflakes = { enabled = false },
            pylint = { enabled = false },
            pylsp_mypy = { enabled = false, dmypy = true },
            rope_completion = { enabled = false },
            rope_rename = { enabled = false },
            yapf = { enabled = false },
            ruff = { enabled = true, },
          }
        }
      }
    }
  }
}
