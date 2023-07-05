local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warning = "W",
        hint = "H",
        info = "I"
    },
})

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("n", "<C-e>", function() vim.diagnostic.open_float() end)

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
require 'lspconfig'.pyright.setup {}

vim.diagnostic.config({
    virtual_text = true
})
