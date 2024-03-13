local M = {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- "nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
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
	require("nvim-treesitter.configs").setup(opts)

	require("nvim-ts-autotag").setup({
		autotag = {
			enable = true,
		},
		filetypes = {
			"html",
			"javascript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"xml",
			"xsl",
			"jsx",
			"tsx",
			"htmldjango",
		},
	})
end

return M
