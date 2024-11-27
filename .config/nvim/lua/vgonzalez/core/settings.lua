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
opt.smartindent = true
opt.autoindent = true

-- tabs (viewport)
opt.showtabline = 0

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

-- Netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1


-- cursor
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- scroll
opt.scrolloff = 5
opt.smoothscroll = true

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

-- spell checking
opt.spell = true
opt.spelllang="en,es"
