return {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { 'saghen/blink.cmp' },
        },
        config = function()
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                    vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
                    vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
                    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)
                    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                end
            })

            local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()

            local default_setup = function(server)
                require('lspconfig')[server].setup({
                    capabilities = lsp_capabilities,
                })
            end

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {},
                handlers = {
                    default_setup,
                },
            })

            local mason_path = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
            local vue_ts_path = mason_path ..
                "/packages/" .. "vue-language-server" .. "/node_modules/@vue/language-server"
            require('lspconfig').ts_ls.setup({
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_ts_path,
                            languages = { "javascript", "typescript", "vue" },
                        },
                    },
                },
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "javascript.jsx",
                    "typescript",
                    "typescriptreact",
                    "typescript.tsx",
                    "vue",
                },
            })

            require('lspconfig').volar.setup({
                init_options = {},
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "javascript.jsx",
                    "typescript",
                    "typescriptreact",
                    "typescript.tsx",
                    "vue",
                },
            })
        end
    },
}
