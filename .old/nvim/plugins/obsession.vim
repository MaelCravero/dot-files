" Obsession

function! Session()
    if filereadable(".session.vim")
        source .session.vim
    else
        Obsess .session.vim
    endif
endfunction

map <C-l> :call Session() <CR>
