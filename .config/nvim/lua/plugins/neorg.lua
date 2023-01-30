return {
  "nvim-neorg/neorg",
  ft = "norg",
  cmd = "Neorg",
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.norg.completion"] = {
        config = { engine = "nvim-cmp" },
      },
      ["core.integrations.nvim-cmp"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            home = "~/documents/notes/home",
            work = "~/documents/notes/work",
          },
        },
      },
    },
  },
  dependencies = { { "nvim-lua/plenary.nvim" } },
}
