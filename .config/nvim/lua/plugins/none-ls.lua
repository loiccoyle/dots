return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    local extra_sources = {
      nls.builtins.formatting.prettier,
      nls.builtins.formatting.rustfmt,
      -- nls.builtins.diagnostics.shellcheck,
      nls.builtins.code_actions.shellcheck,
      nls.builtins.code_actions.gitsigns,
    }
    --expand tab specific
    if vim.opt.expandtab then
      table.insert(extra_sources, nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }))
      table.insert(extra_sources, nls.builtins.formatting.shfmt.with({ extra_args = { "-i", "4" } }))
    else
      table.insert(extra_sources, nls.builtins.formatting.stylua)
      table.insert(extra_sources, nls.builtins.formatting.shfmt)
    end
    ---@diagnostic disable-next-line: missing-parameter
    opts.sources = vim.list_extend(opts.sources, extra_sources)
  end,
}
