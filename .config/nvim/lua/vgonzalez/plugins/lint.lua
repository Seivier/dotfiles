local M = {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
}

M.config = function()
	local lint = require("lint")
	lint.linters_by_ft = {
		cpp = { "cpplint" },
	}

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = vim.api.nvim_create_augroup("linter", { clear = true }),
		callback = function()
			lint.try_lint()
		end,
	})
end

return {}
