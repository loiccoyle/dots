return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      right_mouse_command = "vertical sbuffer %d",
      middle_mouse_command = function(buf_id)
        require("mini.bufremove").delete(buf_id, false)
      end,
    },
  },
}
