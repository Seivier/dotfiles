return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        mason = true,
        -- cmp = true,
        neotree = true,
        which_key = true,
        -- treesitter = true,
        --     telescope = {
        --       enabled = true,
        --     },
        --     barbecue = {
        --       dim_dirname = true, -- directory name is dimmed by default
        --       bold_basename = true,
        --       dim_context = false,
        --       alt_background = false,
        --     },
      },
      -- transparent_background = true,
      term_colors = true,
      flavour = "mocha",
    }
  },
}
