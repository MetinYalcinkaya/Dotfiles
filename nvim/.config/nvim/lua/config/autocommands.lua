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

-- Spellcheck, wrap, and text width for text filetypes
autocmd('FileType', {
  pattern = { 'markdown', 'gitcommit', 'NeogitCommitMessage' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 80
  end,
  group = general,
  desc = 'Spellcheck for Markdown files',
})

autocmd('FocusGained', {
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd 'checktime'
    end
  end,
  group = general,
  desc = 'Reload file if changed',
})
