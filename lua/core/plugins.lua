require("lazy").setup({
    {
        "rose-pine/neovim",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            require("core.configs.treesitter")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("core.configs.telescope")
        end,
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("core.configs.lsp.mason")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = function()
            require("core.configs.lsp.lspconfig")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            require("core.configs.cmp")
        end,
    },
    {
        "mfussenegger/nvim-lint",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("core.configs.linting")
        end,
    },
    {
        "stevearc/conform.nvim",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("core.configs.formatting")
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "master",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("core.configs.harpoon")
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            require("core.configs.fugitive")
        end,
    },
    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").create_default_mappings()
        end,
    },
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "lucaspellegrinelli/rip.nvim",
        lazy = true,
        config = function()
            require("core.configs.rip")
        end,
    },
    "tpope/vim-commentary",
    "github/copilot.vim",
    "airblade/vim-rooter",
})
