-- https://github.com/numToStr/Comment.nvim

return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
      },
    },
    opts = function()
      return { pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() }
    end,
  },
}
