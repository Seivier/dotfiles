local M = {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },

}

M.config = function()
  local ls = require("luasnip")
  local s = ls.s
  local t = ls.text_node
  local i = ls.i
  local fmt = require("luasnip.extras.fmt").fmt
  ls.add_snippets("cpp", {
    s({ trig="lc", name="LeetCode template" },
      { t({ "#include <vector>", "#include <string>", "", "using namespace std;", "", "class Solution {", "public:", "", }), i(1),
        t({ "", "};" }) })
  })
end

return M
