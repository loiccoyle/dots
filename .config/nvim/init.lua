-- Based on: https://github.com/martinsione/dotfiles
-- and: https://github.com/shaunsingh/vimrc-dotfiles

-- Load config files
local config_files = {
    "options",
    "mappings",
    "autocmd",
    "packer_plugins",
}
for i = 1, #config_files, 1 do
    pcall(require, config_files[i])
end
