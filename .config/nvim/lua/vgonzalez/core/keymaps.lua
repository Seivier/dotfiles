local keymap = vim.keymap

keymap.set("i", "jk", "<esc>")

keymap.set("n", "<C-s>", "<cmd>w<cr>", { noremap = true })
keymap.set("n", "<C-S>", "<cmd>wa<cr>", { noremap = true })
keymap.set("n", "<C-q>", "<cmd>qall<cr>", { noremap = true })

-- split windows
keymap.set("n", "<leader>ws", "<cmd>split<cr>")
keymap.set("n", "<leader>ws", "<cmd>vsplit<cr>")
-- keymap.set("n", "<leader>we", "<cmd>")
keymap.set("n", "<leader>wx", "<cmd>close<cr>")

-- buffers
keymap.set("n", "<Tab>", "<cmd>bnext<cr>")
keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>")
keymap.set("n", "<C-x>", "<cmd>bdelete<cr>")

-- tabs
keymap.set("n", "<leader>tn", "<cmd>tabnext<cr>")
keymap.set("n", "<leader>tp", "<cmd>tabprevious<cr>")
keymap.set("n", "<leader>to", "<cmd>tabnew<cr>")
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser theme=dropdown<cr>")
keymap.set("n", "<leader>fts", "<cmd>Telescope tmux sessions theme=dropdown<cr>")
keymap.set("n", "<leader>ftw", "<cmd>Telescope tmux windows<cr>")

-- Neotree
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>")

-- LSP
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap.set('n', '<leader>le', vim.diagnostic.open_float)
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)
keymap.set('n', '<leader>lq', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    -- local opts = {}
    keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
    keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
    keymap.set('n', 'gi', '<cmd>Lspsaga finder imp<cr>', opts)
    keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help, opts)
    keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
    keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
    keymap.set('n', '<leader>lwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap.set('n', '<leader>lD', '<cmd>Lspsaga peek_type_definition<cr>', opts)
    keymap.set('n', '<leader>ld', '<cmd>Lspsaga peek_definition<cr>', opts)
    keymap.set('n', '<leader>lrn', '<cmd>Lspsaga rename<cr>', opts)
    keymap.set({ 'n', 'v' }, '<leader>lca', '<cmd>Lspsaga code_action<cr>', opts)
    keymap.set('n', 'gr', '<cmd>Lspsaga finder<cr>', opts)
    -- keymap.set({ 'n', 't' }, '<leader>tt', '<cmd>Lspsaga term_toggle<cr>', opts)
    keymap.set('n', '<leader>lo', '<cmd>Lspsaga outline<cr>', opts)
    keymap.set('n', '<leader>lf', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   callback = function(_)
    --     vim.lsp.buf.format({ async = true })
    --   end,
    -- })
    -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = false})]]
  end,
})
