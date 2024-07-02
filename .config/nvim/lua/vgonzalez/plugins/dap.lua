local M = {
	"jay-babu/mason-nvim-dap.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
		{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	},
}

M.config = function()
	require("mason-nvim-dap").setup({
		ensure_installed = { "codelldb", "python" },
		handlers = {},
	})
	local dap, dapui = require("dap"), require("dapui")

	dapui.setup()
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end
-- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
--   require('dap.ui.widgets').hover()
-- end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
--   require('dap.ui.widgets').preview()
-- end)
-- vim.keymap.set('n', '<Leader>df', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set('n', '<Leader>ds', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
-- end)
M.keys = {
	{
		"<F5>",
		function()
			require("dap").continue()
		end,
	},
	{
		"<F10>",
		function()
			require("dap").step_over()
		end,
	},
	{
		"<F11>",
		function()
			require("dap").step_into()
		end,
	},
	{
		"<F12>",
		function()
			require("dap").step_out()
		end,
	},
	{
		"<leader>db",
		function()
			require("dap").toggle_breakpoint()
		end,
	},
}

return {}
