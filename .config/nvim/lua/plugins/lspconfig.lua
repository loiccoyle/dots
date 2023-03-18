return {
  "neovim/nvim-lspconfig",
  opts = {
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    servers = {
      bashls = {},
      clangd = {},
      cssls = {},
      dockerls = {},
      pyright = {},
      tsserver = {},
      rust_analyzer = {},
      yamlls = {},
      ruff_lsp = {
        --ignore line too long
        init_options = { settings = { args = { "--ignore E501" } } },
      },
    },
  },
}
