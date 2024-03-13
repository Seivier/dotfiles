local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("vgonzalez.core")

require("lazy").setup({
	-- MINOR --
	-- notify
	{
		"rcarriga/nvim-notify",
		config = function ()
			require('notify').setup({
				background_colour = "#000000"
			})
			vim.notify = require("notify")
		end
	},

	-- transparency
	"xiyaowong/transparent.nvim",

	-- auto tabstop
	"tpope/vim-sleuth",

	-- fugitive
	{
		"tpope/vim-fugitive",
		event = "BufRead",
	},

	-- tmux
	{ "christoomey/vim-tmux-navigator", lazy = false },

	-- surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},

	-- comments
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},

	-- icon picker
	{
		"ziontee113/icon-picker.nvim",
		cmd = "IconPickerYank",
		dependencies = {
			"stevearc/dressing.nvim",
		},
		opts = {
			disable_legacy_commands = true,
		},
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- -- auto pairs
	{
	  "windwp/nvim-autopairs",
	  event = "InsertEnter",
	  opts = {}, -- this is equalent to setup({}) function
	},

	-- TODO icons
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	-- asyncrun
	{
		"skywind3000/asyncrun.vim",
		cmd = "AsyncRun",
	},

	-- blamer
	{
		"apzelos/blamer.nvim",
		lazy = false,
		config = function()
			vim.g.blamer_enabled = true
			vim.g.blamer_delay = 100
		end,
	},

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- harpoon
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = false,
	},

	-- lazygit
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
		},
	},

	-- typst
	{
		"kaarmu/typst.vim",
		ft = "typst",
	},

	-- THEMES --
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"morhetz/gruvbox",
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		opts = {
			styles = {
				-- transparency = true,
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {},
	},

	{ import = "vgonzalez.plugins" },
}, {
	change_detection = {
		enabled = true,
		notify = true,
	},
	install = {
		colorscheme = { "rose-pine" },
	},
})

vim.cmd([[ colorscheme rose-pine]])
