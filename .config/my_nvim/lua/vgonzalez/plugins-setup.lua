local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	print("ERROR: packer.nvim not found! Run :PackerInstall to install packer.nvim")
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- visual
	use("morhetz/gruvbox")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("nvim-lualine/lualine.nvim")

	-- autocompletion
	-- use("github/copilot.vim")
	use({ "zbirenbaum/copilot.lua" })
	use({ "zbirenbaum/copilot-cmp" })
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "dev-v3",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			-- { "hrsh7th/cmp-copilot" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
	use({ "onsails/lspkind-nvim" })

	use({ "kaarmu/typst.vim", ft = { "typst" } })

	-- linter
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- tabs and panes
	use("christoomey/vim-tmux-navigator") -- Navigate between vim and tmux panes seamlessly
	use("szw/vim-maximizer") -- Maximize vim panes

	-- essentials
	use("tpope/vim-surround") -- Surround text with quotes, brackets, etc
	-- use("tpope/vim-commentary") -- Comment out lines or objects
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("tpope/vim-unimpaired") -- Add useful pairs of mappings
	use("vim-scripts/ReplaceWithRegister") -- Replace text with yanked text
	use("nathom/filetype.nvim")
	-- file search and navigation
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- highlight
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto pairs
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")

	-- extras
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})
	use({
		"SmiteshP/nvim-navbuddy",
		requires = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
			"numToStr/Comment.nvim", -- Optional
			"nvim-telescope/telescope.nvim", -- Optional
		},
	})
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	use("xiyaowong/transparent.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
