return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function(_, opts)
      local neogit = require 'neogit'
      vim.keymap.set('n', '<leader>gs', neogit.open, { silent = true, noremap = true, desc = 'Open Neogit' })
      vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { silent = true, noremap = true, desc = 'Git Commit' })
      vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { silent = true, noremap = true, desc = 'Git Pull' })
      vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { silent = true, noremap = true, desc = 'Git Push' })
      vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', { silent = true, noremap = true, desc = 'Search Git Branches' })
      vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { silent = true, noremap = true, desc = 'Git Blame' })
      neogit.setup(opts)
    end,
  },
}
