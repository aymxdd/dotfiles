-- map gd to coc-definition and gD to coc-implementation and gr to coc-references
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = false })
vim.api.nvim_set_keymap('n', 'gD', '<Plug>(coc-implementation)', { noremap = false })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { noremap = false })

-- Maj + Enter to validate coc completion
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "\\<CR>"', { noremap = true, silent = true, expr = true })
