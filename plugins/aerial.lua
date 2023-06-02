return {
  {
    "stevearc/aerial.nvim",
    opts = {
      autojump = true,
      close_on_select = true,
      post_jump_cmd = "normal! zt",
      layout = {
        default_direction = "prefer_left",
      },
      on_attach = function(bufnr)
        require("aerial.actions").tree_close_all.callback()
      end
    }
  }
}
