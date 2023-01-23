return {
  "folke/noice.nvim",
  opts = {
    routes = {
      -- remove code_action spam in mini view
      {
        view = "mini",
        filter = { event = "lsp", kind = "progress", find = "code_action" },
        opts = { skip = true },
      },
    },
  },
}
