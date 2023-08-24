-- general plugins
return {
  -- tmux
  { "christoomey/vim-tmux-navigator", lazy = false },

  -- pairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {}
  },

  -- comments
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  -- nerd icons
  { 'glepnir/nerdicons.nvim',         cmd = 'NerdIcons', config = function() require('nerdicons').setup({}) end },

  -- which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function ()
      local wk = require("which-key")
      wk.setup({})
      wk.register({
        f = {
          name = "Telescope",
          f = "Find files",
          g = "Find in files",
          b = "Find buffers",
          h = "Find help tags",
          e = "Open browser",
        }

      }, { prefix = '<leader>' })
      wk.register({
        t = {
          name = 'Tmux',
          s = 'Sessions',
          w = 'Windows'
        }
      }, { prefix = '<leader>f'})

    end
  },
}
