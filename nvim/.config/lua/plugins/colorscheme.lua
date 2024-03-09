return {
    "navarasu/onedark.nvim",
    -- Make sure to load colorscheme during startup
    lazy = false,
    -- Load this before other plugins
    priority = 1000,
    config = function ()
        require("onedark").setup({
            style = "dark"
        })
        require("onedark").load()
    end
}
