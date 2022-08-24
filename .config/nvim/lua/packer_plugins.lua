local present, required_bootstrap = pcall(require, "packer_init")
local packer

if present then
    packer = require("packer")
else
    return false
end

return packer.startup(function(use)
    -- Plugin Manager
    use({ "wbthomason/packer.nvim" })
    -- Colorscheme
    use({
        "RRethy/nvim-base16",
        config = function()
            require("plugins.nvim-base16")
        end,
    })
    -- Completion menu
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.nvim-cmp")
        end,
        event = { "InsertEnter", "CmdLineEnter" },
        requires = {
            { "onsails/lspkind-nvim", module = "lspkind" },
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            {
                "hrsh7th/cmp-nvim-lsp",
                after = "nvim-cmp",
                module = "cmp_nvim_lsp",
            },
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            { "hrsh7th/cmp-calc", after = "nvim-cmp" },
            { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
            { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
            {
                "L3MON4D3/LuaSnip",
                module = "luasnip",
                config = function()
                    require("luasnip").config.setup({
                        history = true,
                    })
                    require("luasnip/loaders/from_vscode").lazy_load()
                end,
                wants = "friendly-snippets",
                after = "nvim-cmp",
            },
            { "rafamadriz/friendly-snippets", module = "friendly-snippets" },
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("nvim-autopairs").setup()
                end,
                module = "nvim-autopairs",
            },
        },
    })
    -- Top bar
    use({
        "akinsho/bufferline.nvim",
        config = function()
            require("plugins.bufferline")
        end,
        event = "BufReadPre",
        requires = {
            {
                "famiu/bufdelete.nvim",
                module = "bufdelete",
                cmd = "Bdelete",
                setup = function()
                    require("mappings").bufdelete()
                end,
            },
            { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
        },
        setup = function()
            require("mappings").bufferline()
        end,
    })
    -- Statusline
    use({
        "NTBBloodbath/galaxyline.nvim",
        requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
        config = function()
            require("plugins.galaxyline")
        end,
        after = "nvim-base16",
    })
    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.nvim-treesitter")
        end,
        requires = {
            { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
            { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
            { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
            { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
            -- { "RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter" },
        },
    })
    -- Lsp
    use({
        {
            "jose-elias-alvarez/null-ls.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("plugins.null-ls")
            end,
            requires = {
                { "nvim-lua/plenary.nvim", module = "plenary" },
                { "neovim/nvim-lspconfig", module = "lspconfig" },
            },
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                require("plugins.nvim-lspconfig")
            end,
            -- event = { "BufReadPre", "BufNewFile" },
            requires = {
                { "williamboman/mason.nvim", module = "mason" },
                { "williamboman/mason-lspconfig.nvim", module = "mason-lspconfig" },
                -- { "WhoIsSethDaniel/mason-tool-installer.nvim", module = "mason-tool-installer" },
                { "jose-elias-alvarez/nvim-lsp-ts-utils", module = "nvim-lsp-ts-utils" },
                { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
                { "nvim-lua/lsp_extensions.nvim", module = "lsp_extensions" },
                { "onsails/lspkind-nvim", module = "lspkind" },
                { "ray-x/lsp_signature.nvim", module = "lsp_signature" },
            },
        },
        {
            "kosayoda/nvim-lightbulb",
            event = { "CursorHold", "CursorHoldI" },
            config = function()
                local au_lightbulb = vim.api.nvim_create_augroup("LightBulb", { clear = true })
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    group = au_lightbulb,
                    callback = function()
                        require("nvim-lightbulb").update_lightbulb({ ignore = { "null-ls" } })
                    end,
                })
            end,
        },
        {
            "folke/trouble.nvim",
            cmd = "Trouble",
            setup = function()
                require("mappings").trouble()
            end,
        },
        {
            "simrat39/symbols-outline.nvim",
            cmd = "SymbolsOutline",
            setup = function()
                require("mappings").symbols_outline()
                vim.g.symbols_outline = { width = 32 }
            end,
        },
    })
    -- use {'glepnir/lspsaga.nvim', config = function() require('plugins.lspsaga-nvim') end}
    -- Colorizer
    use({
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("plugins.nvim-colorizer")
        end,
        setup = function()
            require("mappings").colorizer()
        end,
    })
    -- Cursor stuff
    use({
        "mg979/vim-visual-multi",
        event = "BufRead",
        config = function()
            require("plugins.vim-visual-multi")
        end,
    })
    -- Dashboard
    use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        cond = function()
            -- If no file is provided
            return vim.api.nvim_buf_get_name(0):len() == 0
        end,
        config = function()
            require("alpha").setup(require("alpha.themes.startify").opts)
        end,
    })
    -- File explorer
    use({
        "kyazdani42/nvim-tree.lua",
        module = "nvim-tree",
        config = function()
            require("plugins.nvim-tree")
        end,
        setup = function()
            require("mappings").nvimtree()
        end,
        requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
    })
    -- Git
    use({
        {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("plugins.gitsigns")
            end,
            requires = { "nvim-lua/plenary.nvim", module = "plenary" },
            event = "BufRead",
        },
        {
            "kdheepak/lazygit.nvim",
            cmd = "LazyGit",
            setup = function()
                require("mappings").lazygit()
            end,
        },
        {
            "sindrets/diffview.nvim",
            cmd = { "DiffviewOpen", "DiffviewToggleFiles", "DiffviewClose", "DiffviewRefresh", "DiffviewFocusFiles" },
            config = function()
                require("diffview.nvim").setup({})
            end,
            disable = true,
        },
    })
    -- Indentline
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                char = "▏",
                show_current_context = true,
                show_first_indent_level = false,
                show_trailing_blankline_indent = false,
                filetype_exclude = {
                    "help",
                    "NvimTree",
                    "alpha",
                    "packer",
                    "TelescopePrompt",
                },
                buftype_exclude = { "terminal" },
            })
        end,
        event = "BufRead",
    })
    -- Profiling
    use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })
    -- Scrolling
    -- use({
    --     "karb94/neoscroll.nvim",
    --     event = "WinScrolled",
    --     config = function()
    --         require("neoscroll").setup({ easing_function = nil })
    --     end,
    -- })
    -- Telescope (requires rg)
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/popup.nvim", module = "popup" },
            { "nvim-lua/plenary.nvim", module = "plenary" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            { "nvim-telescope/telescope-ui-select.nvim" },
        },
        --[[ module = "telescope",
        cmd = "Telescope", ]]
        config = function()
            require("plugins.telescope")
            require("mappings").telescope()
        end,
    })
    -- use {'junegunn/fzf'}
    -- use {'junegunn/fzf.vim'}
    -- Terminal
    -- use {
    --   'akinsho/nvim-toggleterm.lua',
    --   config = function() require('plugins.nvim-toggleterm') end,
    --   keys = '<C-t>'
    -- }
    -- comment
    use({
        "numToStr/Comment.nvim",
        event = "BufRead",
        config = function()
            require("plugins.comment")
        end,
        requires = {
            { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
        },
    })
    -- tpope
    use({
        { "tpope/vim-surround", event = "BufRead" }, -- Surround actions
        { "tpope/vim-unimpaired", event = "BufRead" }, -- Adds a bunch of bracket mappings see ':help unimpaired'
        { "tpope/vim-sleuth", event = "BufRead" }, -- Adapt tab size based on file and context
        { "tpope/vim-repeat", event = "BufRead" }, -- . repeats more stuff
    })
    -- Which Key
    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end,
        setup = function()
            require("mappings").whichkey()
        end,
        event = "BufRead",
    })
    -- Vimwiki
    -- Lazy loading this breaks my vimwiki alias:
    -- $ vim +VimwikiIndex
    use({
        "vimwiki/vimwiki",
        config = function()
            require("plugins.vimwiki")
        end,
    })
    -- Zen mode
    -- use({ "Pocco81/TrueZen.nvim", cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist" } })
    -- Extra Syntaxes
    use({
        { "kovetskiy/sxhkd-vim", event = "BufEnter sxhkdrc" },
        { "zdharma-continuum/zinit-vim-syntax", event = "BufEnter .zshrc" },
        -- { "elkowar/yuck.vim", event = "BufEnter *.yuck" },
    })
    -- Debuging
    -- requires lldb
    use({
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        config = function()
            require("dapui").setup({})
            require("mappings").dap()
        end,
    })
    -- Language specific plugins
    use({
        {
            -- currently somewhat broken, see:
            -- https://github.com/simrat39/rust-tools.nvim/issues/124
            "simrat39/rust-tools.nvim",
            requires = {
                { "neovim/nvim-lspconfig", module = "lspconfig" },
                { "nvim-lua/plenary.nvim", module = "plenary" },
            },
        },
        {
            "akinsho/flutter-tools.nvim",
            ft = { "dart" },
            requires = { "nvim-lua/plenary.nvim", module = "plenary" },
        },
    })

    -- Autoinstall/compile plugins if bootstrap occurred
    if required_bootstrap then
        -- these slow statup, hence the if
        packer.install()
        packer.compile()
    end
end)
