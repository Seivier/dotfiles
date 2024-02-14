local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"html",
		"css",
		"markdown",
		"lua",
		"vim",
		"gitignore",
		"c",
		"cpp",
		"python",
		"make",
	},
	auto_install = true,
})
