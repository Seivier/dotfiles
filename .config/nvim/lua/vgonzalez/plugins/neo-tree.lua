local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
}

M.config = function()
	-- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
	-- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
	-- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
	-- vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
	require("neo-tree").setup({
		close_if_last_window = true,
		enable_git_status = true,
		enable_diagnostics = true,
		default_component_configs = {
			name = {
				use_git_status_colors = true,
			},
			file_size = {
				enabled = true,
				required_width = 64, -- min width of window required to show this column
			},
		},
		window = {
			position = "right",
		},
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				never_show = {
					".DS_Store",
				},
			},
			hijack_netrw_behavior = "open_current",
		},
		-- source_selector = {
		-- 	winbar = true,
		-- 	statusline = false,
		-- },
	})
end

return M
