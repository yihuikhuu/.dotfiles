return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("notify").setup({
                background_colour = "#000000",
                stages = "no_animation"
            })

            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                cmdline = {
                    view = "cmdline",
                    format = {
                        cmdline = false,
                        search_down = false,
                        search_up = false,
                        filter = false,
                        lua = false,
                        help = false,
                    }
                },
                messages = {
                    view = "mini"
                }
            })
        end
    }
}
