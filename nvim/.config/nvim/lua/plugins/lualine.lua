return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'tokyonight',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = {
            { 'mode', icon = '' },
            {
              require('noice').api.status.mode.get,
              cond = require('noice').api.status.mode.has,
            },
          },
          lualine_b = { { 'branch', icon = '' } },
          lualine_c = {
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            {
              'filename',
              padding = { left = 1, right = 0 },
              file_status = true,
              newfile_status = false,
              path = 1, -- 0: Filename, 1: Relative, 2: Absolute, 3: Absolute w/ ~ for home, 4: Filename, parent
              shorting_target = 40,
              symbols = {
                modified = '[+]',
                readonly = '[-]',
                unnamed = '[No Name]',
                newfile = '[New]',
              },
            },
          },
          lualine_x = {
            {
              'diagnostics',
              always_visible = false,
              symbols = {
                error = ' ',
                warn = ' ',
                info = ' ',
                hint = '󰝶 ',
              },
            },
            { 'diff' },
          },
          lualine_y = {
            {
              'progress',
            },
          },
          lualine_z = {

            {
              'location',
            },
          },
        },
        extensions = { 'oil', 'mason', 'trouble' },
      }
    end,
  },
}
