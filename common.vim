let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'

"theme
set termguicolors
colorscheme dracula
":hi Normal guibg=NONE ctermbg=NONE

"******************** options ********************
"line numbering
set number

"don't wrap lines
set nowrap

"make autocomplete only use what I've typed
set wildmode=longest:full,full

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

"open splits on right side
set splitright

"don't continue comments when using o
autocmd FileType * set formatoptions-=o

"******************** mappings ********************
"\ too hard to press
let mapleader=';'

"use arrows to change buffer
map <Left> :bprevious<cr>
map <Right> :bnext<cr>

"easier window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"forget to sudo?
cmap w!! w !sudo tee % >/dev/null

"close buffers/vim, save
map <Leader>w :bd<CR>
map <Leader>W :bd!<CR>
map <Leader>q :q<CR>
map <Leader>Q :qall!<CR>
map <Leader>s :w<CR>
imap <Leader>s <Esc>:w<CR>

"paste last yank
map <Leader>p "0p

"reload init.nvim
map <Leader><F5> :source ~/.config/nvim/init.vim<CR>

"clear search
"TODO pick another shortcut
"nmap <silent> <C-L> :nohlsearch<CR>

"******************** plugins ********************

"nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>

let g:terminal_color_0 = '#000000'
let g:terminal_color_1 = '#800000'
let g:terminal_color_2 = '#008000'
let g:terminal_color_3 = '#808000'
let g:terminal_color_4 = '#000080'
let g:terminal_color_5 = '#800080'
let g:terminal_color_6 = '#008080'
let g:terminal_color_7 = '#c0c0c0'
let g:terminal_color_8 = '#808080'
let g:terminal_color_9 = '#ff0000'
let g:terminal_color_10 = '#00ff00'
let g:terminal_color_11 = '#ffff00'
let g:terminal_color_12 = '#0000ff'
let g:terminal_color_13 = '#ff00ff'
let g:terminal_color_14 = '#00ffff'
let g:terminal_color_15 = '#ffffff'
let g:terminal_color_16 = '#000000'
let g:terminal_color_17 = '#00005f'
let g:terminal_color_18 = '#000087'
let g:terminal_color_19 = '#0000af'
let g:terminal_color_20 = '#0000df'
let g:terminal_color_21 = '#0000ff'
let g:terminal_color_22 = '#005f00'
let g:terminal_color_23 = '#005f5f'
let g:terminal_color_24 = '#005f87'
let g:terminal_color_25 = '#005faf'
let g:terminal_color_26 = '#005fdf'
let g:terminal_color_27 = '#005fff'
let g:terminal_color_28 = '#008700'
let g:terminal_color_29 = '#00875f'
let g:terminal_color_30 = '#008787'
let g:terminal_color_31 = '#0087af'
let g:terminal_color_32 = '#0087df'
let g:terminal_color_33 = '#0087ff'
let g:terminal_color_34 = '#00af00'
let g:terminal_color_35 = '#00af5f'
let g:terminal_color_36 = '#00af87'
let g:terminal_color_37 = '#00afaf'
let g:terminal_color_38 = '#00afdf'
let g:terminal_color_39 = '#00afff'
let g:terminal_color_40 = '#00df00'
let g:terminal_color_41 = '#00df5f'
let g:terminal_color_42 = '#00df87'
let g:terminal_color_43 = '#00dfaf'
let g:terminal_color_44 = '#00dfdf'
let g:terminal_color_45 = '#00dfff'
let g:terminal_color_46 = '#00ff00'
let g:terminal_color_47 = '#00ff5f'
let g:terminal_color_48 = '#00ff87'
let g:terminal_color_49 = '#00ffaf'
let g:terminal_color_50 = '#00ffdf'
let g:terminal_color_51 = '#00ffff'
let g:terminal_color_52 = '#5f0000'
let g:terminal_color_53 = '#5f005f'
let g:terminal_color_54 = '#5f0087'
let g:terminal_color_55 = '#5f00af'
let g:terminal_color_56 = '#5f00df'
let g:terminal_color_57 = '#5f00ff'
let g:terminal_color_58 = '#5f5f00'
let g:terminal_color_59 = '#5f5f5f'
let g:terminal_color_60 = '#5f5f87'
let g:terminal_color_61 = '#5f5faf'
let g:terminal_color_62 = '#5f5fdf'
let g:terminal_color_63 = '#5f5fff'
let g:terminal_color_64 = '#5f8700'
let g:terminal_color_65 = '#5f875f'
let g:terminal_color_66 = '#5f8787'
let g:terminal_color_67 = '#5f87af'
let g:terminal_color_68 = '#5f87df'
let g:terminal_color_69 = '#5f87ff'
let g:terminal_color_70 = '#5faf00'
let g:terminal_color_71 = '#5faf5f'
let g:terminal_color_72 = '#5faf87'
let g:terminal_color_73 = '#5fafaf'
let g:terminal_color_74 = '#5fafdf'
let g:terminal_color_75 = '#5fafff'
let g:terminal_color_76 = '#5fdf00'
let g:terminal_color_77 = '#5fdf5f'
let g:terminal_color_78 = '#5fdf87'
let g:terminal_color_79 = '#5fdfaf'
let g:terminal_color_80 = '#5fdfdf'
let g:terminal_color_81 = '#5fdfff'
let g:terminal_color_82 = '#5fff00'
let g:terminal_color_83 = '#5fff5f'
let g:terminal_color_84 = '#5fff87'
let g:terminal_color_85 = '#5fffaf'
let g:terminal_color_86 = '#5fffdf'
let g:terminal_color_87 = '#5fffff'
let g:terminal_color_88 = '#870000'
let g:terminal_color_89 = '#87005f'
let g:terminal_color_90 = '#870087'
let g:terminal_color_91 = '#8700af'
let g:terminal_color_92 = '#8700df'
let g:terminal_color_93 = '#8700ff'
let g:terminal_color_94 = '#875f00'
let g:terminal_color_95 = '#875f5f'
let g:terminal_color_96 = '#875f87'
let g:terminal_color_97 = '#875faf'
let g:terminal_color_98 = '#875fdf'
let g:terminal_color_99 = '#875fff'
let g:terminal_color_100 = '#878700'
let g:terminal_color_101 = '#87875f'
let g:terminal_color_102 = '#878787'
let g:terminal_color_103 = '#8787af'
let g:terminal_color_104 = '#8787df'
let g:terminal_color_105 = '#8787ff'
let g:terminal_color_106 = '#87af00'
let g:terminal_color_107 = '#87af5f'
let g:terminal_color_108 = '#87af87'
let g:terminal_color_109 = '#87afaf'
let g:terminal_color_110 = '#87afdf'
let g:terminal_color_111 = '#87afff'
let g:terminal_color_112 = '#87df00'
let g:terminal_color_113 = '#87df5f'
let g:terminal_color_114 = '#87df87'
let g:terminal_color_115 = '#87dfaf'
let g:terminal_color_116 = '#87dfdf'
let g:terminal_color_117 = '#87dfff'
let g:terminal_color_118 = '#87ff00'
let g:terminal_color_119 = '#87ff5f'
let g:terminal_color_120 = '#87ff87'
let g:terminal_color_121 = '#87ffaf'
let g:terminal_color_122 = '#87ffdf'
let g:terminal_color_123 = '#87ffff'
let g:terminal_color_124 = '#af0000'
let g:terminal_color_125 = '#af005f'
let g:terminal_color_126 = '#af0087'
let g:terminal_color_127 = '#af00af'
let g:terminal_color_128 = '#af00df'
let g:terminal_color_129 = '#af00ff'
let g:terminal_color_130 = '#af5f00'
let g:terminal_color_131 = '#af5f5f'
let g:terminal_color_132 = '#af5f87'
let g:terminal_color_133 = '#af5faf'
let g:terminal_color_134 = '#af5fdf'
let g:terminal_color_135 = '#af5fff'
let g:terminal_color_136 = '#af8700'
let g:terminal_color_137 = '#af875f'
let g:terminal_color_138 = '#af8787'
let g:terminal_color_139 = '#af87af'
let g:terminal_color_140 = '#af87df'
let g:terminal_color_141 = '#af87ff'
let g:terminal_color_142 = '#afaf00'
let g:terminal_color_143 = '#afaf5f'
let g:terminal_color_144 = '#afaf87'
let g:terminal_color_145 = '#afafaf'
let g:terminal_color_146 = '#afafdf'
let g:terminal_color_147 = '#afafff'
let g:terminal_color_148 = '#afdf00'
let g:terminal_color_149 = '#afdf5f'
let g:terminal_color_150 = '#afdf87'
let g:terminal_color_151 = '#afdfaf'
let g:terminal_color_152 = '#afdfdf'
let g:terminal_color_153 = '#afdfff'
let g:terminal_color_154 = '#afff00'
let g:terminal_color_155 = '#afff5f'
let g:terminal_color_156 = '#afff87'
let g:terminal_color_157 = '#afffaf'
let g:terminal_color_158 = '#afffdf'
let g:terminal_color_159 = '#afffff'
let g:terminal_color_160 = '#df0000'
let g:terminal_color_161 = '#df005f'
let g:terminal_color_162 = '#df0087'
let g:terminal_color_163 = '#df00af'
let g:terminal_color_164 = '#df00df'
let g:terminal_color_165 = '#df00ff'
let g:terminal_color_166 = '#df5f00'
let g:terminal_color_167 = '#df5f5f'
let g:terminal_color_168 = '#df5f87'
let g:terminal_color_169 = '#df5faf'
let g:terminal_color_170 = '#df5fdf'
let g:terminal_color_171 = '#df5fff'
let g:terminal_color_172 = '#df8700'
let g:terminal_color_173 = '#df875f'
let g:terminal_color_174 = '#df8787'
let g:terminal_color_175 = '#df87af'
let g:terminal_color_176 = '#df87df'
let g:terminal_color_177 = '#df87ff'
let g:terminal_color_178 = '#dfaf00'
let g:terminal_color_179 = '#dfaf5f'
let g:terminal_color_180 = '#dfaf87'
let g:terminal_color_181 = '#dfafaf'
let g:terminal_color_182 = '#dfafdf'
let g:terminal_color_183 = '#dfafff'
let g:terminal_color_184 = '#dfdf00'
let g:terminal_color_185 = '#dfdf5f'
let g:terminal_color_186 = '#dfdf87'
let g:terminal_color_187 = '#dfdfaf'
let g:terminal_color_188 = '#dfdfdf'
let g:terminal_color_189 = '#dfdfff'
let g:terminal_color_190 = '#dfff00'
let g:terminal_color_191 = '#dfff5f'
let g:terminal_color_192 = '#dfff87'
let g:terminal_color_193 = '#dfffaf'
let g:terminal_color_194 = '#dfffdf'
let g:terminal_color_195 = '#dfffff'
let g:terminal_color_196 = '#ff0000'
let g:terminal_color_197 = '#ff005f'
let g:terminal_color_198 = '#ff0087'
let g:terminal_color_199 = '#ff00af'
let g:terminal_color_200 = '#ff00df'
let g:terminal_color_201 = '#ff00ff'
let g:terminal_color_202 = '#ff5f00'
let g:terminal_color_203 = '#ff5f5f'
let g:terminal_color_204 = '#ff5f87'
let g:terminal_color_205 = '#ff5faf'
let g:terminal_color_206 = '#ff5fdf'
let g:terminal_color_207 = '#ff5fff'
let g:terminal_color_208 = '#ff8700'
let g:terminal_color_209 = '#ff875f'
let g:terminal_color_210 = '#ff8787'
let g:terminal_color_211 = '#ff87af'
let g:terminal_color_212 = '#ff87df'
let g:terminal_color_213 = '#ff87ff'
let g:terminal_color_214 = '#ffaf00'
let g:terminal_color_215 = '#ffaf5f'
let g:terminal_color_216 = '#ffaf87'
let g:terminal_color_217 = '#ffafaf'
let g:terminal_color_218 = '#ffafdf'
let g:terminal_color_219 = '#ffafff'
let g:terminal_color_220 = '#ffdf00'
let g:terminal_color_221 = '#ffdf5f'
let g:terminal_color_222 = '#ffdf87'
let g:terminal_color_223 = '#ffdfaf'
let g:terminal_color_224 = '#ffdfdf'
let g:terminal_color_225 = '#ffdfff'
let g:terminal_color_226 = '#ffff00'
let g:terminal_color_227 = '#ffff5f'
let g:terminal_color_228 = '#ffff87'
let g:terminal_color_229 = '#ffffaf'
let g:terminal_color_230 = '#ffffdf'
let g:terminal_color_231 = '#ffffff'
let g:terminal_color_232 = '#080808'
let g:terminal_color_233 = '#121212'
let g:terminal_color_234 = '#1c1c1c'
let g:terminal_color_235 = '#262626'
let g:terminal_color_236 = '#303030'
let g:terminal_color_237 = '#3a3a3a'
let g:terminal_color_238 = '#444444'
let g:terminal_color_239 = '#4e4e4e'
let g:terminal_color_240 = '#585858'
let g:terminal_color_241 = '#606060'
let g:terminal_color_242 = '#666666'
let g:terminal_color_243 = '#767676'
let g:terminal_color_244 = '#808080'
let g:terminal_color_245 = '#8a8a8a'
let g:terminal_color_246 = '#949494'
let g:terminal_color_247 = '#9e9e9e'
let g:terminal_color_248 = '#a8a8a8'
let g:terminal_color_249 = '#b2b2b2'
let g:terminal_color_250 = '#bcbcbc'
let g:terminal_color_251 = '#c6c6c6'
let g:terminal_color_252 = '#d0d0d0'
let g:terminal_color_253 = '#dadada'
let g:terminal_color_254 = '#e4e4e4'
let g:terminal_color_255 = '#eeeeee'
let g:terminal_color_fg = 'fg'
let g:terminal_color_bg = 'bg'
let g:terminal_color_NONE = 'NONE'
