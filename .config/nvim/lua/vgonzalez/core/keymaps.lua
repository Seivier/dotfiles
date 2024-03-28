local keymap = vim.keymap.set

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap("i", "<C-a>", "<Esc>")


-- null buffer
keymap("n", "<leader>c", '"_c')
keymap("n", "<leader>d", '"_d')

-- split windows
keymap("n", "<leader>ws", "<cmd>split<cr>", { desc = "Split window horizontally" })
keymap("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
keymap("n", "<leader>wc", "<cmd>close<cr>", { desc = "Close this window" })
keymap("n", "<leader>wq", "<cmd>only<cr>", { desc = "Close other windows" })
keymap("n", "<leader>we", "<C-w>=", { desc = "Resize all windows" })
keymap("n", "<leader>wz", "<cmd>resize | vertical resize<cr>", { desc = "Zoom this window" })
--
-- buffers
keymap("n", "<tab>", "<cmd>b#<cr>", {desc = "Alternate buffer"})
keymap("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next buffer" }) -- bnext
keymap("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous buffer" }) -- bprevious
keymap("n", "<leader>bx", "<cmd>!bd<cr>", { desc = "Close this buffer" })
keymap("n", "<leader>bg", function()
	local num = vim.fn.input("Buffer number: ")
	vim.cmd("b" .. num)
end, { desc = "Go to buffer" })

-- tabs
keymap("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next tab" }) -- tab
keymap("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous tab" }) -- s-tab?
keymap("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "New tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close tab" })

-- Telescope
keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Search help" })
keymap("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Search keymaps" })
keymap("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Search files" })
keymap("n", "<leader>si", function() require("telescope.builtin").find_files({ hidden = true }) end, { desc = "Search hidden files" })
keymap("n", "<leader>ss", "<cmd>Telescope builtin<cr>", { desc = "Search select Telescope" })
keymap("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Search current word" })
keymap("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Search by grep" })
keymap("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "Search diagnostics" })
keymap("n", "<leader>sr", "<cmd>Telescope resume<cr>", { desc = "Search resume" })
keymap("n", "<leader>s.", "<cmd>Telescope oldfiles<cr>", { desc = "Search Recent Files" })
keymap("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", { desc = "Find existing buffers" })
keymap("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Search buffers" })
keymap("n", "<leader>se", "<cmd>Telescope file_browser<cr>", { desc = "Open browser" })
keymap("n", "<leader>sts", "<cmd>Telescope tmux sessions<cr>", { desc = "Search tmux sessions" })
keymap("n", "<leader>stw", "<cmd>Telescope tmux windows<cr>", { desc = "Search tmux windows" })

keymap("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "Fuzzily search in current buffer" })

keymap("n", "<leader>s/", function()
	require("telescope.builtin").live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "Search in Open Files" })

keymap("n", "<leader>sn", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Search neofiles" })

-- Neotree
keymap("n", "<leader>f", "<cmd>Neotree toggle<cr>", { desc = "Open explorer" })

-- LSP
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- local opts = { buffer = ev.buf }
		-- -- local opts = {}
		-- keymap("n", "gD", vim.lsp.buf.declaration, opts)
		-- keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
		-- keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
		-- keymap("n", "gi", "<cmd>Lspsaga finder imp<cr>", opts)
		-- keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
		-- keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
		-- keymap("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
		-- keymap("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts)
		-- keymap("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts)
		-- keymap("n", "<leader>lwl", function()
		-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		-- keymap("n", "<leader>lD", "<cmd>Lspsaga peek_type_definition<cr>", opts)
		-- keymap("n", "<leader>ld", "<cmd>Lspsaga peek_definition<cr>", opts)
		-- keymap("n", "<leader>lrn", "<cmd>Lspsaga rename<cr>", opts)
		-- keymap({ "n", "v" }, "<leader>lca", "<cmd>Lspsaga code_action<cr>", opts)
		-- keymap("n", "gr", "<cmd>Lspsaga finder<cr>", opts)
		-- -- keymap({ 'n', 't' }, '<leader>tt', '<cmd>Lspsaga term_toggle<cr>', opts)
		-- keymap("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", opts)
		-- keymap("n", "<leader>lf", function()
		-- 	vim.lsp.buf.format({ async = true })
		-- end, opts)
		--
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

-- Exec
keymap("n", "<leader>xm", function()
	vim.ui.input({ prompt = "Target" }, function(target)
		if not target then
			return
		end
		vim.cmd("AsyncRun -mode=term make " .. target)
	end)
end, { desc = "Execute make rule" })

keymap("n", "<leader>xd", function()
	vim.ui.input({ prompt = "Executable" }, function(target)
		if not target then
			return
		end
		if target == "" then
			-- relative path and no file extension
			target = vim.fn.expand("%:p:r") .. ".out"
		else
			target = vim.fn.expand("%:p:h") .. "/" .. target
		end
		vim.cmd("AsyncRun -mode=term '" .. target .. "'")
	end)
end, { desc = "Execute this file" })

-- Open
keymap("n", "<leader>of", "<cmd>! xdg-open '%:h' <cr>", { desc = "Open current file in Finder" })
keymap("n", "<leader>op", "<cmd>! xdg-open '%:p:r.pdf' <cr>", { desc = "Open current file as PDF" })

-- Git
keymap("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
keymap("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
keymap("n", "<leader>gh", "<cmd>! gh browse <cr>", { desc = "Open GitHub" })

-- Harpoon
keymap("n", "<leader>hh",function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Harpoon menu" })
keymap("n", "<leader>sm", "<cmd>Telescope harpoon marks<cr>", { desc = "Search harpoon marks" })
keymap("n", "<leader>ha",function() require("harpoon"):list():append() end, { desc = "Add mark to harpoon" })
keymap("n", "<leader>hn",function() require("harpoon"):list():next() end, { desc = "Next mark" })
keymap("n", "<leader>hp",function() require("harpoon"):list():prev() end, { desc = "Previous mark" })
keymap("n", "<leader>1", function() require("harpoon"):list():select(1) end)
keymap("n", "<leader>2", function() require("harpoon"):list():select(2) end)
keymap("n", "<leader>3", function() require("harpoon"):list():select(3) end)
keymap("n", "<leader>4", function() require("harpoon"):list():select(4) end)
keymap("n", "<leader>5", function() require("harpoon"):list():select(5) end)
keymap("n", "<leader>6", function() require("harpoon"):list():select(6) end)
keymap("n", "<leader>7", function() require("harpoon"):list():select(7) end)
keymap("n", "<leader>8", function() require("harpoon"):list():select(8) end)
keymap("n", "<leader>9", function() require("harpoon"):list():select(9) end)

-- Icon picker
keymap("n", "<leader>ie", "<cmd>IconPickerYank emoji<cr>", { desc = "Choose an emoji" })
keymap("n", "<leader>in", "<cmd>IconPickerYank nerd_font<cr>", { desc = "Choose an nerd icon" })

-- Reload config
keymap("n", "<leader>r", "<cmd>source $MYVIMRC<cr>", {desc = "Reload config"})


