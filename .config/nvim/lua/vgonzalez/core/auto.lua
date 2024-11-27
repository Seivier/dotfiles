-- Make
vim.api.nvim_create_autocmd("FileType", {
	desc = "Set compiler",
	group = vim.api.nvim_create_augroup("my-compiler-set", { clear = true }),
	pattern = "python",
	callback = function()
		vim.opt_local.makeprg = "python"
	end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Activate wrap for Latex, Typst and Markdown",
	group = vim.api.nvim_create_augroup("enter-wrap-text", { clear = true }),
	pattern = { "typst", "markdown", "text", "norg", "quarto" },
	callback = function(opts)
		vim.opt_local.wrap = true
	end,
})

-- vim.api.nvim_create_autocmd("BufLeave", {
-- 	desc = "Activate wrap for Latex, Typst and Markdown",
-- 	group = vim.api.nvim_create_augroup("leave-wrap-text", {clear = true}),
-- 	pattern = {"typst", "markdown", "text", "norg"},
-- 	callback = function (opts)
-- 		vim.opt_local.wrap = false
-- 	end
-- })

-- OpenCL
vim.api.nvim_create_autocmd("BufAdd", {
	desc = "Treat OpenCL as C lang",
	group = vim.api.nvim_create_augroup("opencl-c", { clear = true }),
	pattern = "*.cl",
	callback = function(opts)
		vim.bo[opts.buf].filetype = "c"
	end,
})

-- OpenGL
vim.api.nvim_create_autocmd("BufAdd", {
	desc = "Set OpenGL filetype",
	group = vim.api.nvim_create_augroup("opengl", { clear = true }),
	pattern = { "*.frag", "*.vert", "*.glsl" },
	callback = function(opts)
		vim.bo[opts.buf].filetype = "glsl"
	end,
})

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("gd", require("telescope.builtin").lsp_definitions, "Goto definition")
		map("gr", require("telescope.builtin").lsp_references, "Goto references")
		map("gI", require("telescope.builtin").lsp_implementations, "Goto implementation")
		map("<leader>lD", require("telescope.builtin").lsp_type_definitions, "Type definition")
		map("<leader>ld", require("telescope.builtin").lsp_document_symbols, "Document symbols")
		map("<leader>lw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")
		map("<leader>lr", vim.lsp.buf.rename, "Rename")
		map("<leader>lc", vim.lsp.buf.code_action, "Code action")
		map("<leader>lf", function()
			require("conform").format({ bufnr = event.buf })
		end, "Format buffer")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gD", vim.lsp.buf.declaration, "Goto declaration")
		map("<leader>ln", "<cmd>Navbuddy<cr>", "Navigate to symbol")
		map("<leader>lh", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, "Enable inlay hints")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})
