-- https://github.com/glepnir/lspsaga.nvim
local utils = require("utils")
local signature = require("lsp_signature")

local function nmap(key, cmd, opts)
    utils.keymap.buf_map("n", key, cmd, opts)
end
local function lua_nmap(key, cmd, opts)
    nmap(key, "<cmd>lua  " .. cmd .. "<CR>", opts)
end

-- All of these are buffer mappings
local function mappings()
    lua_nmap("<space>d", "vim.lsp.buf.definition()")
    lua_nmap("<space>D", "vim.lsp.buf.declaration()")
    lua_nmap("<space>i", "vim.lsp.buf.implementation()")
    lua_nmap("<space>r", "vim.lsp.buf.references()")
    lua_nmap("<space>a", "vim.lsp.buf.code_action()")
    lua_nmap("<space>h", "vim.lsp.buf.signature_help()")
    lua_nmap("<space>f", "vim.lsp.buf.formatting()")
    lua_nmap("<space>R", "vim.lsp.buf.rename()")
    lua_nmap("<space>k", "vim.lsp.buf.signature_help()")
    lua_nmap("K", "vim.lsp.buf.hover()")
    lua_nmap("]d", "vim.diagnostic.goto_next()")
    lua_nmap("[d", "vim.diagnostic.goto_prev()")
    lua_nmap("]D", "vim.diagnostic.goto_next({wrap = false})")
    lua_nmap("[D", "vim.diagnostic.goto_prev({wrap = false})")
    -- lspsaga
    -- lua_nmap('K', 'require("lspsaga.hover").render_hover_doc()')
    -- lua_nmap('<space>a', 'require("lspsaga.codeaction").code_action()')
    -- lua_nmap('<space>H', 'require("lspsaga.provider").lsp_finder()')
    -- lua_nmap('<space>R', 'require("lspsaga.rename").rename()')
    -- lua_nmap('[d', 'require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()')
    -- lua_nmap(']d', 'require"lspsaga.diagnostic".lsp_jump_diagnostic_next()')
end
-- -- Border settings
-- vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
-- vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

-- LSP settings
return function(client, buffnr)
    mappings()
    -- if client.config.flags then client.config.flags.allow_incremental_sync = true end

    -- So that the only client with format capabilities is null-ls
    if client.name ~= "null-ls" then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end
    --[[ if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end ]]
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
