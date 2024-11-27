local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"SmiteshP/nvim-navic",
			opts = {
				click = true,
				lazy_update_context = true,
			},
		},
	},
}

M.config = function()
	local function get_vim_mode()
		local icon = {
			n = " ",
			i = " ",
			c = " ",
			V = " ",
			v = " ",
			R = " ",
			r = " ",
			t = " ",
		}
		local vim_mode = vim.fn.mode()
		local ic = icon[vim_mode]
		if ic == nil then
			ic = ""
		end
		return ic
	end
	-- local function get_last_buffer_filename()
	-- 	local this_buffer = vim.fn.bufname()
	-- 	local last_buffer = vim.fn.bufname("#")
	-- 	if last_buffer == "" or last_buffer == this_buffer then
	-- 		return "No previous buffer"
	-- 	else
	-- 		-- just the name
	-- 		return vim.fn.fnamemodify(last_buffer, ":t")
	-- 	end
	-- end
	-- p
	local my_filename = require("lualine.components.filename"):extend()
	my_filename.apply_icon = require("lualine.components.filetype").apply_icon

	local function diff_source()
		local gitsigns = vim.b.gitsigns_status_dict
		if gitsigns then
			return {
				added = gitsigns.added,
				modified = gitsigns.changed,
				removed = gitsigns.removed,
			}
		end
	end

	require("lualine").setup({
		options = {
			theme = "auto",
			component_separators = "",
			-- round section separtors
			-- section_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = { "Dashboard", "TelescopePrompt", "neo-tree" },
				winbar = { "Dashboard", "TelescopePrompt", "neo-tree", "toggleterm" },
			},
		},
		sections = {
			lualine_a = {
				{ get_vim_mode, padding = { left = 1, right = 0 } },
				{ "mode", padding = {left = 0, right = 1} },
			},
			lualine_b = {
				-- "filetype",
				{ "filetype", icon_only = true, colored = false, padding = { left = 1, right = 0 } },
				{ "filename", path = 0, padding = { left = 0, right = 1 } },
			},
			lualine_c = {
				{
					"navic",
					cond = function()
						return vim.fn.winwidth(0) >= 120
					end,
				},
			},
			lualine_x = {
				{
					"tabs",
					mode = 0,
					path = 0,
					-- tabs_color = { active = "lualine_a_normal", inactive = "lualine_a_inactive" },
					use_mode_colors = false,
					show_modified_status = false,
					cond = function()
						return vim.fn.tabpagenr("$") ~= 1
					end,
				},
				{
					"diagnostics",
					sources = { "nvim_lsp", "nvim_diagnostic" },
					sections = { "error", "warn", "info", "hint" },
					colored = false
				},
			},
			lualine_y = {
				{
					"diff",
					colored = false,
					source = diff_source,
				},
			},
			lualine_z = {
				{ "b:gitsigns_head", icon = "" },
			},
		},
		inactive_sections = {
			lualine_c = {
				{ "filetype", icon_only = true, padding = { left = 1, right = 0 } },
				{ "filename", padding = { left = 0, right = 1 } },
			},
			lualine_x = {
				{
					"diff",
					colored = true,
					source = diff_source,
				},
			},
		},

		extensions = {
			"neo-tree",
			"lazy",
			"toggleterm",
			"oil",
		},
	})
end

return M
