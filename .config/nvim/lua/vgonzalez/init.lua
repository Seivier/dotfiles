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
		init = function()
			vim.g.blamer_enabled = true
			vim.g.blamer_show_in_insert_modes = false
		end,
	},

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},

	-- harpoon
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon"):setup()

		end,
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
		lazy = false,
		config = function()
			vim.g.typst_conceal = 3
			vim.g.typst_embedded_languages = { "cpp", "c", "make", "python", "scala" }
		end,
	},

	-- harpoon for lualine
	{
		"letieu/harpoon-lualine",
		dependencies = {
			{
				"ThePrimeagen/harpoon",
				branch = "harpoon2",
			},
		},
	},

	-- autosave
	{
		"Pocco81/auto-save.nvim",
		lazy = false,
	},

	-- autosessions
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup()
		end,
	},

	-- Zen mode
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			wezterm = {
				enabled = true,
				font = "+4"
			}
		}
	},

	-- vimux
	{
		"preservim/vimux",
	},

	-- THEMES --
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1000, -- Ensure it loads first
	},
	{
		"sainnhe/everforest",
		priority = 1000,
	},
	{
		"projekt0n/github-nvim-theme",
		priority = 1000,
	},
	{
		"sainnhe/gruvbox-material",
		priority = 1000,
	},
	{
		"sainnhe/sonokai",
		priority = 1000,
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
	},
	{ import = "vgonzalez.plugins" },
}, {
	change_detection = {
		enabled = true,
		notify = false,
	},
	install = {
		colorscheme = { "rose-pine" },
	},
})

vim.cmd([[colorscheme tokyonight-night]])
