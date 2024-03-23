local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"SmiteshP/nvim-navic",
	},
}

M.config = function()
	local navic = require("nvim-navic")

	local function get_vim_mode()
		local icon = {
			n = "",
			i = "",
			c = "",
			V = "",
			v = "",
			R = "",
			r = "",
			t = "",
		}
		local vim_mode = vim.fn.mode()
		local ic = icon[vim_mode]
		if ic == nil then
			ic = ""
		end
		return ic
	end

	local function get_last_buffer_filename()
		local this_buffer = vim.fn.bufname()
		local last_buffer = vim.fn.bufname("#")
		if last_buffer == "" or last_buffer == this_buffer then
			return "No previous buffer"
		else
			-- just the name
			return vim.fn.fnamemodify(last_buffer, ":t")
		end
	end
	require("lualine").setup({
		options = {
			theme = "auto",
			component_separators = "",
			section_separators = { "", "" },
			disabled_filetypes = {
				statusline = { "Dashboard", "TelescopePrompt" },
				winbar = { "Dashboard", "TelescopePrompt", "neo-tree", "toggleterm" },
			},
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{ "branch", icon = "" },
				{
					"diagnostics",
					sources = { "nvim_lsp", "nvim_diagnostic" },
					sections = { "error", "warn", "info", "hint" },
					-- diagnostics_color = {
					-- 	error = "DiagnosticError", -- Changes diagnostics' error color.
					-- 	warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
					-- 	info = "DiagnosticInfo", -- Changes diagnostics' info color.
					-- 	hint = "DiagnosticHint", -- Changes diagnostics' hint color.
					-- },
					symbols = { error = " ", warn = " ", info = " ", hint = "󰘥 " },
					always_visible = true, -- Show diagnostics even if there are none.
				},
			},
			lualine_c = {
				"%=",
				{ "harpoon2", separator = " " },
			},
			lualine_x = {},
			lualine_y = { "filetype", "encoding", "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		winbar = {
			lualine_a = {},
			lualine_b = { { "filename", path = 1, shorting_target = 200 } },
			lualine_c = { { "navic", color_correction = nil } },
			lualine_x = { { get_last_buffer_filename, icon = "󰁯" } },
			lualine_y = {},
			lualine_z = {},
		},
		inactive_winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filename", path = 1 } },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		extensions = {
			"neo-tree",
			"lazy",
			"toggleterm",
		},
	})
end

return M
