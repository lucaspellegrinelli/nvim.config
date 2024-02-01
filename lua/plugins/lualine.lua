return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lualine").setup({
            options = {
                theme = "onedark",
                section_separators = "",
                icons_enabled = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = {},
                lualine_x = {
                    {
                        "filename",
                        file_status = true,
                        path = 1,
                    },
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            extensions = {
                "oil",
            },
        })
    end,
}
