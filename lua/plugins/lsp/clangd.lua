return function(lspconfig, capabilities, on_attach)
    return function()
        lspconfig.clangd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
            },
        })
    end
end
