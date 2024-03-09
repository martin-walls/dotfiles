return {
    "echasnovski/mini.nvim",
    config = function ()
        -- autopairs
        require("mini.pairs").setup()

       -- better around/inside textobjects
        require("mini.ai").setup()
    end,
}
