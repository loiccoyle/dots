-- https://github.com/mattn/efm-langserver#example-for-configyaml
local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
    formatStdin = true,
}

local prettier = {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true,
}

-- local luaformatter = {
--   formatCommand = 'lua-format -i --tab-width=2 --indent-width=2 --column-limit=120',
--   formatStdin = true
-- }

local stylua = {
    formatCommand = "stylua --stdin-filepath ${INPUT} --indent-type Spaces -",
    formatStdin = true,
}

local pylint = {
    lintCommand = "pylint --output-format text --score no --msg-template {path}:{line}:{column}:{C}:{msg} ${INPUT}",
    lintStdin = false,
    lintFormats = { "%f:%l:%c:%t:%m" },
    lintOffsetColumns = 1,
    lintCategoryMap = { I = "H", R = "I", C = "I", W = "W", E = "E", F = "E" },
}

local black = {
    formatCommand = "black --quiet -",
    formatStdin = true,
}

local shellcheck = {
    lintCommand = "shellcheck -f gcc -x -s bash",
    lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
}

local shfmt = {
    formatCommand = "shfmt -ci -s -bn -i 4 -filename ${INPUT}",
    formatStdin = true,
}

local rustfmt = {
    formatCommand = "rustfmt",
    formatStdin = true,
}

return {
    css = { prettier },
    html = { prettier },
    javascript = { prettier, eslint },
    javascriptreact = { prettier, eslint },
    json = { prettier },
    lua = { stylua },
    markdown = { prettier },
    python = { black, pylint },
    rust = { rustfmt },
    scss = { prettier },
    sh = { shellcheck, shfmt },
    typescript = { prettier, eslint },
    typescriptreact = { prettier, eslint },
    yaml = { prettier },
}
