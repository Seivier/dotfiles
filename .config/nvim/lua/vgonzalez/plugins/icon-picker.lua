return {
	"ziontee113/icon-picker.nvim",
	cmd = "IconPickerYank",
	dependencies = {
		"stevearc/dressing.nvim",
	},
	opts = {
		disable_legacy_commands = true,
	},
	keys = {
		{ "<leader>ie", "<cmd>IconPickerYank emoji<cr>", desc = "Choose en emoji" },
		{ "<leader>in", "<cmd>IconPickerYank nerd_font<cr>", desc = "Choose a nerd icon" },
	},
}
