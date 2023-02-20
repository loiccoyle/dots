return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    ---@diagnostic disable-next-line: missing-parameter
    opts.ensure_installed = vim.list_extend(opts.ensure_installed, {
      "black",
      "isort",
      "prettier",
      "rustfmt",
    })
    -- remove flake8
    opts.ensure_installed = vim.tbl_filter(function(ls)
      return ls ~= "flake8"
    end, opts.ensure_installed)
  end,
}
