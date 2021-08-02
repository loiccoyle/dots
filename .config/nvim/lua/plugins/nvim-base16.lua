-- https://github.com/RRethy/nvim-base16
-- https://github.com/xiyaowong/nvim-transparent
local colors = require("plugins.nvim-base16-colors")
local base16 = require("base16-colorscheme")

base16.setup(colors)

-- Remove background colors
base16.highlight.Normal = { guibg = "none" }
base16.highlight.NormalNC = { guibg = "none" }
base16.highlight.Conceal = { guibg = "none" }
