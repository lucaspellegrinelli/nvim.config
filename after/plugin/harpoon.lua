local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require("harpoon").setup({
    tabline = true,
})

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

vim.keymap.set("n", "<C-f>", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-m>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-,>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-.>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-/>", function() ui.nav_file(4) end)
