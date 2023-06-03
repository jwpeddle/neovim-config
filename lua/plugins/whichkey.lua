return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.setup()

      --normal mode
      wk.register({
        --common
        ["<Leader>"] = {
          name = "+Prefix",
          o = { "<Cmd>lua require('telescope.builtin').find_files()<CR>", "Open file" },
          n = { "<Cmd>NvimTreeToggle<CR>", "Explore" },
          b = { "<Cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
          w = { "<Cmd>bwipeout<CR>", "Close buffer" },
          W = { "<Cmd>%bwipeout<CR>", "Close all buffers" },
          q = { "<Cmd>quit<cr>", "Quit" },
          s = { "<Cmd>AerialToggle<CR>", "Map" },
          y = { "<Cmd>lua require('telescope').extensions.yank_history.yank_history()<CR>", "Yank history" },
          u = { "<Cmd>lua require('telescope').extensions.undo.undo()<CR>", "Undos" },
          ["-"] = { "<Cmd>lua require('oil').open_float()<CR>", "Edit files" },
          ["<Tab>"] = { "<C-w>w", "Switch window" },
        },
        --diagnostics
        ["<Leader>d"] = {

          name = "+Diagnostics",
          d = { "<Cmd>TroubleToggle<cr>", "Toggle Trouble" },
          w = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace" },
          b = { "<Cmd>TroubleToggle document_diagnostics<CR>", "Buffer" },
          q = { "<Cmd>TroubleToggle quickfix<CR>", "Quickfix" },
          l = { "<Cmd>TroubleToggle loclist<CR>", "Location list" },
        },
        --find
        ["<Leader>f"] = {
          name = "+Telescope",
          d = { "<Cmd>lua require('telescope.builtin').lsp_definitions()<CR>", "Definition" },
          h = { "<Cmd>lua require('telescope.builtin').help_tags()<CR>", "Help" },
          g = { "<Cmd>lua require('telescope.builtin').live_grep()<CR>", "Search workspace" },
          e = { "<Cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>", "Explore" },
          r = { "<Cmd>lua require('telescope.builtin').lsp_references()<CR>", "References" },
          s = { "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document symbols" },
          w = { "<Cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", "Workspace symbols" },
          ["/"] = { "<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Search buffer" },
          ["?"] = { "<Cmd>lua require('telescope.builtin').builtin()<CR>", "Pickers" },
        },
        --git
        ["<Leader>g"] = {
          name = "+Git",
          b = { "<Cmd>Git blame<CR>", "Blame" },
          o = { "<Cmd>Gbrowse<CR>", "Github" },
        },
        --ai
        ["<Leader>a"] = {
          name = "+AI",
          p = { "<Cmd>ChatGPT<cr>", "Prompt" },
          a = { "<Cmd>lua require('chatgpt').edit_with_instructions()<CR>", "Edit", mode = {"n", "v"}},
          c = { "<Cmd>lua require('chatgpt').complete_code()<CR>", "Complete", mode = {"n", "v"}},
        },
        --neovim
        ["<Leader><Leader>"] = {
          name = "+Neovim",
          e = { "<Cmd>execute 'cd $NVIM_HOME'<CR><Cmd>edit $MYVIMRC<CR>", "Edit config" },
          t = { "<Cmd>Mason<CR>", "Tools" },
          p = { "<Cmd>Lazy<CR>", "Plugins" },
          h = { "<Cmd>checkhealth<CR>", "Check health" },
        },
        --unleadered
        ["<Left>"] = { "<Cmd>BufferLineCyclePrev<CR>", "Previous buffer" },
        ["<Right>"] = { "<Cmd>BufferLineCycleNext<CR>", "Next buffer" },
        ["<C-Space>"] = { "<Cmd>FloatermToggle<CR>", "Open terminal" },
        ["<C-n>"] = { "<Plug>(YankyCycleForward)", "Next yank" },
        ["<C-p>"] = { "<Plug>(YankyCycleBackward)", "Previous yank" },
        p = { "<Plug>(YankyPutAfter)", "Put after" },
        P = { "<Plug>(YankyPutBefore)", "Put before" },
      })

      --terminal mode
      wk.register({
        ["<Esc>"] = { "<Cmd>FloatermToggle<CR>", "Close terminal" },
      }, {
        mode = "t",
      })
    end
  }
}
