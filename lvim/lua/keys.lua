----------------------------------------------------------------------
--                             Mappings                             --
----------------------------------------------------------------------
lvim.keys.normal_mode["Y"] = "yy" -- default Y behavior
lvim.keys.normal_mode["gt"] = ":BufferPick<CR>" -- default Y behavior
lvim.keys.normal_mode["<Tab>"] = ":BufferNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferPrevious<CR>"

----------------------------------------------------------------------
--                            Telescope                             --
----------------------------------------------------------------------
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
    -- for insert mode
    i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-t>"] = require"trouble.providers.telescope".open_with_trouble
    },
    -- for normal mode
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-t>"] = require"trouble.providers.telescope".open_with_trouble
    }
}

----------------------------------------------------------------------
--                             WhichKey                             --
----------------------------------------------------------------------

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
local wkmap = lvim.builtin.which_key.mappings

-- unmap unwanted defaults
wkmap["/"] = nil
wkmap["w"] = nil

lvim.builtin.which_key.vmappings["c"] = {
    "<ESC><CMD>lua ___comment_gc(vim.fn.visualmode())<CR>",
    "Comment"
}

wkmap["c"] = {"<cmd>lua require('Comment').toggle()<CR>", "Comment"}
wkmap["C"] = {
    "<cmd>lua require('nvim-comment-frame').add_multiline_comment()<CR>",
    "Comment frame"
}
wkmap["s"] = {"<cmd>SymbolsOutline<cr>", "Symbols"}
wkmap["t"] = {"<cmd>TroubleToggle<cr>", "Trouble"}
wkmap["T"] = {
    name = "+Trouble",
    r = {"<cmd>Trouble lsp_references<cr>", "References"},
    f = {"<cmd>Trouble lsp_definitions<cr>", "Definitions"},
    d = {"<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics"},
    q = {"<cmd>Trouble quickfix<cr>", "QuickFix"},
    l = {"<cmd>Trouble loclist<cr>", "LocationList"},
    t = {"<cmd>TroubleToggle<cr>", "Toggle"}
}
wkmap["q"] = {"<cmd>BufferClose!<CR>", "Close Buffer"}
