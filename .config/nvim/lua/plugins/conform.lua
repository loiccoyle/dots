return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters = {
      shfmt = { prepend_args = { "-i", "4" } },
    }
    return opts
  end,
}
