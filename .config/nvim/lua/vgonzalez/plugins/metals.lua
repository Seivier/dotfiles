local M = {
	"scalameta/nvim-metals",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	ft = { "scala", "sbt", "java" },
}

M.opts = function()
	local metals_config = require("metals").bare_config()
	metals_config.on_attach = function(client, bufnr)
		-- your on_attach function
			require("nvim-navic").attach(client, bufnr)
			require("nvim-navbuddy").attach(client, bufnr)
	end

	return metals_config
	-- local metals_config = require("metals").bare_config()
	-- metals_config.init_options.statusBarProvider = "off"
	-- local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- metals_config.capabilities =
	-- 	vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
	-- metals_config.on_attach = function(client, bufnr)
	-- 	if client.server_capabilities.documentSymbolProvider then
	-- 		require("nvim-navic").attach(client, bufnr)
	-- 		require("nvim-navbuddy").attach(client, bufnr)
	-- 	end
	-- end
	-- return metals_config
end

M.config = function(self, metals_config)
	local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		pattern = self.ft,
		callback = function()
			require("metals").initialize_or_attach(metals_config)
		end,
		group = nvim_metals_group,
	})
	-- local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
	-- vim.api.nvim_create_autocmd("FileType", {
	-- 	pattern = self.ft,
	-- 	callback = function()
	-- 		require("metals").initialize_or_attach(metals_config)
	-- 	end,
	-- 	group = nvim_metals_group,
	-- })
end

return M
