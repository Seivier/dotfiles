local M = {
	"nvim-neorg/neorg",
	dependencies = { "luarocks.nvim" },
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.export"] = {},
				["core.export.markdown"] = {
					config = {
						extensions = "all",
					},
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.integrations.nvim-cmp"] = {},
				["core.dirman"] = {
					-- config = {
					-- 	workspaces = {
					-- 		notes = "~/notes",
					-- 	},
					-- 	default_workspace = "notes",
					-- },
				},
			},
		})
	end,
}

return {}
