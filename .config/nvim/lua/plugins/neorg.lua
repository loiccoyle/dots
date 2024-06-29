return {
  "nvim-neorg/neorg",
  dependencies = { "vhyrro/luarocks.nvim", config = true },
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.completion"] = {
        config = { engine = "nvim-cmp" },
      },
      ["core.integrations.nvim-cmp"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            home = "~/documents/notes/home",
            work = "~/documents/notes/work",
          },
        },
      },
    },
  },
}
