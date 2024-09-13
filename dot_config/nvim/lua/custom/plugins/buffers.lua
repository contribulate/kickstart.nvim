-- buffers
vim.keymap.set('n', '<leader>n', '<cmd>bn<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>p', '<cmd>bp<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>t', '<cmd>b#<CR>', { desc = 'Last buffer' })
vim.keymap.set('n', '<leader>l', '<cmd>bp<CR><cmd>bd#<CR>', { desc = 'Close buffer' })

-- open a new buffer
--noremap <silent> <leader>e :enew<cr>

return {}
