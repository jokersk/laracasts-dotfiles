-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')
-- Quickly clear search highlighting.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Open the current file in the default program (on Mac this should just be just `open`).
vim.keymap.set('n', '<Leader>x', ':!xdg-open %<CR><CR>')

vim.keymap.set('n', 's', ':w<CR>')

vim.keymap.set('n', 'bd', ':bd<CR>')

vim.keymap.set('n', '<C-j>', ':e #<CR>')


local methods = require('user/methods')
vim.api.nvim_create_user_command('Method', function() methods.select() end, {})

