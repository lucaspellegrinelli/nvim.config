local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local function fuzzy_find_files()
    if vim.fn.system("git rev-parse --is-inside-work-tree") == "true" then
        builtin.git_files()
    else
        builtin.find_files()
    end
end

local function fuzzy_find_in_buffer()
    builtin.current_buffer_fuzzy_find(themes.get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end

vim.keymap.set("n", "<C-p>", fuzzy_find_files, {})
vim.keymap.set("n", "<C-k>", fuzzy_find_in_buffer, {})
vim.keymap.set("n", "<leader>s", builtin.live_grep, {})

require("telescope").setup({
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
    },
})
