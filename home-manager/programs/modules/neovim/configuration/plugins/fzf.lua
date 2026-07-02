local actions = require('fzf-lua.actions')
local fzf = require('fzf-lua')

fzf.setup({
  winopts = { backdrop = 85 },
  keymap = {
    builtin = {
      ["<C-f>"] = "preview-page-down",
      ["<C-b>"] = "preview-page-up",
      ["<C-p>"] = "toggle-preview",
    },
  },
  actions = {
    files = {
      ["enter"] = actions.file_edit_or_qf,
    }
  }
})

vim.keymap.set('n', '<leader><leader>', fzf.files)
vim.keymap.set('n', '<leader>/', fzf.live_grep)
