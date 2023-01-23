return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        -- nls.builtins.formatting.prettierd,
        nls.builtins.formatting.isort,
        nls.builtins.formatting.black,
        nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.shfmt.with({ extra_args = { "-i", "4", "-ln", "bash" } }),
        nls.builtins.formatting.rustfmt,
        --nls.builtins.diagnostics.eslint_d.with({ extra_args = { "--no-eslintrc" } }),
        --nls.builtins.diagnostics.shellcheck.with({ extra_args = { "-s", "bash" } }),
        nls.builtins.code_actions.gitsigns,
      },
    }
  end,
}
