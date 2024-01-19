local dap = require('dap')

local function promptForExecutable()
  local command = vim.fn.input('Command to execute: ')
  if command == '' then
    -- If the user cancels the input, return nil
    return nil
  else
    return command
  end
end

local function promptForArguments()
  local arguments = vim.fn.input('Arguments: ')
  if arguments == '' then
    -- If the user cancels the input, return nil
    return nil
  else
    -- Split arguments into a table
    return vim.split(arguments, ' ', true)
  end
end

dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Debug UnitTest",
    module = "pytest",
    args = { "-m", "unit" },
  },
  {
    type = "python",
    request = "launch",
    name = "Debug Integration",
    module = "pytest",
    args = { "-m", "integration" },
  },
  {
    type = "python",
    request = "launch",
    name = "Debug Aceptance",
    module = "pytest",
    args = { "-m", "acceptance" },
  },
  {
    type = "python",
    request = "launch",
    name = "Debug execution",
    module = promptForExecutable,
    args = promptForArguments,
  }
}



require('dapui').setup()

vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { desc = "DAP: [D]AP [T]oggle" })
vim.api.nvim_set_keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>",
  { desc = "DAP: [D]AP [B]reakpoint" })
vim.api.nvim_set_keymap("n", "<leader>dc", ":lua require('dap').continue()<CR>", { desc = "DAP: [D]AP [C]ontinue" })
