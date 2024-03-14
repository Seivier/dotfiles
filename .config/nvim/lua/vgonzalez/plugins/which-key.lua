local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

M.config = function()
	require("which-key").register({
		["<leader>"] = {
			w = "+window",
			b = "+buffer",
			t = "+tab",
			l = "+lsp",
			g = "+git",
			h = "+harpoon",
			i = "+icon",
			o = "+open",
			s = "+search",
			["1"] = "which_key_ignore",
			["2"] = "which_key_ignore",
			["3"] = "which_key_ignore",
			["4"] = "which_key_ignore",
			["5"] = "which_key_ignore",
			["6"] = "which_key_ignore",
			["7"] = "which_key_ignore",
			["8"] = "which_key_ignore",
			["9"] = "which_key_ignore",
			['c'] = "which_key_ignore",
			['d'] = "which_key_ignore",
		},
	})
end

return M
