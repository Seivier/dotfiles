local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartcase = true

opt.ruler = true

-- wrap
opt.wrap = false

opt.mouse = "a"

-- popup menu
opt.pumwidth = 15
opt.pumheight = 10
-- opt.pumblend = 10

-- search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.g.transparent_enabled = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.showcmd = true

vim.opt.completeopt = { "menu", "menuone", "noselect" }

opt.iskeyword:append("-")
