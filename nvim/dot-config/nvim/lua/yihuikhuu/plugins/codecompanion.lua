return {
    {
        'echasnovski/mini.diff',
        version = false,
        config = function()
            require('mini.diff').setup()
        end
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "codecompanion" },
        opts = {
            render_modes = true,
            sign = {
                enabled = false,
            },
        },
    },
    {
        "olimorris/codecompanion.nvim",
        init = function()
            require("yihuikhuu.util.codecompanion-notification").init()
        end,
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local default_model = { formatted_name = "Gemini Flash 2.5", model = "google/gemini-2.5-flash-preview" }
            local models = {
                { formatted_name = "Gemini 2.5 Flash",            model = "google/gemini-2.5-flash-preview" },
                { formatted_name = "Gemini 2.5 Flash (Thinking)", model = "google/gemini-2.5-flash-preview:thinking" },
                { formatted_name = "Gemini 2.5 Pro",              model = "google/gemini-2.5-pro-preview-03-25" },
                { formatted_name = "OpenAI GPT 4.1",              model = "openai/gpt-4.1" },
                { formatted_name = "Claude 3.7 Sonnet",           model = "anthropic/claude-3.7-sonnet" },
            }
            local current_model = default_model

            -- Function to open the model selector
            local function select_model()
                vim.ui.select(models, {
                    prompt = "Select Model:",
                    format_item = function(model)
                        return model.formatted_name
                    end
                }, function(choice)
                    if choice then
                        current_model = choice
                        vim.notify("Selected model: " .. current_model.formatted_name)
                    end
                end)
            end

            vim.keymap.set("n", "<leader>lm", select_model, { desc = "Select AI Model" })
            vim.keymap.set({ "n" }, "<leader>li", "<cmd>CodeCompanion<cr>", { desc = "CodeCompanion Inline" })
            vim.keymap.set({ "v" }, "<leader>li", "<cmd>'<,'>CodeCompanion<cr>", { desc = "CodeCompanion Inline" })
            vim.keymap.set({ "n", "v" }, "<leader>la", "<cmd>CodeCompanionActions<cr>",
                { desc = "CodeCompanion Actions" })
            vim.keymap.set({ "n", "v" }, "<leader>lc", "<cmd>CodeCompanionChat<cr>", { desc = "CodeCompanion Chat" })

            require("codecompanion").setup({
                display = {
                    diff = {
                        enabled = true,
                        provider = "mini_diff"
                    },
                },
                strategies = {
                    chat = {
                        adapter = "openrouter",
                    },
                    inline = {
                        adapter = "openrouter",
                    },
                    cmd = {
                        adapter = "openrouter"
                    }
                },
                adapters = {
                    opts = {
                        show_defaults = false
                    },
                    openrouter = function()
                        return require("codecompanion.adapters").extend("openai_compatible", {
                            formatted_name = current_model.formatted_name .. " (OpenRouter)",
                            env = {
                                url = "https://openrouter.ai/api",
                                api_key = "cmd:op read op://dev/OpenRouter/credential",
                                chat_url = "/v1/chat/completions",
                            },
                            schema = {
                                model = {
                                    default = current_model.model
                                },
                            },
                        })
                    end,
                }
            })
        end
    },
}
