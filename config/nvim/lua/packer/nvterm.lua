require("toggleterm").setup({})


vim.keymap.set('n', '<C-t>', function()
  require("toggleterm").toggle()
end )

vim.keymap.set('t', '<C-t>', function()
  require("toggleterm").toggle()
end )


vim.api.nvim_set_keymap('t', 'jk', [[<C-\><C-n>]], {noremap = true})
