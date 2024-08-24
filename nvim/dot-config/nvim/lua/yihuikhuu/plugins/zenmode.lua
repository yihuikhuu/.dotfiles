return {
    {
        "folke/zen-mode.nvim",
        config = function()
            vim.keymap.set("n", "<leader>zz", function()
                local incline = require("incline")
                require("zen-mode").toggle({
                    window = {
                        width = 90,
                    },
                    plugins = {
                        twilight = { enabled = false },
                    },
                    on_open = function()
                        incline.disable()
                    end,
                    on_close = function()
                        incline.enable()
                    end,
                })
            end)
        end,
    },
    {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {
                context = -1
            }

            vim.keymap.set("n", "<leader>tw", function() vim.cmd("Twilight") end)
        end,
    },
}
