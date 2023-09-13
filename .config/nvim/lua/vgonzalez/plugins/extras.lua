-- general plugins
return {
    -- tmux
    { "christoomey/vim-tmux-navigator", lazy = false },

    -- surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        opts = {},
    },

    -- comments
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
        lazy = false,
    },

    -- nerd icons
    {
        "glepnir/nerdicons.nvim",
        cmd = "NerdIcons",
        config = function()
            require("nerdicons").setup({})
        end,
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    "norcalli/nvim-terminal.lua",
}
