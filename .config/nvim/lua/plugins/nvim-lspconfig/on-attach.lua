-- https://github.com/glepnir/lspsaga.nvim
local signature = require("lsp_signature")

-- All of these are buffer mappings
local function mappings()
    vim.keymap.set("n", "<space>d", vim.lsp.buf.definition, { buffer = true })
    vim.keymap.set("n", "<space>D", vim.lsp.buf.declaration, { buffer = true })
    vim.keymap.set("n", "<space>i", vim.lsp.buf.implementation, { buffer = true })
    vim.keymap.set("n", "<space>r", vim.lsp.buf.references, { buffer = true })
    vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, { buffer = true })
    vim.keymap.set("n", "<space>h", vim.lsp.buf.signature_help, { buffer = true })
    -- vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, { buffer = true })
    vim.keymap.set("n", "<space>R", vim.lsp.buf.rename, { buffer = true })
    vim.keymap.set("n", "<space>k", vim.lsp.buf.signature_help, { buffer = true })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = true })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = true })
    vim.keymap.set("n", "]D", function()
        vim.diagnostic.goto_next({ wrap = false })
    end, { buffer = true })
    vim.keymap.set("n", "[D", function()
        vim.diagnostic.goto_prev({ wrap = false })
    end, { buffer = true })
    -- lspsaga
    -- vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc, { buffer = true })
    -- vim.keymap.set("n", "<space>a", require("lspsaga.codeaction").code_action, { buffer = true })
    -- vim.keymap.set("n", "<space>H", require("lspsaga.provider").lsp_finder, { buffer = true })
    -- vim.keymap.set("n", "<space>R", require("lspsaga.rename").rename, { buffer = true })
    -- vim.keymap.set("n", "[d", require("lspsaga.diagnostic").lsp_jump_diagnostic_prev, { buffer = true })
    -- vim.keymap.set("n", "]d", require("lspsaga.diagnostic").lsp_jump_diagnostic_next, { buffer = true })
end
-- -- Border settings
-- vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
-- vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local util = require("vim.lsp.util")

local formatting_callback = function(client, bufnr)
    vim.keymap.set("n", "<space>f", function()
        local params = util.make_formatting_params({})
        client.request("textDocument/formatting", params, nil, bufnr)
    end, { buffer = bufnr })
end

-- LSP settings
return function(client, bufnr)
    mappings()
    -- only allow null-ls to format
    if client.name == "null-ls" then
        formatting_callback(client, bufnr)
    end
    -- Set the border
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

    signature.on_attach({
        bind = true,
        hint_prefix = " ",
        hint_scheme = "String",
        handler_opts = { border = "rounded" },
    })
end
