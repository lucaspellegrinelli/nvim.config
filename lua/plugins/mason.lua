return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
    build = function()
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason_lspconfig.setup({
            ensure_installed = {
                "pyright",
                "tsserver",
                "html",
                "cssls",
                "tailwindcss",
                "svelte",
                "lua_ls",
            },
            automatic_installation = true,
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "isort",
                "black",
                "pylint",
                "eslint_d",
            },
        })
    end,
}
