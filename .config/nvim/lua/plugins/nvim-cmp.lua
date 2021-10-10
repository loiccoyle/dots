local cmp = require("cmp")
local lspkind = require("lspkind")

-- Utility functions for compe and luasnip
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
local luasnip = require("luasnip")

local tab_complete = function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
    elseif check_back_space() then
        vim.fn.feedkeys(t("<tab>"), "n")
    else
        fallback()
    end
end

local s_tab_complete = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
    else
        fallback()
    end
end

cmp.setup({
    formatting = {
        format = function(_, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
            return vim_item
        end,
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    -- You must set mapping if you want.
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        -- ["<CR>"] = cmp.mapping.confirm({
        --     behavior = cmp.ConfirmBehavior.Insert,
        --     select = true,
        -- }),
        ["<TAB>"] = cmp.mapping(tab_complete, { "i", "s" }),
        ["<S-TAB>"] = cmp.mapping(s_tab_complete, { "i", "s" }),
    },

    -- You should specify your *installed* sources.
    sources = {
        { name = "buffer" },
        { name = "path" },
        { name = "calc" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
    },
})

-- Setup buffer configuration (nvim-lua source only enables in Lua filetype).
vim.cmd([[
autocmd FileType lua lua require'cmp'.setup.buffer {sources={{name="buffer"}, {name="path"}, {name="calc"}, {name="luasnip"}, {name="nvim_lsp"}, {name='nvim_lua'}}}
]])
