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
set tw=80
set nofoldenable

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
nnoremap <C-n> ;
nnoremap <C-p> ,
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
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Mappings
"map <silent> <C-m> :make <CR><CR>
"map <C-n> :cn <CR>
"map <C-b> :cp <CR>
map <C-f> <C-]>

" Arrow mappings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

vnoremap <Right> <Nop>
vnoremap <Left> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>

nnoremap <C-Right> <C-w>>
nnoremap <C-Left> <C-w><
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-

" Navigate virtual lines
nnoremap j gj
nnoremap k gk


" Language specific settings
autocmd FileType c,h set autoindent
autocmd FileType c,h set cindent

autocmd FileType ocaml set shiftwidth=2
autocmd FileType ocaml set softtabstop=2

au BufNewFile,BufRead,BufEnter *.ll,*.yy,*.tikz set shiftwidth=2
au BufNewFile,BufRead,BufEnter *.ll,*.yy,*.tikz set softtabstop=2

autocmd FileType rust set cc=99

autocmd VimResized * wincmd =

set background=dark
set termguicolors

if !has('nvim')
    "---PLUGINS---
    call plug#begin('~/.vim/.plugged')

    " Looks
    Plug 'morhetz/gruvbox'
    Plug 'ayu-theme/ayu-vim'
    Plug 'ajmwagar/vim-deus'

    " Essential tweaks
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-vinegar'
    Plug 'romainl/vim-qf'
    Plug 'Townk/vim-autoclose'
    Plug 'sheerun/vim-polyglot'

    call plug#end()

    colorscheme gruvbox
endif
