local M = {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- "nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
}

M.opts = {
	ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc", "python", "cpp" },
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
}

M.config = function(_, opts)
	local treesitter_imported_ok, treesitter = pcall(require, "nvim-treesitter.configs")
	if not treesitter_imported_ok then
		return
	end
	treesitter.setup(opts)

	local register = vim.treesitter.language.register
	-- register("html", "htmldjango") -- enable html parser in htmldjango file
end

return M
