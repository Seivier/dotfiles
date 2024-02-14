local cat = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
}

cat.config = function()
  local c = require("catppuccin")
  c.setup({
  --   integrations = {
  --     mason = true,
  --     -- cmp = true,
  --     neotree = true,
  --     which_key = true,
  --     lsp_saga = true,
  --     -- treesitter = true,
  --     --     telescope = {
  --     --       enabled = true,
  --     --     },
  --     --     barbecue = {
  --     --       dim_dirname = true, -- directory name is dimmed by default
  --     --       bold_basename = true,
  --     --       dim_context = false,
  --     --       alt_background = false,
  --     --     },
  --   },
    transparent_background = true,
    -- term_colors = true,
  --   flavour = "mocha",
  })
  -- vim.cmd[[colorscheme catppuccin-mocha]]
  vim.cmd.colorscheme("catppuccin-frappe")
end

local gb = {
  "morhetz/gruvbox",
  priority = 1000,
}

gb.config = function ()
  -- vim.cmd.colorscheme("gruvbox")
end

local rp = {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,

}

local tn = {
  "folke/tokyonight.nvim",
  priority = 1000,
  opts = {},
}

tn.config = function ()
  -- vim.cmd.colorscheme("tokyonight-night")
end


return {
  cat,
  gb,
  rp,
  tn
}
