require('gitsigns').setup({
  signs = {
    add = { text = '│' },
    change = { text = '│' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },

  signcolumn = true,
  numhl = false,
  linehl = false,  

  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  
  attach_to_untracked = true,
  update_debounce = 200,
  max_file_length = 40000,
  
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })
    
    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })
    
    vim.keymap.set('n', '<leader>gs', gs.stage_hunk)
    vim.keymap.set('n', '<leader>gr', gs.reset_hunk)
    vim.keymap.set('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    vim.keymap.set('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    vim.keymap.set('n', '<leader>gp', gs.preview_hunk)
    vim.keymap.set('n', '<leader>gd', gs.diffthis)
    vim.keymap.set('n', '<leader>td', gs.toggle_deleted)    
    vim.keymap.set('n', '<leader>gb', function() gs.blame_line{full=true} end)
    vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame)
  end,
  
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = false,
  },
  
  current_line_blame_formatter = '  <author>, <author_time:%Y-%m-%d> - <summary>',
  
  sign_priority = 6,
  status_formatter = nil,
  word_diff = false,
  debug_mode = false,
})
