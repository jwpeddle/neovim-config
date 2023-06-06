--package manager (lsp, linters, etc)
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  }
}
