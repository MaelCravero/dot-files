" Clap

autocmd FileType clap_input noremap <silent> <buffer> <Down> <C-R>=clap#navigation#linewise('down')<CR>
autocmd FileType clap_input noremap <silent> <buffer> <Up> <C-R>=clap#navigation#linewise('up')<CR>
