local colors = require("config.base16-colors")
local keymaps = require("config.keymaps")

return {
  "echasnovski/mini.base16",
  opts = { palette = colors },
  config = function(_, opts)
    require("mini.base16").setup(opts)
  end,
  dependencies = {
    "xiyaowong/nvim-transparent",
    keys = keymaps.transparent,
    opts = {
      enable = true,
      extra_groups = {
        "FloatBorder",
        "DiagnosticFloatingError",
        "DiagnosticFloatingWarn",
        "DiagnosticFloatingInfo",
        "DiagnosticFloatingHint",
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
      },
    },
  },
}
