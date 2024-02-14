local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		theme = "auto",
		icons_enabled = true,
		-- round separators
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "packer" },
		sections = {},
	},
})


