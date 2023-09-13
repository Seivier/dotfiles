local lsp_servers = {
  "lua_ls",   -- lua
  "clangd",   -- c/cpp
  "ocamllsp", -- ocaml
  "typst_lsp", -- typst
  "pyright",  -- python
  "html",     -- html
  "tsserver", -- typescript & javascript
}

local M = {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = lsp_servers,
      },
      dependencies = {
        "williamboman/mason.nvim",
        opts = {},
      },
    },
    { "hrsh7th/cmp-nvim-lsp" },
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = { lsp = { auto_attach = true } },
    },
    { "folke/neodev.nvim",              opts = {} },
    { "jose-elias-alvarez/null-ls.nvim" },
  },
}

M.config = function()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting

  null_ls.setup({
    sources = {
      formatting.prettier,
      formatting.stylua,
      formatting.autopep8,
      formatting.djlint,
      formatting.ocamlformat,
      formatting.prettier,
    },
  })

  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.offsetEncoding = "utf-16"
  
  for _, lsp in ipairs(lsp_servers) do
    require("lspconfig")[lsp].setup({
      capabilities = capabilities,
    })
  end
end

return M
