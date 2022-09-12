-- https://github.com/kyazdani42/nvim-tree.lua
require("nvim-tree").setup({
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    view = {
        width = 32,
        side = "left",
        mappings = {
            list = {
                { key = "h", cb = ':lua require"nvim-tree".on_keypress("close_node")<CR>' },
                { key = "l", cb = ':lua require"nvim-tree".on_keypress("edit")<CR>' },
                { key = "v", cb = ':lua require"nvim-tree".on_keypress("vsplit")<CR>' },
                { key = "s", cb = ':lua require"nvim-tree".on_keypress("split")<CR>' },
            },
        },
    },
    diagnostics = { enable = true },
    renderer = {
        icons = { glyphs = { git = {
            unstaged = "⦾",
            staged = "⦿",
            untracked = "⮿",
        } } },
    },
})
