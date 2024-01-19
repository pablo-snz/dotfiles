local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local bufferline = require("bufferline")
-- Función para cambiar al buffer anterior o ejecutar BufferLineGoToBuffer 1
-- local function switch_buffer_or_terminal()
--     if vim.bo.buftype == 'terminal' then
--         -- require("nvterm.terminal").toggle "horizontal"
--         vim.cmd('wincmd k')
--     end
-- end


bufferline.setup({
    options = {
        style_preset = {
            bufferline.style_preset.no_italic,
            bufferline.style_preset.minimal,
        },
        close_command = function(bufnum)
            require("packer.bufferline.close_buffer").bufdelete(bufnum, true)
        end,
        diagnostics = "nvim_lsp",
        after = "catppuccin",
        config = function()
            require("bufferline").setup {
                highlights = require("catppuccin.groups.integrations.bufferline").get()
            }
        end,
        left_mouse_command = "wincmd k | buffer %d",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon
        end,
        indicator = { style = "none" },
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true
            }
        }
    },
})



vim.api.nvim_set_keymap('n', '<A-1>', '<Cmd>lua switch_buffer_or_terminal()<CR>', { noremap = true, silent = true })

-- Mapeo de <A-1> a la nueva función
map('n', '<A-1>', function()
    -- switch_buffer_or_terminal()
    require('bufferline').go_to(1)
end, { noremap = true, silent = true })
map('n', '<A-2>', function()
    -- switch_buffer_or_terminal()
    require('bufferline').go_to(2)
end, { noremap = true, silent = true })
map('n', '<A-3>', function()
    -- switch_buffer_or_terminal()
    require('bufferline').go_to(3)
end, { noremap = true, silent = true })
map('n', '<A-4>', function()
    -- switch_buffer_or_terminal()
    require('bufferline').go_to(4)
end, { noremap = true, silent = true })
map('n', '<A-5>', function()
    -- switch_buffer_or_terminal()
    require('bufferline').go_to(5)
end, { noremap = true, silent = true })
map('n', '<A-6>', function()
    -- switch_buffer_or_terminal()
    require('bufferline').go_to(6)
end, { noremap = true, silent = true })
map('n', '<A-7>', function()
    -- switch_buffer_or_terminal()
    require('bufferline').go_to(7)
end, { noremap = true, silent = true })
map('n', '<A-8>', function()
    -- switch_buffer_or_terminal()
    require('bufferline').go_to(8)
end, { noremap = true, silent = true })
map('n', '<A-9>', function()
    -- switch_buffer_or_terminal()
    require('bufferline').go_to(9)
end, { noremap = true, silent = true })


map('n', '<C-w>',
    function()
        require("packer.bufferline.close_buffer").bufdelete(0, true)
    end,
    opts)

map('n', '<C-a>', '<Cmd>BufferLineCloseOther<CR>', opts)
