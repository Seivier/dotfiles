-- vim.opt.nocompatible = true
vim.g.mapleader = ","
require('plugins')
require('settings')
require('keymaps')
-- require('coc')
vim.cmd.source('~/.config/nvim/vim/coc.vim')
