local function config_colorizer()
  require 'colorizer'.setup()
end

return {
    'norcalli/nvim-colorizer.lua',
    config = config_colorizer,
    event = 'BufReadPre',  -- Optional: Load plugin on specific event
}
