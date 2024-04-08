local M = {
	"rcarriga/nvim-notify",
	priority = 1000,
}


M.config = function()
	require("notify").setup({
		-- background_colour = "#000000",
		render = "compact",
		top_down = false,
	})
	vim.notify = require("notify")
end

return M
