require('lazy').setup({
  -- This auto imports all plugins from the given folders, so you don't have to call each plugin individually
  { import = 'plugins' },
  { import = 'plugins.LSP' },
  { import = 'plugins.Notes' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
