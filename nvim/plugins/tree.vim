" Nvim-tree.lua

" Files to ignore
let g:lua_tree_ignore = [ '.git', 'node_modules', '*.o' ]

" Hide hidden files by default
let g:lua_tree_hide_dotfiles = 1

" Open tree on start
" let g:lua_tree_auto_open = 1

" Close tree when last window
let g:lua_tree_auto_close = 1

" Follow file when entering buffer
let g:lua_tree_follow = 1

" Switch from and to LuaTree
function TreeSwitch()
    if &filetype == 'LuaTree'
        wincmd l
    else
        NvimTreeFindFile
    endif
endfunction
