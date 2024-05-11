local overseer = require("overseer")

local tmpl = {
  priority = 60,
  params = {
    cmd = { type = "string" },
    file = { type = "string" }
  },
  builder = function (params)
    return {
      cmd = { "typst" },
      args = { params.cmd, params.file, "--open"},
      components = {"default"}
    }
  end
}

return {
  condition = {
    filetype = {"typst"}
  },
  generator = function (opts, cb)
		local file = vim.fn.expand("%:p")
		local name = vim.fn.expand("%:t:r")
    local ret = {}
    local commands = { "watch", "compile" }
    for _, c in ipairs(commands) do
      table.insert(ret, overseer.wrap_template(tmpl,
        {
          name = string.format("%s %s", c, name)
        },
        {
          cmd = c, file = file
        }
      ))
    end
    cb(ret)
  end
}
