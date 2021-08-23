-- https://github.com/NvChad/nvim-base16.lua
local colors = require("plugins.nvim-base16-colors")
local base16 = require("base16")

-- Remove the # from the start of the color strings
local colors_stripped = {}
for k, v in pairs(colors) do
    colors_stripped[k] = string.sub(v, 2, -1)
end

base16.apply_theme(colors_stripped)

-- Remove background colors
vim.cmd([[
hi Normal guibg=None
hi NormalNC guibg=None
hi Conceal guibg=None
hi Folded guibg=None
hi Folded guifg=None
hi NvimTreeNormal guibg=None
hi NvimTreeStatusLineNC guibg=None
hi NvimTreeVertSplit guibg=None
hi NvimTreeNormal guibg=None
]])

-- Tweaks
vim.cmd(string.format(
    [[
hi StatusLineNC gui=underline
hi FloatBorder guibg=%s
    ]],
    colors.base01
))
