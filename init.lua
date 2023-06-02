vim.g.python_host_prog = "$HOME/.pyenv/versions/neovim2/bin/python"
vim.g.python3_host_prog = "$HOME/.pyenv/versions/neovim3/bin/python"


--******************** bootstrap plugins ********************
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")


--******************** options ********************

--theme
vim.opt.termguicolors = true
vim.cmd("colorscheme dracula")

--line numbering
vim.opt.number = true

--don't wrap lines
vim.opt.wrap = false

--make autocomplete only use what I've typed
vim.opt.wildmode = { "longest:full", "full" }

--disable backups & swap
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

--indenting
--enter spaces when tab is pressed:
vim.opt.expandtab = true
--use 2 spaces to represent a tab
vim.opt.softtabstop = 2
--number of spaces to use for auto indent
vim.opt.shiftwidth = 2
--round shifted text to multiple of shiftwidth
vim.opt.shiftround = true

--case insensitive search (unless caps provided)
vim.opt.ignorecase = true
vim.opt.smartcase = true

--highlight search only when typing
vim.opt.hlsearch = false
vim.cmd([[
augroup incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
]])

--highlight column 120
vim.opt.colorcolumn = "120"

--briefly jump to matching brace on closing
vim.opt.showmatch = true

--autohide buffers
vim.opt.hidden = true

--use system clipboard
vim.opt.clipboard:prepend("unnamedplus")

--folding
vim.opt.foldenable = false
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--vim.opt.foldnestmax = 1

--open splits on right/bottom
vim.opt.splitright = true
vim.opt.splitbelow = true

--don't continue comments when using o
vim.cmd([[
  augroup formatoptions
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=o
  augroup end
]])

--\ too hard to press
vim.g.mapleader = " " 


--******************** which-key ********************

--\ too hard to press
vim.g.mapleader = " " 

local wk = require("which-key")
wk.setup()
vim.opt.timeoutlen = 500

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
    r = { "<Cmd>Reload<CR>", "Reload config" },
    p = { "<Cmd>PackerSync<CR>", "Sync packages" },
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
