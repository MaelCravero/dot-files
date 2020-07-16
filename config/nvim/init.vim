" Load basic vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Appearance
set termguicolors
set guifont=DejaVuSansMono:h9
set background=dark
set cursorline

tnoremap <C-W><C-W> <C-\><C-n><C-W><C-W>
tnoremap <Esc><Esc> <C-\><C-n>

set concealcursor="n"

" Default packages
packadd termdebug

"---PLUGINS---

" Vim-plug install and plugs
source $HOME/.config/nvim/plugins.vim


" Plugin configs
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/codi.vim
source $HOME/.config/nvim/plugins/echodoc.vim
source $HOME/.config/nvim/plugins/fzf.vim
source $HOME/.config/nvim/plugins/goyo.vim
source $HOME/.config/nvim/plugins/indentline.vim
source $HOME/.config/nvim/plugins/iron.vim
source $HOME/.config/nvim/plugins/neoformat.vim
source $HOME/.config/nvim/plugins/nuake.vim
source $HOME/.config/nvim/plugins/obsession.vim
source $HOME/.config/nvim/plugins/rnvimr.vim

"-------------

source $HOME/.config/nvim/colors.vim
