local M = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
}

M.config = function()
  local configs = require("nvim-treesitter.configs")
  local parsers = require("nvim-treesitter.parsers")
  local autotag = require("nvim-ts-autotag")
  -- -- local parsername = parsers.filetype_to_parsername
  -- -- parsername.htmldjango = "html"
  -- vim.treesitter.language.register("htmldjango", "html")
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

  autotag.setup({
    autotag = {
      enable = true,
    },
    filetypes = {
      "html",
      "javascript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "xml",
      "xsl",
      "jsx",
      "tsx",
      "htmldjango",
    },
  })
end

return M
