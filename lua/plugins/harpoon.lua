return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        settings = {
            save_on_toggle = true,
            sync_on_ui_close = true,
        },
    },
    init = function()
        local harpoon = require("harpoon")

        vim.keymap.set("n", "<leader>m", function()
            harpoon:list():append()
        end)
        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<leader>9", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<leader>0", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<leader>-", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<leader>=", function()
            harpoon:list():select(4)
        end)
    end,
}
