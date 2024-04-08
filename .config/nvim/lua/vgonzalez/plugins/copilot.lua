local M = {
	"github/copilot.vim",
	cmd = "Copilot",
	event = "InsertEnter",
}

M.init = function()
	vim.g.copilot_no_tab_map = true
end

return {}
