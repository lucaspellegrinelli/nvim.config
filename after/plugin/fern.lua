local function fern_init()
    -- Collapse folder
	vim.keymap.set('n', 'h', '<Plug>(fern-action-collapse)', { buffer = true, nowait = true })
    -- vim.keymap.set_keymap('n', '<Left>', '<Plug>(fern-action-collapse)', { buffer = true, nowait = true })

    -- Expand folder
	vim.keymap.set('n', 'l', '<Plug>(fern-action-open-or-expand)', { buffer = true, nowait = true })
	vim.keymap.set('n', '<leader>', '<Plug>(fern-action-open-or-expand)', { buffer = true, nowait = true })
    -- vim.keymap.set_keymap('n', '<Right>', '<Plug>(fern-action-open-or-expand)', { buffer = true, nowait = true })

    -- Enter folder
    vim.keymap.set('n', '<BS>', '<Plug>(fern-action-leave)', { buffer = true })
    vim.keymap.set('n', '<CR>', '<Plug>(fern-action-enter)', { buffer = true })

    -- File operations
	vim.keymap.set('n', 'R', '<Plug>(fern-action-rename)', { buffer = true })
	vim.keymap.set('n', 'M', '<Plug>(fern-action-move)', { buffer = true })
	vim.keymap.set('n', 'C', '<Plug>(fern-action-copy)', { buffer = true })
	vim.keymap.set('n', 'N', '<Plug>(fern-action-new-path)', { buffer = true })
	vim.keymap.set('n', 'T', '<Plug>(fern-action-new-file)', { buffer = true })
	vim.keymap.set('n', 'D', '<Plug>(fern-action-new-dir)', { buffer = true })
	vim.keymap.set('n', 'dd', '<Plug>(fern-action-trash)', { buffer = true })
end

local fern_custom = vim.api.nvim_create_augroup("fern-custom", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	callback = fern_init,
	pattern = 'fern',
	group = fern_custom,
})
