"install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"autoinstall missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

lua <<EOF
local call = vim.call
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

--load plugins
call("plug#begin", "~/.nvim/plugged")
  Plug("akinsho/bufferline.nvim")
  Plug("dracula/vim", {as = "dracula"})
  Plug("folke/which-key.nvim")
  Plug("junegunn/fzf", {dir = "~/.fzf", ["do"] = "./install --all"})
  Plug("junegunn/fzf.vim")
  Plug("nvim-treesitter/nvim-treesitter", {["do"] = ":TSUpdate"})
call("plug#end")


return require('packer').startup(function()
  use({"wbthomason/packer.nvim"})
  use({"akinsho/bufferline.nvim"})
  use({"dracula/vim", {as = "dracula"})
  use({"folke/which-key.nvim"})
  use({"junegunn/fzf", dir = "~/.fzf", run = "./install --all"})
  use({"junegunn/fzf.vim"})
  use({"nvim-treesitter/nvim-treesitter", run = ':TSUpdate'})

  -- Simple plugins can be specified as strings
  use '9mm/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Plugins can have dependencies on other plugins
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  -- Plugins can also depend on rocks from luarocks.org:
  use {
    'my/supercoolplugin',
    rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  }

  -- You can specify rocks in isolation
  use_rocks 'penlight'
  use_rocks {'lua-resty-http', 'lpeg'}

  -- Local plugins can be included
  use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}
end)

g.python_host_prog = "$HOME/.pyenv/versions/neovim2/bin/python"
g.python3_host_prog = "$HOME/.pyenv/versions/neovim3/bin/python"

--******************** options ********************

--theme
opt.termguicolors = true
cmd("colorscheme dracula")

--line numbering
opt.number = true

--don't wrap lines
opt.wrap = false

--make autocomplete only use what I've typed
opt.wildmode = {"longest:full", "full"}

--disable backups & swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false

--indenting
--enter spaces when tab is pressed:
opt.expandtab = true
--use 2 spaces to represent a tab
opt.softtabstop = 2
--number of spaces to use for auto indent
opt.shiftwidth = 2
--round shifted text to multiple of shiftwidth
opt.shiftround = true

--case insensitive search (unless caps provided)
opt.ignorecase = true
opt.smartcase = true

--briefly jump to matching brace on closing
opt.showmatch = true

--autohide buffers
opt.hidden = true

--use system clipboard
opt.clipboard:prepend("unnamedplus")

--disable folding
opt.foldenable = false

--open splits on right side
opt.splitright = true

--don't continue comments when using o
cmd("autocmd FileType * set formatoptions-=o")

--******************** mappings ********************
--\ too hard to press
g.mapleader = " " 

--******************** plugins ********************

--bufferline
require("bufferline").setup({
  options = {
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
  }
})

--fzf
g.fzf_command_prefix = "Fzf"

--treesitter
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
})

--which-key
local wk = require("which-key")
wk.setup()

wk.register({
  ["<leader>"] = {
    name = "+prefix",
    o = { "<cmd>FzfFiles<cr>", "Open file" },
    b = { "<cmd>FzfBuffers<cr>", "Open buffer" },
    w = { "<cmd>bwipeout<cr>", "Close buffer" },
    W = { "<cmd>%bwipeout<cr>", "Close all buffers" },
    q = { "<cmd>quit<cr>", "Quit" },
  },
  ["<leader><leader>"] = {
    name = "+prefix",
    e = { "<cmd>edit $MYVIMRC<cr>", "Edit config" },
    r = { "<cmd>source $MYVIMRC<cr>", "Reload config" },
    h = { "<cmd>checkhealth<cr>", "Check health" },
  },
  ["<left>"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous buffer" },
  ["<right>"] = {"<cmd>BufferLineCycleNext<cr>", "Next buffer" },
})
EOF
