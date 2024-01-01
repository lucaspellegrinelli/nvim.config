return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        use_default_keymaps = false,
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["-"] = "actions.parent",
            ["="] = "actions.refresh",
        },
    },
    init = function()
        vim.keymap.set("n", "<leader>p", "<CMD>Oil<CR>")
    end,
}
