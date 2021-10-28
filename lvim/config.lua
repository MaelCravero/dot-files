--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]] -- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.background = "dark"
lvim.colorscheme = "gruvbox"
lvim.builtin.treesitter.indent = false
lvim.builtin.gitsigns.opts["current_line_blame"] = true

vim.o.listchars = "trail:."
vim.o.wrap = true
vim.o.list = true
vim.o.colorcolumn = "80"

vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.cmd("map Y yy")
vim.cmd("unmap Y")

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
    -- for input mode
    i = {
        ["<C-t>"] = require"trouble.providers.telescope".open_with_trouble
    },
    -- for normal mode
    n = {
        ["<C-t>"] = require"trouble.providers.telescope".open_with_trouble
    }
}

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {"<cmd>TroubleToggle<cr>", "Trouble"}
lvim.builtin.which_key.mappings["s"] = {"<cmd>SymbolsOutline<cr>", "Symbols"}
lvim.builtin.which_key.mappings["T"] = {
    name = "+Trouble",
    r = {"<cmd>Trouble lsp_references<cr>", "References"},
    f = {"<cmd>Trouble lsp_definitions<cr>", "Definitions"},
    d = {"<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics"},
    q = {"<cmd>Trouble quickfix<cr>", "QuickFix"},
    l = {"<cmd>Trouble loclist<cr>", "LocationList"},
    t = {"<cmd>TroubleToggle<cr>", "Toggle"}
}
lvim.builtin.which_key.vmappings["c"] = {
    "<ESC><CMD>lua ___comment_gc(vim.fn.visualmode())<CR>",
    "Comment"
}
lvim.builtin.which_key.mappings["c"] = {
    "<cmd>lua require('Comment').toggle()<CR>",
    "Comment"
}
lvim.builtin.which_key.mappings["q"] = {"<cmd>BufferClose!<CR>", "Close Buffer"}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

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
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }

lvim.lang.lua.formatters = {
    {
        exe = "lua-format",
        args = {"--chop-down-table"}
    }
}

-- lvim.lang.ocaml.lsp.provider = "ocamlls"

-- Additional Plugins
lvim.plugins = {
    {"folke/tokyonight.nvim"},
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
    }
}

lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 16

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
    -- {"BufWinEnter", "*.cc", "setlocal ts=4 sw=4"},
    -- {"FileType", "cpp", "setlocal ts=4 sw=4"}
    {"BufWritePost", "*", "TroubleRefresh"}
}
