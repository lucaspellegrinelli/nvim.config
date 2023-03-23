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
