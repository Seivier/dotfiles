return {
	"apzelos/blamer.nvim",
	lazy = false,
	init = function()
		vim.g.blamer_enabled = true
		vim.g.blame_delay = 100
		vim.g.blamer_show_in_insert_modes = false
	end,
}
