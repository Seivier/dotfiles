local M = {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end,
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-path",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"windwp/nvim-autopairs",
		{
			"onsails/lspkind.nvim",
			config = function()
				require("lspkind").init()
			end,
		},
	},
}

M.config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	luasnip.config.setup({})
	require("luasnip.loaders.from_vscode").lazy_load()
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		completion = { completeopt = "menu,preview,menuone,noinsert,noselect" },
		mapping = {
			-- ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			-- ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<Tab>"] = cmp.mapping(function(fallback)
				  -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
				  if cmp.visible() then
					local entry = cmp.get_selected_entry()
					if not entry then
					  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					end
					cmp.confirm()
				  else
					fallback()
				  end
				end, {"i","s","c",}),
			["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-u>"] = cmp.mapping.scroll_docs(4),
			["<C-c>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<C-l>"] = cmp.mapping(function()
				if luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				end
			end, { "i", "s" }),
			["<C-h>"] = cmp.mapping(function()
				if luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { "i", "s" }),
		},
		sources = {
			-- { name = "copilot" },
			{ name = "nvim_lsp" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "nvim_lua" },
			{ name = "luasnip" }, -- For luasnip users.
			{ name = "path" },
			{ name = "neorg" }
		},
		formatting = {
			-- expandable_indicator = true,
			-- fields = { cmp.ItemField.Menu, cmp.ItemField.Kind, cmp.ItemField.Abbr },
			format = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50, ellipsis_char = "..." }),
		},
	})

	cmp.setup.cmdline(":", {
		-- mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "path" },
			{ name = "cmdline" },
		},
	})

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	-- vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6E5494" })
end

return M
