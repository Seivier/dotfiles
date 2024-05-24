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
require("vgonzalez.keymaps")
require("lazy").setup({
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
	{
		"shaunsingh/nord.nvim",
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

vim.cmd([[colorscheme rose-pine]])
