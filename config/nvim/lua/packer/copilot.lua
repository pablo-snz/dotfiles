require('copilot').setup({
 suggestion = {
    enabled = true,
    auto_trigger = true,
    suggestion = {
      auto_trigger = true,
    },
    filetypes = {
      yaml = true,
      markdown = true,
      ["."] = true,
    },
    debounce = 50,
    keymap = {
      accept = "<S-Tab>",
      accept_word = false,
      accept_line = false,
      next = "<C-n>",
      prev = "<C-p>",
      dismiss = "<C-c>",
    },
  },
})

