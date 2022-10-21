vim.opt.modelines = 0
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartcase = true

vim.opt.ruler = true

vim.opt.visualbell = true

vim.opt.encoding = "utf-8"

vim.opt.wrap = true

vim.opt.cursorline = true

vim.opt.mouse = "a"

vim.opt.hidden = true

vim.opt.ttyfast = true

-- vim.opt.laststatus=2

-- vim.opt.showmode
vim.opt.showcmd = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

vim.opt.termguicolors = true

vim.opt.background = "dark"
vim.cmd("colorscheme gruvbox")

-- PLUGINS
-- Copilot
-- vim.g.copilot_no_tab_map = true
vim.cmd("let g:copilot_no_tab_map = v:true")

-- Comfortable motion
vim.g.comfortable_motion_no_default_key_mappings = 1

-- Asyncrun
vim.g.asyncrun_open = 6
