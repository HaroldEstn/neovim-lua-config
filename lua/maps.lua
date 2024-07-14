local cmd = vim.cmd

-- nvim tree
local api_tree = require "nvim-tree.api"
vim.keymap.set('n', '<C-t>', function() cmd('NvimTreeToggle') end)

-- bufferline
vim.keymap.set('n', '<A-1>', function() require("bufferline").go_to(1, true) end, { noremap = true, silent = true })
vim.keymap.set('n', '<A-2>', function() require("bufferline").go_to(2, true) end, { noremap = true, silent = true })
vim.keymap.set('n', '<A-3>', function() require("bufferline").go_to(3, true) end, { noremap = true, silent = true })
vim.keymap.set('n', '<A-4>', function() require("bufferline").go_to(4, true) end, { noremap = true, silent = true })
vim.keymap.set('n', '<A-5>', function() require("bufferline").go_to(5, true) end, { noremap = true, silent = true })
vim.keymap.set('n', '<A-6>', function() require("bufferline").go_to(6, true) end, { noremap = true, silent = true })
vim.keymap.set('n', '<A-7>', function() require("bufferline").go_to(7, true) end, { noremap = true, silent = true })
vim.keymap.set('n', '<A-8>', function() require("bufferline").go_to(8, true) end, { noremap = true, silent = true })
vim.keymap.set('n', '<A-9>', function() require("bufferline").go_to(9, true) end, { noremap = true, silent = true })
vim.keymap.set('n', '<A-0>', function() require("bufferline").go_to(10, true) end, { noremap = true, silent = true })
vim.keymap.set('n', '<A-h>', function() cmd('BufferLineGoToBuffer 1') end)
vim.keymap.set('n', '<A-t>', function() cmd('BufferLineGoToBuffer 2') end)
vim.keymap.set('n', '<A-n>', function() cmd('BufferLineGoToBuffer 3') end)
vim.keymap.set('n', '<A-s>', function() cmd('BufferLineGoToBuffer 4') end)
vim.keymap.set('n', '<A-c>', function() cmd('BufferLinePickClose') end)
