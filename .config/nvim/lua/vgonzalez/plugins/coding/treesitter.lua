local M = {
  "nvim-treesitter/nvim-treesitter",
  -- dependencies = {
  --   "nvim-treesitter/nvim-treesitter-context",
  -- },
  build = ":TSUpdate",
}

M.config = function()
  local configs = require("nvim-treesitter.configs")
  configs.setup({
    ensure_installed = { "c", "cpp", "lua", "markdown", "markdown_inline" },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  })
end

return M
