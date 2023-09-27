-- general plugins
return {
  -- tmux
  { "christoomey/vim-tmux-navigator", lazy = false },

  -- transparent
  { "xiyaowong/nvim-transparent",     lazy = false },

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

  -- icon picker
  {
    "ziontee113/icon-picker.nvim",
    cmd = "IconPickerYank",
    dependencies = {
      "stevearc/dressing.nvim",
    },
    opts = {
      disable_legacy_commands = true,
    },
  },
  -- {
  --   "glepnir/nerdicons.nvim",
  --   cmd = "NerdIcons",
  --   config = function()
  --     require("nerdicons").setup({})
  --   end,
  -- },
  --
  -- Smooth scrolling
  -- { "karb94/neoscroll.nvim", lazy = false, opts = {} },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  "norcalli/nvim-terminal.lua",

  -- auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },

  -- blame
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd("highlight default link gitblame SpecialComment")
    end,
  },
}
