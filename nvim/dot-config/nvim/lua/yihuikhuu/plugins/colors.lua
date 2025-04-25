return {
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         require("tokyonight").setup({
    --             style = "night",
    --             on_highlights = function(highlights, colors)
    --                 highlights.LineNrAbove = { fg = "#5c6570" }
    --                 highlights.LineNr = { fg = "#5c6570" }
    --                 highlights.LineNrBelow = { fg = "#5c6570" }
    --             end,
    --         })
    --         vim.cmd.colorscheme "tokyonight-night"
    --     end
    -- },
    -- {
    --     "loctvl842/monokai-pro.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         vim.cmd.colorscheme "monokai-pro"
    --     end
    -- }
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme("catppuccin-macchiato")
    --     end,
    -- },
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        priority = 1000,
        config = function()
            require('kanagawa').setup({
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none"
                            }
                        }
                    }
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        NormalFloat  = { bg = "none" },
                        FloatBorder  = { bg = "none" },
                        FloatTitle   = { bg = "none" },

                        -- Save an hlgroup with dark background and dimmed foreground
                        -- so that you can use it where your still want darker windows.
                        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                        NormalDark   = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                        -- Popular plugins that open floats will link to NormalFloat by default;
                        -- set their background accordingly if you wish to keep them dark and borderless
                        LazyNormal   = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        MasonNormal  = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        FzfLuaNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        FzfLuaBorder = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    }
                end,
            })
            vim.cmd.colorscheme("kanagawa")
        end
    }

}
