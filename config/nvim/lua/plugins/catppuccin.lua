return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = true,
        integrations = {
          treesitter = true,
          dap = true,
          leap = true,
          neotree = true,
          bufferline = true,
        },
      })
    end,
  },
}
