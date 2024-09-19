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
          indent_blankline = {
            enabled = true,
            scope_color = 'lavender',
          },
        },
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
