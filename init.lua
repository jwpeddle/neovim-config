--******************** plugins ********************

--bootstrap lazy
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

--set leader to space [must happen before lazy setup]
vim.g.mapleader = " " 

--load everything in lua/plugins
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  }
})


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
