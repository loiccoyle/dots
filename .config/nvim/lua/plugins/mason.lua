return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    ---@diagnostic disable-next-line: missing-parameter
    opts.ensure_installed = vim.list_extend(opts.ensure_installed, {
      "prettier",
      "rustfmt",
    })
  end,
}
