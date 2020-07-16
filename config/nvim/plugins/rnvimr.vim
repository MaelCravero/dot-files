" Rnvimr

" Replace netrw as main file explorer
let g:rnvimr_enable_ex = 1
" Hide ranger after picking a file
let g:rnvimr_enable_picker = 1
" Wipe buffers of delete files
let g:rnvimr_enable_bw = 1
" Hide gitignore files
let g:rnvimr_hide_gitignore = 1

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd',
            \ '<Esc>': 'q',
            \ }
