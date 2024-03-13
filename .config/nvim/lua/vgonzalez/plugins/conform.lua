local M = {
	"stevearc/conform.nvim",
}

M.opts = {
	-- format_on_save = {
	-- 	timeout_ms = 500,
	-- 	lsp_fallback = true,
	-- },
	formatters_by_ft = {
		lua = { "stylua" },

		cpp = { "clang-format" },
	},
}

return M
