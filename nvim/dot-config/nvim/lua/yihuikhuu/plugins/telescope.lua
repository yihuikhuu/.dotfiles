return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
        "acksld/nvim-neoclip.lua",
        config = function()
            require("neoclip").setup()
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local actions = require('telescope.actions')

            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = { '.git/' },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                }
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)

            vim.keymap.set("n", "<leader>py", function() vim.cmd("Telescope neoclip") end)

            _ = require("telescope").load_extension("fzf")
            _ = require("telescope").load_extension("ui-select")
            _ = require("telescope").load_extension("neoclip")
        end
    },
}
