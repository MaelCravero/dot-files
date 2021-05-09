" Airline

let g:airline_powerline_fonts = 1
"let g:airline_theme='hybrid'
let g:airline_theme='gruvbox'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.dirty=' '

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_nr = 0

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#fzf#enabled = 1
