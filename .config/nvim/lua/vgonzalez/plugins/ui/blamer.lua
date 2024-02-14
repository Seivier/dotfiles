local M = {
  "apzelos/blamer.nvim",
  lazy = false,
}

M.config = function ()
  vim.g.blamer_enabled = true
  vim.g.blamer_delay = 100
end

return M
