return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'Main',
          path = '~/Documents/Obsidian/Main/',
        },
      },
      notes_subsir = 'inbox',
      new_notes_location = 'notes_subsir',

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      mappings = {
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<cr>'] = {
          action = function()
            return require('obsidian').util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
      new_nodes_location = 'current_dir',
      disable_frontmatter = false,
      templates = {
        subdir = 'templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
      },
      ui = {
        enable = true,
      },
      attachments = {
        img_folder = 'images',
      },
    },
    config = function(_, opts)
      -- Setup binds when plugin is loaded since it'll only be for markdown files
      vim.keymap.set('n', '<leader>oc', "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = 'Obsidian Toggle Checkbox' })
      vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = 'Open in Obsidian App' })
      vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'Show Obsidian Backlinks' })
      vim.keymap.set('n', '<leader>ol', '<cmd>ObsidianLinks<CR>', { desc = 'Show Obsidian Links' })
      vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = 'Create New Note' })
      vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = 'Search Obsidian' })
      vim.keymap.set('n', '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Quick Switch' })
      vim.keymap.set('n', '<leader>op', '<cmd>ObsidianPasteImg<CR>', { desc = 'Paste Image' })
      vim.keymap.set(
        'n',
        '<leader>ok',
        ":!mv '%:p' /Users/metinyalcinkaya/Documents/Obsidian/Main/uncategorized<CR>:bd<CR>",
        { desc = 'Move File To Uncategorized' }
      )
      vim.keymap.set('n', '<leader>odd', ":!rm '%:p'<CR>:bd<CR>", { desc = 'Delete File' })
      vim.keymap.set('n', '<leader>ot', function()
        vim.cmd 'ObsidianTemplate note'
        vim.cmd 'silent! 12s/\\(# \\)[^_]*_/\\1/ | silent! 12s/-/ /g'
        vim.cmd 'noh'
      end, { desc = 'Insert Template' })
      require('obsidian').setup(opts)
    end,
  },
}
