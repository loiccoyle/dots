return {
  "glacambre/firenvim",
  enabled = false,
  lazy = false,
  run = function()
    vim.fn["firenvim#install"](0)
  end,
}
