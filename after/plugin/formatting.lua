-- Setup null-ls for formatting code
local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        require 'null-ls'.builtins.formatting.black,
        require 'null-ls'.builtins.formatting.isort,
        require 'null-ls'.builtins.formatting.rustfmt,
        require 'null-ls'.builtins.formatting.eslint_d,
    }
})
