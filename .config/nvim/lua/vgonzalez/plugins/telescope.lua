local M = {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
}

M.dependencies = {
  "nvim-lua/plenary.nvim",
  -- Extensions
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },
  { "nvim-telescope/telescope-ui-select.nvim" },
  {
    "gbrlsnchs/telescope-lsp-handlers.nvim",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "camgraff/telescope-tmux.nvim",
    dependencies = {
      "norcalli/nvim-terminal.lua",
    },
  },
}

M.config = function()
  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
          ["<C-h>"] = "which_key",
        },
        n = {
          -- ["o"] = "select_default"
        },
      },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown(),
      },
    },
  })

  pcall(require("telescope").load_extension, "fzf")
  pcall(require("telescope").load_extension, "lsp_handlers")
  pcall(require("telescope").load_extension, "file_browser")
  pcall(require("telescope").load_extension, "tmux")
  pcall(require("telescope").load_extension, "harpoon")
end

return M
