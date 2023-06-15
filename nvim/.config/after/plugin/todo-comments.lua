require("todo-comments").setup()

-- Telescope mapping
vim.keymap.set("n", "<leader>pt", vim.cmd.TodoTelescope)
