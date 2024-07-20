return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'modern',
      icons = {
        keys = {
          BS = '󰭜 ', -- Better backspace icon + fix space issue I had
        },
      },
    },
    config = function(_, opts)
      local wk = require 'which-key'
      wk.add {
        { '<leader>c', group = '[C]ode', icon = { icon = '', color = 'orange' } },
        { '<leader>c_', hidden = true },
        { '<leader>d', group = '[D]ocument', icon = { icon = '󰈔', color = 'cyan' } },
        { '<leader>d_', hidden = true },
        { '<leader>h', group = 'Git [H]unk' },
        { '<leader>h_', hidden = true },
        { '<leader>r', group = '[R]ename', icon = '󰘎' },
        { '<leader>r_', hidden = true },
        { '<leader>s', group = '[S]earch', icon = { icon = '', color = 'green' } },
        { '<leader>s_', hidden = true },
        { '<leader>t', group = '[T]oggle', icon = { icon = '', color = 'yellow' } },
        { '<leader>t_', hidden = true },
        { '<leader>w', group = '[W]orkspace', icon = '' },
        { '<leader>w_', hidden = true },
        { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
        -- Obsidian/Markdown
        { '<leader>o', group = '[O]bsidian', icon = { icon = '', color = 'purple' } },
        { '<leader>m', group = '[M]arkdown', icon = '' },
        -- Oil.nvim icon
        { '<leader>-', group = 'Oil Overlay', icon = { icon = '󰏇', color = 'red' } },
        -- Surround
        { 's', group = '+ surround', icon = { icon = '󰅪', color = 'cyan' } },
        wk.setup(opts),
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
