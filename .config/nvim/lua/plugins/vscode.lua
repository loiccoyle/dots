-- Disable a bunch of plugins for vscode integration
---@diagnostic disable-next-line: undefined-field
if vim.g.vscode then
  vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, remap = true })
  vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, remap = true })
  -- Clear search with <esc>
  vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>")
  -- better indenting
  vim.keymap.set("v", "<", "<gv")
  vim.keymap.set("v", ">", ">gv")

  vim.keymap.set({ "n", "x" }, "gw", "*N")

  vim.keymap.set("n", "<C-h>", "<C-w>h", { remap = true })
  vim.keymap.set("n", "<C-j>", "<C-w>j", { remap = true })
  vim.keymap.set("n", "<C-k>", "<C-w>k", { remap = true })
  vim.keymap.set("n", "<C-l>", "<C-w>l", { remap = true })

  vim.keymap.set("n", "<S-h>", "gT", { remap = true })
  vim.keymap.set("n", "<S-l>", "gt", { remap = true })

  return {
    { "hrsh7th/nvim-cmp", enabled = false },
    { "neovim/nvim-lspconfig", enabled = false },
    { "nvim-neo-tree/neo-tree.nvim", enabled = false },
    { "akinsho/bufferline.nvim", enabled = false },
    { "nvim-lualine/lualine.nvim", enabled = false },
    { "nvim-telescope/telescope.nvim", enabled = false },
    { "folke/noice.nvim", enabled = false },
    { "mg979/vim-visual-multi", enabled = false },
    { "zbirenbaum/copilot.lua", enabled = false },
    { "jose-elias-alvarez/null-ls.nvim", enabled = false },
    { "simrat39/symbols-outline.nvim", enabled = false },
    { "ellisonleao/gruvbox.nvim", enabled = false },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.highlight = { enabled = false }
        opts.rainbow = { enable = false }
        opts.matchup = { enable = false }
      end,
    },
    { "kevinhwang91/nvim-ufo", enabled = false },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = function() end,
        defaults = {
          keymaps = false, -- lazyvim.config.keymaps
        },
      },
    },
    { "Darazaki/indent-o-matic", enabled = false },
    { "rcarriga/nvim-notify", enabled = false },
    { "simrat39/rust-tools.nvim", enabled = false },
    { "Saecki/crates.nvim", enabled = false },
    { "windwp/nvim-autopairs", enabled = false },
  }
else
  return {}
end
