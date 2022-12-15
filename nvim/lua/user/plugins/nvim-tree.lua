require('nvim-tree').setup({
  git = {
    ignore = false,
  },
  view = {
    width = 40,
    side = "right",
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
})

vim.keymap.set('n', '<C-h>', ':NvimTreeFindFileToggle<CR>')
