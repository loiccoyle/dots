return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.rainbow = { enable = true, extended_mode = true }
    opts.matchup = { enable = true }
    vim.list_extend(opts.ensure_installed, {
      "bibtex",
      "c",
      "cmake",
      "comment",
      "cpp",
      "css",
      "diff",
      "dockerfile",
      "gitignore",
      "glsl",
      "go",
      "latex",
      "make",
      "rasi",
      "rust",
      "toml",
    })
  end,
  dependencies = {
    { "mrjones2014/nvim-ts-rainbow" },
    {
      "andymass/vim-matchup",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
      end,
    },
  },
}
