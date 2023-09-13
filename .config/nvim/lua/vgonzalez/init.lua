local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vgonzalez.core")

require("lazy").setup({
  { import = "vgonzalez.plugins" },
  { import = "vgonzalez.plugins.coding" },
  { import = "vgonzalez.plugins.ui" },
  { import = "vgonzalez.plugins.explorer" },
  { import = "vgonzalez.plugins.tools" },
}, {
  change_detection = {
    notify = false,
  },
  install = {
    colorscheme = {"rose-pine"},
  },
})
