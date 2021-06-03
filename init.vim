"install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" load plugins
call plug#begin('~/.nvim/plugged')
  Plug 'antoinemadec/coc-fzf'
  Plug 'ap/vim-buftabline'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'idbrii/vim-endoscope'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'lervag/vimtex'
  Plug 'liuchengxu/vista.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'neoclide/coc.nvim'
  Plug 'preservim/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'svermeulen/vim-yoink'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'voldikss/vim-floaterm'
call plug#end()

source ~/.config/nvim/common.vim

"theme
set termguicolors
colorscheme dracula

"******************** plugins ********************

"buftabline
let g:buftabline_numbers = 2
nmap <a-1> <Plug>BufTabLine.Go(1)
nmap <a-2> <Plug>BufTabLine.Go(2)
nmap <a-3> <Plug>BufTabLine.Go(3)
nmap <a-4> <Plug>BufTabLine.Go(4)
nmap <a-5> <Plug>BufTabLine.Go(5)
nmap <a-6> <Plug>BufTabLine.Go(6)
nmap <a-7> <Plug>BufTabLine.Go(7)
nmap <a-8> <Plug>BufTabLine.Go(8)
nmap <a-9> <Plug>BufTabLine.Go(9)
nmap <a-0> <Plug>BufTabLine.Go(10)

"coc
set shortmess+=c
set signcolumn=yes
set updatetime=300
source ~/.config/nvim/coc.vim

"floaterm
"nnoremap <silent> <C-Space> :FloatermToggle<CR>
"tnoremap <silent> <C-Space> <C-\><C-N>:FloatermToggle<CR>
"tnoremap <silent> <C-d> <C-\><C-N>:FloatermToggle<CR>
"tnoremap <silent> <Esc> <C-\><C-N>

"fzf
let g:fzf_command_prefix = 'Fzf'
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []
nnoremap <Leader>o :FzfFiles<CR>
nnoremap <Leader>f/ :FzfRg<CR>
nnoremap <Leader>ff :FzfBLines<CR>
nnoremap <Leader>fh :FzfHistory/<CR>
nnoremap <Leader>fc :FzfCommands<CR>
nnoremap <Leader>fo :CocFzfList outline<CR>

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

"vimtex
let g:vimtex_view_method = 'zathura'

"vista
let g:vista_default_executive = 'coc'
nmap <Leader>m :Vista!!<CR>

"yoink
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
