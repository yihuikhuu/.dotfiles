return {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            { 'saghen/blink.cmp' },
        },
        config = function()
            local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()

            local default_setup = function(server)
                require('lspconfig')[server].setup({
                    capabilities = lsp_capabilities,
                })
            end

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- Typescript
                    'vtsls',
                    'biome',
                },
                handlers = {
                    default_setup,
                },
            })
        end,
        keys = {
            { "<leader>vd",  function() vim.diagnostic.open_float() end,    desc = "Open diagnostics" },
            { "[d",          function() vim.diagnostic.goto_next() end,     desc = "Next diagnostic" },
            { "]d",          function() vim.diagnostic.goto_prev() end,     desc = "Prev diagnostic" },
            { "gd",          function() vim.lsp.buf.definition() end,       desc = "Go to definition" },
            { "gD",          function() vim.lsp.buf.declaration() end,      desc = "Go to declaration" },
            { "gh",          function() vim.lsp.buf.hover() end,            desc = "Hover" },
            { "gi",          function() vim.lsp.buf.implementation() end,   desc = "Go to implementation" },
            { 'go',          function() vim.lsp.buf.type_definition() end,  desc = "Go to type definition" },
            { "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, desc = "Workspace symbols" },
            { "<leader>vca", function() vim.lsp.buf.code_action() end,      desc = "Code actions" },
            { "<leader>vrr", function() vim.lsp.buf.references() end,       desc = "Show references" },
            { "<leader>vrn", function() vim.lsp.buf.rename() end,           desc = "Rename" },
        }
    },
}
