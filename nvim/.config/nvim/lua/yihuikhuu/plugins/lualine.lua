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
    },
    {
        'b0o/incline.nvim',
        opts = {},
        event = 'VeryLazy',
        config = function()
            local palette = require("rose-pine.palette")
            require("incline").setup {
                hide = {
                    only_win = true
                },
                highlight = {
                    groups = {
                        InclineNormal = {
                            guibg = palette.highlight_high,
                            guifg = palette.text
                        },
                        InclineNormalNC = {
                            guibg = palette.highlight_low,
                            guifg = palette.text
                        }
                    }
                },

                window = { margin = { vertical = 0, horizontal = 1 } },

                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

                    local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                    local modified = ""
                    if vim.bo[props.buf].modified then
                        modified = "M "
                    end

                    return {
                        { modified, guifg = palette.rose },
                        { icon,     guifg = color },
                        { " " },
                        { filename }
                    }
                end,
            }
        end
    },
}
