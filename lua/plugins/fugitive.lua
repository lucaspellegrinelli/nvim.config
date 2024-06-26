return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gp", "<cmd>Git -c push.default=current push<CR>")
        vim.keymap.set("n", "<leader>gfp", function ()
            local confirm = vim.fn.input("Type 'force' to confirm: ")
            if confirm == "force" then
                vim.cmd("Git -c push.default=current push --force")
            end
        end)

        vim.keymap.set("n", "ge", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "gi", "<cmd>diffget //3<CR>")
    end,
}
