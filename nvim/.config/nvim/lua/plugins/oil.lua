return {
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        view_options = {
          show_hidden = true,
        },
        delete_to_trash = true, -- Deletes to trash
        skip_confirm_for_simple_edits = true,
      }
      vim.keymap.set('n', '<leader>-', require('oil').toggle_float)
    end,
  },
}
