-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
    -- {"BufWinEnter", "*.cc", "setlocal ts=4 sw=4"},
    -- {"FileType", "cpp", "setlocal ts=4 sw=4"}
    {"BufWritePost", "*", "TroubleRefresh"}
}
