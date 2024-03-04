return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo = require("todo-comments")
        todo.setup({
            signs = false,
            highlight = {
                pattern = [[.*<(KEYWORDS)\s*]],
            },
        })
        vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>TodoTelescope<cr>", { noremap = true, silent = true })
    end,
}
