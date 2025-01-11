return {
    {
        'echasnovski/mini.pairs',
        version = false,
        config = function()
            require('mini.pairs').setup({})
        end
    },
    {
        'echasnovski/mini.ai',
        version = false,
        config = function()
            require('mini.ai').setup({})
        end
    },
    {
        'echasnovski/mini.comment',
        version = false,
        config = function()
            require('mini.comment').setup({})
        end
    },
    {
        'echasnovski/mini.surround',
        version = false,
        -- config = function()
        --     require('mini.surround').setup({})
        -- end,
        keys = function(_, keys)
            local mappings = {
                { "gsa", desc = "Add Surrounding",                     mode = { "n", "v" } },
                { "gsd", desc = "Delete Surrounding" },
                { "gsf", desc = "Find Right Surrounding" },
                { "gsF", desc = "Find Left Surrounding" },
                { "gsh", desc = "Highlight Surrounding" },
                { "gsr", desc = "Replace Surrounding" },
                { "gsn", desc = "Update `MiniSurround.config.n_lines`" },
            }
            return vim.list_extend(mappings, keys)
        end,
        opts = {
            mappings = {
                add = "gsa",
                delete = "gsd",
                find = "gsf",
                find_left = "gsF",
                highlight = "gsh",
                replace = "gsr",
                update_n_lines = "gsn",
                suffix_last = 'l',
                suffix_next = 'n',
            },
        },
    },
    {
        'echasnovski/mini.move',
        version = false,
        config = function()
            require('mini.move').setup({})
        end
    },
    {
        'echasnovski/mini.splitjoin',
        version = false,
        config = function()
            require('mini.splitjoin').setup({})
        end
    },


}
