return {
  -- TokyoNight
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    ---@class tokyonight.Config
    config = function()
      require('tokyonight').setup {
        style = 'night',
        lualine_bold = true,
      }
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
