local utils = require("utils")
local map = utils.keymap.map
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
    nmap("<A-6>", "<cmd>BufferLineGoToBuffer 5<CR>")
    nmap("<A-5>", "<cmd>BufferLineGoToBuffer 6<CR>")
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
nmap("<Up>", "<cmd>wincmd -<CR>")
nmap("<Down>", "<cmd>wincmd +<CR>")
nmap("<Left>", "<cmd>wincmd <<CR>")
nmap("<Right>", "<cmd>wincmd ><CR>")
nmap("<leader>=", "<cmd>wincmd =<CR>")

-- Insert
imap("<C-c>", "<Esc>")
imap("<S-CR>", "<Esc>o")
imap("<C-CR>", "<Esc>O")
imap("<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
imap("<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })
imap("<C-BS>", "<C-W>")
imap("<C-h>", "<C-W>")
imap("<A-j>", "<ESC><cmd>m .+1<CR>==gi")
imap("<A-k>", "<ESC><cmd>m .-2<CR>==gi")

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
    nmap("<leader>n", '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
    nmap("<leader>g", '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
    nmap(
        "<leader>fb",
        '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown())<CR>',
        opts
    )
    nmap("<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)
    nmap("<leader>fo", '<cmd>lua require("telescope.builtin").oldfiles()<CR>', opts)
    nmap(
        "<leader>fc",
        '<cmd>lua require("telescope.builtin").find_files({prompt_title="Config", cwd="$XDG_CONFIG_HOME/nvim"})<CR>',
        opts
    )
    nmap("<leader>f?", '<cmd>lua require("telescope.builtin").builtin()<CR>', opts)
    -- Telescope LSP
    nmap("<leader>la", '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts)
    nmap("<leader>lr", '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
    nmap("<leader>ld", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
    nmap("<leader>ls", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)
    nmap("<leader>lS", '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>', opts)
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
vim.cmd([[command! LspInstallUsed lua require('utils').install_lsp()]])

return M
