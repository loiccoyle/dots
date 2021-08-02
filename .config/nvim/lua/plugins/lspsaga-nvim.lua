local saga = require("lspsaga")

saga.init_lsp_saga({
    max_preview_lines = 20,
    code_action_prompt = { virtual_text = false },
    finder_action_keys = {
        open = "o",
        vsplit = "v",
        split = "s",
        quit = { "q", "<ESC>" },
        scroll_down = "<C-f>",
        scroll_up = "<C-b>", -- quit can be a table
    },
    code_action_keys = { quit = { "q", "<C-c>", "<ESC>" }, exec = "<CR>" },
    rename_action_keys = { quit = { "<C-c>", "<ESC>" }, exec = "<CR>" },
})
