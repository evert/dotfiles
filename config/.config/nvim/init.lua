-- Line numbers
vim.opt.number = true

-- Turn tabs into space characters
vim.opt.expandtab = true

-- Tabs are 2 spaces
vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2 -- Uncomment if you want to set softtabstop
vim.opt.shiftwidth = 2
vim.opt.smarttab = true

-- Default clipboard is OS clipboard
vim.opt.clipboard:append("unnamedplus")

-- True color support
vim.opt.termguicolors = true

-- Disable built-in directory browser so it doesn't conflict with neovim-tree
-- See: https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup#netrw-hijacking
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- LazyVim plugin manager
require("config.lazy")
