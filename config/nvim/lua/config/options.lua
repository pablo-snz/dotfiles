-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- set wrap by default
vim.opt.wrap = true

-- set line numbers absolute
vim.opt.number = true
vim.opt.relativenumber = false

-- disable auto-formatting
vim.g.autoformat = false

-- disable cmp auto preselect
vim.o.completeopt = "menu,noinsert,noselect"

-- disable buffer visualization
vim.opt.showtabline = 0
