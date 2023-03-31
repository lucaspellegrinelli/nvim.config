local rip = require("rip")

-- rip.setup({
--     keybinds = {
--         toggleMark = "x",
--         toggleCollapse = "l",
--         markAllInFile = "a",
--     },
-- })

vim.keymap.set('n', '<leader>rp', rip.replace_in_project, {})
vim.keymap.set('n', '<leader>rg', rip.replace_in_git, {})
