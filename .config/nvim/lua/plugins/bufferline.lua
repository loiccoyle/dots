-- https://github.com/akinsho/nvim-bufferline.lua
require("bufferline").setup({
    options = {
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13, -- prefix used when a buffer is deduplicated
        tab_size = 20,
        -- diagnostics = false | "nvim_lsp"
        offsets = { { filetype = "NvimTree" } },
        -- show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        view = "multiwindow",
        -- sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
        right_mouse_command = "vertical sbuffer %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = function(bufnum)
            require("bufdelete").bufdelete(bufnum, true)
        end,
        -- "bdelete %d", -- can be a string | function, see "Mouse actions"
    },
})
