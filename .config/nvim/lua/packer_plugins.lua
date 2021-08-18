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
    -- Autopairs
    use({
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function()
            require("plugins.nvim-autopairs")
        end,
    })
    -- Buffer Tabs
    use({
        "akinsho/nvim-bufferline.lua",
        config = function()
            require("plugins.nvim-bufferline")
        end,
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
        after = "nvim-base16",
        setup = function()
            require("mappings").bufferline()
        end,
    })
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
    -- Colorscheme
    use({
        "RRethy/nvim-base16",
        -- event = "VimEnter",
        config = function()
            require("plugins.nvim-base16")
        end,
    })
    -- Completion
    use({
        "hrsh7th/nvim-compe",
        config = function()
            require("plugins.nvim-compe")
        end,
        event = "InsertEnter",
        wants = "LuaSnip",
        requires = {
            {
                "L3MON4D3/LuaSnip",
                event = "InsertCharPre",
                wants = "friendly-snippets",
            },
            { "rafamadriz/friendly-snippets", module = "friendly-snippets" },
        },
    })
    -- Cursor stuff
    use(
        {
            "mg979/vim-visual-multi",
            event = "CursorHold",
            config = function()
                require("plugins.vim-visual-multi")
            end,
        }
        -- { "xiyaowong/nvim-cursorword" }, -- lazy loading this breaks stuff
    )
    -- Dashboard
    use({
        "glepnir/dashboard-nvim",
        config = function()
            require("plugins.dashboard-nvim")
        end,
        requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
        cmd = {
            "Dashboard",
            "DashboardNewFile",
            "DashboardJumpMarks",
            "SessionLoad",
            "SessionSave",
        },
        -- if no file is opened
        cond = function()
            return vim.api.nvim_buf_get_name(0):len() == 0
        end,
    })
    -- File explorer
    use({
        "kyazdani42/nvim-tree.lua",
        module = "nvim-tree",
        setup = function()
            require("plugins.nvim-tree")
            require("mappings").nvimtree()
        end,
    })
    -- Git
    use({
        {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("plugins.gitsigns")
            end,
            setup = function()
                require("mappings").gitsigns()
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
        },
    })
    -- Indentline
    use({
        "lukas-reineke/indent-blankline.nvim",
        setup = function()
            require("plugins.indent-blankline")
        end,
        event = "BufRead",
    })
    -- Lsp
    -- Lazy loading this can cause issues where no LSP clients are attached.
    use({
        {
            "neovim/nvim-lspconfig",
            config = function()
                require("plugins.nvim-lspconfig")
            end,
            requires = {
                { "kabouzeid/nvim-lspinstall", module = "lspinstall" },
                -- { "jose-elias-alvarez/nvim-lsp-ts-utils", module = "nvim-lsp-ts-utils" },
                { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
                { "nvim-lua/lsp_extensions.nvim", module = "lsp_extensions" },
                "ray-x/lsp_signature.nvim", -- Lazy loading this doesn't seem to work
            },
        },
        {
            "kosayoda/nvim-lightbulb",
            event = { "CursorHold", "CursorHoldI" },
            config = function()
                vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
            end,
        },
        {
            "folke/trouble.nvim",
            cmd = "Trouble",
            setup = function()
                require("mappings").trouble()
            end,
        },
    })
    -- use {'glepnir/lspsaga.nvim', config = function() require('plugins.lspsaga-nvim') end}
    -- Profiling
    use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })
    -- Statusline
    use({
        "glepnir/galaxyline.nvim",
        requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
        config = function()
            require("plugins.galaxyline")
        end,
        after = "nvim-base16",
    })
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
            "nvim-telescope/telescope-fzy-native.nvim",
        },
        module = "telescope",
        cmd = "Telescope",
        config = function()
            require("plugins.telescope")
        end,
        setup = function()
            require("mappings").telescope()
        end,
        -- opt = true,
    })
    -- use {'junegunn/fzf'}
    -- use {'junegunn/fzf.vim'}
    -- Terminal
    -- use {
    --   'akinsho/nvim-toggleterm.lua',
    --   config = function() require('plugins.nvim-toggleterm') end,
    --   keys = '<C-t>'
    -- }
    -- tpope
    use({
        { "tpope/vim-commentary", event = "BufRead" }, -- Comment with gc
        { "tpope/vim-surround", event = "BufRead" }, -- Surround actions
        { "tpope/vim-unimpaired", event = "BufRead" }, -- Adds a bunch of bracket mappings see ':help unimpaired'
        { "tpope/vim-sleuth", event = "BufRead" }, -- Adapt tab size based on file and context
        { "tpope/vim-repeat", event = "BufRead" }, -- . repeats more stuff
    })
    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        module = "nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.nvim-treesitter")
        end,
        requires = {
            { "p00f/nvim-ts-rainbow", module = "nvim-treesitter" },
            { "windwp/nvim-ts-autotag", module = "nvim-treesitter" },
            { "JoosepAlviste/nvim-ts-context-commentstring", module = "nvim-treesitter" },
            { "nvim-treesitter/nvim-treesitter-textobjects", module = "nvim-treesitter" },
            { "RRethy/nvim-treesitter-textsubjects", module = "nvim-treesitter" },
        },
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
    -- Lazy loading this breaks my vimwiki alias
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
        { "zinit-zsh/zinit-vim-syntax", event = "BufEnter .zshrc" },
    })

    -- Autoinstall/compile plugins if bootstrap occurred
    if required_bootstrap then
        -- these slow statup, hence the if
        packer.install()
        packer.compile()
    end
end)
