vim.g.VM_maps = { Undo = "u", Redo = "<CR>" }
vim.g.VM_Mono_hl = "Visual"
vim.cmd(
    [[autocmd User visual_multi_mappings  imap <buffer><expr> <CR> pumvisible() ? "\<C-Y>" : "\<Plug>(VM-I-Return)"]]
)
