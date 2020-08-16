" Which key

" Shorter delay
set timeoutlen=100

" Create map to add keys to
let g:which_key_map =  {}
let g:which_key_map_local =  {}

" Hide status bar
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode signcolumn=no
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode signcolumn=yes

" Floating windows are quite ugly for some reason
let g:which_key_use_floating_win = 0

" Leader mappings
let g:which_key_map['c'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['r'] = [ ':RnvimrToggle'              , 'ranger' ]
let g:which_key_map['s'] = [ ':SSave!'                    , 'save session' ]
let g:which_key_map['t'] = [ ':tabedit %'                 , 'edit in new tab' ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['z'] = [ ':Goyo'                      , 'zen' ]
let g:which_key_map['b'] = {
            \ 'name' : '+buffers',
            \ 'd' : [':bd', 'delete'],
            \ 'f' : [':Buffers', 'find'],
            \ 'l' : [':blast', 'last'],
            \}

let g:which_key_map['F'] = {
            \ 'name' : '+FZF',
            \ 'c' : [':Colors', 'colors'],
            \ 'b' : [':Buffers', 'buffers'],
            \ 'h' : [':Helptags', 'help'],
            \ 'l' : [':Lines', 'lines'],
            \ 't' : [':Tags', 'tags'],
            \}

let g:which_key_map['g'] = {
            \ 'name' : '+git',
            \ 'm' : 'message',
            \ 'a' : [':Git add %', 'add' ],
            \ 'b' : [':Git blame', 'blame'],
            \ 'c' : [':Git commit', 'commit'],
            \ 'C' : [':Git commit --amend', 'commit'],
            \ 'd' : [':Git diff', 'diff'],
            \ 'D' : [':Git diff %', 'current file diff'],
            \ 'l' : [':Git log', 'log'],
            \ 'p' : [':Git push', 'push'],
            \ 'P' : [':Git pull', 'pull'],
            \ 's' : [':Gstatus', 'status'],
            \ 'V' : [':Gvdiffsplit', 'diff split'],
            \}

let g:which_key_map['l'] = {
            \ 'name' : '+lsp',
            \ 'a' : [':CocList diagnostics', 'diagnostics'],
            \ 'c' : [':CocList commands', 'commands'],
            \ 'd' : ['<Plug>(coc-definition)', 'definition'],
            \ 'i' : ['<Plug>(coc-implementation)', 'implementation'],
            \ 'n' : ['<Plug>(coc-diagnostic-next)', 'next'],
            \ 'N' : ['<Plug>(coc-diagnostic-next-error)', 'next error'],
            \ 'p' : ['<Plug>(coc-diagnostic-prev)', 'previous'],
            \ 'P' : ['<Plug>(coc-diagnostic-prev-error)', 'previous error'],
            \ 'r' : ['<Plug>(coc-rename)', 'rename'],
            \ 'R' : ['<Plug>(coc-refactor)', 'refactor'],
            \ 't' : ['<Plug>(coc-type-definition)', 'type definition'],
            \}

" Localleader mappings
let g:which_key_map_local["1-9"] = "tab 1-9"
let g:which_key_map_local['&'] = 'which_key_ignore' " Airline tabs mappings
let g:which_key_map_local['é'] = 'which_key_ignore'
let g:which_key_map_local['"'] = 'which_key_ignore'
let g:which_key_map_local["'"] = 'which_key_ignore'
let g:which_key_map_local['('] = 'which_key_ignore'
let g:which_key_map_local['-'] = 'which_key_ignore'
let g:which_key_map_local['è'] = 'which_key_ignore'
let g:which_key_map_local['_'] = 'which_key_ignore'
let g:which_key_map_local['ç'] = 'which_key_ignore'

" Register maps
call which_key#register(',', "g:which_key_map")
call which_key#register(';', "g:which_key_map_local")
