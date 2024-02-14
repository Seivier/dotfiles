local status, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")

if not status then
	print("Colorscheme not found!")
	return
end

-- vim.g.gruvbox_contrast_dark = "hard"
require("catppuccin").setup({
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = true,
		mini = true,
	},
})
