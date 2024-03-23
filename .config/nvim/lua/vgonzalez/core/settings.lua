local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

-- numericos
opt.number = true
opt.relativenumber = true

-- tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true

-- undo
opt.undofile = true

-- ruler
opt.ruler = true

-- wrap
opt.wrap = false
opt.breakindent = true

-- mouse
opt.mouse = "a"

-- encode
opt.encoding = "utf-8"

-- popup
-- opt.pumwidth = 15
-- opt.pumheight = 10

-- cursor
opt.cursorline = true

-- appearance
opt.termguicolors = true
-- opt.background = "dark"
opt.signcolumn = "yes"
-- opt.colorcolumn = "100"
opt.scrolloff = 10

-- update
opt.updatetime = 250
opt.timeoutlen = 300
opt.timeout = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard = "unnamedplus"

-- windows
opt.splitright = true
opt.splitbelow = true
opt.equalalways = true

-- show commands (??)
opt.showcmd = true
opt.showmode = false

-- autoreload
opt.autoread = true

-- search
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

-- buffers
-- opt.hidden = true

-- fold
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = false

-- Netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Completion
-- opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

-- Spell checking
opt.spelllang = "en,es"
opt.spell = true

-- Fancy text for md and typst
opt.conceallevel = 3

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

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Activate wrap for Latex, Typst and Markdown",
	group = vim.api.nvim_create_augroup("enter-wrap-text", {clear = true}),
	callback = function (opts)
		if vim.bo[opts.buf].filetype == 'typst' then
			vim.opt.wrap = true
		end
	end
})

vim.api.nvim_create_autocmd("BufLeave", {
	desc = "Activate wrap for Latex, Typst and Markdown",
	group = vim.api.nvim_create_augroup("leave-wrap-text", {clear = true}),
	callback = function (opts)
		if vim.bo[opts.buf].filetype == 'typst' then
			vim.opt.wrap = false
		end
	end
})
