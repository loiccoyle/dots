-- https://github.com/windwp/nvim-autopairs
require("nvim-autopairs").setup({ check_ts = false, fast_wrap = {} })
require("nvim-autopairs.completion.compe").setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
})
