return {
    "lucaspellegrinelli/rip.nvim",
    config = function()
        local rip = require("rip")
        rip.setup()

        vim.keymap.set("n", "<leader>rp", rip.replace_in_project, {})
        vim.keymap.set("n", "<leader>rg", rip.replace_in_git, {})
    end,
}
