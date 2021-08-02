-- https://github.com/vimwiki/vimwiki/
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_list = {
    { path = "~/projects/vimwiki", syntax = "markdown", ext = ".md" },
}
vim.g.vimwiki_ext2syntax = {
    [".md"] = "markdown",
    [".markdown"] = "markdown",
    [".mdown"] = "markdown",
}
