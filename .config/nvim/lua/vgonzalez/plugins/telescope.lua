local M = {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
}

M.dependencies = {
	"nvim-lua/plenary.nvim",
	-- Extensions
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{
		"gbrlsnchs/telescope-lsp-handlers.nvim",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"camgraff/telescope-tmux.nvim",
		dependencies = {
			"norcalli/nvim-terminal.lua",
		},
	},
}

M.config = function()
	require("telescope").setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<C-h>"] = "which_key",
				},
				n = {
					["h"] = "which_key",
				},
			},
		},
		-- pickers = {
		--   find_files = {
		--     hidden = true
		--   },
		-- },
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
	})

	pcall(require("telescope").load_extension, "fzf")
	pcall(require("telescope").load_extension, "lsp_handlers")
	pcall(require("telescope").load_extension, "file_browser")
	pcall(require("telescope").load_extension, "tmux")
	pcall(require("telescope").load_extension, "harpoon")
end

M.keys = {
	{
		"<leader>sh",
		function()
			require("telescope.builtin").help_tags()
		end,
		desc = "Search help",
	},
	{
		"<leader>si",
		function()
			require("telescope.builtin").find_files({ hidden = true })
		end,
		desc = "Search hidden files",
	},
	{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Search files" },
	{ "<leader>ss", "<cmd>Telescope builtin<cr>", desc = "Search select Telescope" },
	{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Search current word" },
	{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search by grep" },
	{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Search diagnostics" },
	{ "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Search resume" },
	{ "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Search Recent Files" },
	{ "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Search buffers" },
	{ "<leader>se", "<cmd>Telescope file_browser<cr>", desc = "Open browser" },
	{
		"<leader><leader>",
		function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				-- winblend = 10,
				previewer = false,
			}))
		end,
		desc = "Fuzzily search in current buffer",
	},
	{ "<leader>st", "<cmd>Telescope tmux sessions<cr>", desc = "Search tmux sessions" },
	{ "<leader>si", "<cmd>Telescope tmux windows<cr>", desc = "Search tmux windows" },
	{
		"<leader>s.",
		function()
			require("telescope.builtin").live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end,
		desc = "Search in Open Files",
	},
	{
		"<leader>sn",
		function()
			require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Search neofiles",
	},
}

return M
