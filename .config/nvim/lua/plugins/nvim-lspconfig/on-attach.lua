-- All of these are buffer mappings
local function mappings()
    vim.keymap.set("n", "<space>d", vim.lsp.buf.definition, { buffer = true, desc = "LSP Definition" })
    vim.keymap.set("n", "<space>D", vim.lsp.buf.declaration, { buffer = true, desc = "LSP Declaration" })
    vim.keymap.set("n", "<space>i", vim.lsp.buf.implementation, { buffer = true, desc = "LSP implementation" })
    vim.keymap.set("n", "<space>r", vim.lsp.buf.references, { buffer = true, desc = "LSP References" })
    vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, { buffer = true, desc = "LSP Code Actions" })
    vim.keymap.set("n", "<space>h", vim.lsp.buf.signature_help, { buffer = true, desc = "LSP Signature Help" })
    -- vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, { buffer = true, desc = "LSP Formatting" })
    vim.keymap.set("n", "<space>R", vim.lsp.buf.rename, { buffer = true, desc = "LSP Rename" })
    -- vim.keymap.set("n", "<space>k", vim.lsp.buf.signature_help, { buffer = true, desc = "LSP Signature Help" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true, desc = "LSP Hover" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = true, desc = "Diagnostic Next" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = true, desc = "Diagnostic Prev" })
    vim.keymap.set("n", "]D", function()
        vim.diagnostic.goto_next({ wrap = false })
    end, { buffer = true, desc = "Diagnostic Next No Wrap" })
    vim.keymap.set("n", "[D", function()
        vim.diagnostic.goto_prev({ wrap = false })
    end, { buffer = true, desc = "Diagnostic Prev No Wrap" })
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
    end, { buffer = bufnr, desc = "LSP Formatting" })
end

-- LSP settings
return function(client, bufnr)
    mappings()
    if client.name == "rust_analyzer" and utils.prequire("rust-tools") then
        local rt = require("rust-tools")
        -- Hover actions
        vim.keymap.set(
            "n",
            "<C-space>",
            rt.hover_actions.hover_actions,
            { buffer = bufnr, desc = "Rust Tools Hover Actions" }
        )
    end
    -- only allow null-ls to format
    if client.name == "null-ls" then
        formatting_callback(client, bufnr)
    end
    -- Set the border
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
end
