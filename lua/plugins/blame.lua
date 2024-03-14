return {
    "f-person/git-blame.nvim",
    config = function()
        require("gitblame").setup {
            enabled = false,
        }

        vim.api.nvim_set_keymap("n", "<leader>gb", ":GitBlameToggle<CR>", { noremap = true, silent = true })
    end,
}
