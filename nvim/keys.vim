" Keymappings

" Leader
let mapleader = ","
let maplocalleader = ";"

nnoremap <silent> <Tab> :bnext <CR>
nnoremap <silent> <S-Tab> :bprevious <CR>

nnoremap <C-T> :let &background = (&background == "dark" ? "light" : "dark")<CR>

" Map leader to which_key
if has_key(plugs, "vim-which-key")
    nnoremap <silent> <leader> :silent WhichKey ','<CR>
    vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual ','<CR>

    nnoremap <silent> <localleader> :silent WhichKey ';'<CR>
    vnoremap <silent> <localleader> :silent <c-u> :silent WhichKeyVisual ';'<CR>
endif

if has_key(plugs, "coc.nvim")
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion
    "inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    "            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


    " position. Coc only does snippet and additional edit on confirm.
    if has('patch8.1.1068')
        " Use `complete_info` if your (Neo)Vim version supports it.
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
        imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use escape to confirm displayed completion and switch to normal mode.
    autocmd BufEnter *
                \ inoremap <buffer><silent><expr> <Esc>
                \ pumvisible() ? "\<C-Y>\<Esc>"
                \: "\<C-g>u\<Esc>"

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> gn <Plug>(coc-diagnostic-prev)
    nmap <silent> gp <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " Coc snippets
    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)

    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)
endif

if has_key(plugs, "iron.nvim")
    map cr ctr
endif

if has_key(plugs, "nuake")
    if has_key(plugs, "nvim-send-to-term")
        nnoremap <silent><C-d> :Nuake<CR><C-\><C-n>:SendHere<CR>i
    else
        nnoremap <silent><C-d> :Nuake<CR>
    endif
    inoremap <silent><C-d> <C-\><C-n>:Nuake<CR>
    tnoremap <silent><C-d> <C-\><C-n>:Nuake<CR>
endif

if has_key(plugs, "rnvimr")
    nnoremap <leader>r :RnvimrToggle<CR>
    tnoremap <leader>r <C-\><C-n>:RnvimrToggle<CR>

    " Use rnvimr like vinegar
    nnoremap <silent>- :RnvimrToggle<CR>
endif

if has_key(plugs, "barbar.nvim")
    nnoremap <silent> <Tab> :BufferNext<CR>
    nnoremap <silent> <S-Tab> :BufferPrevious<CR>
    nnoremap <silent> gt :BufferPick<CR>
endif

if has_key(plugs, "sideways.vim")
    nnoremap <M-h> :SidewaysLeft<CR>
    nnoremap <M-l> :SidewaysRight<CR>

    " Argument text object
    omap a <Plug>SidewaysArgumentTextobjI
    xmap a <Plug>SidewaysArgumentTextobjI
    omap A <Plug>SidewaysArgumentTextobjA
    xmap A <Plug>SidewaysArgumentTextobjA
endif
