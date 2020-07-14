" TODO auto-install vim-plug

call plug#begin('~/.config/nvim/plugged')

" --- Looks
" Better status bar
Plug 'vim-airline/vim-airline'

" Themes for airline
Plug 'vim-airline/vim-airline-themes'

" Cute little icons
Plug 'ryanoasis/vim-devicons'

" Various themes
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'ayu-theme/ayu-vim'
Plug 'AlessandroYorba/Alduin'
Plug 'tlhr/anderson.vim'


" --- Essential tweaks

" More motions for dealing with brackets, quotes...
Plug 'tpope/vim-surround'

" Netrw enhancement for file navigation
Plug 'tpope/vim-vinegar'

" Better use of sessions
Plug 'tpope/vim-obsession'

" Better use of the quickfix list
Plug 'romainl/vim-qf'

" Adds matching quote/bracket/...
Plug 'Townk/vim-autoclose'

" Quick comment/uncomment
Plug 'preservim/nerdcommenter'

" this_is_now_more_than_one_word - easier snake/camelcase editing
Plug 'chaoren/vim-wordmotion'


" --- Additional features

" Tags are cool yo
Plug 'ludovicchabant/vim-gutentags'

" Amazing git commands from vim - useful for git-blaming your friends
Plug 'tpope/vim-fugitive'

" Various code snippets
Plug 'honza/vim-snippets'

" Better syntax coloring for many languages
Plug 'sheerun/vim-polyglot'

" Automatically sets your nvim pwd to your project root
Plug 'airblade/vim-rooter'

" Display indentation guides - now you can read your 234 lines python function
Plug 'Yggdroot/indentLine'


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

" Automatically format your code on save
Plug 'sbdchd/neoformat'

" Great fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" REPL plugins
Plug 'Vigemus/iron.nvim'
Plug 'mtikekar/nvim-send-to-term'

" Ranger file explorer inside nvim
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" Display function signature when autocompleting
Plug 'Shougo/echodoc.vim'

" Small pop-up terminal panel
Plug 'Lenovsky/nuake'

" Pop-up window containing commit details
Plug 'rhysd/git-messenger.vim'

call plug#end()

let g:loaded_clipboard_provider = 1
