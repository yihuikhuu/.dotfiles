return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        keys = {
            { "<leader>pf", "<cmd>FzfLua files<cr>" },
            { "<leader>pg", "<cmd>FzfLua live_grep<cr>" },
            { "<C-p>",      "<cmd>FzfLua git_files<cr>" },
        }
    }
}
