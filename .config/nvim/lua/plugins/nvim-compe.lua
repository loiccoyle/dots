require("compe").setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "always", -- 'enable' / 'always'
    documentation = {
        -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- the border option is the same as `|help nvim_open_win|`
        border = "rounded", -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = math.floor(vim.o.columns * 0.5),
        min_width = math.floor(vim.o.columns * 0.2),
        max_height = math.floor(vim.o.lines * 0.7),
        min_height = 1,
    },
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        luasnip = true,
        emoji = true,
        nvim_lua = false,
        vsnip = false,
        ultisnips = false,
    },
})

-- Utility functions for compe and luasnip
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
local luasnip = require("luasnip")

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t("<C-n>")
    elseif luasnip.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t("<Tab>")
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t("<C-p>")
    elseif luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    else
        return t("<S-Tab>")
    end
end

local map = require("utils").keymap.map
map("i", "<Tab>", "v:lua.tab_complete()", { expr = true, noremap = false })
map("s", "<Tab>", "v:lua.tab_complete()", { expr = true, noremap = false })
map("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true, noremap = false })
map("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true, noremap = false })
map("i", "<C-Space>", "compe#complete()", { expr = true })
map("i", "<C-e>", "compe#close()", { expr = true })
-- map("i", "<CR>", 'compe#confirm("<CR>")', { expr = true })
