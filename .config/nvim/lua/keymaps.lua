local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Move lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Search
map({'n', 'v'}, '/', '/\v')
map('n', '<Leader><Space>', ':let @/ = ""<CR>')

-- Help
map('i', '<F1> <Esc>', ':set invfullscreen<CR>a')
map({'n', 'v'}, '<F1>', ':set invfullscreen<CR>')

-- Buffer
map('n', '<Leader>b', ':ls<CR>:b<Space>')

-- PLUGINS
-- Vim-plug
map('n', '<leader>ps', ':PackerSync<CR>')
map('n', '<leader>pi', ':PackerInstall<CR>')
map('n', '<leader>pu', ':PackerUpdate<CR>')
map('n', '<leader>pc', ':PackerClean<CR>')

-- NerdTree
map('n', '<C-t>', ':NERDTreeToggle<CR>')

-- Tagbar
map('n', '<F8>', ':TagbarToggle<CR>')

-- Copilot
map('i', '<C-j>', 'copilot#Accept("\\<CR>")', {script = true, expr = true})


-- Comfortable motion
map('n', '<ScrollWheelUp>', ':call comfortable_motion#flick(-20)<CR>')
map('n', '<ScrollWheelDown>', ':call comfortable_motion#flick(20)<CR>')


-- AsyncTask
map('n', '<F5>', ':AsyncTask file-run<CR>')
map('n', '<F9>', ':AsyncTask file-build<CR>')
map('n', '<F10>', ':AsyncStop<CR>')

-- FZF
map('n', '<C-p>', ':FZF<CR>')
-- map('n', '<Leader>rp', ':! python %<CR>')
-- map('n', '<Leader>rcp', ':! python3 %<CR>')

-- FastFold
map('n', 'zuz', '<Plug>(FastFoldUpdate)')

