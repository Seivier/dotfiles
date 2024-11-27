local M = {
	"stevearc/overseer.nvim",
}

M.opts = {
	strategy = "jobstart",
	templates = {
		"builtin",
		"cmake",
		"typst",
		"docker",
	},
	bindings = {
		["?"] = "ShowHelp",
		["g?"] = "ShowHelp",
		["<CR>"] = "RunAction",
		["<C-e>"] = "Edit",
		["o"] = "Open",
		["<C-v>"] = "OpenVsplit",
		["<C-s>"] = "OpenSplit",
		["<C-f>"] = "OpenFloat",
		["<C-q>"] = "OpenQuickFix",
		["p"] = "TogglePreview",
		["<C-l>"] = "IncreaseDetail",
		["<C-h>"] = "DecreaseDetail",
		["L"] = "IncreaseAllDetail",
		["H"] = "DecreaseAllDetail",
		["["] = "DecreaseWidth",
		["]"] = "IncreaseWidth",
		["{"] = "PrevTask",
		["}"] = "NextTask",
		["<C-k>"] = "ScrollOutputUp",
		["<C-j>"] = "ScrollOutputDown",
		["q"] = "Close",
	},
}

M.keys = {
	{
		"<leader>xt",
		"<cmd>OverseerRun<cr>",
		mode = { "n" },
		desc = "Execute task",
	},
	{
		"<leader>xa",
		"<cmd>OverseerQuickAction<cr>",
		mode = { "n" },
		desc = "Executa action on task",
	},
	{
		"<leader>xx",
		"<cmd>OverseerOpen<cr>",
		mode = { "n" },
		desc = "Task list",
	}
}

return {}
