local map = vim.keymap.set
local M = {}

local function nmap(key, cmd, opts)
    map("n", key, cmd, opts)
end
local function imap(key, cmd, opts)
    map("i", key, cmd, opts)
end
local function xmap(key, cmd, opts)
    map("x", key, cmd, opts)
end
local function tmap(key, cmd, opts)
    map("t", key, cmd, opts)
end
local function cmap(key, cmd)
    map("c", key, cmd, { silent = false })
end

vim.g.mapleader = ","
nmap(" ", "<Nop>")
xmap(" ", "<Nop>")

-- Normal
nmap("Q", "<Nop>")
nmap("<C-c>", "<Esc>")
nmap("Y", "y$")
nmap("yil", "0y$")
-- nmap("<CR>", '{-> v:hlsearch ? ":nohl\\<CR>" : "\\<ESC>"}()', { expr = true })
nmap("<ESC>", '{-> v:hlsearch ? ":nohl\\<CR><ESC>" : "\\<ESC>"}()', { expr = true })
nmap("<C-s>", "<cmd>w<CR>")
nmap("<A-j>", "<cmd>m .+1<CR>==")
nmap("<A-k>", "<cmd>m .-2<CR>==")
nmap("S", ":%s//g<Left><Left>", { silent = false })
nmap("<A-.>", "gv")
-- nmap('<C-n>', '*Nciw', {noremap = true}) -- Poor man's multi cursor
M.whichkey = function()
    nmap("<leader>?", "<cmd>WhichKey<CR>", { desc = "WhichKey" })
end

