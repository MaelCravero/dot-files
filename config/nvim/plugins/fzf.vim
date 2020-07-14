" FZF

map <M-e> :Files <CR>
map <M-g> :GFiles <CR>
map <M-b> :Buffers <CR>
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
