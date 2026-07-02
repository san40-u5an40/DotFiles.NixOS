require('telescope').setup({
  defaults = {
    file_ignore_patterns = { ".git/" },
    path_display = { "filename_first" },
    layout_config = {
      vertical = { width = 0.8 }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    lsp_handlers = {
      code_action = require('telescope.themes').get_dropdown({}),
    },
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('lsp_handlers')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- LSP special
vim.keymap.set('n', 'gd', builtin.lsp_definitions)
vim.keymap.set('n', 'gr', builtin.lsp_references)
vim.keymap.set('n', 'gi', builtin.lsp_implementations)
vim.keymap.set('n', '<leader>ci', builtin.lsp_incoming_calls)
vim.keymap.set('n', '<leader>co', builtin.lsp_outgoing_calls)
vim.keymap.set('n', '<leader>d', builtin.diagnostics)
