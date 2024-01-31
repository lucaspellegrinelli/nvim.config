return {
    "rose-pine/neovim",
    config = function()
        require("rose-pine").setup({
            variant = "moon",
        })
        vim.cmd("colorscheme rose-pine")
    end,
}
