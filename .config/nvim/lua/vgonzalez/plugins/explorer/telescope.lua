local M = {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  cmd = "Telescope",
}

M.dependencies = {
  'nvim-lua/plenary.nvim',
  -- Extensions
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "kkharji/sqlite.lua" }
  },
  {
    "gbrlsnchs/telescope-lsp-handlers.nvim",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "camgraff/telescope-tmux.nvim",
    dependencies = {
      'norcalli/nvim-terminal.lua'
    },
  },
  {
    "tsakirist/telescope-lazy.nvim"
  }
}

M.config = function()
  local tel = require("telescope")
  tel.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
          -- ["<C-o>"] = "select_default",
          ["<C-h>"] = "which_key"
        },
        n = {
          -- ["o"] = "select_default"
        }
      }
    },
    extensions = {
    }
  })

  tel.load_extension("frecency")
  tel.load_extension("lsp_handlers")
  tel.load_extension("file_browser")
  tel.load_extension("tmux")
  tel.load_extension("lazy")
end

return M
