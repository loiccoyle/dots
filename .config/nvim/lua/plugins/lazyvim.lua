return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- require("lazy").load({ plugins = { "mini.base16" } })
        require("gruvbox").load()
      end,
    },
  },
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },
}
