return {
  {
    'OXY2DEV/markview.nvim',
    ft = 'markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      vim.keymap.set('n', '<leader>mt', '<cmd>Markview toggle<CR>', { desc = 'Toggle Markview' })
    end,
  },
}
