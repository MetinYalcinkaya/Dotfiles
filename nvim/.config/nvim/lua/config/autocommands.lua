local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup('General', { clear = true })

-- Highlight when yanking (copying) text
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
  group = general,
  desc = 'Highlight when yanking (copying) text',
})

-- Disables the automatic commenting over the next line when inserting new line (o)
autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
  group = general,
  desc = 'Disable new line comment',
})

-- vim: ts=2 sts=2 sw=2 et
