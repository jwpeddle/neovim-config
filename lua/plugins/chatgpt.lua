--ai
return {
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    event = "VeryLazy"
    opts = {
      api_key_cmd = "~/openai",
    },
  }
}
