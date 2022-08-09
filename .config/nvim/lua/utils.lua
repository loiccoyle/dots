local M = {}

-- Os
M.os = {
    home = os.getenv("HOME"),
    data = vim.fn.stdpath("data"),
    cache = vim.fn.stdpath("cache"),
    config = vim.fn.stdpath("config"),
    name = vim.loop.os_uname().sysname,
    is_git_dir = os.execute("git rev-parse --is-inside-work-tree >> /dev/null 2>&1"),
}

function M.term_wrapper(cmd, fmt)
    -- NOTE: Run command accepts 2 params
    -- 1: Default terminal command, between quotes
    -- 2: Optional: a string format argument with %
    -- Eg: term_wrapper('echo I am editing %s', vim.fn.expand("%"))
    vim.cmd("vnew")
    vim.cmd("term " .. string.format(cmd, fmt))
    vim.cmd("setl nornu nonu nocul so=0 scl=no")
    vim.cmd("startinsert")
end

local is_transparent = true
function M.toggle_background()
    if is_transparent == true then
        vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
        is_transparent = false
    else
        vim.cmd([[ set background=dark ]])
        is_transparent = true
    end
end

-- Check if module is available
function M.prequire(module)
    local ok, err = pcall(require, module)
    if not ok then
        return nil, err
    end
    return err
end

return M
