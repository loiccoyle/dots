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
      tsserver = {},
      rust_analyzer = {},
      yamlls = {},
    },
  },
}
