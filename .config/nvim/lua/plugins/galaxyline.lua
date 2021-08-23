-- https://github.com/glepnir/galaxyline.nvim
local base16_colors = require("plugins.nvim-base16-colors")
local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local gls = gl.section
gl.short_line_list = { "NvimTree", "packer", "term://*", "dashboard" }

local colors = {
    bg = base16_colors.base00,
    fg = base16_colors.base07,
    yellow = "#D7BA7D",
    cyan = "#4EC9B0",
    green = "#608B4E",
    orange = "#FF8800",
    purple = "#C586C0",
    magenta = "#D16D9E",
    grey = "#858585",
    blue = "#569CD6",
    red = "#D16969",
}

gls.left = {
    {
        ViMode = {
            provider = function()
                -- auto change color according the vim mode
                local mode_color = {
                    n = colors.blue,
                    i = colors.green,
                    v = colors.purple,
                    [""] = colors.purple,
                    V = colors.purple,
                    c = colors.magenta,
                    no = colors.blue,
                    s = colors.orange,
                    S = colors.orange,
                    [""] = colors.orange,
                    ic = colors.yellow,
                    R = colors.red,
                    Rv = colors.red,
                    cv = colors.blue,
                    ce = colors.blue,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ["r?"] = colors.cyan,
                    ["!"] = colors.blue,
                    t = colors.blue,
                }
                vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
                return "▊ "
            end,
            highlight = { colors.bg, colors.bg, "bold" },
        },
    },
    {
        FileIcon = {
            provider = "FileIcon",
            highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color(), colors.bg },
        },
    },
    { FileName = { provider = "FileName", separator = " ", highlight = { colors.fg, colors.bg, "bold" } } },
    {
        GitIcon = {
            provider = function()
                return " "
            end,
            condition = condition.check_git_workspace,
            separator = " ",
            separator_highlight = { "NONE", colors.bg },
            highlight = { colors.orange, colors.bg, "bold" },
        },
    },
    {
        GitBranch = {
            provider = "GitBranch",
            condition = condition.check_git_workspace,
            separator = " ",
            separator_highlight = { "NONE", colors.bg },
            highlight = { colors.yellow, colors.bg, "bold" },
        },
    },
    {
        DiffAdd = {
            provider = "DiffAdd",
            -- condition = condition.hide_in_width,
            icon = " ",
            highlight = { colors.green, colors.bg },
        },
    },
    {
        DiffModified = {
            provider = "DiffModified",
            -- condition = condition.hide_in_width,
            icon = " 柳",
            highlight = { colors.blue, colors.bg },
        },
    },
    {
        DiffRemove = {
            provider = "DiffRemove",
            -- condition = condition.hide_in_width,
            icon = "  ",
            highlight = { colors.red, colors.bg },
        },
    },
}

gls.mid = {}

gls.right = {
    {
        DiagnosticError = {
            provider = "DiagnosticError",
            icon = "  ",
            highlight = { colors.red, colors.bg },
        },
    },
    {
        DiagnosticWarn = {
            provider = "DiagnosticWarn",
            icon = "  ",
            highlight = { colors.orange, colors.bg },
        },
    },
    {
        DiagnosticHint = {
            provider = "DiagnosticHint",
            icon = "  ",
            highlight = { colors.blue, colors.bg },
        },
    },
    {
        DiagnosticInfo = {
            provider = "DiagnosticInfo",
            icon = "  ",
            highlight = { colors.blue, colors.bg },
        },
    },
    {
        GetLspClient = {
            provider = "GetLspClient",
            separator = " ",
            separator_highlight = { "NONE", colors.bg },
            highlight = { base16_colors.base0D, colors.bg, "bold" },
            icon = "  ",
            condition = function()
                local tbl = { ["dashboard"] = true, [""] = true }
                if tbl[vim.bo.filetype] then
                    return false
                end
                return true
            end,
        },
    },
    {
        FileEncode = {
            provider = "FileEncode",
            condition = condition.hide_in_width,
            separator = " ",
            separator_highlight = { "NONE", colors.bg },
            highlight = { base16_colors.base09, colors.bg, "bold" },
        },
    },
    {
        FileFormat = {
            provider = "FileFormat",
            condition = condition.hide_in_width,
            separator = " ",
            separator_highlight = { "NONE", colors.bg },
            highlight = { base16_colors.base09, colors.bg, "bold" },
        },
    },
    {
        LineInfo = {
            provider = "LineColumn",
            separator = " ",
            separator_highlight = { "NONE", colors.bg },
            highlight = { colors.grey, colors.bg },
        },
    },
    {
        PerCent = {
            provider = "LinePercent",
            separator = "",
            highlight = { colors.grey, colors.bg, "bold" },
        },
    },
}
