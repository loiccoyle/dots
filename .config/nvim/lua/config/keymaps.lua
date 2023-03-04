vim.keymap.set("i", "<C-BS>", "<C-W>")
vim.keymap.set("i", "<C-h>", "<C-W>")
vim.keymap.set("n", "Y", "y$", { desc = "Yank to EOL" })
vim.keymap.set("n", "yil", "0y$", { desc = "Yank in Line" })

-- inset mode navigation
vim.keymap.set("i", "<A-h>", "<left>")
vim.keymap.set("i", "<A-j>", "<down>")
vim.keymap.set("i", "<A-k>", "<up>")
vim.keymap.set("i", "<A-l>", "<right>")

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

M.telescope = {
  {
    "<leader>fp",
    function()
      require("telescope.builtin").find_files({
        cwd = require("lazy.core.config").options.root,
      })
    end,
    desc = "Find Plugin File",
  },
}

M.transparent = {
  { "<leader>ut", "<cmd>TransparentToggle<CR>" },
}

M.symbols_outline = {
  { "<leader>cs", "<cmd>SymbolsOutline<CR>", desc = "Symbols Outline" },
}

M.ufo = {
  {
    "zR",
    function()
      require("ufo").openAllFolds()
    end,
    desc = "Open all folds (UFO)",
  },
  {
    "zM",
    function()
      require("ufo").closeAllFolds()
    end,
    desc = "Close all folds (UFO)",
  },
}

-- Extra toggles
M.colorizer = {
  { "<leader>uk", "<cmd>ColorizerToggle<CR>", desc = "Colorizer Toggle" },
}

M.dap = function()
  vim.keymap.set("n", "<leader>cd", require("dapui").toggle, { desc = "DAP UI" })
  vim.keymap.set("n", "<leader>cb", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint" })
  vim.keymap.set("n", "<F5>", require("dap").continue, { desc = "DAP Continue" })
  vim.keymap.set("n", "<F10>", require("dap").step_over, { desc = "DAP Step Over" })
  vim.keymap.set("n", "<F11>", require("dap").step_into, { desc = "DAP Step Into" })
  vim.keymap.set("n", "<F12>", require("dap").step_out, { desc = "DAP Step Out" })
end

return M
