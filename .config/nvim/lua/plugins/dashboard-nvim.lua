vim.g.dashboard_custom_header = {
    "",
    "",
    "",
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    "",
}
vim.g.dashboard_footer_icon = "🐬 "
vim.g.dashboard_preview_file_height = 12
vim.g.dashboard_preview_file_width = 80
vim.g.dashboard_disable_statusline = 1
vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_section = {
    find_files = {
        description = { "  Git  Files                              LEADER n  " },
        command = 'lua require("telescope.builtin").git_files()',
    },
    find_history = {
        description = { "  Recently opened files                   LEADER f o" },
        command = 'lua require("telescope.builtin").oldfiles()',
    },
    find_word = {
        description = { "  Find  word                              LEADER g  " },
        command = 'lua require("telescope.builtin").live_grep()',
    },
    vim_config = {
        description = { "  Open Neovim config                      LEADER f c" },
        command = 'lua require("telescope.builtin").find_files({prompt_title="Config", cwd="$XDG_CONFIG_HOME/nvim"})',
    },
}