-- Buffers
nmap("<Tab>", "<cmd>bn<CR>")
nmap("<S-Tab>", "<cmd>bp<CR>")
nmap("<S-t>", "<cmd>enew<CR>")
M.bufferline = function()
    nmap("<Tab>", "<cmd>BufferLineCycleNext<CR>")
    nmap("<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
    nmap("<leader>b", "<cmd>BufferLinePick<CR>", { desc = "BufferLine Pick" })
    nmap("<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>")
    nmap("<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>")
    nmap("<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>")
    nmap("<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>")
    nmap("<A-5>", "<cmd>BufferLineGoToBuffer 5<CR>")
    nmap("<A-6>", "<cmd>BufferLineGoToBuffer 6<CR>")
    nmap("<A-7>", "<cmd>BufferLineGoToBuffer 7<CR>")
    nmap("<A-8>", "<cmd>BufferLineGoToBuffer 8<CR>")
    nmap("<A-9>", "<cmd>BufferLineGoToBuffer 9<CR>")
end
M.bufdelete = function()
    nmap("<leader>q", "<cmd>Bdelete<CR>", { desc = "Delete Buffer" })
end
-- nmap("<leader><space>", "<cmd>:TZFocus<CR>")

-- Window
nmap("<C-h>", "<cmd>wincmd h<CR>")
nmap("<C-j>", "<cmd>wincmd j<CR>")
nmap("<C-k>", "<cmd>wincmd k<CR>")
nmap("<C-l>", "<cmd>wincmd l<CR>")
nmap("<leader>=", "<cmd>wincmd =<CR>", { desc = "Window Balance" })

-- Terminal
tmap("<C-w>h", "<cmd>wincmd h<CR>")
tmap("<C-w>j", "<cmd>wincmd j<CR>")
tmap("<C-w>k", "<cmd>wincmd k<CR>")
tmap("<C-w>l", "<cmd>wincmd l<CR>")
tmap("<C-w><C-h>", "<cmd>wincmd h<CR>")
tmap("<C-w><C-j>", "<cmd>wincmd j<CR>")
tmap("<C-w><C-k>", "<cmd>wincmd k<CR>")
tmap("<C-w><C-l>", "<cmd>wincmd l<CR>")

-- Insert
imap("<C-c>", "<Esc>")
imap("<C-BS>", "<C-W>")
imap("<C-h>", "<C-W>")
-- inset mode navigation
imap("<A-h>", "<left>")
imap("<A-j>", "<down>")
imap("<A-k>", "<up>")
imap("<A-l>", "<right>")

-- Visual
xmap("<", "<gv")
xmap(">", ">gv")
xmap("<A-j>", ":move '>+1<CR>gv-gv")
xmap("<A-k>", ":move '<-2<CR>gv-gv")

-- Command
cmap("<C-a>", "<Home>")
cmap("<C-e>", "<End>")
cmap("<C-h>", "<Left>")
cmap("<C-j>", "<Down>")
cmap("<C-k>", "<Up>")
cmap("<C-l>", "<Right>")
cmap("<C-d>", "<Del>")
cmap("<C-f>", '<C-R>=expand("%:p")<CR>')
cmap("<C-BS>", "<C-W>")
cmap("<C-h>", "<C-W>")

-- Git
M.lazygit = function()
    nmap("<leader>G", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
end

-- Telescope
M.telescope = function()
    local telescope_mapping = function(key, func, desc)
        vim.keymap.set("n", key, func, { noremap = true, silent = true, desc = desc })
    end
    telescope_mapping("<leader>n", function()
        require("telescope.builtin").find_files()
    end, "Telescope")
    telescope_mapping("<leader>g", function()
        require("telescope.builtin").live_grep()
    end, "Telescope Grep")
    telescope_mapping("<leader>fb", function()
        require("telescope.builtin").buffers(require("telescope.themes").get_dropdown())
    end, "Telescope Buffers")
    telescope_mapping("<leader>fh", function()
        require("telescope.builtin").help_tags()
    end, "Telescope Help Tags")
    telescope_mapping("<leader>fo", function()
        require("telescope.builtin").oldfiles()
    end, "Telescope Old Files")
    telescope_mapping("<leader>fc", function()
        require("telescope.builtin").find_files({ prompt_title = "Config", cwd = "$XDG_CONFIG_HOME/nvim" })
    end, "Telescope File Nvim Config")
    telescope_mapping("<leader>f?", function()
        require("telescope.builtin").builtin()
    end, "Telescope Builtins")
    -- telescope_mapping("<leader>la", function()
    --     require("telescope.builtin").lsp_code_actions()
    -- end, "Telescope LSP Code Actions")
    telescope_mapping("<leader>lr", function()
        require("telescope.builtin").lsp_references()
    end, "Telescope LSP References")
    telescope_mapping("<leader>ld", function()
        require("telescope.builtin").lsp_definitions()
    end, "Telescope LSP Definitions")
    telescope_mapping("<leader>ls", function()
        require("telescope.builtin").lsp_document_symbols()
    end, "Telescope LSP Document Symbols")
    telescope_mapping("<leader>lS", function()
        require("telescope.builtin").lsp_workspace_symbols()
    end, "Telescope LSP Workspace Symbols")
end

-- Extra toggles
M.colorizer = function()
    nmap("yoC", "<cmd>ColorizerToggle<CR>", { desc = "Colorizer Toggle" })
end

-- Trouble
M.trouble = function()
    local trouble_mapping = function(key, func, desc)
        vim.keymap.set("n", key, func, { noremap = true, silent = true, desc = desc })
    end
    trouble_mapping("<leader>xx", function()
        require("trouble").toggle()
    end, "Trouble")
    trouble_mapping("<leader>xw", function()
        require("trouble").toggle({ mode = "workspace_diagnostics" })
    end, "Trouble Workspace Diagnostics")
    trouble_mapping("<leader>xd", function()
        require("trouble").toggle({ mode = "document_diagnostics" })
    end, "Trouble Document Diagnostics")
    trouble_mapping("<leader>xl", function()
        require("trouble").toggle({ mode = "loclist" })
    end, "Trouble Loclist")
    trouble_mapping("<leader>xq", function()
        require("trouble").toggle("quickfix")
    end, "Trouble Quickfix")
    trouble_mapping("gR", function()
        require("trouble").toggle("lsp_references")
    end, "Touble LSP References")
end

-- fzf
-- nmap('<leader>n', '<cmd>:Files<CR>')
-- nmap('<leader>N', '<cmd>:GFiles<CR>')
-- nmap('<leader>b', '<cmd>:Buffers<CR>')
-- nmap('<leader>l', '<cmd>:BLines<CR>')
-- nmap('<leader>fh', '<cmd>:HelpTags<CR>')
-- nmap('<leader>fo', '<cmd>:History<CR>')
-- vim.cmd[[
-- command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number -- '.shellescape(<q-args>), 0, fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
-- ]]
-- vim.cmd[[
-- command! -bang Dots call fzf#vim#files('~/.config/', <bang>0)
-- ]]
-- nmap('<leader>g', '<cmd>:GGrep<CR>')
-- nmap('<leader>fd', '<cmd>:Dots<CR>')
-- Tree
M.nvimtree = function()
    nmap("<leader>N", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree Toggle" })
end

M.symbols_outline = function()
    nmap("<leader>s", "<cmd>SymbolsOutline<CR>", { desc = "Symbols Outline" })
end

M.dap = function()
    nmap("<leader>d", require("dapui").toggle, { desc = "DAP UI" })
    nmap("<leader>db", require("dap").toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
    nmap("<F5>", require("dap").continue, { desc = "DAP Continue" })
    nmap("<F10>", require("dap").step_over, { desc = "DAP Step Over" })
    nmap("<F11>", require("dap").step_into, { desc = "DAP Step Into" })
    nmap("<F12>", require("dap").step_out, { desc = "DAP Step Out" })
end
-- -- Vim surround ( noremap need to be false to work)
-- nmap('ds', '<Plug>Dsurround', {noremap = false})
-- nmap('cs', '<Plug>Csurround', {noremap = false})
-- nmap('cS', '<Plug>CSurround', {noremap = false})
-- nmap('s', '<Plug>Ysurround', {noremap = false})
-- nmap('S', '<Plug>YSurround', {noremap = false})
-- nmap('ss', '<Plug>Yssurround', {noremap = false})
-- nmap('SS', '<Plug>YSsurround', {noremap = false})
-- xmap('s', '<Plug>VSurround', {noremap = false})
-- xmap('S', '<Plug>VgSurround', {noremap = false})
vim.cmd([[cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]])
vim.cmd([[command! PackerDelete silent! !rm  -rf ~/.local/share/nvim/site <CR>]])
vim.cmd([[command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor]])

-- Typos be gone
vim.cmd([[
    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qa! qa!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qa qa
    cnoreabbrev Qall qall
]])

-- Command to install the language servers I use.
-- vim.cmd([[command! LspInstallUsed lua require('utils').install_lsp()]])

return M
