return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("gruvbox").load()
      end,
    },
  },
  -- replace with Comment.nvim
  { "echasnovski/mini.comment", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },
}
