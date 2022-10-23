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

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.showcmd = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

vim.opt.termguicolors = true
vim.opt.foldmethod = "syntax"

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

-- FZF
vim.g.fzf_action = {
  ["ctrl-t"] = "tab split",
  ["ctrl-s"] = "split",
  ["ctrl-v"] = "vsplit",
}

-- Fastfold
vim.g.fastfold_savehook = 1
vim.g.fastfold_fold_command_suffixes = {'x','X','a','A','o','O','c','C'}
vim.g.fastfold_fold_movement_commands = {']z', '[z', 'zj', 'zk'}

-- vim.g.markdown_folding = 1
-- vim.g.rst_fold_enabled = 1
-- vim.g.tex_fold_enabled = 1
-- vim.g.vimsyn_folding = 'af'
-- vim.g.xml_syntax_folding = 1
-- vim.g.javaScript_fold = 1
-- vim.g.sh_fold_enabled = 1
-- vim.g.zsh_fold_enabled = 1
-- vim.g.ruby_fold = 1
-- vim.g.perl_fold = 1
-- vim.g.perl_fold_blocks = 1
-- vim.g.r_syntax_folding = 1
-- vim.g.rust_fold = 1
-- vim.g.php_folding = 1
-- vim.g.fortran_fold = 1
-- vim.g.clojure_fold = 1
-- vim.g.baan_fold = 1

-- vim.cmd('autocmd FileType c, cpp setlocal foldmethod=syntax')

