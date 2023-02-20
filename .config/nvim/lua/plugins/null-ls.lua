return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    ---@diagnostic disable-next-line: missing-parameter
    opts.sources = vim.list_extend(opts.sources, {
      nls.builtins.formatting.isort,
      nls.builtins.formatting.black,
      nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
      nls.builtins.formatting.prettier,
      nls.builtins.formatting.shfmt.with({ extra_args = { "-i", "4" } }),
      nls.builtins.formatting.rustfmt,
      -- nls.builtins.diagnostics.shellcheck,
      nls.builtins.code_actions.shellcheck,
      nls.builtins.code_actions.gitsigns,
    })
    opts.sources = vim.tbl_filter(function(source)
      return source.name ~= "flake8"
    end, opts.sources)
  end,
}
