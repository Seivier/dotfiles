local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local M = {
  "hrsh7th/nvim-cmp",
  -- lazy = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim"
  },
}

M.config = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")

  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    -- mapping = cmp.mapping.preset.insert({
    -- 	["<C-b>"] = cmp.mapping.scroll_docs(-4),
    -- 	["<C-f>"] = cmp.mapping.scroll_docs(4),
    -- 	["<C-Space>"] = cmp.mapping.complete(),
    -- 	["<C-e>"] = cmp.mapping.abort(),
    -- 	["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- }),
    --
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- they way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" }, -- For luasnip users.
      -- { name = "orgmode" },
    }, {
      -- { name = "buffer" },
      { name = "path" },
    }),
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        ellipsis_char = "...",
      })
    }
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  -- LSP
  -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
  -- local lsp_servers = { "lua_ls" }
  -- for _, lsp in ipairs(lsp_servers) do
  --   require('lspconfig')[lsp].setup({
  --     capabilities = capabilities
  --   })
  -- end

  -- require('lspconfig').lua_ls.setup({
  --   -- capabilities = capabilities,
  --   -- settings = {
  --   --   Lua = {
  --   --     runtime = {
  --   --       -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
  --   --       version = "LuaJIT",
  --   --     },
  --   --     diagnostics = {
  --   --       -- Get the language server to recognize the `vim` global
  --   --       globals = { "vim" },
  --   --     },
  --   --     workspace = {
  --   --       -- Make the server aware of Neovim runtime files
  --   --       library = vim.api.nvim_get_runtime_file("", true),
  --   --     },
  --   --     -- Do not send telemetry data containing a randomized but unique identifier
  --   --     telemetry = {
  --   --       enable = false,
  --   --     },
  --   --   }
  --   -- }
  --   on_init = function(client)
  --     local path = client.workspace_folders[1].name
  --     if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
  --       client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
  --         runtime = {
  --           -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
  --           version = 'LuaJIT'
  --         },
  --         diagnostics = {
  --           globals = {
  --             "vim",
  --           },
  --         },
  --         -- Make the server aware of Neovim runtime files
  --         workspace = {
  --           -- library = { vim.env.VIMRUNTIME }
  --           -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
  --           library = vim.api.nvim_get_runtime_file("", true)
  --         },
  --       })
  --       client.notify("workspace/didChangeConfiguration", { settings = client.settings })
  --     end
  --     return true
  --   end
  -- })
end

return M
