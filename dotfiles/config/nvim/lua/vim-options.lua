vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('i', 'jj', '<Esc>')

vim.keymap.set('n', 'Y', 'y$')

vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')

vim.keymap.set('n', '<M-j>', ':bn<CR>')
vim.keymap.set('n', '<M-k>', ':bp<CR>')
vim.keymap.set('n', '<M-x>', ':bd<CR>')

vim.wo.number = true

vim.cmd("set cursorline")
vim.cmd("set nobackup")
vim.cmd("set scrolloff=10")

vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set nohlsearch")

vim.cmd("set showcmd")
