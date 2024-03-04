return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        notify_on_error = false,
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
            cpp = { "clang_format" },
            c = { "clang_format" },
            sh = { "shellcheck" },
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
