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

        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            opts.desc = "Code action"
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

            opts.desc = "Show LSP references"
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)

            opts.desc = "Rename symbol"
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

            opts.desc = "Open diagnostics window"
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

            opts.desc = "Show documentation for what is under cursor"
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "Go to definition"
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

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
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    -- ignore undefined vim global
                                    globals = { "vim" },
                                },
                                workspace = {
                                    -- make language server aware of runtime files
                                    library = {
                                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                        [vim.fn.stdpath("config") .. "/lua"] = true,
                                    },
                                },
                            },
                        },
                    })
                end,
            },
            ["clangd"] = function()
                lspconfig.clangd.setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    cmd = {
                        "clangd",
                        "--offset-encoding=utf-16",
                    },
                })
            end,
            ["svelte"] = function()
                lspconfig.svelte.setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        on_attach(client, bufnr)

                        vim.api.nvim_create_autocmd("BufWritePost", {
                            pattern = { "*.js", "*.ts" },
                            callback = function(ctx)
                                if client.name == "svelte" then
                                    client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
                                end
                            end,
                        })
                    end,
                })
            end,
        })
    end,
}
