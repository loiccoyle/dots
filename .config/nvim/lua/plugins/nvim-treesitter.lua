-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- https://github.com/RRethy/nvim-treesitter-textsubjects
-- https://github.com/windwp/nvim-ts-autotag
-- https://github.com/p00f/nvim-ts-rainbow
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    ensure_installed = "maintained",
    indent = { enable = false },
    rainbow = { enable = true },
    autotag = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
    --[[ textsubjects = {
        enable = false,
        keymaps = {
            ["<CR>"] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
        },
    }, ]]
})
