local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  }
}

M.config = function()
  require("neo-tree").setup({
    close_if_last_window = true,
    window = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = {
            ".DS_Store"
          },
          hijack_netrw_behavior = "open_default",
        }
      }
    },
    source_selector = {
      winbar = true,
      statusline = false,
    }
  })
end

return M
