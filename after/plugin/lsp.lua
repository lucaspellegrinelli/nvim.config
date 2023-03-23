local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Remove <Tab> from the nvim-cmp completion menu so that it doesn't
-- interfere with the tab completion in the Github Copilot.
local cmp = require('cmp')
cmp.setup({
    mapping = {
        -- Remove the mapping for <Tab>
        ['<Tab>'] = cmp.mapping(function(fallback)
            fallback()
        end),
    },
})

-- Make so pylsp uses Black and Flake8 for formatting and linting
require'lspconfig'.pyright.setup{
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end,
    settings = {
        python = {
            formatting = {
                provider = 'black',
            },
            linting = {
                enabled = true,
                provider = 'flake8',
            },
        },
    },
}

