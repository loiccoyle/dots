return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = { window = { width = 32 } },
  dependencies = {
    {
      "s1n7ax/nvim-window-picker",
      config = function()
        require("window-picker").setup({
          filter_rules = {
            bo = { filetype = { "neo-tree", "neo-tree-popup", "notify" }, buftype = { "terminal", "quickfix" } },
          },
        })
      end,
    },
  },
}
