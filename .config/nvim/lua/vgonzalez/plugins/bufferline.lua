return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  lazy = false,
  dependecies = {
    { "catppuccin/nvim", name = "catppuccin" },
  },
  opts = {
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          -- separator = true
        }
      },
    },
  },
}
