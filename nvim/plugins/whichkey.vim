" Which key

" Shorter delay
set timeoutlen=100

" Create map to add keys to
let g:which_key_map = {}
let g:which_key_map_local = {}
let g:which_key_map_cw = {}

" Hide status bar
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode signcolumn=no
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode signcolumn=yes

" Floating windows are quite ugly for some reason
let g:which_key_use_floating_win = 0

" Leader mappings
let g:which_key_map['c'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['e'] = [ ':call TreeSwitch()'         , 'explorer' ]
let g:which_key_map['E'] = [ ':LuaTreeToggle'             , 'toggle explorer' ]
let g:which_key_map['r'] = [ ':RnvimrToggle'              , 'ranger' ]
let g:which_key_map['s'] = [ ':SSave!'                    , 'save session' ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['z'] = [ ':Goyo'                      , 'zen' ]
let g:which_key_map['q'] = [ ':BufferClose'               , 'close file' ]
let g:which_key_map['m'] = [ ':make'               , 'make' ]

let g:which_key_map['b'] = {
            \ 'name' : '+buffers',
            \ 'd' : [':bd', 'delete'],
            \ 'f' : [':Buffers', 'find'],
            \ 'l' : [':blast', 'last'],
            \ 'c' : [':Bdelete hidden', 'clean'],
            \}

let g:which_key_map['b'] = {
            \ 'name' : '+buffers',
            \ 'c' : [':BufferClose', 'close'],
            \ 'C' : [':Bdelete hidden', 'clean'],
            \ 'n' : [':BufferMoveNext', 'move next'],
            \ 'p' : [':BufferMovePrevious', 'move prev'],
            \ 'l' : [':BufferLast', 'last'],
            \ 'od' : [':BufferOrderByDirectory', 'order by dir'],
            \ 'ol' : [':BufferOrderByLanguage', 'order by lang'],
            \ 'g' : [':BufferPick', 'goto'],
            \}

let g:which_key_map['f'] = {
            \ 'name' : '+FZF',
            \ 'f' : [':Files', 'files'],
            \ 'a' : [':Ag', 'ag'],
            \ 'c' : [':Colors', 'colors'],
            \ 'b' : [':Buffers', 'buffers'],
            \ 'h' : [':Helptags', 'help'],
            \ 'l' : [':Lines', 'lines'],
            \ 't' : [':Tags', 'tags'],
            \}

" 'a' : [':Git add %', 'add' ],
" 'b' : [':Git blame', 'blame'],
" 'c' : [':Git commit', 'commit'],
" 'C' : [':Git commit --amend', 'commit'],
" 'd' : [':Git diff', 'diff'],
" 'D' : [':Git diff %', 'current file diff'],
" 'l' : [':Git log', 'log'],
" 'p' : [':Git push', 'push'],
" 'P' : [':Git pull', 'pull'],
" 's' : [':Gstatus', 'status'],
let g:which_key_map['g'] = {
            \ 'name' : '+git',
            \ 'm' : 'message',
            \ 's' : [':CocCommand fzf-preview.GitStatus', 'status'],
            \ 'S' : [':CocCommand fzf-preview.GitStashes', 'stash'],
            \ 'a' : [':CocCommand fzf-preview.GitActions', 'actions'],
            \ 'b' : [':CocCommand fzf-preview.GitBranch', 'branch'],
            \ 'l' : [':CocCommand fzf-preview.GitLogs', 'log'],
            \ 'r' : [':CocCommand fzf-preview.GitReflogs', 'reflog'],
            \ 'V' : [':Gvdiffsplit', 'diff split'],
            \}
let g:which_key_map['g']['g'] = {
            \ 'name' : '+gina',
            \ 'a' : [':Gina add %', 'add'],
            \ 'b' : [':Gina blame', 'blame'],
            \ 'c' : [':Gina commit', 'commit'],
            \ 'C' : [':Gina commit --amend', 'amend'],
            \}

let g:which_key_map['h'] = {
            \ 'name' : '+hunk',
            \ 'n' : ['<Plug>(GitGutterNextHunk)',     'next'],
            \ 'p' : ['<Plug>(GitGutterPrevHunk)',     'previous'],
            \ 'v' : ['<Plug>(GitGutterPreviewHunk)',  'preview'],
            \ 's' : ['<Plug>(GitGutterStageHunk)',    'stage'],
            \ 'u' : ['<Plug>(GitGutterUndoHunk)',     'undo'],
            \}

" Localleader LSP mappings
let g:which_key_map_local = {
            \ 'l' : [':CocFzfList', 'list'],
            \ 'a' : [':CocFzfList actions', 'actions'],
            \ 'd' : [':CocFzfList diagnostics', 'diagnostics'],
            \ 'c' : [':CocFzfList commands', 'commands'],
            \ 'n' : ['<Plug>(coc-diagnostic-next)', 'next'],
            \ 'N' : ['<Plug>(coc-diagnostic-next-error)', 'next error'],
            \ 'p' : ['<Plug>(coc-diagnostic-prev)', 'previous'],
            \ 'P' : ['<Plug>(coc-diagnostic-prev-error)', 'previous error'],
            \ 'r' : ['<Plug>(coc-rename)', 'rename'],
            \ 'R' : ['<Plug>(coc-refactor)', 'refactor'],
            \}

let g:which_key_map_local['g'] = {
            \ 'name' : '+goto',
            \ 'd' : ['<Plug>(coc-definition)', 'definition'],
            \ 'D' : ['<Plug>(coc-declaration)', 'declaration'],
            \ 't' : ['<Plug>(coc-type-definition)', 'type definition'],
            \ 'i' : ['<Plug>(coc-implementation)', 'implementation'],
            \ 'r' : ['<Plug>(coc-references)', 'references'],
            \}

" Register maps
call which_key#register(',', "g:which_key_map")
call which_key#register(';', "g:which_key_map_local")
