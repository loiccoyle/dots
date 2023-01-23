return {
  "glacambre/firenvim",
  enable = false,
  lazy = false,
  run = function()
    vim.fn["firenvim#install"](0)
  end,
}
