return {
  {
    'stevearc/oil.nvim',
    config = function()
      local oil = require 'oil'

      local function OpenTmuxPane(direction)
        local cwd = require('oil').get_current_dir()
        if not cwd then
          vim.notify('Could not retrieve the current directory from oil.nvim', vim.log.levels.ERROR)
          return
        end

        local escaped_cwd = vim.fn.shellescape(cwd)
        local tmux_cmd = string.format('tmux split-window -%s -c %s', direction, escaped_cwd)
        os.execute(tmux_cmd)
      end

      oil.setup {
        columns = { 'icon' },
        view_options = {
          show_hidden = true,
        },
        delete_to_trash = true, -- Deletes to trash
        skip_confirm_for_simple_edits = true,
        use_default_keymaps = false,
        keymaps = {
          ['<CR>'] = 'actions.select',
          ['-'] = 'actions.parent',
          ['<C-o>'] = function()
            OpenTmuxPane 'h'
            oil.toggle_float()
          end,
        },
      }
      vim.keymap.set('n', '_', require('oil').toggle_float)
    end,
  },
}
