return {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
        },
        config = function()
            local lsp = require("lsp-zero")

            require("mason").setup({})
            require("mason-lspconfig").setup({
                -- Replace the language servers listed here
                -- with the ones you want to install
                ensure_installed = {},
                handlers = {
                    lsp.default_setup,
                },
            })

            lsp.preset("recommended")

            lsp.set_sign_icons({
                error = "E",
                warn = "W",
                hint = "H",
                info = "I"
            })

            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)

            lsp.setup()
        end
    },
}