local colors = require("config.base16-colors")
local keymaps = require("config.keymaps")

-- do some color swapping
local red = colors.base08
local blue = colors.base0D
colors.base08 = blue
colors.base0D = red

return {
  "echasnovski/mini.base16",
  lazy = true,
  opts = { palette = colors },
  config = function(_, opts)
    require("mini.base16").setup(opts)
  end,
  dependencies = {
    "xiyaowong/nvim-transparent",
    keys = keymaps.transparent,
    opts = {
      extra_groups = {
        "FloatBorder",
        "DiagnosticFloatingError",
        "DiagnosticFloatingWarn",
        "DiagnosticFloatingInfo",
        "DiagnosticFloatingHint",
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
        "ColorColumn",
        "FoldColumn",
        "CursorLineSign",
        "LineNrBelow",
        "LineNrAbove",
      },
    },
  },
}
