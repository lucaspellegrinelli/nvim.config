local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>w', function()
    builtin.current_buffer_fuzzy_find(themes.get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

-- ignore useless files
require 'telescope'.setup({
    defaults = {
        file_ignore_patterns = {
            "^./target",
            "^./node_modules",
            "^./.git",
            ".*/__pycache__/.*",

            -- Ignore files ending in .png, .jpg, etc.
            "%.png$",
            "%.jpg$",
            "%.jpeg$",
            "%.gif$",
            "%.bmp$",
            "%.tiff$",
            "%.webp$",
            "%.pdf$",
            "%.pb$",
            "%.index$",
            "%.hspe$",
        },
    }
})
