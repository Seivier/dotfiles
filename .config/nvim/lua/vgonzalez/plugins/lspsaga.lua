local M = {

	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	event = "LspAttach",
}

M.config = function()
	require("lspsaga").setup({
		ui = {
			border = "rounded",
		},
		symbol_in_winbar = {
			enable = false,
		},
	})
end

return {}
