local map = require("mrw.utils").mapUnique

return {
    {
        "tpope/vim-fugitive",
        config = function()
            map("n", "<leader>gs", function()
                vim.cmd("Git")
            end, { desc = "[G]it [S]tatus" })
            map("n", "<leader>gp", function()
                vim.cmd("Git push")
            end, { desc = "[G]it [P]ush" })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
}
