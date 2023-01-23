return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- require("mini.base16")
        require("gruvbox").load()
      end,
    },
  },
  -- replaced with Comment.nvim
  { "echasnovski/mini.comment", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },
}
