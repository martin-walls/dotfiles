local map = require("mrw.utils").mapUnique

return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("todo-comments").setup()

        map("n", "<leader>pt", vim.cmd.TodoTelescope, { desc = "[P]ick [T]odos" })
    end,
}
