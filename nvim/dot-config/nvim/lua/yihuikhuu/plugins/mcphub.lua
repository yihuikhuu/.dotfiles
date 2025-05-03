return {
    {
        "ravitemer/mcphub.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        build = "npm install -g mcp-hub@latest",
        config = function()
            require("mcphub").setup({
                extensions = {
                    codecompanion = {
                        show_result_in_chat = true,
                        make_vars = true,
                        make_slash_commands = true
                    }
                }
            })
        end,
    }
}
