-- https://github.com/lewis6991/gitsigns.nvim
require("gitsigns").setup({
    signs = {
        add = { hl = "GitSignsAdd", text = "▎" },
        change = { hl = "GitSignsChange", text = "▎" },
        delete = { hl = "GitSignsDelete", text = "契" },
        topdelete = { hl = "GitSignsDelete", text = "契" },
        changedelete = { hl = "GitSignsChange", text = "▎" },
    },
    keymaps = {
        -- Default keymap options
        noremap = true,

        ["n ]h"] = { expr = true, "&diff ? ']h' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
        ["n [h"] = { expr = true, "&diff ? '[h' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
        ["n <leader>hS"] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
        ["n <leader>hU"] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

        -- Text objects
        ["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
        ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    },
    current_line_blame = true,
})
