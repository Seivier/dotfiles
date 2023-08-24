return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  -- lazy = false,
  -- dependecies = {
  --   { "catppuccin/nvim", name = "catppuccin" },
  -- },
  opts = {
    -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = " File Explorer",
          text_align = "center",
        }
      },
      separator_style = "slope",
      diagnostics = "nvim_lsp",
      numbers = "ordinal",
    },
  },
}
