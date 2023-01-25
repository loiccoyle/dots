local keymaps = require("config.keymaps")

return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async", "nvim-treesitter/nvim-treesitter" },
  event = "BufReadPost",
  keys = keymaps.ufo,
  opts = {
    ---@diagnostic disable-next-line: unused-local
    provider_selector = function(_, filetype, buftype)
      return { "treesitter", "indent" }
    end,
    open_fold_hl_timeout = 0,
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ("(%d lines) "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local hlGroup = chunk[2]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)

        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          table.insert(newVirtText, { chunkText, hlGroup })

          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end

        curWidth = curWidth + chunkWidth
      end

      if curWidth < width then
        suffix = "  " .. (" "):rep(width - curWidth - sufWidth - 3) .. suffix
      end

      table.insert(newVirtText, { suffix, "Todo" })
      return newVirtText
    end,
    preview = {
      win_config = {
        winblend = 0,
        winhighlight = "Normal:LazyNormal",
        border = "none",
      },
    },
  },
}
