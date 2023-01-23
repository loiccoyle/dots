-- Leade
-- vim.g.mapleader = ","
-- vim.g.maplocalleader = ","
-- Folds
vim.opt.termguicolors = true -- Required by colorizer
vim.opt.wrap = true
-- Folds
vim.opt.foldcolumn = "0" -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
-- Tabs
-- vim.opt.expandtab = false
-- vim.opt.shiftwidth = 4
-- vim.opt.softtabstop = 4
-- vim.opt.tabstop = 4
vim.opt.shortmess = vim.opt.shortmess
  + {
    a = true, -- All abreviations
    s = true, -- No search top bottom msgs
    I = true, -- No intro msg
  }
-- vim.opt.formatoptions = vim.opt.formatoptions + {
--   r = false, -- Pressing Enter will continue comments
--   o = false,
-- }
vim.opt.formatoptions = "jcqlnt" -- tcqj
-- Python nvim path
-- vim.g.python3_host_prog = "/usr/bin/python"
