-- Netrw config
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Hide mode since it's already displayed in the statusline
vim.opt.showmode = false

-- Default tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Keep vertical padding when scrolling
vim.opt.scrolloff = 8

-- Sync clipboard with system clipboard
vim.opt.clipboard = "unnamedplus"

-- Smart indent on a new line
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Wrap lines
vim.opt.wrap = false

-- Keep sign column always visible
vim.opt.signcolumn = "yes"

-- Keep a undo history in a file
vim.opt.undofile = true

-- Searching settings
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Decrease update time
vim.opt.updatetime = 50
