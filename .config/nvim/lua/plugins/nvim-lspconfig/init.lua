-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/nvim-lsp-installer
local on_attach = require("plugins.nvim-lspconfig.on-attach")
local lsp_installer = require("nvim-lsp-installer")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- configure LSP servers
lsp_installer.on_server_ready(function(server)
    local servers = {
        sumneko_lua = {
            fyletypes = { "lua" },
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                        },
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                    telemetry = { enable = false },
                },
            },
        },
    }

    local opts = servers[server.name] or { flags = { debounce_text_changes = 500 } }
    opts.capabilities = capabilities
    opts.on_attach = on_attach
    -- I'm not sure why this is required
    opts.filetypes = server:get_supported_filetypes()
    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd([[ do User LspAttachBuffers ]])
end)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Appearance
vim.diagnostic.config({ virtual_text = false, float = { focusable = false, border = "rounded" } })
--[[ vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
}) ]]
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(0, {scope="line"})]])
-- Enable type inlay hints for rust lsp_extensions
vim.cmd(
    [[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }]]
)
