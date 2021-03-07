"" TODO auto-install vim-plug

call plug#begin('~/.config/nvim/.plugged')

" --- Looks
" Better status bar
Plug 'vim-airline/vim-airline'

" Themes for airline
Plug 'vim-airline/vim-airline-themes'

" Cute little icons
Plug 'ryanoasis/vim-devicons'

" Various themes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'ajmwagar/vim-deus'

" Scrollbar
" Plug 'Xuyuanp/scrollbar.nvim'

" Fade windows
Plug 'TaDaa/vimade'

" --- Essential tweaks

" More motions for dealing with brackets, quotes...
Plug 'tpope/vim-surround'

" Better use of the quickfix list
Plug 'romainl/vim-qf'

" Adds matching quote/bracket/...
" Plug 'Townk/vim-autoclose'

" Quick comment/uncomment
Plug 'preservim/nerdcommenter'

" this_is_now_more_than_one_word - easier snake/camelcase editing
Plug 'chaoren/vim-wordmotion'

" Move words
Plug 'AndrewRadev/sideways.vim'

" Better motions
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'

" --- Git integration

" Amazing git commands from vim - useful for git-blaming your friends
Plug 'tpope/vim-fugitive'

" Another git wrapper for vim, more customizable
Plug 'lambdalisue/gina.vim'

" Pop-up window containing commit details
Plug 'rhysd/git-messenger.vim'

" Show git hunks and navigate them with ease
Plug 'airblade/vim-gitgutter'

" --- Additional features

" Various code snippets
Plug 'honza/vim-snippets'

" Better syntax coloring for many languages
Plug 'sheerun/vim-polyglot'

" Automatically sets your nvim pwd to your project root
Plug 'airblade/vim-rooter'

" Display indentation guides - now you can read your 342 lines python function
Plug 'Yggdroot/indentLine'

" Vim but more zen
Plug 'junegunn/goyo.vim'

" Delete hidden buffers
Plug 'Asheq/close-buffers.vim'

" Better quickfix list
Plug 'kevinhwang91/nvim-bqf'

" --- Edition plugins

" Better tex editing
Plug 'lervag/vimtex'

" Markdown preview - duh
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}

" Display hex colors, great for theme editing
Plug 'chrisbra/Colorizer'

" --- 'IDE' features

" vIM iS NoT aN IDe
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Classy startup-menu
Plug 'mhinz/vim-startify'

" IDE-like tabs
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" File explorer
Plug 'kyazdani42/nvim-tree.lua'

" View tags and symbols
Plug 'liuchengxu/vista.vim'

" Never forget a mapping
Plug 'liuchengxu/vim-which-key'

" Automatically format your code on save
Plug 'sbdchd/neoformat'

" Great fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'

" Clap
Plug 'liuchengxu/vim-clap'

" REPL plugins
Plug 'Vigemus/iron.nvim'
Plug 'mtikekar/nvim-send-to-term'

" Auto display of evals
Plug 'metakirby5/codi.vim'

" Ranger file explorer inside nvim
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" Display function signature when autocompleting
Plug 'Shougo/echodoc.vim'

" Small pop-up terminal panel
Plug 'Lenovsky/nuake'

call plug#end()

let g:loaded_clipboard_provider = 1
