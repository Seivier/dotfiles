local keymap = vim.keymap.set

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap("i", "<C-a>", "<Esc>")

keymap("n", "<Enter>", "a<Enter><Esc>")
keymap("n", "<S-Enter>", "A<Enter><Esc>")

-- null register
keymap("n", "<leader>c", '"_c')
keymap("n", "<leader>d", '"_d')

-- split windows
keymap("n", "<leader>ws", "<cmd>split<cr>", { desc = "Split window horizontally" })
keymap("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
keymap("n", "<leader>wc", "<cmd>close<cr>", { desc = "Close this window" })
keymap("n", "<leader>wq", "<cmd>only<cr>", { desc = "Close other windows" })
keymap("n", "<leader>we", "<C-w>=", { desc = "Resize all windows" })
keymap("n", "<leader>wz", "<cmd>resize | vertical resize<cr>", { desc = "Zoom this window" })

-- buffers
keymap("n", "<Tab>", "<cmd>b#<cr>", { desc = "Alternate buffer" })
-- keymap("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next buffer" }) -- bnext
-- keymap("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous buffer" }) -- bprevious
-- keymap("n", "<leader>bx", "<cmd>!bd<cr>", { desc = "Close this buffer" })
-- keymap("n", "<leader>bg", function()
-- 	local num = vim.fn.input("Buffer number: ")
-- 	vim.cmd("b" .. num)
-- end, { desc = "Go to buffer" })

-- terminal
keymap("t", "<C-a>", "<C-\\><C-n>")
keymap("n", "<leader>tt", "<cmd>split +terminal<cr>", { desc = "Open Terminal"})

-- tabs
keymap("n", "<leader><Tab>", "<cmd>tabnext<cr>", { desc = "Alternate tab" }) -- tab
-- keymap("n", "<S-Tab>", "<cmd>tabprevious<cr>", { desc = "Previous tab" }) -- s-tab?
-- keymap("n", "<leader>po", "<cmd>tabnew<cr>", { desc = "New tab" })
-- keymap("n", "<leader>px", "<cmd>tabclose<cr>", { desc = "Close tab" })

-- LSP
-- keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
-- keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
-- keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
-- 	callback = function(event)
-- 		local map = function(keys, func, desc)
-- 			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
-- 		end
--
-- 		map("gd", require("telescope.builtin").lsp_definitions, "Goto definition")
-- 		map("gr", require("telescope.builtin").lsp_references, "Goto references")
-- 		map("gI", require("telescope.builtin").lsp_implementations, "Goto implementation")
-- 		map("<leader>lD", require("telescope.builtin").lsp_type_definitions, "Type definition")
-- 		map("<leader>ld", require("telescope.builtin").lsp_document_symbols, "Document symbols")
-- 		map("<leader>lw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")
-- 		map("<leader>lr", vim.lsp.buf.rename, "Rename")
-- 		map("<leader>lc", vim.lsp.buf.code_action, "Code action")
-- 		map("<leader>lf", function()
-- 			require("conform").format({ bufnr = event.buf })
-- 		end, "Format buffer")
-- 		map("K", vim.lsp.buf.hover, "Hover Documentation")
-- 		map("gD", vim.lsp.buf.declaration, "Goto declaration")
-- 		map("<leader>ln", "<cmd>Navbuddy<cr>", "Navigate to symbol")
-- 		map("<leader>lh", function ()
-- 			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- 		end, "Enable inlay hints")
--
-- 		local client = vim.lsp.get_client_by_id(event.data.client_id)
-- 		if client and client.server_capabilities.documentHighlightProvider then
-- 			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- 				buffer = event.buf,
-- 				callback = vim.lsp.buf.document_highlight,
-- 			})
--
-- 			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
-- 				buffer = event.buf,
-- 				callback = vim.lsp.buf.clear_references,
-- 			})
-- 		end
-- 	end,
-- })

-- Open
keymap("n", "<leader>of", "<cmd>! open '%:h' <cr>", { desc = "Open current file in Finder" })
keymap("n", "<leader>op", "<cmd>! open '%:p:r.pdf' <cr>", { desc = "Open current file as PDF" })

-- Git
-- keymap("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
-- keymap("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
keymap("n", "<leader>gh", "<cmd>! gh browse <cr>", { desc = "Open GitHub" })

-- Icon picker
-- keymap("n", "<leader>ie", "<cmd>IconPickerYank emoji<cr>", { desc = "Choose an emoji" })
-- keymap("n", "<leader>in", "<cmd>IconPickerYank nerd_font<cr>", { desc = "Choose an nerd icon" })

-- Reload config
-- keymap("n", "<leader>cr", "<cmd>source $MYVIMRC<cr>", { desc = "Reload config" })

-- Copilot
-- keymap("i", "<C-c>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

-- Oil
keymap("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory"  })
