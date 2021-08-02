local o = vim.opt

-- Appearance
o.cmdheight = 1
o.colorcolumn = "80"
o.cursorline = false
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 99
o.number = true
o.relativenumber = true
o.ruler = false
o.showmode = false
o.signcolumn = "yes"
o.termguicolors = true -- Required by colorizer
o.wrap = true

-- Backups
o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = true
-- o.autoread = true -- Automatically read a file when it has been changed from outside vim

-- Completion
o.completeopt = "menuone,noselect"
o.pumblend = 0 -- Popup menu transparency
o.pumheight = 64 -- Popup menu height

-- General
o.clipboard = "unnamedplus"
o.hidden = true
o.joinspaces = false
o.mouse = "a"
o.scrolloff = 4
o.splitbelow = true
o.splitright = true
o.timeoutlen = 1000
o.updatetime = 100
o.virtualedit = "block"
-- o.iskeyword = o.iskeyword + '-'

-- Performance
o.lazyredraw = true
o.updatetime = 250

-- Search
o.inccommand = "nosplit" -- show substitutions incrementally
o.ignorecase = true
o.smartcase = true
o.wildignore = {
    "*.pyc",
    ".git",
    "node_modules/",
    "venv/",
    ".venv/",
    ".DS_Store/",
}
o.wildignorecase = true

-- Tabs
o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4

-- Shortmess
o.shortmess = o.shortmess
    + {
        A = true, -- don't give the "ATTENTION" message when an existing swap file is found.
        I = true, -- don't give the intro message when starting Vim |:intro|.
        W = true, -- don't give "written" or "[w]" when writing a file
        c = true, -- don't give |ins-completion-menu| messages
        m = true, -- use "[+]" instead of "[Modified]"
    }
-- Format options
o.formatoptions = o.formatoptions
    + {
        o = false, -- O and o, don't continue comments
        r = true, -- Pressing Enter will continue comments
    }

-- Python nvim path
vim.g.python3_host_prog = "/usr/bin/python"
