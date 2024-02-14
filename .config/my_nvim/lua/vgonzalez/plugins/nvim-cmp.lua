-- require("lsp-zero").extend_cmp()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local lspkind = require("lspkind")

lspkind.init({
	symbol_map = {
		Copilot = "",
	},
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#944dff" })
cmp.setup({

	-- completion = {
	-- 	autocomplete = false,
	-- },
	-- preselect = "item",
	-- completion = {
	-- 	completeopt = "noinsert",
	-- },
	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		-- { name = "buffer" },
		{ name = "path" },
		-- { name = "cmdline" },
	},

	mapping = {
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
		-- 	if cmp.visible() then
		-- 		local entry = cmp.get_selected_entry()
		-- 		if not entry then
		-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		-- 		else
		-- 			cmp.confirm()
		-- 		end
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s", "c" }),
		-- ["<C-p>"] = cmp.mapping.complete(),
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),

		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
		-- 	-- they way you will only jump inside the snippet region
		-- 	elseif luasnip.expand_or_jumpable() then
		-- 		luasnip.expand_or_jump()
		-- 	elseif has_words_before() then
		-- 		cmp.complete()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		--
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
		}),
	},
	window = {
		--  max  completion entries
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})
