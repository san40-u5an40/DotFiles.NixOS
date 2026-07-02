require('nvim-tree').setup({
  view = {
    width = 40,
    side = 'left'
  },
  filters = {
    git_ignored = true 
  }
})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
