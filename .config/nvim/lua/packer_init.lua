local present, packer = pcall(require, "packer")
local required_bootstrap = not present

-- Bootstrap
if not present then
    local packer_path = require("utils").os.data .. "/site/pack/packer/start/packer.nvim"
    print("Cloning Packer...")
    vim.fn.delete(packer_path, "rf")
    vim.fn.system({
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        "--depth",
        "20",
        packer_path,
    })
    vim.cmd("packadd packer.nvim")

    present, packer = pcall(require, "packer")

    if present then
        print("Packer cloned successfully.")
        print("Restart neovim a few times to get all the plugins to install properly.")
        print("Run LspInstallUsed to install language servers.")
    else
        error("Couldn't clone packer !\nPacker path: " .. packer_path)
    end
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
        prompt_border = "single",
    },
    git = {
        clone_timeout = 600, -- Timeout, in seconds, for git clones
    },
    auto_clean = true,
    compile_on_sync = true,
})

return required_bootstrap
