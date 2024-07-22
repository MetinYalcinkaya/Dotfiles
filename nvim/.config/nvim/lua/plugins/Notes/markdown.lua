return {
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown',
    ft = { 'markdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
    config = function()
      require('render-markdown').setup {
        win_options = {
          conceallevel = {
            -- These settings work better with obsidian.nvim, instead of
            -- the rendered level of conceallevel=3, it uses 2 which
            -- obsidian.nvim requires, and source mode doesn't conceal
            -- code blocks etc
            default = 0,
            rendered = 2,
          },
        },
      }
      vim.keymap.set('n', '<leader>mt', function()
        require('render-markdown').toggle()
      end, { desc = 'Toggle Markdown Render' })
    end,
  },
}
