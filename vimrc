" General settings
set encoding=utf-8
set nocp
syntax on
set bs=indent,eol,start
set hidden

" Basic display settings
set nu
set cc=80
set signcolumn=yes
set list listchars=trail:.

" We do live in the 21st century
set mouse=a

" Always keep some space around the cursor on the screen's edge
set so=5

" Tab settings
set expandtab
set shiftwidth=4
set softtabstop=4

" Split settings
set splitright
set splitbelow
set swb=usetab,split


" Leader
let mapleader = ";"
let maplocalleader = ","


" Completion pop-up fix
highlight Pmenu ctermbg=LightGrey guibg=LightGrey
highlight PmenuSel ctermbg=Blue guibg=Blue
set pumheight=10


" Omnicompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Mappings
"map <silent> <C-m> :make <CR><CR>
"map <C-n> :cn <CR>
"map <C-b> :cp <CR>
map <C-f> <C-]>

" Arrow mappings
"nnoremap m l
"nnoremap l k
"nnoremap k j
"nnoremap j h
"nnoremap <Right> <C-w>l
"nnoremap <Left> <C-w>h
"nnoremap <Up> <C-w>k
"nnoremap <Down> <C-w>j
nnoremap <C-Right> <C-w>>
nnoremap <C-Left> <C-w><
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-


" Indentation
autocmd FileType c,h set autoindent
autocmd FileType c,h set cindent

autocmd FileType ocaml set shiftwidth=2
autocmd FileType ocaml set softtabstop=2

au BufNewFile,BufRead,BufEnter *.ll,*.yy set shiftwidth=2
au BufNewFile,BufRead,BufEnter *.ll,*.yy set softtabstop=2


"---PLUGINS---
call plug#begin('~/.vim/plugged')

" Looks
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'ayu-theme/ayu-vim'
Plug 'AlessandroYorba/Alduin'
Plug 'tlhr/anderson.vim'

" Essential tweaks
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'romainl/vim-qf'
Plug 'Townk/vim-autoclose'

call plug#end()

set background=dark
set termguicolors
colorscheme gruvbox

"" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
"let s:opam_share_dir = system("opam config var share")
"let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')
"
"let s:opam_configuration = {}
"
"function! OpamConfOcpIndent()
"  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
"endfunction
"let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')
"
"function! OpamConfOcpIndex()
"  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
"endfunction
"let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')
"
"function! OpamConfMerlin()
"  let l:dir = s:opam_share_dir . "/merlin/vim"
"  execute "set rtp+=" . l:dir
"endfunction
"let s:opam_configuration['merlin'] = function('OpamConfMerlin')
"
"let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
"let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
"let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
"for tool in s:opam_packages
"  " Respect package order (merlin should be after ocp-index)
"  if count(s:opam_available_tools, tool) > 0
"    call s:opam_configuration[tool]()
"  endif
"endfor
"" ## end of OPAM user-setup addition for vim / base ## keep this line
