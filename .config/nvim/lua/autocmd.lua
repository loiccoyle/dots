require("utils").nvim_create_augroup({
    ftplugin = {
        { "BufRead", "NvimTree", "setl scl=no" }, -- TODO: fix this
        { "BufRead,BufNewFile", "*.conf,*.ini", "set filetype=dosini" },
        { "BufRead,BufNewFile", "*.zsh", "set filetype=sh" },
        { "FileType", "man", "setl laststatus=0 noruler" },
        -- {'FileType', 'vim,lua,css,javascript,sh', 'setl sw=2'},
        { "TermOpen", "term://*", "setl nornu nonu nocul so=0 scl=no" },
    },
    on_save = {
        -- {'BufWritePre', '*', '%s/\s\+$//e'},            -- Remove whitespace on save
        -- reload configs
        { "BufWritePost", "*.vim,*.lua", "source %" },
        { "BufWritePost", "*bspwmrc", "!./%" },
        { "BufWritePost", "*sxhkdrc", "!pkill -USR1 sxhkd" },
        { "BufWritePost", "*polybar/config", "!polybar-msg cmd restart" },
        { "BufWritePost", "*Xresources,*Xdefaults", "!xrdb %" },
    },
    general = {
        { "TextYankPost", "*", "silent! lua vim.highlight.on_yank { timeout = 300 }" },
        -- { "FileType", "*", "set formatoptions-=cro" }, -- Avoid newline continuation of comments
    },
    resize_windows_proportionally = { { "VimResized", "*", [[tabdo wincmd =]] } },
    -- toggle_search_highlighting = { { "InsertEnter", "*", ":nohl" } }, -- This is broken
})
