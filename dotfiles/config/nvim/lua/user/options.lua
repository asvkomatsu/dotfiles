-- disable backup file
vim.opt.backup = false

-- disable swapfile creation
vim.opt.swapfile = false

-- if a file is being edited by another program,
-- it is not allowed to be edited
vim.opt.writebackup = false

-- allows neovim to access the system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.showcmd = true

-- more space in the neovim command line for displaying messages
vim.opt.cmdheight = 1

-- mostly just for cmp
vim.opt.completeopt = { 'menuone', 'noselect' }

-- so that `` is visible in markdown files
vim.opt.conceallevel = 0

-- use unicode for everything
vim.opt.fileencoding = 'utf-8'

-- highlight all matches on previous search pattern
vim.opt.hlsearch = true

-- ignore case in search patterns
vim.opt.ignorecase = true

vim.opt.incsearch = true

-- allow the mouse to be used in neovim
vim.opt.mouse = 'a'

-- popup menu height
vim.opt.pumheight = 10
vim.opt.pumblend = 10

-- we don't need to see things like -- INSERT -- anymore
vim.opt.showmode = false

-- always show tabs
vim.opt.showtabline = 1

-- smart case
vim.opt.smartcase = true

-- make indenting smarter again
vim.opt.smartindent = true

-- position of new splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- set term gui colors
vim.opt.termguicolors = true

-- time to wait for a mapped sequence to complete
vim.opt.timeoutlen = 1000

-- enable persistent undo
vim.opt.undofile = true

-- faster completion
vim.opt.updatetime = 100

-- tabs/spaces/indent conversion
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- highlight the current line
vim.opt.cursorline = true

-- set numbered lines
vim.opt.number = true
vim.wo.number = true

vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = false

-- set relative numbered lines
vim.opt.relativenumber = true

-- set number column width
vim.opt.numberwidth = 4

-- always sho the sign column
vim.opt.signcolumn = 'yes'

-- enable long lines wrapping
vim.opt.wrap = true

vim.opt.cursorline = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.title = false

-- vim.opt.fillchars = vim.opt.fillchars + "eob: "
-- vim.opt.fillchars:append {
--     stl = " ",
-- }
-- 
-- vim.opt.shortmess:append "c"
-- 
-- vim.cmd 'set whichwrap+=<,>,[,],h,l'
-- vim.cmd [[set iskeyword+=-]]
-- 
-- vim.g.netrw_banner = 0
-- vim.g.netrw_mouse = 2

