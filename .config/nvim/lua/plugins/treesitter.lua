return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.rainbow = { enable = true, disable = { "html" } }
    opts.matchup = { enable = true, disable = { "sh", "bash" } }
    ---@diagnostic disable-next-line: missing-parameter
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
    { "HiPhish/nvim-ts-rainbow2" },
    {
      "andymass/vim-matchup",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
      end,
    },
  },
}
