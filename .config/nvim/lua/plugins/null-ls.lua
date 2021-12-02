local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.shfmt.with({ extra_args = { "-i", "4" } }),
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.code_actions.gitsigns,
}

null_ls.config({ sources = sources })
