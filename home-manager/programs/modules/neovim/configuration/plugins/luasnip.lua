require('luasnip').setup({
  enable_autosnippets = true,
  store_selection_keys = '<Tab>',
  update_events = 'TextChanged,TextChangedI'
})

require('luasnip.loaders.from_vscode').lazy_load()
