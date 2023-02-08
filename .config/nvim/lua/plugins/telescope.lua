local keymaps = require("config.keymaps")
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  keys = keymaps.telescope,
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = function(...)
            require("telescope.actions").move_selection_next(...)
          end,
          ["<C-k>"] = function(...)
            require("telescope.actions").move_selection_previous(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("notify")
    require("telescope").load_extension("fzf")
  end,
}
