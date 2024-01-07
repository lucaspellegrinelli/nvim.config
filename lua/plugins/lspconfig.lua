return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- For LSP diagnostics, but this conflicts with the nvim-lint
        -- (showing both)
        -- vim.diagnostic.config({
        --     update_in_insert = true,
        -- })

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        end

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                -- formatters
                "prettier",
                "stylua",
                "isort",
                "black",
                "clang-format",

                -- linters
                "pylint",
                "eslint_d",
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "pyright",
                "tsserver",
                "html",
                "cssls",
                "tailwindcss",
                "svelte",
                "lua_ls",
                "clangd",
            },
            automatic_installation = true,
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end,
                ["lua_ls"] = require("plugins.lsp.lua_ls")(lspconfig, capabilities, on_attach),
                ["clangd"] = require("plugins.lsp.clangd")(lspconfig, capabilities, on_attach),
                ["svelte"] = require("plugins.lsp.svelte")(lspconfig, capabilities, on_attach),
            },
        })
    end,
}
