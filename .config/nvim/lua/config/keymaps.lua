vim.keymap.set("i", "<C-BS>", "<C-W>")
vim.keymap.set("i", "<C-h>", "<C-W>")
vim.keymap.set("n", "yil", "0y$", { desc = "Yank in Line" })

-- Replace
vim.keymap.set("n", "R", ":%s//g<Left><Left>", { desc = "Replace in file" })

-- bufferline
vim.keymap.set("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to Buffer 1" })
vim.keymap.set("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to Buffer 2" })
vim.keymap.set("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to Buffer 3" })
vim.keymap.set("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to Buffer 4" })
vim.keymap.set("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to Buffer 5" })
vim.keymap.set("n", "<A-6>", "<cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to Buffer 6" })
vim.keymap.set("n", "<A-7>", "<cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to Buffer 7" })
vim.keymap.set("n", "<A-8>", "<cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to Buffer 8" })
vim.keymap.set("n", "<A-9>", "<cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to Buffer 9" })

vim.keymap.set("n", "<leader>?", "<cmd>WhichKey<CR>", { desc = "WhichKey" })

-- save with sudo
vim.cmd([[cab w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]])

-- Plugin related mappings
local M = {}

M.transparent = {
  { "<leader>ut", "<cmd>TransparentToggle<CR>" },
}

return M
