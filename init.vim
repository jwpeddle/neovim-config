" load plugins
call plug#begin('~/.nvim/plugged')
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'antoinemadec/coc-fzf'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim'
  Plug 'preservim/nerdtree'
  Plug 'puremourning/vimspector'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
call plug#end()

"theme
set termguicolors
colorscheme dracula

"******************** options ********************
"line numbering
set number

"don't wrap lines
set nowrap

"extra room in cmd section
set cmdheight=2

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

"don't continue comments automatically
set formatoptions-=cro

"******************** mappings ********************
"\ too hard to press
let mapleader=','

"use arrows to change buffer
map <Left> :tabp<cr>
map <Right> :tabn<cr>

"easier window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"forget to sudo?
cmap w!! w !sudo tee % >/dev/null

"******************** plugins ********************

"airline
"let g:airline_section_a = airline#section#create(['mode', 'crypt', 'paste', 'spell', 'iminsert'])
"let g:airline_section_b = airline#section#create(['hunks', 'branch'])
"let g:airline_section_c = airline#section#create(['bufferline or filename', 'readonly'])
"let g:airline_section_gutter = airline#section#create(['csv'])
"let g:airline_section_x = airline#section#create(['tagbar', 'filetype', 'virtualenv'])
"let g:airline_section_y = airline#section#create(['fileencoding', 'fileformat', 'bom', 'eol'])
"let g:airline_section_z = airline#section#create([])
"let g:airline_section_error = airline#section#create(['languageclient_error_count'])
"let g:airline_section_warning = airline#section#create(['languageclient_warning_count', 'whitespace'])

" [*] This section needs at least the fugitive extension or else
"     it will remain empty
"
" here is an example of how you could replace the branch indicator with
" the current working directory (limited to 10 characters),
" followed by the filename.
let g:airline_section_b = '%-0.10{getcwd()}'
let g:airline_section_c = '%t'

"coc
set shortmess+=c
set signcolumn=yes
set updatetime=300
source ~/.config/nvim/coc.vim

"fzf
let $FZF_DEFAULT_COMMAND = 'fd --type file --follow --hidden --exclude .git'
let g:fzf_command_prefix = 'Fzf'
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []
nnoremap <Leader>fo :FzfFiles<CR>
nnoremap <Leader>f/ :FzfRg<CR>
nnoremap <Leader>ff :FzfBLines<CR>
nnoremap <Leader>fh :FzfHistory/<CR>

"lightline
set noshowmode
let g:lightline = {
  \   'colorscheme': 'dracula',
  \   'active': {
  \     'left': [
  \       ['mode'],
  \       ['readonly', 'modified', 'relativepath'],
  \     ],
  \     'right': [
  \       ['filetype'],
  \       ['gitbranch'],
  \       [],
  \     ],
  \   },
  \   'component_function': {
  \     'gitbranch': 'FugitiveHead'
  \   },
  \ }

"nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>

"vimspector
let g:vimspector_enable_mappings = 'HUMAN'
