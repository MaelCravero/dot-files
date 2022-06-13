-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocmds = {
    {"FileType", { pattern = "ocaml", command = "setlocal ts=2 sw=2 cc=100 tw=100"} },
    {"FileType", { pattern = "ocaml", command = "map K :MerlinTypeOf<CR>"} },
}
