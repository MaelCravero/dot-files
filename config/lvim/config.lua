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

vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.o.laststatus = 3

vim.o.guifont = "DejaVu Sans Code Nerd:h11"

vim.cmd "let g:neovide_no_idle=v:true"
vim.cmd "let g:neovide_animation_length=0.03"

----------------------------------------------------------------------
--                          Lvim Settings                           --
----------------------------------------------------------------------

lvim.log.level = "warn"
lvim.background = "dark"
lvim.colorscheme = "gruvbox"
lvim.format_on_save = true

lvim.builtin.bufferline.options.always_show_bufferline = true

lvim.builtin.treesitter.indent = false
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.gitsigns.opts["current_line_blame"] = true

lvim.builtin.notify.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 16

lvim.builtin.dap.active = true

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
    -- Colorschemes
    "rktjmp/lush.nvim",
    "ellisonleao/gruvbox.nvim",
    "marko-cerovac/material.nvim",
    "sainnhe/gruvbox-material",
    "Shatur/neovim-ayu",
    "sonph/onehalf",
    "theniceboy/nvim-deus",

    -- Motions, text edition
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "AndrewRadev/sideways.vim",
    {"ggandor/lightspeed.nvim", event = "BufRead"},
    {
        "andymass/vim-matchup",
        event = "CursorMoved",
        config = function()
            vim.g.matchup_matchparen_offscreen = {method = "popup"}
        end
    },
    {
        "s1n7ax/nvim-comment-frame",
        config = function()
            require('nvim-comment-frame').setup({disable_default_keymap = true})
        end
    },

    -- Git integration
    {
        'lambdalisue/gina.vim',
        config = function()
            vim.cmd [[
        let g:gina#command#blame#formatter#format = "%au: %su%=on %ti %ma%in"

        " Echo chunk info with j/k
        call gina#custom#mapping#nmap(
                    \ 'blame', 'j',
                    \ 'j<Plug>(gina-blame-echo)'
                    \)
        call gina#custom#mapping#nmap(
                    \ 'blame', 'k',
                    \ 'k<Plug>(gina-blame-echo)'
                    \)
        ]]
        end
    },

    -- LSP integration
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            require"lsp_signature".setup({
                floating_window = false,
                hint_prefix = " "
            })
        end
    },
    {
        "simrat39/symbols-outline.nvim",
        setup = function()
            vim.g.symbols_outline = {width = 50, relative_width = false}
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
                    "--name",
                    '"%:p"',
                    "-"
                }
            }
            vim.g.neoformat_glsl = {
                exe = "clang-format",
                no_append = 1,
                stdin = 1
            }
            vim.cmd [[
        augroup fmt
            autocmd!
            au BufWritePre *.ml,*.mli,*.glsl Neoformat
        augroup END
        ]]
        end
    },
    {
        "kosayoda/nvim-lightbulb",
        config = function()
            require'nvim-lightbulb'.update_lightbulb {
                sign = {enabled = true, text = ""},
                float = {enabled = false},
                virtual_text = {
                    enabled = true,
                    -- Text to show at virtual text
                    text = "",
                    -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
                    hl_mode = "combine"
                },
                status_text = {enabled = false}
            }
            vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
        end
    },

    -- Misc
    "nvim-telescope/telescope-ui-select.nvim",
    "tikhomirov/vim-glsl",
    "luukvbaal/stabilize.nvim",
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            vim.g.indentLine_enabled = 1
            vim.g.indent_blankline_char = "▏"
            vim.g.indent_blankline_filetype_exclude = {
                "help",
                "terminal",
                "dashboard",
                "alpha"
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
    {"metakirby5/codi.vim", cmd = "Codi"},
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = {
                    '<C-u>',
                    '<C-d>',
                    '<C-b>',
                    '<C-f>',
                    '<C-y>',
                    '<C-e>',
                    'zt',
                    'zz',
                    'zb'
                },
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil, -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil -- Function to run after the scrolling animation ends
            })
        end
    }
}

require("telescope").load_extension("ui-select")
