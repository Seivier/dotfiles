-- vim.opt.nocompatible = true
-- vim.g.mapleader = ","
-- require('plugins')
-- require('setup')
-- require('settings')
-- require('keymaps')
-- require('treesitter')
-- require('coc')
-- vim.cmd.source('~/.config/nvim/vim/coc.vim')
--
require("vgonzalez.plugins-setup")

require("vgonzalez.core.options")
require("vgonzalez.core.keymaps")
require("vgonzalez.core.colorscheme")

require("vgonzalez.plugins.nvim-tree")
require("vgonzalez.plugins.lualine")
require("vgonzalez.plugins.telescope")
require("vgonzalez.plugins.lsp-zero")
require("vgonzalez.plugins.copilot")
require("vgonzalez.plugins.nvim-cmp")
require("vgonzalez.plugins.autopairs")
require("vgonzalez.plugins.treesitter")
require("vgonzalez.plugins.gitsigns")
require("vgonzalez.plugins.nvim-navic")
require("vgonzalez.plugins.nvim-navbuddy")
require("vgonzalez.plugins.filetype")
