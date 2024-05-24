local M = {
"stevearc/oil.nvim",
dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.opts = {
default_file_explorer = true,
skip_confirm_for_simple_edits = false,
keymaps = {
["g?"] = "actions.show_help",
["<CR>"] = "actions.select",
["<C-v>"] = "actions.select_vsplit",
["<C-s>"] = "actions.select_split",
["<C-t>"] = "actions.select_tab",
["<C-p>"] = "actions.preview",
["<C-c>"] = "actions.close",
["<C-r>"] = "actions.refresh",
["-"] = "actions.parent",
["_"] = "actions.open_cwd",
["`"] = "actions.cd",
["~"] = "actions.tcd",
["gs"] = "actions.change_sort",
["gx"] = "actions.open_external",
["g."] = "actions.toggle_hidden",
["g\\"] = "actions.toggle_trash",
},
use_default_keymaps = false,
}

M.keys = { { "-", "<cmd>Oil<cr>", desc = "Open parent directory" } }

return M
