vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0

-- Mark marked files
vim.cmd('highlight netrwMarkFile ctermbg=blue guibg=#9b59b6')

vim.cmd([[
    function! NetrwMapping()
        " Selecting or unselecting files
        nmap <buffer> <TAB> mf
        nmap <buffer> <S-TAB> mF
        nmap <buffer> <Leader><TAB> mu

        " Copy files
        nmap <buffer> fc mc
        nmap <buffer> fC mtmc

        " Move files
        nmap <buffer> fm mm
        nmap <buffer> fM mtmm

        " Execute commands on files
        nmap <buffer> fx mx
    endfunction
    augroup netrw_mapping
        autocmd!
        autocmd FileType netrw call NetrwMapping()
    augroup END
]])
