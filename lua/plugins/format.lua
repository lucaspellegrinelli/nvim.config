return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            svelte = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            lua = { "stylua" },
            python = { "isort", "black" },
        },
    },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({
                    lsp_fallback = true,
                    async = true,
                    timeout_ms = 1000,
                })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
}
