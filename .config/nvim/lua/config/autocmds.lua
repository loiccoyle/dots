local au_filetypes = vim.api.nvim_create_augroup("FileTypes", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  -- See https://github.com/LazyVim/LazyVim/issues/80
  { group = au_filetypes, pattern = { "*" }, command = "set fo=jcqlnt" }
)
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { group = au_filetypes, pattern = { "*.conf", "*.ini" }, command = "setl filetype=dosini" }
)
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { group = au_filetypes, pattern = { "*.zsh" }, command = "setl filetype=sh" }
)

local au_on_save = vim.api.nvim_create_augroup("OnSave", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufWritePost" },
  { group = au_on_save, pattern = { "*bspwrc" }, command = "!./%; notify-send -i reload 'Running bspwmrc'" }
)
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = au_on_save,
  pattern = { "*dunstrc" },
  command = "!killall dunst; notify-send -i reload 'Restarting dunst'",
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = au_on_save,
  pattern = { "*sxhkdrc" },
  command = "!pkill -USR1 sxhkd; notify-send -i reload 'Reloading sxhkd'",
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = au_on_save,
  pattern = { "*polybar/config" },
  command = "!polybar-msg cmd restart; notify-send -i reload 'Restarting polybar'",
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = au_on_save,
  pattern = { "*Xresources", "*Xdefaults" },
  command = "!xrdb %; notify-send -i reload 'Setting xrdb'",
})

-- local au_yank_highlight = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
-- vim.api.nvim_create_autocmd({ "TextYankPost" }, {
--   group = au_yank_highlight,
--   callback = function()
--     vim.highlight.on_yank({ timeout = 300 })
--   end,
-- })

local au_resize_propor = vim.api.nvim_create_augroup("ResizePropor", { clear = true })
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = au_resize_propor,
  command = "tabdo wincmd =",
})
