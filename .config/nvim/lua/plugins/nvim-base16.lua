-- https://github.com/NvChad/nvim-base16.lua
local colors = require("plugins.nvim-base16-colors")
local base16 = require("base16-colorscheme")

-- Remove the # from the start of the color strings
-- local colors_stripped = {}
-- for k, v in pairs(colors) do
--     colors_stripped[k] = string.sub(v, 2, -1)
-- end

-- base16.apply_theme(colors_stripped)
base16.setup(colors, { telescope = false })

-- Remove background colors
base16.highlight.Normal = { guibg = "none" }
base16.highlight.NormalNC = { guibg = "none" }
base16.highlight.Conceal = { guibg = "none" }
base16.highlight.Folded = { guibg = "none", guifg = "none" }
base16.highlight.StatusLineNC = { guibg = "none", guifg = "none" }
base16.highlight.NvimTreeNormal = { guibg = "none" }
base16.highlight.NvimTreeStatusLineNC = { guibg = "none" }
base16.highlight.NvimTreeVertSplit = { guibg = "none" }
base16.highlight.NvimTreeNormal = { guibg = "none" }
base16.highlight.DiffAdded = { guibg = "none" }
base16.highlight.DiffChange = { guibg = "none" }
base16.highlight.DiffRemoved = { guibg = "none" }
base16.highlight.SignColumn = { guibg = "none" }
base16.highlight.LineNr = { guibg = "none" }

-- Tweaks
base16.highlight.StatusLineNC = { gui = "underline" }
base16.highlight.FloatBorder = { guibg = colors.base00 }
