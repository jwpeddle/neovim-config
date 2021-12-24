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

"load plugins
call plug#begin('~/.nvim/plugged')
  Plug 'akinsho/bufferline.nvim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'folke/which-key.nvim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'

"******************** options ********************

"theme
set termguicolors
colorscheme dracula

"line numbering
set number

"don't wrap lines
set nowrap

"make autocomplete only use what I've typed
set wildmode=longest:full,full

"disable backups & swap
set nobackup
set nowritebackup
set noswapfile

"indenting
"enter spaces when tab is pressed:
set expandtab
"use 2 spaces to represent a tab
set softtabstop=2
"number of spaces to use for auto indent
set shiftwidth=2
"round shifted text to multiple of shiftwidth
set shiftround

"case insensitive search (unless caps provided)
set ignorecase
set smartcase

"briefly jump to matching brace on closing
set showmatch

"autohide buffers
set hidden

"use system clipboard
set clipboard^=unnamedplus

"disable folding
set nofoldenable

"open splits on right side
set splitright

"don't continue comments when using o
autocmd FileType * set formatoptions-=o

"******************** mappings ********************
"\ too hard to press
let mapleader = " " 

"******************** plugins ********************

"bufferline
lua <<EOF
require("bufferline").setup {
  options = {
    numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    --- @deprecated, please specify numbers as a function to customize the styling
    number_style = "superscript" | "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = false | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer" | function , text_align = "left" | "center" | "right"}},
    show_buffer_icons = true | false, -- disable filetype icons for buffers
    show_buffer_close_icons = true | false,
    show_close_icon = true | false,
    show_tab_indicators = true | false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false | true,
    always_show_bufferline = true | false,
    sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
      -- add custom logic
      return buffer_a.modified > buffer_b.modified
    end
  }
}
EOF


"fzf
lua <<EOF
vim.g.fzf_command_prefix = "Fzf"
EOF

"treesitter
lua <<EOF
require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
  },
}
EOF

"which-key
lua << EOF
local wk = require("which-key")
wk.setup()

wk.register({
  ["<leader>"] = {
    name = "+prefix",
    e = { "<cmd>FzfFiles<cr>", "Open file" },
  },
  ["<leader><leader>"] = {
    name = "+prefix",
    e = { "<cmd>edit $MYVIMRC<cr>", "Edit config" },
    r = { "<cmd>source $MYVIMRC<cr>", "Reload config" },
    h = { "<cmd>checkhealth<cr>", "Check health" },
  },
  ["<left>"] = { "<cmd>BufferPrevious<cr>", "Previous buffer" },
  ["<right>"] = {"<cmd>BufferNext<cr>", "Next buffer" },
})
EOF
