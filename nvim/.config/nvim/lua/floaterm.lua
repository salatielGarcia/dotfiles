vim.g.floaterm_width = 0.7
vim.g.floaterm_height = 0.9
vim.g.floaterm_autoclose = 0

vim.g.floaterm_keymap_new = '<leader>nt'
vim.g.floaterm_keymap_toggle = '<leader>t'

map('n', '<F11>', '<Esc>:FloatermNew<CR>', {noremap=true})
map('n', '<leader>pt', '<Esc>:FloatermNew python %<CR>', {noremap=true})
map('n', '<leader>lt', '<Esc>:FloatermNew lua %<CR>', {noremap=true})
map('n', '<F12>', '<Esc>:FloatermKill<CR>', {noremap=true})
map('t', '<F12>', '<Esc>:FloatermKill<CR>', {noremap=true})
map('t', '<Esc>', '<C-\\><C-n>', {noremap=true})
