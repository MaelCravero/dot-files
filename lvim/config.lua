-- Custom config for lunarvim https://lunarvim.org
-- Default config here https://github.com/LunarVim/LunarVim/blob/rolling/utils/installer/config.example.lua
--
----------------------------------------------------------------------
--                       General Vim Settings                       --
----------------------------------------------------------------------
vim.o.listchars = "trail:."
vim.o.wrap = true
vim.o.list = true
vim.o.colorcolumn = "80"
vim.o.textwidth = 80

vim.o.shiftwidth = 4
vim.o.tabstop = 4

----------------------------------------------------------------------
--                          Lvim Settings                           --
----------------------------------------------------------------------

lvim.log.level = "warn"
lvim.background = "dark"
lvim.colorscheme = "gruvbox"
lvim.format_on_save = true

lvim.builtin.treesitter.indent = false
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.gitsigns.opts["current_line_blame"] = true

lvim.builtin.dashboard.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 16

----------------------------------------------------------------------
--                          Config modules                          --
----------------------------------------------------------------------
require("keys")
require("lang")
require("commands")

----------------------------------------------------------------------
--                        Additional Plugins                        --
----------------------------------------------------------------------
lvim.plugins = {
    {"folke/trouble.nvim"},
    {'luukvbaal/stabilize.nvim'},
    {'tpope/vim-surround'},
    {"tpope/vim-repeat"},
    {'rktjmp/lush.nvim'},
    {'ellisonleao/gruvbox.nvim'},
    {
        "ggandor/lightspeed.nvim",
        event = "BufRead"
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require"lsp_signature".setup() end
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline"
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            vim.g.indentLine_enabled = 1
            vim.g.indent_blankline_char = "▏"
            vim.g.indent_blankline_filetype_exclude = {
                "help",
                "terminal",
                "dashboard"
            }
            vim.g.indent_blankline_buftype_exclude = {"terminal"}
            vim.g.indent_blankline_show_trailing_blankline_indent = false
            vim.g.indent_blankline_show_first_indent_level = false
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
        config = function() vim.g.mkdp_auto_start = 1 end
    },
    {
        "andymass/vim-matchup",
        event = "CursorMoved",
        config = function()
            vim.g.matchup_matchparen_offscreen = {
                method = "popup"
            }
        end
    },
    {
        "sbdchd/neoformat",
        config = function()
            vim.g.neoformat_ocamlformat = {
                exe = "ocamlformat",
                no_append = 1,
                stdin = 1,
                args = {
                    "--enable-outside-detected-project",
                    "--format-invalid-files=auto",
                    "--name",
                    '"%:p"',
                    "-"
                }
            }
            vim.cmd [[
        augroup fmt
            autocmd!
            au BufWritePre *.ml,*.mli Neoformat
        augroup END
        ]]
        end
    },
    {
        "s1n7ax/nvim-comment-frame",
        config = function()
            require('nvim-comment-frame').setup({
                disable_default_keymap = true
            })
        end
    },
    {
        "kosayoda/nvim-lightbulb",
        config = function()
            require'nvim-lightbulb'.update_lightbulb {
                sign = {
                    enabled = true,
                    text = ""
                },
                float = {
                    enabled = false
                },
                virtual_text = {
                    enabled = true,
                    -- Text to show at virtual text
                    text = "",
                    -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
                    hl_mode = "combine"
                },
                status_text = {
                    enabled = false
                }
            }
            vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
        end
    }
}
