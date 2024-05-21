return {
  "andymass/vim-matchup",
  enabled = false,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
  end,
}
