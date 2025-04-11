

-- Navigation --
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- General
vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', {desc = 'Save'})
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>wq', ':wq<CR>', {desc = 'Save and Quit'})
vim.keymap.set('n', '<leader>q', ':q<CR>', {desc = 'Quit'})

-- Tools
vim.api.nvim_set_keymap('v', '<Leader>y', ':w !xclip -selection clipboard<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>p', ':r !xclip -selection clipboard -o<CR>', { noremap = true, silent = true })
