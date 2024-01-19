vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- [[ Basic Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('n', 'ñ', ':', { noremap = true })

-- [[ Window Keymaps ]]
vim.keymap.set('n', '<A-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<A-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<A-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<A-l>', '<C-w>l', { noremap = true })

-- [[ Buffer Keymaps ]]
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true })
vim.keymap.set('i', '<C-s>', '<C-c>:w<CR>', { noremap = true })
vim.keymap.set('v', '<C-s>', '<C-c>:w<CR>', { noremap = true })
vim.keymap.set('n', '<C-q>', "<cmd>:qa<CR>", { noremap = true, silent = true })

-- [[ folds Keymaps ]]

_G.toggle_fold_state = 1

function ToggleFold(arg)
  if arg and tonumber(arg) then
    vim.cmd('setlocal foldlevel=' .. arg)
    _G.toggle_fold_state = 0
  elseif _G.toggle_fold_state == 0 then
    vim.cmd('normal! zR')
    _G.toggle_fold_state = 1
  else
    vim.cmd('setlocal foldlevel=1')
    _G.toggle_fold_state = 0
  end
end
vim.keymap.set('n', '+', 'za', { noremap = true })
vim.api.nvim_set_keymap('n', '0-', ':lua ToggleFold(0)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '1-', ':lua ToggleFold(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '2-', ':lua ToggleFold(2)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '3-', ':lua ToggleFold(3)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '4-', ':lua ToggleFold(4)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '-', ':lua ToggleFold()<CR>', { noremap = true, silent = true })

-- [[ numbers Keymaps ]]
vim.keymap.set('n', '<leader>n', "<cmd> set rnu! <CR>", { noremap = true, silent = true })


-- [[ Adds tabs to section in visual mode selecion with Tab and S-Tab ]]
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })
