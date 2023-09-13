local cat = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
}

cat.config = function()
  local th = require("catppuccin")
  th.setup({
    integrations = {
      mason = true,
      -- cmp = true,
      neotree = true,
      which_key = true,
      lsp_saga = true,
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
  })
  -- vim.cmd[[colorscheme catppuccin-mocha]]
  -- vim.cmd.colorscheme("catppuccin")
end

local gb = {
  "morhetz/gruvbox"
}

local rp = {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,

}
rp.config = function()
  vim.cmd.colorscheme("rose-pine")
end

return {
  cat,
  gb,
  rp
}
