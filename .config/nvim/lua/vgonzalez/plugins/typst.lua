return {
	"kaarmu/typst.vim",
	ft = "typst",
	lazy = false,
	config = function()
		vim.g.typst_conceal = 2
		vim.g.typst_embedded_languages = { "cpp", "c", "make", "python", "scala" }
	end,
}
