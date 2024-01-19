require("catppuccin").setup({
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    transparent_background = true, -- disables setting the background color.
    integrations = {
        cmp = true, -- false disables cmp integration
        barbar = true, -- false disables barbar integration
        coc_nvim = true, -- false disables coc_nvim integration
    }
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")

