return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        integrations = {
          noice = true,
          notify = true,
          fidget = true,
          diffview = true,
          mason = true,
          indent_blankline = {
            enabled = true,
            scope_color = 'lavender',
            colored_indent_levels = true,
          },
        },
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
