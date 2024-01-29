return {
    {
        'stevearc/conform.nvim',
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "biome" },
                typescript = { "biome" },
                elixir = { "mix" },
                eelixir = { "mix" },
                heex = { "mix" },
                go = { "gofmt", "goimports" },
                python = { "black" },
                zig = { "zigfmt" }
            },
            format_on_save = { timeout_ms = 500, lsp_fallback = true },
        },
    }
}
