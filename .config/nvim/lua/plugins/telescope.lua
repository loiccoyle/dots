local actions = require("telescope.actions")
local sorters = require("telescope.sorters")

require("telescope").setup({
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        layout_config = { horizontal = { preview_width = 0.5 } },
        file_sorter = sorters.get_fzy_sorter,
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
    extensions = { fzy_native = { override_generic_sorter = true, override_file_sorter = true } },
})

require("telescope").load_extension("fzy_native")

-- local M = {}

-- M.find_project = function()
--     local ok = pcall(require("telescope.builtin").git_files)
--     if not ok then
--         require("telescope.builtin").find_files()
--     end
-- end

-- return M
