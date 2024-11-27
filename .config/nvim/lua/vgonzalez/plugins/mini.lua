local M = {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()
		-- require("mini.operators").setup()
		require("mini.jump").setup()
		require("mini.jump2d").setup()
	end,
}

return M
