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

-- Setup Python LSP
require'lspconfig'.pyright.setup{}

-- Setup null-ls for formatting code
local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        require'null-ls'.builtins.formatting.black,
        require'null-ls'.builtins.formatting.isort,
    }
})

