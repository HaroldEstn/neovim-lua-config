local cmd = vim.cmd
local api_tree = require "nvim-tree.api"
vim.keymap.set('n', '<C-t>', function() cmd('NvimTreeToggle') end)
