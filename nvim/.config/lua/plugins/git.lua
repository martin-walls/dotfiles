return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", function()
                vim.cmd("Git")
            end, { desc = "[G]it [S]tatus" })

            vim.keymap.set("n", "<leader>gp", function()
                vim.cmd("Git push")
            end, { desc = "[G]it [P]ush" })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
}
