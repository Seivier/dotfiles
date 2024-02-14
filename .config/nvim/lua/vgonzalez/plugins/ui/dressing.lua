local M = {
  'stevearc/dressing.nvim',
}


M.config = function()
  local dressing = require("dressing")
  dressing.setup({
    input = {
      enabled = true,
      tittle_pos = "center",
      insert_only = true,
      start_in_insert = true,
      relative = 'win',
      border = 'solid',
    },
    select = {
      enabled = true,
      nui = {
        border = {
          style = 'solid',
        },
      },
      builtin = {
        border = 'solid',
      },
    }

  })

end

return M
