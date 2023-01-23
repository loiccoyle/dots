return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
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
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("notify")
  end,
}
