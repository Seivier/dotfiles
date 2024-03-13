local servers = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = {
						"${3rd}/luv/library",
						unpack(vim.api.nvim_get_runtime_file("", true)),
					},
				},
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	}, -- lua
	clangd = {}, -- c/cpp
	ocamllsp = {}, -- ocaml
	typst_lsp = {}, -- typst
	pyright = {}, -- python
	html = {}, -- html
	tsserver = {}, -- typescript & javascript
	cssls = {}, -- css
	texlab = {}, -- latex
	cmake = {}, -- cmake
}

local M = {
	"neovim/nvim-lspconfig",
	-- lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

	},
	-- { "folke/neodev.nvim",              opts = {} },
	-- { "jose-elias-alvarez/null-ls.nvim" },
}

M.config = function()
	-- local null_ls = require("null-ls")
	-- local formatting = null_ls.builtins.formatting
	-- local diagnostics = null_ls.builtins.diagnostics
	--
	-- null_ls.setup({
	--   sources = {
	--     formatting.prettier,
	--     formatting.stylua,
	--     -- formatting.autopep8,
	--     formatting.pyink,
	--     -- formatting.black,
	--     formatting.djlint,
	--     formatting.ocamlformat,
	--     formatting.prettier,
	--     formatting.cmake_format,
	--     formatting.clang_format,
	--     diagnostics.pylint,
	--     -- diagnostics.cpplint,
	--   },
	--   log_level = "trace",
	-- })

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
	capabilities.offsetEncoding = "utf-16"

	require("mason").setup()

	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {
		"stylua",
		"clang-format",
	})

	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	require("mason-lspconfig").setup({
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		},
	})
end

return M
