-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/nvim-lsp-installer
local lspconfig = require("lspconfig")
local on_attach = require("plugins.nvim-lspconfig.on-attach")
local utils = require("utils")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
-- local mason_tool_installer = require("mason-tool-installer")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup()
mason_lsp.setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        -- "dartls",
        "dockerls",
        "html",
        "jsonls",
        "pyright",
        "rust_analyzer",
        "sumneko_lua",
        "tsserver",
    },
})
-- mason_tool_installer.setup({
--     ensure_installed = {
--         "stylua",
--         "shellcheck",
--         "shfmt",
--         "isort",
--         "black",
--         "prettier",
--         "eslint_d",
--     },
-- })

local opts = { on_attach = on_attach, capabilities = capabilities }
mason_lsp.setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        lspconfig[server_name].setup(opts)
    end,
    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function()
        if utils.prequire("rust-tools") then
            require("rust-tools").setup({ server = opts, tools = { hover_actions = { auto_focus = true } } })
        end
    end,
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
    end,
    -- ["dartls"] = function()
    --     if utils.prequire("rust-tools") then
    --         require("flutter-tools").setup(opts)
    --     end
    -- end,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Appearance
vim.diagnostic.config({ virtual_text = false, float = { focusable = false, border = "rounded" } })
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(0, {scope="line"})]])
