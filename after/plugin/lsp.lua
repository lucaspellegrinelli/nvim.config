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

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

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
