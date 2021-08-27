local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        layout_config = { horizontal = { preview_width = 0.5 } },
        file_ignore_patterns = { "node_modules/*", "venv/*", ".venv/*" },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<ESC>"] = actions.close,
            },
            n = { ["<C-c>"] = actions.close },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
})

require("telescope").load_extension("fzf")
