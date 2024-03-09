return {
    "navarasu/onedark.nvim",
    -- Make sure to load colorscheme during startup
    lazy = false,
    -- Load this before other plugins
    priority = 1000,
    config = function()
        require("onedark").setup({
            -- Don't need to change this for light/dark theme, it happens automatically
            -- when vim.o.background is changed
            style = "dark",
        })
        require("onedark").load()
    end,
}
