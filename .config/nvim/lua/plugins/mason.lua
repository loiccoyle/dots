return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "black",
      "isort",
      "prettier",
      "rustfmt",
    },
  },
}
