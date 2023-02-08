return {
  "andymass/vim-matchup",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
  end,
}
