" Load basic vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source $HOME/.vimrc

" Appearance
set termguicolors
set guifont=DejaVuSansMono:h9
set background=dark
set cursorline
set noshowcmd
set noshowmode

tnoremap <C-W> <C-\><C-n><C-W>

noremap <C-Z> <nop>

set concealcursor="n"

" Set custom filetypes
autocmd BufNewFile,BufRead *.eliom,*.eliomi set filetype=ocaml
autocmd BufNewFile,BufRead *.tikz, set filetype=tex

" Default packages
packadd termdebug

"---PLUGINS---

" Vim-plug install and plugs
source $HOME/.config/nvim/plugins.vim


" Plugin configs
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/clap.vim
source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/codi.vim
source $HOME/.config/nvim/plugins/echodoc.vim
source $HOME/.config/nvim/plugins/fzf.vim
source $HOME/.config/nvim/plugins/gina.vim
source $HOME/.config/nvim/plugins/gitgutter.vim
source $HOME/.config/nvim/plugins/goyo.vim
source $HOME/.config/nvim/plugins/indentline.vim
source $HOME/.config/nvim/plugins/iron.vim
source $HOME/.config/nvim/plugins/neoformat.vim
source $HOME/.config/nvim/plugins/nerdcommenter.vim
source $HOME/.config/nvim/plugins/nuake.vim
source $HOME/.config/nvim/plugins/quickscope.vim
source $HOME/.config/nvim/plugins/rnvimr.vim
source $HOME/.config/nvim/plugins/sendtoterm.vim
source $HOME/.config/nvim/plugins/sneak.vim
source $HOME/.config/nvim/plugins/startify.vim
source $HOME/.config/nvim/plugins/tree.vim
source $HOME/.config/nvim/plugins/treesitter.vim
source $HOME/.config/nvim/plugins/vimtex.vim
source $HOME/.config/nvim/plugins/vista.vim
source $HOME/.config/nvim/plugins/whichkey.vim

"-------------

source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/keys.vim
