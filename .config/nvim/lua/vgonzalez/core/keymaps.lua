local keymap = vim.keymap

keymap.set("i", "jk", "<esc>")

keymap.set({ "n", "i" }, "<C-s>", "<cmd>wa<cr>", { noremap = true })
keymap.set({ "n", "i" }, "<C-q>", "<cmd>qall<cr>", { noremap = true })

-- null buffer
keymap.set("n", "<leader>c", '"_c')
keymap.set("n", "<leader>d", '"_d')

-- split windows
keymap.set("n", "<leader>ws", "<cmd>split<cr>")
keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>")
keymap.set("n", "<leader>wx", "<cmd>close<cr>")
keymap.set("n", "<leader>wq", "<cmd>only<cr>")
keymap.set("n", "<leader>we", "<C-w>=")
keymap.set("n", "<leader>wz", "<cmd>resize | vertical resize<cr>")

-- buffers
keymap.set("n", "<Tab>", "<cmd>b#<cr>")   -- bnext
keymap.set("n", "<S-Tab>", "<cmd>bd<cr>") -- bprevious
keymap.set("n", "<leader>bx", "<cmd>!bd<cr>")
keymap.set("n", "<leader>bg", function()
  local num = vim.fn.input("Buffer number: ")
  vim.cmd("b" .. num)
end)
keymap.set("n", "<leader>bn", "<cmd>bn<cr>")
keymap.set("n", "<leader>bp", "<cmd>bp<cr>")

-- tabs
keymap.set("n", "<leader>tn", "<cmd>tabnext<cr>")     -- tab
keymap.set("n", "<leader>tp", "<cmd>tabprevious<cr>") -- s-tab?
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
keymap.set("n", "<leader>e", "<cmd>Neotree toggle position=right<cr>")

-- LSP
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap.set("n", "<leader>le", vim.diagnostic.open_float)
keymap.set("n", "[d", vim.diagnostic.goto_prev)
keymap.set("n", "]d", vim.diagnostic.goto_next)
keymap.set("n", "<leader>lq", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    -- local opts = {}
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
    keymap.set("n", "gi", "<cmd>Lspsaga finder imp<cr>", opts)
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
    keymap.set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts)
    keymap.set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts)
    keymap.set("n", "<leader>lwl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap.set("n", "<leader>lD", "<cmd>Lspsaga peek_type_definition<cr>", opts)
    keymap.set("n", "<leader>ld", "<cmd>Lspsaga peek_definition<cr>", opts)
    keymap.set("n", "<leader>lrn", "<cmd>Lspsaga rename<cr>", opts)
    keymap.set({ "n", "v" }, "<leader>lca", "<cmd>Lspsaga code_action<cr>", opts)
    keymap.set("n", "gr", "<cmd>Lspsaga finder<cr>", opts)
    -- keymap.set({ 'n', 't' }, '<leader>tt', '<cmd>Lspsaga term_toggle<cr>', opts)
    keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", opts)
    keymap.set("n", "<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   callback = function(_)
    --     vim.lsp.buf.format({ async = true })
    --   end,
    -- })
    -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = false})]]
  end,
})

-- NavBuddy
keymap.set("n", "<leader>nb", "<cmd>Navbuddy<cr>")

-- Toggleterm
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  -- keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  -- keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- local maketargets = function ()
--  return vim.fn.systemlist([[make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}' | grep -v Makefile | sort -u]])
-- end

-- Exec
keymap.set("n", "<leader>dm", function()
  -- vim.ui.select(maketargets(), {}, function (target)
  --   vim.cmd("AsyncRun -mode=term make " .. target)
  -- end)
  vim.ui.input({ prompt = "Target" }, function(target)
    if not target then
      return
    end
    vim.cmd("AsyncRun -mode=term make " .. target)
    -- require('harpoon.term').sendCommand(1, "make " .. target)
    -- require('harpoon.term').gotoTerminal(1)
  end)
end)
keymap.set("n", "<leader>dd", function()
  vim.ui.input({ prompt = "Executable" }, function(target)
    if not target then
      return
    end
    if target == "" then
      -- relative path and no file extension
      target = vim.fn.expand("%:p:r") .. ".out"
    else
      target = vim.fn.expand("%:p:h") .. "/" .. target
    end
    vim.cmd("AsyncRun -mode=term '" .. target .. "'")
  end)
end)

-- Open
keymap.set("n", "<leader>of", "<cmd>! open '%:h' <cr>")
keymap.set("n", "<leader>op", "<cmd>! open '%:p:r.pdf' <cr>")

-- Git
keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>")
keymap.set("n", "<leader>gs", "<cmd>Git<cr>")
keymap.set("n", "<leader>gh", "<cmd>! gh browse <cr>")

-- Harpoon
keymap.set("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")
keymap.set("n", "<leader>hf", "<cmd>Telescope harpoon marks<cr>")
keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>")
keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>")
keymap.set("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>")
keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>")
keymap.set("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>")
keymap.set("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>")
keymap.set("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>")
keymap.set("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>")
keymap.set("n", "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>")
keymap.set("n", "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>")
keymap.set("n", "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>")
keymap.set("n", "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>")

-- Trouble
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>")
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle quickfix<cr>")
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>")

-- Icon picker
keymap.set("n", "<leader>ie", "<cmd>IconPickerYank emoji<cr>")
keymap.set("n", "<leader>in", "<cmd>IconPickerYank nerd_font<cr>")
