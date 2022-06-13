----------------------------------------------------------------------
--                             Mappings                             --
----------------------------------------------------------------------
lvim.keys.normal_mode["Y"] = "yy" -- default Y behavior
lvim.keys.normal_mode["gt"] = ":BufferLinePick<CR>"
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-h>"] = ":SidewaysLeft<CR>"
lvim.keys.normal_mode["<S-l>"] = ":SidewaysRight<CR>"

vim.cmd [[omap ix <Plug>SidewaysArgumentTextobjA]]
vim.cmd [[xmap ix <Plug>SidewaysArgumentTextobjA]]
vim.cmd [[omap ia <Plug>SidewaysArgumentTextobjI]]
vim.cmd [[xmap ia <Plug>SidewaysArgumentTextobjI]]

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
        ["<C-p>"] = actions.cycle_history_prev
    },
    -- for normal mode
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
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
    "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
    "Comment"
}

wkmap["c"] = {
    "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>",
    "Comment"
}

wkmap["C"] = {
    "<cmd>lua require('nvim-comment-frame').add_multiline_comment()<CR>",
    "Comment frame"
}

wkmap["f"] = {"<cmd>Telescope find_files<CR>", "Find files"}

wkmap["s"] = {"<cmd>SymbolsOutline<cr>", "Symbols"}

wkmap["t"] = {
    name = "+Telescoppe",
    b = {"<cmd>Telescope buffers<cr>", "Buffers"},
    f = {"<cmd>Telescope git_files<cr>", "Git files"},
    g = {"<cmd>Telescope live_grep<cr>", "Grep"},
    h = {"<cmd>Telescope help_tags<cr>", "Help"},
    l = {"<cmd>Telescope loclist<cr>", "LocList"},
    m = {"<cmd>Telescope man_pages<cr>", "Man"},
    q = {"<cmd>Telescope quickfix<cr>", "QuickFix"},
    r = {"<cmd>Telescope resume<cr>", "Resume"},
    s = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search"},
    t = {"<cmd>Telescope<cr>", "Telescope"}
}

wkmap["q"] = {"<cmd>BufferKill<CR>", "Close Buffer"}
wkmap[":"] = {"<cmd>Telescope commands<CR>", "Commands"}
wkmap["="] = {"<cmd>Telescope spell_suggest<CR>", "Spelling"}
