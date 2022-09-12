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
nmap("<leader>Q", "<cmd>q<CR>")
nmap("<A-.>", "gv")
-- nmap('<C-n>', '*Nciw', {noremap = true}) -- Poor man's multi cursor
M.whichkey = function()
    nmap("<leader>?", "<cmd>WhichKey<CR>")
end

-- Buffers
nmap("<Tab>", "<cmd>bn<CR>")
nmap("<S-Tab>", "<cmd>bp<CR>")
nmap("<S-t>", "<cmd>enew<CR>")
M.bufferline = function()
    nmap("<Tab>", "<cmd>BufferLineCycleNext<CR>")
    nmap("<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
    nmap("<leader>b", "<cmd>BufferLinePick<CR>")
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
    nmap("<leader>q", "<cmd>Bdelete<CR>")
end
-- nmap("<leader><space>", "<cmd>:TZFocus<CR>")

-- Window
nmap("<C-h>", "<cmd>wincmd h<CR>")
nmap("<C-j>", "<cmd>wincmd j<CR>")
nmap("<C-k>", "<cmd>wincmd k<CR>")
nmap("<C-l>", "<cmd>wincmd l<CR>")
nmap("<leader>=", "<cmd>wincmd =<CR>")

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

-- Terminal
tmap("<C-w>h", "<cmd>wincmd h<CR>")
tmap("<C-w>j", "<cmd>wincmd j<CR>")
tmap("<C-w>k", "<cmd>wincmd k<CR>")
tmap("<C-w>l", "<cmd>wincmd l<CR>")
tmap("<C-w><C-h>", "<cmd>wincmd h<CR>")
tmap("<C-w><C-j>", "<cmd>wincmd j<CR>")
tmap("<C-w><C-k>", "<cmd>wincmd k<CR>")
tmap("<C-w><C-l>", "<cmd>wincmd l<CR>")

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
-- nmap('<leader>G', '<cmd>Neogit<CR>')
M.lazygit = function()
    nmap("<leader>G", "<cmd>LazyGit<CR>")
end

-- Telescope
M.telescope = function()
    local opts = { noremap = true, silent = true }
    nmap("<leader>n", require("telescope.builtin").find_files, opts)
    nmap("<leader>g", require("telescope.builtin").live_grep, opts)
    nmap("<leader>fb", function()
        require("telescope.builtin").buffers(require("telescope.themes").get_dropdown())
    end, opts)
    nmap("<leader>fh", require("telescope.builtin").help_tags, opts)
    nmap("<leader>fo", require("telescope.builtin").oldfiles, opts)
    nmap("<leader>fc", function()
        require("telescope.builtin").find_files({ prompt_title = "Config", cwd = "$XDG_CONFIG_HOME/nvim" })
    end, opts)
    nmap("<leader>f?", require("telescope.builtin").builtin, opts)
    -- Telescope LSP
    -- nmap("<leader>la", require("telescope.builtin").lsp_code_actions, opts)
    nmap("<leader>lr", require("telescope.builtin").lsp_references, opts)
    nmap("<leader>ld", require("telescope.builtin").lsp_definitions, opts)
    nmap("<leader>ls", require("telescope.builtin").lsp_document_symbols, opts)
    nmap("<leader>lS", require("telescope.builtin").lsp_workspace_symbols, opts)
end

-- Extra toggles
M.colorizer = function()
    nmap("yoC", "<cmd>ColorizerToggle<CR>")
end

-- Trouble
M.trouble = function()
    local opts = { noremap = true, silent = true }
    nmap("<leader>xx", "<cmd>Trouble<cr>", opts)
    nmap("<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opts)
    nmap("<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", opts)
    nmap("<leader>xl", "<cmd>Trouble loclist<cr>", opts)
    nmap("<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
    nmap("gR", "<cmd>Trouble lsp_references<cr>", opts)
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
    nmap("<leader>N", "<cmd>NvimTreeToggle<CR>")
end

M.symbols_outline = function()
    nmap("<leader>s", "<cmd>SymbolsOutline<CR>")
end

M.dap = function()
    local opts = { silent = true }
    nmap("<leader>d", require("dapui").toggle, opts)
    nmap("<space>b", require("dap").toggle_breakpoint, opts)
    nmap("<F5>", require("dap").continue, opts)
    nmap("<F10>", require("dap").step_over, opts)
    nmap("<F11>", require("dap").step_into, opts)
    nmap("<F12>", require("dap").step_out, opts)
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
