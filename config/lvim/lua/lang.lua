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
-- lvim.lang.lua.formatters = {
--     {
--         exe = "lua-format",
--         args = {"--chop-down-table"}
--     }
-- }

vim.cmd [[
let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': 'ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--enable-outside-detected-project', '--name', '"%:p"', '-']
            \ }
]]

----------------------------------------------------------------------
--                               LSP                                --
----------------------------------------------------------------------

-- lvim.lang.ocaml.lsp.provider = "ocamlls"
