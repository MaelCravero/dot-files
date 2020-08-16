" FZF

let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

"Open FZF and choose floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

function! OpenFloatingWin()
    let height = &lines - 3
    let width = float2nr(&columns - (&columns * 0 / 5))
    let col = float2nr((&columns - width) / 2)

    "Set the position, size, etc. of the floating window.
    "The size configuration here may not be so flexible, and there's room for further improvement.
    let opts = {
                \ 'relative': 'editor',
                \ 'row': height * 0.3,
                \ 'col': col + 30,
                \ 'width': width * 2 / 3,
                \ 'height': height / 2
                \}

    let buf = nvim_create_buf(v:false, v:true)
    let win = nvim_open_win(buf, v:true, opts)

    "Set Floating Window Highlighting
    call setwinvar(win, '&winhl', 'Normal:Pmenu')

    setlocal
                \ buftype=nofile
                \ nobuflisted
                \ bufhidden=hide
                \ nonumber
                \ norelativenumber
                \ signcolumn=no

endfunction
