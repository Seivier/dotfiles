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
		c = { "clang-format" },
		typst = { "typstfmt" },
		markdown = { "prettier" },
	},
	-- formatters = {
	-- 	["clang-format"] = {
	-- 		inherit = true,
	-- 		prepend_args = { "-style=Google" },
	-- 	},
	-- },
}

return M
