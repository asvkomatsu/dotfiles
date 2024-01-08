local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('n', '<C-Space>', '<cmd>WhichKey \\<space><cr>', opts)
keymap('n', '<C-i>', '<C-i>', opts)

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Fast exit of insert mode
keymap('i', 'jj', '<Esc>', opts)

-- yank to end of line
keymap('n', 'Y', 'y$', opts)

-- center on navigation
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '*', '*zz', opts)
keymap('n', '#', '#zz', opts)
keymap('n', 'g*', 'g*zz', opts)
keymap('n', 'g#', 'g#zz', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)


-- save and exit
keymap('n', '<leader>w', ':w<cr>', opts)
keymap('n', '<leader>q', ':q<cr>', opts)

-- fast buffer navigation
keymap('n', '<M-j>', ':bn<cr>', opts)
keymap('n', '<M-k>', ':bp<cr>', opts)
keymap('n', '<M-x>', ':bd<cr>', opts)
