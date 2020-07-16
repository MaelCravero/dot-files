" Set specific colors from colorscheme where needed

if has_key(plugs, "coc.nvim")
    highlight link CocErrorSign GruvboxRed
    highlight link CocWarningSign GruvboxOrange
    highlight link CocInfoSign GruvboxAqua
    highlight link CocHintSign GruvboxBlue
endif

if has_key(plugs, "codi.vim")
    highlight link CodiVirtualText GruvboxGray
endif
