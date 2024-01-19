local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { desc = desc })
end

nmap('<leader>ml',
  function()
    require("lint").try_lint()
  end,
  "[M]ason [L]lint")
