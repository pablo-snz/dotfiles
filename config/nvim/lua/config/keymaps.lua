-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- mode navigation
map("i", "jk", "<esc>", { noremap = true })
map("i", "JK", "<esc>", { noremap = true })
map("t", "jk", "<c-\\><c-n>", { noremap = true })
map("t", "JK", "<c-\\><c-n>", { noremap = true })
map("t", "<esc>", "<c-\\><c-n>", { noremap = true })
map("n", "ñ", ":", { noremap = true })
map("n", "Ñ", ":", { noremap = true })
map("n", "q", "<cmd>:q<CR>", { noremap = true })
map("n", "Q", "<cmd>:q<CR>", { noremap = true })

map("n", "<C-q>", "<cmd>:qa<CR>", { noremap = true, silent = true })
map("n", "<C-Q>", "<cmd>:qa<CR>", { noremap = true, silent = true })

-- close current tab lazyvim
map({ "n", "i" }, "<C-w>", "<cmd>:bp|sp|bn|bd<CR>", { noremap = true, silent = true })
map({ "n", "i" }, "<C-W>", "<cmd>:bp|sp|bn|bd<CR>", { noremap = true, silent = true })

--  toggle to terminal passing mode
map({ "n", "i", "t" }, "<C-t>", "<cmd>: lua require('toggleterm').toggle(vim.v.count, 20, 'horizontal')<CR>", { noremap = true, silent = true })

-- indent block of code
map('v', '<Tab>', '>gv', { noremap = true, silent = true })
map('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

