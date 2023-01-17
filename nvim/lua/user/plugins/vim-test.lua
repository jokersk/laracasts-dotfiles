vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>')
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>')
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>')
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>')
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>')
vim.keymap.set('n', '<C-o>', '<C-\\><C-n>')

vim.cmd([[
  let g:test#php#phpunit#executable = './vendor/bin/pest'
  let g:test#basic#start_normal = 1
]])
