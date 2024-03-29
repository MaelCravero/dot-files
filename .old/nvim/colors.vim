" Set specific colors from colorscheme where needed

if has_key(plugs, "coc.nvim")
    highlight link CocErrorSign GruvboxRedSign
    highlight link CocWarningSign GruvboxOrangeSign
    highlight link CocInfoSign GruvboxAquaSign
    highlight link CocHintSign GruvboxBlueSign

    highlight link CocErrorVirtualText GruvboxRed
    highlight link CocWarningVirtualText GruvboxOrange
    highlight link CocInfoVirtualText GruvboxAqua
    highlight link CocHintVirtualText GruvboxBlue

    highlight link CocRustTypeHint GruvboxGray
endif

if has_key(plugs, "codi.vim")
    highlight link CodiVirtualText GruvboxGray
endif

if has_key(plugs, "vim-gitgutter")
    highlight link GitGutterAdd    GruvboxGreenSign
    highlight link GitGutterChange GruvboxAquaSign
    highlight link GitGutterDelete GruvboxRedSign
endif
