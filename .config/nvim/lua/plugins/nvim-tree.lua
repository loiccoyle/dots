-- https://github.com/kyazdani42/nvim-tree.lua
require("nvim-tree").setup({
    auto_close = true,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    view = { width = 40, side = "left" },
    diagnostics = { enable = true },
    mappings = {
        list = {
            { key = "h", cb = ':lua require"nvim-tree".on_keypress("close_node")<CR>' },
            { key = "l", cb = ':lua require"nvim-tree".on_keypress("edit")<CR>' },
            { key = "v", cb = ':lua require"nvim-tree".on_keypress("vsplit")<CR>' },
            { key = "s", cb = ':lua require"nvim-tree".on_keypress("split")<CR>' },
        },
    },
})
