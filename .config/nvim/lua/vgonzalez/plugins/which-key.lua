local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

M.config = function()
	local wk = require("which-key")
	wk.add({
		{"<leader>w", desc = "window"},
		-- {"<leader>b", desc = "buffer"},
		-- {"<leader>t", desc = "tab"},
		{"<leader>l", desc = "lsp"},
		{"<leader>g", desc = "git"},
		{"<leader>h", desc = "harpoon"},
		{"<leader>i", desc = "icon"},
		{"<leader>m", desc = "make"},
		-- {"<leader>o", desc = "open"},
		{"<leader>s", desc = "search"},
		{"<leader>1", hidden = true},
		{"<leader>2", hidden = true},
		{"<leader>3", hidden = true},
		{"<leader>4", hidden = true},
		{"<leader>5", hidden = true},
		{"<leader>6", hidden = true},
		{"<leader>7", hidden = true},
		{"<leader>8", hidden = true},
		{"<leader>9", hidden = true},
		{"<leader>c", hidden = true},
		{"<leader>d", hidden = true},
	})
end

return M
