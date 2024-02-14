local navic = require("nvim-navic")

navic.setup({
	icons = {
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = " ",
		Interface = " ",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = " ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = " ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},
})

require("lualine").setup({
	sections = {
		lualine_c = {
			"navic",

			-- component specific options
			color_correction = dynamic, -- can be nil, "static" or "dynamic". this option is useful only when you have highlights enabled.
			-- many colorschemes don't define same backgroud for nvim-navic as their lualine statusline backgroud.
			-- setting it to "static" will perform a adjustment once when the component is being setup. this should
			--	 be enough when the lualine section isn't changing colors based on the mode.
			-- setting it to "dynamic" will keep updating the highlights according to the current modes colors for
			--	 the current section.

			navic_opts = nil, -- lua table with same format as setup's option. all options except "lsp" options take effect when set here.
		},
	},
	-- OR in winbar
	-- winbar = {
	-- 	lualine_c = {
	-- 		"navic",
	-- 		color_correction = nil,
	-- 		navic_opts = nil,
	-- 	},
	-- },
})

-- navic.setup({
-- 	icons = {
-- 		File = " ",
-- 		Module = " ",
-- 		Namespace = " ",
-- 		Package = " ",
-- 		Class = " ",
-- 		Method = " ",
-- 		Property = " ",
-- 		Field = " ",
-- 		Constructor = " ",
-- 		Enum = " ",
-- 		Interface = " ",
-- 		Function = " ",
-- 		Variable = " ",
-- 		Constant = " ",
-- 		String = " ",
-- 		Number = " ",
-- 		Boolean = " ",
-- 		Array = " ",
-- 		Object = " ",
-- 		Key = " ",
-- 		Null = " ",
-- 		EnumMember = " ",
-- 		Struct = " ",
-- 		Event = " ",
-- 		Operator = " ",
-- 		TypeParameter = " ",
-- 	},
-- })
