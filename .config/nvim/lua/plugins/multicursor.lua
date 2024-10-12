return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  event = "VeryLazy",
  keys = {
    {
      "<Esc>",
      function()
        local mc = require("multicursor-nvim")
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        elseif mc.hasCursors() then
          mc.clearCursors()
        else
          -- Default <esc> handler.
          vim.cmd([[noh]])
        end
      end,
      desc = "Clear cursors",
    },
    -- Add or skip cursor above/below the main cursor.
    {
      "<C-S-Up>",
      function()
        require("multicursor-nvim").lineAddCursor(-1)
      end,
      mode = { "n", "v" },
      desc = "Add cursor above",
    },
    {
      "<C-S-Down>",
      function()
        require("multicursor-nvim").lineAddCursor(1)
      end,
      mode = { "n", "v" },
      desc = "Add cursor below",
    },
    -- Add or skip adding a new cursor by matching word/selection
    {
      "<C-n>",
      function()
        require("multicursor-nvim").matchAddCursor(1)
      end,
      mode = { "n", "v" },
      desc = "Add cursor by match",
    },
    {
      "<C-q>",
      function()
        require("multicursor-nvim").matchSkipCursor(1)
      end,
      mode = { "n", "v" },
      desc = "Skip match and add cursor",
    },
    {
      "<C-S-N>",
      function()
        require("multicursor-nvim").matchAddCursor(-1)
      end,
      mode = { "n", "v" },
      desc = "Add cursor by previous match",
    },
    {
      "<C-S-Q>",
      function()
        require("multicursor-nvim").matchSkipCursor(-1)
      end,
      mode = { "n", "v" },
      desc = "Skip previous match and add cursor",
    },

    { "<leader>m", "", desc = "+multicursor", mode = { "n", "v" } },
    -- You can also add cursors with any motion you prefer
    {
      "<leader>mw",
      function()
        require("multicursor-nvim").addCursor("w")
      end,
      mode = "n",
      desc = "Add cursor with 'w' motion",
    },
    {
      "<leader>mb",
      function()
        require("multicursor-nvim").addCursor("b")
      end,
      mode = "n",
      desc = "Add cursor with 'b' motion",
    },
    -- Rotate the main cursor
    {
      "<left>",
      function()
        require("multicursor-nvim").prevCursor()
      end,
      mode = { "n", "v" },
      desc = "Move to previous cursor",
    },
    {
      "<right>",
      function()
        require("multicursor-nvim").nextCursor()
      end,
      mode = { "n", "v" },
      desc = "Move to next cursor",
    },
    -- Delete the main cursor
    {
      "<C-x>",
      function()
        require("multicursor-nvim").deleteCursor()
      end,
      mode = { "n", "v" },
      desc = "Delete main cursor",
    },
    -- Add and remove cursors with control + left click
    {
      "<c-leftmouse>",
      function()
        require("multicursor-nvim").handleMouse()
      end,
      mode = "n",
      desc = "Add/remove cursor with mouse",
    },
    -- Easy way to add and remove cursors using the main cursor
    {
      "<A-q>",
      function()
        require("multicursor-nvim").toggleCursor()
      end,
      mode = { "n", "v" },
      desc = "Toggle cursor",
    },
    -- Bring back cursors if you accidentally clear them
    {
      "<leader>mv",
      function()
        require("multicursor-nvim").restoreCursors()
      end,
      mode = "n",
      desc = "Restore cursors",
    },
    -- Append/insert for each line of visual selections
    {
      "I",
      function()
        require("multicursor-nvim").insertVisual()
      end,
      mode = "v",
      desc = "Insert at visual selection",
    },
    {
      "A",
      function()
        require("multicursor-nvim").appendVisual()
      end,
      mode = "v",
      desc = "Append at visual selection",
    },
    -- Rotate visual selection contents
    {
      "<C-t>",
      function()
        require("multicursor-nvim").transposeCursors(1)
      end,
      mode = "v",
      desc = "Rotate visual selection contents",
    },
    -- Jumplist support
    {
      "<c-i>",
      function()
        require("multicursor-nvim").jumpForward()
      end,
      mode = { "n", "v" },
      desc = "Jump forward in jumplist",
    },
    {
      "<c-o>",
      function()
        require("multicursor-nvim").jumpBackward()
      end,
      mode = { "n", "v" },
      desc = "Jump backward in jumplist",
    },
  },
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()
    -- Customize how cursors look
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { link = "Cursor" })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
