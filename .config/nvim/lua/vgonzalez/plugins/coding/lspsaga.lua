local M = {

  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons'      -- optional
  },
  event = "LspAttach"
}

M.config = function()
  require('lspsaga').setup({
    ui = {
      code_action = "󱠂",
      border = "rounded",
      kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    },
    lightbulb = {
      virtual_text = false
    }
  })
end

return M
