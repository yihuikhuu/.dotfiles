return {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "nvim-treesitter/nvim-treesitter-context" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "nvim-treesitter.configs".setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "lua" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<M-w>",
                        node_incremental = "<M-w>",
                        node_decremental = "<M-W>",
                        scope_incremental = "<M-e>",
                    }
                },
                textobjects = {
                    move = {
                        enable = true,
                        set_jumps = true,

                        goto_next_start = {
                            ["]p"] = "@parameter.inner",
                            ["]f"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]F"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[p"] = "@parameter.inner",
                            ["[f"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },

                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",

                            ["ac"] = "@conditional.outer",
                            ["ic"] = "@conditional.inner",

                            ["ap"] = "@parameter.outer",
                            ["ip"] = "@parameter.inner",

                            ["av"] = "@variable.outer",
                            ["iv"] = "@variable.inner",
                        },
                    }
                }
            }

            vim.keymap.set("n", "<leader>tc", function() vim.cmd("TSContextToggle") end)
        end
    },
}
