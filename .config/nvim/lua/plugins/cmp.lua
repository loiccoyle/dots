return {
  "hrsh7th/nvim-cmp",
  enabled = false,
  dependencies = { "hrsh7th/cmp-emoji" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    ---@diagnostic disable-next-line: missing-parameter
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
  end,
}
