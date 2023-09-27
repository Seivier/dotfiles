local opt = vim.opt
local g = vim.g

g.mapleader = " "

-- numericos
opt.number = true
opt.relativenumber = true

-- tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
-- opt.autoindent = true

-- undo

-- ruler
opt.ruler = true

-- wrap
opt.wrap = false

-- mouse
opt.mouse = "a"

-- encode
opt.encoding = "utf-8"

-- popup
opt.pumwidth = 15
opt.pumheight = 10

-- cursor
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
-- opt.colorcolumn = "100"
opt.scrolloff = 3

-- update
opt.updatetime = 50

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- show commands (??)
opt.showcmd = true

-- autoreload
opt.autoread = true

-- search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

-- buffers
opt.hidden = true

-- fold
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Netrw
-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1

-- Completion
opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

-- Spell checking
opt.spelllang = "en,es"
opt.spell = true

