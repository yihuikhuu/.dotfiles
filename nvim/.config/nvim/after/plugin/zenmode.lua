vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle({
        window = {
            width = 90,
        }
    })
end)
