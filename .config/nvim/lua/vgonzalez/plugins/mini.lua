local M = {
	"echasnovski/mini.nvim",
}

M.config = function()
	-- Better Around/Inside textobjects
	require("mini.ai").setup({ n_lines = 500 })

	-- Add/delete/replace surroundings (brackets, quotes, etc.)
	require("mini.surround").setup()
end

return M
