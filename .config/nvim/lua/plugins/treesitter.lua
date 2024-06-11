return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
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
      "glsl",
      "go",
      "latex",
      "make",
      "rasi",
      "rust",
      "toml",
    })
  end,
}
