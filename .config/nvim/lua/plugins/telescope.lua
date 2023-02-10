local keymaps = require("config.keymaps")
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  keys = keymaps.telescope,
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("notify")
    require("telescope").load_extension("fzf")
  end,
}
