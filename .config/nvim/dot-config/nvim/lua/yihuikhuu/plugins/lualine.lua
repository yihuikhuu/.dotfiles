return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    globalstatus = true,
                },
                sections = {
                    lualine_c = { { 'filename', path = 1 } },
                    lualine_x = {
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has,
                            color = { fg = "#ff9e64" },
                        },
                        'encoding',
                        'filetype'
                    },
                },
            }

            vim.opt.showmode = false
        end
    }
}
