return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      right_mouse_command = "vertical sbuffer %d",
      middle_mouse_command = function(n)
        local snacks = require("snacks")
        snacks.bufdelete(n)
      end,
    },
  },
}
