return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup {
                open_mapping = [[<C-\>]],
                insert_mappings = false,
                direction = 'float',
                float_opts = {
                    border = 'curved'
                }
            }
        end
    },
}
