-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/kabouzeid/nvim-lspinstall
local lspconfig = require("lspconfig")
local lspinstall = require("lspinstall")
local languages = require("plugins.nvim-lspconfig.format")
local on_attach = require("plugins.nvim-lspconfig.on-attach")

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- symbols for completion
vim.lsp.protocol.CompletionItemKind = {
    "  (Text)",
    "  (Method)",
    "  (Function)",
    "  (Constructor)",
    "ﴲ  (Field)",
    "  (Variable)",
    "  (Class)",
    "ﰮ  (Interface)",
    "  (Module)",
    "襁 (Property)",
    "  (Unit)",
    "  (Value)",
    "練 (Enum)",
    "  (Keyword)",
    "  (Snippet)",
    "  (Color)",
    "  (File)",
    "  (Reference)",
    "  (Folder)",
    "  (EnumMember)",
    "ﲀ  (Constant)",
    "ﳤ  (Struct)",
    "  (Event)",
    "  (Operator)",
    "  (TypeParameter)",
}

local servers = {
    efm = {
        init_options = { documentFormatting = true, codeAction = true },
        root_dir = lspconfig.util.root_pattern({ ".git/", "." }),
        filetypes = vim.tbl_keys(languages),
        settings = { languages = languages, log_level = 1, log_file = "~/efm.log" },
    },
    lua = {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim", "packer_plugins" } },
                completion = { keywordSnippet = "Both" },
                runtime = { version = "LuaJIT", path = runtime_path },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    -- library = {
                    --     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    --     [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    -- },
                },
                telemetry = { enable = false },
            },
        },
    },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
}

-- configure LSP servers
local function setup_servers()
    lspinstall.setup()
    local installed = lspinstall.installed_servers()
    for _, server in pairs(installed) do
        local config = servers[server] or { root_dir = lspconfig.util.root_pattern({ ".git/", "." }) }
        config.capabilities = capabilities
        config.on_attach = on_attach
        lspconfig[server].setup(config)
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e")
end

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Appearance
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
})
vim.cmd([[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics{focusable=false, border="rounded"}]])

-- Enable type inlay hints for rust lsp_extensions
vim.cmd(
    [[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }]]
)
