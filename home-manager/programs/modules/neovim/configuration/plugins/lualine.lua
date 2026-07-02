require('lualine').setup({
  options = {
    theme = 'onedark',
  },
  sections = {
    lualine_a = {
      'mode'
    },
    lualine_b = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info' },
        symbols = { error = 'E:', warn = 'W:', info = 'I:' },
        colored = true,
      }
    },
    lualine_c = {
      {
        'filename',
        path = 1,
        shorting_target = 40,
        file_status = true,
        symbols = {
          modifued = '[+]',
          readonly = '[-]',
          unnamed = '[No name]',
        }
      },
      {
        'filetype',
        colored = true,
        icon_only = true,
      },
      {
        'encoding',
        fmt = string.upper,
      }
    },
    lualine_x = {
      'lsp_status',
      'clients'
    },
    lualine_y = {
      'branch',
      {
        'diff',
        colored = true,
        diff_color = {
          added = 'DiffAdd',
          modified = 'DiffChange',
          removed = 'DiffDelete'
        },
        symbols = {
          added = '+',
          modified = '~',
          removed = '-'
        },
        source = 'gitsigns-nvim',
      }
    },
    lualine_z = {
      {
        'location',
        padding = 1,
      }
    },
  },
  tabline = {
    lualine_a = { 'tabs' },
    lualine_b = { 'buffers' }
  },
})
