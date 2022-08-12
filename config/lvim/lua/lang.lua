----------------------------------------------------------------------
--                            Treesitter                            --
----------------------------------------------------------------------
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "cpp",
    "json",
    "lua",
    "python",
    "rust",
    "ocaml",
    "ocaml_interface",
    "yaml"
}

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

----------------------------------------------------------------------
--                            Formatters                            --
----------------------------------------------------------------------
vim.cmd [[
let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': 'ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--enable-outside-detected-project', '--name', '"%:p"', '-']
            \ }

let g:neoformat_ocaml_myocamlformat = {
            \ 'exe': 'ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--indicate-multiline-delimiters=closing-on-separate-line', '--exp-grouping=preserve', '--if-then-else=k-r', '--break-cases=toplevel', '--enable-outside-detected-project', '--name', '"%:p"', '-']
            \ }

"let g:neoformat_enabled_ocaml = ['ocamlformat', 'myocamlformat']
]]

----------------------------------------------------------------------
--                               LSP                                --
----------------------------------------------------------------------

require 'lspconfig'.als.setup {} -- Enable ada language server

----------------------------------------------------------------------
--                        Language-specific                         --
----------------------------------------------------------------------

-- Add merlin support
vim.cmd [[
if executable('opam')
  let g:opamshare=substitute(system('opam config var share'),'\n$','','''')
  if isdirectory(g:opamshare."/merlin/vim")
    execute "set rtp+=" . g:opamshare."/merlin/vim"
  endif
endif
]]
