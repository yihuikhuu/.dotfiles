local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set("n", "<leader>py", function() vim.cmd("Telescope neoclip") end)

_ = require("telescope").load_extension("fzf")
_ = require("telescope").load_extension("ui-select")
_ = require("telescope").load_extension("neoclip")
