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
        styles = {
          floats = 'normal',
        },
        lualine_bold = true,
        cache = true,
      }
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
