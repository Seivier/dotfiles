
local lsp_servers = {
  "lua_ls", -- lua
  "clangd", -- c/cpp
  "ocamllsp", -- ocaml
  "typst_lsp"
}

local M = {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    {"williamboman/mason-lspconfig.nvim", 
      opts = {
        ensure_installed = lsp_servers
      },
      dependencies = {
        "williamboman/mason.nvim",
        opts = {},
      },
    },
    {"hrsh7th/cmp-nvim-lsp"},
  },
}

M.config = function()
--   local lsp_mason = require("mason-lspconfig")
--   local lsp_config = require("lspconfig")
--
--   local on_attach = function(_, bufnr)
--     local function buf_set_option(...)
--       vim.api.nvim_buf_set_option(bufnr, ...)
--     end
--   end
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  for _, lsp in ipairs(lsp_servers) do
    require('lspconfig')[lsp].setup({
      capabilities = capabilities
    })
  end

  require('lspconfig').lua_ls.setup({
    -- capabilities = capabilities,
    -- settings = {
    --   Lua = {
    --     runtime = {
    --       -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
    --       version = "LuaJIT",
    --     },
    --     diagnostics = {
    --       -- Get the language server to recognize the `vim` global
    --       globals = { "vim" },
    --     },
    --     workspace = {
    --       -- Make the server aware of Neovim runtime files
    --       library = vim.api.nvim_get_runtime_file("", true),
    --     },
    --     -- Do not send telemetry data containing a randomized but unique identifier
    --     telemetry = {
    --       enable = false,
    --     },
    --   }
    -- }
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          diagnostics = {
            globals = {
              "vim",
            },
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            -- library = { vim.env.VIMRUNTIME }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            library = vim.api.nvim_get_runtime_file("", true)
          },
        })
        client.notify("workspace/didChangeConfiguration", { settings = client.settings })
      end
      return true
    end
  })
end


return M
