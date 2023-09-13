local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
}

M.config = function()
  local wk = require("which-key")
  wk.setup({})
  wk.register({
    f = {
      name = "Telescope",
      f = "Find files",
      g = "Find in files",
      b = "Find buffers",
      h = "Find help tags",
      e = "Open browser",
    },
    l = {
      name = "LSP",
      h = "Signature help",
      D = "Peek type definition",
      d = "Peek definition",
      rn = "Rename",
      ca = "Code action",
      o = "Outline",
      f = "Format",
    },
    w =  {
      name = "Windows",
      s = "Split",
      v = "Vertical split",
      x = "Close",
    },
    t = {
      name = "Tabs",
      n = "Next",
      p = "Previous",
      o = "New",
      x = "Close",
    },
    n = {
      name = "Navbuddy",
      b = "Open",
    },
  }, { prefix = "<leader>" })
  wk.register({
    t = {
      name = "Tmux",
      s = "Sessions",
      w = "Windows",
    },
  }, { prefix = "<leader>f" })
end

return M
