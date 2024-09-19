return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      exclude = { filetypes = { 'markdown' } },
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },
}
