-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'config/options'
require 'config/keymaps'
require 'config/autocommands'
require 'config/lazy-bootstrap'
require 'config/lazy-plugins'

-- vim: ts=2 sts=2 sw=2 et
