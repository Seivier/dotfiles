local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

local f = function (idx)
  local file = require("harpoon.mark").get_marked_file_name(idx)
  if not file then
    return "which_key_ignore"
  end
  return file
end

M.config = function()
  local wk = require("which-key")
  wk.register({
    w = "+window",
    b = "+buffer",
    t = "+tab",
    -- f = {
    --   name = "Telescope",
    --   f = "Find files",
    --   g = "Find in files",
    --   b = "Find buffers",
    --   h = "Find help tags",
    --   e = "Open browser",
    -- },
    -- l = {
    --   name = "LSP",
    --   h = "Signature help",
    --   D = "Peek type definition",
    --   d = "Peek definition",
    --   rn = "Rename",
    --   ca = "Code action",
    --   o = "Outline",
    --   f = "Format",
    -- },
    -- n = {
    --   name = "Navbuddy",
    --   b = "Open",
    -- },
    -- h = {
    --   name = "Harpoon",
    --   h = "Quick menu",
    --   f = "Marks",
    --   n = "Next",
    --   p = "Previous",
    --   a = "Add",
    -- },
    -- d = {
    --   name = "Do",
    --   d = "Execute",
    --   m = "Make",
    -- },
    -- g = {
    --   name = "Git",
    --   g = "Status",
    --   h = "Github",
    -- },
    -- i = {
    --   name = "Icon",
    --   e = "Emoji",
    --   n = "Nerd font"
    -- },
    -- o = {
    --   name = "Open",
    --   f = "Containing folder",
    --   p = "PDF",
    -- },
    -- x = {
    --   name = "Trouble",
    -- },
    -- ["1"] = f(1),
    -- ["2"] = f(2),
    -- ["3"] = f(3),
    -- ["4"] = f(4),
    -- ["5"] = f(5),
    -- ["6"] = f(6),
    -- ["7"] = f(7),
    -- ["8"] = f(8),
    -- ["9"] = f(9),
    -- e = "File tree"
  }, { prefix = "<leader>"})
  -- wk.register({
  --   t = {
  --     name = "Tmux",
  --     s = "Sessions",
  --     w = "Windows",
  --   },
  -- }, { prefix = "<leader>f" })
end

return M
