require("configs.packer")
require("configs.remap")
require("configs.set")
require("configs.netrw")

-- Mark trailing whitespaces
vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=#c0392b')
vim.cmd('match ExtraWhitespace /\\s\\+$/')
vim.cmd('autocmd BufWinEnter * match ExtraWhitespace /\\s\\+$/')
vim.cmd('autocmd InsertEnter * match ExtraWhitespace /\\s\\+\\%#\\@<!$/')
vim.cmd('autocmd InsertLeave * match ExtraWhitespace /\\s\\+$/')
vim.cmd('autocmd BufWinLeave * call clearmatches()')
