-- Mark marked files in netrw
vim.cmd("highlight netrwMarkFile ctermbg=blue guibg=#9b59b6")

-- Keep { and } from modifying the jumplist
vim.cmd('nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>')
vim.cmd('nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>')
