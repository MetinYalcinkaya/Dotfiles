return {
  -- TokyoNight
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    ---@class tokyonight.Config
    config = function()
      require('tokyonight').setup {
        style = 'moon',
        lualine_bold = true,
        cache = true,
      }
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
