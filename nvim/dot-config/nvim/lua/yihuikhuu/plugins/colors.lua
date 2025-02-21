return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "night",
                on_highlights = function(highlights, colors)
                    highlights.LineNrAbove = { fg = "#5c6570" }
                    highlights.LineNr = { fg = "#5c6570" }
                    highlights.LineNrBelow = { fg = "#5c6570" }
                end,
            })
            vim.cmd.colorscheme "tokyonight-night"
        end
    }
}
