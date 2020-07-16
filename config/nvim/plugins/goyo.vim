" Goyo

function! s:goyo_enter()
    set cursorline!
    set scrolloff=999
    " ...
endfunction

function! s:goyo_leave()
    set cursorline
    set scrolloff=5
    " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
