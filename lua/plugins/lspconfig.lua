return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

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

        lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.tsserver.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

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

        lspconfig.html.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.cssls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

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
}
