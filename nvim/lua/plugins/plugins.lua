require("lazy").setup({
    {   
        "zootedb0t/citruszest.nvim",
        lazy = false,
        priority = 1000, 
    },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.8",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter", build= ":TSUpdate"
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        }

    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },

})
