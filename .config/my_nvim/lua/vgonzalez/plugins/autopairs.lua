local p_setup, autopairs = pcall(require, "nvim-autopairs")
if not p_setup then
	return
end

autopairs.setup({
	check_ts = true,
})

local cmp_p_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_p_setup then
	return
end

local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
	return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
