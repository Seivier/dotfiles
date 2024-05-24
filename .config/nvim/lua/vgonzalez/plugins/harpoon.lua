return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("harpoon"):setup()
	end,
	keys = {
		{
			"<leader>hh",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			mode = { "n" },
			desc = "Harpoon menu",
		},
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			mode = { "n" },
			desc = "Add mark to harpoon",
		},
		{
			"<leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
			mode = { "n" },
			desc = "",
		},
		{
			"<leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
			mode = { "n" },
			desc = "",
		},
		{
			"<leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
			mode = { "n" },
			desc = "",
		},
		{
			"<leader>4",
			function()
				require("harpoon"):list():select(4)
			end,
			mode = { "n" },
			desc = "",
		},
		{
			"<leader>5",
			function()
				require("harpoon"):list():select(5)
			end,
			mode = { "n" },
			desc = "",
		},
		{
			"<leader>6",
			function()
				require("harpoon"):list():select(6)
			end,
			mode = { "n" },
			desc = "",
		},
		{
			"<leader>7",
			function()
				require("harpoon"):list():select(7)
			end,
			mode = { "n" },
			desc = "",
		},
		{
			"<leader>8",
			function()
				require("harpoon"):list():select(8)
			end,
			mode = { "n" },
			desc = "",
		},
		{
			"<leader>9",
			function()
				require("harpoon"):list():select(9)
			end,
			mode = { "n" },
			desc = "",
		},
	},
	-- keymap("n", "<leader>sm", "<cmd>Telescope harpoon marks<cr>", { desc = "Search harpoon marks" })
	-- keymap("n", "<leader>hn", function()
	-- 	require("harpoon"):list():next()
	-- end, { desc = "Next mark" })
	-- keymap("n", "<leader>hp", function()
	-- 	require("harpoon"):list():prev()
	-- end, { desc = "Previous mark" })
}
